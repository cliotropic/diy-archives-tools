FasdUAS 1.101.10   ��   ��    k             l     ��  ��    V P ArcImageFiler.scpt - Quick-and-dirty script for filing image files into folders     � 	 	 �   A r c I m a g e F i l e r . s c p t   -   Q u i c k - a n d - d i r t y   s c r i p t   f o r   f i l i n g   i m a g e   f i l e s   i n t o   f o l d e r s   
  
 l     ��  ��    9 3 Copyright 2010 Shane Landrum, <srl@cliotropic.org>     �   f   C o p y r i g h t   2 0 1 0   S h a n e   L a n d r u m ,   < s r l @ c l i o t r o p i c . o r g >      l     ��  ��    , & Version 0.1, last revised 22 Feb 2010     �   L   V e r s i o n   0 . 1 ,   l a s t   r e v i s e d   2 2   F e b   2 0 1 0      l     ��������  ��  ��        l     ��  ��    m g For the full context of this script, see http://cliotropic.org/blog/talks/camera-laptop-and-what-else/     �   �   F o r   t h e   f u l l   c o n t e x t   o f   t h i s   s c r i p t ,   s e e   h t t p : / / c l i o t r o p i c . o r g / b l o g / t a l k s / c a m e r a - l a p t o p - a n d - w h a t - e l s e /      l     ��������  ��  ��        l     ��   ��    � CONFIGURATION: adjust settings below to your own system. This should point to the folder where your unfiled images start off. The image files inside should be named so that when they're sorted by name, they appear in the same order that they were shot.      � ! !�   C O N F I G U R A T I O N :   a d j u s t   s e t t i n g s   b e l o w   t o   y o u r   o w n   s y s t e m .   T h i s   s h o u l d   p o i n t   t o   t h e   f o l d e r   w h e r e   y o u r   u n f i l e d   i m a g e s   s t a r t   o f f .   T h e   i m a g e   f i l e s   i n s i d e   s h o u l d   b e   n a m e d   s o   t h a t   w h e n   t h e y ' r e   s o r t e d   b y   n a m e ,   t h e y   a p p e a r   i n   t h e   s a m e   o r d e r   t h a t   t h e y   w e r e   s h o t .   " # " l     $���� $ r      % & % 4     �� '
�� 
psxf ' m     ( ( � ) ) P / U s e r s / s r l / D e s k t o p / I n b o x / i n c o m i n g   i m a g e s & o      ���� 0 basepath  ��  ��   #  * + * l     ��������  ��  ��   +  , - , l     �� . /��   . U O-------------------------------------------------------------------------------    / � 0 0 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  1 2 1 l     �� 3 4��   3 N H    This program is free software: you can redistribute it and/or modify    4 � 5 5 �         T h i s   p r o g r a m   i s   f r e e   s o f t w a r e :   y o u   c a n   r e d i s t r i b u t e   i t   a n d / o r   m o d i f y 2  6 7 6 l     �� 8 9��   8 N H    it under the terms of the GNU General Public License as published by    9 � : : �         i t   u n d e r   t h e   t e r m s   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   a s   p u b l i s h e d   b y 7  ; < ; l     �� = >��   = K E    the Free Software Foundation, either version 3 of the License, or    > � ? ? �         t h e   F r e e   S o f t w a r e   F o u n d a t i o n ,   e i t h e r   v e r s i o n   3   o f   t h e   L i c e n s e ,   o r <  @ A @ l     �� B C��   B - '    (at your option) any later version.    C � D D N         ( a t   y o u r   o p t i o n )   a n y   l a t e r   v e r s i o n . A  E F E l     ��������  ��  ��   F  G H G l     �� I J��   I I C    This program is distributed in the hope that it will be useful,    J � K K �         T h i s   p r o g r a m   i s   d i s t r i b u t e d   i n   t h e   h o p e   t h a t   i t   w i l l   b e   u s e f u l , H  L M L l     �� N O��   N H B    but WITHOUT ANY WARRANTY; without even the implied warranty of    O � P P �         b u t   W I T H O U T   A N Y   W A R R A N T Y ;   w i t h o u t   e v e n   t h e   i m p l i e d   w a r r a n t y   o f M  Q R Q l     �� S T��   S G A    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the    T � U U �         M E R C H A N T A B I L I T Y   o r   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E .     S e e   t h e R  V W V l     �� X Y��   X 6 0    GNU General Public License for more details.    Y � Z Z `         G N U   G e n e r a l   P u b l i c   L i c e n s e   f o r   m o r e   d e t a i l s . W  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _ K E    You should have received a copy of the GNU General Public License    ` � a a �         Y o u   s h o u l d   h a v e   r e c e i v e d   a   c o p y   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e ^  b c b l     �� d e��   d O I    along with this program.  If not, see <http://www.gnu.org/licenses/>.    e � f f �         a l o n g   w i t h   t h i s   p r o g r a m .     I f   n o t ,   s e e   < h t t p : / / w w w . g n u . o r g / l i c e n s e s / > . c  g h g l     ��������  ��  ��   h  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m ; 5 ----------------------------------------------------    n � o o j   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - l  p q p l     �� r s��   r  
 FUNCTIONS    s � t t    F U N C T I O N S q  u v u i      w x w I      �� y���� 0 pickafolder pickAFolder y  z�� z o      ���� 0 
