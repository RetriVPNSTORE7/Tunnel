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
BZh91AY&SYU]s>  ��� }���o������    P��v�v㫱�ɦ�J{LI�S��7����a���z����d �B��S���z�C� �@   �4�L����I�z�D���ODѐ�420 *�4� h       SQ����j�S�zz���0�F���i"�ۆ����{Sl�!cF �l�cX+�X�{�I;Zڢ4���#��N�F/}�y[vK�s0�=�wt��v��4����t����Ђ���0���܃���B��$QA˜��-Α
�����E�#~M�k�%)�D���u�����4$�� r���#���۳)�.A��&��6��/s�!�u�݋5*�[m�^�/\qZ#I�~l(}�7�~�(khGK+��Ɩ��D�w�ʑ����K��CIa鸖��I�ɦZ:�>�HuE��.xX�ˬ�$P���m��f�%���	���:�T�<"(�M �"t��;�@�e�����`�����Gٹ�&E)�͇��E-��>ѥ���yU=2
=�$i:3��Ճfͼ�t>-E��˱{��L�Z���6�*��U��{��+V�(�a��2�S��bL���z����bvQ �	7ob�M�aD(�2��/���ԁZs�NTPB�����
d]�:-|�%3�S]C\��n�8�&EE���u����M$jR��Gw	;�H��ڙ�ESb��s��J���y����`�P�.b���=�
C�o�P��4���&6���狧n^v�(/饔r�M����P�"o�8UV�Y_î|Y��<�G���P�\�u��wj���lJp�1n�|o�稉���I�4s��1f��NY2,لq`���O��::����g�6�4���Y#j�`��N+�joFS�l�(��F�����"�D���؂"X��	+��f���0���Z5�j��]M�ޔ�2L�����
LAq)�'�$˜2d��I��1\Dخ�7�}���D�Ϝ�{�ب��=��Fb����^
�A�!Z�IbF �`��{V����(��lj�
d$- �P�A�	$��q�	)���H�

��g