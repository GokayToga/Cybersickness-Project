��+
�)�)
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
h
Any	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
BatchMatMulV2
x"T
y"T
output"T"
Ttype:
2	"
adj_xbool( "
adj_ybool( "
grad_xbool( "
grad_ybool( 
�
BatchToSpaceND

input"T
block_shape"Tblock_shape
crops"Tcrops
output"T"	
Ttype" 
Tblock_shapetype0:
2	"
Tcropstype0:
2	
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

�

CudnnRNNV3

input"T
input_h"T
input_c"T
params"T
sequence_lengths
output"T
output_h"T
output_c"T
reserve_space"T
host_reserved"
Ttype:
2"=
rnn_modestringlstm:!
rnn_relurnn_tanhlstmgru"O

input_modestringlinear_input:)
'linear_input
skip_inputauto_select"H
	directionstringunidirectional:!
unidirectionalbidirectional"
dropoutfloat%    "
seedint "
seed2int "
num_projint "
is_trainingbool("

time_majorbool(�
$
DisableCopyOnRead
resource�
R
Einsum
inputs"T*N
output"T"
equationstring"
Nint(0"	
Ttype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
�
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	"
grad_abool( "
grad_bbool( 
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( ""
Ttype:
2	"
Tidxtype0:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
?
Mul
x"T
y"T
z"T"
Ttype:
2	�
0
Neg
x"T
y"T"
Ttype:
2
	

NoOp
U
NotEqual
x"T
y"T
z
"	
Ttype"$
incompatible_shape_errorbool(�
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
_
Pad

input"T
paddings"	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_type��out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
�
SpaceToBatchND

input"T
block_shape"Tblock_shape
paddings"	Tpaddings
output"T"	
Ttype" 
Tblock_shapetype0:
2	"
	Tpaddingstype0:
2	
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	�
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
2
StopGradient

input"T
output"T"	
Ttype
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
L

StringJoin
inputs*N

output"

Nint("
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "

debug_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �
9
VarIsInitializedOp
resource
is_initialized
�"serve*2.18.02v2.18.0-rc2-4-g6550e4bd8028��*
�
bn/moving_varianceVarHandleOp*
_output_shapes
: *#

debug_namebn/moving_variance/*
dtype0*
shape:@*#
shared_namebn/moving_variance
u
&bn/moving_variance/Read/ReadVariableOpReadVariableOpbn/moving_variance*
_output_shapes
:@*
dtype0
�
bn/moving_meanVarHandleOp*
_output_shapes
: *

debug_namebn/moving_mean/*
dtype0*
shape:@*
shared_namebn/moving_mean
m
"bn/moving_mean/Read/ReadVariableOpReadVariableOpbn/moving_mean*
_output_shapes
:@*
dtype0
�

dense/biasVarHandleOp*
_output_shapes
: *

debug_namedense/bias/*
dtype0*
shape:*
shared_name
dense/bias
e
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes
:*
dtype0
�
mha/key/biasVarHandleOp*
_output_shapes
: *

debug_namemha/key/bias/*
dtype0*
shape
: *
shared_namemha/key/bias
m
 mha/key/bias/Read/ReadVariableOpReadVariableOpmha/key/bias*
_output_shapes

: *
dtype0
�
gru_2/gru_cell/recurrent_kernelVarHandleOp*
_output_shapes
: *0

debug_name" gru_2/gru_cell/recurrent_kernel/*
dtype0*
shape
:0*0
shared_name!gru_2/gru_cell/recurrent_kernel
�
3gru_2/gru_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOpgru_2/gru_cell/recurrent_kernel*
_output_shapes

:0*
dtype0
�
gru1/gru_cell/recurrent_kernelVarHandleOp*
_output_shapes
: */

debug_name!gru1/gru_cell/recurrent_kernel/*
dtype0*
shape:	@�*/
shared_name gru1/gru_cell/recurrent_kernel
�
2gru1/gru_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOpgru1/gru_cell/recurrent_kernel*
_output_shapes
:	@�*
dtype0
�
@tcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias
�
Ttcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias*
_output_shapes
:@*
dtype0
�
Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel
�
Vtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel*"
_output_shapes
:@@*
dtype0
�
Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel
�
Vtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel*"
_output_shapes
:@@*
dtype0
�
conv1d/biasVarHandleOp*
_output_shapes
: *

debug_nameconv1d/bias/*
dtype0*
shape:@*
shared_nameconv1d/bias
g
conv1d/bias/Read/ReadVariableOpReadVariableOpconv1d/bias*
_output_shapes
:@*
dtype0
�
mha/query/kernelVarHandleOp*
_output_shapes
: *!

debug_namemha/query/kernel/*
dtype0*
shape: *!
shared_namemha/query/kernel
y
$mha/query/kernel/Read/ReadVariableOpReadVariableOpmha/query/kernel*"
_output_shapes
: *
dtype0
�
gru1/gru_cell/biasVarHandleOp*
_output_shapes
: *#

debug_namegru1/gru_cell/bias/*
dtype0*
shape:	�*#
shared_namegru1/gru_cell/bias
z
&gru1/gru_cell/bias/Read/ReadVariableOpReadVariableOpgru1/gru_cell/bias*
_output_shapes
:	�*
dtype0
�
dense_1/kernelVarHandleOp*
_output_shapes
: *

debug_namedense_1/kernel/*
dtype0*
shape
:*
shared_namedense_1/kernel
q
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
_output_shapes

:*
dtype0
�
dense/kernelVarHandleOp*
_output_shapes
: *

debug_namedense/kernel/*
dtype0*
shape
:*
shared_namedense/kernel
m
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes

:*
dtype0
�
mha/attention_output/biasVarHandleOp*
_output_shapes
: **

debug_namemha/attention_output/bias/*
dtype0*
shape:**
shared_namemha/attention_output/bias
�
-mha/attention_output/bias/Read/ReadVariableOpReadVariableOpmha/attention_output/bias*
_output_shapes
:*
dtype0
�
Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel
�
Vtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel*"
_output_shapes
:@@*
dtype0
�
Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel
�
Vtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel*"
_output_shapes
:@@*
dtype0
�
attn_norm/betaVarHandleOp*
_output_shapes
: *

debug_nameattn_norm/beta/*
dtype0*
shape:*
shared_nameattn_norm/beta
m
"attn_norm/beta/Read/ReadVariableOpReadVariableOpattn_norm/beta*
_output_shapes
:*
dtype0
�
gru1/gru_cell/kernelVarHandleOp*
_output_shapes
: *%

debug_namegru1/gru_cell/kernel/*
dtype0*
shape:	@�*%
shared_namegru1/gru_cell/kernel
~
(gru1/gru_cell/kernel/Read/ReadVariableOpReadVariableOpgru1/gru_cell/kernel*
_output_shapes
:	@�*
dtype0
�
Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel
�
Vtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel*"
_output_shapes
:@@*
dtype0
�
Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel
�
Vtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel*"
_output_shapes
:@@*
dtype0
�
Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel
�
Vtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel*"
_output_shapes
:@@*
dtype0
�
attn_norm/gammaVarHandleOp*
_output_shapes
: * 

debug_nameattn_norm/gamma/*
dtype0*
shape:* 
shared_nameattn_norm/gamma
o
#attn_norm/gamma/Read/ReadVariableOpReadVariableOpattn_norm/gamma*
_output_shapes
:*
dtype0
�
mha/key/kernelVarHandleOp*
_output_shapes
: *

debug_namemha/key/kernel/*
dtype0*
shape: *
shared_namemha/key/kernel
u
"mha/key/kernel/Read/ReadVariableOpReadVariableOpmha/key/kernel*"
_output_shapes
: *
dtype0
�
Btcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel
�
Vtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel*"
_output_shapes
:@@*
dtype0
�
Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel
�
Vtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel*"
_output_shapes
:@@*
dtype0
�
mha/value/biasVarHandleOp*
_output_shapes
: *

debug_namemha/value/bias/*
dtype0*
shape
: *
shared_namemha/value/bias
q
"mha/value/bias/Read/ReadVariableOpReadVariableOpmha/value/bias*
_output_shapes

: *
dtype0
�
mha/query/biasVarHandleOp*
_output_shapes
: *

debug_namemha/query/bias/*
dtype0*
shape
: *
shared_namemha/query/bias
q
"mha/query/bias/Read/ReadVariableOpReadVariableOpmha/query/bias*
_output_shapes

: *
dtype0
�
bn/gammaVarHandleOp*
_output_shapes
: *

debug_name	bn/gamma/*
dtype0*
shape:@*
shared_name
bn/gamma
a
bn/gamma/Read/ReadVariableOpReadVariableOpbn/gamma*
_output_shapes
:@*
dtype0
�
Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernelVarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel/*
dtype0*
shape:@@*S
shared_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel
�
Vtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel*"
_output_shapes
:@@*
dtype0
�
@tcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias
�
Ttcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias
�
Ttcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias
�
Ttcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias*
_output_shapes
:@*
dtype0
�
conv1d/kernelVarHandleOp*
_output_shapes
: *

debug_nameconv1d/kernel/*
dtype0*
shape:+@*
shared_nameconv1d/kernel
s
!conv1d/kernel/Read/ReadVariableOpReadVariableOpconv1d/kernel*"
_output_shapes
:+@*
dtype0
�
dense_1/biasVarHandleOp*
_output_shapes
: *

debug_namedense_1/bias/*
dtype0*
shape:*
shared_namedense_1/bias
i
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes
:*
dtype0
�
mha/attention_output/kernelVarHandleOp*
_output_shapes
: *,

debug_namemha/attention_output/kernel/*
dtype0*
shape: *,
shared_namemha/attention_output/kernel
�
/mha/attention_output/kernel/Read/ReadVariableOpReadVariableOpmha/attention_output/kernel*"
_output_shapes
: *
dtype0
�
bn/betaVarHandleOp*
_output_shapes
: *

debug_name
bn/beta/*
dtype0*
shape:@*
shared_name	bn/beta
_
bn/beta/Read/ReadVariableOpReadVariableOpbn/beta*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias
�
Ttcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias
�
Ttcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias
�
Ttcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias
�
Ttcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias*
_output_shapes
:@*
dtype0
�
mha/value/kernelVarHandleOp*
_output_shapes
: *!

debug_namemha/value/kernel/*
dtype0*
shape: *!
shared_namemha/value/kernel
y
$mha/value/kernel/Read/ReadVariableOpReadVariableOpmha/value/kernel*"
_output_shapes
: *
dtype0
�
gru_2/gru_cell/biasVarHandleOp*
_output_shapes
: *$

debug_namegru_2/gru_cell/bias/*
dtype0*
shape
:0*$
shared_namegru_2/gru_cell/bias
{
'gru_2/gru_cell/bias/Read/ReadVariableOpReadVariableOpgru_2/gru_cell/bias*
_output_shapes

:0*
dtype0
�
gru_2/gru_cell/kernelVarHandleOp*
_output_shapes
: *&

debug_namegru_2/gru_cell/kernel/*
dtype0*
shape
:@0*&
shared_namegru_2/gru_cell/kernel

)gru_2/gru_cell/kernel/Read/ReadVariableOpReadVariableOpgru_2/gru_cell/kernel*
_output_shapes

:@0*
dtype0
�
@tcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias
�
Ttcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias*
_output_shapes
:@*
dtype0
�
@tcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/biasVarHandleOp*
_output_shapes
: *Q

debug_nameCAtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias/*
dtype0*
shape:@*Q
shared_nameB@tcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias
�
Ttcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias/Read/ReadVariableOpReadVariableOp@tcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias*
_output_shapes
:@*
dtype0
�
dense_1/bias_1VarHandleOp*
_output_shapes
: *

debug_namedense_1/bias_1/*
dtype0*
shape:*
shared_namedense_1/bias_1
m
"dense_1/bias_1/Read/ReadVariableOpReadVariableOpdense_1/bias_1*
_output_shapes
:*
dtype0
�
#Variable/Initializer/ReadVariableOpReadVariableOpdense_1/bias_1*
_class
loc:@Variable*
_output_shapes
:*
dtype0
�
VariableVarHandleOp*
_class
loc:@Variable*
_output_shapes
: *

debug_name	Variable/*
dtype0*
shape:*
shared_name
Variable
a
)Variable/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable*
_output_shapes
: 
_
Variable/AssignAssignVariableOpVariable#Variable/Initializer/ReadVariableOp*
dtype0
a
Variable/Read/ReadVariableOpReadVariableOpVariable*
_output_shapes
:*
dtype0
�
dense_1/kernel_1VarHandleOp*
_output_shapes
: *!

debug_namedense_1/kernel_1/*
dtype0*
shape
:*!
shared_namedense_1/kernel_1
u
$dense_1/kernel_1/Read/ReadVariableOpReadVariableOpdense_1/kernel_1*
_output_shapes

:*
dtype0
�
%Variable_1/Initializer/ReadVariableOpReadVariableOpdense_1/kernel_1*
_class
loc:@Variable_1*
_output_shapes

:*
dtype0
�

Variable_1VarHandleOp*
_class
loc:@Variable_1*
_output_shapes
: *

debug_nameVariable_1/*
dtype0*
shape
:*
shared_name
Variable_1
e
+Variable_1/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_1*
_output_shapes
: 
e
Variable_1/AssignAssignVariableOp
Variable_1%Variable_1/Initializer/ReadVariableOp*
dtype0
i
Variable_1/Read/ReadVariableOpReadVariableOp
Variable_1*
_output_shapes

:*
dtype0
�
dense/bias_1VarHandleOp*
_output_shapes
: *

debug_namedense/bias_1/*
dtype0*
shape:*
shared_namedense/bias_1
i
 dense/bias_1/Read/ReadVariableOpReadVariableOpdense/bias_1*
_output_shapes
:*
dtype0
�
%Variable_2/Initializer/ReadVariableOpReadVariableOpdense/bias_1*
_class
loc:@Variable_2*
_output_shapes
:*
dtype0
�

Variable_2VarHandleOp*
_class
loc:@Variable_2*
_output_shapes
: *

debug_nameVariable_2/*
dtype0*
shape:*
shared_name
Variable_2
e
+Variable_2/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_2*
_output_shapes
: 
e
Variable_2/AssignAssignVariableOp
Variable_2%Variable_2/Initializer/ReadVariableOp*
dtype0
e
Variable_2/Read/ReadVariableOpReadVariableOp
Variable_2*
_output_shapes
:*
dtype0
�
dense/kernel_1VarHandleOp*
_output_shapes
: *

debug_namedense/kernel_1/*
dtype0*
shape
:*
shared_namedense/kernel_1
q
"dense/kernel_1/Read/ReadVariableOpReadVariableOpdense/kernel_1*
_output_shapes

:*
dtype0
�
%Variable_3/Initializer/ReadVariableOpReadVariableOpdense/kernel_1*
_class
loc:@Variable_3*
_output_shapes

:*
dtype0
�

Variable_3VarHandleOp*
_class
loc:@Variable_3*
_output_shapes
: *

debug_nameVariable_3/*
dtype0*
shape
:*
shared_name
Variable_3
e
+Variable_3/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_3*
_output_shapes
: 
e
Variable_3/AssignAssignVariableOp
Variable_3%Variable_3/Initializer/ReadVariableOp*
dtype0
i
Variable_3/Read/ReadVariableOpReadVariableOp
Variable_3*
_output_shapes

:*
dtype0
�
attn_norm/beta_1VarHandleOp*
_output_shapes
: *!

debug_nameattn_norm/beta_1/*
dtype0*
shape:*!
shared_nameattn_norm/beta_1
q
$attn_norm/beta_1/Read/ReadVariableOpReadVariableOpattn_norm/beta_1*
_output_shapes
:*
dtype0
�
%Variable_4/Initializer/ReadVariableOpReadVariableOpattn_norm/beta_1*
_class
loc:@Variable_4*
_output_shapes
:*
dtype0
�

Variable_4VarHandleOp*
_class
loc:@Variable_4*
_output_shapes
: *

debug_nameVariable_4/*
dtype0*
shape:*
shared_name
Variable_4
e
+Variable_4/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_4*
_output_shapes
: 
e
Variable_4/AssignAssignVariableOp
Variable_4%Variable_4/Initializer/ReadVariableOp*
dtype0
e
Variable_4/Read/ReadVariableOpReadVariableOp
Variable_4*
_output_shapes
:*
dtype0
�
attn_norm/gamma_1VarHandleOp*
_output_shapes
: *"

debug_nameattn_norm/gamma_1/*
dtype0*
shape:*"
shared_nameattn_norm/gamma_1
s
%attn_norm/gamma_1/Read/ReadVariableOpReadVariableOpattn_norm/gamma_1*
_output_shapes
:*
dtype0
�
%Variable_5/Initializer/ReadVariableOpReadVariableOpattn_norm/gamma_1*
_class
loc:@Variable_5*
_output_shapes
:*
dtype0
�

Variable_5VarHandleOp*
_class
loc:@Variable_5*
_output_shapes
: *

debug_nameVariable_5/*
dtype0*
shape:*
shared_name
Variable_5
e
+Variable_5/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_5*
_output_shapes
: 
e
Variable_5/AssignAssignVariableOp
Variable_5%Variable_5/Initializer/ReadVariableOp*
dtype0
e
Variable_5/Read/ReadVariableOpReadVariableOp
Variable_5*
_output_shapes
:*
dtype0
�
mha/attention_output/bias_1VarHandleOp*
_output_shapes
: *,

debug_namemha/attention_output/bias_1/*
dtype0*
shape:*,
shared_namemha/attention_output/bias_1
�
/mha/attention_output/bias_1/Read/ReadVariableOpReadVariableOpmha/attention_output/bias_1*
_output_shapes
:*
dtype0
�
%Variable_6/Initializer/ReadVariableOpReadVariableOpmha/attention_output/bias_1*
_class
loc:@Variable_6*
_output_shapes
:*
dtype0
�

Variable_6VarHandleOp*
_class
loc:@Variable_6*
_output_shapes
: *

debug_nameVariable_6/*
dtype0*
shape:*
shared_name
Variable_6
e
+Variable_6/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_6*
_output_shapes
: 
e
Variable_6/AssignAssignVariableOp
Variable_6%Variable_6/Initializer/ReadVariableOp*
dtype0
e
Variable_6/Read/ReadVariableOpReadVariableOp
Variable_6*
_output_shapes
:*
dtype0
�
mha/attention_output/kernel_1VarHandleOp*
_output_shapes
: *.

debug_name mha/attention_output/kernel_1/*
dtype0*
shape: *.
shared_namemha/attention_output/kernel_1
�
1mha/attention_output/kernel_1/Read/ReadVariableOpReadVariableOpmha/attention_output/kernel_1*"
_output_shapes
: *
dtype0
�
%Variable_7/Initializer/ReadVariableOpReadVariableOpmha/attention_output/kernel_1*
_class
loc:@Variable_7*"
_output_shapes
: *
dtype0
�

Variable_7VarHandleOp*
_class
loc:@Variable_7*
_output_shapes
: *

debug_nameVariable_7/*
dtype0*
shape: *
shared_name
Variable_7
e
+Variable_7/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_7*
_output_shapes
: 
e
Variable_7/AssignAssignVariableOp
Variable_7%Variable_7/Initializer/ReadVariableOp*
dtype0
m
Variable_7/Read/ReadVariableOpReadVariableOp
Variable_7*"
_output_shapes
: *
dtype0
�
mha/value/bias_1VarHandleOp*
_output_shapes
: *!

debug_namemha/value/bias_1/*
dtype0*
shape
: *!
shared_namemha/value/bias_1
u
$mha/value/bias_1/Read/ReadVariableOpReadVariableOpmha/value/bias_1*
_output_shapes

: *
dtype0
�
%Variable_8/Initializer/ReadVariableOpReadVariableOpmha/value/bias_1*
_class
loc:@Variable_8*
_output_shapes

: *
dtype0
�

Variable_8VarHandleOp*
_class
loc:@Variable_8*
_output_shapes
: *

debug_nameVariable_8/*
dtype0*
shape
: *
shared_name
Variable_8
e
+Variable_8/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_8*
_output_shapes
: 
e
Variable_8/AssignAssignVariableOp
Variable_8%Variable_8/Initializer/ReadVariableOp*
dtype0
i
Variable_8/Read/ReadVariableOpReadVariableOp
Variable_8*
_output_shapes

: *
dtype0
�
mha/value/kernel_1VarHandleOp*
_output_shapes
: *#

debug_namemha/value/kernel_1/*
dtype0*
shape: *#
shared_namemha/value/kernel_1
}
&mha/value/kernel_1/Read/ReadVariableOpReadVariableOpmha/value/kernel_1*"
_output_shapes
: *
dtype0
�
%Variable_9/Initializer/ReadVariableOpReadVariableOpmha/value/kernel_1*
_class
loc:@Variable_9*"
_output_shapes
: *
dtype0
�

Variable_9VarHandleOp*
_class
loc:@Variable_9*
_output_shapes
: *

debug_nameVariable_9/*
dtype0*
shape: *
shared_name
Variable_9
e
+Variable_9/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_9*
_output_shapes
: 
e
Variable_9/AssignAssignVariableOp
Variable_9%Variable_9/Initializer/ReadVariableOp*
dtype0
m
Variable_9/Read/ReadVariableOpReadVariableOp
Variable_9*"
_output_shapes
: *
dtype0
�
mha/key/bias_1VarHandleOp*
_output_shapes
: *

debug_namemha/key/bias_1/*
dtype0*
shape
: *
shared_namemha/key/bias_1
q
"mha/key/bias_1/Read/ReadVariableOpReadVariableOpmha/key/bias_1*
_output_shapes

: *
dtype0
�
&Variable_10/Initializer/ReadVariableOpReadVariableOpmha/key/bias_1*
_class
loc:@Variable_10*
_output_shapes

: *
dtype0
�
Variable_10VarHandleOp*
_class
loc:@Variable_10*
_output_shapes
: *

debug_nameVariable_10/*
dtype0*
shape
: *
shared_nameVariable_10
g
,Variable_10/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_10*
_output_shapes
: 
h
Variable_10/AssignAssignVariableOpVariable_10&Variable_10/Initializer/ReadVariableOp*
dtype0
k
Variable_10/Read/ReadVariableOpReadVariableOpVariable_10*
_output_shapes

: *
dtype0
�
mha/key/kernel_1VarHandleOp*
_output_shapes
: *!

debug_namemha/key/kernel_1/*
dtype0*
shape: *!
shared_namemha/key/kernel_1
y
$mha/key/kernel_1/Read/ReadVariableOpReadVariableOpmha/key/kernel_1*"
_output_shapes
: *
dtype0
�
&Variable_11/Initializer/ReadVariableOpReadVariableOpmha/key/kernel_1*
_class
loc:@Variable_11*"
_output_shapes
: *
dtype0
�
Variable_11VarHandleOp*
_class
loc:@Variable_11*
_output_shapes
: *

debug_nameVariable_11/*
dtype0*
shape: *
shared_nameVariable_11
g
,Variable_11/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_11*
_output_shapes
: 
h
Variable_11/AssignAssignVariableOpVariable_11&Variable_11/Initializer/ReadVariableOp*
dtype0
o
Variable_11/Read/ReadVariableOpReadVariableOpVariable_11*"
_output_shapes
: *
dtype0
�
mha/query/bias_1VarHandleOp*
_output_shapes
: *!

debug_namemha/query/bias_1/*
dtype0*
shape
: *!
shared_namemha/query/bias_1
u
$mha/query/bias_1/Read/ReadVariableOpReadVariableOpmha/query/bias_1*
_output_shapes

: *
dtype0
�
&Variable_12/Initializer/ReadVariableOpReadVariableOpmha/query/bias_1*
_class
loc:@Variable_12*
_output_shapes

: *
dtype0
�
Variable_12VarHandleOp*
_class
loc:@Variable_12*
_output_shapes
: *

debug_nameVariable_12/*
dtype0*
shape
: *
shared_nameVariable_12
g
,Variable_12/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_12*
_output_shapes
: 
h
Variable_12/AssignAssignVariableOpVariable_12&Variable_12/Initializer/ReadVariableOp*
dtype0
k
Variable_12/Read/ReadVariableOpReadVariableOpVariable_12*
_output_shapes

: *
dtype0
�
mha/query/kernel_1VarHandleOp*
_output_shapes
: *#

debug_namemha/query/kernel_1/*
dtype0*
shape: *#
shared_namemha/query/kernel_1
}
&mha/query/kernel_1/Read/ReadVariableOpReadVariableOpmha/query/kernel_1*"
_output_shapes
: *
dtype0
�
&Variable_13/Initializer/ReadVariableOpReadVariableOpmha/query/kernel_1*
_class
loc:@Variable_13*"
_output_shapes
: *
dtype0
�
Variable_13VarHandleOp*
_class
loc:@Variable_13*
_output_shapes
: *

debug_nameVariable_13/*
dtype0*
shape: *
shared_nameVariable_13
g
,Variable_13/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_13*
_output_shapes
: 
h
Variable_13/AssignAssignVariableOpVariable_13&Variable_13/Initializer/ReadVariableOp*
dtype0
o
Variable_13/Read/ReadVariableOpReadVariableOpVariable_13*"
_output_shapes
: *
dtype0
�
&seed_generator_14/seed_generator_stateVarHandleOp*
_output_shapes
: *7

debug_name)'seed_generator_14/seed_generator_state/*
dtype0	*
shape:*7
shared_name(&seed_generator_14/seed_generator_state
�
:seed_generator_14/seed_generator_state/Read/ReadVariableOpReadVariableOp&seed_generator_14/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_14/Initializer/ReadVariableOpReadVariableOp&seed_generator_14/seed_generator_state*
_class
loc:@Variable_14*
_output_shapes
:*
dtype0	
�
Variable_14VarHandleOp*
_class
loc:@Variable_14*
_output_shapes
: *

debug_nameVariable_14/*
dtype0	*
shape:*
shared_nameVariable_14
g
,Variable_14/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_14*
_output_shapes
: 
h
Variable_14/AssignAssignVariableOpVariable_14&Variable_14/Initializer/ReadVariableOp*
dtype0	
g
Variable_14/Read/ReadVariableOpReadVariableOpVariable_14*
_output_shapes
:*
dtype0	
�
&seed_generator_13/seed_generator_stateVarHandleOp*
_output_shapes
: *7

debug_name)'seed_generator_13/seed_generator_state/*
dtype0	*
shape:*7
shared_name(&seed_generator_13/seed_generator_state
�
:seed_generator_13/seed_generator_state/Read/ReadVariableOpReadVariableOp&seed_generator_13/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_15/Initializer/ReadVariableOpReadVariableOp&seed_generator_13/seed_generator_state*
_class
loc:@Variable_15*
_output_shapes
:*
dtype0	
�
Variable_15VarHandleOp*
_class
loc:@Variable_15*
_output_shapes
: *

debug_nameVariable_15/*
dtype0	*
shape:*
shared_nameVariable_15
g
,Variable_15/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_15*
_output_shapes
: 
h
Variable_15/AssignAssignVariableOpVariable_15&Variable_15/Initializer/ReadVariableOp*
dtype0	
g
Variable_15/Read/ReadVariableOpReadVariableOpVariable_15*
_output_shapes
:*
dtype0	
�
gru_2/gru_cell/bias_1VarHandleOp*
_output_shapes
: *&

debug_namegru_2/gru_cell/bias_1/*
dtype0*
shape
:0*&
shared_namegru_2/gru_cell/bias_1

)gru_2/gru_cell/bias_1/Read/ReadVariableOpReadVariableOpgru_2/gru_cell/bias_1*
_output_shapes

:0*
dtype0
�
&Variable_16/Initializer/ReadVariableOpReadVariableOpgru_2/gru_cell/bias_1*
_class
loc:@Variable_16*
_output_shapes

:0*
dtype0
�
Variable_16VarHandleOp*
_class
loc:@Variable_16*
_output_shapes
: *

debug_nameVariable_16/*
dtype0*
shape
:0*
shared_nameVariable_16
g
,Variable_16/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_16*
_output_shapes
: 
h
Variable_16/AssignAssignVariableOpVariable_16&Variable_16/Initializer/ReadVariableOp*
dtype0
k
Variable_16/Read/ReadVariableOpReadVariableOpVariable_16*
_output_shapes

:0*
dtype0
�
!gru_2/gru_cell/recurrent_kernel_1VarHandleOp*
_output_shapes
: *2

debug_name$"gru_2/gru_cell/recurrent_kernel_1/*
dtype0*
shape
:0*2
shared_name#!gru_2/gru_cell/recurrent_kernel_1
�
5gru_2/gru_cell/recurrent_kernel_1/Read/ReadVariableOpReadVariableOp!gru_2/gru_cell/recurrent_kernel_1*
_output_shapes

:0*
dtype0
�
&Variable_17/Initializer/ReadVariableOpReadVariableOp!gru_2/gru_cell/recurrent_kernel_1*
_class
loc:@Variable_17*
_output_shapes

:0*
dtype0
�
Variable_17VarHandleOp*
_class
loc:@Variable_17*
_output_shapes
: *

debug_nameVariable_17/*
dtype0*
shape
:0*
shared_nameVariable_17
g
,Variable_17/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_17*
_output_shapes
: 
h
Variable_17/AssignAssignVariableOpVariable_17&Variable_17/Initializer/ReadVariableOp*
dtype0
k
Variable_17/Read/ReadVariableOpReadVariableOpVariable_17*
_output_shapes

:0*
dtype0
�
gru_2/gru_cell/kernel_1VarHandleOp*
_output_shapes
: *(

debug_namegru_2/gru_cell/kernel_1/*
dtype0*
shape
:@0*(
shared_namegru_2/gru_cell/kernel_1
�
+gru_2/gru_cell/kernel_1/Read/ReadVariableOpReadVariableOpgru_2/gru_cell/kernel_1*
_output_shapes

:@0*
dtype0
�
&Variable_18/Initializer/ReadVariableOpReadVariableOpgru_2/gru_cell/kernel_1*
_class
loc:@Variable_18*
_output_shapes

:@0*
dtype0
�
Variable_18VarHandleOp*
_class
loc:@Variable_18*
_output_shapes
: *

debug_nameVariable_18/*
dtype0*
shape
:@0*
shared_nameVariable_18
g
,Variable_18/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_18*
_output_shapes
: 
h
Variable_18/AssignAssignVariableOpVariable_18&Variable_18/Initializer/ReadVariableOp*
dtype0
k
Variable_18/Read/ReadVariableOpReadVariableOpVariable_18*
_output_shapes

:@0*
dtype0
�
&seed_generator_12/seed_generator_stateVarHandleOp*
_output_shapes
: *7

debug_name)'seed_generator_12/seed_generator_state/*
dtype0	*
shape:*7
shared_name(&seed_generator_12/seed_generator_state
�
:seed_generator_12/seed_generator_state/Read/ReadVariableOpReadVariableOp&seed_generator_12/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_19/Initializer/ReadVariableOpReadVariableOp&seed_generator_12/seed_generator_state*
_class
loc:@Variable_19*
_output_shapes
:*
dtype0	
�
Variable_19VarHandleOp*
_class
loc:@Variable_19*
_output_shapes
: *

debug_nameVariable_19/*
dtype0	*
shape:*
shared_nameVariable_19
g
,Variable_19/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_19*
_output_shapes
: 
h
Variable_19/AssignAssignVariableOpVariable_19&Variable_19/Initializer/ReadVariableOp*
dtype0	
g
Variable_19/Read/ReadVariableOpReadVariableOpVariable_19*
_output_shapes
:*
dtype0	
�
&seed_generator_11/seed_generator_stateVarHandleOp*
_output_shapes
: *7

debug_name)'seed_generator_11/seed_generator_state/*
dtype0	*
shape:*7
shared_name(&seed_generator_11/seed_generator_state
�
:seed_generator_11/seed_generator_state/Read/ReadVariableOpReadVariableOp&seed_generator_11/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_20/Initializer/ReadVariableOpReadVariableOp&seed_generator_11/seed_generator_state*
_class
loc:@Variable_20*
_output_shapes
:*
dtype0	
�
Variable_20VarHandleOp*
_class
loc:@Variable_20*
_output_shapes
: *

debug_nameVariable_20/*
dtype0	*
shape:*
shared_nameVariable_20
g
,Variable_20/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_20*
_output_shapes
: 
h
Variable_20/AssignAssignVariableOpVariable_20&Variable_20/Initializer/ReadVariableOp*
dtype0	
g
Variable_20/Read/ReadVariableOpReadVariableOpVariable_20*
_output_shapes
:*
dtype0	
�
gru1/gru_cell/bias_1VarHandleOp*
_output_shapes
: *%

debug_namegru1/gru_cell/bias_1/*
dtype0*
shape:	�*%
shared_namegru1/gru_cell/bias_1
~
(gru1/gru_cell/bias_1/Read/ReadVariableOpReadVariableOpgru1/gru_cell/bias_1*
_output_shapes
:	�*
dtype0
�
&Variable_21/Initializer/ReadVariableOpReadVariableOpgru1/gru_cell/bias_1*
_class
loc:@Variable_21*
_output_shapes
:	�*
dtype0
�
Variable_21VarHandleOp*
_class
loc:@Variable_21*
_output_shapes
: *

debug_nameVariable_21/*
dtype0*
shape:	�*
shared_nameVariable_21
g
,Variable_21/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_21*
_output_shapes
: 
h
Variable_21/AssignAssignVariableOpVariable_21&Variable_21/Initializer/ReadVariableOp*
dtype0
l
Variable_21/Read/ReadVariableOpReadVariableOpVariable_21*
_output_shapes
:	�*
dtype0
�
 gru1/gru_cell/recurrent_kernel_1VarHandleOp*
_output_shapes
: *1

debug_name#!gru1/gru_cell/recurrent_kernel_1/*
dtype0*
shape:	@�*1
shared_name" gru1/gru_cell/recurrent_kernel_1
�
4gru1/gru_cell/recurrent_kernel_1/Read/ReadVariableOpReadVariableOp gru1/gru_cell/recurrent_kernel_1*
_output_shapes
:	@�*
dtype0
�
&Variable_22/Initializer/ReadVariableOpReadVariableOp gru1/gru_cell/recurrent_kernel_1*
_class
loc:@Variable_22*
_output_shapes
:	@�*
dtype0
�
Variable_22VarHandleOp*
_class
loc:@Variable_22*
_output_shapes
: *

debug_nameVariable_22/*
dtype0*
shape:	@�*
shared_nameVariable_22
g
,Variable_22/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_22*
_output_shapes
: 
h
Variable_22/AssignAssignVariableOpVariable_22&Variable_22/Initializer/ReadVariableOp*
dtype0
l
Variable_22/Read/ReadVariableOpReadVariableOpVariable_22*
_output_shapes
:	@�*
dtype0
�
gru1/gru_cell/kernel_1VarHandleOp*
_output_shapes
: *'

debug_namegru1/gru_cell/kernel_1/*
dtype0*
shape:	@�*'
shared_namegru1/gru_cell/kernel_1
�
*gru1/gru_cell/kernel_1/Read/ReadVariableOpReadVariableOpgru1/gru_cell/kernel_1*
_output_shapes
:	@�*
dtype0
�
&Variable_23/Initializer/ReadVariableOpReadVariableOpgru1/gru_cell/kernel_1*
_class
loc:@Variable_23*
_output_shapes
:	@�*
dtype0
�
Variable_23VarHandleOp*
_class
loc:@Variable_23*
_output_shapes
: *

debug_nameVariable_23/*
dtype0*
shape:	@�*
shared_nameVariable_23
g
,Variable_23/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_23*
_output_shapes
: 
h
Variable_23/AssignAssignVariableOpVariable_23&Variable_23/Initializer/ReadVariableOp*
dtype0
l
Variable_23/Read/ReadVariableOpReadVariableOpVariable_23*
_output_shapes
:	@�*
dtype0
�
&seed_generator_10/seed_generator_stateVarHandleOp*
_output_shapes
: *7

debug_name)'seed_generator_10/seed_generator_state/*
dtype0	*
shape:*7
shared_name(&seed_generator_10/seed_generator_state
�
:seed_generator_10/seed_generator_state/Read/ReadVariableOpReadVariableOp&seed_generator_10/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_24/Initializer/ReadVariableOpReadVariableOp&seed_generator_10/seed_generator_state*
_class
loc:@Variable_24*
_output_shapes
:*
dtype0	
�
Variable_24VarHandleOp*
_class
loc:@Variable_24*
_output_shapes
: *

debug_nameVariable_24/*
dtype0	*
shape:*
shared_nameVariable_24
g
,Variable_24/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_24*
_output_shapes
: 
h
Variable_24/AssignAssignVariableOpVariable_24&Variable_24/Initializer/ReadVariableOp*
dtype0	
g
Variable_24/Read/ReadVariableOpReadVariableOpVariable_24*
_output_shapes
:*
dtype0	
�
bn/moving_variance_1VarHandleOp*
_output_shapes
: *%

debug_namebn/moving_variance_1/*
dtype0*
shape:@*%
shared_namebn/moving_variance_1
y
(bn/moving_variance_1/Read/ReadVariableOpReadVariableOpbn/moving_variance_1*
_output_shapes
:@*
dtype0
�
&Variable_25/Initializer/ReadVariableOpReadVariableOpbn/moving_variance_1*
_class
loc:@Variable_25*
_output_shapes
:@*
dtype0
�
Variable_25VarHandleOp*
_class
loc:@Variable_25*
_output_shapes
: *

debug_nameVariable_25/*
dtype0*
shape:@*
shared_nameVariable_25
g
,Variable_25/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_25*
_output_shapes
: 
h
Variable_25/AssignAssignVariableOpVariable_25&Variable_25/Initializer/ReadVariableOp*
dtype0
g
Variable_25/Read/ReadVariableOpReadVariableOpVariable_25*
_output_shapes
:@*
dtype0
�
bn/moving_mean_1VarHandleOp*
_output_shapes
: *!

debug_namebn/moving_mean_1/*
dtype0*
shape:@*!
shared_namebn/moving_mean_1
q
$bn/moving_mean_1/Read/ReadVariableOpReadVariableOpbn/moving_mean_1*
_output_shapes
:@*
dtype0
�
&Variable_26/Initializer/ReadVariableOpReadVariableOpbn/moving_mean_1*
_class
loc:@Variable_26*
_output_shapes
:@*
dtype0
�
Variable_26VarHandleOp*
_class
loc:@Variable_26*
_output_shapes
: *

debug_nameVariable_26/*
dtype0*
shape:@*
shared_nameVariable_26
g
,Variable_26/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_26*
_output_shapes
: 
h
Variable_26/AssignAssignVariableOpVariable_26&Variable_26/Initializer/ReadVariableOp*
dtype0
g
Variable_26/Read/ReadVariableOpReadVariableOpVariable_26*
_output_shapes
:@*
dtype0
�
	bn/beta_1VarHandleOp*
_output_shapes
: *

debug_name
bn/beta_1/*
dtype0*
shape:@*
shared_name	bn/beta_1
c
bn/beta_1/Read/ReadVariableOpReadVariableOp	bn/beta_1*
_output_shapes
:@*
dtype0
�
&Variable_27/Initializer/ReadVariableOpReadVariableOp	bn/beta_1*
_class
loc:@Variable_27*
_output_shapes
:@*
dtype0
�
Variable_27VarHandleOp*
_class
loc:@Variable_27*
_output_shapes
: *

debug_nameVariable_27/*
dtype0*
shape:@*
shared_nameVariable_27
g
,Variable_27/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_27*
_output_shapes
: 
h
Variable_27/AssignAssignVariableOpVariable_27&Variable_27/Initializer/ReadVariableOp*
dtype0
g
Variable_27/Read/ReadVariableOpReadVariableOpVariable_27*
_output_shapes
:@*
dtype0
�

bn/gamma_1VarHandleOp*
_output_shapes
: *

debug_namebn/gamma_1/*
dtype0*
shape:@*
shared_name
bn/gamma_1
e
bn/gamma_1/Read/ReadVariableOpReadVariableOp
bn/gamma_1*
_output_shapes
:@*
dtype0
�
&Variable_28/Initializer/ReadVariableOpReadVariableOp
bn/gamma_1*
_class
loc:@Variable_28*
_output_shapes
:@*
dtype0
�
Variable_28VarHandleOp*
_class
loc:@Variable_28*
_output_shapes
: *

debug_nameVariable_28/*
dtype0*
shape:@*
shared_nameVariable_28
g
,Variable_28/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_28*
_output_shapes
: 
h
Variable_28/AssignAssignVariableOpVariable_28&Variable_28/Initializer/ReadVariableOp*
dtype0
g
Variable_28/Read/ReadVariableOpReadVariableOpVariable_28*
_output_shapes
:@*
dtype0
�
atcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_state
�
utcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_29/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_state*
_class
loc:@Variable_29*
_output_shapes
:*
dtype0	
�
Variable_29VarHandleOp*
_class
loc:@Variable_29*
_output_shapes
: *

debug_nameVariable_29/*
dtype0	*
shape:*
shared_nameVariable_29
g
,Variable_29/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_29*
_output_shapes
: 
h
Variable_29/AssignAssignVariableOpVariable_29&Variable_29/Initializer/ReadVariableOp*
dtype0	
g
Variable_29/Read/ReadVariableOpReadVariableOpVariable_29*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1
�
Vtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_30/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1*
_class
loc:@Variable_30*
_output_shapes
:@*
dtype0
�
Variable_30VarHandleOp*
_class
loc:@Variable_30*
_output_shapes
: *

debug_nameVariable_30/*
dtype0*
shape:@*
shared_nameVariable_30
g
,Variable_30/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_30*
_output_shapes
: 
h
Variable_30/AssignAssignVariableOpVariable_30&Variable_30/Initializer/ReadVariableOp*
dtype0
g
Variable_30/Read/ReadVariableOpReadVariableOpVariable_30*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1
�
Xtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_31/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1*
_class
loc:@Variable_31*"
_output_shapes
:@@*
dtype0
�
Variable_31VarHandleOp*
_class
loc:@Variable_31*
_output_shapes
: *

debug_nameVariable_31/*
dtype0*
shape:@@*
shared_nameVariable_31
g
,Variable_31/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_31*
_output_shapes
: 
h
Variable_31/AssignAssignVariableOpVariable_31&Variable_31/Initializer/ReadVariableOp*
dtype0
o
Variable_31/Read/ReadVariableOpReadVariableOpVariable_31*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_state
�
utcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_32/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_state*
_class
loc:@Variable_32*
_output_shapes
:*
dtype0	
�
Variable_32VarHandleOp*
_class
loc:@Variable_32*
_output_shapes
: *

debug_nameVariable_32/*
dtype0	*
shape:*
shared_nameVariable_32
g
,Variable_32/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_32*
_output_shapes
: 
h
Variable_32/AssignAssignVariableOpVariable_32&Variable_32/Initializer/ReadVariableOp*
dtype0	
g
Variable_32/Read/ReadVariableOpReadVariableOpVariable_32*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1
�
Vtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_33/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1*
_class
loc:@Variable_33*
_output_shapes
:@*
dtype0
�
Variable_33VarHandleOp*
_class
loc:@Variable_33*
_output_shapes
: *

debug_nameVariable_33/*
dtype0*
shape:@*
shared_nameVariable_33
g
,Variable_33/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_33*
_output_shapes
: 
h
Variable_33/AssignAssignVariableOpVariable_33&Variable_33/Initializer/ReadVariableOp*
dtype0
g
Variable_33/Read/ReadVariableOpReadVariableOpVariable_33*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1
�
Xtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_34/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1*
_class
loc:@Variable_34*"
_output_shapes
:@@*
dtype0
�
Variable_34VarHandleOp*
_class
loc:@Variable_34*
_output_shapes
: *

debug_nameVariable_34/*
dtype0*
shape:@@*
shared_nameVariable_34
g
,Variable_34/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_34*
_output_shapes
: 
h
Variable_34/AssignAssignVariableOpVariable_34&Variable_34/Initializer/ReadVariableOp*
dtype0
o
Variable_34/Read/ReadVariableOpReadVariableOpVariable_34*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_state
�
utcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_35/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_state*
_class
loc:@Variable_35*
_output_shapes
:*
dtype0	
�
Variable_35VarHandleOp*
_class
loc:@Variable_35*
_output_shapes
: *

debug_nameVariable_35/*
dtype0	*
shape:*
shared_nameVariable_35
g
,Variable_35/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_35*
_output_shapes
: 
h
Variable_35/AssignAssignVariableOpVariable_35&Variable_35/Initializer/ReadVariableOp*
dtype0	
g
Variable_35/Read/ReadVariableOpReadVariableOpVariable_35*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1
�
Vtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_36/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1*
_class
loc:@Variable_36*
_output_shapes
:@*
dtype0
�
Variable_36VarHandleOp*
_class
loc:@Variable_36*
_output_shapes
: *

debug_nameVariable_36/*
dtype0*
shape:@*
shared_nameVariable_36
g
,Variable_36/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_36*
_output_shapes
: 
h
Variable_36/AssignAssignVariableOpVariable_36&Variable_36/Initializer/ReadVariableOp*
dtype0
g
Variable_36/Read/ReadVariableOpReadVariableOpVariable_36*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1
�
Xtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_37/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1*
_class
loc:@Variable_37*"
_output_shapes
:@@*
dtype0
�
Variable_37VarHandleOp*
_class
loc:@Variable_37*
_output_shapes
: *

debug_nameVariable_37/*
dtype0*
shape:@@*
shared_nameVariable_37
g
,Variable_37/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_37*
_output_shapes
: 
h
Variable_37/AssignAssignVariableOpVariable_37&Variable_37/Initializer/ReadVariableOp*
dtype0
o
Variable_37/Read/ReadVariableOpReadVariableOpVariable_37*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_state
�
utcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_38/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_state*
_class
loc:@Variable_38*
_output_shapes
:*
dtype0	
�
Variable_38VarHandleOp*
_class
loc:@Variable_38*
_output_shapes
: *

debug_nameVariable_38/*
dtype0	*
shape:*
shared_nameVariable_38
g
,Variable_38/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_38*
_output_shapes
: 
h
Variable_38/AssignAssignVariableOpVariable_38&Variable_38/Initializer/ReadVariableOp*
dtype0	
g
Variable_38/Read/ReadVariableOpReadVariableOpVariable_38*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1
�
Vtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_39/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1*
_class
loc:@Variable_39*
_output_shapes
:@*
dtype0
�
Variable_39VarHandleOp*
_class
loc:@Variable_39*
_output_shapes
: *

debug_nameVariable_39/*
dtype0*
shape:@*
shared_nameVariable_39
g
,Variable_39/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_39*
_output_shapes
: 
h
Variable_39/AssignAssignVariableOpVariable_39&Variable_39/Initializer/ReadVariableOp*
dtype0
g
Variable_39/Read/ReadVariableOpReadVariableOpVariable_39*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1
�
Xtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_40/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1*
_class
loc:@Variable_40*"
_output_shapes
:@@*
dtype0
�
Variable_40VarHandleOp*
_class
loc:@Variable_40*
_output_shapes
: *

debug_nameVariable_40/*
dtype0*
shape:@@*
shared_nameVariable_40
g
,Variable_40/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_40*
_output_shapes
: 
h
Variable_40/AssignAssignVariableOpVariable_40&Variable_40/Initializer/ReadVariableOp*
dtype0
o
Variable_40/Read/ReadVariableOpReadVariableOpVariable_40*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_state
�
utcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_41/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_state*
_class
loc:@Variable_41*
_output_shapes
:*
dtype0	
�
Variable_41VarHandleOp*
_class
loc:@Variable_41*
_output_shapes
: *

debug_nameVariable_41/*
dtype0	*
shape:*
shared_nameVariable_41
g
,Variable_41/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_41*
_output_shapes
: 
h
Variable_41/AssignAssignVariableOpVariable_41&Variable_41/Initializer/ReadVariableOp*
dtype0	
g
Variable_41/Read/ReadVariableOpReadVariableOpVariable_41*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1
�
Vtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_42/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1*
_class
loc:@Variable_42*
_output_shapes
:@*
dtype0
�
Variable_42VarHandleOp*
_class
loc:@Variable_42*
_output_shapes
: *

debug_nameVariable_42/*
dtype0*
shape:@*
shared_nameVariable_42
g
,Variable_42/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_42*
_output_shapes
: 
h
Variable_42/AssignAssignVariableOpVariable_42&Variable_42/Initializer/ReadVariableOp*
dtype0
g
Variable_42/Read/ReadVariableOpReadVariableOpVariable_42*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1
�
Xtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_43/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1*
_class
loc:@Variable_43*"
_output_shapes
:@@*
dtype0
�
Variable_43VarHandleOp*
_class
loc:@Variable_43*
_output_shapes
: *

debug_nameVariable_43/*
dtype0*
shape:@@*
shared_nameVariable_43
g
,Variable_43/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_43*
_output_shapes
: 
h
Variable_43/AssignAssignVariableOpVariable_43&Variable_43/Initializer/ReadVariableOp*
dtype0
o
Variable_43/Read/ReadVariableOpReadVariableOpVariable_43*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_state
�
utcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_44/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_state*
_class
loc:@Variable_44*
_output_shapes
:*
dtype0	
�
Variable_44VarHandleOp*
_class
loc:@Variable_44*
_output_shapes
: *

debug_nameVariable_44/*
dtype0	*
shape:*
shared_nameVariable_44
g
,Variable_44/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_44*
_output_shapes
: 
h
Variable_44/AssignAssignVariableOpVariable_44&Variable_44/Initializer/ReadVariableOp*
dtype0	
g
Variable_44/Read/ReadVariableOpReadVariableOpVariable_44*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1
�
Vtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_45/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1*
_class
loc:@Variable_45*
_output_shapes
:@*
dtype0
�
Variable_45VarHandleOp*
_class
loc:@Variable_45*
_output_shapes
: *

debug_nameVariable_45/*
dtype0*
shape:@*
shared_nameVariable_45
g
,Variable_45/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_45*
_output_shapes
: 
h
Variable_45/AssignAssignVariableOpVariable_45&Variable_45/Initializer/ReadVariableOp*
dtype0
g
Variable_45/Read/ReadVariableOpReadVariableOpVariable_45*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1
�
Xtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_46/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1*
_class
loc:@Variable_46*"
_output_shapes
:@@*
dtype0
�
Variable_46VarHandleOp*
_class
loc:@Variable_46*
_output_shapes
: *

debug_nameVariable_46/*
dtype0*
shape:@@*
shared_nameVariable_46
g
,Variable_46/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_46*
_output_shapes
: 
h
Variable_46/AssignAssignVariableOpVariable_46&Variable_46/Initializer/ReadVariableOp*
dtype0
o
Variable_46/Read/ReadVariableOpReadVariableOpVariable_46*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_state
�
utcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_47/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_state*
_class
loc:@Variable_47*
_output_shapes
:*
dtype0	
�
Variable_47VarHandleOp*
_class
loc:@Variable_47*
_output_shapes
: *

debug_nameVariable_47/*
dtype0	*
shape:*
shared_nameVariable_47
g
,Variable_47/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_47*
_output_shapes
: 
h
Variable_47/AssignAssignVariableOpVariable_47&Variable_47/Initializer/ReadVariableOp*
dtype0	
g
Variable_47/Read/ReadVariableOpReadVariableOpVariable_47*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1
�
Vtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_48/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1*
_class
loc:@Variable_48*
_output_shapes
:@*
dtype0
�
Variable_48VarHandleOp*
_class
loc:@Variable_48*
_output_shapes
: *

debug_nameVariable_48/*
dtype0*
shape:@*
shared_nameVariable_48
g
,Variable_48/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_48*
_output_shapes
: 
h
Variable_48/AssignAssignVariableOpVariable_48&Variable_48/Initializer/ReadVariableOp*
dtype0
g
Variable_48/Read/ReadVariableOpReadVariableOpVariable_48*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1
�
Xtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_49/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1*
_class
loc:@Variable_49*"
_output_shapes
:@@*
dtype0
�
Variable_49VarHandleOp*
_class
loc:@Variable_49*
_output_shapes
: *

debug_nameVariable_49/*
dtype0*
shape:@@*
shared_nameVariable_49
g
,Variable_49/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_49*
_output_shapes
: 
h
Variable_49/AssignAssignVariableOpVariable_49&Variable_49/Initializer/ReadVariableOp*
dtype0
o
Variable_49/Read/ReadVariableOpReadVariableOpVariable_49*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_state
�
utcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_50/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_state*
_class
loc:@Variable_50*
_output_shapes
:*
dtype0	
�
Variable_50VarHandleOp*
_class
loc:@Variable_50*
_output_shapes
: *

debug_nameVariable_50/*
dtype0	*
shape:*
shared_nameVariable_50
g
,Variable_50/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_50*
_output_shapes
: 
h
Variable_50/AssignAssignVariableOpVariable_50&Variable_50/Initializer/ReadVariableOp*
dtype0	
g
Variable_50/Read/ReadVariableOpReadVariableOpVariable_50*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1
�
Vtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_51/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1*
_class
loc:@Variable_51*
_output_shapes
:@*
dtype0
�
Variable_51VarHandleOp*
_class
loc:@Variable_51*
_output_shapes
: *

debug_nameVariable_51/*
dtype0*
shape:@*
shared_nameVariable_51
g
,Variable_51/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_51*
_output_shapes
: 
h
Variable_51/AssignAssignVariableOpVariable_51&Variable_51/Initializer/ReadVariableOp*
dtype0
g
Variable_51/Read/ReadVariableOpReadVariableOpVariable_51*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1
�
Xtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_52/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1*
_class
loc:@Variable_52*"
_output_shapes
:@@*
dtype0
�
Variable_52VarHandleOp*
_class
loc:@Variable_52*
_output_shapes
: *

debug_nameVariable_52/*
dtype0*
shape:@@*
shared_nameVariable_52
g
,Variable_52/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_52*
_output_shapes
: 
h
Variable_52/AssignAssignVariableOpVariable_52&Variable_52/Initializer/ReadVariableOp*
dtype0
o
Variable_52/Read/ReadVariableOpReadVariableOpVariable_52*"
_output_shapes
:@@*
dtype0
�
atcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_stateVarHandleOp*
_output_shapes
: *r

debug_namedbtcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_state/*
dtype0	*
shape:*r
shared_namecatcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_state
�
utcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_state/Read/ReadVariableOpReadVariableOpatcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_53/Initializer/ReadVariableOpReadVariableOpatcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_state*
_class
loc:@Variable_53*
_output_shapes
:*
dtype0	
�
Variable_53VarHandleOp*
_class
loc:@Variable_53*
_output_shapes
: *

debug_nameVariable_53/*
dtype0	*
shape:*
shared_nameVariable_53
g
,Variable_53/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_53*
_output_shapes
: 
h
Variable_53/AssignAssignVariableOpVariable_53&Variable_53/Initializer/ReadVariableOp*
dtype0	
g
Variable_53/Read/ReadVariableOpReadVariableOpVariable_53*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1
�
Vtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_54/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1*
_class
loc:@Variable_54*
_output_shapes
:@*
dtype0
�
Variable_54VarHandleOp*
_class
loc:@Variable_54*
_output_shapes
: *

debug_nameVariable_54/*
dtype0*
shape:@*
shared_nameVariable_54
g
,Variable_54/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_54*
_output_shapes
: 
h
Variable_54/AssignAssignVariableOpVariable_54&Variable_54/Initializer/ReadVariableOp*
dtype0
g
Variable_54/Read/ReadVariableOpReadVariableOpVariable_54*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1
�
Xtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_55/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1*
_class
loc:@Variable_55*"
_output_shapes
:@@*
dtype0
�
Variable_55VarHandleOp*
_class
loc:@Variable_55*
_output_shapes
: *

debug_nameVariable_55/*
dtype0*
shape:@@*
shared_nameVariable_55
g
,Variable_55/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_55*
_output_shapes
: 
h
Variable_55/AssignAssignVariableOpVariable_55&Variable_55/Initializer/ReadVariableOp*
dtype0
o
Variable_55/Read/ReadVariableOpReadVariableOpVariable_55*"
_output_shapes
:@@*
dtype0
�
_tcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_stateVarHandleOp*
_output_shapes
: *p

debug_nameb`tcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_state/*
dtype0	*
shape:*p
shared_namea_tcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_state
�
stcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_state/Read/ReadVariableOpReadVariableOp_tcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_state*
_output_shapes
:*
dtype0	
�
&Variable_56/Initializer/ReadVariableOpReadVariableOp_tcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_state*
_class
loc:@Variable_56*
_output_shapes
:*
dtype0	
�
Variable_56VarHandleOp*
_class
loc:@Variable_56*
_output_shapes
: *

debug_nameVariable_56/*
dtype0	*
shape:*
shared_nameVariable_56
g
,Variable_56/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_56*
_output_shapes
: 
h
Variable_56/AssignAssignVariableOpVariable_56&Variable_56/Initializer/ReadVariableOp*
dtype0	
g
Variable_56/Read/ReadVariableOpReadVariableOpVariable_56*
_output_shapes
:*
dtype0	
�
Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1VarHandleOp*
_output_shapes
: *S

debug_nameECtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1/*
dtype0*
shape:@*S
shared_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1
�
Vtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1/Read/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_57/Initializer/ReadVariableOpReadVariableOpBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1*
_class
loc:@Variable_57*
_output_shapes
:@*
dtype0
�
Variable_57VarHandleOp*
_class
loc:@Variable_57*
_output_shapes
: *

debug_nameVariable_57/*
dtype0*
shape:@*
shared_nameVariable_57
g
,Variable_57/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_57*
_output_shapes
: 
h
Variable_57/AssignAssignVariableOpVariable_57&Variable_57/Initializer/ReadVariableOp*
dtype0
g
Variable_57/Read/ReadVariableOpReadVariableOpVariable_57*
_output_shapes
:@*
dtype0
�
Dtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1VarHandleOp*
_output_shapes
: *U

debug_nameGEtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1/*
dtype0*
shape:@@*U
shared_nameFDtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1
�
Xtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1/Read/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1*"
_output_shapes
:@@*
dtype0
�
&Variable_58/Initializer/ReadVariableOpReadVariableOpDtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1*
_class
loc:@Variable_58*"
_output_shapes
:@@*
dtype0
�
Variable_58VarHandleOp*
_class
loc:@Variable_58*
_output_shapes
: *

debug_nameVariable_58/*
dtype0*
shape:@@*
shared_nameVariable_58
g
,Variable_58/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_58*
_output_shapes
: 
h
Variable_58/AssignAssignVariableOpVariable_58&Variable_58/Initializer/ReadVariableOp*
dtype0
o
Variable_58/Read/ReadVariableOpReadVariableOpVariable_58*"
_output_shapes
:@@*
dtype0
�
conv1d/bias_1VarHandleOp*
_output_shapes
: *

debug_nameconv1d/bias_1/*
dtype0*
shape:@*
shared_nameconv1d/bias_1
k
!conv1d/bias_1/Read/ReadVariableOpReadVariableOpconv1d/bias_1*
_output_shapes
:@*
dtype0
�
&Variable_59/Initializer/ReadVariableOpReadVariableOpconv1d/bias_1*
_class
loc:@Variable_59*
_output_shapes
:@*
dtype0
�
Variable_59VarHandleOp*
_class
loc:@Variable_59*
_output_shapes
: *

debug_nameVariable_59/*
dtype0*
shape:@*
shared_nameVariable_59
g
,Variable_59/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_59*
_output_shapes
: 
h
Variable_59/AssignAssignVariableOpVariable_59&Variable_59/Initializer/ReadVariableOp*
dtype0
g
Variable_59/Read/ReadVariableOpReadVariableOpVariable_59*
_output_shapes
:@*
dtype0
�
conv1d/kernel_1VarHandleOp*
_output_shapes
: * 

debug_nameconv1d/kernel_1/*
dtype0*
shape:+@* 
shared_nameconv1d/kernel_1
w
#conv1d/kernel_1/Read/ReadVariableOpReadVariableOpconv1d/kernel_1*"
_output_shapes
:+@*
dtype0
�
&Variable_60/Initializer/ReadVariableOpReadVariableOpconv1d/kernel_1*
_class
loc:@Variable_60*"
_output_shapes
:+@*
dtype0
�
Variable_60VarHandleOp*
_class
loc:@Variable_60*
_output_shapes
: *

debug_nameVariable_60/*
dtype0*
shape:+@*
shared_nameVariable_60
g
,Variable_60/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable_60*
_output_shapes
: 
h
Variable_60/AssignAssignVariableOpVariable_60&Variable_60/Initializer/ReadVariableOp*
dtype0
o
Variable_60/Read/ReadVariableOpReadVariableOpVariable_60*"
_output_shapes
:+@*
dtype0

serve_input_sequencePlaceholder*+
_output_shapes
:���������L+*
dtype0* 
shape:���������L+
�
StatefulPartitionedCallStatefulPartitionedCallserve_input_sequenceconv1d/kernel_1conv1d/bias_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1bn/moving_mean_1bn/moving_variance_1
bn/gamma_1	bn/beta_1gru1/gru_cell/kernel_1 gru1/gru_cell/recurrent_kernel_1gru1/gru_cell/bias_1gru_2/gru_cell/kernel_1!gru_2/gru_cell/recurrent_kernel_1gru_2/gru_cell/bias_1mha/query/kernel_1mha/query/bias_1mha/key/kernel_1mha/key/bias_1mha/value/kernel_1mha/value/bias_1mha/attention_output/kernel_1mha/attention_output/bias_1attn_norm/gamma_1attn_norm/beta_1dense/kernel_1dense/bias_1dense_1/kernel_1dense_1/bias_1*:
Tin3
12/*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������L*P
_read_only_resource_inputs2
0.	
 !"#$%&'()*+,-.*5
config_proto%#

CPU

GPU2*0J 8� �J *4
f/R-
+__inference_signature_wrapper___call___5034
�
serving_default_input_sequencePlaceholder*+
_output_shapes
:���������L+*
dtype0* 
shape:���������L+
�
StatefulPartitionedCall_1StatefulPartitionedCallserving_default_input_sequenceconv1d/kernel_1conv1d/bias_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1bn/moving_mean_1bn/moving_variance_1
bn/gamma_1	bn/beta_1gru1/gru_cell/kernel_1 gru1/gru_cell/recurrent_kernel_1gru1/gru_cell/bias_1gru_2/gru_cell/kernel_1!gru_2/gru_cell/recurrent_kernel_1gru_2/gru_cell/bias_1mha/query/kernel_1mha/query/bias_1mha/key/kernel_1mha/key/bias_1mha/value/kernel_1mha/value/bias_1mha/attention_output/kernel_1mha/attention_output/bias_1attn_norm/gamma_1attn_norm/beta_1dense/kernel_1dense/bias_1dense_1/kernel_1dense_1/bias_1*:
Tin3
12/*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������L*P
_read_only_resource_inputs2
0.	
 !"#$%&'()*+,-.*5
config_proto%#

CPU

GPU2*0J 8� �J *4
f/R-
+__inference_signature_wrapper___call___5131

NoOpNoOp
�Z
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�Y
value�YB�Y B�Y
�
	variables
trainable_variables
non_trainable_variables
_all_variables
_misc_assets
	serve

signatures*
�
0
	1

2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
 24
!25
"26
#27
$28
%29
&30
'31
(32
)33
*34
+35
,36
-37
.38
/39
040
141
242
343
444
545
646
747
848
949
:50
;51
<52
=53
>54
?55
@56
A57
B58
C59
D60*
�
0
	1

2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
 17
"18
#19
%20
&21
(22
)23
-24
.25
/26
227
328
429
730
831
932
:33
;34
<35
=36
>37
?38
@39
A40
B41
C42
D43*
�
0
1
2
3
4
5
6
!7
$8
'9
*10
+11
,12
013
114
515
616*
�
E0
F1
G2
H3
I4
J5
K6
L7
M8
N9
O10
P11
Q12
R13
S14
T15
U16
V17
W18
X19
Y20
Z21
[22
\23
]24
^25
_26
`27
a28
b29
c30
d31
e32
f33
g34
h35
i36
j37
k38
l39
m40
n41
o42
p43
q44
r45*
* 

strace_0* 
"
	tserve
userving_default* 
KE
VARIABLE_VALUEVariable_60&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_59&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_58&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_57&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_56&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_55&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_54&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_53&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_52&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEVariable_51&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_50'variables/10/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_49'variables/11/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_48'variables/12/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_47'variables/13/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_46'variables/14/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_45'variables/15/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_44'variables/16/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_43'variables/17/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_42'variables/18/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_41'variables/19/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_40'variables/20/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_39'variables/21/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_38'variables/22/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_37'variables/23/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_36'variables/24/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_35'variables/25/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_34'variables/26/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_33'variables/27/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_32'variables/28/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_31'variables/29/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_30'variables/30/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_29'variables/31/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_28'variables/32/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_27'variables/33/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_26'variables/34/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_25'variables/35/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_24'variables/36/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_23'variables/37/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_22'variables/38/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_21'variables/39/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_20'variables/40/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_19'variables/41/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_18'variables/42/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_17'variables/43/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_16'variables/44/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_15'variables/45/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_14'variables/46/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_13'variables/47/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_12'variables/48/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_11'variables/49/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEVariable_10'variables/50/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_9'variables/51/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_8'variables/52/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_7'variables/53/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_6'variables/54/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_5'variables/55/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_4'variables/56/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_3'variables/57/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_2'variables/58/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
Variable_1'variables/59/.ATTRIBUTES/VARIABLE_VALUE*
IC
VARIABLE_VALUEVariable'variables/60/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1+_all_variables/0/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1+_all_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEgru_2/gru_cell/kernel_1+_all_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEgru_2/gru_cell/bias_1+_all_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
WQ
VARIABLE_VALUEmha/value/kernel_1+_all_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1+_all_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1+_all_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1+_all_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1+_all_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE	bn/beta_1+_all_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEmha/attention_output/kernel_1,_all_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
TN
VARIABLE_VALUEdense_1/bias_1,_all_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEconv1d/kernel_1,_all_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1,_all_variables/13/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1,_all_variables/14/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1,_all_variables/15/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1,_all_variables/16/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUE
bn/gamma_1,_all_variables/17/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEmha/query/bias_1,_all_variables/18/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEmha/value/bias_1,_all_variables/19/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1,_all_variables/20/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1,_all_variables/21/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEmha/key/kernel_1,_all_variables/22/.ATTRIBUTES/VARIABLE_VALUE*
WQ
VARIABLE_VALUEattn_norm/gamma_1,_all_variables/23/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1,_all_variables/24/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1,_all_variables/25/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1,_all_variables/26/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEgru1/gru_cell/kernel_1,_all_variables/27/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEattn_norm/beta_1,_all_variables/28/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1,_all_variables/29/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1,_all_variables/30/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEmha/attention_output/bias_1,_all_variables/31/.ATTRIBUTES/VARIABLE_VALUE*
TN
VARIABLE_VALUEdense/kernel_1,_all_variables/32/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEdense_1/kernel_1,_all_variables/33/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEgru1/gru_cell/bias_1,_all_variables/34/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUEmha/query/kernel_1,_all_variables/35/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEconv1d/bias_1,_all_variables/36/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1,_all_variables/37/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEDtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1,_all_variables/38/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1,_all_variables/39/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUE gru1/gru_cell/recurrent_kernel_1,_all_variables/40/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUE!gru_2/gru_cell/recurrent_kernel_1,_all_variables/41/.ATTRIBUTES/VARIABLE_VALUE*
TN
VARIABLE_VALUEmha/key/bias_1,_all_variables/42/.ATTRIBUTES/VARIABLE_VALUE*
RL
VARIABLE_VALUEdense/bias_1,_all_variables/43/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEbn/moving_mean_1,_all_variables/44/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEbn/moving_variance_1,_all_variables/45/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameVariable_60Variable_59Variable_58Variable_57Variable_56Variable_55Variable_54Variable_53Variable_52Variable_51Variable_50Variable_49Variable_48Variable_47Variable_46Variable_45Variable_44Variable_43Variable_42Variable_41Variable_40Variable_39Variable_38Variable_37Variable_36Variable_35Variable_34Variable_33Variable_32Variable_31Variable_30Variable_29Variable_28Variable_27Variable_26Variable_25Variable_24Variable_23Variable_22Variable_21Variable_20Variable_19Variable_18Variable_17Variable_16Variable_15Variable_14Variable_13Variable_12Variable_11Variable_10
Variable_9
Variable_8
Variable_7
Variable_6
Variable_5
Variable_4
Variable_3
Variable_2
Variable_1VariableBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1gru_2/gru_cell/kernel_1gru_2/gru_cell/bias_1mha/value/kernel_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1	bn/beta_1mha/attention_output/kernel_1dense_1/bias_1conv1d/kernel_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1
bn/gamma_1mha/query/bias_1mha/value/bias_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1mha/key/kernel_1attn_norm/gamma_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1gru1/gru_cell/kernel_1attn_norm/beta_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1mha/attention_output/bias_1dense/kernel_1dense_1/kernel_1gru1/gru_cell/bias_1mha/query/kernel_1conv1d/bias_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1 gru1/gru_cell/recurrent_kernel_1!gru_2/gru_cell/recurrent_kernel_1mha/key/bias_1dense/bias_1bn/moving_mean_1bn/moving_variance_1Const*x
Tinq
o2m*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *5
config_proto%#

CPU

GPU2*0J 8� �J *&
f!R
__inference__traced_save_6041
�
StatefulPartitionedCall_3StatefulPartitionedCallsaver_filenameVariable_60Variable_59Variable_58Variable_57Variable_56Variable_55Variable_54Variable_53Variable_52Variable_51Variable_50Variable_49Variable_48Variable_47Variable_46Variable_45Variable_44Variable_43Variable_42Variable_41Variable_40Variable_39Variable_38Variable_37Variable_36Variable_35Variable_34Variable_33Variable_32Variable_31Variable_30Variable_29Variable_28Variable_27Variable_26Variable_25Variable_24Variable_23Variable_22Variable_21Variable_20Variable_19Variable_18Variable_17Variable_16Variable_15Variable_14Variable_13Variable_12Variable_11Variable_10
Variable_9
Variable_8
Variable_7
Variable_6
Variable_5
Variable_4
Variable_3
Variable_2
Variable_1VariableBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1gru_2/gru_cell/kernel_1gru_2/gru_cell/bias_1mha/value/kernel_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1	bn/beta_1mha/attention_output/kernel_1dense_1/bias_1conv1d/kernel_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1
bn/gamma_1mha/query/bias_1mha/value/bias_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1mha/key/kernel_1attn_norm/gamma_1Dtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1Dtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1gru1/gru_cell/kernel_1attn_norm/beta_1Dtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1Dtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1mha/attention_output/bias_1dense/kernel_1dense_1/kernel_1gru1/gru_cell/bias_1mha/query/kernel_1conv1d/bias_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1Dtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1 gru1/gru_cell/recurrent_kernel_1!gru_2/gru_cell/recurrent_kernel_1mha/key/bias_1dense/bias_1bn/moving_mean_1bn/moving_variance_1*w
Tinp
n2l*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *5
config_proto%#

CPU

GPU2*0J 8� �J *)
f$R"
 __inference__traced_restore_6371��$
��
�F
 __inference__traced_restore_6371
file_prefix2
assignvariableop_variable_60:+@,
assignvariableop_1_variable_59:@4
assignvariableop_2_variable_58:@@,
assignvariableop_3_variable_57:@,
assignvariableop_4_variable_56:	4
assignvariableop_5_variable_55:@@,
assignvariableop_6_variable_54:@,
assignvariableop_7_variable_53:	4
assignvariableop_8_variable_52:@@,
assignvariableop_9_variable_51:@-
assignvariableop_10_variable_50:	5
assignvariableop_11_variable_49:@@-
assignvariableop_12_variable_48:@-
assignvariableop_13_variable_47:	5
assignvariableop_14_variable_46:@@-
assignvariableop_15_variable_45:@-
assignvariableop_16_variable_44:	5
assignvariableop_17_variable_43:@@-
assignvariableop_18_variable_42:@-
assignvariableop_19_variable_41:	5
assignvariableop_20_variable_40:@@-
assignvariableop_21_variable_39:@-
assignvariableop_22_variable_38:	5
assignvariableop_23_variable_37:@@-
assignvariableop_24_variable_36:@-
assignvariableop_25_variable_35:	5
assignvariableop_26_variable_34:@@-
assignvariableop_27_variable_33:@-
assignvariableop_28_variable_32:	5
assignvariableop_29_variable_31:@@-
assignvariableop_30_variable_30:@-
assignvariableop_31_variable_29:	-
assignvariableop_32_variable_28:@-
assignvariableop_33_variable_27:@-
assignvariableop_34_variable_26:@-
assignvariableop_35_variable_25:@-
assignvariableop_36_variable_24:	2
assignvariableop_37_variable_23:	@�2
assignvariableop_38_variable_22:	@�2
assignvariableop_39_variable_21:	�-
assignvariableop_40_variable_20:	-
assignvariableop_41_variable_19:	1
assignvariableop_42_variable_18:@01
assignvariableop_43_variable_17:01
assignvariableop_44_variable_16:0-
assignvariableop_45_variable_15:	-
assignvariableop_46_variable_14:	5
assignvariableop_47_variable_13: 1
assignvariableop_48_variable_12: 5
assignvariableop_49_variable_11: 1
assignvariableop_50_variable_10: 4
assignvariableop_51_variable_9: 0
assignvariableop_52_variable_8: 4
assignvariableop_53_variable_7: ,
assignvariableop_54_variable_6:,
assignvariableop_55_variable_5:,
assignvariableop_56_variable_4:0
assignvariableop_57_variable_3:,
assignvariableop_58_variable_2:0
assignvariableop_59_variable_1:*
assignvariableop_60_variable:d
Vassignvariableop_61_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_bias_1:@d
Vassignvariableop_62_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_bias_1:@=
+assignvariableop_63_gru_2_gru_cell_kernel_1:@0;
)assignvariableop_64_gru_2_gru_cell_bias_1:0<
&assignvariableop_65_mha_value_kernel_1: d
Vassignvariableop_66_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_bias_1:@d
Vassignvariableop_67_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_bias_1:@d
Vassignvariableop_68_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_bias_1:@d
Vassignvariableop_69_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_bias_1:@+
assignvariableop_70_bn_beta_1:@G
1assignvariableop_71_mha_attention_output_kernel_1: 0
"assignvariableop_72_dense_1_bias_1:9
#assignvariableop_73_conv1d_kernel_1:+@d
Vassignvariableop_74_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_bias_1:@d
Vassignvariableop_75_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_bias_1:@d
Vassignvariableop_76_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_bias_1:@n
Xassignvariableop_77_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_kernel_1:@@,
assignvariableop_78_bn_gamma_1:@6
$assignvariableop_79_mha_query_bias_1: 6
$assignvariableop_80_mha_value_bias_1: n
Xassignvariableop_81_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_kernel_1:@@n
Xassignvariableop_82_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_kernel_1:@@:
$assignvariableop_83_mha_key_kernel_1: 3
%assignvariableop_84_attn_norm_gamma_1:n
Xassignvariableop_85_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_kernel_1:@@n
Xassignvariableop_86_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_kernel_1:@@n
Xassignvariableop_87_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_kernel_1:@@=
*assignvariableop_88_gru1_gru_cell_kernel_1:	@�2
$assignvariableop_89_attn_norm_beta_1:n
Xassignvariableop_90_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_kernel_1:@@n
Xassignvariableop_91_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_kernel_1:@@=
/assignvariableop_92_mha_attention_output_bias_1:4
"assignvariableop_93_dense_kernel_1:6
$assignvariableop_94_dense_1_kernel_1:;
(assignvariableop_95_gru1_gru_cell_bias_1:	�<
&assignvariableop_96_mha_query_kernel_1: /
!assignvariableop_97_conv1d_bias_1:@n
Xassignvariableop_98_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_kernel_1:@@n
Xassignvariableop_99_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_kernel_1:@@e
Wassignvariableop_100_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_bias_1:@H
5assignvariableop_101_gru1_gru_cell_recurrent_kernel_1:	@�H
6assignvariableop_102_gru_2_gru_cell_recurrent_kernel_1:05
#assignvariableop_103_mha_key_bias_1: /
!assignvariableop_104_dense_bias_1:3
%assignvariableop_105_bn_moving_mean_1:@7
)assignvariableop_106_bn_moving_variance_1:@
identity_108��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_100�AssignVariableOp_101�AssignVariableOp_102�AssignVariableOp_103�AssignVariableOp_104�AssignVariableOp_105�AssignVariableOp_106�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_45�AssignVariableOp_46�AssignVariableOp_47�AssignVariableOp_48�AssignVariableOp_49�AssignVariableOp_5�AssignVariableOp_50�AssignVariableOp_51�AssignVariableOp_52�AssignVariableOp_53�AssignVariableOp_54�AssignVariableOp_55�AssignVariableOp_56�AssignVariableOp_57�AssignVariableOp_58�AssignVariableOp_59�AssignVariableOp_6�AssignVariableOp_60�AssignVariableOp_61�AssignVariableOp_62�AssignVariableOp_63�AssignVariableOp_64�AssignVariableOp_65�AssignVariableOp_66�AssignVariableOp_67�AssignVariableOp_68�AssignVariableOp_69�AssignVariableOp_7�AssignVariableOp_70�AssignVariableOp_71�AssignVariableOp_72�AssignVariableOp_73�AssignVariableOp_74�AssignVariableOp_75�AssignVariableOp_76�AssignVariableOp_77�AssignVariableOp_78�AssignVariableOp_79�AssignVariableOp_8�AssignVariableOp_80�AssignVariableOp_81�AssignVariableOp_82�AssignVariableOp_83�AssignVariableOp_84�AssignVariableOp_85�AssignVariableOp_86�AssignVariableOp_87�AssignVariableOp_88�AssignVariableOp_89�AssignVariableOp_9�AssignVariableOp_90�AssignVariableOp_91�AssignVariableOp_92�AssignVariableOp_93�AssignVariableOp_94�AssignVariableOp_95�AssignVariableOp_96�AssignVariableOp_97�AssignVariableOp_98�AssignVariableOp_99�%
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:l*
dtype0*�$
value�$B�$lB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB'variables/22/.ATTRIBUTES/VARIABLE_VALUEB'variables/23/.ATTRIBUTES/VARIABLE_VALUEB'variables/24/.ATTRIBUTES/VARIABLE_VALUEB'variables/25/.ATTRIBUTES/VARIABLE_VALUEB'variables/26/.ATTRIBUTES/VARIABLE_VALUEB'variables/27/.ATTRIBUTES/VARIABLE_VALUEB'variables/28/.ATTRIBUTES/VARIABLE_VALUEB'variables/29/.ATTRIBUTES/VARIABLE_VALUEB'variables/30/.ATTRIBUTES/VARIABLE_VALUEB'variables/31/.ATTRIBUTES/VARIABLE_VALUEB'variables/32/.ATTRIBUTES/VARIABLE_VALUEB'variables/33/.ATTRIBUTES/VARIABLE_VALUEB'variables/34/.ATTRIBUTES/VARIABLE_VALUEB'variables/35/.ATTRIBUTES/VARIABLE_VALUEB'variables/36/.ATTRIBUTES/VARIABLE_VALUEB'variables/37/.ATTRIBUTES/VARIABLE_VALUEB'variables/38/.ATTRIBUTES/VARIABLE_VALUEB'variables/39/.ATTRIBUTES/VARIABLE_VALUEB'variables/40/.ATTRIBUTES/VARIABLE_VALUEB'variables/41/.ATTRIBUTES/VARIABLE_VALUEB'variables/42/.ATTRIBUTES/VARIABLE_VALUEB'variables/43/.ATTRIBUTES/VARIABLE_VALUEB'variables/44/.ATTRIBUTES/VARIABLE_VALUEB'variables/45/.ATTRIBUTES/VARIABLE_VALUEB'variables/46/.ATTRIBUTES/VARIABLE_VALUEB'variables/47/.ATTRIBUTES/VARIABLE_VALUEB'variables/48/.ATTRIBUTES/VARIABLE_VALUEB'variables/49/.ATTRIBUTES/VARIABLE_VALUEB'variables/50/.ATTRIBUTES/VARIABLE_VALUEB'variables/51/.ATTRIBUTES/VARIABLE_VALUEB'variables/52/.ATTRIBUTES/VARIABLE_VALUEB'variables/53/.ATTRIBUTES/VARIABLE_VALUEB'variables/54/.ATTRIBUTES/VARIABLE_VALUEB'variables/55/.ATTRIBUTES/VARIABLE_VALUEB'variables/56/.ATTRIBUTES/VARIABLE_VALUEB'variables/57/.ATTRIBUTES/VARIABLE_VALUEB'variables/58/.ATTRIBUTES/VARIABLE_VALUEB'variables/59/.ATTRIBUTES/VARIABLE_VALUEB'variables/60/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/0/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/1/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/2/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/3/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/4/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/5/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/6/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/7/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/8/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/9/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/10/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/11/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/12/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/13/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/14/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/15/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/16/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/17/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/18/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/19/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/20/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/21/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/22/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/23/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/24/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/25/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/26/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/27/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/28/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/29/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/30/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/31/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/32/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/33/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/34/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/35/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/36/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/37/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/38/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/39/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/40/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/41/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/42/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/43/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/44/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/45/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:l*
dtype0*�
value�B�lB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*z
dtypesp
n2l															[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOpassignvariableop_variable_60Identity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOpassignvariableop_1_variable_59Identity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOpassignvariableop_2_variable_58Identity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOpassignvariableop_3_variable_57Identity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_4AssignVariableOpassignvariableop_4_variable_56Identity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOpassignvariableop_5_variable_55Identity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOpassignvariableop_6_variable_54Identity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_7AssignVariableOpassignvariableop_7_variable_53Identity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOpassignvariableop_8_variable_52Identity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOpassignvariableop_9_variable_51Identity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_10AssignVariableOpassignvariableop_10_variable_50Identity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOpassignvariableop_11_variable_49Identity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOpassignvariableop_12_variable_48Identity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_13AssignVariableOpassignvariableop_13_variable_47Identity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOpassignvariableop_14_variable_46Identity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_variable_45Identity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_16AssignVariableOpassignvariableop_16_variable_44Identity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOpassignvariableop_17_variable_43Identity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOpassignvariableop_18_variable_42Identity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_19AssignVariableOpassignvariableop_19_variable_41Identity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOpassignvariableop_20_variable_40Identity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOpassignvariableop_21_variable_39Identity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_22AssignVariableOpassignvariableop_22_variable_38Identity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOpassignvariableop_23_variable_37Identity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOpassignvariableop_24_variable_36Identity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_25AssignVariableOpassignvariableop_25_variable_35Identity_25:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOpassignvariableop_26_variable_34Identity_26:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOpassignvariableop_27_variable_33Identity_27:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_28AssignVariableOpassignvariableop_28_variable_32Identity_28:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOpassignvariableop_29_variable_31Identity_29:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOpassignvariableop_30_variable_30Identity_30:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_31AssignVariableOpassignvariableop_31_variable_29Identity_31:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOpassignvariableop_32_variable_28Identity_32:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOpassignvariableop_33_variable_27Identity_33:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOpassignvariableop_34_variable_26Identity_34:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOpassignvariableop_35_variable_25Identity_35:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_36AssignVariableOpassignvariableop_36_variable_24Identity_36:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOpassignvariableop_37_variable_23Identity_37:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOpassignvariableop_38_variable_22Identity_38:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOpassignvariableop_39_variable_21Identity_39:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_40AssignVariableOpassignvariableop_40_variable_20Identity_40:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_41AssignVariableOpassignvariableop_41_variable_19Identity_41:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOpassignvariableop_42_variable_18Identity_42:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOpassignvariableop_43_variable_17Identity_43:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_44AssignVariableOpassignvariableop_44_variable_16Identity_44:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_45AssignVariableOpassignvariableop_45_variable_15Identity_45:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_46AssignVariableOpassignvariableop_46_variable_14Identity_46:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_47AssignVariableOpassignvariableop_47_variable_13Identity_47:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_48AssignVariableOpassignvariableop_48_variable_12Identity_48:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_49AssignVariableOpassignvariableop_49_variable_11Identity_49:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_50AssignVariableOpassignvariableop_50_variable_10Identity_50:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_51AssignVariableOpassignvariableop_51_variable_9Identity_51:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_52AssignVariableOpassignvariableop_52_variable_8Identity_52:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_53AssignVariableOpassignvariableop_53_variable_7Identity_53:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_54AssignVariableOpassignvariableop_54_variable_6Identity_54:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_55AssignVariableOpassignvariableop_55_variable_5Identity_55:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_56AssignVariableOpassignvariableop_56_variable_4Identity_56:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_57AssignVariableOpassignvariableop_57_variable_3Identity_57:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_58AssignVariableOpassignvariableop_58_variable_2Identity_58:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_59AssignVariableOpassignvariableop_59_variable_1Identity_59:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_60AssignVariableOpassignvariableop_60_variableIdentity_60:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_61AssignVariableOpVassignvariableop_61_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_bias_1Identity_61:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_62AssignVariableOpVassignvariableop_62_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_bias_1Identity_62:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_63AssignVariableOp+assignvariableop_63_gru_2_gru_cell_kernel_1Identity_63:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_64AssignVariableOp)assignvariableop_64_gru_2_gru_cell_bias_1Identity_64:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_65AssignVariableOp&assignvariableop_65_mha_value_kernel_1Identity_65:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_66AssignVariableOpVassignvariableop_66_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_bias_1Identity_66:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_67AssignVariableOpVassignvariableop_67_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_bias_1Identity_67:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_68AssignVariableOpVassignvariableop_68_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_bias_1Identity_68:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_69AssignVariableOpVassignvariableop_69_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_bias_1Identity_69:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_70AssignVariableOpassignvariableop_70_bn_beta_1Identity_70:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_71AssignVariableOp1assignvariableop_71_mha_attention_output_kernel_1Identity_71:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_72AssignVariableOp"assignvariableop_72_dense_1_bias_1Identity_72:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_73AssignVariableOp#assignvariableop_73_conv1d_kernel_1Identity_73:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_74AssignVariableOpVassignvariableop_74_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_bias_1Identity_74:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_75AssignVariableOpVassignvariableop_75_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_bias_1Identity_75:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_76AssignVariableOpVassignvariableop_76_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_bias_1Identity_76:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_77IdentityRestoreV2:tensors:77"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_77AssignVariableOpXassignvariableop_77_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_kernel_1Identity_77:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_78IdentityRestoreV2:tensors:78"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_78AssignVariableOpassignvariableop_78_bn_gamma_1Identity_78:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_79IdentityRestoreV2:tensors:79"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_79AssignVariableOp$assignvariableop_79_mha_query_bias_1Identity_79:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_80IdentityRestoreV2:tensors:80"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_80AssignVariableOp$assignvariableop_80_mha_value_bias_1Identity_80:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_81IdentityRestoreV2:tensors:81"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_81AssignVariableOpXassignvariableop_81_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_kernel_1Identity_81:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_82IdentityRestoreV2:tensors:82"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_82AssignVariableOpXassignvariableop_82_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_kernel_1Identity_82:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_83IdentityRestoreV2:tensors:83"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_83AssignVariableOp$assignvariableop_83_mha_key_kernel_1Identity_83:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_84IdentityRestoreV2:tensors:84"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_84AssignVariableOp%assignvariableop_84_attn_norm_gamma_1Identity_84:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_85IdentityRestoreV2:tensors:85"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_85AssignVariableOpXassignvariableop_85_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_kernel_1Identity_85:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_86IdentityRestoreV2:tensors:86"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_86AssignVariableOpXassignvariableop_86_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_kernel_1Identity_86:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_87IdentityRestoreV2:tensors:87"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_87AssignVariableOpXassignvariableop_87_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_kernel_1Identity_87:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_88IdentityRestoreV2:tensors:88"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_88AssignVariableOp*assignvariableop_88_gru1_gru_cell_kernel_1Identity_88:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_89IdentityRestoreV2:tensors:89"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_89AssignVariableOp$assignvariableop_89_attn_norm_beta_1Identity_89:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_90IdentityRestoreV2:tensors:90"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_90AssignVariableOpXassignvariableop_90_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_kernel_1Identity_90:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_91IdentityRestoreV2:tensors:91"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_91AssignVariableOpXassignvariableop_91_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_kernel_1Identity_91:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_92IdentityRestoreV2:tensors:92"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_92AssignVariableOp/assignvariableop_92_mha_attention_output_bias_1Identity_92:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_93IdentityRestoreV2:tensors:93"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_93AssignVariableOp"assignvariableop_93_dense_kernel_1Identity_93:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_94IdentityRestoreV2:tensors:94"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_94AssignVariableOp$assignvariableop_94_dense_1_kernel_1Identity_94:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_95IdentityRestoreV2:tensors:95"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_95AssignVariableOp(assignvariableop_95_gru1_gru_cell_bias_1Identity_95:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_96IdentityRestoreV2:tensors:96"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_96AssignVariableOp&assignvariableop_96_mha_query_kernel_1Identity_96:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_97IdentityRestoreV2:tensors:97"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_97AssignVariableOp!assignvariableop_97_conv1d_bias_1Identity_97:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_98IdentityRestoreV2:tensors:98"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_98AssignVariableOpXassignvariableop_98_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_kernel_1Identity_98:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_99IdentityRestoreV2:tensors:99"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_99AssignVariableOpXassignvariableop_99_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_kernel_1Identity_99:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_100IdentityRestoreV2:tensors:100"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_100AssignVariableOpWassignvariableop_100_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_bias_1Identity_100:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_101IdentityRestoreV2:tensors:101"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_101AssignVariableOp5assignvariableop_101_gru1_gru_cell_recurrent_kernel_1Identity_101:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_102IdentityRestoreV2:tensors:102"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_102AssignVariableOp6assignvariableop_102_gru_2_gru_cell_recurrent_kernel_1Identity_102:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_103IdentityRestoreV2:tensors:103"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_103AssignVariableOp#assignvariableop_103_mha_key_bias_1Identity_103:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_104IdentityRestoreV2:tensors:104"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_104AssignVariableOp!assignvariableop_104_dense_bias_1Identity_104:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_105IdentityRestoreV2:tensors:105"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_105AssignVariableOp%assignvariableop_105_bn_moving_mean_1Identity_105:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0a
Identity_106IdentityRestoreV2:tensors:106"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_106AssignVariableOp)assignvariableop_106_bn_moving_variance_1Identity_106:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �
Identity_107Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99^NoOp"/device:CPU:0*
T0*
_output_shapes
: Y
Identity_108IdentityIdentity_107:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99*
_output_shapes
 "%
identity_108Identity_108:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2,
AssignVariableOp_100AssignVariableOp_1002,
AssignVariableOp_101AssignVariableOp_1012,
AssignVariableOp_102AssignVariableOp_1022,
AssignVariableOp_103AssignVariableOp_1032,
AssignVariableOp_104AssignVariableOp_1042,
AssignVariableOp_105AssignVariableOp_1052,
AssignVariableOp_106AssignVariableOp_1062*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_70AssignVariableOp_702*
AssignVariableOp_71AssignVariableOp_712*
AssignVariableOp_72AssignVariableOp_722*
AssignVariableOp_73AssignVariableOp_732*
AssignVariableOp_74AssignVariableOp_742*
AssignVariableOp_75AssignVariableOp_752*
AssignVariableOp_76AssignVariableOp_762*
AssignVariableOp_77AssignVariableOp_772*
AssignVariableOp_78AssignVariableOp_782*
AssignVariableOp_79AssignVariableOp_792(
AssignVariableOp_7AssignVariableOp_72*
AssignVariableOp_80AssignVariableOp_802*
AssignVariableOp_81AssignVariableOp_812*
AssignVariableOp_82AssignVariableOp_822*
AssignVariableOp_83AssignVariableOp_832*
AssignVariableOp_84AssignVariableOp_842*
AssignVariableOp_85AssignVariableOp_852*
AssignVariableOp_86AssignVariableOp_862*
AssignVariableOp_87AssignVariableOp_872*
AssignVariableOp_88AssignVariableOp_882*
AssignVariableOp_89AssignVariableOp_892(
AssignVariableOp_8AssignVariableOp_82*
AssignVariableOp_90AssignVariableOp_902*
AssignVariableOp_91AssignVariableOp_912*
AssignVariableOp_92AssignVariableOp_922*
AssignVariableOp_93AssignVariableOp_932*
AssignVariableOp_94AssignVariableOp_942*
AssignVariableOp_95AssignVariableOp_952*
AssignVariableOp_96AssignVariableOp_962*
AssignVariableOp_97AssignVariableOp_972*
AssignVariableOp_98AssignVariableOp_982*
AssignVariableOp_99AssignVariableOp_992(
AssignVariableOp_9AssignVariableOp_92$
AssignVariableOpAssignVariableOp:4k0
.
_user_specified_namebn/moving_variance_1:0j,
*
_user_specified_namebn/moving_mean_1:,i(
&
_user_specified_namedense/bias_1:.h*
(
_user_specified_namemha/key/bias_1:Ag=
;
_user_specified_name#!gru_2/gru_cell/recurrent_kernel_1:@f<
:
_user_specified_name" gru1/gru_cell/recurrent_kernel_1:be^
\
_user_specified_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1:dd`
^
_user_specified_nameFDtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1:dc`
^
_user_specified_nameFDtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1:-b)
'
_user_specified_nameconv1d/bias_1:2a.
,
_user_specified_namemha/query/kernel_1:4`0
.
_user_specified_namegru1/gru_cell/bias_1:0_,
*
_user_specified_namedense_1/kernel_1:.^*
(
_user_specified_namedense/kernel_1:;]7
5
_user_specified_namemha/attention_output/bias_1:d\`
^
_user_specified_nameFDtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1:d[`
^
_user_specified_nameFDtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1:0Z,
*
_user_specified_nameattn_norm/beta_1:6Y2
0
_user_specified_namegru1/gru_cell/kernel_1:dX`
^
_user_specified_nameFDtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1:dW`
^
_user_specified_nameFDtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1:dV`
^
_user_specified_nameFDtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1:1U-
+
_user_specified_nameattn_norm/gamma_1:0T,
*
_user_specified_namemha/key/kernel_1:dS`
^
_user_specified_nameFDtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1:dR`
^
_user_specified_nameFDtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1:0Q,
*
_user_specified_namemha/value/bias_1:0P,
*
_user_specified_namemha/query/bias_1:*O&
$
_user_specified_name
bn/gamma_1:dN`
^
_user_specified_nameFDtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1:bM^
\
_user_specified_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1:bL^
\
_user_specified_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1:bK^
\
_user_specified_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1:/J+
)
_user_specified_nameconv1d/kernel_1:.I*
(
_user_specified_namedense_1/bias_1:=H9
7
_user_specified_namemha/attention_output/kernel_1:)G%
#
_user_specified_name	bn/beta_1:bF^
\
_user_specified_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1:bE^
\
_user_specified_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1:bD^
\
_user_specified_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1:bC^
\
_user_specified_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1:2B.
,
_user_specified_namemha/value/kernel_1:5A1
/
_user_specified_namegru_2/gru_cell/bias_1:7@3
1
_user_specified_namegru_2/gru_cell/kernel_1:b?^
\
_user_specified_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1:b>^
\
_user_specified_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1:(=$
"
_user_specified_name
Variable:*<&
$
_user_specified_name
Variable_1:*;&
$
_user_specified_name
Variable_2:*:&
$
_user_specified_name
Variable_3:*9&
$
_user_specified_name
Variable_4:*8&
$
_user_specified_name
Variable_5:*7&
$
_user_specified_name
Variable_6:*6&
$
_user_specified_name
Variable_7:*5&
$
_user_specified_name
Variable_8:*4&
$
_user_specified_name
Variable_9:+3'
%
_user_specified_nameVariable_10:+2'
%
_user_specified_nameVariable_11:+1'
%
_user_specified_nameVariable_12:+0'
%
_user_specified_nameVariable_13:+/'
%
_user_specified_nameVariable_14:+.'
%
_user_specified_nameVariable_15:+-'
%
_user_specified_nameVariable_16:+,'
%
_user_specified_nameVariable_17:++'
%
_user_specified_nameVariable_18:+*'
%
_user_specified_nameVariable_19:+)'
%
_user_specified_nameVariable_20:+('
%
_user_specified_nameVariable_21:+''
%
_user_specified_nameVariable_22:+&'
%
_user_specified_nameVariable_23:+%'
%
_user_specified_nameVariable_24:+$'
%
_user_specified_nameVariable_25:+#'
%
_user_specified_nameVariable_26:+"'
%
_user_specified_nameVariable_27:+!'
%
_user_specified_nameVariable_28:+ '
%
_user_specified_nameVariable_29:+'
%
_user_specified_nameVariable_30:+'
%
_user_specified_nameVariable_31:+'
%
_user_specified_nameVariable_32:+'
%
_user_specified_nameVariable_33:+'
%
_user_specified_nameVariable_34:+'
%
_user_specified_nameVariable_35:+'
%
_user_specified_nameVariable_36:+'
%
_user_specified_nameVariable_37:+'
%
_user_specified_nameVariable_38:+'
%
_user_specified_nameVariable_39:+'
%
_user_specified_nameVariable_40:+'
%
_user_specified_nameVariable_41:+'
%
_user_specified_nameVariable_42:+'
%
_user_specified_nameVariable_43:+'
%
_user_specified_nameVariable_44:+'
%
_user_specified_nameVariable_45:+'
%
_user_specified_nameVariable_46:+'
%
_user_specified_nameVariable_47:+'
%
_user_specified_nameVariable_48:+'
%
_user_specified_nameVariable_49:+'
%
_user_specified_nameVariable_50:+
'
%
_user_specified_nameVariable_51:+	'
%
_user_specified_nameVariable_52:+'
%
_user_specified_nameVariable_53:+'
%
_user_specified_nameVariable_54:+'
%
_user_specified_nameVariable_55:+'
%
_user_specified_nameVariable_56:+'
%
_user_specified_nameVariable_57:+'
%
_user_specified_nameVariable_58:+'
%
_user_specified_nameVariable_59:+'
%
_user_specified_nameVariable_60:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�$
�
+__inference_signature_wrapper___call___5131
input_sequence
unknown:+@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:@@
	unknown_8:@
	unknown_9:@@

unknown_10:@ 

unknown_11:@@

unknown_12:@ 

unknown_13:@@

unknown_14:@ 

unknown_15:@@

unknown_16:@ 

unknown_17:@@

unknown_18:@ 

unknown_19:@@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:	@�

unknown_26:	@�

unknown_27:	�

unknown_28:@0

unknown_29:0

unknown_30:0 

unknown_31: 

unknown_32:  

unknown_33: 

unknown_34:  

unknown_35: 

unknown_36:  

unknown_37: 

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_sequenceunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44*:
Tin3
12/*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������L*P
_read_only_resource_inputs2
0.	
 !"#$%&'()*+,-.*5
config_proto%#

CPU

GPU2*0J 8� �J *"
fR
__inference___call___4936s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������L<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapesu
s:���������L+: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:$. 

_user_specified_name5127:$- 

_user_specified_name5125:$, 

_user_specified_name5123:$+ 

_user_specified_name5121:$* 

_user_specified_name5119:$) 

_user_specified_name5117:$( 

_user_specified_name5115:$' 

_user_specified_name5113:$& 

_user_specified_name5111:$% 

_user_specified_name5109:$$ 

_user_specified_name5107:$# 

_user_specified_name5105:$" 

_user_specified_name5103:$! 

_user_specified_name5101:$  

_user_specified_name5099:$ 

_user_specified_name5097:$ 

_user_specified_name5095:$ 

_user_specified_name5093:$ 

_user_specified_name5091:$ 

_user_specified_name5089:$ 

_user_specified_name5087:$ 

_user_specified_name5085:$ 

_user_specified_name5083:$ 

_user_specified_name5081:$ 

_user_specified_name5079:$ 

_user_specified_name5077:$ 

_user_specified_name5075:$ 

_user_specified_name5073:$ 

_user_specified_name5071:$ 

_user_specified_name5069:$ 

_user_specified_name5067:$ 

_user_specified_name5065:$ 

_user_specified_name5063:$ 

_user_specified_name5061:$ 

_user_specified_name5059:$ 

_user_specified_name5057:$
 

_user_specified_name5055:$	 

_user_specified_name5053:$ 

_user_specified_name5051:$ 

_user_specified_name5049:$ 

_user_specified_name5047:$ 

_user_specified_name5045:$ 

_user_specified_name5043:$ 

_user_specified_name5041:$ 

_user_specified_name5039:$ 

_user_specified_name5037:[ W
+
_output_shapes
:���������L+
(
_user_specified_nameinput_sequence
�$
�
+__inference_signature_wrapper___call___5034
input_sequence
unknown:+@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:@@
	unknown_8:@
	unknown_9:@@

unknown_10:@ 

unknown_11:@@

unknown_12:@ 

unknown_13:@@

unknown_14:@ 

unknown_15:@@

unknown_16:@ 

unknown_17:@@

unknown_18:@ 

unknown_19:@@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:	@�

unknown_26:	@�

unknown_27:	�

unknown_28:@0

unknown_29:0

unknown_30:0 

unknown_31: 

unknown_32:  

unknown_33: 

unknown_34:  

unknown_35: 

unknown_36:  

unknown_37: 

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_sequenceunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44*:
Tin3
12/*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������L*P
_read_only_resource_inputs2
0.	
 !"#$%&'()*+,-.*5
config_proto%#

CPU

GPU2*0J 8� �J *"
fR
__inference___call___4936s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������L<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapesu
s:���������L+: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:$. 

_user_specified_name5030:$- 

_user_specified_name5028:$, 

_user_specified_name5026:$+ 

_user_specified_name5024:$* 

_user_specified_name5022:$) 

_user_specified_name5020:$( 

_user_specified_name5018:$' 

_user_specified_name5016:$& 

_user_specified_name5014:$% 

_user_specified_name5012:$$ 

_user_specified_name5010:$# 

_user_specified_name5008:$" 

_user_specified_name5006:$! 

_user_specified_name5004:$  

_user_specified_name5002:$ 

_user_specified_name5000:$ 

_user_specified_name4998:$ 

_user_specified_name4996:$ 

_user_specified_name4994:$ 

_user_specified_name4992:$ 

_user_specified_name4990:$ 

_user_specified_name4988:$ 

_user_specified_name4986:$ 

_user_specified_name4984:$ 

_user_specified_name4982:$ 

_user_specified_name4980:$ 

_user_specified_name4978:$ 

_user_specified_name4976:$ 

_user_specified_name4974:$ 

_user_specified_name4972:$ 

_user_specified_name4970:$ 

_user_specified_name4968:$ 

_user_specified_name4966:$ 

_user_specified_name4964:$ 

_user_specified_name4962:$ 

_user_specified_name4960:$
 

_user_specified_name4958:$	 

_user_specified_name4956:$ 

_user_specified_name4954:$ 

_user_specified_name4952:$ 

_user_specified_name4950:$ 

_user_specified_name4948:$ 

_user_specified_name4946:$ 

_user_specified_name4944:$ 

_user_specified_name4942:$ 

_user_specified_name4940:[ W
+
_output_shapes
:���������L+
(
_user_specified_nameinput_sequence
��
�f
__inference__traced_save_6041
file_prefix8
"read_disablecopyonread_variable_60:+@2
$read_1_disablecopyonread_variable_59:@:
$read_2_disablecopyonread_variable_58:@@2
$read_3_disablecopyonread_variable_57:@2
$read_4_disablecopyonread_variable_56:	:
$read_5_disablecopyonread_variable_55:@@2
$read_6_disablecopyonread_variable_54:@2
$read_7_disablecopyonread_variable_53:	:
$read_8_disablecopyonread_variable_52:@@2
$read_9_disablecopyonread_variable_51:@3
%read_10_disablecopyonread_variable_50:	;
%read_11_disablecopyonread_variable_49:@@3
%read_12_disablecopyonread_variable_48:@3
%read_13_disablecopyonread_variable_47:	;
%read_14_disablecopyonread_variable_46:@@3
%read_15_disablecopyonread_variable_45:@3
%read_16_disablecopyonread_variable_44:	;
%read_17_disablecopyonread_variable_43:@@3
%read_18_disablecopyonread_variable_42:@3
%read_19_disablecopyonread_variable_41:	;
%read_20_disablecopyonread_variable_40:@@3
%read_21_disablecopyonread_variable_39:@3
%read_22_disablecopyonread_variable_38:	;
%read_23_disablecopyonread_variable_37:@@3
%read_24_disablecopyonread_variable_36:@3
%read_25_disablecopyonread_variable_35:	;
%read_26_disablecopyonread_variable_34:@@3
%read_27_disablecopyonread_variable_33:@3
%read_28_disablecopyonread_variable_32:	;
%read_29_disablecopyonread_variable_31:@@3
%read_30_disablecopyonread_variable_30:@3
%read_31_disablecopyonread_variable_29:	3
%read_32_disablecopyonread_variable_28:@3
%read_33_disablecopyonread_variable_27:@3
%read_34_disablecopyonread_variable_26:@3
%read_35_disablecopyonread_variable_25:@3
%read_36_disablecopyonread_variable_24:	8
%read_37_disablecopyonread_variable_23:	@�8
%read_38_disablecopyonread_variable_22:	@�8
%read_39_disablecopyonread_variable_21:	�3
%read_40_disablecopyonread_variable_20:	3
%read_41_disablecopyonread_variable_19:	7
%read_42_disablecopyonread_variable_18:@07
%read_43_disablecopyonread_variable_17:07
%read_44_disablecopyonread_variable_16:03
%read_45_disablecopyonread_variable_15:	3
%read_46_disablecopyonread_variable_14:	;
%read_47_disablecopyonread_variable_13: 7
%read_48_disablecopyonread_variable_12: ;
%read_49_disablecopyonread_variable_11: 7
%read_50_disablecopyonread_variable_10: :
$read_51_disablecopyonread_variable_9: 6
$read_52_disablecopyonread_variable_8: :
$read_53_disablecopyonread_variable_7: 2
$read_54_disablecopyonread_variable_6:2
$read_55_disablecopyonread_variable_5:2
$read_56_disablecopyonread_variable_4:6
$read_57_disablecopyonread_variable_3:2
$read_58_disablecopyonread_variable_2:6
$read_59_disablecopyonread_variable_1:0
"read_60_disablecopyonread_variable:j
\read_61_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_bias_1:@j
\read_62_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_bias_1:@C
1read_63_disablecopyonread_gru_2_gru_cell_kernel_1:@0A
/read_64_disablecopyonread_gru_2_gru_cell_bias_1:0B
,read_65_disablecopyonread_mha_value_kernel_1: j
\read_66_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_bias_1:@j
\read_67_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_bias_1:@j
\read_68_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_bias_1:@j
\read_69_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_bias_1:@1
#read_70_disablecopyonread_bn_beta_1:@M
7read_71_disablecopyonread_mha_attention_output_kernel_1: 6
(read_72_disablecopyonread_dense_1_bias_1:?
)read_73_disablecopyonread_conv1d_kernel_1:+@j
\read_74_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_bias_1:@j
\read_75_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_bias_1:@j
\read_76_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_bias_1:@t
^read_77_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_kernel_1:@@2
$read_78_disablecopyonread_bn_gamma_1:@<
*read_79_disablecopyonread_mha_query_bias_1: <
*read_80_disablecopyonread_mha_value_bias_1: t
^read_81_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_kernel_1:@@t
^read_82_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_kernel_1:@@@
*read_83_disablecopyonread_mha_key_kernel_1: 9
+read_84_disablecopyonread_attn_norm_gamma_1:t
^read_85_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_kernel_1:@@t
^read_86_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_kernel_1:@@t
^read_87_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_kernel_1:@@C
0read_88_disablecopyonread_gru1_gru_cell_kernel_1:	@�8
*read_89_disablecopyonread_attn_norm_beta_1:t
^read_90_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_kernel_1:@@t
^read_91_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_kernel_1:@@C
5read_92_disablecopyonread_mha_attention_output_bias_1::
(read_93_disablecopyonread_dense_kernel_1:<
*read_94_disablecopyonread_dense_1_kernel_1:A
.read_95_disablecopyonread_gru1_gru_cell_bias_1:	�B
,read_96_disablecopyonread_mha_query_kernel_1: 5
'read_97_disablecopyonread_conv1d_bias_1:@t
^read_98_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_kernel_1:@@t
^read_99_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_kernel_1:@@k
]read_100_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_bias_1:@N
;read_101_disablecopyonread_gru1_gru_cell_recurrent_kernel_1:	@�N
<read_102_disablecopyonread_gru_2_gru_cell_recurrent_kernel_1:0;
)read_103_disablecopyonread_mha_key_bias_1: 5
'read_104_disablecopyonread_dense_bias_1:9
+read_105_disablecopyonread_bn_moving_mean_1:@=
/read_106_disablecopyonread_bn_moving_variance_1:@
savev2_const
identity_215��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_10/DisableCopyOnRead�Read_10/ReadVariableOp�Read_100/DisableCopyOnRead�Read_100/ReadVariableOp�Read_101/DisableCopyOnRead�Read_101/ReadVariableOp�Read_102/DisableCopyOnRead�Read_102/ReadVariableOp�Read_103/DisableCopyOnRead�Read_103/ReadVariableOp�Read_104/DisableCopyOnRead�Read_104/ReadVariableOp�Read_105/DisableCopyOnRead�Read_105/ReadVariableOp�Read_106/DisableCopyOnRead�Read_106/ReadVariableOp�Read_11/DisableCopyOnRead�Read_11/ReadVariableOp�Read_12/DisableCopyOnRead�Read_12/ReadVariableOp�Read_13/DisableCopyOnRead�Read_13/ReadVariableOp�Read_14/DisableCopyOnRead�Read_14/ReadVariableOp�Read_15/DisableCopyOnRead�Read_15/ReadVariableOp�Read_16/DisableCopyOnRead�Read_16/ReadVariableOp�Read_17/DisableCopyOnRead�Read_17/ReadVariableOp�Read_18/DisableCopyOnRead�Read_18/ReadVariableOp�Read_19/DisableCopyOnRead�Read_19/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_20/DisableCopyOnRead�Read_20/ReadVariableOp�Read_21/DisableCopyOnRead�Read_21/ReadVariableOp�Read_22/DisableCopyOnRead�Read_22/ReadVariableOp�Read_23/DisableCopyOnRead�Read_23/ReadVariableOp�Read_24/DisableCopyOnRead�Read_24/ReadVariableOp�Read_25/DisableCopyOnRead�Read_25/ReadVariableOp�Read_26/DisableCopyOnRead�Read_26/ReadVariableOp�Read_27/DisableCopyOnRead�Read_27/ReadVariableOp�Read_28/DisableCopyOnRead�Read_28/ReadVariableOp�Read_29/DisableCopyOnRead�Read_29/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_30/DisableCopyOnRead�Read_30/ReadVariableOp�Read_31/DisableCopyOnRead�Read_31/ReadVariableOp�Read_32/DisableCopyOnRead�Read_32/ReadVariableOp�Read_33/DisableCopyOnRead�Read_33/ReadVariableOp�Read_34/DisableCopyOnRead�Read_34/ReadVariableOp�Read_35/DisableCopyOnRead�Read_35/ReadVariableOp�Read_36/DisableCopyOnRead�Read_36/ReadVariableOp�Read_37/DisableCopyOnRead�Read_37/ReadVariableOp�Read_38/DisableCopyOnRead�Read_38/ReadVariableOp�Read_39/DisableCopyOnRead�Read_39/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_40/DisableCopyOnRead�Read_40/ReadVariableOp�Read_41/DisableCopyOnRead�Read_41/ReadVariableOp�Read_42/DisableCopyOnRead�Read_42/ReadVariableOp�Read_43/DisableCopyOnRead�Read_43/ReadVariableOp�Read_44/DisableCopyOnRead�Read_44/ReadVariableOp�Read_45/DisableCopyOnRead�Read_45/ReadVariableOp�Read_46/DisableCopyOnRead�Read_46/ReadVariableOp�Read_47/DisableCopyOnRead�Read_47/ReadVariableOp�Read_48/DisableCopyOnRead�Read_48/ReadVariableOp�Read_49/DisableCopyOnRead�Read_49/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_50/DisableCopyOnRead�Read_50/ReadVariableOp�Read_51/DisableCopyOnRead�Read_51/ReadVariableOp�Read_52/DisableCopyOnRead�Read_52/ReadVariableOp�Read_53/DisableCopyOnRead�Read_53/ReadVariableOp�Read_54/DisableCopyOnRead�Read_54/ReadVariableOp�Read_55/DisableCopyOnRead�Read_55/ReadVariableOp�Read_56/DisableCopyOnRead�Read_56/ReadVariableOp�Read_57/DisableCopyOnRead�Read_57/ReadVariableOp�Read_58/DisableCopyOnRead�Read_58/ReadVariableOp�Read_59/DisableCopyOnRead�Read_59/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOp�Read_60/DisableCopyOnRead�Read_60/ReadVariableOp�Read_61/DisableCopyOnRead�Read_61/ReadVariableOp�Read_62/DisableCopyOnRead�Read_62/ReadVariableOp�Read_63/DisableCopyOnRead�Read_63/ReadVariableOp�Read_64/DisableCopyOnRead�Read_64/ReadVariableOp�Read_65/DisableCopyOnRead�Read_65/ReadVariableOp�Read_66/DisableCopyOnRead�Read_66/ReadVariableOp�Read_67/DisableCopyOnRead�Read_67/ReadVariableOp�Read_68/DisableCopyOnRead�Read_68/ReadVariableOp�Read_69/DisableCopyOnRead�Read_69/ReadVariableOp�Read_7/DisableCopyOnRead�Read_7/ReadVariableOp�Read_70/DisableCopyOnRead�Read_70/ReadVariableOp�Read_71/DisableCopyOnRead�Read_71/ReadVariableOp�Read_72/DisableCopyOnRead�Read_72/ReadVariableOp�Read_73/DisableCopyOnRead�Read_73/ReadVariableOp�Read_74/DisableCopyOnRead�Read_74/ReadVariableOp�Read_75/DisableCopyOnRead�Read_75/ReadVariableOp�Read_76/DisableCopyOnRead�Read_76/ReadVariableOp�Read_77/DisableCopyOnRead�Read_77/ReadVariableOp�Read_78/DisableCopyOnRead�Read_78/ReadVariableOp�Read_79/DisableCopyOnRead�Read_79/ReadVariableOp�Read_8/DisableCopyOnRead�Read_8/ReadVariableOp�Read_80/DisableCopyOnRead�Read_80/ReadVariableOp�Read_81/DisableCopyOnRead�Read_81/ReadVariableOp�Read_82/DisableCopyOnRead�Read_82/ReadVariableOp�Read_83/DisableCopyOnRead�Read_83/ReadVariableOp�Read_84/DisableCopyOnRead�Read_84/ReadVariableOp�Read_85/DisableCopyOnRead�Read_85/ReadVariableOp�Read_86/DisableCopyOnRead�Read_86/ReadVariableOp�Read_87/DisableCopyOnRead�Read_87/ReadVariableOp�Read_88/DisableCopyOnRead�Read_88/ReadVariableOp�Read_89/DisableCopyOnRead�Read_89/ReadVariableOp�Read_9/DisableCopyOnRead�Read_9/ReadVariableOp�Read_90/DisableCopyOnRead�Read_90/ReadVariableOp�Read_91/DisableCopyOnRead�Read_91/ReadVariableOp�Read_92/DisableCopyOnRead�Read_92/ReadVariableOp�Read_93/DisableCopyOnRead�Read_93/ReadVariableOp�Read_94/DisableCopyOnRead�Read_94/ReadVariableOp�Read_95/DisableCopyOnRead�Read_95/ReadVariableOp�Read_96/DisableCopyOnRead�Read_96/ReadVariableOp�Read_97/DisableCopyOnRead�Read_97/ReadVariableOp�Read_98/DisableCopyOnRead�Read_98/ReadVariableOp�Read_99/DisableCopyOnRead�Read_99/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: e
Read/DisableCopyOnReadDisableCopyOnRead"read_disablecopyonread_variable_60*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp"read_disablecopyonread_variable_60^Read/DisableCopyOnRead*"
_output_shapes
:+@*
dtype0^
IdentityIdentityRead/ReadVariableOp:value:0*
T0*"
_output_shapes
:+@e

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*"
_output_shapes
:+@i
Read_1/DisableCopyOnReadDisableCopyOnRead$read_1_disablecopyonread_variable_59*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp$read_1_disablecopyonread_variable_59^Read_1/DisableCopyOnRead*
_output_shapes
:@*
dtype0Z

Identity_2IdentityRead_1/ReadVariableOp:value:0*
T0*
_output_shapes
:@_

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
:@i
Read_2/DisableCopyOnReadDisableCopyOnRead$read_2_disablecopyonread_variable_58*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp$read_2_disablecopyonread_variable_58^Read_2/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0b

Identity_4IdentityRead_2/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@g

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@i
Read_3/DisableCopyOnReadDisableCopyOnRead$read_3_disablecopyonread_variable_57*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp$read_3_disablecopyonread_variable_57^Read_3/DisableCopyOnRead*
_output_shapes
:@*
dtype0Z

Identity_6IdentityRead_3/ReadVariableOp:value:0*
T0*
_output_shapes
:@_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:@i
Read_4/DisableCopyOnReadDisableCopyOnRead$read_4_disablecopyonread_variable_56*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp$read_4_disablecopyonread_variable_56^Read_4/DisableCopyOnRead*
_output_shapes
:*
dtype0	Z

Identity_8IdentityRead_4/ReadVariableOp:value:0*
T0	*
_output_shapes
:_

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0	*
_output_shapes
:i
Read_5/DisableCopyOnReadDisableCopyOnRead$read_5_disablecopyonread_variable_55*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp$read_5_disablecopyonread_variable_55^Read_5/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0c
Identity_10IdentityRead_5/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@i
Read_6/DisableCopyOnReadDisableCopyOnRead$read_6_disablecopyonread_variable_54*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp$read_6_disablecopyonread_variable_54^Read_6/DisableCopyOnRead*
_output_shapes
:@*
dtype0[
Identity_12IdentityRead_6/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
:@i
Read_7/DisableCopyOnReadDisableCopyOnRead$read_7_disablecopyonread_variable_53*
_output_shapes
 �
Read_7/ReadVariableOpReadVariableOp$read_7_disablecopyonread_variable_53^Read_7/DisableCopyOnRead*
_output_shapes
:*
dtype0	[
Identity_14IdentityRead_7/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0	*
_output_shapes
:i
Read_8/DisableCopyOnReadDisableCopyOnRead$read_8_disablecopyonread_variable_52*
_output_shapes
 �
Read_8/ReadVariableOpReadVariableOp$read_8_disablecopyonread_variable_52^Read_8/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0c
Identity_16IdentityRead_8/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@i
Read_9/DisableCopyOnReadDisableCopyOnRead$read_9_disablecopyonread_variable_51*
_output_shapes
 �
Read_9/ReadVariableOpReadVariableOp$read_9_disablecopyonread_variable_51^Read_9/DisableCopyOnRead*
_output_shapes
:@*
dtype0[
Identity_18IdentityRead_9/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_10/DisableCopyOnReadDisableCopyOnRead%read_10_disablecopyonread_variable_50*
_output_shapes
 �
Read_10/ReadVariableOpReadVariableOp%read_10_disablecopyonread_variable_50^Read_10/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_20IdentityRead_10/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_11/DisableCopyOnReadDisableCopyOnRead%read_11_disablecopyonread_variable_49*
_output_shapes
 �
Read_11/ReadVariableOpReadVariableOp%read_11_disablecopyonread_variable_49^Read_11/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_22IdentityRead_11/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_12/DisableCopyOnReadDisableCopyOnRead%read_12_disablecopyonread_variable_48*
_output_shapes
 �
Read_12/ReadVariableOpReadVariableOp%read_12_disablecopyonread_variable_48^Read_12/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_24IdentityRead_12/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_13/DisableCopyOnReadDisableCopyOnRead%read_13_disablecopyonread_variable_47*
_output_shapes
 �
Read_13/ReadVariableOpReadVariableOp%read_13_disablecopyonread_variable_47^Read_13/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_26IdentityRead_13/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_14/DisableCopyOnReadDisableCopyOnRead%read_14_disablecopyonread_variable_46*
_output_shapes
 �
Read_14/ReadVariableOpReadVariableOp%read_14_disablecopyonread_variable_46^Read_14/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_28IdentityRead_14/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_15/DisableCopyOnReadDisableCopyOnRead%read_15_disablecopyonread_variable_45*
_output_shapes
 �
Read_15/ReadVariableOpReadVariableOp%read_15_disablecopyonread_variable_45^Read_15/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_30IdentityRead_15/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_16/DisableCopyOnReadDisableCopyOnRead%read_16_disablecopyonread_variable_44*
_output_shapes
 �
Read_16/ReadVariableOpReadVariableOp%read_16_disablecopyonread_variable_44^Read_16/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_32IdentityRead_16/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_17/DisableCopyOnReadDisableCopyOnRead%read_17_disablecopyonread_variable_43*
_output_shapes
 �
Read_17/ReadVariableOpReadVariableOp%read_17_disablecopyonread_variable_43^Read_17/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_34IdentityRead_17/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_35IdentityIdentity_34:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_18/DisableCopyOnReadDisableCopyOnRead%read_18_disablecopyonread_variable_42*
_output_shapes
 �
Read_18/ReadVariableOpReadVariableOp%read_18_disablecopyonread_variable_42^Read_18/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_36IdentityRead_18/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_19/DisableCopyOnReadDisableCopyOnRead%read_19_disablecopyonread_variable_41*
_output_shapes
 �
Read_19/ReadVariableOpReadVariableOp%read_19_disablecopyonread_variable_41^Read_19/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_38IdentityRead_19/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_20/DisableCopyOnReadDisableCopyOnRead%read_20_disablecopyonread_variable_40*
_output_shapes
 �
Read_20/ReadVariableOpReadVariableOp%read_20_disablecopyonread_variable_40^Read_20/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_40IdentityRead_20/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_21/DisableCopyOnReadDisableCopyOnRead%read_21_disablecopyonread_variable_39*
_output_shapes
 �
Read_21/ReadVariableOpReadVariableOp%read_21_disablecopyonread_variable_39^Read_21/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_42IdentityRead_21/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_43IdentityIdentity_42:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_22/DisableCopyOnReadDisableCopyOnRead%read_22_disablecopyonread_variable_38*
_output_shapes
 �
Read_22/ReadVariableOpReadVariableOp%read_22_disablecopyonread_variable_38^Read_22/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_44IdentityRead_22/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_45IdentityIdentity_44:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_23/DisableCopyOnReadDisableCopyOnRead%read_23_disablecopyonread_variable_37*
_output_shapes
 �
Read_23/ReadVariableOpReadVariableOp%read_23_disablecopyonread_variable_37^Read_23/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_46IdentityRead_23/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_47IdentityIdentity_46:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_24/DisableCopyOnReadDisableCopyOnRead%read_24_disablecopyonread_variable_36*
_output_shapes
 �
Read_24/ReadVariableOpReadVariableOp%read_24_disablecopyonread_variable_36^Read_24/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_48IdentityRead_24/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_49IdentityIdentity_48:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_25/DisableCopyOnReadDisableCopyOnRead%read_25_disablecopyonread_variable_35*
_output_shapes
 �
Read_25/ReadVariableOpReadVariableOp%read_25_disablecopyonread_variable_35^Read_25/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_50IdentityRead_25/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_51IdentityIdentity_50:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_26/DisableCopyOnReadDisableCopyOnRead%read_26_disablecopyonread_variable_34*
_output_shapes
 �
Read_26/ReadVariableOpReadVariableOp%read_26_disablecopyonread_variable_34^Read_26/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_52IdentityRead_26/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_53IdentityIdentity_52:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_27/DisableCopyOnReadDisableCopyOnRead%read_27_disablecopyonread_variable_33*
_output_shapes
 �
Read_27/ReadVariableOpReadVariableOp%read_27_disablecopyonread_variable_33^Read_27/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_54IdentityRead_27/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_55IdentityIdentity_54:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_28/DisableCopyOnReadDisableCopyOnRead%read_28_disablecopyonread_variable_32*
_output_shapes
 �
Read_28/ReadVariableOpReadVariableOp%read_28_disablecopyonread_variable_32^Read_28/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_56IdentityRead_28/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_57IdentityIdentity_56:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_29/DisableCopyOnReadDisableCopyOnRead%read_29_disablecopyonread_variable_31*
_output_shapes
 �
Read_29/ReadVariableOpReadVariableOp%read_29_disablecopyonread_variable_31^Read_29/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0d
Identity_58IdentityRead_29/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@i
Identity_59IdentityIdentity_58:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@k
Read_30/DisableCopyOnReadDisableCopyOnRead%read_30_disablecopyonread_variable_30*
_output_shapes
 �
Read_30/ReadVariableOpReadVariableOp%read_30_disablecopyonread_variable_30^Read_30/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_60IdentityRead_30/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_61IdentityIdentity_60:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_31/DisableCopyOnReadDisableCopyOnRead%read_31_disablecopyonread_variable_29*
_output_shapes
 �
Read_31/ReadVariableOpReadVariableOp%read_31_disablecopyonread_variable_29^Read_31/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_62IdentityRead_31/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_63IdentityIdentity_62:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_32/DisableCopyOnReadDisableCopyOnRead%read_32_disablecopyonread_variable_28*
_output_shapes
 �
Read_32/ReadVariableOpReadVariableOp%read_32_disablecopyonread_variable_28^Read_32/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_64IdentityRead_32/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_65IdentityIdentity_64:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_33/DisableCopyOnReadDisableCopyOnRead%read_33_disablecopyonread_variable_27*
_output_shapes
 �
Read_33/ReadVariableOpReadVariableOp%read_33_disablecopyonread_variable_27^Read_33/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_66IdentityRead_33/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_67IdentityIdentity_66:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_34/DisableCopyOnReadDisableCopyOnRead%read_34_disablecopyonread_variable_26*
_output_shapes
 �
Read_34/ReadVariableOpReadVariableOp%read_34_disablecopyonread_variable_26^Read_34/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_68IdentityRead_34/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_69IdentityIdentity_68:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_35/DisableCopyOnReadDisableCopyOnRead%read_35_disablecopyonread_variable_25*
_output_shapes
 �
Read_35/ReadVariableOpReadVariableOp%read_35_disablecopyonread_variable_25^Read_35/DisableCopyOnRead*
_output_shapes
:@*
dtype0\
Identity_70IdentityRead_35/ReadVariableOp:value:0*
T0*
_output_shapes
:@a
Identity_71IdentityIdentity_70:output:0"/device:CPU:0*
T0*
_output_shapes
:@k
Read_36/DisableCopyOnReadDisableCopyOnRead%read_36_disablecopyonread_variable_24*
_output_shapes
 �
Read_36/ReadVariableOpReadVariableOp%read_36_disablecopyonread_variable_24^Read_36/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_72IdentityRead_36/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_73IdentityIdentity_72:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_37/DisableCopyOnReadDisableCopyOnRead%read_37_disablecopyonread_variable_23*
_output_shapes
 �
Read_37/ReadVariableOpReadVariableOp%read_37_disablecopyonread_variable_23^Read_37/DisableCopyOnRead*
_output_shapes
:	@�*
dtype0a
Identity_74IdentityRead_37/ReadVariableOp:value:0*
T0*
_output_shapes
:	@�f
Identity_75IdentityIdentity_74:output:0"/device:CPU:0*
T0*
_output_shapes
:	@�k
Read_38/DisableCopyOnReadDisableCopyOnRead%read_38_disablecopyonread_variable_22*
_output_shapes
 �
Read_38/ReadVariableOpReadVariableOp%read_38_disablecopyonread_variable_22^Read_38/DisableCopyOnRead*
_output_shapes
:	@�*
dtype0a
Identity_76IdentityRead_38/ReadVariableOp:value:0*
T0*
_output_shapes
:	@�f
Identity_77IdentityIdentity_76:output:0"/device:CPU:0*
T0*
_output_shapes
:	@�k
Read_39/DisableCopyOnReadDisableCopyOnRead%read_39_disablecopyonread_variable_21*
_output_shapes
 �
Read_39/ReadVariableOpReadVariableOp%read_39_disablecopyonread_variable_21^Read_39/DisableCopyOnRead*
_output_shapes
:	�*
dtype0a
Identity_78IdentityRead_39/ReadVariableOp:value:0*
T0*
_output_shapes
:	�f
Identity_79IdentityIdentity_78:output:0"/device:CPU:0*
T0*
_output_shapes
:	�k
Read_40/DisableCopyOnReadDisableCopyOnRead%read_40_disablecopyonread_variable_20*
_output_shapes
 �
Read_40/ReadVariableOpReadVariableOp%read_40_disablecopyonread_variable_20^Read_40/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_80IdentityRead_40/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_81IdentityIdentity_80:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_41/DisableCopyOnReadDisableCopyOnRead%read_41_disablecopyonread_variable_19*
_output_shapes
 �
Read_41/ReadVariableOpReadVariableOp%read_41_disablecopyonread_variable_19^Read_41/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_82IdentityRead_41/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_83IdentityIdentity_82:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_42/DisableCopyOnReadDisableCopyOnRead%read_42_disablecopyonread_variable_18*
_output_shapes
 �
Read_42/ReadVariableOpReadVariableOp%read_42_disablecopyonread_variable_18^Read_42/DisableCopyOnRead*
_output_shapes

:@0*
dtype0`
Identity_84IdentityRead_42/ReadVariableOp:value:0*
T0*
_output_shapes

:@0e
Identity_85IdentityIdentity_84:output:0"/device:CPU:0*
T0*
_output_shapes

:@0k
Read_43/DisableCopyOnReadDisableCopyOnRead%read_43_disablecopyonread_variable_17*
_output_shapes
 �
Read_43/ReadVariableOpReadVariableOp%read_43_disablecopyonread_variable_17^Read_43/DisableCopyOnRead*
_output_shapes

:0*
dtype0`
Identity_86IdentityRead_43/ReadVariableOp:value:0*
T0*
_output_shapes

:0e
Identity_87IdentityIdentity_86:output:0"/device:CPU:0*
T0*
_output_shapes

:0k
Read_44/DisableCopyOnReadDisableCopyOnRead%read_44_disablecopyonread_variable_16*
_output_shapes
 �
Read_44/ReadVariableOpReadVariableOp%read_44_disablecopyonread_variable_16^Read_44/DisableCopyOnRead*
_output_shapes

:0*
dtype0`
Identity_88IdentityRead_44/ReadVariableOp:value:0*
T0*
_output_shapes

:0e
Identity_89IdentityIdentity_88:output:0"/device:CPU:0*
T0*
_output_shapes

:0k
Read_45/DisableCopyOnReadDisableCopyOnRead%read_45_disablecopyonread_variable_15*
_output_shapes
 �
Read_45/ReadVariableOpReadVariableOp%read_45_disablecopyonread_variable_15^Read_45/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_90IdentityRead_45/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_91IdentityIdentity_90:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_46/DisableCopyOnReadDisableCopyOnRead%read_46_disablecopyonread_variable_14*
_output_shapes
 �
Read_46/ReadVariableOpReadVariableOp%read_46_disablecopyonread_variable_14^Read_46/DisableCopyOnRead*
_output_shapes
:*
dtype0	\
Identity_92IdentityRead_46/ReadVariableOp:value:0*
T0	*
_output_shapes
:a
Identity_93IdentityIdentity_92:output:0"/device:CPU:0*
T0	*
_output_shapes
:k
Read_47/DisableCopyOnReadDisableCopyOnRead%read_47_disablecopyonread_variable_13*
_output_shapes
 �
Read_47/ReadVariableOpReadVariableOp%read_47_disablecopyonread_variable_13^Read_47/DisableCopyOnRead*"
_output_shapes
: *
dtype0d
Identity_94IdentityRead_47/ReadVariableOp:value:0*
T0*"
_output_shapes
: i
Identity_95IdentityIdentity_94:output:0"/device:CPU:0*
T0*"
_output_shapes
: k
Read_48/DisableCopyOnReadDisableCopyOnRead%read_48_disablecopyonread_variable_12*
_output_shapes
 �
Read_48/ReadVariableOpReadVariableOp%read_48_disablecopyonread_variable_12^Read_48/DisableCopyOnRead*
_output_shapes

: *
dtype0`
Identity_96IdentityRead_48/ReadVariableOp:value:0*
T0*
_output_shapes

: e
Identity_97IdentityIdentity_96:output:0"/device:CPU:0*
T0*
_output_shapes

: k
Read_49/DisableCopyOnReadDisableCopyOnRead%read_49_disablecopyonread_variable_11*
_output_shapes
 �
Read_49/ReadVariableOpReadVariableOp%read_49_disablecopyonread_variable_11^Read_49/DisableCopyOnRead*"
_output_shapes
: *
dtype0d
Identity_98IdentityRead_49/ReadVariableOp:value:0*
T0*"
_output_shapes
: i
Identity_99IdentityIdentity_98:output:0"/device:CPU:0*
T0*"
_output_shapes
: k
Read_50/DisableCopyOnReadDisableCopyOnRead%read_50_disablecopyonread_variable_10*
_output_shapes
 �
Read_50/ReadVariableOpReadVariableOp%read_50_disablecopyonread_variable_10^Read_50/DisableCopyOnRead*
_output_shapes

: *
dtype0a
Identity_100IdentityRead_50/ReadVariableOp:value:0*
T0*
_output_shapes

: g
Identity_101IdentityIdentity_100:output:0"/device:CPU:0*
T0*
_output_shapes

: j
Read_51/DisableCopyOnReadDisableCopyOnRead$read_51_disablecopyonread_variable_9*
_output_shapes
 �
Read_51/ReadVariableOpReadVariableOp$read_51_disablecopyonread_variable_9^Read_51/DisableCopyOnRead*"
_output_shapes
: *
dtype0e
Identity_102IdentityRead_51/ReadVariableOp:value:0*
T0*"
_output_shapes
: k
Identity_103IdentityIdentity_102:output:0"/device:CPU:0*
T0*"
_output_shapes
: j
Read_52/DisableCopyOnReadDisableCopyOnRead$read_52_disablecopyonread_variable_8*
_output_shapes
 �
Read_52/ReadVariableOpReadVariableOp$read_52_disablecopyonread_variable_8^Read_52/DisableCopyOnRead*
_output_shapes

: *
dtype0a
Identity_104IdentityRead_52/ReadVariableOp:value:0*
T0*
_output_shapes

: g
Identity_105IdentityIdentity_104:output:0"/device:CPU:0*
T0*
_output_shapes

: j
Read_53/DisableCopyOnReadDisableCopyOnRead$read_53_disablecopyonread_variable_7*
_output_shapes
 �
Read_53/ReadVariableOpReadVariableOp$read_53_disablecopyonread_variable_7^Read_53/DisableCopyOnRead*"
_output_shapes
: *
dtype0e
Identity_106IdentityRead_53/ReadVariableOp:value:0*
T0*"
_output_shapes
: k
Identity_107IdentityIdentity_106:output:0"/device:CPU:0*
T0*"
_output_shapes
: j
Read_54/DisableCopyOnReadDisableCopyOnRead$read_54_disablecopyonread_variable_6*
_output_shapes
 �
Read_54/ReadVariableOpReadVariableOp$read_54_disablecopyonread_variable_6^Read_54/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_108IdentityRead_54/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_109IdentityIdentity_108:output:0"/device:CPU:0*
T0*
_output_shapes
:j
Read_55/DisableCopyOnReadDisableCopyOnRead$read_55_disablecopyonread_variable_5*
_output_shapes
 �
Read_55/ReadVariableOpReadVariableOp$read_55_disablecopyonread_variable_5^Read_55/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_110IdentityRead_55/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_111IdentityIdentity_110:output:0"/device:CPU:0*
T0*
_output_shapes
:j
Read_56/DisableCopyOnReadDisableCopyOnRead$read_56_disablecopyonread_variable_4*
_output_shapes
 �
Read_56/ReadVariableOpReadVariableOp$read_56_disablecopyonread_variable_4^Read_56/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_112IdentityRead_56/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_113IdentityIdentity_112:output:0"/device:CPU:0*
T0*
_output_shapes
:j
Read_57/DisableCopyOnReadDisableCopyOnRead$read_57_disablecopyonread_variable_3*
_output_shapes
 �
Read_57/ReadVariableOpReadVariableOp$read_57_disablecopyonread_variable_3^Read_57/DisableCopyOnRead*
_output_shapes

:*
dtype0a
Identity_114IdentityRead_57/ReadVariableOp:value:0*
T0*
_output_shapes

:g
Identity_115IdentityIdentity_114:output:0"/device:CPU:0*
T0*
_output_shapes

:j
Read_58/DisableCopyOnReadDisableCopyOnRead$read_58_disablecopyonread_variable_2*
_output_shapes
 �
Read_58/ReadVariableOpReadVariableOp$read_58_disablecopyonread_variable_2^Read_58/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_116IdentityRead_58/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_117IdentityIdentity_116:output:0"/device:CPU:0*
T0*
_output_shapes
:j
Read_59/DisableCopyOnReadDisableCopyOnRead$read_59_disablecopyonread_variable_1*
_output_shapes
 �
Read_59/ReadVariableOpReadVariableOp$read_59_disablecopyonread_variable_1^Read_59/DisableCopyOnRead*
_output_shapes

:*
dtype0a
Identity_118IdentityRead_59/ReadVariableOp:value:0*
T0*
_output_shapes

:g
Identity_119IdentityIdentity_118:output:0"/device:CPU:0*
T0*
_output_shapes

:h
Read_60/DisableCopyOnReadDisableCopyOnRead"read_60_disablecopyonread_variable*
_output_shapes
 �
Read_60/ReadVariableOpReadVariableOp"read_60_disablecopyonread_variable^Read_60/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_120IdentityRead_60/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_121IdentityIdentity_120:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_61/DisableCopyOnReadDisableCopyOnRead\read_61_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_bias_1*
_output_shapes
 �
Read_61/ReadVariableOpReadVariableOp\read_61_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_bias_1^Read_61/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_122IdentityRead_61/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_123IdentityIdentity_122:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_62/DisableCopyOnReadDisableCopyOnRead\read_62_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_bias_1*
_output_shapes
 �
Read_62/ReadVariableOpReadVariableOp\read_62_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_bias_1^Read_62/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_124IdentityRead_62/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_125IdentityIdentity_124:output:0"/device:CPU:0*
T0*
_output_shapes
:@w
Read_63/DisableCopyOnReadDisableCopyOnRead1read_63_disablecopyonread_gru_2_gru_cell_kernel_1*
_output_shapes
 �
Read_63/ReadVariableOpReadVariableOp1read_63_disablecopyonread_gru_2_gru_cell_kernel_1^Read_63/DisableCopyOnRead*
_output_shapes

:@0*
dtype0a
Identity_126IdentityRead_63/ReadVariableOp:value:0*
T0*
_output_shapes

:@0g
Identity_127IdentityIdentity_126:output:0"/device:CPU:0*
T0*
_output_shapes

:@0u
Read_64/DisableCopyOnReadDisableCopyOnRead/read_64_disablecopyonread_gru_2_gru_cell_bias_1*
_output_shapes
 �
Read_64/ReadVariableOpReadVariableOp/read_64_disablecopyonread_gru_2_gru_cell_bias_1^Read_64/DisableCopyOnRead*
_output_shapes

:0*
dtype0a
Identity_128IdentityRead_64/ReadVariableOp:value:0*
T0*
_output_shapes

:0g
Identity_129IdentityIdentity_128:output:0"/device:CPU:0*
T0*
_output_shapes

:0r
Read_65/DisableCopyOnReadDisableCopyOnRead,read_65_disablecopyonread_mha_value_kernel_1*
_output_shapes
 �
Read_65/ReadVariableOpReadVariableOp,read_65_disablecopyonread_mha_value_kernel_1^Read_65/DisableCopyOnRead*"
_output_shapes
: *
dtype0e
Identity_130IdentityRead_65/ReadVariableOp:value:0*
T0*"
_output_shapes
: k
Identity_131IdentityIdentity_130:output:0"/device:CPU:0*
T0*"
_output_shapes
: �
Read_66/DisableCopyOnReadDisableCopyOnRead\read_66_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_bias_1*
_output_shapes
 �
Read_66/ReadVariableOpReadVariableOp\read_66_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_bias_1^Read_66/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_132IdentityRead_66/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_133IdentityIdentity_132:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_67/DisableCopyOnReadDisableCopyOnRead\read_67_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_bias_1*
_output_shapes
 �
Read_67/ReadVariableOpReadVariableOp\read_67_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_bias_1^Read_67/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_134IdentityRead_67/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_135IdentityIdentity_134:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_68/DisableCopyOnReadDisableCopyOnRead\read_68_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_bias_1*
_output_shapes
 �
Read_68/ReadVariableOpReadVariableOp\read_68_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_bias_1^Read_68/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_136IdentityRead_68/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_137IdentityIdentity_136:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_69/DisableCopyOnReadDisableCopyOnRead\read_69_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_bias_1*
_output_shapes
 �
Read_69/ReadVariableOpReadVariableOp\read_69_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_bias_1^Read_69/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_138IdentityRead_69/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_139IdentityIdentity_138:output:0"/device:CPU:0*
T0*
_output_shapes
:@i
Read_70/DisableCopyOnReadDisableCopyOnRead#read_70_disablecopyonread_bn_beta_1*
_output_shapes
 �
Read_70/ReadVariableOpReadVariableOp#read_70_disablecopyonread_bn_beta_1^Read_70/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_140IdentityRead_70/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_141IdentityIdentity_140:output:0"/device:CPU:0*
T0*
_output_shapes
:@}
Read_71/DisableCopyOnReadDisableCopyOnRead7read_71_disablecopyonread_mha_attention_output_kernel_1*
_output_shapes
 �
Read_71/ReadVariableOpReadVariableOp7read_71_disablecopyonread_mha_attention_output_kernel_1^Read_71/DisableCopyOnRead*"
_output_shapes
: *
dtype0e
Identity_142IdentityRead_71/ReadVariableOp:value:0*
T0*"
_output_shapes
: k
Identity_143IdentityIdentity_142:output:0"/device:CPU:0*
T0*"
_output_shapes
: n
Read_72/DisableCopyOnReadDisableCopyOnRead(read_72_disablecopyonread_dense_1_bias_1*
_output_shapes
 �
Read_72/ReadVariableOpReadVariableOp(read_72_disablecopyonread_dense_1_bias_1^Read_72/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_144IdentityRead_72/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_145IdentityIdentity_144:output:0"/device:CPU:0*
T0*
_output_shapes
:o
Read_73/DisableCopyOnReadDisableCopyOnRead)read_73_disablecopyonread_conv1d_kernel_1*
_output_shapes
 �
Read_73/ReadVariableOpReadVariableOp)read_73_disablecopyonread_conv1d_kernel_1^Read_73/DisableCopyOnRead*"
_output_shapes
:+@*
dtype0e
Identity_146IdentityRead_73/ReadVariableOp:value:0*
T0*"
_output_shapes
:+@k
Identity_147IdentityIdentity_146:output:0"/device:CPU:0*
T0*"
_output_shapes
:+@�
Read_74/DisableCopyOnReadDisableCopyOnRead\read_74_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_bias_1*
_output_shapes
 �
Read_74/ReadVariableOpReadVariableOp\read_74_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_bias_1^Read_74/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_148IdentityRead_74/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_149IdentityIdentity_148:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_75/DisableCopyOnReadDisableCopyOnRead\read_75_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_bias_1*
_output_shapes
 �
Read_75/ReadVariableOpReadVariableOp\read_75_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_bias_1^Read_75/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_150IdentityRead_75/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_151IdentityIdentity_150:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_76/DisableCopyOnReadDisableCopyOnRead\read_76_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_bias_1*
_output_shapes
 �
Read_76/ReadVariableOpReadVariableOp\read_76_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_bias_1^Read_76/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_152IdentityRead_76/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_153IdentityIdentity_152:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_77/DisableCopyOnReadDisableCopyOnRead^read_77_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_kernel_1*
_output_shapes
 �
Read_77/ReadVariableOpReadVariableOp^read_77_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_kernel_1^Read_77/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_154IdentityRead_77/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_155IdentityIdentity_154:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@j
Read_78/DisableCopyOnReadDisableCopyOnRead$read_78_disablecopyonread_bn_gamma_1*
_output_shapes
 �
Read_78/ReadVariableOpReadVariableOp$read_78_disablecopyonread_bn_gamma_1^Read_78/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_156IdentityRead_78/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_157IdentityIdentity_156:output:0"/device:CPU:0*
T0*
_output_shapes
:@p
Read_79/DisableCopyOnReadDisableCopyOnRead*read_79_disablecopyonread_mha_query_bias_1*
_output_shapes
 �
Read_79/ReadVariableOpReadVariableOp*read_79_disablecopyonread_mha_query_bias_1^Read_79/DisableCopyOnRead*
_output_shapes

: *
dtype0a
Identity_158IdentityRead_79/ReadVariableOp:value:0*
T0*
_output_shapes

: g
Identity_159IdentityIdentity_158:output:0"/device:CPU:0*
T0*
_output_shapes

: p
Read_80/DisableCopyOnReadDisableCopyOnRead*read_80_disablecopyonread_mha_value_bias_1*
_output_shapes
 �
Read_80/ReadVariableOpReadVariableOp*read_80_disablecopyonread_mha_value_bias_1^Read_80/DisableCopyOnRead*
_output_shapes

: *
dtype0a
Identity_160IdentityRead_80/ReadVariableOp:value:0*
T0*
_output_shapes

: g
Identity_161IdentityIdentity_160:output:0"/device:CPU:0*
T0*
_output_shapes

: �
Read_81/DisableCopyOnReadDisableCopyOnRead^read_81_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_kernel_1*
_output_shapes
 �
Read_81/ReadVariableOpReadVariableOp^read_81_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_1_conv1d_1_kernel_1^Read_81/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_162IdentityRead_81/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_163IdentityIdentity_162:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@�
Read_82/DisableCopyOnReadDisableCopyOnRead^read_82_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_kernel_1*
_output_shapes
 �
Read_82/ReadVariableOpReadVariableOp^read_82_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_1_conv1d_1_kernel_1^Read_82/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_164IdentityRead_82/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_165IdentityIdentity_164:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@p
Read_83/DisableCopyOnReadDisableCopyOnRead*read_83_disablecopyonread_mha_key_kernel_1*
_output_shapes
 �
Read_83/ReadVariableOpReadVariableOp*read_83_disablecopyonread_mha_key_kernel_1^Read_83/DisableCopyOnRead*"
_output_shapes
: *
dtype0e
Identity_166IdentityRead_83/ReadVariableOp:value:0*
T0*"
_output_shapes
: k
Identity_167IdentityIdentity_166:output:0"/device:CPU:0*
T0*"
_output_shapes
: q
Read_84/DisableCopyOnReadDisableCopyOnRead+read_84_disablecopyonread_attn_norm_gamma_1*
_output_shapes
 �
Read_84/ReadVariableOpReadVariableOp+read_84_disablecopyonread_attn_norm_gamma_1^Read_84/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_168IdentityRead_84/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_169IdentityIdentity_168:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_85/DisableCopyOnReadDisableCopyOnRead^read_85_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_kernel_1*
_output_shapes
 �
Read_85/ReadVariableOpReadVariableOp^read_85_disablecopyonread_tcn_cnn_residual_block_1_residual_block_1_conv1d_0_conv1d_0_kernel_1^Read_85/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_170IdentityRead_85/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_171IdentityIdentity_170:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@�
Read_86/DisableCopyOnReadDisableCopyOnRead^read_86_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_kernel_1*
_output_shapes
 �
Read_86/ReadVariableOpReadVariableOp^read_86_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_1_conv1d_1_kernel_1^Read_86/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_172IdentityRead_86/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_173IdentityIdentity_172:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@�
Read_87/DisableCopyOnReadDisableCopyOnRead^read_87_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_kernel_1*
_output_shapes
 �
Read_87/ReadVariableOpReadVariableOp^read_87_disablecopyonread_tcn_cnn_residual_block_3_residual_block_3_conv1d_0_conv1d_0_kernel_1^Read_87/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_174IdentityRead_87/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_175IdentityIdentity_174:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@v
Read_88/DisableCopyOnReadDisableCopyOnRead0read_88_disablecopyonread_gru1_gru_cell_kernel_1*
_output_shapes
 �
Read_88/ReadVariableOpReadVariableOp0read_88_disablecopyonread_gru1_gru_cell_kernel_1^Read_88/DisableCopyOnRead*
_output_shapes
:	@�*
dtype0b
Identity_176IdentityRead_88/ReadVariableOp:value:0*
T0*
_output_shapes
:	@�h
Identity_177IdentityIdentity_176:output:0"/device:CPU:0*
T0*
_output_shapes
:	@�p
Read_89/DisableCopyOnReadDisableCopyOnRead*read_89_disablecopyonread_attn_norm_beta_1*
_output_shapes
 �
Read_89/ReadVariableOpReadVariableOp*read_89_disablecopyonread_attn_norm_beta_1^Read_89/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_178IdentityRead_89/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_179IdentityIdentity_178:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_90/DisableCopyOnReadDisableCopyOnRead^read_90_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_kernel_1*
_output_shapes
 �
Read_90/ReadVariableOpReadVariableOp^read_90_disablecopyonread_tcn_cnn_residual_block_2_residual_block_2_conv1d_0_conv1d_0_kernel_1^Read_90/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_180IdentityRead_90/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_181IdentityIdentity_180:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@�
Read_91/DisableCopyOnReadDisableCopyOnRead^read_91_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_kernel_1*
_output_shapes
 �
Read_91/ReadVariableOpReadVariableOp^read_91_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_1_conv1d_1_kernel_1^Read_91/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_182IdentityRead_91/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_183IdentityIdentity_182:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@{
Read_92/DisableCopyOnReadDisableCopyOnRead5read_92_disablecopyonread_mha_attention_output_bias_1*
_output_shapes
 �
Read_92/ReadVariableOpReadVariableOp5read_92_disablecopyonread_mha_attention_output_bias_1^Read_92/DisableCopyOnRead*
_output_shapes
:*
dtype0]
Identity_184IdentityRead_92/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_185IdentityIdentity_184:output:0"/device:CPU:0*
T0*
_output_shapes
:n
Read_93/DisableCopyOnReadDisableCopyOnRead(read_93_disablecopyonread_dense_kernel_1*
_output_shapes
 �
Read_93/ReadVariableOpReadVariableOp(read_93_disablecopyonread_dense_kernel_1^Read_93/DisableCopyOnRead*
_output_shapes

:*
dtype0a
Identity_186IdentityRead_93/ReadVariableOp:value:0*
T0*
_output_shapes

:g
Identity_187IdentityIdentity_186:output:0"/device:CPU:0*
T0*
_output_shapes

:p
Read_94/DisableCopyOnReadDisableCopyOnRead*read_94_disablecopyonread_dense_1_kernel_1*
_output_shapes
 �
Read_94/ReadVariableOpReadVariableOp*read_94_disablecopyonread_dense_1_kernel_1^Read_94/DisableCopyOnRead*
_output_shapes

:*
dtype0a
Identity_188IdentityRead_94/ReadVariableOp:value:0*
T0*
_output_shapes

:g
Identity_189IdentityIdentity_188:output:0"/device:CPU:0*
T0*
_output_shapes

:t
Read_95/DisableCopyOnReadDisableCopyOnRead.read_95_disablecopyonread_gru1_gru_cell_bias_1*
_output_shapes
 �
Read_95/ReadVariableOpReadVariableOp.read_95_disablecopyonread_gru1_gru_cell_bias_1^Read_95/DisableCopyOnRead*
_output_shapes
:	�*
dtype0b
Identity_190IdentityRead_95/ReadVariableOp:value:0*
T0*
_output_shapes
:	�h
Identity_191IdentityIdentity_190:output:0"/device:CPU:0*
T0*
_output_shapes
:	�r
Read_96/DisableCopyOnReadDisableCopyOnRead,read_96_disablecopyonread_mha_query_kernel_1*
_output_shapes
 �
Read_96/ReadVariableOpReadVariableOp,read_96_disablecopyonread_mha_query_kernel_1^Read_96/DisableCopyOnRead*"
_output_shapes
: *
dtype0e
Identity_192IdentityRead_96/ReadVariableOp:value:0*
T0*"
_output_shapes
: k
Identity_193IdentityIdentity_192:output:0"/device:CPU:0*
T0*"
_output_shapes
: m
Read_97/DisableCopyOnReadDisableCopyOnRead'read_97_disablecopyonread_conv1d_bias_1*
_output_shapes
 �
Read_97/ReadVariableOpReadVariableOp'read_97_disablecopyonread_conv1d_bias_1^Read_97/DisableCopyOnRead*
_output_shapes
:@*
dtype0]
Identity_194IdentityRead_97/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_195IdentityIdentity_194:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_98/DisableCopyOnReadDisableCopyOnRead^read_98_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_kernel_1*
_output_shapes
 �
Read_98/ReadVariableOpReadVariableOp^read_98_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_1_conv1d_1_kernel_1^Read_98/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_196IdentityRead_98/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_197IdentityIdentity_196:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@�
Read_99/DisableCopyOnReadDisableCopyOnRead^read_99_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_kernel_1*
_output_shapes
 �
Read_99/ReadVariableOpReadVariableOp^read_99_disablecopyonread_tcn_cnn_residual_block_0_residual_block_0_conv1d_0_conv1d_0_kernel_1^Read_99/DisableCopyOnRead*"
_output_shapes
:@@*
dtype0e
Identity_198IdentityRead_99/ReadVariableOp:value:0*
T0*"
_output_shapes
:@@k
Identity_199IdentityIdentity_198:output:0"/device:CPU:0*
T0*"
_output_shapes
:@@�
Read_100/DisableCopyOnReadDisableCopyOnRead]read_100_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_bias_1*
_output_shapes
 �
Read_100/ReadVariableOpReadVariableOp]read_100_disablecopyonread_tcn_cnn_residual_block_4_residual_block_4_conv1d_0_conv1d_0_bias_1^Read_100/DisableCopyOnRead*
_output_shapes
:@*
dtype0^
Identity_200IdentityRead_100/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_201IdentityIdentity_200:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_101/DisableCopyOnReadDisableCopyOnRead;read_101_disablecopyonread_gru1_gru_cell_recurrent_kernel_1*
_output_shapes
 �
Read_101/ReadVariableOpReadVariableOp;read_101_disablecopyonread_gru1_gru_cell_recurrent_kernel_1^Read_101/DisableCopyOnRead*
_output_shapes
:	@�*
dtype0c
Identity_202IdentityRead_101/ReadVariableOp:value:0*
T0*
_output_shapes
:	@�h
Identity_203IdentityIdentity_202:output:0"/device:CPU:0*
T0*
_output_shapes
:	@��
Read_102/DisableCopyOnReadDisableCopyOnRead<read_102_disablecopyonread_gru_2_gru_cell_recurrent_kernel_1*
_output_shapes
 �
Read_102/ReadVariableOpReadVariableOp<read_102_disablecopyonread_gru_2_gru_cell_recurrent_kernel_1^Read_102/DisableCopyOnRead*
_output_shapes

:0*
dtype0b
Identity_204IdentityRead_102/ReadVariableOp:value:0*
T0*
_output_shapes

:0g
Identity_205IdentityIdentity_204:output:0"/device:CPU:0*
T0*
_output_shapes

:0p
Read_103/DisableCopyOnReadDisableCopyOnRead)read_103_disablecopyonread_mha_key_bias_1*
_output_shapes
 �
Read_103/ReadVariableOpReadVariableOp)read_103_disablecopyonread_mha_key_bias_1^Read_103/DisableCopyOnRead*
_output_shapes

: *
dtype0b
Identity_206IdentityRead_103/ReadVariableOp:value:0*
T0*
_output_shapes

: g
Identity_207IdentityIdentity_206:output:0"/device:CPU:0*
T0*
_output_shapes

: n
Read_104/DisableCopyOnReadDisableCopyOnRead'read_104_disablecopyonread_dense_bias_1*
_output_shapes
 �
Read_104/ReadVariableOpReadVariableOp'read_104_disablecopyonread_dense_bias_1^Read_104/DisableCopyOnRead*
_output_shapes
:*
dtype0^
Identity_208IdentityRead_104/ReadVariableOp:value:0*
T0*
_output_shapes
:c
Identity_209IdentityIdentity_208:output:0"/device:CPU:0*
T0*
_output_shapes
:r
Read_105/DisableCopyOnReadDisableCopyOnRead+read_105_disablecopyonread_bn_moving_mean_1*
_output_shapes
 �
Read_105/ReadVariableOpReadVariableOp+read_105_disablecopyonread_bn_moving_mean_1^Read_105/DisableCopyOnRead*
_output_shapes
:@*
dtype0^
Identity_210IdentityRead_105/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_211IdentityIdentity_210:output:0"/device:CPU:0*
T0*
_output_shapes
:@v
Read_106/DisableCopyOnReadDisableCopyOnRead/read_106_disablecopyonread_bn_moving_variance_1*
_output_shapes
 �
Read_106/ReadVariableOpReadVariableOp/read_106_disablecopyonread_bn_moving_variance_1^Read_106/DisableCopyOnRead*
_output_shapes
:@*
dtype0^
Identity_212IdentityRead_106/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
Identity_213IdentityIdentity_212:output:0"/device:CPU:0*
T0*
_output_shapes
:@L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �$
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:l*
dtype0*�$
value�$B�$lB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB'variables/22/.ATTRIBUTES/VARIABLE_VALUEB'variables/23/.ATTRIBUTES/VARIABLE_VALUEB'variables/24/.ATTRIBUTES/VARIABLE_VALUEB'variables/25/.ATTRIBUTES/VARIABLE_VALUEB'variables/26/.ATTRIBUTES/VARIABLE_VALUEB'variables/27/.ATTRIBUTES/VARIABLE_VALUEB'variables/28/.ATTRIBUTES/VARIABLE_VALUEB'variables/29/.ATTRIBUTES/VARIABLE_VALUEB'variables/30/.ATTRIBUTES/VARIABLE_VALUEB'variables/31/.ATTRIBUTES/VARIABLE_VALUEB'variables/32/.ATTRIBUTES/VARIABLE_VALUEB'variables/33/.ATTRIBUTES/VARIABLE_VALUEB'variables/34/.ATTRIBUTES/VARIABLE_VALUEB'variables/35/.ATTRIBUTES/VARIABLE_VALUEB'variables/36/.ATTRIBUTES/VARIABLE_VALUEB'variables/37/.ATTRIBUTES/VARIABLE_VALUEB'variables/38/.ATTRIBUTES/VARIABLE_VALUEB'variables/39/.ATTRIBUTES/VARIABLE_VALUEB'variables/40/.ATTRIBUTES/VARIABLE_VALUEB'variables/41/.ATTRIBUTES/VARIABLE_VALUEB'variables/42/.ATTRIBUTES/VARIABLE_VALUEB'variables/43/.ATTRIBUTES/VARIABLE_VALUEB'variables/44/.ATTRIBUTES/VARIABLE_VALUEB'variables/45/.ATTRIBUTES/VARIABLE_VALUEB'variables/46/.ATTRIBUTES/VARIABLE_VALUEB'variables/47/.ATTRIBUTES/VARIABLE_VALUEB'variables/48/.ATTRIBUTES/VARIABLE_VALUEB'variables/49/.ATTRIBUTES/VARIABLE_VALUEB'variables/50/.ATTRIBUTES/VARIABLE_VALUEB'variables/51/.ATTRIBUTES/VARIABLE_VALUEB'variables/52/.ATTRIBUTES/VARIABLE_VALUEB'variables/53/.ATTRIBUTES/VARIABLE_VALUEB'variables/54/.ATTRIBUTES/VARIABLE_VALUEB'variables/55/.ATTRIBUTES/VARIABLE_VALUEB'variables/56/.ATTRIBUTES/VARIABLE_VALUEB'variables/57/.ATTRIBUTES/VARIABLE_VALUEB'variables/58/.ATTRIBUTES/VARIABLE_VALUEB'variables/59/.ATTRIBUTES/VARIABLE_VALUEB'variables/60/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/0/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/1/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/2/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/3/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/4/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/5/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/6/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/7/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/8/.ATTRIBUTES/VARIABLE_VALUEB+_all_variables/9/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/10/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/11/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/12/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/13/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/14/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/15/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/16/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/17/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/18/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/19/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/20/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/21/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/22/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/23/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/24/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/25/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/26/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/27/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/28/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/29/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/30/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/31/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/32/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/33/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/34/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/35/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/36/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/37/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/38/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/39/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/40/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/41/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/42/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/43/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/44/.ATTRIBUTES/VARIABLE_VALUEB,_all_variables/45/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:l*
dtype0*�
value�B�lB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0Identity_51:output:0Identity_53:output:0Identity_55:output:0Identity_57:output:0Identity_59:output:0Identity_61:output:0Identity_63:output:0Identity_65:output:0Identity_67:output:0Identity_69:output:0Identity_71:output:0Identity_73:output:0Identity_75:output:0Identity_77:output:0Identity_79:output:0Identity_81:output:0Identity_83:output:0Identity_85:output:0Identity_87:output:0Identity_89:output:0Identity_91:output:0Identity_93:output:0Identity_95:output:0Identity_97:output:0Identity_99:output:0Identity_101:output:0Identity_103:output:0Identity_105:output:0Identity_107:output:0Identity_109:output:0Identity_111:output:0Identity_113:output:0Identity_115:output:0Identity_117:output:0Identity_119:output:0Identity_121:output:0Identity_123:output:0Identity_125:output:0Identity_127:output:0Identity_129:output:0Identity_131:output:0Identity_133:output:0Identity_135:output:0Identity_137:output:0Identity_139:output:0Identity_141:output:0Identity_143:output:0Identity_145:output:0Identity_147:output:0Identity_149:output:0Identity_151:output:0Identity_153:output:0Identity_155:output:0Identity_157:output:0Identity_159:output:0Identity_161:output:0Identity_163:output:0Identity_165:output:0Identity_167:output:0Identity_169:output:0Identity_171:output:0Identity_173:output:0Identity_175:output:0Identity_177:output:0Identity_179:output:0Identity_181:output:0Identity_183:output:0Identity_185:output:0Identity_187:output:0Identity_189:output:0Identity_191:output:0Identity_193:output:0Identity_195:output:0Identity_197:output:0Identity_199:output:0Identity_201:output:0Identity_203:output:0Identity_205:output:0Identity_207:output:0Identity_209:output:0Identity_211:output:0Identity_213:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *z
dtypesp
n2l															�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 j
Identity_214Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: W
Identity_215IdentityIdentity_214:output:0^NoOp*
T0*
_output_shapes
: �,
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_100/DisableCopyOnRead^Read_100/ReadVariableOp^Read_101/DisableCopyOnRead^Read_101/ReadVariableOp^Read_102/DisableCopyOnRead^Read_102/ReadVariableOp^Read_103/DisableCopyOnRead^Read_103/ReadVariableOp^Read_104/DisableCopyOnRead^Read_104/ReadVariableOp^Read_105/DisableCopyOnRead^Read_105/ReadVariableOp^Read_106/DisableCopyOnRead^Read_106/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_21/DisableCopyOnRead^Read_21/ReadVariableOp^Read_22/DisableCopyOnRead^Read_22/ReadVariableOp^Read_23/DisableCopyOnRead^Read_23/ReadVariableOp^Read_24/DisableCopyOnRead^Read_24/ReadVariableOp^Read_25/DisableCopyOnRead^Read_25/ReadVariableOp^Read_26/DisableCopyOnRead^Read_26/ReadVariableOp^Read_27/DisableCopyOnRead^Read_27/ReadVariableOp^Read_28/DisableCopyOnRead^Read_28/ReadVariableOp^Read_29/DisableCopyOnRead^Read_29/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_30/DisableCopyOnRead^Read_30/ReadVariableOp^Read_31/DisableCopyOnRead^Read_31/ReadVariableOp^Read_32/DisableCopyOnRead^Read_32/ReadVariableOp^Read_33/DisableCopyOnRead^Read_33/ReadVariableOp^Read_34/DisableCopyOnRead^Read_34/ReadVariableOp^Read_35/DisableCopyOnRead^Read_35/ReadVariableOp^Read_36/DisableCopyOnRead^Read_36/ReadVariableOp^Read_37/DisableCopyOnRead^Read_37/ReadVariableOp^Read_38/DisableCopyOnRead^Read_38/ReadVariableOp^Read_39/DisableCopyOnRead^Read_39/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_40/DisableCopyOnRead^Read_40/ReadVariableOp^Read_41/DisableCopyOnRead^Read_41/ReadVariableOp^Read_42/DisableCopyOnRead^Read_42/ReadVariableOp^Read_43/DisableCopyOnRead^Read_43/ReadVariableOp^Read_44/DisableCopyOnRead^Read_44/ReadVariableOp^Read_45/DisableCopyOnRead^Read_45/ReadVariableOp^Read_46/DisableCopyOnRead^Read_46/ReadVariableOp^Read_47/DisableCopyOnRead^Read_47/ReadVariableOp^Read_48/DisableCopyOnRead^Read_48/ReadVariableOp^Read_49/DisableCopyOnRead^Read_49/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_50/DisableCopyOnRead^Read_50/ReadVariableOp^Read_51/DisableCopyOnRead^Read_51/ReadVariableOp^Read_52/DisableCopyOnRead^Read_52/ReadVariableOp^Read_53/DisableCopyOnRead^Read_53/ReadVariableOp^Read_54/DisableCopyOnRead^Read_54/ReadVariableOp^Read_55/DisableCopyOnRead^Read_55/ReadVariableOp^Read_56/DisableCopyOnRead^Read_56/ReadVariableOp^Read_57/DisableCopyOnRead^Read_57/ReadVariableOp^Read_58/DisableCopyOnRead^Read_58/ReadVariableOp^Read_59/DisableCopyOnRead^Read_59/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_60/DisableCopyOnRead^Read_60/ReadVariableOp^Read_61/DisableCopyOnRead^Read_61/ReadVariableOp^Read_62/DisableCopyOnRead^Read_62/ReadVariableOp^Read_63/DisableCopyOnRead^Read_63/ReadVariableOp^Read_64/DisableCopyOnRead^Read_64/ReadVariableOp^Read_65/DisableCopyOnRead^Read_65/ReadVariableOp^Read_66/DisableCopyOnRead^Read_66/ReadVariableOp^Read_67/DisableCopyOnRead^Read_67/ReadVariableOp^Read_68/DisableCopyOnRead^Read_68/ReadVariableOp^Read_69/DisableCopyOnRead^Read_69/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_70/DisableCopyOnRead^Read_70/ReadVariableOp^Read_71/DisableCopyOnRead^Read_71/ReadVariableOp^Read_72/DisableCopyOnRead^Read_72/ReadVariableOp^Read_73/DisableCopyOnRead^Read_73/ReadVariableOp^Read_74/DisableCopyOnRead^Read_74/ReadVariableOp^Read_75/DisableCopyOnRead^Read_75/ReadVariableOp^Read_76/DisableCopyOnRead^Read_76/ReadVariableOp^Read_77/DisableCopyOnRead^Read_77/ReadVariableOp^Read_78/DisableCopyOnRead^Read_78/ReadVariableOp^Read_79/DisableCopyOnRead^Read_79/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_80/DisableCopyOnRead^Read_80/ReadVariableOp^Read_81/DisableCopyOnRead^Read_81/ReadVariableOp^Read_82/DisableCopyOnRead^Read_82/ReadVariableOp^Read_83/DisableCopyOnRead^Read_83/ReadVariableOp^Read_84/DisableCopyOnRead^Read_84/ReadVariableOp^Read_85/DisableCopyOnRead^Read_85/ReadVariableOp^Read_86/DisableCopyOnRead^Read_86/ReadVariableOp^Read_87/DisableCopyOnRead^Read_87/ReadVariableOp^Read_88/DisableCopyOnRead^Read_88/ReadVariableOp^Read_89/DisableCopyOnRead^Read_89/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp^Read_90/DisableCopyOnRead^Read_90/ReadVariableOp^Read_91/DisableCopyOnRead^Read_91/ReadVariableOp^Read_92/DisableCopyOnRead^Read_92/ReadVariableOp^Read_93/DisableCopyOnRead^Read_93/ReadVariableOp^Read_94/DisableCopyOnRead^Read_94/ReadVariableOp^Read_95/DisableCopyOnRead^Read_95/ReadVariableOp^Read_96/DisableCopyOnRead^Read_96/ReadVariableOp^Read_97/DisableCopyOnRead^Read_97/ReadVariableOp^Read_98/DisableCopyOnRead^Read_98/ReadVariableOp^Read_99/DisableCopyOnRead^Read_99/ReadVariableOp*
_output_shapes
 "%
identity_215Identity_215:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp26
Read_10/DisableCopyOnReadRead_10/DisableCopyOnRead20
Read_10/ReadVariableOpRead_10/ReadVariableOp28
Read_100/DisableCopyOnReadRead_100/DisableCopyOnRead22
Read_100/ReadVariableOpRead_100/ReadVariableOp28
Read_101/DisableCopyOnReadRead_101/DisableCopyOnRead22
Read_101/ReadVariableOpRead_101/ReadVariableOp28
Read_102/DisableCopyOnReadRead_102/DisableCopyOnRead22
Read_102/ReadVariableOpRead_102/ReadVariableOp28
Read_103/DisableCopyOnReadRead_103/DisableCopyOnRead22
Read_103/ReadVariableOpRead_103/ReadVariableOp28
Read_104/DisableCopyOnReadRead_104/DisableCopyOnRead22
Read_104/ReadVariableOpRead_104/ReadVariableOp28
Read_105/DisableCopyOnReadRead_105/DisableCopyOnRead22
Read_105/ReadVariableOpRead_105/ReadVariableOp28
Read_106/DisableCopyOnReadRead_106/DisableCopyOnRead22
Read_106/ReadVariableOpRead_106/ReadVariableOp26
Read_11/DisableCopyOnReadRead_11/DisableCopyOnRead20
Read_11/ReadVariableOpRead_11/ReadVariableOp26
Read_12/DisableCopyOnReadRead_12/DisableCopyOnRead20
Read_12/ReadVariableOpRead_12/ReadVariableOp26
Read_13/DisableCopyOnReadRead_13/DisableCopyOnRead20
Read_13/ReadVariableOpRead_13/ReadVariableOp26
Read_14/DisableCopyOnReadRead_14/DisableCopyOnRead20
Read_14/ReadVariableOpRead_14/ReadVariableOp26
Read_15/DisableCopyOnReadRead_15/DisableCopyOnRead20
Read_15/ReadVariableOpRead_15/ReadVariableOp26
Read_16/DisableCopyOnReadRead_16/DisableCopyOnRead20
Read_16/ReadVariableOpRead_16/ReadVariableOp26
Read_17/DisableCopyOnReadRead_17/DisableCopyOnRead20
Read_17/ReadVariableOpRead_17/ReadVariableOp26
Read_18/DisableCopyOnReadRead_18/DisableCopyOnRead20
Read_18/ReadVariableOpRead_18/ReadVariableOp26
Read_19/DisableCopyOnReadRead_19/DisableCopyOnRead20
Read_19/ReadVariableOpRead_19/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp26
Read_20/DisableCopyOnReadRead_20/DisableCopyOnRead20
Read_20/ReadVariableOpRead_20/ReadVariableOp26
Read_21/DisableCopyOnReadRead_21/DisableCopyOnRead20
Read_21/ReadVariableOpRead_21/ReadVariableOp26
Read_22/DisableCopyOnReadRead_22/DisableCopyOnRead20
Read_22/ReadVariableOpRead_22/ReadVariableOp26
Read_23/DisableCopyOnReadRead_23/DisableCopyOnRead20
Read_23/ReadVariableOpRead_23/ReadVariableOp26
Read_24/DisableCopyOnReadRead_24/DisableCopyOnRead20
Read_24/ReadVariableOpRead_24/ReadVariableOp26
Read_25/DisableCopyOnReadRead_25/DisableCopyOnRead20
Read_25/ReadVariableOpRead_25/ReadVariableOp26
Read_26/DisableCopyOnReadRead_26/DisableCopyOnRead20
Read_26/ReadVariableOpRead_26/ReadVariableOp26
Read_27/DisableCopyOnReadRead_27/DisableCopyOnRead20
Read_27/ReadVariableOpRead_27/ReadVariableOp26
Read_28/DisableCopyOnReadRead_28/DisableCopyOnRead20
Read_28/ReadVariableOpRead_28/ReadVariableOp26
Read_29/DisableCopyOnReadRead_29/DisableCopyOnRead20
Read_29/ReadVariableOpRead_29/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp26
Read_30/DisableCopyOnReadRead_30/DisableCopyOnRead20
Read_30/ReadVariableOpRead_30/ReadVariableOp26
Read_31/DisableCopyOnReadRead_31/DisableCopyOnRead20
Read_31/ReadVariableOpRead_31/ReadVariableOp26
Read_32/DisableCopyOnReadRead_32/DisableCopyOnRead20
Read_32/ReadVariableOpRead_32/ReadVariableOp26
Read_33/DisableCopyOnReadRead_33/DisableCopyOnRead20
Read_33/ReadVariableOpRead_33/ReadVariableOp26
Read_34/DisableCopyOnReadRead_34/DisableCopyOnRead20
Read_34/ReadVariableOpRead_34/ReadVariableOp26
Read_35/DisableCopyOnReadRead_35/DisableCopyOnRead20
Read_35/ReadVariableOpRead_35/ReadVariableOp26
Read_36/DisableCopyOnReadRead_36/DisableCopyOnRead20
Read_36/ReadVariableOpRead_36/ReadVariableOp26
Read_37/DisableCopyOnReadRead_37/DisableCopyOnRead20
Read_37/ReadVariableOpRead_37/ReadVariableOp26
Read_38/DisableCopyOnReadRead_38/DisableCopyOnRead20
Read_38/ReadVariableOpRead_38/ReadVariableOp26
Read_39/DisableCopyOnReadRead_39/DisableCopyOnRead20
Read_39/ReadVariableOpRead_39/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp26
Read_40/DisableCopyOnReadRead_40/DisableCopyOnRead20
Read_40/ReadVariableOpRead_40/ReadVariableOp26
Read_41/DisableCopyOnReadRead_41/DisableCopyOnRead20
Read_41/ReadVariableOpRead_41/ReadVariableOp26
Read_42/DisableCopyOnReadRead_42/DisableCopyOnRead20
Read_42/ReadVariableOpRead_42/ReadVariableOp26
Read_43/DisableCopyOnReadRead_43/DisableCopyOnRead20
Read_43/ReadVariableOpRead_43/ReadVariableOp26
Read_44/DisableCopyOnReadRead_44/DisableCopyOnRead20
Read_44/ReadVariableOpRead_44/ReadVariableOp26
Read_45/DisableCopyOnReadRead_45/DisableCopyOnRead20
Read_45/ReadVariableOpRead_45/ReadVariableOp26
Read_46/DisableCopyOnReadRead_46/DisableCopyOnRead20
Read_46/ReadVariableOpRead_46/ReadVariableOp26
Read_47/DisableCopyOnReadRead_47/DisableCopyOnRead20
Read_47/ReadVariableOpRead_47/ReadVariableOp26
Read_48/DisableCopyOnReadRead_48/DisableCopyOnRead20
Read_48/ReadVariableOpRead_48/ReadVariableOp26
Read_49/DisableCopyOnReadRead_49/DisableCopyOnRead20
Read_49/ReadVariableOpRead_49/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp26
Read_50/DisableCopyOnReadRead_50/DisableCopyOnRead20
Read_50/ReadVariableOpRead_50/ReadVariableOp26
Read_51/DisableCopyOnReadRead_51/DisableCopyOnRead20
Read_51/ReadVariableOpRead_51/ReadVariableOp26
Read_52/DisableCopyOnReadRead_52/DisableCopyOnRead20
Read_52/ReadVariableOpRead_52/ReadVariableOp26
Read_53/DisableCopyOnReadRead_53/DisableCopyOnRead20
Read_53/ReadVariableOpRead_53/ReadVariableOp26
Read_54/DisableCopyOnReadRead_54/DisableCopyOnRead20
Read_54/ReadVariableOpRead_54/ReadVariableOp26
Read_55/DisableCopyOnReadRead_55/DisableCopyOnRead20
Read_55/ReadVariableOpRead_55/ReadVariableOp26
Read_56/DisableCopyOnReadRead_56/DisableCopyOnRead20
Read_56/ReadVariableOpRead_56/ReadVariableOp26
Read_57/DisableCopyOnReadRead_57/DisableCopyOnRead20
Read_57/ReadVariableOpRead_57/ReadVariableOp26
Read_58/DisableCopyOnReadRead_58/DisableCopyOnRead20
Read_58/ReadVariableOpRead_58/ReadVariableOp26
Read_59/DisableCopyOnReadRead_59/DisableCopyOnRead20
Read_59/ReadVariableOpRead_59/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp26
Read_60/DisableCopyOnReadRead_60/DisableCopyOnRead20
Read_60/ReadVariableOpRead_60/ReadVariableOp26
Read_61/DisableCopyOnReadRead_61/DisableCopyOnRead20
Read_61/ReadVariableOpRead_61/ReadVariableOp26
Read_62/DisableCopyOnReadRead_62/DisableCopyOnRead20
Read_62/ReadVariableOpRead_62/ReadVariableOp26
Read_63/DisableCopyOnReadRead_63/DisableCopyOnRead20
Read_63/ReadVariableOpRead_63/ReadVariableOp26
Read_64/DisableCopyOnReadRead_64/DisableCopyOnRead20
Read_64/ReadVariableOpRead_64/ReadVariableOp26
Read_65/DisableCopyOnReadRead_65/DisableCopyOnRead20
Read_65/ReadVariableOpRead_65/ReadVariableOp26
Read_66/DisableCopyOnReadRead_66/DisableCopyOnRead20
Read_66/ReadVariableOpRead_66/ReadVariableOp26
Read_67/DisableCopyOnReadRead_67/DisableCopyOnRead20
Read_67/ReadVariableOpRead_67/ReadVariableOp26
Read_68/DisableCopyOnReadRead_68/DisableCopyOnRead20
Read_68/ReadVariableOpRead_68/ReadVariableOp26
Read_69/DisableCopyOnReadRead_69/DisableCopyOnRead20
Read_69/ReadVariableOpRead_69/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp26
Read_70/DisableCopyOnReadRead_70/DisableCopyOnRead20
Read_70/ReadVariableOpRead_70/ReadVariableOp26
Read_71/DisableCopyOnReadRead_71/DisableCopyOnRead20
Read_71/ReadVariableOpRead_71/ReadVariableOp26
Read_72/DisableCopyOnReadRead_72/DisableCopyOnRead20
Read_72/ReadVariableOpRead_72/ReadVariableOp26
Read_73/DisableCopyOnReadRead_73/DisableCopyOnRead20
Read_73/ReadVariableOpRead_73/ReadVariableOp26
Read_74/DisableCopyOnReadRead_74/DisableCopyOnRead20
Read_74/ReadVariableOpRead_74/ReadVariableOp26
Read_75/DisableCopyOnReadRead_75/DisableCopyOnRead20
Read_75/ReadVariableOpRead_75/ReadVariableOp26
Read_76/DisableCopyOnReadRead_76/DisableCopyOnRead20
Read_76/ReadVariableOpRead_76/ReadVariableOp26
Read_77/DisableCopyOnReadRead_77/DisableCopyOnRead20
Read_77/ReadVariableOpRead_77/ReadVariableOp26
Read_78/DisableCopyOnReadRead_78/DisableCopyOnRead20
Read_78/ReadVariableOpRead_78/ReadVariableOp26
Read_79/DisableCopyOnReadRead_79/DisableCopyOnRead20
Read_79/ReadVariableOpRead_79/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp26
Read_80/DisableCopyOnReadRead_80/DisableCopyOnRead20
Read_80/ReadVariableOpRead_80/ReadVariableOp26
Read_81/DisableCopyOnReadRead_81/DisableCopyOnRead20
Read_81/ReadVariableOpRead_81/ReadVariableOp26
Read_82/DisableCopyOnReadRead_82/DisableCopyOnRead20
Read_82/ReadVariableOpRead_82/ReadVariableOp26
Read_83/DisableCopyOnReadRead_83/DisableCopyOnRead20
Read_83/ReadVariableOpRead_83/ReadVariableOp26
Read_84/DisableCopyOnReadRead_84/DisableCopyOnRead20
Read_84/ReadVariableOpRead_84/ReadVariableOp26
Read_85/DisableCopyOnReadRead_85/DisableCopyOnRead20
Read_85/ReadVariableOpRead_85/ReadVariableOp26
Read_86/DisableCopyOnReadRead_86/DisableCopyOnRead20
Read_86/ReadVariableOpRead_86/ReadVariableOp26
Read_87/DisableCopyOnReadRead_87/DisableCopyOnRead20
Read_87/ReadVariableOpRead_87/ReadVariableOp26
Read_88/DisableCopyOnReadRead_88/DisableCopyOnRead20
Read_88/ReadVariableOpRead_88/ReadVariableOp26
Read_89/DisableCopyOnReadRead_89/DisableCopyOnRead20
Read_89/ReadVariableOpRead_89/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp26
Read_90/DisableCopyOnReadRead_90/DisableCopyOnRead20
Read_90/ReadVariableOpRead_90/ReadVariableOp26
Read_91/DisableCopyOnReadRead_91/DisableCopyOnRead20
Read_91/ReadVariableOpRead_91/ReadVariableOp26
Read_92/DisableCopyOnReadRead_92/DisableCopyOnRead20
Read_92/ReadVariableOpRead_92/ReadVariableOp26
Read_93/DisableCopyOnReadRead_93/DisableCopyOnRead20
Read_93/ReadVariableOpRead_93/ReadVariableOp26
Read_94/DisableCopyOnReadRead_94/DisableCopyOnRead20
Read_94/ReadVariableOpRead_94/ReadVariableOp26
Read_95/DisableCopyOnReadRead_95/DisableCopyOnRead20
Read_95/ReadVariableOpRead_95/ReadVariableOp26
Read_96/DisableCopyOnReadRead_96/DisableCopyOnRead20
Read_96/ReadVariableOpRead_96/ReadVariableOp26
Read_97/DisableCopyOnReadRead_97/DisableCopyOnRead20
Read_97/ReadVariableOpRead_97/ReadVariableOp26
Read_98/DisableCopyOnReadRead_98/DisableCopyOnRead20
Read_98/ReadVariableOpRead_98/ReadVariableOp26
Read_99/DisableCopyOnReadRead_99/DisableCopyOnRead20
Read_99/ReadVariableOpRead_99/ReadVariableOp:=l9

_output_shapes
: 

_user_specified_nameConst:4k0
.
_user_specified_namebn/moving_variance_1:0j,
*
_user_specified_namebn/moving_mean_1:,i(
&
_user_specified_namedense/bias_1:.h*
(
_user_specified_namemha/key/bias_1:Ag=
;
_user_specified_name#!gru_2/gru_cell/recurrent_kernel_1:@f<
:
_user_specified_name" gru1/gru_cell/recurrent_kernel_1:be^
\
_user_specified_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias_1:dd`
^
_user_specified_nameFDtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel_1:dc`
^
_user_specified_nameFDtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel_1:-b)
'
_user_specified_nameconv1d/bias_1:2a.
,
_user_specified_namemha/query/kernel_1:4`0
.
_user_specified_namegru1/gru_cell/bias_1:0_,
*
_user_specified_namedense_1/kernel_1:.^*
(
_user_specified_namedense/kernel_1:;]7
5
_user_specified_namemha/attention_output/bias_1:d\`
^
_user_specified_nameFDtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel_1:d[`
^
_user_specified_nameFDtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel_1:0Z,
*
_user_specified_nameattn_norm/beta_1:6Y2
0
_user_specified_namegru1/gru_cell/kernel_1:dX`
^
_user_specified_nameFDtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel_1:dW`
^
_user_specified_nameFDtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel_1:dV`
^
_user_specified_nameFDtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel_1:1U-
+
_user_specified_nameattn_norm/gamma_1:0T,
*
_user_specified_namemha/key/kernel_1:dS`
^
_user_specified_nameFDtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel_1:dR`
^
_user_specified_nameFDtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel_1:0Q,
*
_user_specified_namemha/value/bias_1:0P,
*
_user_specified_namemha/query/bias_1:*O&
$
_user_specified_name
bn/gamma_1:dN`
^
_user_specified_nameFDtcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel_1:bM^
\
_user_specified_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias_1:bL^
\
_user_specified_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias_1:bK^
\
_user_specified_nameDBtcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias_1:/J+
)
_user_specified_nameconv1d/kernel_1:.I*
(
_user_specified_namedense_1/bias_1:=H9
7
_user_specified_namemha/attention_output/kernel_1:)G%
#
_user_specified_name	bn/beta_1:bF^
\
_user_specified_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias_1:bE^
\
_user_specified_nameDBtcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias_1:bD^
\
_user_specified_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias_1:bC^
\
_user_specified_nameDBtcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias_1:2B.
,
_user_specified_namemha/value/kernel_1:5A1
/
_user_specified_namegru_2/gru_cell/bias_1:7@3
1
_user_specified_namegru_2/gru_cell/kernel_1:b?^
\
_user_specified_nameDBtcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias_1:b>^
\
_user_specified_nameDBtcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias_1:(=$
"
_user_specified_name
Variable:*<&
$
_user_specified_name
Variable_1:*;&
$
_user_specified_name
Variable_2:*:&
$
_user_specified_name
Variable_3:*9&
$
_user_specified_name
Variable_4:*8&
$
_user_specified_name
Variable_5:*7&
$
_user_specified_name
Variable_6:*6&
$
_user_specified_name
Variable_7:*5&
$
_user_specified_name
Variable_8:*4&
$
_user_specified_name
Variable_9:+3'
%
_user_specified_nameVariable_10:+2'
%
_user_specified_nameVariable_11:+1'
%
_user_specified_nameVariable_12:+0'
%
_user_specified_nameVariable_13:+/'
%
_user_specified_nameVariable_14:+.'
%
_user_specified_nameVariable_15:+-'
%
_user_specified_nameVariable_16:+,'
%
_user_specified_nameVariable_17:++'
%
_user_specified_nameVariable_18:+*'
%
_user_specified_nameVariable_19:+)'
%
_user_specified_nameVariable_20:+('
%
_user_specified_nameVariable_21:+''
%
_user_specified_nameVariable_22:+&'
%
_user_specified_nameVariable_23:+%'
%
_user_specified_nameVariable_24:+$'
%
_user_specified_nameVariable_25:+#'
%
_user_specified_nameVariable_26:+"'
%
_user_specified_nameVariable_27:+!'
%
_user_specified_nameVariable_28:+ '
%
_user_specified_nameVariable_29:+'
%
_user_specified_nameVariable_30:+'
%
_user_specified_nameVariable_31:+'
%
_user_specified_nameVariable_32:+'
%
_user_specified_nameVariable_33:+'
%
_user_specified_nameVariable_34:+'
%
_user_specified_nameVariable_35:+'
%
_user_specified_nameVariable_36:+'
%
_user_specified_nameVariable_37:+'
%
_user_specified_nameVariable_38:+'
%
_user_specified_nameVariable_39:+'
%
_user_specified_nameVariable_40:+'
%
_user_specified_nameVariable_41:+'
%
_user_specified_nameVariable_42:+'
%
_user_specified_nameVariable_43:+'
%
_user_specified_nameVariable_44:+'
%
_user_specified_nameVariable_45:+'
%
_user_specified_nameVariable_46:+'
%
_user_specified_nameVariable_47:+'
%
_user_specified_nameVariable_48:+'
%
_user_specified_nameVariable_49:+'
%
_user_specified_nameVariable_50:+
'
%
_user_specified_nameVariable_51:+	'
%
_user_specified_nameVariable_52:+'
%
_user_specified_nameVariable_53:+'
%
_user_specified_nameVariable_54:+'
%
_user_specified_nameVariable_55:+'
%
_user_specified_nameVariable_56:+'
%
_user_specified_nameVariable_57:+'
%
_user_specified_nameVariable_58:+'
%
_user_specified_nameVariable_59:+'
%
_user_specified_nameVariable_60:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
��
��
__inference___call___4936
input_sequence\
Fmodel_baba_1_conv1d_1_convolution_expanddims_1_readvariableop_resource:+@C
5model_baba_1_conv1d_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_0_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_1_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_0_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_1_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_0_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_1_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_0_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_1_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_0_1_reshape_readvariableop_resource:@{
emodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource:@@b
Tmodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_1_1_reshape_readvariableop_resource:@<
.model_baba_1_bn_1_cast_readvariableop_resource:@>
0model_baba_1_bn_1_cast_1_readvariableop_resource:@>
0model_baba_1_bn_1_cast_2_readvariableop_resource:@>
0model_baba_1_bn_1_cast_3_readvariableop_resource:@D
1model_baba_1_gru1_1_split_readvariableop_resource:	@�F
3model_baba_1_gru1_1_split_1_readvariableop_resource:	@�F
3model_baba_1_gru1_1_reshape_readvariableop_resource:	�D
2model_baba_1_gru_2_1_split_readvariableop_resource:@0F
4model_baba_1_gru_2_1_split_1_readvariableop_resource:0F
4model_baba_1_gru_2_1_reshape_readvariableop_resource:0M
7model_baba_1_mha_1_query_1_cast_readvariableop_resource: H
6model_baba_1_mha_1_query_1_add_readvariableop_resource: K
5model_baba_1_mha_1_key_1_cast_readvariableop_resource: F
4model_baba_1_mha_1_key_1_add_readvariableop_resource: M
7model_baba_1_mha_1_value_1_cast_readvariableop_resource: H
6model_baba_1_mha_1_value_1_add_readvariableop_resource: X
Bmodel_baba_1_mha_1_attention_output_1_cast_readvariableop_resource: O
Amodel_baba_1_mha_1_attention_output_1_add_readvariableop_resource:F
8model_baba_1_attn_norm_1_reshape_readvariableop_resource:H
:model_baba_1_attn_norm_1_reshape_1_readvariableop_resource:F
4model_baba_1_td_dense_1_cast_readvariableop_resource:E
7model_baba_1_td_dense_1_biasadd_readvariableop_resource:G
5model_baba_1_td_output_1_cast_readvariableop_resource:B
4model_baba_1_td_output_1_add_readvariableop_resource:
identity��/model_baba_1/attn_norm_1/Reshape/ReadVariableOp�1model_baba_1/attn_norm_1/Reshape_1/ReadVariableOp�%model_baba_1/bn_1/Cast/ReadVariableOp�'model_baba_1/bn_1/Cast_1/ReadVariableOp�'model_baba_1/bn_1/Cast_2/ReadVariableOp�'model_baba_1/bn_1/Cast_3/ReadVariableOp�,model_baba_1/conv1d_1/Reshape/ReadVariableOp�=model_baba_1/conv1d_1/convolution/ExpandDims_1/ReadVariableOp�*model_baba_1/gru1_1/Reshape/ReadVariableOp�(model_baba_1/gru1_1/split/ReadVariableOp�*model_baba_1/gru1_1/split_1/ReadVariableOp�+model_baba_1/gru_2_1/Reshape/ReadVariableOp�)model_baba_1/gru_2_1/split/ReadVariableOp�+model_baba_1/gru_2_1/split_1/ReadVariableOp�9model_baba_1/mha_1/attention_output_1/Cast/ReadVariableOp�8model_baba_1/mha_1/attention_output_1/add/ReadVariableOp�,model_baba_1/mha_1/key_1/Cast/ReadVariableOp�+model_baba_1/mha_1/key_1/add/ReadVariableOp�.model_baba_1/mha_1/query_1/Cast/ReadVariableOp�-model_baba_1/mha_1/query_1/add/ReadVariableOp�.model_baba_1/mha_1/value_1/Cast/ReadVariableOp�-model_baba_1/mha_1/value_1/add/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp�Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/ReadVariableOp�\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp�.model_baba_1/td_dense_1/BiasAdd/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_1/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_10/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_11/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_12/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_13/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_14/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_15/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_16/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_17/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_18/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_19/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_2/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_20/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_21/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_22/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_23/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_24/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_25/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_26/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_27/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_28/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_29/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_3/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_30/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_31/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_32/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_33/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_34/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_35/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_36/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_37/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_38/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_39/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_4/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_40/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_41/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_42/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_43/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_44/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_45/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_46/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_47/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_48/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_49/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_5/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_50/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_51/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_52/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_53/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_54/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_55/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_56/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_57/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_58/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_59/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_6/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_60/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_61/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_62/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_63/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_64/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_65/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_66/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_67/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_68/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_69/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_7/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_70/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_71/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_72/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_73/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_74/ReadVariableOp�1model_baba_1/td_dense_1/BiasAdd_75/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_8/ReadVariableOp�0model_baba_1/td_dense_1/BiasAdd_9/ReadVariableOp�+model_baba_1/td_dense_1/Cast/ReadVariableOp�-model_baba_1/td_dense_1/Cast_1/ReadVariableOp�.model_baba_1/td_dense_1/Cast_10/ReadVariableOp�.model_baba_1/td_dense_1/Cast_11/ReadVariableOp�.model_baba_1/td_dense_1/Cast_12/ReadVariableOp�.model_baba_1/td_dense_1/Cast_13/ReadVariableOp�.model_baba_1/td_dense_1/Cast_14/ReadVariableOp�.model_baba_1/td_dense_1/Cast_15/ReadVariableOp�.model_baba_1/td_dense_1/Cast_16/ReadVariableOp�.model_baba_1/td_dense_1/Cast_17/ReadVariableOp�.model_baba_1/td_dense_1/Cast_18/ReadVariableOp�.model_baba_1/td_dense_1/Cast_19/ReadVariableOp�-model_baba_1/td_dense_1/Cast_2/ReadVariableOp�.model_baba_1/td_dense_1/Cast_20/ReadVariableOp�.model_baba_1/td_dense_1/Cast_21/ReadVariableOp�.model_baba_1/td_dense_1/Cast_22/ReadVariableOp�.model_baba_1/td_dense_1/Cast_23/ReadVariableOp�.model_baba_1/td_dense_1/Cast_24/ReadVariableOp�.model_baba_1/td_dense_1/Cast_25/ReadVariableOp�.model_baba_1/td_dense_1/Cast_26/ReadVariableOp�.model_baba_1/td_dense_1/Cast_27/ReadVariableOp�.model_baba_1/td_dense_1/Cast_28/ReadVariableOp�.model_baba_1/td_dense_1/Cast_29/ReadVariableOp�-model_baba_1/td_dense_1/Cast_3/ReadVariableOp�.model_baba_1/td_dense_1/Cast_30/ReadVariableOp�.model_baba_1/td_dense_1/Cast_31/ReadVariableOp�.model_baba_1/td_dense_1/Cast_32/ReadVariableOp�.model_baba_1/td_dense_1/Cast_33/ReadVariableOp�.model_baba_1/td_dense_1/Cast_34/ReadVariableOp�.model_baba_1/td_dense_1/Cast_35/ReadVariableOp�.model_baba_1/td_dense_1/Cast_36/ReadVariableOp�.model_baba_1/td_dense_1/Cast_37/ReadVariableOp�.model_baba_1/td_dense_1/Cast_38/ReadVariableOp�.model_baba_1/td_dense_1/Cast_39/ReadVariableOp�-model_baba_1/td_dense_1/Cast_4/ReadVariableOp�.model_baba_1/td_dense_1/Cast_40/ReadVariableOp�.model_baba_1/td_dense_1/Cast_41/ReadVariableOp�.model_baba_1/td_dense_1/Cast_42/ReadVariableOp�.model_baba_1/td_dense_1/Cast_43/ReadVariableOp�.model_baba_1/td_dense_1/Cast_44/ReadVariableOp�.model_baba_1/td_dense_1/Cast_45/ReadVariableOp�.model_baba_1/td_dense_1/Cast_46/ReadVariableOp�.model_baba_1/td_dense_1/Cast_47/ReadVariableOp�.model_baba_1/td_dense_1/Cast_48/ReadVariableOp�.model_baba_1/td_dense_1/Cast_49/ReadVariableOp�-model_baba_1/td_dense_1/Cast_5/ReadVariableOp�.model_baba_1/td_dense_1/Cast_50/ReadVariableOp�.model_baba_1/td_dense_1/Cast_51/ReadVariableOp�.model_baba_1/td_dense_1/Cast_52/ReadVariableOp�.model_baba_1/td_dense_1/Cast_53/ReadVariableOp�.model_baba_1/td_dense_1/Cast_54/ReadVariableOp�.model_baba_1/td_dense_1/Cast_55/ReadVariableOp�.model_baba_1/td_dense_1/Cast_56/ReadVariableOp�.model_baba_1/td_dense_1/Cast_57/ReadVariableOp�.model_baba_1/td_dense_1/Cast_58/ReadVariableOp�.model_baba_1/td_dense_1/Cast_59/ReadVariableOp�-model_baba_1/td_dense_1/Cast_6/ReadVariableOp�.model_baba_1/td_dense_1/Cast_60/ReadVariableOp�.model_baba_1/td_dense_1/Cast_61/ReadVariableOp�.model_baba_1/td_dense_1/Cast_62/ReadVariableOp�.model_baba_1/td_dense_1/Cast_63/ReadVariableOp�.model_baba_1/td_dense_1/Cast_64/ReadVariableOp�.model_baba_1/td_dense_1/Cast_65/ReadVariableOp�.model_baba_1/td_dense_1/Cast_66/ReadVariableOp�.model_baba_1/td_dense_1/Cast_67/ReadVariableOp�.model_baba_1/td_dense_1/Cast_68/ReadVariableOp�.model_baba_1/td_dense_1/Cast_69/ReadVariableOp�-model_baba_1/td_dense_1/Cast_7/ReadVariableOp�.model_baba_1/td_dense_1/Cast_70/ReadVariableOp�.model_baba_1/td_dense_1/Cast_71/ReadVariableOp�.model_baba_1/td_dense_1/Cast_72/ReadVariableOp�.model_baba_1/td_dense_1/Cast_73/ReadVariableOp�.model_baba_1/td_dense_1/Cast_74/ReadVariableOp�.model_baba_1/td_dense_1/Cast_75/ReadVariableOp�-model_baba_1/td_dense_1/Cast_8/ReadVariableOp�-model_baba_1/td_dense_1/Cast_9/ReadVariableOp�+model_baba_1/td_output_1/Add/ReadVariableOp�-model_baba_1/td_output_1/Add_1/ReadVariableOp�.model_baba_1/td_output_1/Add_10/ReadVariableOp�.model_baba_1/td_output_1/Add_11/ReadVariableOp�.model_baba_1/td_output_1/Add_12/ReadVariableOp�.model_baba_1/td_output_1/Add_13/ReadVariableOp�.model_baba_1/td_output_1/Add_14/ReadVariableOp�.model_baba_1/td_output_1/Add_15/ReadVariableOp�.model_baba_1/td_output_1/Add_16/ReadVariableOp�.model_baba_1/td_output_1/Add_17/ReadVariableOp�.model_baba_1/td_output_1/Add_18/ReadVariableOp�.model_baba_1/td_output_1/Add_19/ReadVariableOp�-model_baba_1/td_output_1/Add_2/ReadVariableOp�.model_baba_1/td_output_1/Add_20/ReadVariableOp�.model_baba_1/td_output_1/Add_21/ReadVariableOp�.model_baba_1/td_output_1/Add_22/ReadVariableOp�.model_baba_1/td_output_1/Add_23/ReadVariableOp�.model_baba_1/td_output_1/Add_24/ReadVariableOp�.model_baba_1/td_output_1/Add_25/ReadVariableOp�.model_baba_1/td_output_1/Add_26/ReadVariableOp�.model_baba_1/td_output_1/Add_27/ReadVariableOp�.model_baba_1/td_output_1/Add_28/ReadVariableOp�.model_baba_1/td_output_1/Add_29/ReadVariableOp�-model_baba_1/td_output_1/Add_3/ReadVariableOp�.model_baba_1/td_output_1/Add_30/ReadVariableOp�.model_baba_1/td_output_1/Add_31/ReadVariableOp�.model_baba_1/td_output_1/Add_32/ReadVariableOp�.model_baba_1/td_output_1/Add_33/ReadVariableOp�.model_baba_1/td_output_1/Add_34/ReadVariableOp�.model_baba_1/td_output_1/Add_35/ReadVariableOp�.model_baba_1/td_output_1/Add_36/ReadVariableOp�.model_baba_1/td_output_1/Add_37/ReadVariableOp�.model_baba_1/td_output_1/Add_38/ReadVariableOp�.model_baba_1/td_output_1/Add_39/ReadVariableOp�-model_baba_1/td_output_1/Add_4/ReadVariableOp�.model_baba_1/td_output_1/Add_40/ReadVariableOp�.model_baba_1/td_output_1/Add_41/ReadVariableOp�.model_baba_1/td_output_1/Add_42/ReadVariableOp�.model_baba_1/td_output_1/Add_43/ReadVariableOp�.model_baba_1/td_output_1/Add_44/ReadVariableOp�.model_baba_1/td_output_1/Add_45/ReadVariableOp�.model_baba_1/td_output_1/Add_46/ReadVariableOp�.model_baba_1/td_output_1/Add_47/ReadVariableOp�.model_baba_1/td_output_1/Add_48/ReadVariableOp�.model_baba_1/td_output_1/Add_49/ReadVariableOp�-model_baba_1/td_output_1/Add_5/ReadVariableOp�.model_baba_1/td_output_1/Add_50/ReadVariableOp�.model_baba_1/td_output_1/Add_51/ReadVariableOp�.model_baba_1/td_output_1/Add_52/ReadVariableOp�.model_baba_1/td_output_1/Add_53/ReadVariableOp�.model_baba_1/td_output_1/Add_54/ReadVariableOp�.model_baba_1/td_output_1/Add_55/ReadVariableOp�.model_baba_1/td_output_1/Add_56/ReadVariableOp�.model_baba_1/td_output_1/Add_57/ReadVariableOp�.model_baba_1/td_output_1/Add_58/ReadVariableOp�.model_baba_1/td_output_1/Add_59/ReadVariableOp�-model_baba_1/td_output_1/Add_6/ReadVariableOp�.model_baba_1/td_output_1/Add_60/ReadVariableOp�.model_baba_1/td_output_1/Add_61/ReadVariableOp�.model_baba_1/td_output_1/Add_62/ReadVariableOp�.model_baba_1/td_output_1/Add_63/ReadVariableOp�.model_baba_1/td_output_1/Add_64/ReadVariableOp�.model_baba_1/td_output_1/Add_65/ReadVariableOp�.model_baba_1/td_output_1/Add_66/ReadVariableOp�.model_baba_1/td_output_1/Add_67/ReadVariableOp�.model_baba_1/td_output_1/Add_68/ReadVariableOp�.model_baba_1/td_output_1/Add_69/ReadVariableOp�-model_baba_1/td_output_1/Add_7/ReadVariableOp�.model_baba_1/td_output_1/Add_70/ReadVariableOp�.model_baba_1/td_output_1/Add_71/ReadVariableOp�.model_baba_1/td_output_1/Add_72/ReadVariableOp�.model_baba_1/td_output_1/Add_73/ReadVariableOp�.model_baba_1/td_output_1/Add_74/ReadVariableOp�.model_baba_1/td_output_1/Add_75/ReadVariableOp�-model_baba_1/td_output_1/Add_8/ReadVariableOp�-model_baba_1/td_output_1/Add_9/ReadVariableOp�,model_baba_1/td_output_1/Cast/ReadVariableOp�.model_baba_1/td_output_1/Cast_1/ReadVariableOp�/model_baba_1/td_output_1/Cast_10/ReadVariableOp�/model_baba_1/td_output_1/Cast_11/ReadVariableOp�/model_baba_1/td_output_1/Cast_12/ReadVariableOp�/model_baba_1/td_output_1/Cast_13/ReadVariableOp�/model_baba_1/td_output_1/Cast_14/ReadVariableOp�/model_baba_1/td_output_1/Cast_15/ReadVariableOp�/model_baba_1/td_output_1/Cast_16/ReadVariableOp�/model_baba_1/td_output_1/Cast_17/ReadVariableOp�/model_baba_1/td_output_1/Cast_18/ReadVariableOp�/model_baba_1/td_output_1/Cast_19/ReadVariableOp�.model_baba_1/td_output_1/Cast_2/ReadVariableOp�/model_baba_1/td_output_1/Cast_20/ReadVariableOp�/model_baba_1/td_output_1/Cast_21/ReadVariableOp�/model_baba_1/td_output_1/Cast_22/ReadVariableOp�/model_baba_1/td_output_1/Cast_23/ReadVariableOp�/model_baba_1/td_output_1/Cast_24/ReadVariableOp�/model_baba_1/td_output_1/Cast_25/ReadVariableOp�/model_baba_1/td_output_1/Cast_26/ReadVariableOp�/model_baba_1/td_output_1/Cast_27/ReadVariableOp�/model_baba_1/td_output_1/Cast_28/ReadVariableOp�/model_baba_1/td_output_1/Cast_29/ReadVariableOp�.model_baba_1/td_output_1/Cast_3/ReadVariableOp�/model_baba_1/td_output_1/Cast_30/ReadVariableOp�/model_baba_1/td_output_1/Cast_31/ReadVariableOp�/model_baba_1/td_output_1/Cast_32/ReadVariableOp�/model_baba_1/td_output_1/Cast_33/ReadVariableOp�/model_baba_1/td_output_1/Cast_34/ReadVariableOp�/model_baba_1/td_output_1/Cast_35/ReadVariableOp�/model_baba_1/td_output_1/Cast_36/ReadVariableOp�/model_baba_1/td_output_1/Cast_37/ReadVariableOp�/model_baba_1/td_output_1/Cast_38/ReadVariableOp�/model_baba_1/td_output_1/Cast_39/ReadVariableOp�.model_baba_1/td_output_1/Cast_4/ReadVariableOp�/model_baba_1/td_output_1/Cast_40/ReadVariableOp�/model_baba_1/td_output_1/Cast_41/ReadVariableOp�/model_baba_1/td_output_1/Cast_42/ReadVariableOp�/model_baba_1/td_output_1/Cast_43/ReadVariableOp�/model_baba_1/td_output_1/Cast_44/ReadVariableOp�/model_baba_1/td_output_1/Cast_45/ReadVariableOp�/model_baba_1/td_output_1/Cast_46/ReadVariableOp�/model_baba_1/td_output_1/Cast_47/ReadVariableOp�/model_baba_1/td_output_1/Cast_48/ReadVariableOp�/model_baba_1/td_output_1/Cast_49/ReadVariableOp�.model_baba_1/td_output_1/Cast_5/ReadVariableOp�/model_baba_1/td_output_1/Cast_50/ReadVariableOp�/model_baba_1/td_output_1/Cast_51/ReadVariableOp�/model_baba_1/td_output_1/Cast_52/ReadVariableOp�/model_baba_1/td_output_1/Cast_53/ReadVariableOp�/model_baba_1/td_output_1/Cast_54/ReadVariableOp�/model_baba_1/td_output_1/Cast_55/ReadVariableOp�/model_baba_1/td_output_1/Cast_56/ReadVariableOp�/model_baba_1/td_output_1/Cast_57/ReadVariableOp�/model_baba_1/td_output_1/Cast_58/ReadVariableOp�/model_baba_1/td_output_1/Cast_59/ReadVariableOp�.model_baba_1/td_output_1/Cast_6/ReadVariableOp�/model_baba_1/td_output_1/Cast_60/ReadVariableOp�/model_baba_1/td_output_1/Cast_61/ReadVariableOp�/model_baba_1/td_output_1/Cast_62/ReadVariableOp�/model_baba_1/td_output_1/Cast_63/ReadVariableOp�/model_baba_1/td_output_1/Cast_64/ReadVariableOp�/model_baba_1/td_output_1/Cast_65/ReadVariableOp�/model_baba_1/td_output_1/Cast_66/ReadVariableOp�/model_baba_1/td_output_1/Cast_67/ReadVariableOp�/model_baba_1/td_output_1/Cast_68/ReadVariableOp�/model_baba_1/td_output_1/Cast_69/ReadVariableOp�.model_baba_1/td_output_1/Cast_7/ReadVariableOp�/model_baba_1/td_output_1/Cast_70/ReadVariableOp�/model_baba_1/td_output_1/Cast_71/ReadVariableOp�/model_baba_1/td_output_1/Cast_72/ReadVariableOp�/model_baba_1/td_output_1/Cast_73/ReadVariableOp�/model_baba_1/td_output_1/Cast_74/ReadVariableOp�/model_baba_1/td_output_1/Cast_75/ReadVariableOp�.model_baba_1/td_output_1/Cast_8/ReadVariableOp�.model_baba_1/td_output_1/Cast_9/ReadVariableOpa
model_baba_1/masking_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
model_baba_1/masking_1/NotEqualNotEqualinput_sequence%model_baba_1/masking_1/Const:output:0*
T0*+
_output_shapes
:���������L+w
,model_baba_1/masking_1/Any/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
����������
model_baba_1/masking_1/AnyAny#model_baba_1/masking_1/NotEqual:z:05model_baba_1/masking_1/Any/reduction_indices:output:0*+
_output_shapes
:���������L*
	keep_dims(�
model_baba_1/masking_1/CastCast#model_baba_1/masking_1/Any:output:0*

DstT0*

SrcT0
*+
_output_shapes
:���������L�
model_baba_1/masking_1/mulMulinput_sequencemodel_baba_1/masking_1/Cast:y:0*
T0*+
_output_shapes
:���������L+�
model_baba_1/masking_1/SqueezeSqueeze#model_baba_1/masking_1/Any:output:0*
T0
*'
_output_shapes
:���������L*
squeeze_dims
{
0model_baba_1/conv1d_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
,model_baba_1/conv1d_1/convolution/ExpandDims
ExpandDimsmodel_baba_1/masking_1/mul:z:09model_baba_1/conv1d_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������L+�
=model_baba_1/conv1d_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpFmodel_baba_1_conv1d_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:+@*
dtype0t
2model_baba_1/conv1d_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
.model_baba_1/conv1d_1/convolution/ExpandDims_1
ExpandDimsEmodel_baba_1/conv1d_1/convolution/ExpandDims_1/ReadVariableOp:value:0;model_baba_1/conv1d_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:+@�
!model_baba_1/conv1d_1/convolutionConv2D5model_baba_1/conv1d_1/convolution/ExpandDims:output:07model_baba_1/conv1d_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������L@*
paddingSAME*
strides
�
)model_baba_1/conv1d_1/convolution/SqueezeSqueeze*model_baba_1/conv1d_1/convolution:output:0*
T0*+
_output_shapes
:���������L@*
squeeze_dims

����������
,model_baba_1/conv1d_1/Reshape/ReadVariableOpReadVariableOp5model_baba_1_conv1d_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0x
#model_baba_1/conv1d_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
model_baba_1/conv1d_1/ReshapeReshape4model_baba_1/conv1d_1/Reshape/ReadVariableOp:value:0,model_baba_1/conv1d_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@u
model_baba_1/conv1d_1/SqueezeSqueeze&model_baba_1/conv1d_1/Reshape:output:0*
T0*
_output_shapes
:@�
model_baba_1/conv1d_1/BiasAddBiasAdd2model_baba_1/conv1d_1/convolution/Squeeze:output:0&model_baba_1/conv1d_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
model_baba_1/conv1d_1/ReluRelu&model_baba_1/conv1d_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/PadPad(model_baba_1/conv1d_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Const:output:0*
T0*+
_output_shapes
:���������N@�
Omodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims
ExpandDimsAmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Pad:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������N@�
\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������L@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution:output:0*
T0*+
_output_shapes
:���������L@*
squeeze_dims

����������
Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_0_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/BiasAddBiasAddQmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/Squeeze:output:0Emodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv1D_0_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/PadPadKmodel_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv1D_0_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Const:output:0*
T0*+
_output_shapes
:���������N@�
Omodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims
ExpandDimsAmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Pad:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������N@�
\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������L@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution:output:0*
T0*+
_output_shapes
:���������L@*
squeeze_dims

����������
Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_0_1_conv1d_1_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/BiasAddBiasAddQmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/Squeeze:output:0Emodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv1D_1_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
@model_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv_Blocks_1/ReluReluKmodel_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv1D_1_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
7model_baba_1/tcn_cnn_1/residual_block_0_1/Add_Res_1/AddAddV2(model_baba_1/conv1d_1/Relu:activations:0Nmodel_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
>model_baba_1/tcn_cnn_1/residual_block_0_1/Act_Res_Block_1/ReluRelu;model_baba_1/tcn_cnn_1/residual_block_0_1/Add_Res_1/Add:z:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/PadPadLmodel_baba_1/tcn_cnn_1/residual_block_0_1/Act_Res_Block_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Const:output:0*
T0*+
_output_shapes
:���������P@�
Nmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:P�
omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
gmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
[model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������(@�
Omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������(@�
\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������&@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution:output:0*
T0*+
_output_shapes
:���������&@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_0_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv1D_0_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/PadPadKmodel_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv1D_0_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Const:output:0*
T0*+
_output_shapes
:���������P@�
Nmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:P�
omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
gmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
[model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������(@�
Omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������(@�
\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������&@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution:output:0*
T0*+
_output_shapes
:���������&@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_1_1_conv1d_1_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv1D_1_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
@model_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv_Blocks_1/ReluReluKmodel_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv1D_1_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
7model_baba_1/tcn_cnn_1/residual_block_1_1/Add_Res_1/AddAddV2Lmodel_baba_1/tcn_cnn_1/residual_block_0_1/Act_Res_Block_1/Relu:activations:0Nmodel_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
>model_baba_1/tcn_cnn_1/residual_block_1_1/Act_Res_Block_1/ReluRelu;model_baba_1/tcn_cnn_1/residual_block_1_1/Add_Res_1/Add:z:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/PadPadLmodel_baba_1/tcn_cnn_1/residual_block_1_1/Act_Res_Block_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Const:output:0*
T0*+
_output_shapes
:���������T@�
Nmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:T�
omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
gmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
[model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������@�
Omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������@�
\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution:output:0*
T0*+
_output_shapes
:���������@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_0_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv1D_0_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/PadPadKmodel_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv1D_0_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Const:output:0*
T0*+
_output_shapes
:���������T@�
Nmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:T�
omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
gmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
[model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������@�
Omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������@�
\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution:output:0*
T0*+
_output_shapes
:���������@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"        �
Omodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_2_1_conv1d_1_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv1D_1_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
@model_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv_Blocks_1/ReluReluKmodel_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv1D_1_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
7model_baba_1/tcn_cnn_1/residual_block_2_1/Add_Res_1/AddAddV2Lmodel_baba_1/tcn_cnn_1/residual_block_1_1/Act_Res_Block_1/Relu:activations:0Nmodel_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
>model_baba_1/tcn_cnn_1/residual_block_2_1/Act_Res_Block_1/ReluRelu;model_baba_1/tcn_cnn_1/residual_block_2_1/Add_Res_1/Add:z:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/PadPadLmodel_baba_1/tcn_cnn_1/residual_block_2_1/Act_Res_Block_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Const:output:0*
T0*+
_output_shapes
:���������\@�
Nmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:\�
omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
gmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
[model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������@�
Omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������@�
\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������
@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution:output:0*
T0*+
_output_shapes
:���������
@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_0_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv1D_0_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                       �
8model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/PadPadKmodel_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv1D_0_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Const:output:0*
T0*+
_output_shapes
:���������\@�
Nmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:\�
omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
gmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
[model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������@�
Omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������@�
\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������
@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution:output:0*
T0*+
_output_shapes
:���������
@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_3_1_conv1d_1_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv1D_1_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
@model_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv_Blocks_1/ReluReluKmodel_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv1D_1_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
7model_baba_1/tcn_cnn_1/residual_block_3_1/Add_Res_1/AddAddV2Lmodel_baba_1/tcn_cnn_1/residual_block_2_1/Act_Res_Block_1/Relu:activations:0Nmodel_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
>model_baba_1/tcn_cnn_1/residual_block_3_1/Act_Res_Block_1/ReluRelu;model_baba_1/tcn_cnn_1/residual_block_3_1/Add_Res_1/Add:z:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                        �
8model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/PadPadLmodel_baba_1/tcn_cnn_1/residual_block_3_1/Act_Res_Block_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Const:output:0*
T0*+
_output_shapes
:���������l@�
Nmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:l�
omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
gmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
[model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������@�
Omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������@�
\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_0_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution:output:0*
T0*+
_output_shapes
:���������@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_0_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv1D_0_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
:model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/ConstConst*
_output_shapes

:*
dtype0*1
value(B&"                        �
8model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/PadPadKmodel_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv1D_0_1/Relu:activations:0Cmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Const:output:0*
T0*+
_output_shapes
:���������l@�
Nmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:�
mmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/required_space_to_batch_paddings/input_shapeConst*
_output_shapes
:*
dtype0*
valueB:l�
omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        �
jmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/required_space_to_batch_paddings/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
gmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/required_space_to_batch_paddings/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
[model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Xmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SpaceToBatchND/paddingsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SpaceToBatchNDSpaceToBatchNDAmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Pad:output:0dmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SpaceToBatchND/block_shape:output:0amodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SpaceToBatchND/paddings:output:0*
T0*+
_output_shapes
:���������@�
Omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims
ExpandDimsXmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SpaceToBatchND:output:0Xmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������@�
\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpReadVariableOpemodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_1_1_convolution_expanddims_1_readvariableop_resource*"
_output_shapes
:@@*
dtype0�
Qmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Mmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1
ExpandDimsdmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp:value:0Zmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:@@�
@model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolutionConv2DTmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims:output:0Vmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������@*
paddingVALID*
strides
�
Hmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/SqueezeSqueezeImodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution:output:0*
T0*+
_output_shapes
:���������@*
squeeze_dims

����������
[model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:�
Umodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/BatchToSpaceND/cropsConst*
_output_shapes

:*
dtype0*!
valueB"       �
Omodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/BatchToSpaceNDBatchToSpaceNDQmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/Squeeze:output:0dmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/BatchToSpaceND/block_shape:output:0^model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/BatchToSpaceND/crops:output:0*
T0*+
_output_shapes
:���������L@�
Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/ReadVariableOpReadVariableOpTmodel_baba_1_tcn_cnn_1_residual_block_4_1_conv1d_1_1_reshape_readvariableop_resource*
_output_shapes
:@*
dtype0�
Bmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"      @   �
<model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/ReshapeReshapeSmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/ReadVariableOp:value:0Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/shape:output:0*
T0*"
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/SqueezeSqueezeEmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape:output:0*
T0*
_output_shapes
:@�
<model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/BiasAddBiasAddXmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/BatchToSpaceND:output:0Emodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Squeeze:output:0*
T0*+
_output_shapes
:���������L@�
=model_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv1D_1_1/ReluReluEmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������L@�
@model_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv_Blocks_1/ReluReluKmodel_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv1D_1_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
7model_baba_1/tcn_cnn_1/residual_block_4_1/Add_Res_1/AddAddV2Lmodel_baba_1/tcn_cnn_1/residual_block_3_1/Act_Res_Block_1/Relu:activations:0Nmodel_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
>model_baba_1/tcn_cnn_1/residual_block_4_1/Act_Res_Block_1/ReluRelu;model_baba_1/tcn_cnn_1/residual_block_4_1/Add_Res_1/Add:z:0*
T0*+
_output_shapes
:���������L@�
1model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/AddAddV2Nmodel_baba_1/tcn_cnn_1/residual_block_0_1/Act_Conv_Blocks_1/Relu:activations:0Nmodel_baba_1/tcn_cnn_1/residual_block_1_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
3model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add_1AddV25model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add:z:0Nmodel_baba_1/tcn_cnn_1/residual_block_2_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
3model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add_2AddV27model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add_1:z:0Nmodel_baba_1/tcn_cnn_1/residual_block_3_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
3model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add_3AddV27model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add_2:z:0Nmodel_baba_1/tcn_cnn_1/residual_block_4_1/Act_Conv_Blocks_1/Relu:activations:0*
T0*+
_output_shapes
:���������L@�
%model_baba_1/bn_1/Cast/ReadVariableOpReadVariableOp.model_baba_1_bn_1_cast_readvariableop_resource*
_output_shapes
:@*
dtype0�
'model_baba_1/bn_1/Cast_1/ReadVariableOpReadVariableOp0model_baba_1_bn_1_cast_1_readvariableop_resource*
_output_shapes
:@*
dtype0�
'model_baba_1/bn_1/Cast_2/ReadVariableOpReadVariableOp0model_baba_1_bn_1_cast_2_readvariableop_resource*
_output_shapes
:@*
dtype0�
'model_baba_1/bn_1/Cast_3/ReadVariableOpReadVariableOp0model_baba_1_bn_1_cast_3_readvariableop_resource*
_output_shapes
:@*
dtype0f
!model_baba_1/bn_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
model_baba_1/bn_1/batchnorm/addAddV2/model_baba_1/bn_1/Cast_1/ReadVariableOp:value:0*model_baba_1/bn_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:@t
!model_baba_1/bn_1/batchnorm/RsqrtRsqrt#model_baba_1/bn_1/batchnorm/add:z:0*
T0*
_output_shapes
:@�
model_baba_1/bn_1/batchnorm/mulMul%model_baba_1/bn_1/batchnorm/Rsqrt:y:0/model_baba_1/bn_1/Cast_2/ReadVariableOp:value:0*
T0*
_output_shapes
:@�
!model_baba_1/bn_1/batchnorm/mul_1Mul7model_baba_1/tcn_cnn_1/Add_Skip_Connections_1/Add_3:z:0#model_baba_1/bn_1/batchnorm/mul:z:0*
T0*+
_output_shapes
:���������L@�
!model_baba_1/bn_1/batchnorm/mul_2Mul-model_baba_1/bn_1/Cast/ReadVariableOp:value:0#model_baba_1/bn_1/batchnorm/mul:z:0*
T0*
_output_shapes
:@�
model_baba_1/bn_1/batchnorm/subSub/model_baba_1/bn_1/Cast_3/ReadVariableOp:value:0%model_baba_1/bn_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@�
!model_baba_1/bn_1/batchnorm/add_1AddV2%model_baba_1/bn_1/batchnorm/mul_1:z:0#model_baba_1/bn_1/batchnorm/sub:z:0*
T0*+
_output_shapes
:���������L@|
model_baba_1/gru1_1/ShapeShape%model_baba_1/bn_1/batchnorm/add_1:z:0*
T0*
_output_shapes
::��q
'model_baba_1/gru1_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: s
)model_baba_1/gru1_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:s
)model_baba_1/gru1_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
!model_baba_1/gru1_1/strided_sliceStridedSlice"model_baba_1/gru1_1/Shape:output:00model_baba_1/gru1_1/strided_slice/stack:output:02model_baba_1/gru1_1/strided_slice/stack_1:output:02model_baba_1/gru1_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"model_baba_1/gru1_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :@�
 model_baba_1/gru1_1/zeros/packedPack*model_baba_1/gru1_1/strided_slice:output:0+model_baba_1/gru1_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:d
model_baba_1/gru1_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
model_baba_1/gru1_1/zerosFill)model_baba_1/gru1_1/zeros/packed:output:0(model_baba_1/gru1_1/zeros/Const:output:0*
T0*'
_output_shapes
:���������@~
)model_baba_1/gru1_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            �
+model_baba_1/gru1_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           �
+model_baba_1/gru1_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         �
#model_baba_1/gru1_1/strided_slice_1StridedSlice%model_baba_1/bn_1/batchnorm/add_1:z:02model_baba_1/gru1_1/strided_slice_1/stack:output:04model_baba_1/gru1_1/strided_slice_1/stack_1:output:04model_baba_1/gru1_1/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������@*

begin_mask*
end_mask*
shrink_axis_mask~
model_baba_1/gru1_1/Shape_1Shape%model_baba_1/bn_1/batchnorm/add_1:z:0*
T0*
_output_shapes
::��s
)model_baba_1/gru1_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: u
+model_baba_1/gru1_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:u
+model_baba_1/gru1_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
#model_baba_1/gru1_1/strided_slice_2StridedSlice$model_baba_1/gru1_1/Shape_1:output:02model_baba_1/gru1_1/strided_slice_2/stack:output:04model_baba_1/gru1_1/strided_slice_2/stack_1:output:04model_baba_1/gru1_1/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask~
model_baba_1/gru1_1/Shape_2Shape%model_baba_1/bn_1/batchnorm/add_1:z:0*
T0*
_output_shapes
::��s
)model_baba_1/gru1_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:u
+model_baba_1/gru1_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:u
+model_baba_1/gru1_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
#model_baba_1/gru1_1/strided_slice_3StridedSlice$model_baba_1/gru1_1/Shape_2:output:02model_baba_1/gru1_1/strided_slice_3/stack:output:04model_baba_1/gru1_1/strided_slice_3/stack_1:output:04model_baba_1/gru1_1/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
model_baba_1/gru1_1/Fill/dimsPack,model_baba_1/gru1_1/strided_slice_2:output:0*
N*
T0*
_output_shapes
:�
model_baba_1/gru1_1/FillFill&model_baba_1/gru1_1/Fill/dims:output:0,model_baba_1/gru1_1/strided_slice_3:output:0*
T0*#
_output_shapes
:���������d
"model_baba_1/gru1_1/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :�
model_baba_1/gru1_1/ExpandDims
ExpandDims"model_baba_1/gru1_1/zeros:output:0+model_baba_1/gru1_1/ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������@e
#model_baba_1/gru1_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :�
(model_baba_1/gru1_1/split/ReadVariableOpReadVariableOp1model_baba_1_gru1_1_split_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
model_baba_1/gru1_1/splitSplit,model_baba_1/gru1_1/split/split_dim:output:00model_baba_1/gru1_1/split/ReadVariableOp:value:0*
T0*2
_output_shapes 
:@@:@@:@@*
	num_splitg
%model_baba_1/gru1_1/split_1/split_dimConst*
_output_shapes
: *
dtype0*
value	B :�
*model_baba_1/gru1_1/split_1/ReadVariableOpReadVariableOp3model_baba_1_gru1_1_split_1_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
model_baba_1/gru1_1/split_1Split.model_baba_1/gru1_1/split_1/split_dim:output:02model_baba_1/gru1_1/split_1/ReadVariableOp:value:0*
T0*2
_output_shapes 
:@@:@@:@@*
	num_split�
*model_baba_1/gru1_1/Reshape/ReadVariableOpReadVariableOp3model_baba_1_gru1_1_reshape_readvariableop_resource*
_output_shapes
:	�*
dtype0t
!model_baba_1/gru1_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
����������
model_baba_1/gru1_1/ReshapeReshape2model_baba_1/gru1_1/Reshape/ReadVariableOp:value:0*model_baba_1/gru1_1/Reshape/shape:output:0*
T0*
_output_shapes	
:�g
%model_baba_1/gru1_1/split_2/split_dimConst*
_output_shapes
: *
dtype0*
value	B : �
model_baba_1/gru1_1/split_2Split.model_baba_1/gru1_1/split_2/split_dim:output:0$model_baba_1/gru1_1/Reshape:output:0*
T0*8
_output_shapes&
$:@:@:@:@:@:@*
	num_splitl
model_baba_1/gru1_1/ConstConst*
_output_shapes
:*
dtype0*
valueB:
���������s
"model_baba_1/gru1_1/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru1_1/transpose	Transpose"model_baba_1/gru1_1/split:output:1+model_baba_1/gru1_1/transpose/perm:output:0*
T0*
_output_shapes

:@@�
model_baba_1/gru1_1/Reshape_1Reshape!model_baba_1/gru1_1/transpose:y:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes	
:� u
$model_baba_1/gru1_1/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru1_1/transpose_1	Transpose"model_baba_1/gru1_1/split:output:0-model_baba_1/gru1_1/transpose_1/perm:output:0*
T0*
_output_shapes

:@@�
model_baba_1/gru1_1/Reshape_2Reshape#model_baba_1/gru1_1/transpose_1:y:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes	
:� u
$model_baba_1/gru1_1/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru1_1/transpose_2	Transpose"model_baba_1/gru1_1/split:output:2-model_baba_1/gru1_1/transpose_2/perm:output:0*
T0*
_output_shapes

:@@�
model_baba_1/gru1_1/Reshape_3Reshape#model_baba_1/gru1_1/transpose_2:y:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes	
:� u
$model_baba_1/gru1_1/transpose_3/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru1_1/transpose_3	Transpose$model_baba_1/gru1_1/split_1:output:1-model_baba_1/gru1_1/transpose_3/perm:output:0*
T0*
_output_shapes

:@@�
model_baba_1/gru1_1/Reshape_4Reshape#model_baba_1/gru1_1/transpose_3:y:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes	
:� u
$model_baba_1/gru1_1/transpose_4/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru1_1/transpose_4	Transpose$model_baba_1/gru1_1/split_1:output:0-model_baba_1/gru1_1/transpose_4/perm:output:0*
T0*
_output_shapes

:@@�
model_baba_1/gru1_1/Reshape_5Reshape#model_baba_1/gru1_1/transpose_4:y:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes	
:� u
$model_baba_1/gru1_1/transpose_5/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru1_1/transpose_5	Transpose$model_baba_1/gru1_1/split_1:output:2-model_baba_1/gru1_1/transpose_5/perm:output:0*
T0*
_output_shapes

:@@�
model_baba_1/gru1_1/Reshape_6Reshape#model_baba_1/gru1_1/transpose_5:y:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes	
:� �
model_baba_1/gru1_1/Reshape_7Reshape$model_baba_1/gru1_1/split_2:output:1"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes
:@�
model_baba_1/gru1_1/Reshape_8Reshape$model_baba_1/gru1_1/split_2:output:0"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes
:@�
model_baba_1/gru1_1/Reshape_9Reshape$model_baba_1/gru1_1/split_2:output:2"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes
:@�
model_baba_1/gru1_1/Reshape_10Reshape$model_baba_1/gru1_1/split_2:output:4"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes
:@�
model_baba_1/gru1_1/Reshape_11Reshape$model_baba_1/gru1_1/split_2:output:3"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes
:@�
model_baba_1/gru1_1/Reshape_12Reshape$model_baba_1/gru1_1/split_2:output:5"model_baba_1/gru1_1/Const:output:0*
T0*
_output_shapes
:@a
model_baba_1/gru1_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : �
model_baba_1/gru1_1/concatConcatV2&model_baba_1/gru1_1/Reshape_1:output:0&model_baba_1/gru1_1/Reshape_2:output:0&model_baba_1/gru1_1/Reshape_3:output:0&model_baba_1/gru1_1/Reshape_4:output:0&model_baba_1/gru1_1/Reshape_5:output:0&model_baba_1/gru1_1/Reshape_6:output:0&model_baba_1/gru1_1/Reshape_7:output:0&model_baba_1/gru1_1/Reshape_8:output:0&model_baba_1/gru1_1/Reshape_9:output:0'model_baba_1/gru1_1/Reshape_10:output:0'model_baba_1/gru1_1/Reshape_11:output:0'model_baba_1/gru1_1/Reshape_12:output:0(model_baba_1/gru1_1/concat/axis:output:0*
N*
T0*
_output_shapes

:��k
&model_baba_1/gru1_1/CudnnRNNV3/input_cConst*
_output_shapes
: *
dtype0*
valueB
 *    �
model_baba_1/gru1_1/CudnnRNNV3
CudnnRNNV3%model_baba_1/bn_1/batchnorm/add_1:z:0'model_baba_1/gru1_1/ExpandDims:output:0/model_baba_1/gru1_1/CudnnRNNV3/input_c:output:0#model_baba_1/gru1_1/concat:output:0!model_baba_1/gru1_1/Fill:output:0*
T0*L
_output_shapes:
8:���������L@:���������@: ::*
rnn_modegru*

time_major( |
)model_baba_1/gru1_1/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������u
+model_baba_1/gru1_1/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB: u
+model_baba_1/gru1_1/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
#model_baba_1/gru1_1/strided_slice_4StridedSlice'model_baba_1/gru1_1/CudnnRNNV3:output:02model_baba_1/gru1_1/strided_slice_4/stack:output:04model_baba_1/gru1_1/strided_slice_4/stack_1:output:04model_baba_1/gru1_1/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes

:L@*
shrink_axis_mask�
model_baba_1/gru1_1/SqueezeSqueeze)model_baba_1/gru1_1/CudnnRNNV3:output_h:0*
T0*'
_output_shapes
:���������@*
squeeze_dims

model_baba_1/gru_2_1/ShapeShape'model_baba_1/gru1_1/CudnnRNNV3:output:0*
T0*
_output_shapes
::��r
(model_baba_1/gru_2_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*model_baba_1/gru_2_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*model_baba_1/gru_2_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"model_baba_1/gru_2_1/strided_sliceStridedSlice#model_baba_1/gru_2_1/Shape:output:01model_baba_1/gru_2_1/strided_slice/stack:output:03model_baba_1/gru_2_1/strided_slice/stack_1:output:03model_baba_1/gru_2_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maske
#model_baba_1/gru_2_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :�
!model_baba_1/gru_2_1/zeros/packedPack+model_baba_1/gru_2_1/strided_slice:output:0,model_baba_1/gru_2_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:e
 model_baba_1/gru_2_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
model_baba_1/gru_2_1/zerosFill*model_baba_1/gru_2_1/zeros/packed:output:0)model_baba_1/gru_2_1/zeros/Const:output:0*
T0*'
_output_shapes
:���������
*model_baba_1/gru_2_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            �
,model_baba_1/gru_2_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           �
,model_baba_1/gru_2_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         �
$model_baba_1/gru_2_1/strided_slice_1StridedSlice'model_baba_1/gru1_1/CudnnRNNV3:output:03model_baba_1/gru_2_1/strided_slice_1/stack:output:05model_baba_1/gru_2_1/strided_slice_1/stack_1:output:05model_baba_1/gru_2_1/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������@*

begin_mask*
end_mask*
shrink_axis_mask�
model_baba_1/gru_2_1/Shape_1Shape'model_baba_1/gru1_1/CudnnRNNV3:output:0*
T0*
_output_shapes
::��t
*model_baba_1/gru_2_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: v
,model_baba_1/gru_2_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:v
,model_baba_1/gru_2_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
$model_baba_1/gru_2_1/strided_slice_2StridedSlice%model_baba_1/gru_2_1/Shape_1:output:03model_baba_1/gru_2_1/strided_slice_2/stack:output:05model_baba_1/gru_2_1/strided_slice_2/stack_1:output:05model_baba_1/gru_2_1/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
model_baba_1/gru_2_1/Shape_2Shape'model_baba_1/gru1_1/CudnnRNNV3:output:0*
T0*
_output_shapes
::��t
*model_baba_1/gru_2_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:v
,model_baba_1/gru_2_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:v
,model_baba_1/gru_2_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
$model_baba_1/gru_2_1/strided_slice_3StridedSlice%model_baba_1/gru_2_1/Shape_2:output:03model_baba_1/gru_2_1/strided_slice_3/stack:output:05model_baba_1/gru_2_1/strided_slice_3/stack_1:output:05model_baba_1/gru_2_1/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
model_baba_1/gru_2_1/Fill/dimsPack-model_baba_1/gru_2_1/strided_slice_2:output:0*
N*
T0*
_output_shapes
:�
model_baba_1/gru_2_1/FillFill'model_baba_1/gru_2_1/Fill/dims:output:0-model_baba_1/gru_2_1/strided_slice_3:output:0*
T0*#
_output_shapes
:���������e
#model_baba_1/gru_2_1/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :�
model_baba_1/gru_2_1/ExpandDims
ExpandDims#model_baba_1/gru_2_1/zeros:output:0,model_baba_1/gru_2_1/ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������f
$model_baba_1/gru_2_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :�
)model_baba_1/gru_2_1/split/ReadVariableOpReadVariableOp2model_baba_1_gru_2_1_split_readvariableop_resource*
_output_shapes

:@0*
dtype0�
model_baba_1/gru_2_1/splitSplit-model_baba_1/gru_2_1/split/split_dim:output:01model_baba_1/gru_2_1/split/ReadVariableOp:value:0*
T0*2
_output_shapes 
:@:@:@*
	num_splith
&model_baba_1/gru_2_1/split_1/split_dimConst*
_output_shapes
: *
dtype0*
value	B :�
+model_baba_1/gru_2_1/split_1/ReadVariableOpReadVariableOp4model_baba_1_gru_2_1_split_1_readvariableop_resource*
_output_shapes

:0*
dtype0�
model_baba_1/gru_2_1/split_1Split/model_baba_1/gru_2_1/split_1/split_dim:output:03model_baba_1/gru_2_1/split_1/ReadVariableOp:value:0*
T0*2
_output_shapes 
:::*
	num_split�
+model_baba_1/gru_2_1/Reshape/ReadVariableOpReadVariableOp4model_baba_1_gru_2_1_reshape_readvariableop_resource*
_output_shapes

:0*
dtype0u
"model_baba_1/gru_2_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
����������
model_baba_1/gru_2_1/ReshapeReshape3model_baba_1/gru_2_1/Reshape/ReadVariableOp:value:0+model_baba_1/gru_2_1/Reshape/shape:output:0*
T0*
_output_shapes
:`h
&model_baba_1/gru_2_1/split_2/split_dimConst*
_output_shapes
: *
dtype0*
value	B : �
model_baba_1/gru_2_1/split_2Split/model_baba_1/gru_2_1/split_2/split_dim:output:0%model_baba_1/gru_2_1/Reshape:output:0*
T0*8
_output_shapes&
$::::::*
	num_splitm
model_baba_1/gru_2_1/ConstConst*
_output_shapes
:*
dtype0*
valueB:
���������t
#model_baba_1/gru_2_1/transpose/permConst*
_output_shapes
:*
dtype0*
valueB"       �
model_baba_1/gru_2_1/transpose	Transpose#model_baba_1/gru_2_1/split:output:1,model_baba_1/gru_2_1/transpose/perm:output:0*
T0*
_output_shapes

:@�
model_baba_1/gru_2_1/Reshape_1Reshape"model_baba_1/gru_2_1/transpose:y:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes	
:�v
%model_baba_1/gru_2_1/transpose_1/permConst*
_output_shapes
:*
dtype0*
valueB"       �
 model_baba_1/gru_2_1/transpose_1	Transpose#model_baba_1/gru_2_1/split:output:0.model_baba_1/gru_2_1/transpose_1/perm:output:0*
T0*
_output_shapes

:@�
model_baba_1/gru_2_1/Reshape_2Reshape$model_baba_1/gru_2_1/transpose_1:y:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes	
:�v
%model_baba_1/gru_2_1/transpose_2/permConst*
_output_shapes
:*
dtype0*
valueB"       �
 model_baba_1/gru_2_1/transpose_2	Transpose#model_baba_1/gru_2_1/split:output:2.model_baba_1/gru_2_1/transpose_2/perm:output:0*
T0*
_output_shapes

:@�
model_baba_1/gru_2_1/Reshape_3Reshape$model_baba_1/gru_2_1/transpose_2:y:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes	
:�v
%model_baba_1/gru_2_1/transpose_3/permConst*
_output_shapes
:*
dtype0*
valueB"       �
 model_baba_1/gru_2_1/transpose_3	Transpose%model_baba_1/gru_2_1/split_1:output:1.model_baba_1/gru_2_1/transpose_3/perm:output:0*
T0*
_output_shapes

:�
model_baba_1/gru_2_1/Reshape_4Reshape$model_baba_1/gru_2_1/transpose_3:y:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes	
:�v
%model_baba_1/gru_2_1/transpose_4/permConst*
_output_shapes
:*
dtype0*
valueB"       �
 model_baba_1/gru_2_1/transpose_4	Transpose%model_baba_1/gru_2_1/split_1:output:0.model_baba_1/gru_2_1/transpose_4/perm:output:0*
T0*
_output_shapes

:�
model_baba_1/gru_2_1/Reshape_5Reshape$model_baba_1/gru_2_1/transpose_4:y:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes	
:�v
%model_baba_1/gru_2_1/transpose_5/permConst*
_output_shapes
:*
dtype0*
valueB"       �
 model_baba_1/gru_2_1/transpose_5	Transpose%model_baba_1/gru_2_1/split_1:output:2.model_baba_1/gru_2_1/transpose_5/perm:output:0*
T0*
_output_shapes

:�
model_baba_1/gru_2_1/Reshape_6Reshape$model_baba_1/gru_2_1/transpose_5:y:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes	
:��
model_baba_1/gru_2_1/Reshape_7Reshape%model_baba_1/gru_2_1/split_2:output:1#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes
:�
model_baba_1/gru_2_1/Reshape_8Reshape%model_baba_1/gru_2_1/split_2:output:0#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes
:�
model_baba_1/gru_2_1/Reshape_9Reshape%model_baba_1/gru_2_1/split_2:output:2#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes
:�
model_baba_1/gru_2_1/Reshape_10Reshape%model_baba_1/gru_2_1/split_2:output:4#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes
:�
model_baba_1/gru_2_1/Reshape_11Reshape%model_baba_1/gru_2_1/split_2:output:3#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes
:�
model_baba_1/gru_2_1/Reshape_12Reshape%model_baba_1/gru_2_1/split_2:output:5#model_baba_1/gru_2_1/Const:output:0*
T0*
_output_shapes
:b
 model_baba_1/gru_2_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : �
model_baba_1/gru_2_1/concatConcatV2'model_baba_1/gru_2_1/Reshape_1:output:0'model_baba_1/gru_2_1/Reshape_2:output:0'model_baba_1/gru_2_1/Reshape_3:output:0'model_baba_1/gru_2_1/Reshape_4:output:0'model_baba_1/gru_2_1/Reshape_5:output:0'model_baba_1/gru_2_1/Reshape_6:output:0'model_baba_1/gru_2_1/Reshape_7:output:0'model_baba_1/gru_2_1/Reshape_8:output:0'model_baba_1/gru_2_1/Reshape_9:output:0(model_baba_1/gru_2_1/Reshape_10:output:0(model_baba_1/gru_2_1/Reshape_11:output:0(model_baba_1/gru_2_1/Reshape_12:output:0)model_baba_1/gru_2_1/concat/axis:output:0*
N*
T0*
_output_shapes	
:�l
'model_baba_1/gru_2_1/CudnnRNNV3/input_cConst*
_output_shapes
: *
dtype0*
valueB
 *    �
model_baba_1/gru_2_1/CudnnRNNV3
CudnnRNNV3'model_baba_1/gru1_1/CudnnRNNV3:output:0(model_baba_1/gru_2_1/ExpandDims:output:00model_baba_1/gru_2_1/CudnnRNNV3/input_c:output:0$model_baba_1/gru_2_1/concat:output:0"model_baba_1/gru_2_1/Fill:output:0*
T0*L
_output_shapes:
8:���������L:���������: ::*
rnn_modegru*

time_major( }
*model_baba_1/gru_2_1/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������v
,model_baba_1/gru_2_1/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB: v
,model_baba_1/gru_2_1/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
$model_baba_1/gru_2_1/strided_slice_4StridedSlice(model_baba_1/gru_2_1/CudnnRNNV3:output:03model_baba_1/gru_2_1/strided_slice_4/stack:output:05model_baba_1/gru_2_1/strided_slice_4/stack_1:output:05model_baba_1/gru_2_1/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes

:L*
shrink_axis_mask�
model_baba_1/gru_2_1/SqueezeSqueeze*model_baba_1/gru_2_1/CudnnRNNV3:output_h:0*
T0*'
_output_shapes
:���������*
squeeze_dims
�
.model_baba_1/mha_1/query_1/Cast/ReadVariableOpReadVariableOp7model_baba_1_mha_1_query_1_cast_readvariableop_resource*"
_output_shapes
: *
dtype0y
(model_baba_1/mha_1/query_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"   �����
"model_baba_1/mha_1/query_1/ReshapeReshape6model_baba_1/mha_1/query_1/Cast/ReadVariableOp:value:01model_baba_1/mha_1/query_1/Reshape/shape:output:0*
T0*
_output_shapes

:`�
!model_baba_1/mha_1/query_1/MatMulBatchMatMulV2(model_baba_1/gru_2_1/CudnnRNNV3:output:0+model_baba_1/mha_1/query_1/Reshape:output:0*
T0*+
_output_shapes
:���������L`�
*model_baba_1/mha_1/query_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"����L          �
$model_baba_1/mha_1/query_1/Reshape_1Reshape*model_baba_1/mha_1/query_1/MatMul:output:03model_baba_1/mha_1/query_1/Reshape_1/shape:output:0*
T0*/
_output_shapes
:���������L �
-model_baba_1/mha_1/query_1/add/ReadVariableOpReadVariableOp6model_baba_1_mha_1_query_1_add_readvariableop_resource*
_output_shapes

: *
dtype0�
model_baba_1/mha_1/query_1/addAddV2-model_baba_1/mha_1/query_1/Reshape_1:output:05model_baba_1/mha_1/query_1/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������L �
,model_baba_1/mha_1/key_1/Cast/ReadVariableOpReadVariableOp5model_baba_1_mha_1_key_1_cast_readvariableop_resource*"
_output_shapes
: *
dtype0w
&model_baba_1/mha_1/key_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"   �����
 model_baba_1/mha_1/key_1/ReshapeReshape4model_baba_1/mha_1/key_1/Cast/ReadVariableOp:value:0/model_baba_1/mha_1/key_1/Reshape/shape:output:0*
T0*
_output_shapes

:`�
model_baba_1/mha_1/key_1/MatMulBatchMatMulV2(model_baba_1/gru_2_1/CudnnRNNV3:output:0)model_baba_1/mha_1/key_1/Reshape:output:0*
T0*+
_output_shapes
:���������L`�
(model_baba_1/mha_1/key_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"����L          �
"model_baba_1/mha_1/key_1/Reshape_1Reshape(model_baba_1/mha_1/key_1/MatMul:output:01model_baba_1/mha_1/key_1/Reshape_1/shape:output:0*
T0*/
_output_shapes
:���������L �
+model_baba_1/mha_1/key_1/add/ReadVariableOpReadVariableOp4model_baba_1_mha_1_key_1_add_readvariableop_resource*
_output_shapes

: *
dtype0�
model_baba_1/mha_1/key_1/addAddV2+model_baba_1/mha_1/key_1/Reshape_1:output:03model_baba_1/mha_1/key_1/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������L �
.model_baba_1/mha_1/value_1/Cast/ReadVariableOpReadVariableOp7model_baba_1_mha_1_value_1_cast_readvariableop_resource*"
_output_shapes
: *
dtype0y
(model_baba_1/mha_1/value_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"   �����
"model_baba_1/mha_1/value_1/ReshapeReshape6model_baba_1/mha_1/value_1/Cast/ReadVariableOp:value:01model_baba_1/mha_1/value_1/Reshape/shape:output:0*
T0*
_output_shapes

:`�
!model_baba_1/mha_1/value_1/MatMulBatchMatMulV2(model_baba_1/gru_2_1/CudnnRNNV3:output:0+model_baba_1/mha_1/value_1/Reshape:output:0*
T0*+
_output_shapes
:���������L`�
*model_baba_1/mha_1/value_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"����L          �
$model_baba_1/mha_1/value_1/Reshape_1Reshape*model_baba_1/mha_1/value_1/MatMul:output:03model_baba_1/mha_1/value_1/Reshape_1/shape:output:0*
T0*/
_output_shapes
:���������L �
-model_baba_1/mha_1/value_1/add/ReadVariableOpReadVariableOp6model_baba_1_mha_1_value_1_add_readvariableop_resource*
_output_shapes

: *
dtype0�
model_baba_1/mha_1/value_1/addAddV2-model_baba_1/mha_1/value_1/Reshape_1:output:05model_baba_1/mha_1/value_1/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������L v
model_baba_1/mha_1/ShapeShape model_baba_1/mha_1/key_1/add:z:0*
T0*
_output_shapes
::��y
&model_baba_1/mha_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������r
(model_baba_1/mha_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: r
(model_baba_1/mha_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 model_baba_1/mha_1/strided_sliceStridedSlice!model_baba_1/mha_1/Shape:output:0/model_baba_1/mha_1/strided_slice/stack:output:01model_baba_1/mha_1/strided_slice/stack_1:output:01model_baba_1/mha_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 model_baba_1/mha_1/einsum/EinsumEinsum"model_baba_1/mha_1/query_1/add:z:0 model_baba_1/mha_1/key_1/add:z:0*
N*
T0*/
_output_shapes
:���������LL*
equationBTNH,BSNH->BNTS^
model_baba_1/mha_1/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *�5>�
model_baba_1/mha_1/MulMul)model_baba_1/mha_1/einsum/Einsum:output:0"model_baba_1/mha_1/Cast/x:output:0*
T0*/
_output_shapes
:���������LL{
model_baba_1/mha_1/SoftmaxSoftmaxmodel_baba_1/mha_1/Mul:z:0*
T0*/
_output_shapes
:���������LL�
"model_baba_1/mha_1/einsum_1/EinsumEinsum$model_baba_1/mha_1/Softmax:softmax:0"model_baba_1/mha_1/value_1/add:z:0*
N*
T0*/
_output_shapes
:���������L *
equationBNTS,BSNH->BTNH�
9model_baba_1/mha_1/attention_output_1/Cast/ReadVariableOpReadVariableOpBmodel_baba_1_mha_1_attention_output_1_cast_readvariableop_resource*"
_output_shapes
: *
dtype0�
3model_baba_1/mha_1/attention_output_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"����L   `   �
-model_baba_1/mha_1/attention_output_1/ReshapeReshape+model_baba_1/mha_1/einsum_1/Einsum:output:0<model_baba_1/mha_1/attention_output_1/Reshape/shape:output:0*
T0*+
_output_shapes
:���������L`�
5model_baba_1/mha_1/attention_output_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
/model_baba_1/mha_1/attention_output_1/Reshape_1ReshapeAmodel_baba_1/mha_1/attention_output_1/Cast/ReadVariableOp:value:0>model_baba_1/mha_1/attention_output_1/Reshape_1/shape:output:0*
T0*
_output_shapes

:`�
,model_baba_1/mha_1/attention_output_1/MatMulBatchMatMulV26model_baba_1/mha_1/attention_output_1/Reshape:output:08model_baba_1/mha_1/attention_output_1/Reshape_1:output:0*
T0*+
_output_shapes
:���������L�
8model_baba_1/mha_1/attention_output_1/add/ReadVariableOpReadVariableOpAmodel_baba_1_mha_1_attention_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
)model_baba_1/mha_1/attention_output_1/addAddV25model_baba_1/mha_1/attention_output_1/MatMul:output:0@model_baba_1/mha_1/attention_output_1/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������L�
 model_baba_1/attn_residual_1/AddAddV2(model_baba_1/gru_2_1/CudnnRNNV3:output:0-model_baba_1/mha_1/attention_output_1/add:z:0*
T0*+
_output_shapes
:���������L�
7model_baba_1/attn_norm_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
����������
%model_baba_1/attn_norm_1/moments/meanMean$model_baba_1/attn_residual_1/Add:z:0@model_baba_1/attn_norm_1/moments/mean/reduction_indices:output:0*
T0*+
_output_shapes
:���������L*
	keep_dims(�
-model_baba_1/attn_norm_1/moments/StopGradientStopGradient.model_baba_1/attn_norm_1/moments/mean:output:0*
T0*+
_output_shapes
:���������L�
2model_baba_1/attn_norm_1/moments/SquaredDifferenceSquaredDifference$model_baba_1/attn_residual_1/Add:z:06model_baba_1/attn_norm_1/moments/StopGradient:output:0*
T0*+
_output_shapes
:���������L�
;model_baba_1/attn_norm_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
����������
)model_baba_1/attn_norm_1/moments/varianceMean6model_baba_1/attn_norm_1/moments/SquaredDifference:z:0Dmodel_baba_1/attn_norm_1/moments/variance/reduction_indices:output:0*
T0*+
_output_shapes
:���������L*
	keep_dims(�
/model_baba_1/attn_norm_1/Reshape/ReadVariableOpReadVariableOp8model_baba_1_attn_norm_1_reshape_readvariableop_resource*
_output_shapes
:*
dtype0{
&model_baba_1/attn_norm_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"         �
 model_baba_1/attn_norm_1/ReshapeReshape7model_baba_1/attn_norm_1/Reshape/ReadVariableOp:value:0/model_baba_1/attn_norm_1/Reshape/shape:output:0*
T0*"
_output_shapes
:�
1model_baba_1/attn_norm_1/Reshape_1/ReadVariableOpReadVariableOp:model_baba_1_attn_norm_1_reshape_1_readvariableop_resource*
_output_shapes
:*
dtype0}
(model_baba_1/attn_norm_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"         �
"model_baba_1/attn_norm_1/Reshape_1Reshape9model_baba_1/attn_norm_1/Reshape_1/ReadVariableOp:value:01model_baba_1/attn_norm_1/Reshape_1/shape:output:0*
T0*"
_output_shapes
:c
model_baba_1/attn_norm_1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
model_baba_1/attn_norm_1/addAddV22model_baba_1/attn_norm_1/moments/variance:output:0'model_baba_1/attn_norm_1/add/y:output:0*
T0*+
_output_shapes
:���������L
model_baba_1/attn_norm_1/RsqrtRsqrt model_baba_1/attn_norm_1/add:z:0*
T0*+
_output_shapes
:���������L�
model_baba_1/attn_norm_1/mulMul"model_baba_1/attn_norm_1/Rsqrt:y:0)model_baba_1/attn_norm_1/Reshape:output:0*
T0*+
_output_shapes
:���������L�
model_baba_1/attn_norm_1/NegNeg.model_baba_1/attn_norm_1/moments/mean:output:0*
T0*+
_output_shapes
:���������L�
model_baba_1/attn_norm_1/mul_1Mul model_baba_1/attn_norm_1/Neg:y:0 model_baba_1/attn_norm_1/mul:z:0*
T0*+
_output_shapes
:���������L�
model_baba_1/attn_norm_1/add_1AddV2"model_baba_1/attn_norm_1/mul_1:z:0+model_baba_1/attn_norm_1/Reshape_1:output:0*
T0*+
_output_shapes
:���������L�
model_baba_1/attn_norm_1/mul_2Mul$model_baba_1/attn_residual_1/Add:z:0 model_baba_1/attn_norm_1/mul:z:0*
T0*+
_output_shapes
:���������L�
model_baba_1/attn_norm_1/add_2AddV2"model_baba_1/attn_norm_1/mul_2:z:0"model_baba_1/attn_norm_1/add_1:z:0*
T0*+
_output_shapes
:���������L}
model_baba_1/td_dense_1/ShapeShape"model_baba_1/attn_norm_1/add_2:z:0*
T0*
_output_shapes
::��u
+model_baba_1/td_dense_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: w
-model_baba_1/td_dense_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:w
-model_baba_1/td_dense_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
%model_baba_1/td_dense_1/strided_sliceStridedSlice&model_baba_1/td_dense_1/Shape:output:04model_baba_1/td_dense_1/strided_slice/stack:output:06model_baba_1/td_dense_1/strided_slice/stack_1:output:06model_baba_1/td_dense_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask{
&model_baba_1/td_dense_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
!model_baba_1/td_dense_1/transpose	Transpose"model_baba_1/attn_norm_1/add_2:z:0/model_baba_1/td_dense_1/transpose/perm:output:0*
T0*+
_output_shapes
:L���������w
-model_baba_1/td_dense_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: y
/model_baba_1/td_dense_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_1StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_1/stack:output:08model_baba_1/td_dense_1/strided_slice_1/stack_1:output:08model_baba_1/td_dense_1/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
+model_baba_1/td_dense_1/Cast/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
model_baba_1/td_dense_1/MatMulMatMul0model_baba_1/td_dense_1/strided_slice_1:output:03model_baba_1/td_dense_1/Cast/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_dense_1/BiasAdd/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_dense_1/BiasAddBiasAdd(model_baba_1/td_dense_1/MatMul:product:06model_baba_1/td_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/ReluRelu(model_baba_1/td_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_2StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_2/stack:output:08model_baba_1/td_dense_1/strided_slice_2/stack_1:output:08model_baba_1/td_dense_1/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_1/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_1MatMul0model_baba_1/td_dense_1/strided_slice_2:output:05model_baba_1/td_dense_1/Cast_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_1/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_1BiasAdd*model_baba_1/td_dense_1/MatMul_1:product:08model_baba_1/td_dense_1/BiasAdd_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_1Relu*model_baba_1/td_dense_1/BiasAdd_1:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_3StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_3/stack:output:08model_baba_1/td_dense_1/strided_slice_3/stack_1:output:08model_baba_1/td_dense_1/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_2/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_2MatMul0model_baba_1/td_dense_1/strided_slice_3:output:05model_baba_1/td_dense_1/Cast_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_2/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_2BiasAdd*model_baba_1/td_dense_1/MatMul_2:product:08model_baba_1/td_dense_1/BiasAdd_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_2Relu*model_baba_1/td_dense_1/BiasAdd_2:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_4StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_4/stack:output:08model_baba_1/td_dense_1/strided_slice_4/stack_1:output:08model_baba_1/td_dense_1/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_3/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_3MatMul0model_baba_1/td_dense_1/strided_slice_4:output:05model_baba_1/td_dense_1/Cast_3/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_3/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_3BiasAdd*model_baba_1/td_dense_1/MatMul_3:product:08model_baba_1/td_dense_1/BiasAdd_3/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_3Relu*model_baba_1/td_dense_1/BiasAdd_3:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_5StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_5/stack:output:08model_baba_1/td_dense_1/strided_slice_5/stack_1:output:08model_baba_1/td_dense_1/strided_slice_5/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_4/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_4MatMul0model_baba_1/td_dense_1/strided_slice_5:output:05model_baba_1/td_dense_1/Cast_4/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_4/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_4BiasAdd*model_baba_1/td_dense_1/MatMul_4:product:08model_baba_1/td_dense_1/BiasAdd_4/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_4Relu*model_baba_1/td_dense_1/BiasAdd_4:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_6StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_6/stack:output:08model_baba_1/td_dense_1/strided_slice_6/stack_1:output:08model_baba_1/td_dense_1/strided_slice_6/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_5/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_5MatMul0model_baba_1/td_dense_1/strided_slice_6:output:05model_baba_1/td_dense_1/Cast_5/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_5/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_5BiasAdd*model_baba_1/td_dense_1/MatMul_5:product:08model_baba_1/td_dense_1/BiasAdd_5/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_5Relu*model_baba_1/td_dense_1/BiasAdd_5:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_7/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_7/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_7/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_7StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_7/stack:output:08model_baba_1/td_dense_1/strided_slice_7/stack_1:output:08model_baba_1/td_dense_1/strided_slice_7/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_6/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_6MatMul0model_baba_1/td_dense_1/strided_slice_7:output:05model_baba_1/td_dense_1/Cast_6/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_6/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_6BiasAdd*model_baba_1/td_dense_1/MatMul_6:product:08model_baba_1/td_dense_1/BiasAdd_6/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_6Relu*model_baba_1/td_dense_1/BiasAdd_6:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_8/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_8/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_8/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_8StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_8/stack:output:08model_baba_1/td_dense_1/strided_slice_8/stack_1:output:08model_baba_1/td_dense_1/strided_slice_8/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_7/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_7MatMul0model_baba_1/td_dense_1/strided_slice_8:output:05model_baba_1/td_dense_1/Cast_7/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_7/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_7BiasAdd*model_baba_1/td_dense_1/MatMul_7:product:08model_baba_1/td_dense_1/BiasAdd_7/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_7Relu*model_baba_1/td_dense_1/BiasAdd_7:output:0*
T0*'
_output_shapes
:���������w
-model_baba_1/td_dense_1/strided_slice_9/stackConst*
_output_shapes
:*
dtype0*
valueB:y
/model_baba_1/td_dense_1/strided_slice_9/stack_1Const*
_output_shapes
:*
dtype0*
valueB:	y
/model_baba_1/td_dense_1/strided_slice_9/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
'model_baba_1/td_dense_1/strided_slice_9StridedSlice%model_baba_1/td_dense_1/transpose:y:06model_baba_1/td_dense_1/strided_slice_9/stack:output:08model_baba_1/td_dense_1/strided_slice_9/stack_1:output:08model_baba_1/td_dense_1/strided_slice_9/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_8/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_8MatMul0model_baba_1/td_dense_1/strided_slice_9:output:05model_baba_1/td_dense_1/Cast_8/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_8/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_8BiasAdd*model_baba_1/td_dense_1/MatMul_8:product:08model_baba_1/td_dense_1/BiasAdd_8/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_8Relu*model_baba_1/td_dense_1/BiasAdd_8:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_10/stackConst*
_output_shapes
:*
dtype0*
valueB:	z
0model_baba_1/td_dense_1/strided_slice_10/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
z
0model_baba_1/td_dense_1/strided_slice_10/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_10StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_10/stack:output:09model_baba_1/td_dense_1/strided_slice_10/stack_1:output:09model_baba_1/td_dense_1/strided_slice_10/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
-model_baba_1/td_dense_1/Cast_9/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
 model_baba_1/td_dense_1/MatMul_9MatMul1model_baba_1/td_dense_1/strided_slice_10:output:05model_baba_1/td_dense_1/Cast_9/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
0model_baba_1/td_dense_1/BiasAdd_9/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!model_baba_1/td_dense_1/BiasAdd_9BiasAdd*model_baba_1/td_dense_1/MatMul_9:product:08model_baba_1/td_dense_1/BiasAdd_9/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_9Relu*model_baba_1/td_dense_1/BiasAdd_9:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_11/stackConst*
_output_shapes
:*
dtype0*
valueB:
z
0model_baba_1/td_dense_1/strided_slice_11/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_11/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_11StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_11/stack:output:09model_baba_1/td_dense_1/strided_slice_11/stack_1:output:09model_baba_1/td_dense_1/strided_slice_11/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_10/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_10MatMul1model_baba_1/td_dense_1/strided_slice_11:output:06model_baba_1/td_dense_1/Cast_10/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_10/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_10BiasAdd+model_baba_1/td_dense_1/MatMul_10:product:09model_baba_1/td_dense_1/BiasAdd_10/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_10Relu+model_baba_1/td_dense_1/BiasAdd_10:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_12/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_12/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_12/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_12StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_12/stack:output:09model_baba_1/td_dense_1/strided_slice_12/stack_1:output:09model_baba_1/td_dense_1/strided_slice_12/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_11/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_11MatMul1model_baba_1/td_dense_1/strided_slice_12:output:06model_baba_1/td_dense_1/Cast_11/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_11/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_11BiasAdd+model_baba_1/td_dense_1/MatMul_11:product:09model_baba_1/td_dense_1/BiasAdd_11/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_11Relu+model_baba_1/td_dense_1/BiasAdd_11:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_13/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_13/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_13/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_13StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_13/stack:output:09model_baba_1/td_dense_1/strided_slice_13/stack_1:output:09model_baba_1/td_dense_1/strided_slice_13/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_12/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_12MatMul1model_baba_1/td_dense_1/strided_slice_13:output:06model_baba_1/td_dense_1/Cast_12/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_12/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_12BiasAdd+model_baba_1/td_dense_1/MatMul_12:product:09model_baba_1/td_dense_1/BiasAdd_12/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_12Relu+model_baba_1/td_dense_1/BiasAdd_12:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_14/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_14/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_14/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_14StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_14/stack:output:09model_baba_1/td_dense_1/strided_slice_14/stack_1:output:09model_baba_1/td_dense_1/strided_slice_14/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_13/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_13MatMul1model_baba_1/td_dense_1/strided_slice_14:output:06model_baba_1/td_dense_1/Cast_13/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_13/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_13BiasAdd+model_baba_1/td_dense_1/MatMul_13:product:09model_baba_1/td_dense_1/BiasAdd_13/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_13Relu+model_baba_1/td_dense_1/BiasAdd_13:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_15/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_15/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_15/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_15StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_15/stack:output:09model_baba_1/td_dense_1/strided_slice_15/stack_1:output:09model_baba_1/td_dense_1/strided_slice_15/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_14/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_14MatMul1model_baba_1/td_dense_1/strided_slice_15:output:06model_baba_1/td_dense_1/Cast_14/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_14/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_14BiasAdd+model_baba_1/td_dense_1/MatMul_14:product:09model_baba_1/td_dense_1/BiasAdd_14/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_14Relu+model_baba_1/td_dense_1/BiasAdd_14:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_16/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_16/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_16/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_16StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_16/stack:output:09model_baba_1/td_dense_1/strided_slice_16/stack_1:output:09model_baba_1/td_dense_1/strided_slice_16/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_15/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_15MatMul1model_baba_1/td_dense_1/strided_slice_16:output:06model_baba_1/td_dense_1/Cast_15/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_15/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_15BiasAdd+model_baba_1/td_dense_1/MatMul_15:product:09model_baba_1/td_dense_1/BiasAdd_15/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_15Relu+model_baba_1/td_dense_1/BiasAdd_15:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_17/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_17/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_17/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_17StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_17/stack:output:09model_baba_1/td_dense_1/strided_slice_17/stack_1:output:09model_baba_1/td_dense_1/strided_slice_17/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_16/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_16MatMul1model_baba_1/td_dense_1/strided_slice_17:output:06model_baba_1/td_dense_1/Cast_16/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_16/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_16BiasAdd+model_baba_1/td_dense_1/MatMul_16:product:09model_baba_1/td_dense_1/BiasAdd_16/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_16Relu+model_baba_1/td_dense_1/BiasAdd_16:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_18/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_18/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_18/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_18StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_18/stack:output:09model_baba_1/td_dense_1/strided_slice_18/stack_1:output:09model_baba_1/td_dense_1/strided_slice_18/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_17/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_17MatMul1model_baba_1/td_dense_1/strided_slice_18:output:06model_baba_1/td_dense_1/Cast_17/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_17/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_17BiasAdd+model_baba_1/td_dense_1/MatMul_17:product:09model_baba_1/td_dense_1/BiasAdd_17/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_17Relu+model_baba_1/td_dense_1/BiasAdd_17:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_19/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_19/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_19/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_19StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_19/stack:output:09model_baba_1/td_dense_1/strided_slice_19/stack_1:output:09model_baba_1/td_dense_1/strided_slice_19/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_18/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_18MatMul1model_baba_1/td_dense_1/strided_slice_19:output:06model_baba_1/td_dense_1/Cast_18/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_18/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_18BiasAdd+model_baba_1/td_dense_1/MatMul_18:product:09model_baba_1/td_dense_1/BiasAdd_18/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_18Relu+model_baba_1/td_dense_1/BiasAdd_18:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_20/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_20/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_20/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_20StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_20/stack:output:09model_baba_1/td_dense_1/strided_slice_20/stack_1:output:09model_baba_1/td_dense_1/strided_slice_20/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_19/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_19MatMul1model_baba_1/td_dense_1/strided_slice_20:output:06model_baba_1/td_dense_1/Cast_19/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_19/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_19BiasAdd+model_baba_1/td_dense_1/MatMul_19:product:09model_baba_1/td_dense_1/BiasAdd_19/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_19Relu+model_baba_1/td_dense_1/BiasAdd_19:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_21/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_21/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_21/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_21StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_21/stack:output:09model_baba_1/td_dense_1/strided_slice_21/stack_1:output:09model_baba_1/td_dense_1/strided_slice_21/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_20/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_20MatMul1model_baba_1/td_dense_1/strided_slice_21:output:06model_baba_1/td_dense_1/Cast_20/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_20/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_20BiasAdd+model_baba_1/td_dense_1/MatMul_20:product:09model_baba_1/td_dense_1/BiasAdd_20/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_20Relu+model_baba_1/td_dense_1/BiasAdd_20:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_22/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_22/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_22/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_22StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_22/stack:output:09model_baba_1/td_dense_1/strided_slice_22/stack_1:output:09model_baba_1/td_dense_1/strided_slice_22/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_21/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_21MatMul1model_baba_1/td_dense_1/strided_slice_22:output:06model_baba_1/td_dense_1/Cast_21/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_21/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_21BiasAdd+model_baba_1/td_dense_1/MatMul_21:product:09model_baba_1/td_dense_1/BiasAdd_21/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_21Relu+model_baba_1/td_dense_1/BiasAdd_21:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_23/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_23/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_23/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_23StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_23/stack:output:09model_baba_1/td_dense_1/strided_slice_23/stack_1:output:09model_baba_1/td_dense_1/strided_slice_23/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_22/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_22MatMul1model_baba_1/td_dense_1/strided_slice_23:output:06model_baba_1/td_dense_1/Cast_22/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_22/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_22BiasAdd+model_baba_1/td_dense_1/MatMul_22:product:09model_baba_1/td_dense_1/BiasAdd_22/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_22Relu+model_baba_1/td_dense_1/BiasAdd_22:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_24/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_24/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_24/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_24StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_24/stack:output:09model_baba_1/td_dense_1/strided_slice_24/stack_1:output:09model_baba_1/td_dense_1/strided_slice_24/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_23/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_23MatMul1model_baba_1/td_dense_1/strided_slice_24:output:06model_baba_1/td_dense_1/Cast_23/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_23/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_23BiasAdd+model_baba_1/td_dense_1/MatMul_23:product:09model_baba_1/td_dense_1/BiasAdd_23/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_23Relu+model_baba_1/td_dense_1/BiasAdd_23:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_25/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_25/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_25/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_25StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_25/stack:output:09model_baba_1/td_dense_1/strided_slice_25/stack_1:output:09model_baba_1/td_dense_1/strided_slice_25/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_24/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_24MatMul1model_baba_1/td_dense_1/strided_slice_25:output:06model_baba_1/td_dense_1/Cast_24/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_24/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_24BiasAdd+model_baba_1/td_dense_1/MatMul_24:product:09model_baba_1/td_dense_1/BiasAdd_24/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_24Relu+model_baba_1/td_dense_1/BiasAdd_24:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_26/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_26/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_26/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_26StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_26/stack:output:09model_baba_1/td_dense_1/strided_slice_26/stack_1:output:09model_baba_1/td_dense_1/strided_slice_26/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_25/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_25MatMul1model_baba_1/td_dense_1/strided_slice_26:output:06model_baba_1/td_dense_1/Cast_25/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_25/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_25BiasAdd+model_baba_1/td_dense_1/MatMul_25:product:09model_baba_1/td_dense_1/BiasAdd_25/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_25Relu+model_baba_1/td_dense_1/BiasAdd_25:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_27/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_27/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_27/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_27StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_27/stack:output:09model_baba_1/td_dense_1/strided_slice_27/stack_1:output:09model_baba_1/td_dense_1/strided_slice_27/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_26/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_26MatMul1model_baba_1/td_dense_1/strided_slice_27:output:06model_baba_1/td_dense_1/Cast_26/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_26/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_26BiasAdd+model_baba_1/td_dense_1/MatMul_26:product:09model_baba_1/td_dense_1/BiasAdd_26/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_26Relu+model_baba_1/td_dense_1/BiasAdd_26:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_28/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_28/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_28/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_28StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_28/stack:output:09model_baba_1/td_dense_1/strided_slice_28/stack_1:output:09model_baba_1/td_dense_1/strided_slice_28/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_27/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_27MatMul1model_baba_1/td_dense_1/strided_slice_28:output:06model_baba_1/td_dense_1/Cast_27/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_27/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_27BiasAdd+model_baba_1/td_dense_1/MatMul_27:product:09model_baba_1/td_dense_1/BiasAdd_27/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_27Relu+model_baba_1/td_dense_1/BiasAdd_27:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_29/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_29/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_29/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_29StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_29/stack:output:09model_baba_1/td_dense_1/strided_slice_29/stack_1:output:09model_baba_1/td_dense_1/strided_slice_29/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_28/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_28MatMul1model_baba_1/td_dense_1/strided_slice_29:output:06model_baba_1/td_dense_1/Cast_28/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_28/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_28BiasAdd+model_baba_1/td_dense_1/MatMul_28:product:09model_baba_1/td_dense_1/BiasAdd_28/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_28Relu+model_baba_1/td_dense_1/BiasAdd_28:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_30/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_30/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_30/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_30StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_30/stack:output:09model_baba_1/td_dense_1/strided_slice_30/stack_1:output:09model_baba_1/td_dense_1/strided_slice_30/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_29/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_29MatMul1model_baba_1/td_dense_1/strided_slice_30:output:06model_baba_1/td_dense_1/Cast_29/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_29/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_29BiasAdd+model_baba_1/td_dense_1/MatMul_29:product:09model_baba_1/td_dense_1/BiasAdd_29/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_29Relu+model_baba_1/td_dense_1/BiasAdd_29:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_31/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_31/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_31/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_31StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_31/stack:output:09model_baba_1/td_dense_1/strided_slice_31/stack_1:output:09model_baba_1/td_dense_1/strided_slice_31/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_30/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_30MatMul1model_baba_1/td_dense_1/strided_slice_31:output:06model_baba_1/td_dense_1/Cast_30/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_30/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_30BiasAdd+model_baba_1/td_dense_1/MatMul_30:product:09model_baba_1/td_dense_1/BiasAdd_30/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_30Relu+model_baba_1/td_dense_1/BiasAdd_30:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_32/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_dense_1/strided_slice_32/stack_1Const*
_output_shapes
:*
dtype0*
valueB: z
0model_baba_1/td_dense_1/strided_slice_32/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_32StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_32/stack:output:09model_baba_1/td_dense_1/strided_slice_32/stack_1:output:09model_baba_1/td_dense_1/strided_slice_32/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_31/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_31MatMul1model_baba_1/td_dense_1/strided_slice_32:output:06model_baba_1/td_dense_1/Cast_31/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_31/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_31BiasAdd+model_baba_1/td_dense_1/MatMul_31:product:09model_baba_1/td_dense_1/BiasAdd_31/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_31Relu+model_baba_1/td_dense_1/BiasAdd_31:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_33/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0model_baba_1/td_dense_1/strided_slice_33/stack_1Const*
_output_shapes
:*
dtype0*
valueB:!z
0model_baba_1/td_dense_1/strided_slice_33/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_33StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_33/stack:output:09model_baba_1/td_dense_1/strided_slice_33/stack_1:output:09model_baba_1/td_dense_1/strided_slice_33/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_32/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_32MatMul1model_baba_1/td_dense_1/strided_slice_33:output:06model_baba_1/td_dense_1/Cast_32/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_32/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_32BiasAdd+model_baba_1/td_dense_1/MatMul_32:product:09model_baba_1/td_dense_1/BiasAdd_32/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_32Relu+model_baba_1/td_dense_1/BiasAdd_32:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_34/stackConst*
_output_shapes
:*
dtype0*
valueB:!z
0model_baba_1/td_dense_1/strided_slice_34/stack_1Const*
_output_shapes
:*
dtype0*
valueB:"z
0model_baba_1/td_dense_1/strided_slice_34/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_34StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_34/stack:output:09model_baba_1/td_dense_1/strided_slice_34/stack_1:output:09model_baba_1/td_dense_1/strided_slice_34/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_33/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_33MatMul1model_baba_1/td_dense_1/strided_slice_34:output:06model_baba_1/td_dense_1/Cast_33/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_33/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_33BiasAdd+model_baba_1/td_dense_1/MatMul_33:product:09model_baba_1/td_dense_1/BiasAdd_33/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_33Relu+model_baba_1/td_dense_1/BiasAdd_33:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_35/stackConst*
_output_shapes
:*
dtype0*
valueB:"z
0model_baba_1/td_dense_1/strided_slice_35/stack_1Const*
_output_shapes
:*
dtype0*
valueB:#z
0model_baba_1/td_dense_1/strided_slice_35/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_35StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_35/stack:output:09model_baba_1/td_dense_1/strided_slice_35/stack_1:output:09model_baba_1/td_dense_1/strided_slice_35/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_34/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_34MatMul1model_baba_1/td_dense_1/strided_slice_35:output:06model_baba_1/td_dense_1/Cast_34/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_34/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_34BiasAdd+model_baba_1/td_dense_1/MatMul_34:product:09model_baba_1/td_dense_1/BiasAdd_34/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_34Relu+model_baba_1/td_dense_1/BiasAdd_34:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_36/stackConst*
_output_shapes
:*
dtype0*
valueB:#z
0model_baba_1/td_dense_1/strided_slice_36/stack_1Const*
_output_shapes
:*
dtype0*
valueB:$z
0model_baba_1/td_dense_1/strided_slice_36/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_36StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_36/stack:output:09model_baba_1/td_dense_1/strided_slice_36/stack_1:output:09model_baba_1/td_dense_1/strided_slice_36/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_35/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_35MatMul1model_baba_1/td_dense_1/strided_slice_36:output:06model_baba_1/td_dense_1/Cast_35/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_35/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_35BiasAdd+model_baba_1/td_dense_1/MatMul_35:product:09model_baba_1/td_dense_1/BiasAdd_35/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_35Relu+model_baba_1/td_dense_1/BiasAdd_35:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_37/stackConst*
_output_shapes
:*
dtype0*
valueB:$z
0model_baba_1/td_dense_1/strided_slice_37/stack_1Const*
_output_shapes
:*
dtype0*
valueB:%z
0model_baba_1/td_dense_1/strided_slice_37/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_37StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_37/stack:output:09model_baba_1/td_dense_1/strided_slice_37/stack_1:output:09model_baba_1/td_dense_1/strided_slice_37/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_36/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_36MatMul1model_baba_1/td_dense_1/strided_slice_37:output:06model_baba_1/td_dense_1/Cast_36/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_36/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_36BiasAdd+model_baba_1/td_dense_1/MatMul_36:product:09model_baba_1/td_dense_1/BiasAdd_36/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_36Relu+model_baba_1/td_dense_1/BiasAdd_36:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_38/stackConst*
_output_shapes
:*
dtype0*
valueB:%z
0model_baba_1/td_dense_1/strided_slice_38/stack_1Const*
_output_shapes
:*
dtype0*
valueB:&z
0model_baba_1/td_dense_1/strided_slice_38/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_38StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_38/stack:output:09model_baba_1/td_dense_1/strided_slice_38/stack_1:output:09model_baba_1/td_dense_1/strided_slice_38/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_37/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_37MatMul1model_baba_1/td_dense_1/strided_slice_38:output:06model_baba_1/td_dense_1/Cast_37/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_37/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_37BiasAdd+model_baba_1/td_dense_1/MatMul_37:product:09model_baba_1/td_dense_1/BiasAdd_37/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_37Relu+model_baba_1/td_dense_1/BiasAdd_37:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_39/stackConst*
_output_shapes
:*
dtype0*
valueB:&z
0model_baba_1/td_dense_1/strided_slice_39/stack_1Const*
_output_shapes
:*
dtype0*
valueB:'z
0model_baba_1/td_dense_1/strided_slice_39/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_39StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_39/stack:output:09model_baba_1/td_dense_1/strided_slice_39/stack_1:output:09model_baba_1/td_dense_1/strided_slice_39/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_38/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_38MatMul1model_baba_1/td_dense_1/strided_slice_39:output:06model_baba_1/td_dense_1/Cast_38/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_38/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_38BiasAdd+model_baba_1/td_dense_1/MatMul_38:product:09model_baba_1/td_dense_1/BiasAdd_38/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_38Relu+model_baba_1/td_dense_1/BiasAdd_38:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_40/stackConst*
_output_shapes
:*
dtype0*
valueB:'z
0model_baba_1/td_dense_1/strided_slice_40/stack_1Const*
_output_shapes
:*
dtype0*
valueB:(z
0model_baba_1/td_dense_1/strided_slice_40/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_40StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_40/stack:output:09model_baba_1/td_dense_1/strided_slice_40/stack_1:output:09model_baba_1/td_dense_1/strided_slice_40/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_39/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_39MatMul1model_baba_1/td_dense_1/strided_slice_40:output:06model_baba_1/td_dense_1/Cast_39/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_39/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_39BiasAdd+model_baba_1/td_dense_1/MatMul_39:product:09model_baba_1/td_dense_1/BiasAdd_39/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_39Relu+model_baba_1/td_dense_1/BiasAdd_39:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_41/stackConst*
_output_shapes
:*
dtype0*
valueB:(z
0model_baba_1/td_dense_1/strided_slice_41/stack_1Const*
_output_shapes
:*
dtype0*
valueB:)z
0model_baba_1/td_dense_1/strided_slice_41/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_41StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_41/stack:output:09model_baba_1/td_dense_1/strided_slice_41/stack_1:output:09model_baba_1/td_dense_1/strided_slice_41/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_40/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_40MatMul1model_baba_1/td_dense_1/strided_slice_41:output:06model_baba_1/td_dense_1/Cast_40/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_40/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_40BiasAdd+model_baba_1/td_dense_1/MatMul_40:product:09model_baba_1/td_dense_1/BiasAdd_40/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_40Relu+model_baba_1/td_dense_1/BiasAdd_40:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_42/stackConst*
_output_shapes
:*
dtype0*
valueB:)z
0model_baba_1/td_dense_1/strided_slice_42/stack_1Const*
_output_shapes
:*
dtype0*
valueB:*z
0model_baba_1/td_dense_1/strided_slice_42/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_42StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_42/stack:output:09model_baba_1/td_dense_1/strided_slice_42/stack_1:output:09model_baba_1/td_dense_1/strided_slice_42/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_41/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_41MatMul1model_baba_1/td_dense_1/strided_slice_42:output:06model_baba_1/td_dense_1/Cast_41/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_41/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_41BiasAdd+model_baba_1/td_dense_1/MatMul_41:product:09model_baba_1/td_dense_1/BiasAdd_41/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_41Relu+model_baba_1/td_dense_1/BiasAdd_41:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_43/stackConst*
_output_shapes
:*
dtype0*
valueB:*z
0model_baba_1/td_dense_1/strided_slice_43/stack_1Const*
_output_shapes
:*
dtype0*
valueB:+z
0model_baba_1/td_dense_1/strided_slice_43/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_43StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_43/stack:output:09model_baba_1/td_dense_1/strided_slice_43/stack_1:output:09model_baba_1/td_dense_1/strided_slice_43/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_42/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_42MatMul1model_baba_1/td_dense_1/strided_slice_43:output:06model_baba_1/td_dense_1/Cast_42/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_42/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_42BiasAdd+model_baba_1/td_dense_1/MatMul_42:product:09model_baba_1/td_dense_1/BiasAdd_42/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_42Relu+model_baba_1/td_dense_1/BiasAdd_42:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_44/stackConst*
_output_shapes
:*
dtype0*
valueB:+z
0model_baba_1/td_dense_1/strided_slice_44/stack_1Const*
_output_shapes
:*
dtype0*
valueB:,z
0model_baba_1/td_dense_1/strided_slice_44/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_44StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_44/stack:output:09model_baba_1/td_dense_1/strided_slice_44/stack_1:output:09model_baba_1/td_dense_1/strided_slice_44/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_43/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_43MatMul1model_baba_1/td_dense_1/strided_slice_44:output:06model_baba_1/td_dense_1/Cast_43/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_43/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_43BiasAdd+model_baba_1/td_dense_1/MatMul_43:product:09model_baba_1/td_dense_1/BiasAdd_43/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_43Relu+model_baba_1/td_dense_1/BiasAdd_43:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_45/stackConst*
_output_shapes
:*
dtype0*
valueB:,z
0model_baba_1/td_dense_1/strided_slice_45/stack_1Const*
_output_shapes
:*
dtype0*
valueB:-z
0model_baba_1/td_dense_1/strided_slice_45/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_45StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_45/stack:output:09model_baba_1/td_dense_1/strided_slice_45/stack_1:output:09model_baba_1/td_dense_1/strided_slice_45/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_44/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_44MatMul1model_baba_1/td_dense_1/strided_slice_45:output:06model_baba_1/td_dense_1/Cast_44/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_44/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_44BiasAdd+model_baba_1/td_dense_1/MatMul_44:product:09model_baba_1/td_dense_1/BiasAdd_44/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_44Relu+model_baba_1/td_dense_1/BiasAdd_44:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_46/stackConst*
_output_shapes
:*
dtype0*
valueB:-z
0model_baba_1/td_dense_1/strided_slice_46/stack_1Const*
_output_shapes
:*
dtype0*
valueB:.z
0model_baba_1/td_dense_1/strided_slice_46/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_46StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_46/stack:output:09model_baba_1/td_dense_1/strided_slice_46/stack_1:output:09model_baba_1/td_dense_1/strided_slice_46/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_45/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_45MatMul1model_baba_1/td_dense_1/strided_slice_46:output:06model_baba_1/td_dense_1/Cast_45/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_45/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_45BiasAdd+model_baba_1/td_dense_1/MatMul_45:product:09model_baba_1/td_dense_1/BiasAdd_45/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_45Relu+model_baba_1/td_dense_1/BiasAdd_45:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_47/stackConst*
_output_shapes
:*
dtype0*
valueB:.z
0model_baba_1/td_dense_1/strided_slice_47/stack_1Const*
_output_shapes
:*
dtype0*
valueB:/z
0model_baba_1/td_dense_1/strided_slice_47/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_47StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_47/stack:output:09model_baba_1/td_dense_1/strided_slice_47/stack_1:output:09model_baba_1/td_dense_1/strided_slice_47/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_46/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_46MatMul1model_baba_1/td_dense_1/strided_slice_47:output:06model_baba_1/td_dense_1/Cast_46/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_46/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_46BiasAdd+model_baba_1/td_dense_1/MatMul_46:product:09model_baba_1/td_dense_1/BiasAdd_46/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_46Relu+model_baba_1/td_dense_1/BiasAdd_46:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_48/stackConst*
_output_shapes
:*
dtype0*
valueB:/z
0model_baba_1/td_dense_1/strided_slice_48/stack_1Const*
_output_shapes
:*
dtype0*
valueB:0z
0model_baba_1/td_dense_1/strided_slice_48/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_48StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_48/stack:output:09model_baba_1/td_dense_1/strided_slice_48/stack_1:output:09model_baba_1/td_dense_1/strided_slice_48/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_47/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_47MatMul1model_baba_1/td_dense_1/strided_slice_48:output:06model_baba_1/td_dense_1/Cast_47/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_47/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_47BiasAdd+model_baba_1/td_dense_1/MatMul_47:product:09model_baba_1/td_dense_1/BiasAdd_47/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_47Relu+model_baba_1/td_dense_1/BiasAdd_47:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_49/stackConst*
_output_shapes
:*
dtype0*
valueB:0z
0model_baba_1/td_dense_1/strided_slice_49/stack_1Const*
_output_shapes
:*
dtype0*
valueB:1z
0model_baba_1/td_dense_1/strided_slice_49/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_49StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_49/stack:output:09model_baba_1/td_dense_1/strided_slice_49/stack_1:output:09model_baba_1/td_dense_1/strided_slice_49/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_48/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_48MatMul1model_baba_1/td_dense_1/strided_slice_49:output:06model_baba_1/td_dense_1/Cast_48/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_48/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_48BiasAdd+model_baba_1/td_dense_1/MatMul_48:product:09model_baba_1/td_dense_1/BiasAdd_48/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_48Relu+model_baba_1/td_dense_1/BiasAdd_48:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_50/stackConst*
_output_shapes
:*
dtype0*
valueB:1z
0model_baba_1/td_dense_1/strided_slice_50/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2z
0model_baba_1/td_dense_1/strided_slice_50/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_50StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_50/stack:output:09model_baba_1/td_dense_1/strided_slice_50/stack_1:output:09model_baba_1/td_dense_1/strided_slice_50/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_49/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_49MatMul1model_baba_1/td_dense_1/strided_slice_50:output:06model_baba_1/td_dense_1/Cast_49/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_49/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_49BiasAdd+model_baba_1/td_dense_1/MatMul_49:product:09model_baba_1/td_dense_1/BiasAdd_49/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_49Relu+model_baba_1/td_dense_1/BiasAdd_49:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_51/stackConst*
_output_shapes
:*
dtype0*
valueB:2z
0model_baba_1/td_dense_1/strided_slice_51/stack_1Const*
_output_shapes
:*
dtype0*
valueB:3z
0model_baba_1/td_dense_1/strided_slice_51/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_51StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_51/stack:output:09model_baba_1/td_dense_1/strided_slice_51/stack_1:output:09model_baba_1/td_dense_1/strided_slice_51/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_50/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_50MatMul1model_baba_1/td_dense_1/strided_slice_51:output:06model_baba_1/td_dense_1/Cast_50/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_50/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_50BiasAdd+model_baba_1/td_dense_1/MatMul_50:product:09model_baba_1/td_dense_1/BiasAdd_50/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_50Relu+model_baba_1/td_dense_1/BiasAdd_50:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_52/stackConst*
_output_shapes
:*
dtype0*
valueB:3z
0model_baba_1/td_dense_1/strided_slice_52/stack_1Const*
_output_shapes
:*
dtype0*
valueB:4z
0model_baba_1/td_dense_1/strided_slice_52/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_52StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_52/stack:output:09model_baba_1/td_dense_1/strided_slice_52/stack_1:output:09model_baba_1/td_dense_1/strided_slice_52/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_51/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_51MatMul1model_baba_1/td_dense_1/strided_slice_52:output:06model_baba_1/td_dense_1/Cast_51/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_51/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_51BiasAdd+model_baba_1/td_dense_1/MatMul_51:product:09model_baba_1/td_dense_1/BiasAdd_51/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_51Relu+model_baba_1/td_dense_1/BiasAdd_51:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_53/stackConst*
_output_shapes
:*
dtype0*
valueB:4z
0model_baba_1/td_dense_1/strided_slice_53/stack_1Const*
_output_shapes
:*
dtype0*
valueB:5z
0model_baba_1/td_dense_1/strided_slice_53/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_53StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_53/stack:output:09model_baba_1/td_dense_1/strided_slice_53/stack_1:output:09model_baba_1/td_dense_1/strided_slice_53/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_52/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_52MatMul1model_baba_1/td_dense_1/strided_slice_53:output:06model_baba_1/td_dense_1/Cast_52/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_52/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_52BiasAdd+model_baba_1/td_dense_1/MatMul_52:product:09model_baba_1/td_dense_1/BiasAdd_52/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_52Relu+model_baba_1/td_dense_1/BiasAdd_52:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_54/stackConst*
_output_shapes
:*
dtype0*
valueB:5z
0model_baba_1/td_dense_1/strided_slice_54/stack_1Const*
_output_shapes
:*
dtype0*
valueB:6z
0model_baba_1/td_dense_1/strided_slice_54/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_54StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_54/stack:output:09model_baba_1/td_dense_1/strided_slice_54/stack_1:output:09model_baba_1/td_dense_1/strided_slice_54/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_53/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_53MatMul1model_baba_1/td_dense_1/strided_slice_54:output:06model_baba_1/td_dense_1/Cast_53/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_53/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_53BiasAdd+model_baba_1/td_dense_1/MatMul_53:product:09model_baba_1/td_dense_1/BiasAdd_53/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_53Relu+model_baba_1/td_dense_1/BiasAdd_53:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_55/stackConst*
_output_shapes
:*
dtype0*
valueB:6z
0model_baba_1/td_dense_1/strided_slice_55/stack_1Const*
_output_shapes
:*
dtype0*
valueB:7z
0model_baba_1/td_dense_1/strided_slice_55/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_55StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_55/stack:output:09model_baba_1/td_dense_1/strided_slice_55/stack_1:output:09model_baba_1/td_dense_1/strided_slice_55/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_54/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_54MatMul1model_baba_1/td_dense_1/strided_slice_55:output:06model_baba_1/td_dense_1/Cast_54/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_54/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_54BiasAdd+model_baba_1/td_dense_1/MatMul_54:product:09model_baba_1/td_dense_1/BiasAdd_54/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_54Relu+model_baba_1/td_dense_1/BiasAdd_54:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_56/stackConst*
_output_shapes
:*
dtype0*
valueB:7z
0model_baba_1/td_dense_1/strided_slice_56/stack_1Const*
_output_shapes
:*
dtype0*
valueB:8z
0model_baba_1/td_dense_1/strided_slice_56/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_56StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_56/stack:output:09model_baba_1/td_dense_1/strided_slice_56/stack_1:output:09model_baba_1/td_dense_1/strided_slice_56/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_55/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_55MatMul1model_baba_1/td_dense_1/strided_slice_56:output:06model_baba_1/td_dense_1/Cast_55/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_55/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_55BiasAdd+model_baba_1/td_dense_1/MatMul_55:product:09model_baba_1/td_dense_1/BiasAdd_55/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_55Relu+model_baba_1/td_dense_1/BiasAdd_55:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_57/stackConst*
_output_shapes
:*
dtype0*
valueB:8z
0model_baba_1/td_dense_1/strided_slice_57/stack_1Const*
_output_shapes
:*
dtype0*
valueB:9z
0model_baba_1/td_dense_1/strided_slice_57/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_57StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_57/stack:output:09model_baba_1/td_dense_1/strided_slice_57/stack_1:output:09model_baba_1/td_dense_1/strided_slice_57/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_56/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_56MatMul1model_baba_1/td_dense_1/strided_slice_57:output:06model_baba_1/td_dense_1/Cast_56/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_56/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_56BiasAdd+model_baba_1/td_dense_1/MatMul_56:product:09model_baba_1/td_dense_1/BiasAdd_56/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_56Relu+model_baba_1/td_dense_1/BiasAdd_56:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_58/stackConst*
_output_shapes
:*
dtype0*
valueB:9z
0model_baba_1/td_dense_1/strided_slice_58/stack_1Const*
_output_shapes
:*
dtype0*
valueB::z
0model_baba_1/td_dense_1/strided_slice_58/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_58StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_58/stack:output:09model_baba_1/td_dense_1/strided_slice_58/stack_1:output:09model_baba_1/td_dense_1/strided_slice_58/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_57/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_57MatMul1model_baba_1/td_dense_1/strided_slice_58:output:06model_baba_1/td_dense_1/Cast_57/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_57/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_57BiasAdd+model_baba_1/td_dense_1/MatMul_57:product:09model_baba_1/td_dense_1/BiasAdd_57/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_57Relu+model_baba_1/td_dense_1/BiasAdd_57:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_59/stackConst*
_output_shapes
:*
dtype0*
valueB::z
0model_baba_1/td_dense_1/strided_slice_59/stack_1Const*
_output_shapes
:*
dtype0*
valueB:;z
0model_baba_1/td_dense_1/strided_slice_59/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_59StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_59/stack:output:09model_baba_1/td_dense_1/strided_slice_59/stack_1:output:09model_baba_1/td_dense_1/strided_slice_59/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_58/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_58MatMul1model_baba_1/td_dense_1/strided_slice_59:output:06model_baba_1/td_dense_1/Cast_58/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_58/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_58BiasAdd+model_baba_1/td_dense_1/MatMul_58:product:09model_baba_1/td_dense_1/BiasAdd_58/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_58Relu+model_baba_1/td_dense_1/BiasAdd_58:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_60/stackConst*
_output_shapes
:*
dtype0*
valueB:;z
0model_baba_1/td_dense_1/strided_slice_60/stack_1Const*
_output_shapes
:*
dtype0*
valueB:<z
0model_baba_1/td_dense_1/strided_slice_60/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_60StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_60/stack:output:09model_baba_1/td_dense_1/strided_slice_60/stack_1:output:09model_baba_1/td_dense_1/strided_slice_60/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_59/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_59MatMul1model_baba_1/td_dense_1/strided_slice_60:output:06model_baba_1/td_dense_1/Cast_59/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_59/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_59BiasAdd+model_baba_1/td_dense_1/MatMul_59:product:09model_baba_1/td_dense_1/BiasAdd_59/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_59Relu+model_baba_1/td_dense_1/BiasAdd_59:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_61/stackConst*
_output_shapes
:*
dtype0*
valueB:<z
0model_baba_1/td_dense_1/strided_slice_61/stack_1Const*
_output_shapes
:*
dtype0*
valueB:=z
0model_baba_1/td_dense_1/strided_slice_61/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_61StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_61/stack:output:09model_baba_1/td_dense_1/strided_slice_61/stack_1:output:09model_baba_1/td_dense_1/strided_slice_61/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_60/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_60MatMul1model_baba_1/td_dense_1/strided_slice_61:output:06model_baba_1/td_dense_1/Cast_60/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_60/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_60BiasAdd+model_baba_1/td_dense_1/MatMul_60:product:09model_baba_1/td_dense_1/BiasAdd_60/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_60Relu+model_baba_1/td_dense_1/BiasAdd_60:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_62/stackConst*
_output_shapes
:*
dtype0*
valueB:=z
0model_baba_1/td_dense_1/strided_slice_62/stack_1Const*
_output_shapes
:*
dtype0*
valueB:>z
0model_baba_1/td_dense_1/strided_slice_62/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_62StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_62/stack:output:09model_baba_1/td_dense_1/strided_slice_62/stack_1:output:09model_baba_1/td_dense_1/strided_slice_62/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_61/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_61MatMul1model_baba_1/td_dense_1/strided_slice_62:output:06model_baba_1/td_dense_1/Cast_61/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_61/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_61BiasAdd+model_baba_1/td_dense_1/MatMul_61:product:09model_baba_1/td_dense_1/BiasAdd_61/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_61Relu+model_baba_1/td_dense_1/BiasAdd_61:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_63/stackConst*
_output_shapes
:*
dtype0*
valueB:>z
0model_baba_1/td_dense_1/strided_slice_63/stack_1Const*
_output_shapes
:*
dtype0*
valueB:?z
0model_baba_1/td_dense_1/strided_slice_63/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_63StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_63/stack:output:09model_baba_1/td_dense_1/strided_slice_63/stack_1:output:09model_baba_1/td_dense_1/strided_slice_63/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_62/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_62MatMul1model_baba_1/td_dense_1/strided_slice_63:output:06model_baba_1/td_dense_1/Cast_62/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_62/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_62BiasAdd+model_baba_1/td_dense_1/MatMul_62:product:09model_baba_1/td_dense_1/BiasAdd_62/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_62Relu+model_baba_1/td_dense_1/BiasAdd_62:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_64/stackConst*
_output_shapes
:*
dtype0*
valueB:?z
0model_baba_1/td_dense_1/strided_slice_64/stack_1Const*
_output_shapes
:*
dtype0*
valueB:@z
0model_baba_1/td_dense_1/strided_slice_64/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_64StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_64/stack:output:09model_baba_1/td_dense_1/strided_slice_64/stack_1:output:09model_baba_1/td_dense_1/strided_slice_64/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_63/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_63MatMul1model_baba_1/td_dense_1/strided_slice_64:output:06model_baba_1/td_dense_1/Cast_63/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_63/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_63BiasAdd+model_baba_1/td_dense_1/MatMul_63:product:09model_baba_1/td_dense_1/BiasAdd_63/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_63Relu+model_baba_1/td_dense_1/BiasAdd_63:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_65/stackConst*
_output_shapes
:*
dtype0*
valueB:@z
0model_baba_1/td_dense_1/strided_slice_65/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Az
0model_baba_1/td_dense_1/strided_slice_65/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_65StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_65/stack:output:09model_baba_1/td_dense_1/strided_slice_65/stack_1:output:09model_baba_1/td_dense_1/strided_slice_65/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_64/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_64MatMul1model_baba_1/td_dense_1/strided_slice_65:output:06model_baba_1/td_dense_1/Cast_64/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_64/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_64BiasAdd+model_baba_1/td_dense_1/MatMul_64:product:09model_baba_1/td_dense_1/BiasAdd_64/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_64Relu+model_baba_1/td_dense_1/BiasAdd_64:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_66/stackConst*
_output_shapes
:*
dtype0*
valueB:Az
0model_baba_1/td_dense_1/strided_slice_66/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Bz
0model_baba_1/td_dense_1/strided_slice_66/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_66StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_66/stack:output:09model_baba_1/td_dense_1/strided_slice_66/stack_1:output:09model_baba_1/td_dense_1/strided_slice_66/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_65/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_65MatMul1model_baba_1/td_dense_1/strided_slice_66:output:06model_baba_1/td_dense_1/Cast_65/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_65/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_65BiasAdd+model_baba_1/td_dense_1/MatMul_65:product:09model_baba_1/td_dense_1/BiasAdd_65/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_65Relu+model_baba_1/td_dense_1/BiasAdd_65:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_67/stackConst*
_output_shapes
:*
dtype0*
valueB:Bz
0model_baba_1/td_dense_1/strided_slice_67/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Cz
0model_baba_1/td_dense_1/strided_slice_67/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_67StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_67/stack:output:09model_baba_1/td_dense_1/strided_slice_67/stack_1:output:09model_baba_1/td_dense_1/strided_slice_67/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_66/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_66MatMul1model_baba_1/td_dense_1/strided_slice_67:output:06model_baba_1/td_dense_1/Cast_66/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_66/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_66BiasAdd+model_baba_1/td_dense_1/MatMul_66:product:09model_baba_1/td_dense_1/BiasAdd_66/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_66Relu+model_baba_1/td_dense_1/BiasAdd_66:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_68/stackConst*
_output_shapes
:*
dtype0*
valueB:Cz
0model_baba_1/td_dense_1/strided_slice_68/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Dz
0model_baba_1/td_dense_1/strided_slice_68/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_68StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_68/stack:output:09model_baba_1/td_dense_1/strided_slice_68/stack_1:output:09model_baba_1/td_dense_1/strided_slice_68/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_67/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_67MatMul1model_baba_1/td_dense_1/strided_slice_68:output:06model_baba_1/td_dense_1/Cast_67/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_67/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_67BiasAdd+model_baba_1/td_dense_1/MatMul_67:product:09model_baba_1/td_dense_1/BiasAdd_67/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_67Relu+model_baba_1/td_dense_1/BiasAdd_67:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_69/stackConst*
_output_shapes
:*
dtype0*
valueB:Dz
0model_baba_1/td_dense_1/strided_slice_69/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Ez
0model_baba_1/td_dense_1/strided_slice_69/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_69StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_69/stack:output:09model_baba_1/td_dense_1/strided_slice_69/stack_1:output:09model_baba_1/td_dense_1/strided_slice_69/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_68/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_68MatMul1model_baba_1/td_dense_1/strided_slice_69:output:06model_baba_1/td_dense_1/Cast_68/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_68/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_68BiasAdd+model_baba_1/td_dense_1/MatMul_68:product:09model_baba_1/td_dense_1/BiasAdd_68/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_68Relu+model_baba_1/td_dense_1/BiasAdd_68:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_70/stackConst*
_output_shapes
:*
dtype0*
valueB:Ez
0model_baba_1/td_dense_1/strided_slice_70/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Fz
0model_baba_1/td_dense_1/strided_slice_70/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_70StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_70/stack:output:09model_baba_1/td_dense_1/strided_slice_70/stack_1:output:09model_baba_1/td_dense_1/strided_slice_70/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_69/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_69MatMul1model_baba_1/td_dense_1/strided_slice_70:output:06model_baba_1/td_dense_1/Cast_69/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_69/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_69BiasAdd+model_baba_1/td_dense_1/MatMul_69:product:09model_baba_1/td_dense_1/BiasAdd_69/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_69Relu+model_baba_1/td_dense_1/BiasAdd_69:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_71/stackConst*
_output_shapes
:*
dtype0*
valueB:Fz
0model_baba_1/td_dense_1/strided_slice_71/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Gz
0model_baba_1/td_dense_1/strided_slice_71/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_71StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_71/stack:output:09model_baba_1/td_dense_1/strided_slice_71/stack_1:output:09model_baba_1/td_dense_1/strided_slice_71/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_70/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_70MatMul1model_baba_1/td_dense_1/strided_slice_71:output:06model_baba_1/td_dense_1/Cast_70/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_70/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_70BiasAdd+model_baba_1/td_dense_1/MatMul_70:product:09model_baba_1/td_dense_1/BiasAdd_70/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_70Relu+model_baba_1/td_dense_1/BiasAdd_70:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_72/stackConst*
_output_shapes
:*
dtype0*
valueB:Gz
0model_baba_1/td_dense_1/strided_slice_72/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Hz
0model_baba_1/td_dense_1/strided_slice_72/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_72StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_72/stack:output:09model_baba_1/td_dense_1/strided_slice_72/stack_1:output:09model_baba_1/td_dense_1/strided_slice_72/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_71/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_71MatMul1model_baba_1/td_dense_1/strided_slice_72:output:06model_baba_1/td_dense_1/Cast_71/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_71/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_71BiasAdd+model_baba_1/td_dense_1/MatMul_71:product:09model_baba_1/td_dense_1/BiasAdd_71/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_71Relu+model_baba_1/td_dense_1/BiasAdd_71:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_73/stackConst*
_output_shapes
:*
dtype0*
valueB:Hz
0model_baba_1/td_dense_1/strided_slice_73/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Iz
0model_baba_1/td_dense_1/strided_slice_73/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_73StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_73/stack:output:09model_baba_1/td_dense_1/strided_slice_73/stack_1:output:09model_baba_1/td_dense_1/strided_slice_73/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_72/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_72MatMul1model_baba_1/td_dense_1/strided_slice_73:output:06model_baba_1/td_dense_1/Cast_72/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_72/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_72BiasAdd+model_baba_1/td_dense_1/MatMul_72:product:09model_baba_1/td_dense_1/BiasAdd_72/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_72Relu+model_baba_1/td_dense_1/BiasAdd_72:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_74/stackConst*
_output_shapes
:*
dtype0*
valueB:Iz
0model_baba_1/td_dense_1/strided_slice_74/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Jz
0model_baba_1/td_dense_1/strided_slice_74/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_74StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_74/stack:output:09model_baba_1/td_dense_1/strided_slice_74/stack_1:output:09model_baba_1/td_dense_1/strided_slice_74/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_73/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_73MatMul1model_baba_1/td_dense_1/strided_slice_74:output:06model_baba_1/td_dense_1/Cast_73/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_73/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_73BiasAdd+model_baba_1/td_dense_1/MatMul_73:product:09model_baba_1/td_dense_1/BiasAdd_73/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_73Relu+model_baba_1/td_dense_1/BiasAdd_73:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_75/stackConst*
_output_shapes
:*
dtype0*
valueB:Jz
0model_baba_1/td_dense_1/strided_slice_75/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Kz
0model_baba_1/td_dense_1/strided_slice_75/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_75StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_75/stack:output:09model_baba_1/td_dense_1/strided_slice_75/stack_1:output:09model_baba_1/td_dense_1/strided_slice_75/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_74/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_74MatMul1model_baba_1/td_dense_1/strided_slice_75:output:06model_baba_1/td_dense_1/Cast_74/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_74/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_74BiasAdd+model_baba_1/td_dense_1/MatMul_74:product:09model_baba_1/td_dense_1/BiasAdd_74/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_74Relu+model_baba_1/td_dense_1/BiasAdd_74:output:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_dense_1/strided_slice_76/stackConst*
_output_shapes
:*
dtype0*
valueB:Kz
0model_baba_1/td_dense_1/strided_slice_76/stack_1Const*
_output_shapes
:*
dtype0*
valueB:Lz
0model_baba_1/td_dense_1/strided_slice_76/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_dense_1/strided_slice_76StridedSlice%model_baba_1/td_dense_1/transpose:y:07model_baba_1/td_dense_1/strided_slice_76/stack:output:09model_baba_1/td_dense_1/strided_slice_76/stack_1:output:09model_baba_1/td_dense_1/strided_slice_76/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_dense_1/Cast_75/ReadVariableOpReadVariableOp4model_baba_1_td_dense_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_dense_1/MatMul_75MatMul1model_baba_1/td_dense_1/strided_slice_76:output:06model_baba_1/td_dense_1/Cast_75/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
1model_baba_1/td_dense_1/BiasAdd_75/ReadVariableOpReadVariableOp7model_baba_1_td_dense_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"model_baba_1/td_dense_1/BiasAdd_75BiasAdd+model_baba_1/td_dense_1/MatMul_75:product:09model_baba_1/td_dense_1/BiasAdd_75/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/Relu_75Relu+model_baba_1/td_dense_1/BiasAdd_75:output:0*
T0*'
_output_shapes
:����������
model_baba_1/td_dense_1/stackPack*model_baba_1/td_dense_1/Relu:activations:0,model_baba_1/td_dense_1/Relu_1:activations:0,model_baba_1/td_dense_1/Relu_2:activations:0,model_baba_1/td_dense_1/Relu_3:activations:0,model_baba_1/td_dense_1/Relu_4:activations:0,model_baba_1/td_dense_1/Relu_5:activations:0,model_baba_1/td_dense_1/Relu_6:activations:0,model_baba_1/td_dense_1/Relu_7:activations:0,model_baba_1/td_dense_1/Relu_8:activations:0,model_baba_1/td_dense_1/Relu_9:activations:0-model_baba_1/td_dense_1/Relu_10:activations:0-model_baba_1/td_dense_1/Relu_11:activations:0-model_baba_1/td_dense_1/Relu_12:activations:0-model_baba_1/td_dense_1/Relu_13:activations:0-model_baba_1/td_dense_1/Relu_14:activations:0-model_baba_1/td_dense_1/Relu_15:activations:0-model_baba_1/td_dense_1/Relu_16:activations:0-model_baba_1/td_dense_1/Relu_17:activations:0-model_baba_1/td_dense_1/Relu_18:activations:0-model_baba_1/td_dense_1/Relu_19:activations:0-model_baba_1/td_dense_1/Relu_20:activations:0-model_baba_1/td_dense_1/Relu_21:activations:0-model_baba_1/td_dense_1/Relu_22:activations:0-model_baba_1/td_dense_1/Relu_23:activations:0-model_baba_1/td_dense_1/Relu_24:activations:0-model_baba_1/td_dense_1/Relu_25:activations:0-model_baba_1/td_dense_1/Relu_26:activations:0-model_baba_1/td_dense_1/Relu_27:activations:0-model_baba_1/td_dense_1/Relu_28:activations:0-model_baba_1/td_dense_1/Relu_29:activations:0-model_baba_1/td_dense_1/Relu_30:activations:0-model_baba_1/td_dense_1/Relu_31:activations:0-model_baba_1/td_dense_1/Relu_32:activations:0-model_baba_1/td_dense_1/Relu_33:activations:0-model_baba_1/td_dense_1/Relu_34:activations:0-model_baba_1/td_dense_1/Relu_35:activations:0-model_baba_1/td_dense_1/Relu_36:activations:0-model_baba_1/td_dense_1/Relu_37:activations:0-model_baba_1/td_dense_1/Relu_38:activations:0-model_baba_1/td_dense_1/Relu_39:activations:0-model_baba_1/td_dense_1/Relu_40:activations:0-model_baba_1/td_dense_1/Relu_41:activations:0-model_baba_1/td_dense_1/Relu_42:activations:0-model_baba_1/td_dense_1/Relu_43:activations:0-model_baba_1/td_dense_1/Relu_44:activations:0-model_baba_1/td_dense_1/Relu_45:activations:0-model_baba_1/td_dense_1/Relu_46:activations:0-model_baba_1/td_dense_1/Relu_47:activations:0-model_baba_1/td_dense_1/Relu_48:activations:0-model_baba_1/td_dense_1/Relu_49:activations:0-model_baba_1/td_dense_1/Relu_50:activations:0-model_baba_1/td_dense_1/Relu_51:activations:0-model_baba_1/td_dense_1/Relu_52:activations:0-model_baba_1/td_dense_1/Relu_53:activations:0-model_baba_1/td_dense_1/Relu_54:activations:0-model_baba_1/td_dense_1/Relu_55:activations:0-model_baba_1/td_dense_1/Relu_56:activations:0-model_baba_1/td_dense_1/Relu_57:activations:0-model_baba_1/td_dense_1/Relu_58:activations:0-model_baba_1/td_dense_1/Relu_59:activations:0-model_baba_1/td_dense_1/Relu_60:activations:0-model_baba_1/td_dense_1/Relu_61:activations:0-model_baba_1/td_dense_1/Relu_62:activations:0-model_baba_1/td_dense_1/Relu_63:activations:0-model_baba_1/td_dense_1/Relu_64:activations:0-model_baba_1/td_dense_1/Relu_65:activations:0-model_baba_1/td_dense_1/Relu_66:activations:0-model_baba_1/td_dense_1/Relu_67:activations:0-model_baba_1/td_dense_1/Relu_68:activations:0-model_baba_1/td_dense_1/Relu_69:activations:0-model_baba_1/td_dense_1/Relu_70:activations:0-model_baba_1/td_dense_1/Relu_71:activations:0-model_baba_1/td_dense_1/Relu_72:activations:0-model_baba_1/td_dense_1/Relu_73:activations:0-model_baba_1/td_dense_1/Relu_74:activations:0-model_baba_1/td_dense_1/Relu_75:activations:0*
NL*
T0*+
_output_shapes
:L���������}
(model_baba_1/td_dense_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
#model_baba_1/td_dense_1/transpose_1	Transpose&model_baba_1/td_dense_1/stack:output:01model_baba_1/td_dense_1/transpose_1/perm:output:0*
T0*+
_output_shapes
:���������L�
model_baba_1/td_output_1/ShapeShape'model_baba_1/td_dense_1/transpose_1:y:0*
T0*
_output_shapes
::��v
,model_baba_1/td_output_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.model_baba_1/td_output_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.model_baba_1/td_output_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&model_baba_1/td_output_1/strided_sliceStridedSlice'model_baba_1/td_output_1/Shape:output:05model_baba_1/td_output_1/strided_slice/stack:output:07model_baba_1/td_output_1/strided_slice/stack_1:output:07model_baba_1/td_output_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask|
'model_baba_1/td_output_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
"model_baba_1/td_output_1/transpose	Transpose'model_baba_1/td_dense_1/transpose_1:y:00model_baba_1/td_output_1/transpose/perm:output:0*
T0*+
_output_shapes
:L���������x
.model_baba_1/td_output_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0model_baba_1/td_output_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_1StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_1/stack:output:09model_baba_1/td_output_1/strided_slice_1/stack_1:output:09model_baba_1/td_output_1/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
,model_baba_1/td_output_1/Cast/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
model_baba_1/td_output_1/MatMulMatMul1model_baba_1/td_output_1/strided_slice_1:output:04model_baba_1/td_output_1/Cast/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
+model_baba_1/td_output_1/Add/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/AddAddV2)model_baba_1/td_output_1/MatMul:product:03model_baba_1/td_output_1/Add/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_2StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_2/stack:output:09model_baba_1/td_output_1/strided_slice_2/stack_1:output:09model_baba_1/td_output_1/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_1/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_1MatMul1model_baba_1/td_output_1/strided_slice_2:output:06model_baba_1/td_output_1/Cast_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_1/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_1AddV2+model_baba_1/td_output_1/MatMul_1:product:05model_baba_1/td_output_1/Add_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_3StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_3/stack:output:09model_baba_1/td_output_1/strided_slice_3/stack_1:output:09model_baba_1/td_output_1/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_2/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_2MatMul1model_baba_1/td_output_1/strided_slice_3:output:06model_baba_1/td_output_1/Cast_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_2/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_2AddV2+model_baba_1/td_output_1/MatMul_2:product:05model_baba_1/td_output_1/Add_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_4StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_4/stack:output:09model_baba_1/td_output_1/strided_slice_4/stack_1:output:09model_baba_1/td_output_1/strided_slice_4/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_3/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_3MatMul1model_baba_1/td_output_1/strided_slice_4:output:06model_baba_1/td_output_1/Cast_3/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_3/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_3AddV2+model_baba_1/td_output_1/MatMul_3:product:05model_baba_1/td_output_1/Add_3/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_5StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_5/stack:output:09model_baba_1/td_output_1/strided_slice_5/stack_1:output:09model_baba_1/td_output_1/strided_slice_5/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_4/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_4MatMul1model_baba_1/td_output_1/strided_slice_5:output:06model_baba_1/td_output_1/Cast_4/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_4/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_4AddV2+model_baba_1/td_output_1/MatMul_4:product:05model_baba_1/td_output_1/Add_4/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_6StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_6/stack:output:09model_baba_1/td_output_1/strided_slice_6/stack_1:output:09model_baba_1/td_output_1/strided_slice_6/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_5/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_5MatMul1model_baba_1/td_output_1/strided_slice_6:output:06model_baba_1/td_output_1/Cast_5/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_5/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_5AddV2+model_baba_1/td_output_1/MatMul_5:product:05model_baba_1/td_output_1/Add_5/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_7/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_7/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_7/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_7StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_7/stack:output:09model_baba_1/td_output_1/strided_slice_7/stack_1:output:09model_baba_1/td_output_1/strided_slice_7/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_6/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_6MatMul1model_baba_1/td_output_1/strided_slice_7:output:06model_baba_1/td_output_1/Cast_6/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_6/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_6AddV2+model_baba_1/td_output_1/MatMul_6:product:05model_baba_1/td_output_1/Add_6/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_8/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_8/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_8/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_8StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_8/stack:output:09model_baba_1/td_output_1/strided_slice_8/stack_1:output:09model_baba_1/td_output_1/strided_slice_8/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_7/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_7MatMul1model_baba_1/td_output_1/strided_slice_8:output:06model_baba_1/td_output_1/Cast_7/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_7/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_7AddV2+model_baba_1/td_output_1/MatMul_7:product:05model_baba_1/td_output_1/Add_7/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������x
.model_baba_1/td_output_1/strided_slice_9/stackConst*
_output_shapes
:*
dtype0*
valueB:z
0model_baba_1/td_output_1/strided_slice_9/stack_1Const*
_output_shapes
:*
dtype0*
valueB:	z
0model_baba_1/td_output_1/strided_slice_9/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(model_baba_1/td_output_1/strided_slice_9StridedSlice&model_baba_1/td_output_1/transpose:y:07model_baba_1/td_output_1/strided_slice_9/stack:output:09model_baba_1/td_output_1/strided_slice_9/stack_1:output:09model_baba_1/td_output_1/strided_slice_9/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_8/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_8MatMul1model_baba_1/td_output_1/strided_slice_9:output:06model_baba_1/td_output_1/Cast_8/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_8/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_8AddV2+model_baba_1/td_output_1/MatMul_8:product:05model_baba_1/td_output_1/Add_8/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_10/stackConst*
_output_shapes
:*
dtype0*
valueB:	{
1model_baba_1/td_output_1/strided_slice_10/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
{
1model_baba_1/td_output_1/strided_slice_10/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_10StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_10/stack:output:0:model_baba_1/td_output_1/strided_slice_10/stack_1:output:0:model_baba_1/td_output_1/strided_slice_10/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
.model_baba_1/td_output_1/Cast_9/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
!model_baba_1/td_output_1/MatMul_9MatMul2model_baba_1/td_output_1/strided_slice_10:output:06model_baba_1/td_output_1/Cast_9/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-model_baba_1/td_output_1/Add_9/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_9AddV2+model_baba_1/td_output_1/MatMul_9:product:05model_baba_1/td_output_1/Add_9/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_11/stackConst*
_output_shapes
:*
dtype0*
valueB:
{
1model_baba_1/td_output_1/strided_slice_11/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_11/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_11StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_11/stack:output:0:model_baba_1/td_output_1/strided_slice_11/stack_1:output:0:model_baba_1/td_output_1/strided_slice_11/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_10/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_10MatMul2model_baba_1/td_output_1/strided_slice_11:output:07model_baba_1/td_output_1/Cast_10/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_10/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_10AddV2,model_baba_1/td_output_1/MatMul_10:product:06model_baba_1/td_output_1/Add_10/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_12/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_12/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_12/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_12StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_12/stack:output:0:model_baba_1/td_output_1/strided_slice_12/stack_1:output:0:model_baba_1/td_output_1/strided_slice_12/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_11/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_11MatMul2model_baba_1/td_output_1/strided_slice_12:output:07model_baba_1/td_output_1/Cast_11/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_11/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_11AddV2,model_baba_1/td_output_1/MatMul_11:product:06model_baba_1/td_output_1/Add_11/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_13/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_13/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_13/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_13StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_13/stack:output:0:model_baba_1/td_output_1/strided_slice_13/stack_1:output:0:model_baba_1/td_output_1/strided_slice_13/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_12/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_12MatMul2model_baba_1/td_output_1/strided_slice_13:output:07model_baba_1/td_output_1/Cast_12/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_12/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_12AddV2,model_baba_1/td_output_1/MatMul_12:product:06model_baba_1/td_output_1/Add_12/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_14/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_14/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_14/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_14StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_14/stack:output:0:model_baba_1/td_output_1/strided_slice_14/stack_1:output:0:model_baba_1/td_output_1/strided_slice_14/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_13/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_13MatMul2model_baba_1/td_output_1/strided_slice_14:output:07model_baba_1/td_output_1/Cast_13/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_13/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_13AddV2,model_baba_1/td_output_1/MatMul_13:product:06model_baba_1/td_output_1/Add_13/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_15/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_15/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_15/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_15StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_15/stack:output:0:model_baba_1/td_output_1/strided_slice_15/stack_1:output:0:model_baba_1/td_output_1/strided_slice_15/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_14/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_14MatMul2model_baba_1/td_output_1/strided_slice_15:output:07model_baba_1/td_output_1/Cast_14/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_14/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_14AddV2,model_baba_1/td_output_1/MatMul_14:product:06model_baba_1/td_output_1/Add_14/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_16/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_16/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_16/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_16StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_16/stack:output:0:model_baba_1/td_output_1/strided_slice_16/stack_1:output:0:model_baba_1/td_output_1/strided_slice_16/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_15/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_15MatMul2model_baba_1/td_output_1/strided_slice_16:output:07model_baba_1/td_output_1/Cast_15/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_15/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_15AddV2,model_baba_1/td_output_1/MatMul_15:product:06model_baba_1/td_output_1/Add_15/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_17/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_17/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_17/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_17StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_17/stack:output:0:model_baba_1/td_output_1/strided_slice_17/stack_1:output:0:model_baba_1/td_output_1/strided_slice_17/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_16/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_16MatMul2model_baba_1/td_output_1/strided_slice_17:output:07model_baba_1/td_output_1/Cast_16/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_16/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_16AddV2,model_baba_1/td_output_1/MatMul_16:product:06model_baba_1/td_output_1/Add_16/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_18/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_18/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_18/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_18StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_18/stack:output:0:model_baba_1/td_output_1/strided_slice_18/stack_1:output:0:model_baba_1/td_output_1/strided_slice_18/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_17/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_17MatMul2model_baba_1/td_output_1/strided_slice_18:output:07model_baba_1/td_output_1/Cast_17/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_17/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_17AddV2,model_baba_1/td_output_1/MatMul_17:product:06model_baba_1/td_output_1/Add_17/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_19/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_19/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_19/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_19StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_19/stack:output:0:model_baba_1/td_output_1/strided_slice_19/stack_1:output:0:model_baba_1/td_output_1/strided_slice_19/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_18/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_18MatMul2model_baba_1/td_output_1/strided_slice_19:output:07model_baba_1/td_output_1/Cast_18/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_18/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_18AddV2,model_baba_1/td_output_1/MatMul_18:product:06model_baba_1/td_output_1/Add_18/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_20/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_20/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_20/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_20StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_20/stack:output:0:model_baba_1/td_output_1/strided_slice_20/stack_1:output:0:model_baba_1/td_output_1/strided_slice_20/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_19/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_19MatMul2model_baba_1/td_output_1/strided_slice_20:output:07model_baba_1/td_output_1/Cast_19/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_19/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_19AddV2,model_baba_1/td_output_1/MatMul_19:product:06model_baba_1/td_output_1/Add_19/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_21/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_21/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_21/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_21StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_21/stack:output:0:model_baba_1/td_output_1/strided_slice_21/stack_1:output:0:model_baba_1/td_output_1/strided_slice_21/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_20/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_20MatMul2model_baba_1/td_output_1/strided_slice_21:output:07model_baba_1/td_output_1/Cast_20/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_20/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_20AddV2,model_baba_1/td_output_1/MatMul_20:product:06model_baba_1/td_output_1/Add_20/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_22/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_22/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_22/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_22StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_22/stack:output:0:model_baba_1/td_output_1/strided_slice_22/stack_1:output:0:model_baba_1/td_output_1/strided_slice_22/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_21/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_21MatMul2model_baba_1/td_output_1/strided_slice_22:output:07model_baba_1/td_output_1/Cast_21/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_21/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_21AddV2,model_baba_1/td_output_1/MatMul_21:product:06model_baba_1/td_output_1/Add_21/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_23/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_23/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_23/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_23StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_23/stack:output:0:model_baba_1/td_output_1/strided_slice_23/stack_1:output:0:model_baba_1/td_output_1/strided_slice_23/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_22/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_22MatMul2model_baba_1/td_output_1/strided_slice_23:output:07model_baba_1/td_output_1/Cast_22/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_22/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_22AddV2,model_baba_1/td_output_1/MatMul_22:product:06model_baba_1/td_output_1/Add_22/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_24/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_24/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_24/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_24StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_24/stack:output:0:model_baba_1/td_output_1/strided_slice_24/stack_1:output:0:model_baba_1/td_output_1/strided_slice_24/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_23/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_23MatMul2model_baba_1/td_output_1/strided_slice_24:output:07model_baba_1/td_output_1/Cast_23/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_23/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_23AddV2,model_baba_1/td_output_1/MatMul_23:product:06model_baba_1/td_output_1/Add_23/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_25/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_25/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_25/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_25StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_25/stack:output:0:model_baba_1/td_output_1/strided_slice_25/stack_1:output:0:model_baba_1/td_output_1/strided_slice_25/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_24/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_24MatMul2model_baba_1/td_output_1/strided_slice_25:output:07model_baba_1/td_output_1/Cast_24/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_24/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_24AddV2,model_baba_1/td_output_1/MatMul_24:product:06model_baba_1/td_output_1/Add_24/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_26/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_26/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_26/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_26StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_26/stack:output:0:model_baba_1/td_output_1/strided_slice_26/stack_1:output:0:model_baba_1/td_output_1/strided_slice_26/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_25/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_25MatMul2model_baba_1/td_output_1/strided_slice_26:output:07model_baba_1/td_output_1/Cast_25/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_25/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_25AddV2,model_baba_1/td_output_1/MatMul_25:product:06model_baba_1/td_output_1/Add_25/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_27/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_27/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_27/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_27StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_27/stack:output:0:model_baba_1/td_output_1/strided_slice_27/stack_1:output:0:model_baba_1/td_output_1/strided_slice_27/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_26/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_26MatMul2model_baba_1/td_output_1/strided_slice_27:output:07model_baba_1/td_output_1/Cast_26/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_26/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_26AddV2,model_baba_1/td_output_1/MatMul_26:product:06model_baba_1/td_output_1/Add_26/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_28/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_28/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_28/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_28StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_28/stack:output:0:model_baba_1/td_output_1/strided_slice_28/stack_1:output:0:model_baba_1/td_output_1/strided_slice_28/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_27/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_27MatMul2model_baba_1/td_output_1/strided_slice_28:output:07model_baba_1/td_output_1/Cast_27/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_27/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_27AddV2,model_baba_1/td_output_1/MatMul_27:product:06model_baba_1/td_output_1/Add_27/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_29/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_29/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_29/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_29StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_29/stack:output:0:model_baba_1/td_output_1/strided_slice_29/stack_1:output:0:model_baba_1/td_output_1/strided_slice_29/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_28/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_28MatMul2model_baba_1/td_output_1/strided_slice_29:output:07model_baba_1/td_output_1/Cast_28/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_28/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_28AddV2,model_baba_1/td_output_1/MatMul_28:product:06model_baba_1/td_output_1/Add_28/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_30/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_30/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_30/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_30StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_30/stack:output:0:model_baba_1/td_output_1/strided_slice_30/stack_1:output:0:model_baba_1/td_output_1/strided_slice_30/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_29/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_29MatMul2model_baba_1/td_output_1/strided_slice_30:output:07model_baba_1/td_output_1/Cast_29/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_29/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_29AddV2,model_baba_1/td_output_1/MatMul_29:product:06model_baba_1/td_output_1/Add_29/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_31/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_31/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_31/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_31StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_31/stack:output:0:model_baba_1/td_output_1/strided_slice_31/stack_1:output:0:model_baba_1/td_output_1/strided_slice_31/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_30/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_30MatMul2model_baba_1/td_output_1/strided_slice_31:output:07model_baba_1/td_output_1/Cast_30/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_30/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_30AddV2,model_baba_1/td_output_1/MatMul_30:product:06model_baba_1/td_output_1/Add_30/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_32/stackConst*
_output_shapes
:*
dtype0*
valueB:{
1model_baba_1/td_output_1/strided_slice_32/stack_1Const*
_output_shapes
:*
dtype0*
valueB: {
1model_baba_1/td_output_1/strided_slice_32/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_32StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_32/stack:output:0:model_baba_1/td_output_1/strided_slice_32/stack_1:output:0:model_baba_1/td_output_1/strided_slice_32/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_31/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_31MatMul2model_baba_1/td_output_1/strided_slice_32:output:07model_baba_1/td_output_1/Cast_31/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_31/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_31AddV2,model_baba_1/td_output_1/MatMul_31:product:06model_baba_1/td_output_1/Add_31/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_33/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1model_baba_1/td_output_1/strided_slice_33/stack_1Const*
_output_shapes
:*
dtype0*
valueB:!{
1model_baba_1/td_output_1/strided_slice_33/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_33StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_33/stack:output:0:model_baba_1/td_output_1/strided_slice_33/stack_1:output:0:model_baba_1/td_output_1/strided_slice_33/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_32/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_32MatMul2model_baba_1/td_output_1/strided_slice_33:output:07model_baba_1/td_output_1/Cast_32/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_32/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_32AddV2,model_baba_1/td_output_1/MatMul_32:product:06model_baba_1/td_output_1/Add_32/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_34/stackConst*
_output_shapes
:*
dtype0*
valueB:!{
1model_baba_1/td_output_1/strided_slice_34/stack_1Const*
_output_shapes
:*
dtype0*
valueB:"{
1model_baba_1/td_output_1/strided_slice_34/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_34StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_34/stack:output:0:model_baba_1/td_output_1/strided_slice_34/stack_1:output:0:model_baba_1/td_output_1/strided_slice_34/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_33/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_33MatMul2model_baba_1/td_output_1/strided_slice_34:output:07model_baba_1/td_output_1/Cast_33/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_33/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_33AddV2,model_baba_1/td_output_1/MatMul_33:product:06model_baba_1/td_output_1/Add_33/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_35/stackConst*
_output_shapes
:*
dtype0*
valueB:"{
1model_baba_1/td_output_1/strided_slice_35/stack_1Const*
_output_shapes
:*
dtype0*
valueB:#{
1model_baba_1/td_output_1/strided_slice_35/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_35StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_35/stack:output:0:model_baba_1/td_output_1/strided_slice_35/stack_1:output:0:model_baba_1/td_output_1/strided_slice_35/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_34/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_34MatMul2model_baba_1/td_output_1/strided_slice_35:output:07model_baba_1/td_output_1/Cast_34/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_34/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_34AddV2,model_baba_1/td_output_1/MatMul_34:product:06model_baba_1/td_output_1/Add_34/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_36/stackConst*
_output_shapes
:*
dtype0*
valueB:#{
1model_baba_1/td_output_1/strided_slice_36/stack_1Const*
_output_shapes
:*
dtype0*
valueB:${
1model_baba_1/td_output_1/strided_slice_36/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_36StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_36/stack:output:0:model_baba_1/td_output_1/strided_slice_36/stack_1:output:0:model_baba_1/td_output_1/strided_slice_36/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_35/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_35MatMul2model_baba_1/td_output_1/strided_slice_36:output:07model_baba_1/td_output_1/Cast_35/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_35/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_35AddV2,model_baba_1/td_output_1/MatMul_35:product:06model_baba_1/td_output_1/Add_35/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_37/stackConst*
_output_shapes
:*
dtype0*
valueB:${
1model_baba_1/td_output_1/strided_slice_37/stack_1Const*
_output_shapes
:*
dtype0*
valueB:%{
1model_baba_1/td_output_1/strided_slice_37/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_37StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_37/stack:output:0:model_baba_1/td_output_1/strided_slice_37/stack_1:output:0:model_baba_1/td_output_1/strided_slice_37/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_36/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_36MatMul2model_baba_1/td_output_1/strided_slice_37:output:07model_baba_1/td_output_1/Cast_36/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_36/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_36AddV2,model_baba_1/td_output_1/MatMul_36:product:06model_baba_1/td_output_1/Add_36/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_38/stackConst*
_output_shapes
:*
dtype0*
valueB:%{
1model_baba_1/td_output_1/strided_slice_38/stack_1Const*
_output_shapes
:*
dtype0*
valueB:&{
1model_baba_1/td_output_1/strided_slice_38/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_38StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_38/stack:output:0:model_baba_1/td_output_1/strided_slice_38/stack_1:output:0:model_baba_1/td_output_1/strided_slice_38/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_37/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_37MatMul2model_baba_1/td_output_1/strided_slice_38:output:07model_baba_1/td_output_1/Cast_37/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_37/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_37AddV2,model_baba_1/td_output_1/MatMul_37:product:06model_baba_1/td_output_1/Add_37/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_39/stackConst*
_output_shapes
:*
dtype0*
valueB:&{
1model_baba_1/td_output_1/strided_slice_39/stack_1Const*
_output_shapes
:*
dtype0*
valueB:'{
1model_baba_1/td_output_1/strided_slice_39/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_39StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_39/stack:output:0:model_baba_1/td_output_1/strided_slice_39/stack_1:output:0:model_baba_1/td_output_1/strided_slice_39/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_38/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_38MatMul2model_baba_1/td_output_1/strided_slice_39:output:07model_baba_1/td_output_1/Cast_38/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_38/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_38AddV2,model_baba_1/td_output_1/MatMul_38:product:06model_baba_1/td_output_1/Add_38/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_40/stackConst*
_output_shapes
:*
dtype0*
valueB:'{
1model_baba_1/td_output_1/strided_slice_40/stack_1Const*
_output_shapes
:*
dtype0*
valueB:({
1model_baba_1/td_output_1/strided_slice_40/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_40StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_40/stack:output:0:model_baba_1/td_output_1/strided_slice_40/stack_1:output:0:model_baba_1/td_output_1/strided_slice_40/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_39/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_39MatMul2model_baba_1/td_output_1/strided_slice_40:output:07model_baba_1/td_output_1/Cast_39/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_39/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_39AddV2,model_baba_1/td_output_1/MatMul_39:product:06model_baba_1/td_output_1/Add_39/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_41/stackConst*
_output_shapes
:*
dtype0*
valueB:({
1model_baba_1/td_output_1/strided_slice_41/stack_1Const*
_output_shapes
:*
dtype0*
valueB:){
1model_baba_1/td_output_1/strided_slice_41/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_41StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_41/stack:output:0:model_baba_1/td_output_1/strided_slice_41/stack_1:output:0:model_baba_1/td_output_1/strided_slice_41/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_40/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_40MatMul2model_baba_1/td_output_1/strided_slice_41:output:07model_baba_1/td_output_1/Cast_40/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_40/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_40AddV2,model_baba_1/td_output_1/MatMul_40:product:06model_baba_1/td_output_1/Add_40/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_42/stackConst*
_output_shapes
:*
dtype0*
valueB:){
1model_baba_1/td_output_1/strided_slice_42/stack_1Const*
_output_shapes
:*
dtype0*
valueB:*{
1model_baba_1/td_output_1/strided_slice_42/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_42StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_42/stack:output:0:model_baba_1/td_output_1/strided_slice_42/stack_1:output:0:model_baba_1/td_output_1/strided_slice_42/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_41/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_41MatMul2model_baba_1/td_output_1/strided_slice_42:output:07model_baba_1/td_output_1/Cast_41/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_41/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_41AddV2,model_baba_1/td_output_1/MatMul_41:product:06model_baba_1/td_output_1/Add_41/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_43/stackConst*
_output_shapes
:*
dtype0*
valueB:*{
1model_baba_1/td_output_1/strided_slice_43/stack_1Const*
_output_shapes
:*
dtype0*
valueB:+{
1model_baba_1/td_output_1/strided_slice_43/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_43StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_43/stack:output:0:model_baba_1/td_output_1/strided_slice_43/stack_1:output:0:model_baba_1/td_output_1/strided_slice_43/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_42/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_42MatMul2model_baba_1/td_output_1/strided_slice_43:output:07model_baba_1/td_output_1/Cast_42/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_42/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_42AddV2,model_baba_1/td_output_1/MatMul_42:product:06model_baba_1/td_output_1/Add_42/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_44/stackConst*
_output_shapes
:*
dtype0*
valueB:+{
1model_baba_1/td_output_1/strided_slice_44/stack_1Const*
_output_shapes
:*
dtype0*
valueB:,{
1model_baba_1/td_output_1/strided_slice_44/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_44StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_44/stack:output:0:model_baba_1/td_output_1/strided_slice_44/stack_1:output:0:model_baba_1/td_output_1/strided_slice_44/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_43/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_43MatMul2model_baba_1/td_output_1/strided_slice_44:output:07model_baba_1/td_output_1/Cast_43/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_43/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_43AddV2,model_baba_1/td_output_1/MatMul_43:product:06model_baba_1/td_output_1/Add_43/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_45/stackConst*
_output_shapes
:*
dtype0*
valueB:,{
1model_baba_1/td_output_1/strided_slice_45/stack_1Const*
_output_shapes
:*
dtype0*
valueB:-{
1model_baba_1/td_output_1/strided_slice_45/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_45StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_45/stack:output:0:model_baba_1/td_output_1/strided_slice_45/stack_1:output:0:model_baba_1/td_output_1/strided_slice_45/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_44/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_44MatMul2model_baba_1/td_output_1/strided_slice_45:output:07model_baba_1/td_output_1/Cast_44/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_44/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_44AddV2,model_baba_1/td_output_1/MatMul_44:product:06model_baba_1/td_output_1/Add_44/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_46/stackConst*
_output_shapes
:*
dtype0*
valueB:-{
1model_baba_1/td_output_1/strided_slice_46/stack_1Const*
_output_shapes
:*
dtype0*
valueB:.{
1model_baba_1/td_output_1/strided_slice_46/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_46StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_46/stack:output:0:model_baba_1/td_output_1/strided_slice_46/stack_1:output:0:model_baba_1/td_output_1/strided_slice_46/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_45/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_45MatMul2model_baba_1/td_output_1/strided_slice_46:output:07model_baba_1/td_output_1/Cast_45/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_45/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_45AddV2,model_baba_1/td_output_1/MatMul_45:product:06model_baba_1/td_output_1/Add_45/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_47/stackConst*
_output_shapes
:*
dtype0*
valueB:.{
1model_baba_1/td_output_1/strided_slice_47/stack_1Const*
_output_shapes
:*
dtype0*
valueB:/{
1model_baba_1/td_output_1/strided_slice_47/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_47StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_47/stack:output:0:model_baba_1/td_output_1/strided_slice_47/stack_1:output:0:model_baba_1/td_output_1/strided_slice_47/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_46/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_46MatMul2model_baba_1/td_output_1/strided_slice_47:output:07model_baba_1/td_output_1/Cast_46/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_46/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_46AddV2,model_baba_1/td_output_1/MatMul_46:product:06model_baba_1/td_output_1/Add_46/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_48/stackConst*
_output_shapes
:*
dtype0*
valueB:/{
1model_baba_1/td_output_1/strided_slice_48/stack_1Const*
_output_shapes
:*
dtype0*
valueB:0{
1model_baba_1/td_output_1/strided_slice_48/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_48StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_48/stack:output:0:model_baba_1/td_output_1/strided_slice_48/stack_1:output:0:model_baba_1/td_output_1/strided_slice_48/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_47/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_47MatMul2model_baba_1/td_output_1/strided_slice_48:output:07model_baba_1/td_output_1/Cast_47/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_47/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_47AddV2,model_baba_1/td_output_1/MatMul_47:product:06model_baba_1/td_output_1/Add_47/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_49/stackConst*
_output_shapes
:*
dtype0*
valueB:0{
1model_baba_1/td_output_1/strided_slice_49/stack_1Const*
_output_shapes
:*
dtype0*
valueB:1{
1model_baba_1/td_output_1/strided_slice_49/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_49StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_49/stack:output:0:model_baba_1/td_output_1/strided_slice_49/stack_1:output:0:model_baba_1/td_output_1/strided_slice_49/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_48/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_48MatMul2model_baba_1/td_output_1/strided_slice_49:output:07model_baba_1/td_output_1/Cast_48/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_48/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_48AddV2,model_baba_1/td_output_1/MatMul_48:product:06model_baba_1/td_output_1/Add_48/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_50/stackConst*
_output_shapes
:*
dtype0*
valueB:1{
1model_baba_1/td_output_1/strided_slice_50/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2{
1model_baba_1/td_output_1/strided_slice_50/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_50StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_50/stack:output:0:model_baba_1/td_output_1/strided_slice_50/stack_1:output:0:model_baba_1/td_output_1/strided_slice_50/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_49/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_49MatMul2model_baba_1/td_output_1/strided_slice_50:output:07model_baba_1/td_output_1/Cast_49/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_49/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_49AddV2,model_baba_1/td_output_1/MatMul_49:product:06model_baba_1/td_output_1/Add_49/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_51/stackConst*
_output_shapes
:*
dtype0*
valueB:2{
1model_baba_1/td_output_1/strided_slice_51/stack_1Const*
_output_shapes
:*
dtype0*
valueB:3{
1model_baba_1/td_output_1/strided_slice_51/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_51StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_51/stack:output:0:model_baba_1/td_output_1/strided_slice_51/stack_1:output:0:model_baba_1/td_output_1/strided_slice_51/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_50/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_50MatMul2model_baba_1/td_output_1/strided_slice_51:output:07model_baba_1/td_output_1/Cast_50/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_50/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_50AddV2,model_baba_1/td_output_1/MatMul_50:product:06model_baba_1/td_output_1/Add_50/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_52/stackConst*
_output_shapes
:*
dtype0*
valueB:3{
1model_baba_1/td_output_1/strided_slice_52/stack_1Const*
_output_shapes
:*
dtype0*
valueB:4{
1model_baba_1/td_output_1/strided_slice_52/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_52StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_52/stack:output:0:model_baba_1/td_output_1/strided_slice_52/stack_1:output:0:model_baba_1/td_output_1/strided_slice_52/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_51/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_51MatMul2model_baba_1/td_output_1/strided_slice_52:output:07model_baba_1/td_output_1/Cast_51/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_51/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_51AddV2,model_baba_1/td_output_1/MatMul_51:product:06model_baba_1/td_output_1/Add_51/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_53/stackConst*
_output_shapes
:*
dtype0*
valueB:4{
1model_baba_1/td_output_1/strided_slice_53/stack_1Const*
_output_shapes
:*
dtype0*
valueB:5{
1model_baba_1/td_output_1/strided_slice_53/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_53StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_53/stack:output:0:model_baba_1/td_output_1/strided_slice_53/stack_1:output:0:model_baba_1/td_output_1/strided_slice_53/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_52/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_52MatMul2model_baba_1/td_output_1/strided_slice_53:output:07model_baba_1/td_output_1/Cast_52/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_52/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_52AddV2,model_baba_1/td_output_1/MatMul_52:product:06model_baba_1/td_output_1/Add_52/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_54/stackConst*
_output_shapes
:*
dtype0*
valueB:5{
1model_baba_1/td_output_1/strided_slice_54/stack_1Const*
_output_shapes
:*
dtype0*
valueB:6{
1model_baba_1/td_output_1/strided_slice_54/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_54StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_54/stack:output:0:model_baba_1/td_output_1/strided_slice_54/stack_1:output:0:model_baba_1/td_output_1/strided_slice_54/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_53/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_53MatMul2model_baba_1/td_output_1/strided_slice_54:output:07model_baba_1/td_output_1/Cast_53/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_53/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_53AddV2,model_baba_1/td_output_1/MatMul_53:product:06model_baba_1/td_output_1/Add_53/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_55/stackConst*
_output_shapes
:*
dtype0*
valueB:6{
1model_baba_1/td_output_1/strided_slice_55/stack_1Const*
_output_shapes
:*
dtype0*
valueB:7{
1model_baba_1/td_output_1/strided_slice_55/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_55StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_55/stack:output:0:model_baba_1/td_output_1/strided_slice_55/stack_1:output:0:model_baba_1/td_output_1/strided_slice_55/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_54/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_54MatMul2model_baba_1/td_output_1/strided_slice_55:output:07model_baba_1/td_output_1/Cast_54/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_54/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_54AddV2,model_baba_1/td_output_1/MatMul_54:product:06model_baba_1/td_output_1/Add_54/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_56/stackConst*
_output_shapes
:*
dtype0*
valueB:7{
1model_baba_1/td_output_1/strided_slice_56/stack_1Const*
_output_shapes
:*
dtype0*
valueB:8{
1model_baba_1/td_output_1/strided_slice_56/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_56StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_56/stack:output:0:model_baba_1/td_output_1/strided_slice_56/stack_1:output:0:model_baba_1/td_output_1/strided_slice_56/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_55/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_55MatMul2model_baba_1/td_output_1/strided_slice_56:output:07model_baba_1/td_output_1/Cast_55/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_55/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_55AddV2,model_baba_1/td_output_1/MatMul_55:product:06model_baba_1/td_output_1/Add_55/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_57/stackConst*
_output_shapes
:*
dtype0*
valueB:8{
1model_baba_1/td_output_1/strided_slice_57/stack_1Const*
_output_shapes
:*
dtype0*
valueB:9{
1model_baba_1/td_output_1/strided_slice_57/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_57StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_57/stack:output:0:model_baba_1/td_output_1/strided_slice_57/stack_1:output:0:model_baba_1/td_output_1/strided_slice_57/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_56/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_56MatMul2model_baba_1/td_output_1/strided_slice_57:output:07model_baba_1/td_output_1/Cast_56/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_56/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_56AddV2,model_baba_1/td_output_1/MatMul_56:product:06model_baba_1/td_output_1/Add_56/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_58/stackConst*
_output_shapes
:*
dtype0*
valueB:9{
1model_baba_1/td_output_1/strided_slice_58/stack_1Const*
_output_shapes
:*
dtype0*
valueB::{
1model_baba_1/td_output_1/strided_slice_58/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_58StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_58/stack:output:0:model_baba_1/td_output_1/strided_slice_58/stack_1:output:0:model_baba_1/td_output_1/strided_slice_58/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_57/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_57MatMul2model_baba_1/td_output_1/strided_slice_58:output:07model_baba_1/td_output_1/Cast_57/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_57/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_57AddV2,model_baba_1/td_output_1/MatMul_57:product:06model_baba_1/td_output_1/Add_57/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_59/stackConst*
_output_shapes
:*
dtype0*
valueB::{
1model_baba_1/td_output_1/strided_slice_59/stack_1Const*
_output_shapes
:*
dtype0*
valueB:;{
1model_baba_1/td_output_1/strided_slice_59/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_59StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_59/stack:output:0:model_baba_1/td_output_1/strided_slice_59/stack_1:output:0:model_baba_1/td_output_1/strided_slice_59/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_58/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_58MatMul2model_baba_1/td_output_1/strided_slice_59:output:07model_baba_1/td_output_1/Cast_58/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_58/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_58AddV2,model_baba_1/td_output_1/MatMul_58:product:06model_baba_1/td_output_1/Add_58/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_60/stackConst*
_output_shapes
:*
dtype0*
valueB:;{
1model_baba_1/td_output_1/strided_slice_60/stack_1Const*
_output_shapes
:*
dtype0*
valueB:<{
1model_baba_1/td_output_1/strided_slice_60/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_60StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_60/stack:output:0:model_baba_1/td_output_1/strided_slice_60/stack_1:output:0:model_baba_1/td_output_1/strided_slice_60/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_59/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_59MatMul2model_baba_1/td_output_1/strided_slice_60:output:07model_baba_1/td_output_1/Cast_59/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_59/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_59AddV2,model_baba_1/td_output_1/MatMul_59:product:06model_baba_1/td_output_1/Add_59/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_61/stackConst*
_output_shapes
:*
dtype0*
valueB:<{
1model_baba_1/td_output_1/strided_slice_61/stack_1Const*
_output_shapes
:*
dtype0*
valueB:={
1model_baba_1/td_output_1/strided_slice_61/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_61StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_61/stack:output:0:model_baba_1/td_output_1/strided_slice_61/stack_1:output:0:model_baba_1/td_output_1/strided_slice_61/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_60/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_60MatMul2model_baba_1/td_output_1/strided_slice_61:output:07model_baba_1/td_output_1/Cast_60/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_60/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_60AddV2,model_baba_1/td_output_1/MatMul_60:product:06model_baba_1/td_output_1/Add_60/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_62/stackConst*
_output_shapes
:*
dtype0*
valueB:={
1model_baba_1/td_output_1/strided_slice_62/stack_1Const*
_output_shapes
:*
dtype0*
valueB:>{
1model_baba_1/td_output_1/strided_slice_62/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_62StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_62/stack:output:0:model_baba_1/td_output_1/strided_slice_62/stack_1:output:0:model_baba_1/td_output_1/strided_slice_62/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_61/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_61MatMul2model_baba_1/td_output_1/strided_slice_62:output:07model_baba_1/td_output_1/Cast_61/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_61/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_61AddV2,model_baba_1/td_output_1/MatMul_61:product:06model_baba_1/td_output_1/Add_61/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_63/stackConst*
_output_shapes
:*
dtype0*
valueB:>{
1model_baba_1/td_output_1/strided_slice_63/stack_1Const*
_output_shapes
:*
dtype0*
valueB:?{
1model_baba_1/td_output_1/strided_slice_63/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_63StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_63/stack:output:0:model_baba_1/td_output_1/strided_slice_63/stack_1:output:0:model_baba_1/td_output_1/strided_slice_63/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_62/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_62MatMul2model_baba_1/td_output_1/strided_slice_63:output:07model_baba_1/td_output_1/Cast_62/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_62/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_62AddV2,model_baba_1/td_output_1/MatMul_62:product:06model_baba_1/td_output_1/Add_62/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_64/stackConst*
_output_shapes
:*
dtype0*
valueB:?{
1model_baba_1/td_output_1/strided_slice_64/stack_1Const*
_output_shapes
:*
dtype0*
valueB:@{
1model_baba_1/td_output_1/strided_slice_64/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_64StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_64/stack:output:0:model_baba_1/td_output_1/strided_slice_64/stack_1:output:0:model_baba_1/td_output_1/strided_slice_64/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_63/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_63MatMul2model_baba_1/td_output_1/strided_slice_64:output:07model_baba_1/td_output_1/Cast_63/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_63/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_63AddV2,model_baba_1/td_output_1/MatMul_63:product:06model_baba_1/td_output_1/Add_63/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_65/stackConst*
_output_shapes
:*
dtype0*
valueB:@{
1model_baba_1/td_output_1/strided_slice_65/stack_1Const*
_output_shapes
:*
dtype0*
valueB:A{
1model_baba_1/td_output_1/strided_slice_65/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_65StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_65/stack:output:0:model_baba_1/td_output_1/strided_slice_65/stack_1:output:0:model_baba_1/td_output_1/strided_slice_65/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_64/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_64MatMul2model_baba_1/td_output_1/strided_slice_65:output:07model_baba_1/td_output_1/Cast_64/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_64/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_64AddV2,model_baba_1/td_output_1/MatMul_64:product:06model_baba_1/td_output_1/Add_64/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_66/stackConst*
_output_shapes
:*
dtype0*
valueB:A{
1model_baba_1/td_output_1/strided_slice_66/stack_1Const*
_output_shapes
:*
dtype0*
valueB:B{
1model_baba_1/td_output_1/strided_slice_66/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_66StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_66/stack:output:0:model_baba_1/td_output_1/strided_slice_66/stack_1:output:0:model_baba_1/td_output_1/strided_slice_66/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_65/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_65MatMul2model_baba_1/td_output_1/strided_slice_66:output:07model_baba_1/td_output_1/Cast_65/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_65/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_65AddV2,model_baba_1/td_output_1/MatMul_65:product:06model_baba_1/td_output_1/Add_65/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_67/stackConst*
_output_shapes
:*
dtype0*
valueB:B{
1model_baba_1/td_output_1/strided_slice_67/stack_1Const*
_output_shapes
:*
dtype0*
valueB:C{
1model_baba_1/td_output_1/strided_slice_67/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_67StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_67/stack:output:0:model_baba_1/td_output_1/strided_slice_67/stack_1:output:0:model_baba_1/td_output_1/strided_slice_67/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_66/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_66MatMul2model_baba_1/td_output_1/strided_slice_67:output:07model_baba_1/td_output_1/Cast_66/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_66/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_66AddV2,model_baba_1/td_output_1/MatMul_66:product:06model_baba_1/td_output_1/Add_66/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_68/stackConst*
_output_shapes
:*
dtype0*
valueB:C{
1model_baba_1/td_output_1/strided_slice_68/stack_1Const*
_output_shapes
:*
dtype0*
valueB:D{
1model_baba_1/td_output_1/strided_slice_68/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_68StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_68/stack:output:0:model_baba_1/td_output_1/strided_slice_68/stack_1:output:0:model_baba_1/td_output_1/strided_slice_68/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_67/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_67MatMul2model_baba_1/td_output_1/strided_slice_68:output:07model_baba_1/td_output_1/Cast_67/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_67/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_67AddV2,model_baba_1/td_output_1/MatMul_67:product:06model_baba_1/td_output_1/Add_67/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_69/stackConst*
_output_shapes
:*
dtype0*
valueB:D{
1model_baba_1/td_output_1/strided_slice_69/stack_1Const*
_output_shapes
:*
dtype0*
valueB:E{
1model_baba_1/td_output_1/strided_slice_69/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_69StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_69/stack:output:0:model_baba_1/td_output_1/strided_slice_69/stack_1:output:0:model_baba_1/td_output_1/strided_slice_69/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_68/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_68MatMul2model_baba_1/td_output_1/strided_slice_69:output:07model_baba_1/td_output_1/Cast_68/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_68/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_68AddV2,model_baba_1/td_output_1/MatMul_68:product:06model_baba_1/td_output_1/Add_68/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_70/stackConst*
_output_shapes
:*
dtype0*
valueB:E{
1model_baba_1/td_output_1/strided_slice_70/stack_1Const*
_output_shapes
:*
dtype0*
valueB:F{
1model_baba_1/td_output_1/strided_slice_70/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_70StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_70/stack:output:0:model_baba_1/td_output_1/strided_slice_70/stack_1:output:0:model_baba_1/td_output_1/strided_slice_70/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_69/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_69MatMul2model_baba_1/td_output_1/strided_slice_70:output:07model_baba_1/td_output_1/Cast_69/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_69/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_69AddV2,model_baba_1/td_output_1/MatMul_69:product:06model_baba_1/td_output_1/Add_69/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_71/stackConst*
_output_shapes
:*
dtype0*
valueB:F{
1model_baba_1/td_output_1/strided_slice_71/stack_1Const*
_output_shapes
:*
dtype0*
valueB:G{
1model_baba_1/td_output_1/strided_slice_71/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_71StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_71/stack:output:0:model_baba_1/td_output_1/strided_slice_71/stack_1:output:0:model_baba_1/td_output_1/strided_slice_71/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_70/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_70MatMul2model_baba_1/td_output_1/strided_slice_71:output:07model_baba_1/td_output_1/Cast_70/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_70/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_70AddV2,model_baba_1/td_output_1/MatMul_70:product:06model_baba_1/td_output_1/Add_70/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_72/stackConst*
_output_shapes
:*
dtype0*
valueB:G{
1model_baba_1/td_output_1/strided_slice_72/stack_1Const*
_output_shapes
:*
dtype0*
valueB:H{
1model_baba_1/td_output_1/strided_slice_72/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_72StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_72/stack:output:0:model_baba_1/td_output_1/strided_slice_72/stack_1:output:0:model_baba_1/td_output_1/strided_slice_72/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_71/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_71MatMul2model_baba_1/td_output_1/strided_slice_72:output:07model_baba_1/td_output_1/Cast_71/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_71/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_71AddV2,model_baba_1/td_output_1/MatMul_71:product:06model_baba_1/td_output_1/Add_71/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_73/stackConst*
_output_shapes
:*
dtype0*
valueB:H{
1model_baba_1/td_output_1/strided_slice_73/stack_1Const*
_output_shapes
:*
dtype0*
valueB:I{
1model_baba_1/td_output_1/strided_slice_73/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_73StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_73/stack:output:0:model_baba_1/td_output_1/strided_slice_73/stack_1:output:0:model_baba_1/td_output_1/strided_slice_73/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_72/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_72MatMul2model_baba_1/td_output_1/strided_slice_73:output:07model_baba_1/td_output_1/Cast_72/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_72/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_72AddV2,model_baba_1/td_output_1/MatMul_72:product:06model_baba_1/td_output_1/Add_72/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_74/stackConst*
_output_shapes
:*
dtype0*
valueB:I{
1model_baba_1/td_output_1/strided_slice_74/stack_1Const*
_output_shapes
:*
dtype0*
valueB:J{
1model_baba_1/td_output_1/strided_slice_74/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_74StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_74/stack:output:0:model_baba_1/td_output_1/strided_slice_74/stack_1:output:0:model_baba_1/td_output_1/strided_slice_74/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_73/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_73MatMul2model_baba_1/td_output_1/strided_slice_74:output:07model_baba_1/td_output_1/Cast_73/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_73/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_73AddV2,model_baba_1/td_output_1/MatMul_73:product:06model_baba_1/td_output_1/Add_73/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_75/stackConst*
_output_shapes
:*
dtype0*
valueB:J{
1model_baba_1/td_output_1/strided_slice_75/stack_1Const*
_output_shapes
:*
dtype0*
valueB:K{
1model_baba_1/td_output_1/strided_slice_75/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_75StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_75/stack:output:0:model_baba_1/td_output_1/strided_slice_75/stack_1:output:0:model_baba_1/td_output_1/strided_slice_75/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_74/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_74MatMul2model_baba_1/td_output_1/strided_slice_75:output:07model_baba_1/td_output_1/Cast_74/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_74/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_74AddV2,model_baba_1/td_output_1/MatMul_74:product:06model_baba_1/td_output_1/Add_74/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������y
/model_baba_1/td_output_1/strided_slice_76/stackConst*
_output_shapes
:*
dtype0*
valueB:K{
1model_baba_1/td_output_1/strided_slice_76/stack_1Const*
_output_shapes
:*
dtype0*
valueB:L{
1model_baba_1/td_output_1/strided_slice_76/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)model_baba_1/td_output_1/strided_slice_76StridedSlice&model_baba_1/td_output_1/transpose:y:08model_baba_1/td_output_1/strided_slice_76/stack:output:0:model_baba_1/td_output_1/strided_slice_76/stack_1:output:0:model_baba_1/td_output_1/strided_slice_76/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
/model_baba_1/td_output_1/Cast_75/ReadVariableOpReadVariableOp5model_baba_1_td_output_1_cast_readvariableop_resource*
_output_shapes

:*
dtype0�
"model_baba_1/td_output_1/MatMul_75MatMul2model_baba_1/td_output_1/strided_slice_76:output:07model_baba_1/td_output_1/Cast_75/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model_baba_1/td_output_1/Add_75/ReadVariableOpReadVariableOp4model_baba_1_td_output_1_add_readvariableop_resource*
_output_shapes
:*
dtype0�
model_baba_1/td_output_1/Add_75AddV2,model_baba_1/td_output_1/MatMul_75:product:06model_baba_1/td_output_1/Add_75/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model_baba_1/td_output_1/stackPack model_baba_1/td_output_1/Add:z:0"model_baba_1/td_output_1/Add_1:z:0"model_baba_1/td_output_1/Add_2:z:0"model_baba_1/td_output_1/Add_3:z:0"model_baba_1/td_output_1/Add_4:z:0"model_baba_1/td_output_1/Add_5:z:0"model_baba_1/td_output_1/Add_6:z:0"model_baba_1/td_output_1/Add_7:z:0"model_baba_1/td_output_1/Add_8:z:0"model_baba_1/td_output_1/Add_9:z:0#model_baba_1/td_output_1/Add_10:z:0#model_baba_1/td_output_1/Add_11:z:0#model_baba_1/td_output_1/Add_12:z:0#model_baba_1/td_output_1/Add_13:z:0#model_baba_1/td_output_1/Add_14:z:0#model_baba_1/td_output_1/Add_15:z:0#model_baba_1/td_output_1/Add_16:z:0#model_baba_1/td_output_1/Add_17:z:0#model_baba_1/td_output_1/Add_18:z:0#model_baba_1/td_output_1/Add_19:z:0#model_baba_1/td_output_1/Add_20:z:0#model_baba_1/td_output_1/Add_21:z:0#model_baba_1/td_output_1/Add_22:z:0#model_baba_1/td_output_1/Add_23:z:0#model_baba_1/td_output_1/Add_24:z:0#model_baba_1/td_output_1/Add_25:z:0#model_baba_1/td_output_1/Add_26:z:0#model_baba_1/td_output_1/Add_27:z:0#model_baba_1/td_output_1/Add_28:z:0#model_baba_1/td_output_1/Add_29:z:0#model_baba_1/td_output_1/Add_30:z:0#model_baba_1/td_output_1/Add_31:z:0#model_baba_1/td_output_1/Add_32:z:0#model_baba_1/td_output_1/Add_33:z:0#model_baba_1/td_output_1/Add_34:z:0#model_baba_1/td_output_1/Add_35:z:0#model_baba_1/td_output_1/Add_36:z:0#model_baba_1/td_output_1/Add_37:z:0#model_baba_1/td_output_1/Add_38:z:0#model_baba_1/td_output_1/Add_39:z:0#model_baba_1/td_output_1/Add_40:z:0#model_baba_1/td_output_1/Add_41:z:0#model_baba_1/td_output_1/Add_42:z:0#model_baba_1/td_output_1/Add_43:z:0#model_baba_1/td_output_1/Add_44:z:0#model_baba_1/td_output_1/Add_45:z:0#model_baba_1/td_output_1/Add_46:z:0#model_baba_1/td_output_1/Add_47:z:0#model_baba_1/td_output_1/Add_48:z:0#model_baba_1/td_output_1/Add_49:z:0#model_baba_1/td_output_1/Add_50:z:0#model_baba_1/td_output_1/Add_51:z:0#model_baba_1/td_output_1/Add_52:z:0#model_baba_1/td_output_1/Add_53:z:0#model_baba_1/td_output_1/Add_54:z:0#model_baba_1/td_output_1/Add_55:z:0#model_baba_1/td_output_1/Add_56:z:0#model_baba_1/td_output_1/Add_57:z:0#model_baba_1/td_output_1/Add_58:z:0#model_baba_1/td_output_1/Add_59:z:0#model_baba_1/td_output_1/Add_60:z:0#model_baba_1/td_output_1/Add_61:z:0#model_baba_1/td_output_1/Add_62:z:0#model_baba_1/td_output_1/Add_63:z:0#model_baba_1/td_output_1/Add_64:z:0#model_baba_1/td_output_1/Add_65:z:0#model_baba_1/td_output_1/Add_66:z:0#model_baba_1/td_output_1/Add_67:z:0#model_baba_1/td_output_1/Add_68:z:0#model_baba_1/td_output_1/Add_69:z:0#model_baba_1/td_output_1/Add_70:z:0#model_baba_1/td_output_1/Add_71:z:0#model_baba_1/td_output_1/Add_72:z:0#model_baba_1/td_output_1/Add_73:z:0#model_baba_1/td_output_1/Add_74:z:0#model_baba_1/td_output_1/Add_75:z:0*
NL*
T0*+
_output_shapes
:L���������~
)model_baba_1/td_output_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
$model_baba_1/td_output_1/transpose_1	Transpose'model_baba_1/td_output_1/stack:output:02model_baba_1/td_output_1/transpose_1/perm:output:0*
T0*+
_output_shapes
:���������L{
IdentityIdentity(model_baba_1/td_output_1/transpose_1:y:0^NoOp*
T0*+
_output_shapes
:���������L��
NoOpNoOp0^model_baba_1/attn_norm_1/Reshape/ReadVariableOp2^model_baba_1/attn_norm_1/Reshape_1/ReadVariableOp&^model_baba_1/bn_1/Cast/ReadVariableOp(^model_baba_1/bn_1/Cast_1/ReadVariableOp(^model_baba_1/bn_1/Cast_2/ReadVariableOp(^model_baba_1/bn_1/Cast_3/ReadVariableOp-^model_baba_1/conv1d_1/Reshape/ReadVariableOp>^model_baba_1/conv1d_1/convolution/ExpandDims_1/ReadVariableOp+^model_baba_1/gru1_1/Reshape/ReadVariableOp)^model_baba_1/gru1_1/split/ReadVariableOp+^model_baba_1/gru1_1/split_1/ReadVariableOp,^model_baba_1/gru_2_1/Reshape/ReadVariableOp*^model_baba_1/gru_2_1/split/ReadVariableOp,^model_baba_1/gru_2_1/split_1/ReadVariableOp:^model_baba_1/mha_1/attention_output_1/Cast/ReadVariableOp9^model_baba_1/mha_1/attention_output_1/add/ReadVariableOp-^model_baba_1/mha_1/key_1/Cast/ReadVariableOp,^model_baba_1/mha_1/key_1/add/ReadVariableOp/^model_baba_1/mha_1/query_1/Cast/ReadVariableOp.^model_baba_1/mha_1/query_1/add/ReadVariableOp/^model_baba_1/mha_1/value_1/Cast/ReadVariableOp.^model_baba_1/mha_1/value_1/add/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOpL^model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/ReadVariableOp]^model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp/^model_baba_1/td_dense_1/BiasAdd/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_1/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_10/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_11/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_12/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_13/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_14/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_15/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_16/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_17/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_18/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_19/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_2/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_20/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_21/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_22/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_23/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_24/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_25/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_26/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_27/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_28/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_29/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_3/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_30/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_31/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_32/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_33/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_34/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_35/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_36/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_37/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_38/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_39/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_4/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_40/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_41/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_42/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_43/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_44/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_45/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_46/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_47/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_48/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_49/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_5/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_50/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_51/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_52/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_53/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_54/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_55/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_56/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_57/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_58/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_59/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_6/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_60/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_61/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_62/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_63/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_64/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_65/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_66/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_67/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_68/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_69/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_7/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_70/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_71/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_72/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_73/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_74/ReadVariableOp2^model_baba_1/td_dense_1/BiasAdd_75/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_8/ReadVariableOp1^model_baba_1/td_dense_1/BiasAdd_9/ReadVariableOp,^model_baba_1/td_dense_1/Cast/ReadVariableOp.^model_baba_1/td_dense_1/Cast_1/ReadVariableOp/^model_baba_1/td_dense_1/Cast_10/ReadVariableOp/^model_baba_1/td_dense_1/Cast_11/ReadVariableOp/^model_baba_1/td_dense_1/Cast_12/ReadVariableOp/^model_baba_1/td_dense_1/Cast_13/ReadVariableOp/^model_baba_1/td_dense_1/Cast_14/ReadVariableOp/^model_baba_1/td_dense_1/Cast_15/ReadVariableOp/^model_baba_1/td_dense_1/Cast_16/ReadVariableOp/^model_baba_1/td_dense_1/Cast_17/ReadVariableOp/^model_baba_1/td_dense_1/Cast_18/ReadVariableOp/^model_baba_1/td_dense_1/Cast_19/ReadVariableOp.^model_baba_1/td_dense_1/Cast_2/ReadVariableOp/^model_baba_1/td_dense_1/Cast_20/ReadVariableOp/^model_baba_1/td_dense_1/Cast_21/ReadVariableOp/^model_baba_1/td_dense_1/Cast_22/ReadVariableOp/^model_baba_1/td_dense_1/Cast_23/ReadVariableOp/^model_baba_1/td_dense_1/Cast_24/ReadVariableOp/^model_baba_1/td_dense_1/Cast_25/ReadVariableOp/^model_baba_1/td_dense_1/Cast_26/ReadVariableOp/^model_baba_1/td_dense_1/Cast_27/ReadVariableOp/^model_baba_1/td_dense_1/Cast_28/ReadVariableOp/^model_baba_1/td_dense_1/Cast_29/ReadVariableOp.^model_baba_1/td_dense_1/Cast_3/ReadVariableOp/^model_baba_1/td_dense_1/Cast_30/ReadVariableOp/^model_baba_1/td_dense_1/Cast_31/ReadVariableOp/^model_baba_1/td_dense_1/Cast_32/ReadVariableOp/^model_baba_1/td_dense_1/Cast_33/ReadVariableOp/^model_baba_1/td_dense_1/Cast_34/ReadVariableOp/^model_baba_1/td_dense_1/Cast_35/ReadVariableOp/^model_baba_1/td_dense_1/Cast_36/ReadVariableOp/^model_baba_1/td_dense_1/Cast_37/ReadVariableOp/^model_baba_1/td_dense_1/Cast_38/ReadVariableOp/^model_baba_1/td_dense_1/Cast_39/ReadVariableOp.^model_baba_1/td_dense_1/Cast_4/ReadVariableOp/^model_baba_1/td_dense_1/Cast_40/ReadVariableOp/^model_baba_1/td_dense_1/Cast_41/ReadVariableOp/^model_baba_1/td_dense_1/Cast_42/ReadVariableOp/^model_baba_1/td_dense_1/Cast_43/ReadVariableOp/^model_baba_1/td_dense_1/Cast_44/ReadVariableOp/^model_baba_1/td_dense_1/Cast_45/ReadVariableOp/^model_baba_1/td_dense_1/Cast_46/ReadVariableOp/^model_baba_1/td_dense_1/Cast_47/ReadVariableOp/^model_baba_1/td_dense_1/Cast_48/ReadVariableOp/^model_baba_1/td_dense_1/Cast_49/ReadVariableOp.^model_baba_1/td_dense_1/Cast_5/ReadVariableOp/^model_baba_1/td_dense_1/Cast_50/ReadVariableOp/^model_baba_1/td_dense_1/Cast_51/ReadVariableOp/^model_baba_1/td_dense_1/Cast_52/ReadVariableOp/^model_baba_1/td_dense_1/Cast_53/ReadVariableOp/^model_baba_1/td_dense_1/Cast_54/ReadVariableOp/^model_baba_1/td_dense_1/Cast_55/ReadVariableOp/^model_baba_1/td_dense_1/Cast_56/ReadVariableOp/^model_baba_1/td_dense_1/Cast_57/ReadVariableOp/^model_baba_1/td_dense_1/Cast_58/ReadVariableOp/^model_baba_1/td_dense_1/Cast_59/ReadVariableOp.^model_baba_1/td_dense_1/Cast_6/ReadVariableOp/^model_baba_1/td_dense_1/Cast_60/ReadVariableOp/^model_baba_1/td_dense_1/Cast_61/ReadVariableOp/^model_baba_1/td_dense_1/Cast_62/ReadVariableOp/^model_baba_1/td_dense_1/Cast_63/ReadVariableOp/^model_baba_1/td_dense_1/Cast_64/ReadVariableOp/^model_baba_1/td_dense_1/Cast_65/ReadVariableOp/^model_baba_1/td_dense_1/Cast_66/ReadVariableOp/^model_baba_1/td_dense_1/Cast_67/ReadVariableOp/^model_baba_1/td_dense_1/Cast_68/ReadVariableOp/^model_baba_1/td_dense_1/Cast_69/ReadVariableOp.^model_baba_1/td_dense_1/Cast_7/ReadVariableOp/^model_baba_1/td_dense_1/Cast_70/ReadVariableOp/^model_baba_1/td_dense_1/Cast_71/ReadVariableOp/^model_baba_1/td_dense_1/Cast_72/ReadVariableOp/^model_baba_1/td_dense_1/Cast_73/ReadVariableOp/^model_baba_1/td_dense_1/Cast_74/ReadVariableOp/^model_baba_1/td_dense_1/Cast_75/ReadVariableOp.^model_baba_1/td_dense_1/Cast_8/ReadVariableOp.^model_baba_1/td_dense_1/Cast_9/ReadVariableOp,^model_baba_1/td_output_1/Add/ReadVariableOp.^model_baba_1/td_output_1/Add_1/ReadVariableOp/^model_baba_1/td_output_1/Add_10/ReadVariableOp/^model_baba_1/td_output_1/Add_11/ReadVariableOp/^model_baba_1/td_output_1/Add_12/ReadVariableOp/^model_baba_1/td_output_1/Add_13/ReadVariableOp/^model_baba_1/td_output_1/Add_14/ReadVariableOp/^model_baba_1/td_output_1/Add_15/ReadVariableOp/^model_baba_1/td_output_1/Add_16/ReadVariableOp/^model_baba_1/td_output_1/Add_17/ReadVariableOp/^model_baba_1/td_output_1/Add_18/ReadVariableOp/^model_baba_1/td_output_1/Add_19/ReadVariableOp.^model_baba_1/td_output_1/Add_2/ReadVariableOp/^model_baba_1/td_output_1/Add_20/ReadVariableOp/^model_baba_1/td_output_1/Add_21/ReadVariableOp/^model_baba_1/td_output_1/Add_22/ReadVariableOp/^model_baba_1/td_output_1/Add_23/ReadVariableOp/^model_baba_1/td_output_1/Add_24/ReadVariableOp/^model_baba_1/td_output_1/Add_25/ReadVariableOp/^model_baba_1/td_output_1/Add_26/ReadVariableOp/^model_baba_1/td_output_1/Add_27/ReadVariableOp/^model_baba_1/td_output_1/Add_28/ReadVariableOp/^model_baba_1/td_output_1/Add_29/ReadVariableOp.^model_baba_1/td_output_1/Add_3/ReadVariableOp/^model_baba_1/td_output_1/Add_30/ReadVariableOp/^model_baba_1/td_output_1/Add_31/ReadVariableOp/^model_baba_1/td_output_1/Add_32/ReadVariableOp/^model_baba_1/td_output_1/Add_33/ReadVariableOp/^model_baba_1/td_output_1/Add_34/ReadVariableOp/^model_baba_1/td_output_1/Add_35/ReadVariableOp/^model_baba_1/td_output_1/Add_36/ReadVariableOp/^model_baba_1/td_output_1/Add_37/ReadVariableOp/^model_baba_1/td_output_1/Add_38/ReadVariableOp/^model_baba_1/td_output_1/Add_39/ReadVariableOp.^model_baba_1/td_output_1/Add_4/ReadVariableOp/^model_baba_1/td_output_1/Add_40/ReadVariableOp/^model_baba_1/td_output_1/Add_41/ReadVariableOp/^model_baba_1/td_output_1/Add_42/ReadVariableOp/^model_baba_1/td_output_1/Add_43/ReadVariableOp/^model_baba_1/td_output_1/Add_44/ReadVariableOp/^model_baba_1/td_output_1/Add_45/ReadVariableOp/^model_baba_1/td_output_1/Add_46/ReadVariableOp/^model_baba_1/td_output_1/Add_47/ReadVariableOp/^model_baba_1/td_output_1/Add_48/ReadVariableOp/^model_baba_1/td_output_1/Add_49/ReadVariableOp.^model_baba_1/td_output_1/Add_5/ReadVariableOp/^model_baba_1/td_output_1/Add_50/ReadVariableOp/^model_baba_1/td_output_1/Add_51/ReadVariableOp/^model_baba_1/td_output_1/Add_52/ReadVariableOp/^model_baba_1/td_output_1/Add_53/ReadVariableOp/^model_baba_1/td_output_1/Add_54/ReadVariableOp/^model_baba_1/td_output_1/Add_55/ReadVariableOp/^model_baba_1/td_output_1/Add_56/ReadVariableOp/^model_baba_1/td_output_1/Add_57/ReadVariableOp/^model_baba_1/td_output_1/Add_58/ReadVariableOp/^model_baba_1/td_output_1/Add_59/ReadVariableOp.^model_baba_1/td_output_1/Add_6/ReadVariableOp/^model_baba_1/td_output_1/Add_60/ReadVariableOp/^model_baba_1/td_output_1/Add_61/ReadVariableOp/^model_baba_1/td_output_1/Add_62/ReadVariableOp/^model_baba_1/td_output_1/Add_63/ReadVariableOp/^model_baba_1/td_output_1/Add_64/ReadVariableOp/^model_baba_1/td_output_1/Add_65/ReadVariableOp/^model_baba_1/td_output_1/Add_66/ReadVariableOp/^model_baba_1/td_output_1/Add_67/ReadVariableOp/^model_baba_1/td_output_1/Add_68/ReadVariableOp/^model_baba_1/td_output_1/Add_69/ReadVariableOp.^model_baba_1/td_output_1/Add_7/ReadVariableOp/^model_baba_1/td_output_1/Add_70/ReadVariableOp/^model_baba_1/td_output_1/Add_71/ReadVariableOp/^model_baba_1/td_output_1/Add_72/ReadVariableOp/^model_baba_1/td_output_1/Add_73/ReadVariableOp/^model_baba_1/td_output_1/Add_74/ReadVariableOp/^model_baba_1/td_output_1/Add_75/ReadVariableOp.^model_baba_1/td_output_1/Add_8/ReadVariableOp.^model_baba_1/td_output_1/Add_9/ReadVariableOp-^model_baba_1/td_output_1/Cast/ReadVariableOp/^model_baba_1/td_output_1/Cast_1/ReadVariableOp0^model_baba_1/td_output_1/Cast_10/ReadVariableOp0^model_baba_1/td_output_1/Cast_11/ReadVariableOp0^model_baba_1/td_output_1/Cast_12/ReadVariableOp0^model_baba_1/td_output_1/Cast_13/ReadVariableOp0^model_baba_1/td_output_1/Cast_14/ReadVariableOp0^model_baba_1/td_output_1/Cast_15/ReadVariableOp0^model_baba_1/td_output_1/Cast_16/ReadVariableOp0^model_baba_1/td_output_1/Cast_17/ReadVariableOp0^model_baba_1/td_output_1/Cast_18/ReadVariableOp0^model_baba_1/td_output_1/Cast_19/ReadVariableOp/^model_baba_1/td_output_1/Cast_2/ReadVariableOp0^model_baba_1/td_output_1/Cast_20/ReadVariableOp0^model_baba_1/td_output_1/Cast_21/ReadVariableOp0^model_baba_1/td_output_1/Cast_22/ReadVariableOp0^model_baba_1/td_output_1/Cast_23/ReadVariableOp0^model_baba_1/td_output_1/Cast_24/ReadVariableOp0^model_baba_1/td_output_1/Cast_25/ReadVariableOp0^model_baba_1/td_output_1/Cast_26/ReadVariableOp0^model_baba_1/td_output_1/Cast_27/ReadVariableOp0^model_baba_1/td_output_1/Cast_28/ReadVariableOp0^model_baba_1/td_output_1/Cast_29/ReadVariableOp/^model_baba_1/td_output_1/Cast_3/ReadVariableOp0^model_baba_1/td_output_1/Cast_30/ReadVariableOp0^model_baba_1/td_output_1/Cast_31/ReadVariableOp0^model_baba_1/td_output_1/Cast_32/ReadVariableOp0^model_baba_1/td_output_1/Cast_33/ReadVariableOp0^model_baba_1/td_output_1/Cast_34/ReadVariableOp0^model_baba_1/td_output_1/Cast_35/ReadVariableOp0^model_baba_1/td_output_1/Cast_36/ReadVariableOp0^model_baba_1/td_output_1/Cast_37/ReadVariableOp0^model_baba_1/td_output_1/Cast_38/ReadVariableOp0^model_baba_1/td_output_1/Cast_39/ReadVariableOp/^model_baba_1/td_output_1/Cast_4/ReadVariableOp0^model_baba_1/td_output_1/Cast_40/ReadVariableOp0^model_baba_1/td_output_1/Cast_41/ReadVariableOp0^model_baba_1/td_output_1/Cast_42/ReadVariableOp0^model_baba_1/td_output_1/Cast_43/ReadVariableOp0^model_baba_1/td_output_1/Cast_44/ReadVariableOp0^model_baba_1/td_output_1/Cast_45/ReadVariableOp0^model_baba_1/td_output_1/Cast_46/ReadVariableOp0^model_baba_1/td_output_1/Cast_47/ReadVariableOp0^model_baba_1/td_output_1/Cast_48/ReadVariableOp0^model_baba_1/td_output_1/Cast_49/ReadVariableOp/^model_baba_1/td_output_1/Cast_5/ReadVariableOp0^model_baba_1/td_output_1/Cast_50/ReadVariableOp0^model_baba_1/td_output_1/Cast_51/ReadVariableOp0^model_baba_1/td_output_1/Cast_52/ReadVariableOp0^model_baba_1/td_output_1/Cast_53/ReadVariableOp0^model_baba_1/td_output_1/Cast_54/ReadVariableOp0^model_baba_1/td_output_1/Cast_55/ReadVariableOp0^model_baba_1/td_output_1/Cast_56/ReadVariableOp0^model_baba_1/td_output_1/Cast_57/ReadVariableOp0^model_baba_1/td_output_1/Cast_58/ReadVariableOp0^model_baba_1/td_output_1/Cast_59/ReadVariableOp/^model_baba_1/td_output_1/Cast_6/ReadVariableOp0^model_baba_1/td_output_1/Cast_60/ReadVariableOp0^model_baba_1/td_output_1/Cast_61/ReadVariableOp0^model_baba_1/td_output_1/Cast_62/ReadVariableOp0^model_baba_1/td_output_1/Cast_63/ReadVariableOp0^model_baba_1/td_output_1/Cast_64/ReadVariableOp0^model_baba_1/td_output_1/Cast_65/ReadVariableOp0^model_baba_1/td_output_1/Cast_66/ReadVariableOp0^model_baba_1/td_output_1/Cast_67/ReadVariableOp0^model_baba_1/td_output_1/Cast_68/ReadVariableOp0^model_baba_1/td_output_1/Cast_69/ReadVariableOp/^model_baba_1/td_output_1/Cast_7/ReadVariableOp0^model_baba_1/td_output_1/Cast_70/ReadVariableOp0^model_baba_1/td_output_1/Cast_71/ReadVariableOp0^model_baba_1/td_output_1/Cast_72/ReadVariableOp0^model_baba_1/td_output_1/Cast_73/ReadVariableOp0^model_baba_1/td_output_1/Cast_74/ReadVariableOp0^model_baba_1/td_output_1/Cast_75/ReadVariableOp/^model_baba_1/td_output_1/Cast_8/ReadVariableOp/^model_baba_1/td_output_1/Cast_9/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapesu
s:���������L+: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2b
/model_baba_1/attn_norm_1/Reshape/ReadVariableOp/model_baba_1/attn_norm_1/Reshape/ReadVariableOp2f
1model_baba_1/attn_norm_1/Reshape_1/ReadVariableOp1model_baba_1/attn_norm_1/Reshape_1/ReadVariableOp2N
%model_baba_1/bn_1/Cast/ReadVariableOp%model_baba_1/bn_1/Cast/ReadVariableOp2R
'model_baba_1/bn_1/Cast_1/ReadVariableOp'model_baba_1/bn_1/Cast_1/ReadVariableOp2R
'model_baba_1/bn_1/Cast_2/ReadVariableOp'model_baba_1/bn_1/Cast_2/ReadVariableOp2R
'model_baba_1/bn_1/Cast_3/ReadVariableOp'model_baba_1/bn_1/Cast_3/ReadVariableOp2\
,model_baba_1/conv1d_1/Reshape/ReadVariableOp,model_baba_1/conv1d_1/Reshape/ReadVariableOp2~
=model_baba_1/conv1d_1/convolution/ExpandDims_1/ReadVariableOp=model_baba_1/conv1d_1/convolution/ExpandDims_1/ReadVariableOp2X
*model_baba_1/gru1_1/Reshape/ReadVariableOp*model_baba_1/gru1_1/Reshape/ReadVariableOp2T
(model_baba_1/gru1_1/split/ReadVariableOp(model_baba_1/gru1_1/split/ReadVariableOp2X
*model_baba_1/gru1_1/split_1/ReadVariableOp*model_baba_1/gru1_1/split_1/ReadVariableOp2Z
+model_baba_1/gru_2_1/Reshape/ReadVariableOp+model_baba_1/gru_2_1/Reshape/ReadVariableOp2V
)model_baba_1/gru_2_1/split/ReadVariableOp)model_baba_1/gru_2_1/split/ReadVariableOp2Z
+model_baba_1/gru_2_1/split_1/ReadVariableOp+model_baba_1/gru_2_1/split_1/ReadVariableOp2v
9model_baba_1/mha_1/attention_output_1/Cast/ReadVariableOp9model_baba_1/mha_1/attention_output_1/Cast/ReadVariableOp2t
8model_baba_1/mha_1/attention_output_1/add/ReadVariableOp8model_baba_1/mha_1/attention_output_1/add/ReadVariableOp2\
,model_baba_1/mha_1/key_1/Cast/ReadVariableOp,model_baba_1/mha_1/key_1/Cast/ReadVariableOp2Z
+model_baba_1/mha_1/key_1/add/ReadVariableOp+model_baba_1/mha_1/key_1/add/ReadVariableOp2`
.model_baba_1/mha_1/query_1/Cast/ReadVariableOp.model_baba_1/mha_1/query_1/Cast/ReadVariableOp2^
-model_baba_1/mha_1/query_1/add/ReadVariableOp-model_baba_1/mha_1/query_1/add/ReadVariableOp2`
.model_baba_1/mha_1/value_1/Cast/ReadVariableOp.model_baba_1/mha_1/value_1/Cast/ReadVariableOp2^
-model_baba_1/mha_1/value_1/add/ReadVariableOp-model_baba_1/mha_1/value_1/add/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_0_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_1_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_2_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_3_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_0_1/convolution/ExpandDims_1/ReadVariableOp2�
Kmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/ReadVariableOpKmodel_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/Reshape/ReadVariableOp2�
\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp\model_baba_1/tcn_cnn_1/residual_block_4_1/conv1D_1_1/convolution/ExpandDims_1/ReadVariableOp2`
.model_baba_1/td_dense_1/BiasAdd/ReadVariableOp.model_baba_1/td_dense_1/BiasAdd/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_1/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_1/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_10/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_10/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_11/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_11/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_12/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_12/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_13/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_13/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_14/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_14/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_15/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_15/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_16/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_16/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_17/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_17/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_18/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_18/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_19/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_19/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_2/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_2/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_20/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_20/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_21/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_21/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_22/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_22/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_23/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_23/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_24/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_24/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_25/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_25/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_26/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_26/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_27/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_27/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_28/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_28/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_29/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_29/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_3/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_3/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_30/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_30/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_31/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_31/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_32/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_32/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_33/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_33/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_34/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_34/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_35/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_35/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_36/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_36/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_37/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_37/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_38/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_38/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_39/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_39/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_4/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_4/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_40/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_40/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_41/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_41/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_42/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_42/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_43/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_43/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_44/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_44/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_45/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_45/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_46/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_46/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_47/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_47/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_48/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_48/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_49/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_49/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_5/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_5/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_50/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_50/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_51/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_51/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_52/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_52/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_53/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_53/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_54/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_54/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_55/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_55/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_56/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_56/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_57/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_57/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_58/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_58/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_59/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_59/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_6/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_6/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_60/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_60/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_61/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_61/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_62/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_62/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_63/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_63/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_64/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_64/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_65/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_65/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_66/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_66/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_67/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_67/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_68/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_68/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_69/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_69/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_7/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_7/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_70/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_70/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_71/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_71/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_72/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_72/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_73/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_73/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_74/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_74/ReadVariableOp2f
1model_baba_1/td_dense_1/BiasAdd_75/ReadVariableOp1model_baba_1/td_dense_1/BiasAdd_75/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_8/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_8/ReadVariableOp2d
0model_baba_1/td_dense_1/BiasAdd_9/ReadVariableOp0model_baba_1/td_dense_1/BiasAdd_9/ReadVariableOp2Z
+model_baba_1/td_dense_1/Cast/ReadVariableOp+model_baba_1/td_dense_1/Cast/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_1/ReadVariableOp-model_baba_1/td_dense_1/Cast_1/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_10/ReadVariableOp.model_baba_1/td_dense_1/Cast_10/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_11/ReadVariableOp.model_baba_1/td_dense_1/Cast_11/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_12/ReadVariableOp.model_baba_1/td_dense_1/Cast_12/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_13/ReadVariableOp.model_baba_1/td_dense_1/Cast_13/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_14/ReadVariableOp.model_baba_1/td_dense_1/Cast_14/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_15/ReadVariableOp.model_baba_1/td_dense_1/Cast_15/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_16/ReadVariableOp.model_baba_1/td_dense_1/Cast_16/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_17/ReadVariableOp.model_baba_1/td_dense_1/Cast_17/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_18/ReadVariableOp.model_baba_1/td_dense_1/Cast_18/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_19/ReadVariableOp.model_baba_1/td_dense_1/Cast_19/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_2/ReadVariableOp-model_baba_1/td_dense_1/Cast_2/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_20/ReadVariableOp.model_baba_1/td_dense_1/Cast_20/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_21/ReadVariableOp.model_baba_1/td_dense_1/Cast_21/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_22/ReadVariableOp.model_baba_1/td_dense_1/Cast_22/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_23/ReadVariableOp.model_baba_1/td_dense_1/Cast_23/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_24/ReadVariableOp.model_baba_1/td_dense_1/Cast_24/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_25/ReadVariableOp.model_baba_1/td_dense_1/Cast_25/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_26/ReadVariableOp.model_baba_1/td_dense_1/Cast_26/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_27/ReadVariableOp.model_baba_1/td_dense_1/Cast_27/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_28/ReadVariableOp.model_baba_1/td_dense_1/Cast_28/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_29/ReadVariableOp.model_baba_1/td_dense_1/Cast_29/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_3/ReadVariableOp-model_baba_1/td_dense_1/Cast_3/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_30/ReadVariableOp.model_baba_1/td_dense_1/Cast_30/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_31/ReadVariableOp.model_baba_1/td_dense_1/Cast_31/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_32/ReadVariableOp.model_baba_1/td_dense_1/Cast_32/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_33/ReadVariableOp.model_baba_1/td_dense_1/Cast_33/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_34/ReadVariableOp.model_baba_1/td_dense_1/Cast_34/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_35/ReadVariableOp.model_baba_1/td_dense_1/Cast_35/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_36/ReadVariableOp.model_baba_1/td_dense_1/Cast_36/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_37/ReadVariableOp.model_baba_1/td_dense_1/Cast_37/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_38/ReadVariableOp.model_baba_1/td_dense_1/Cast_38/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_39/ReadVariableOp.model_baba_1/td_dense_1/Cast_39/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_4/ReadVariableOp-model_baba_1/td_dense_1/Cast_4/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_40/ReadVariableOp.model_baba_1/td_dense_1/Cast_40/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_41/ReadVariableOp.model_baba_1/td_dense_1/Cast_41/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_42/ReadVariableOp.model_baba_1/td_dense_1/Cast_42/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_43/ReadVariableOp.model_baba_1/td_dense_1/Cast_43/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_44/ReadVariableOp.model_baba_1/td_dense_1/Cast_44/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_45/ReadVariableOp.model_baba_1/td_dense_1/Cast_45/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_46/ReadVariableOp.model_baba_1/td_dense_1/Cast_46/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_47/ReadVariableOp.model_baba_1/td_dense_1/Cast_47/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_48/ReadVariableOp.model_baba_1/td_dense_1/Cast_48/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_49/ReadVariableOp.model_baba_1/td_dense_1/Cast_49/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_5/ReadVariableOp-model_baba_1/td_dense_1/Cast_5/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_50/ReadVariableOp.model_baba_1/td_dense_1/Cast_50/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_51/ReadVariableOp.model_baba_1/td_dense_1/Cast_51/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_52/ReadVariableOp.model_baba_1/td_dense_1/Cast_52/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_53/ReadVariableOp.model_baba_1/td_dense_1/Cast_53/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_54/ReadVariableOp.model_baba_1/td_dense_1/Cast_54/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_55/ReadVariableOp.model_baba_1/td_dense_1/Cast_55/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_56/ReadVariableOp.model_baba_1/td_dense_1/Cast_56/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_57/ReadVariableOp.model_baba_1/td_dense_1/Cast_57/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_58/ReadVariableOp.model_baba_1/td_dense_1/Cast_58/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_59/ReadVariableOp.model_baba_1/td_dense_1/Cast_59/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_6/ReadVariableOp-model_baba_1/td_dense_1/Cast_6/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_60/ReadVariableOp.model_baba_1/td_dense_1/Cast_60/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_61/ReadVariableOp.model_baba_1/td_dense_1/Cast_61/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_62/ReadVariableOp.model_baba_1/td_dense_1/Cast_62/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_63/ReadVariableOp.model_baba_1/td_dense_1/Cast_63/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_64/ReadVariableOp.model_baba_1/td_dense_1/Cast_64/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_65/ReadVariableOp.model_baba_1/td_dense_1/Cast_65/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_66/ReadVariableOp.model_baba_1/td_dense_1/Cast_66/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_67/ReadVariableOp.model_baba_1/td_dense_1/Cast_67/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_68/ReadVariableOp.model_baba_1/td_dense_1/Cast_68/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_69/ReadVariableOp.model_baba_1/td_dense_1/Cast_69/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_7/ReadVariableOp-model_baba_1/td_dense_1/Cast_7/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_70/ReadVariableOp.model_baba_1/td_dense_1/Cast_70/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_71/ReadVariableOp.model_baba_1/td_dense_1/Cast_71/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_72/ReadVariableOp.model_baba_1/td_dense_1/Cast_72/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_73/ReadVariableOp.model_baba_1/td_dense_1/Cast_73/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_74/ReadVariableOp.model_baba_1/td_dense_1/Cast_74/ReadVariableOp2`
.model_baba_1/td_dense_1/Cast_75/ReadVariableOp.model_baba_1/td_dense_1/Cast_75/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_8/ReadVariableOp-model_baba_1/td_dense_1/Cast_8/ReadVariableOp2^
-model_baba_1/td_dense_1/Cast_9/ReadVariableOp-model_baba_1/td_dense_1/Cast_9/ReadVariableOp2Z
+model_baba_1/td_output_1/Add/ReadVariableOp+model_baba_1/td_output_1/Add/ReadVariableOp2^
-model_baba_1/td_output_1/Add_1/ReadVariableOp-model_baba_1/td_output_1/Add_1/ReadVariableOp2`
.model_baba_1/td_output_1/Add_10/ReadVariableOp.model_baba_1/td_output_1/Add_10/ReadVariableOp2`
.model_baba_1/td_output_1/Add_11/ReadVariableOp.model_baba_1/td_output_1/Add_11/ReadVariableOp2`
.model_baba_1/td_output_1/Add_12/ReadVariableOp.model_baba_1/td_output_1/Add_12/ReadVariableOp2`
.model_baba_1/td_output_1/Add_13/ReadVariableOp.model_baba_1/td_output_1/Add_13/ReadVariableOp2`
.model_baba_1/td_output_1/Add_14/ReadVariableOp.model_baba_1/td_output_1/Add_14/ReadVariableOp2`
.model_baba_1/td_output_1/Add_15/ReadVariableOp.model_baba_1/td_output_1/Add_15/ReadVariableOp2`
.model_baba_1/td_output_1/Add_16/ReadVariableOp.model_baba_1/td_output_1/Add_16/ReadVariableOp2`
.model_baba_1/td_output_1/Add_17/ReadVariableOp.model_baba_1/td_output_1/Add_17/ReadVariableOp2`
.model_baba_1/td_output_1/Add_18/ReadVariableOp.model_baba_1/td_output_1/Add_18/ReadVariableOp2`
.model_baba_1/td_output_1/Add_19/ReadVariableOp.model_baba_1/td_output_1/Add_19/ReadVariableOp2^
-model_baba_1/td_output_1/Add_2/ReadVariableOp-model_baba_1/td_output_1/Add_2/ReadVariableOp2`
.model_baba_1/td_output_1/Add_20/ReadVariableOp.model_baba_1/td_output_1/Add_20/ReadVariableOp2`
.model_baba_1/td_output_1/Add_21/ReadVariableOp.model_baba_1/td_output_1/Add_21/ReadVariableOp2`
.model_baba_1/td_output_1/Add_22/ReadVariableOp.model_baba_1/td_output_1/Add_22/ReadVariableOp2`
.model_baba_1/td_output_1/Add_23/ReadVariableOp.model_baba_1/td_output_1/Add_23/ReadVariableOp2`
.model_baba_1/td_output_1/Add_24/ReadVariableOp.model_baba_1/td_output_1/Add_24/ReadVariableOp2`
.model_baba_1/td_output_1/Add_25/ReadVariableOp.model_baba_1/td_output_1/Add_25/ReadVariableOp2`
.model_baba_1/td_output_1/Add_26/ReadVariableOp.model_baba_1/td_output_1/Add_26/ReadVariableOp2`
.model_baba_1/td_output_1/Add_27/ReadVariableOp.model_baba_1/td_output_1/Add_27/ReadVariableOp2`
.model_baba_1/td_output_1/Add_28/ReadVariableOp.model_baba_1/td_output_1/Add_28/ReadVariableOp2`
.model_baba_1/td_output_1/Add_29/ReadVariableOp.model_baba_1/td_output_1/Add_29/ReadVariableOp2^
-model_baba_1/td_output_1/Add_3/ReadVariableOp-model_baba_1/td_output_1/Add_3/ReadVariableOp2`
.model_baba_1/td_output_1/Add_30/ReadVariableOp.model_baba_1/td_output_1/Add_30/ReadVariableOp2`
.model_baba_1/td_output_1/Add_31/ReadVariableOp.model_baba_1/td_output_1/Add_31/ReadVariableOp2`
.model_baba_1/td_output_1/Add_32/ReadVariableOp.model_baba_1/td_output_1/Add_32/ReadVariableOp2`
.model_baba_1/td_output_1/Add_33/ReadVariableOp.model_baba_1/td_output_1/Add_33/ReadVariableOp2`
.model_baba_1/td_output_1/Add_34/ReadVariableOp.model_baba_1/td_output_1/Add_34/ReadVariableOp2`
.model_baba_1/td_output_1/Add_35/ReadVariableOp.model_baba_1/td_output_1/Add_35/ReadVariableOp2`
.model_baba_1/td_output_1/Add_36/ReadVariableOp.model_baba_1/td_output_1/Add_36/ReadVariableOp2`
.model_baba_1/td_output_1/Add_37/ReadVariableOp.model_baba_1/td_output_1/Add_37/ReadVariableOp2`
.model_baba_1/td_output_1/Add_38/ReadVariableOp.model_baba_1/td_output_1/Add_38/ReadVariableOp2`
.model_baba_1/td_output_1/Add_39/ReadVariableOp.model_baba_1/td_output_1/Add_39/ReadVariableOp2^
-model_baba_1/td_output_1/Add_4/ReadVariableOp-model_baba_1/td_output_1/Add_4/ReadVariableOp2`
.model_baba_1/td_output_1/Add_40/ReadVariableOp.model_baba_1/td_output_1/Add_40/ReadVariableOp2`
.model_baba_1/td_output_1/Add_41/ReadVariableOp.model_baba_1/td_output_1/Add_41/ReadVariableOp2`
.model_baba_1/td_output_1/Add_42/ReadVariableOp.model_baba_1/td_output_1/Add_42/ReadVariableOp2`
.model_baba_1/td_output_1/Add_43/ReadVariableOp.model_baba_1/td_output_1/Add_43/ReadVariableOp2`
.model_baba_1/td_output_1/Add_44/ReadVariableOp.model_baba_1/td_output_1/Add_44/ReadVariableOp2`
.model_baba_1/td_output_1/Add_45/ReadVariableOp.model_baba_1/td_output_1/Add_45/ReadVariableOp2`
.model_baba_1/td_output_1/Add_46/ReadVariableOp.model_baba_1/td_output_1/Add_46/ReadVariableOp2`
.model_baba_1/td_output_1/Add_47/ReadVariableOp.model_baba_1/td_output_1/Add_47/ReadVariableOp2`
.model_baba_1/td_output_1/Add_48/ReadVariableOp.model_baba_1/td_output_1/Add_48/ReadVariableOp2`
.model_baba_1/td_output_1/Add_49/ReadVariableOp.model_baba_1/td_output_1/Add_49/ReadVariableOp2^
-model_baba_1/td_output_1/Add_5/ReadVariableOp-model_baba_1/td_output_1/Add_5/ReadVariableOp2`
.model_baba_1/td_output_1/Add_50/ReadVariableOp.model_baba_1/td_output_1/Add_50/ReadVariableOp2`
.model_baba_1/td_output_1/Add_51/ReadVariableOp.model_baba_1/td_output_1/Add_51/ReadVariableOp2`
.model_baba_1/td_output_1/Add_52/ReadVariableOp.model_baba_1/td_output_1/Add_52/ReadVariableOp2`
.model_baba_1/td_output_1/Add_53/ReadVariableOp.model_baba_1/td_output_1/Add_53/ReadVariableOp2`
.model_baba_1/td_output_1/Add_54/ReadVariableOp.model_baba_1/td_output_1/Add_54/ReadVariableOp2`
.model_baba_1/td_output_1/Add_55/ReadVariableOp.model_baba_1/td_output_1/Add_55/ReadVariableOp2`
.model_baba_1/td_output_1/Add_56/ReadVariableOp.model_baba_1/td_output_1/Add_56/ReadVariableOp2`
.model_baba_1/td_output_1/Add_57/ReadVariableOp.model_baba_1/td_output_1/Add_57/ReadVariableOp2`
.model_baba_1/td_output_1/Add_58/ReadVariableOp.model_baba_1/td_output_1/Add_58/ReadVariableOp2`
.model_baba_1/td_output_1/Add_59/ReadVariableOp.model_baba_1/td_output_1/Add_59/ReadVariableOp2^
-model_baba_1/td_output_1/Add_6/ReadVariableOp-model_baba_1/td_output_1/Add_6/ReadVariableOp2`
.model_baba_1/td_output_1/Add_60/ReadVariableOp.model_baba_1/td_output_1/Add_60/ReadVariableOp2`
.model_baba_1/td_output_1/Add_61/ReadVariableOp.model_baba_1/td_output_1/Add_61/ReadVariableOp2`
.model_baba_1/td_output_1/Add_62/ReadVariableOp.model_baba_1/td_output_1/Add_62/ReadVariableOp2`
.model_baba_1/td_output_1/Add_63/ReadVariableOp.model_baba_1/td_output_1/Add_63/ReadVariableOp2`
.model_baba_1/td_output_1/Add_64/ReadVariableOp.model_baba_1/td_output_1/Add_64/ReadVariableOp2`
.model_baba_1/td_output_1/Add_65/ReadVariableOp.model_baba_1/td_output_1/Add_65/ReadVariableOp2`
.model_baba_1/td_output_1/Add_66/ReadVariableOp.model_baba_1/td_output_1/Add_66/ReadVariableOp2`
.model_baba_1/td_output_1/Add_67/ReadVariableOp.model_baba_1/td_output_1/Add_67/ReadVariableOp2`
.model_baba_1/td_output_1/Add_68/ReadVariableOp.model_baba_1/td_output_1/Add_68/ReadVariableOp2`
.model_baba_1/td_output_1/Add_69/ReadVariableOp.model_baba_1/td_output_1/Add_69/ReadVariableOp2^
-model_baba_1/td_output_1/Add_7/ReadVariableOp-model_baba_1/td_output_1/Add_7/ReadVariableOp2`
.model_baba_1/td_output_1/Add_70/ReadVariableOp.model_baba_1/td_output_1/Add_70/ReadVariableOp2`
.model_baba_1/td_output_1/Add_71/ReadVariableOp.model_baba_1/td_output_1/Add_71/ReadVariableOp2`
.model_baba_1/td_output_1/Add_72/ReadVariableOp.model_baba_1/td_output_1/Add_72/ReadVariableOp2`
.model_baba_1/td_output_1/Add_73/ReadVariableOp.model_baba_1/td_output_1/Add_73/ReadVariableOp2`
.model_baba_1/td_output_1/Add_74/ReadVariableOp.model_baba_1/td_output_1/Add_74/ReadVariableOp2`
.model_baba_1/td_output_1/Add_75/ReadVariableOp.model_baba_1/td_output_1/Add_75/ReadVariableOp2^
-model_baba_1/td_output_1/Add_8/ReadVariableOp-model_baba_1/td_output_1/Add_8/ReadVariableOp2^
-model_baba_1/td_output_1/Add_9/ReadVariableOp-model_baba_1/td_output_1/Add_9/ReadVariableOp2\
,model_baba_1/td_output_1/Cast/ReadVariableOp,model_baba_1/td_output_1/Cast/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_1/ReadVariableOp.model_baba_1/td_output_1/Cast_1/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_10/ReadVariableOp/model_baba_1/td_output_1/Cast_10/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_11/ReadVariableOp/model_baba_1/td_output_1/Cast_11/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_12/ReadVariableOp/model_baba_1/td_output_1/Cast_12/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_13/ReadVariableOp/model_baba_1/td_output_1/Cast_13/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_14/ReadVariableOp/model_baba_1/td_output_1/Cast_14/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_15/ReadVariableOp/model_baba_1/td_output_1/Cast_15/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_16/ReadVariableOp/model_baba_1/td_output_1/Cast_16/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_17/ReadVariableOp/model_baba_1/td_output_1/Cast_17/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_18/ReadVariableOp/model_baba_1/td_output_1/Cast_18/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_19/ReadVariableOp/model_baba_1/td_output_1/Cast_19/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_2/ReadVariableOp.model_baba_1/td_output_1/Cast_2/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_20/ReadVariableOp/model_baba_1/td_output_1/Cast_20/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_21/ReadVariableOp/model_baba_1/td_output_1/Cast_21/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_22/ReadVariableOp/model_baba_1/td_output_1/Cast_22/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_23/ReadVariableOp/model_baba_1/td_output_1/Cast_23/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_24/ReadVariableOp/model_baba_1/td_output_1/Cast_24/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_25/ReadVariableOp/model_baba_1/td_output_1/Cast_25/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_26/ReadVariableOp/model_baba_1/td_output_1/Cast_26/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_27/ReadVariableOp/model_baba_1/td_output_1/Cast_27/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_28/ReadVariableOp/model_baba_1/td_output_1/Cast_28/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_29/ReadVariableOp/model_baba_1/td_output_1/Cast_29/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_3/ReadVariableOp.model_baba_1/td_output_1/Cast_3/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_30/ReadVariableOp/model_baba_1/td_output_1/Cast_30/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_31/ReadVariableOp/model_baba_1/td_output_1/Cast_31/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_32/ReadVariableOp/model_baba_1/td_output_1/Cast_32/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_33/ReadVariableOp/model_baba_1/td_output_1/Cast_33/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_34/ReadVariableOp/model_baba_1/td_output_1/Cast_34/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_35/ReadVariableOp/model_baba_1/td_output_1/Cast_35/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_36/ReadVariableOp/model_baba_1/td_output_1/Cast_36/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_37/ReadVariableOp/model_baba_1/td_output_1/Cast_37/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_38/ReadVariableOp/model_baba_1/td_output_1/Cast_38/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_39/ReadVariableOp/model_baba_1/td_output_1/Cast_39/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_4/ReadVariableOp.model_baba_1/td_output_1/Cast_4/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_40/ReadVariableOp/model_baba_1/td_output_1/Cast_40/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_41/ReadVariableOp/model_baba_1/td_output_1/Cast_41/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_42/ReadVariableOp/model_baba_1/td_output_1/Cast_42/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_43/ReadVariableOp/model_baba_1/td_output_1/Cast_43/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_44/ReadVariableOp/model_baba_1/td_output_1/Cast_44/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_45/ReadVariableOp/model_baba_1/td_output_1/Cast_45/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_46/ReadVariableOp/model_baba_1/td_output_1/Cast_46/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_47/ReadVariableOp/model_baba_1/td_output_1/Cast_47/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_48/ReadVariableOp/model_baba_1/td_output_1/Cast_48/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_49/ReadVariableOp/model_baba_1/td_output_1/Cast_49/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_5/ReadVariableOp.model_baba_1/td_output_1/Cast_5/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_50/ReadVariableOp/model_baba_1/td_output_1/Cast_50/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_51/ReadVariableOp/model_baba_1/td_output_1/Cast_51/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_52/ReadVariableOp/model_baba_1/td_output_1/Cast_52/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_53/ReadVariableOp/model_baba_1/td_output_1/Cast_53/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_54/ReadVariableOp/model_baba_1/td_output_1/Cast_54/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_55/ReadVariableOp/model_baba_1/td_output_1/Cast_55/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_56/ReadVariableOp/model_baba_1/td_output_1/Cast_56/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_57/ReadVariableOp/model_baba_1/td_output_1/Cast_57/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_58/ReadVariableOp/model_baba_1/td_output_1/Cast_58/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_59/ReadVariableOp/model_baba_1/td_output_1/Cast_59/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_6/ReadVariableOp.model_baba_1/td_output_1/Cast_6/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_60/ReadVariableOp/model_baba_1/td_output_1/Cast_60/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_61/ReadVariableOp/model_baba_1/td_output_1/Cast_61/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_62/ReadVariableOp/model_baba_1/td_output_1/Cast_62/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_63/ReadVariableOp/model_baba_1/td_output_1/Cast_63/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_64/ReadVariableOp/model_baba_1/td_output_1/Cast_64/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_65/ReadVariableOp/model_baba_1/td_output_1/Cast_65/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_66/ReadVariableOp/model_baba_1/td_output_1/Cast_66/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_67/ReadVariableOp/model_baba_1/td_output_1/Cast_67/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_68/ReadVariableOp/model_baba_1/td_output_1/Cast_68/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_69/ReadVariableOp/model_baba_1/td_output_1/Cast_69/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_7/ReadVariableOp.model_baba_1/td_output_1/Cast_7/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_70/ReadVariableOp/model_baba_1/td_output_1/Cast_70/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_71/ReadVariableOp/model_baba_1/td_output_1/Cast_71/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_72/ReadVariableOp/model_baba_1/td_output_1/Cast_72/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_73/ReadVariableOp/model_baba_1/td_output_1/Cast_73/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_74/ReadVariableOp/model_baba_1/td_output_1/Cast_74/ReadVariableOp2b
/model_baba_1/td_output_1/Cast_75/ReadVariableOp/model_baba_1/td_output_1/Cast_75/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_8/ReadVariableOp.model_baba_1/td_output_1/Cast_8/ReadVariableOp2`
.model_baba_1/td_output_1/Cast_9/ReadVariableOp.model_baba_1/td_output_1/Cast_9/ReadVariableOp:(.$
"
_user_specified_name
resource:(-$
"
_user_specified_name
resource:(,$
"
_user_specified_name
resource:(+$
"
_user_specified_name
resource:(*$
"
_user_specified_name
resource:()$
"
_user_specified_name
resource:(($
"
_user_specified_name
resource:('$
"
_user_specified_name
resource:(&$
"
_user_specified_name
resource:(%$
"
_user_specified_name
resource:($$
"
_user_specified_name
resource:(#$
"
_user_specified_name
resource:("$
"
_user_specified_name
resource:(!$
"
_user_specified_name
resource:( $
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:(
$
"
_user_specified_name
resource:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:[ W
+
_output_shapes
:���������L+
(
_user_specified_nameinput_sequence"�L
saver_filename:0StatefulPartitionedCall_2:0StatefulPartitionedCall_38"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serve�
C
input_sequence1
serve_input_sequence:0���������L+@
output_04
StatefulPartitionedCall:0���������Ltensorflow/serving/predict*�
serving_default�
M
input_sequence;
 serving_default_input_sequence:0���������L+B
output_06
StatefulPartitionedCall_1:0���������Ltensorflow/serving/predict:�M
�
	variables
trainable_variables
non_trainable_variables
_all_variables
_misc_assets
	serve

signatures"
_generic_user_object
�
0
	1

2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
 24
!25
"26
#27
$28
%29
&30
'31
(32
)33
*34
+35
,36
-37
.38
/39
040
141
242
343
444
545
646
747
848
949
:50
;51
<52
=53
>54
?55
@56
A57
B58
C59
D60"
trackable_list_wrapper
�
0
	1

2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
 17
"18
#19
%20
&21
(22
)23
-24
.25
/26
227
328
429
730
831
932
:33
;34
<35
=36
>37
?38
@39
A40
B41
C42
D43"
trackable_list_wrapper
�
0
1
2
3
4
5
6
!7
$8
'9
*10
+11
,12
013
114
515
616"
trackable_list_wrapper
�
E0
F1
G2
H3
I4
J5
K6
L7
M8
N9
O10
P11
Q12
R13
S14
T15
U16
V17
W18
X19
Y20
Z21
[22
\23
]24
^25
_26
`27
a28
b29
c30
d31
e32
f33
g34
h35
i36
j37
k38
l39
m40
n41
o42
p43
q44
r45"
trackable_list_wrapper
 "
trackable_list_wrapper
�
strace_02�
__inference___call___4936�
���
FullArgSpec
args�

jargs_0
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *1�.
,�)
input_sequence���������L+zstrace_0
7
	tserve
userving_default"
signature_map
#:!+@2conv1d/kernel
:@2conv1d/bias
X:V@@2Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel
N:L@2@tcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias
k:i	2_tcn_cnn/residual_block_0/residual_block_0/act_and_dropout_0/seed_generator/seed_generator_state
X:V@@2Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel
N:L@2@tcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias
m:k	2atcn_cnn/residual_block_0/residual_block_0/act_and_dropout_1/seed_generator_1/seed_generator_state
X:V@@2Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel
N:L@2@tcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias
m:k	2atcn_cnn/residual_block_1/residual_block_1/act_and_dropout_0/seed_generator_2/seed_generator_state
X:V@@2Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel
N:L@2@tcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias
m:k	2atcn_cnn/residual_block_1/residual_block_1/act_and_dropout_1/seed_generator_3/seed_generator_state
X:V@@2Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel
N:L@2@tcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias
m:k	2atcn_cnn/residual_block_2/residual_block_2/act_and_dropout_0/seed_generator_4/seed_generator_state
X:V@@2Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel
N:L@2@tcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias
m:k	2atcn_cnn/residual_block_2/residual_block_2/act_and_dropout_1/seed_generator_5/seed_generator_state
X:V@@2Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel
N:L@2@tcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias
m:k	2atcn_cnn/residual_block_3/residual_block_3/act_and_dropout_0/seed_generator_6/seed_generator_state
X:V@@2Btcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel
N:L@2@tcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias
m:k	2atcn_cnn/residual_block_3/residual_block_3/act_and_dropout_1/seed_generator_7/seed_generator_state
X:V@@2Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel
N:L@2@tcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias
m:k	2atcn_cnn/residual_block_4/residual_block_4/act_and_dropout_0/seed_generator_8/seed_generator_state
X:V@@2Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel
N:L@2@tcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias
m:k	2atcn_cnn/residual_block_4/residual_block_4/act_and_dropout_1/seed_generator_9/seed_generator_state
:@2bn/gamma
:@2bn/beta
:@2bn/moving_mean
:@2bn/moving_variance
2:0	2&seed_generator_10/seed_generator_state
':%	@�2gru1/gru_cell/kernel
1:/	@�2gru1/gru_cell/recurrent_kernel
%:#	�2gru1/gru_cell/bias
2:0	2&seed_generator_11/seed_generator_state
2:0	2&seed_generator_12/seed_generator_state
':%@02gru_2/gru_cell/kernel
1:/02gru_2/gru_cell/recurrent_kernel
%:#02gru_2/gru_cell/bias
2:0	2&seed_generator_13/seed_generator_state
2:0	2&seed_generator_14/seed_generator_state
&:$ 2mha/query/kernel
 : 2mha/query/bias
$:" 2mha/key/kernel
: 2mha/key/bias
&:$ 2mha/value/kernel
 : 2mha/value/bias
1:/ 2mha/attention_output/kernel
':%2mha/attention_output/bias
:2attn_norm/gamma
:2attn_norm/beta
:2dense/kernel
:2
dense/bias
 :2dense_1/kernel
:2dense_1/bias
N:L@2@tcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/bias
N:L@2@tcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/bias
':%@02gru_2/gru_cell/kernel
%:#02gru_2/gru_cell/bias
&:$ 2mha/value/kernel
N:L@2@tcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/bias
N:L@2@tcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/bias
N:L@2@tcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/bias
N:L@2@tcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/bias
:@2bn/beta
1:/ 2mha/attention_output/kernel
:2dense_1/bias
#:!+@2conv1d/kernel
N:L@2@tcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/bias
N:L@2@tcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/bias
N:L@2@tcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/bias
X:V@@2Btcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/kernel
:@2bn/gamma
 : 2mha/query/bias
 : 2mha/value/bias
X:V@@2Btcn_cnn/residual_block_1/residual_block_1/conv1D_1/conv1D_1/kernel
X:V@@2Btcn_cnn/residual_block_3/residual_block_3/conv1D_1/conv1D_1/kernel
$:" 2mha/key/kernel
:2attn_norm/gamma
X:V@@2Btcn_cnn/residual_block_1/residual_block_1/conv1D_0/conv1D_0/kernel
X:V@@2Btcn_cnn/residual_block_2/residual_block_2/conv1D_1/conv1D_1/kernel
X:V@@2Btcn_cnn/residual_block_3/residual_block_3/conv1D_0/conv1D_0/kernel
':%	@�2gru1/gru_cell/kernel
:2attn_norm/beta
X:V@@2Btcn_cnn/residual_block_2/residual_block_2/conv1D_0/conv1D_0/kernel
X:V@@2Btcn_cnn/residual_block_4/residual_block_4/conv1D_1/conv1D_1/kernel
':%2mha/attention_output/bias
:2dense/kernel
 :2dense_1/kernel
%:#	�2gru1/gru_cell/bias
&:$ 2mha/query/kernel
:@2conv1d/bias
X:V@@2Btcn_cnn/residual_block_0/residual_block_0/conv1D_1/conv1D_1/kernel
X:V@@2Btcn_cnn/residual_block_0/residual_block_0/conv1D_0/conv1D_0/kernel
N:L@2@tcn_cnn/residual_block_4/residual_block_4/conv1D_0/conv1D_0/bias
1:/	@�2gru1/gru_cell/recurrent_kernel
1:/02gru_2/gru_cell/recurrent_kernel
: 2mha/key/bias
:2
dense/bias
:@2bn/moving_mean
:@2bn/moving_variance
�B�
__inference___call___4936input_sequence"�
���
FullArgSpec
args�

jargs_0
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
+__inference_signature_wrapper___call___5034input_sequence"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 #

kwonlyargs�
jinput_sequence
kwonlydefaults
 
annotations� *
 
�B�
+__inference_signature_wrapper___call___5131input_sequence"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 #

kwonlyargs�
jinput_sequence
kwonlydefaults
 
annotations� *
 �
__inference___call___4936�.	
 "#%&*+()-./234789:;<=>?@ABCD;�8
1�.
,�)
input_sequence���������L+
� "%�"
unknown���������L�
+__inference_signature_wrapper___call___5034�.	
 "#%&*+()-./234789:;<=>?@ABCDM�J
� 
C�@
>
input_sequence,�)
input_sequence���������L+"7�4
2
output_0&�#
output_0���������L�
+__inference_signature_wrapper___call___5131�.	
 "#%&*+()-./234789:;<=>?@ABCDM�J
� 
C�@
>
input_sequence,�)
input_sequence���������L+"7�4
2
output_0&�#
output_0���������L