somefolder 
someFolder��  ��   x k      { {  | } | r      ~  ~ I    ���� �
�� .sysostflalis    ��� null��   � �� � �
�� 
prmp � m     � � � � � 0 P i c k   M a i n   F o l d e r   T o   F i l e � �� ���
�� 
dflc � 4    �� �
�� 
alis � l    ����� � o    ���� 0 
somefolder 
someFolder��  ��  ��    o      ���� 0 
thisfolder 
thisFolder }  ��� � L     � � o    ���� 0 
thisfolder 
thisFolder��   v  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� �����  0 filethisfolder fileThisFolder �  ��� � o      ���� 0 masterfolder masterFolder��  ��   � O     � � � � k    � � �  � � � I   	������
�� .miscactvnull��� ��� obj ��  ��   �  � � � l  
 
�� � ���   � d ^ show dialog box for multiple selection; everything that's supposed to go into the new folder.    � � � � �   s h o w   d i a l o g   b o x   f o r   m u l t i p l e   s e l e c t i o n ;   e v e r y t h i n g   t h a t ' s   s u p p o s e d   t o   g o   i n t o   t h e   n e w   f o l d e r . �  � � � r   
  � � � I  
 ���� �
�� .sysostdfalis    ��� null��   � �� � �
�� 
prmp � m     � � � � � $ P i c k   f i l e s   t o   m o v e � �� � �
�� 
dflc � o    ���� 0 masterfolder masterFolder � �� � �
�� 
mlsl � m     � � � � �  t r u e � �� ���
�� 
lfiv � m    ��
�� boovfals��   � o      ���� 0 myfiles myFiles �  � � � l   ��������  ��  ��   �  � � � r    % � � � I   #�� � �
�� .DATASORTobj ���     obj  � o    ���� 0 myfiles myFiles � �� ���
�� 
by   � 1    ��
�� 
pnam��   � o      ���� 0 mysortedfiles mySortedFiles �  � � � r   & , � � � n   & * � � � 4  ' *�� �
�� 
cobj � m   ( )����  � o   & '���� 0 mysortedfiles mySortedFiles � o      ���� 	0 cover   �  � � � l  - -��������  ��  ��   �  � � � l  - -�� � ���   � Y S Preview the first image in the list (numerically) using OS X's Quick View feature.    � � � � �   P r e v i e w   t h e   f i r s t   i m a g e   i n   t h e   l i s t   ( n u m e r i c a l l y )   u s i n g   O S   X ' s   Q u i c k   V i e w   f e a t u r e . �  � � � r   - D � � � l  - B ����� � b   - B � � � b   - > � � � b   - 0 � � � m   - . � � � � �  q l m a n a g e   - p � 1   . /��
�� 
spac � l  0 = ����� � n   0 = � � � 1   9 =��
�� 
strq � l  0 9 ����� � n   0 9 � � � 1   5 9��
�� 
psxp � l  0 5 ����� � c   0 5 � � � o   0 1���� 	0 cover   � m   1 4��
�� 
alis��  ��  ��  ��  ��  ��   � m   > A � � � � �  > &   / d e v / n u l l��  ��   � o      ���� 0 cmd   �  � � � r   E L � � � c   E J � � � o   E F���� 0 cmd   � m   F I��
�� 
utf8 � o      ���� 0 cmd   �  � � � I  M R�� ���
�� .sysoexecTEXT���     TEXT � o   M N���� 0 cmd  ��   �  � � � l  S S��������  ��  ��   �  � � � l  S S�� � ���   � * $ Make a new folder for these images.    � � � � H   M a k e   a   n e w   f o l d e r   f o r   t h e s e   i m a g e s . �  � � � I  S h�� � �
�� .sysodlogaskr        TEXT � m   S V � � � � � J E n t e r   a   f o l d e r   n a m e   f o r   t h e s e   i m a g e s : � �� � �
�� 
dtxt � m   Y \ � � � � �   � �� ���
�� 
appr � m   _ b � � � � �   F o l d e r   t o   c r e a t e��   �  � � � r   i n � � � 1   i l��
�� 
rslt � o      ���� 0 
dialoginfo 
dialogInfo �  � � � r   o v � � � n   o t   1   p t�
� 
ttxt o   o p�~�~ 0 
dialoginfo 
dialogInfo � o      �}�} 0 	newfolder 	newFolder �  l  w w�|�|   E ? display dialog "The new folder is " & masterFolder & newFolder    � ~   d i s p l a y   d i a l o g   " T h e   n e w   f o l d e r   i s   "   &   m a s t e r F o l d e r   &   n e w F o l d e r  I  w ��{�z	
�{ .corecrel****      � null�z  	 �y

�y 
kocl
 m   { ~�x
�x 
cfol �w
�w 
insh o   � ��v�v 0 masterfolder masterFolder �u�t
�u 
prdt K   � � �s�r
�s 
pnam o   � ��q�q 0 	newfolder 	newFolder�r  �t    l  � ��p�o�n�p  �o  �n    l  � ��m�m   * $ and move the selected images there.    � H   a n d   m o v e   t h e   s e l e c t e d   i m a g e s   t h e r e .  r   � � 4   � ��l
�l 
alis l  � ��k�j b   � � l  � � �i�h  c   � �!"! o   � ��g�g 0 masterfolder masterFolder" m   � ��f
�f 
TEXT�i  �h   o   � ��e�e 0 	newfolder 	newFolder�k  �j   o      �d�d 0 newfullpath newFullPath #�c# I  � ��b$%
�b .coremoveobj        obj $ o   � ��a�a 0 myfiles myFiles% �`&�_
�` 
insh& o   � ��^�^ 0 newfullpath newFullPath�_  �c   � m     ''�                                                                                  MACS   alis    b  bigdisk                    �H+    �
Finder.app                                                      8��%�        ����  	                CoreServices     C      �&'�      � �% �#  .bigdisk:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p    b i g d i s k  &System/Library/CoreServices/Finder.app  / ��   � ()( l     �]�\�[�]  �\  �[  ) *+* l     �Z,-�Z  , 6 0------------------------------------------------   - �.. ` - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+ /0/ l     �Y12�Y  1    Main program begins here.   2 �33 4   M a i n   p r o g r a m   b e g i n s   h e r e .0 454 l     �X�W�V�X  �W  �V  5 676 l   8�U�T8 r    9:9 I    �S;�R�S 0 pickafolder pickAFolder; <�Q< o    	�P�P 0 basepath  �Q  �R  : o      �O�O 0 mybasefolder myBaseFolder�U  �T  7 =>= l     �N�M�L�N  �M  �L  > ?@? l   A�K�JA r    BCB m    �I
�I boovtrueC o      �H�H 0 	keepgoing 	keepGoing�K  �J  @ DED l   +F�G�FF V    +GHG k    &II JKJ =    $LML o    �E�E 0 	keepgoing 	keepGoingM I    #�DN�C�D  0 filethisfolder fileThisFolderN O�BO o    �A�A 0 mybasefolder myBaseFolder�B  �C  K P�@P l  % %�?QR�?  Q 5 / when the user hits Escape, the loop will stop.   R �SS ^   w h e n   t h e   u s e r   h i t s   E s c a p e ,   t h e   l o o p   w i l l   s t o p .�@  H =    TUT o    �>�> 0 	keepgoing 	keepGoingU m    �=
�= boovtrue�G  �F  E VWV l     �<�;�:�<  �;  �:  W X�9X l     �8�7�6�8  �7  �6  �9       �5YZ[\�5  Y �4�3�2�4 0 pickafolder pickAFolder�3  0 filethisfolder fileThisFolder
�2 .aevtoappnull  �   � ****Z �1 x�0�/]^�.�1 0 pickafolder pickAFolder�0 �-_�- _  �,�, 0 
somefolder 
someFolder�/  ] �+�*�+ 0 
somefolder 
someFolder�* 0 
thisfolder 
thisFolder^ �) ��(�'�&�%
�) 
prmp
�( 
dflc
�' 
alis�& 
�% .sysostflalis    ��� null�. *���*�/� E�O�[ �$ ��#�"`a�!�$  0 filethisfolder fileThisFolder�# � b�  b  �� 0 masterfolder masterFolder�"  ` ��������� 0 masterfolder masterFolder� 0 myfiles myFiles� 0 mysortedfiles mySortedFiles� 	0 cover  � 0 cmd  � 0 
dialoginfo 
dialogInfo� 0 	newfolder 	newFolder� 0 newfullpath newFullPatha ''�� ��� �������� ���
�	� ��� �� �� ����� ����������������
� .miscactvnull��� ��� obj 
� 
prmp
� 
dflc
� 
mlsl
� 
lfiv� 
� .sysostdfalis    ��� null
� 
by  
� 
pnam
� .DATASORTobj ���     obj 
� 
cobj
� 
spac
�
 
alis
�	 
psxp
� 
strq
� 
utf8
� .sysoexecTEXT���     TEXT
� 
dtxt
� 
appr� 
� .sysodlogaskr        TEXT
� 
rslt
�  
ttxt
�� 
kocl
�� 
cfol
�� 
insh
�� 
prdt�� 
�� .corecrel****      � null
�� 
TEXT
�� .coremoveobj        obj �! �� �*j O*������f� 	E�O��*�,l E�O��k/E�O��%�a &a ,a ,%a %E�O�a &E�O�j Oa a a a a a  O_ E�O�a ,E�O*a a  a !�a "�la # $O*a �a %&�%/E�O�a !�l &U\ ��c����de��
�� .aevtoappnull  �   � ****c k     +ff  "gg 6hh ?ii D����  ��  ��  d  e �� (����������
�� 
psxf�� 0 basepath  �� 0 pickafolder pickAFolder�� 0 mybasefolder myBaseFolder�� 0 	keepgoing 	keepGoing��  0 filethisfolder fileThisFolder�� ,)��/E�O*�k+ E�OeE�O h�e �*�k+  OP[OY�� ascr  ��ޭ