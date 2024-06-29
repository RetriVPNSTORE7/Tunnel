#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY[�ݥ  ���EP���/o߮����    P~G)�ӓ6�2�I�6����5?T����h� �LF�mJMRzi����7��  4 �h	"#H�56�����)���z�yCA��  ��M44���# ����M4�#�IO�����F���h����LИ)�_��0�������X�2iyU|�(���:��z�>��K5-��nȻ�4�e�@}$���2�|텍A0Eâ�<�N�:r�*���_�m�$s4r*����<�`�a6�eb�ʰ����;c�f��%� pM�!"���^Ce�3
�d���M�j�W蠩qoF�,x,�]q�'}��5P��>R8S/8W�ƪ7��l����ng*��>�V/��00A[!A��f��2���K�F��I�|�@�ukԧPAxK����35�3f�匐��c�iz�Ą��IX�tq��HZ|��M�X"�����t�X2����wv��w#�,�X��|���R?99�ViS+�^�x��>.�>-����d�q�
�?�N(.��rS�'�Vl����V"e�B"8a��CEF�N������a"s$f�^B~�RP�.)MM�np]SU}����*�J�]��fA������ɑ|)���C�I(����V��BS��]f�O���t����Q�\V&N^���QP��5HJ��[k�$�<��������V�j������ȣ�2r�K�[#ķ�:�K��m��f�4H��� ����>5��T"��X�+IdȒ�3$ITr	ղt/��$^JuP�,�=WE�U�)X|A�����W���-�!��U��Kz�%!+�̱��f��sW��������0���Zhv���h�7����r�
c%<�,q�P�d�z�Z
��T�RP"�T��)4��G�9>)���8�z�W�� ?�tO�w$S�	���P