#!/bin/bash
Base="dc=dominio,dc=inet"
Account="cn=admin,$Base"
Pass="abc123###"

Entradas=`ldapsearch -x -H ldapi:/// | egrep -i num | awk '{ print $ 3 }'`
if [ $Entradas -lt 3 ] 
then
	echo "dn: olcDatabase={0}config,cn=config
changetype: modify
add: olcRootPW
olcRootPW: {MD5}F5MpVcmAMa/ZZsja/s+pBQ==

dn: cn=config
changetype: modify
replace: olcLogLevel
olcLogLevel: stats" | ldapmodify -Y EXTERNAL -H ldapi:///


echo "dn: cn=samba,cn=schema,cn=config
objectClass: olcSchemaConfig
cn: samba
olcAttributeTypes: {0}( 1.3.6.1.4.1.7165.2.1.24 NAME 'sambaLMPassword' DESC 'L
 anManager Password' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.1.1466.115.1
 21.1.26{32} SINGLE-VALUE )
olcAttributeTypes: {1}( 1.3.6.1.4.1.7165.2.1.25 NAME 'sambaNTPassword' DESC 'M
 D4 hash of the unicode password' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4
 .1.1466.115.121.1.26{32} SINGLE-VALUE )
olcAttributeTypes: {2}( 1.3.6.1.4.1.7165.2.1.26 NAME 'sambaAcctFlags' DESC 'Ac
 count Flags' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.1.1466.115.121.1.26
 {16} SINGLE-VALUE )
olcAttributeTypes: {3}( 1.3.6.1.4.1.7165.2.1.27 NAME 'sambaPwdLastSet' DESC 'T
 imestamp of the last password update' EQUALITY integerMatch SYNTAX 1.3.6.1.4.
 1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {4}( 1.3.6.1.4.1.7165.2.1.28 NAME 'sambaPwdCanChange' DESC 
 'Timestamp of when the user is allowed to update the password' EQUALITY integ
 erMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {5}( 1.3.6.1.4.1.7165.2.1.29 NAME 'sambaPwdMustChange' DESC
  'Timestamp of when the password will expire' EQUALITY integerMatch SYNTAX 1.
 3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {6}( 1.3.6.1.4.1.7165.2.1.30 NAME 'sambaLogonTime' DESC 'Ti
 mestamp of last logon' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.
 1.27 SINGLE-VALUE )
olcAttributeTypes: {7}( 1.3.6.1.4.1.7165.2.1.31 NAME 'sambaLogoffTime' DESC 'T
 imestamp of last logoff' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.12
 1.1.27 SINGLE-VALUE )
olcAttributeTypes: {8}( 1.3.6.1.4.1.7165.2.1.32 NAME 'sambaKickoffTime' DESC '
 Timestamp of when the user will be logged off automatically' EQUALITY integer
 Match SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {9}( 1.3.6.1.4.1.7165.2.1.48 NAME 'sambaBadPasswordCount' D
 ESC 'Bad password attempt count' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.146
 6.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {10}( 1.3.6.1.4.1.7165.2.1.49 NAME 'sambaBadPasswordTime' D
 ESC 'Time of the last bad password attempt' EQUALITY integerMatch SYNTAX 1.3.
 6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {11}( 1.3.6.1.4.1.7165.2.1.55 NAME 'sambaLogonHours' DESC '
 Logon Hours' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.1.1466.115.121.1.26
 {42} SINGLE-VALUE )
olcAttributeTypes: {12}( 1.3.6.1.4.1.7165.2.1.33 NAME 'sambaHomeDrive' DESC 'D
 river letter of home directory mapping' EQUALITY caseIgnoreIA5Match SYNTAX 1.
 3.6.1.4.1.1466.115.121.1.26{4} SINGLE-VALUE )
olcAttributeTypes: {13}( 1.3.6.1.4.1.7165.2.1.34 NAME 'sambaLogonScript' DESC 
 'Logon script path' EQUALITY caseIgnoreMatch SYNTAX 1.3.6.1.4.1.1466.115.121.
 1.15{255} SINGLE-VALUE )
olcAttributeTypes: {14}( 1.3.6.1.4.1.7165.2.1.35 NAME 'sambaProfilePath' DESC 
 'Roaming profile path' EQUALITY caseIgnoreMatch SYNTAX 1.3.6.1.4.1.1466.115.1
 21.1.15{255} SINGLE-VALUE )
olcAttributeTypes: {15}( 1.3.6.1.4.1.7165.2.1.36 NAME 'sambaUserWorkstations' 
 DESC 'List of user workstations the user is allowed to logon to' EQUALITY cas
 eIgnoreMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15{255} SINGLE-VALUE )
olcAttributeTypes: {16}( 1.3.6.1.4.1.7165.2.1.37 NAME 'sambaHomePath' DESC 'Ho
 me directory UNC path' EQUALITY caseIgnoreMatch SYNTAX 1.3.6.1.4.1.1466.115.1
 21.1.15{128} )
olcAttributeTypes: {17}( 1.3.6.1.4.1.7165.2.1.38 NAME 'sambaDomainName' DESC '
 Windows NT domain to which the user belongs' EQUALITY caseIgnoreMatch SYNTAX 
 1.3.6.1.4.1.1466.115.121.1.15{128} )
olcAttributeTypes: {18}( 1.3.6.1.4.1.7165.2.1.47 NAME 'sambaMungedDial' DESC '
 Base64 encoded user parameter string' EQUALITY caseExactMatch SYNTAX 1.3.6.1.
 4.1.1466.115.121.1.15{1050} )
olcAttributeTypes: {19}( 1.3.6.1.4.1.7165.2.1.54 NAME 'sambaPasswordHistory' D
 ESC 'Concatenated MD5 hashes of the salted NT passwords used on this account'
  EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.1.1466.115.121.1.26{32} )
olcAttributeTypes: {20}( 1.3.6.1.4.1.7165.2.1.20 NAME 'sambaSID' DESC 'Securit
 y ID' EQUALITY caseIgnoreIA5Match SUBSTR caseExactIA5SubstringsMatch SYNTAX 1
 .3.6.1.4.1.1466.115.121.1.26{64} SINGLE-VALUE )
olcAttributeTypes: {21}( 1.3.6.1.4.1.7165.2.1.23 NAME 'sambaPrimaryGroupSID' D
 ESC 'Primary Group Security ID' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.
 1.1466.115.121.1.26{64} SINGLE-VALUE )
olcAttributeTypes: {22}( 1.3.6.1.4.1.7165.2.1.51 NAME 'sambaSIDList' DESC 'Sec
 urity ID List' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.1.1466.115.121.1.
 26{64} )
olcAttributeTypes: {23}( 1.3.6.1.4.1.7165.2.1.19 NAME 'sambaGroupType' DESC 'N
 T Group Type' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SING
 LE-VALUE )
olcAttributeTypes: {24}( 1.3.6.1.4.1.7165.2.1.21 NAME 'sambaNextUserRid' DESC 
 'Next NT rid to give our for users' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.
 1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {25}( 1.3.6.1.4.1.7165.2.1.22 NAME 'sambaNextGroupRid' DESC
  'Next NT rid to give out for groups' EQUALITY integerMatch SYNTAX 1.3.6.1.4.
 1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {26}( 1.3.6.1.4.1.7165.2.1.39 NAME 'sambaNextRid' DESC 'Nex
 t NT rid to give out for anything' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.1
 466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {27}( 1.3.6.1.4.1.7165.2.1.40 NAME 'sambaAlgorithmicRidBase
 ' DESC 'Base at which the samba RID generation algorithm should operate' EQUA
 LITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {28}( 1.3.6.1.4.1.7165.2.1.41 NAME 'sambaShareName' DESC 'S
 hare Name' EQUALITY caseIgnoreMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SING
 LE-VALUE )
olcAttributeTypes: {29}( 1.3.6.1.4.1.7165.2.1.42 NAME 'sambaOptionName' DESC '
 Option Name' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX
  1.3.6.1.4.1.1466.115.121.1.15{256} )
olcAttributeTypes: {30}( 1.3.6.1.4.1.7165.2.1.43 NAME 'sambaBoolOption' DESC '
 A boolean option' EQUALITY booleanMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.7 S
 INGLE-VALUE )
olcAttributeTypes: {31}( 1.3.6.1.4.1.7165.2.1.44 NAME 'sambaIntegerOption' DES
 C 'An integer option' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1
 .27 SINGLE-VALUE )
olcAttributeTypes: {32}( 1.3.6.1.4.1.7165.2.1.45 NAME 'sambaStringOption' DESC
  'A string option' EQUALITY caseExactIA5Match SYNTAX 1.3.6.1.4.1.1466.115.121
 .1.26 SINGLE-VALUE )
olcAttributeTypes: {33}( 1.3.6.1.4.1.7165.2.1.46 NAME 'sambaStringListOption' 
 DESC 'A string list option' EQUALITY caseIgnoreMatch SYNTAX 1.3.6.1.4.1.1466.
 115.121.1.15 )
olcAttributeTypes: {34}( 1.3.6.1.4.1.7165.2.1.53 NAME 'sambaTrustFlags' DESC '
 Trust Password Flags' EQUALITY caseIgnoreIA5Match SYNTAX 1.3.6.1.4.1.1466.115
 .121.1.26 )
olcAttributeTypes: {35}( 1.3.6.1.4.1.7165.2.1.58 NAME 'sambaMinPwdLength' DESC
  'Minimal password length (default: 5)' EQUALITY integerMatch SYNTAX 1.3.6.1.
 4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {36}( 1.3.6.1.4.1.7165.2.1.59 NAME 'sambaPwdHistoryLength' 
 DESC 'Length of Password History Entries (default: 0 => off)' EQUALITY intege
 rMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {37}( 1.3.6.1.4.1.7165.2.1.60 NAME 'sambaLogonToChgPwd' DES
 C 'Force Users to logon for password change (default: 0 => off, 2 => on)' EQU
 ALITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {38}( 1.3.6.1.4.1.7165.2.1.61 NAME 'sambaMaxPwdAge' DESC 'M
 aximum password age, in seconds (default: -1 => never expire passwords)' EQUA
 LITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {39}( 1.3.6.1.4.1.7165.2.1.62 NAME 'sambaMinPwdAge' DESC 'M
 inimum password age, in seconds (default: 0 => allow immediate password chang
 e)' EQUALITY integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {40}( 1.3.6.1.4.1.7165.2.1.63 NAME 'sambaLockoutDuration' D
 ESC 'Lockout duration in minutes (default: 30, -1 => forever)' EQUALITY integ
 erMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {41}( 1.3.6.1.4.1.7165.2.1.64 NAME 'sambaLockoutObservation
 Window' DESC 'Reset time after lockout in minutes (default: 30)' EQUALITY int
 egerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {42}( 1.3.6.1.4.1.7165.2.1.65 NAME 'sambaLockoutThreshold' 
 DESC 'Lockout users after bad logon attempts (default: 0 => off)' EQUALITY in
 tegerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {43}( 1.3.6.1.4.1.7165.2.1.66 NAME 'sambaForceLogoff' DESC 
 'Disconnect Users outside logon hours (default: -1 => off, 0 => on)' EQUALITY
  integerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {44}( 1.3.6.1.4.1.7165.2.1.67 NAME 'sambaRefuseMachinePwdCh
 ange' DESC 'Allow Machine Password changes (default: 0 => off)' EQUALITY inte
 gerMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 SINGLE-VALUE )
olcAttributeTypes: {45}( 1.3.6.1.4.1.7165.2.1.68 NAME 'sambaClearTextPassword'
  DESC 'Clear text password (used for trusted domain passwords)' EQUALITY octe
 tStringMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.40 )
olcAttributeTypes: {46}( 1.3.6.1.4.1.7165.2.1.69 NAME 'sambaPreviousClearTextP
 assword' DESC 'Previous clear text password (used for trusted domain password
 s)' EQUALITY octetStringMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.40 )
olcObjectClasses: {0}( 1.3.6.1.4.1.7165.2.2.6 NAME 'sambaSamAccount' DESC 'Sam
 ba 3.0 Auxilary SAM Account' SUP top AUXILIARY MUST ( uid $ sambaSID ) MAY ( 
 cn $ sambaLMPassword $ sambaNTPassword $ sambaPwdLastSet $ sambaLogonTime $ s
 ambaLogoffTime $ sambaKickoffTime $ sambaPwdCanChange $ sambaPwdMustChange $ 
 sambaAcctFlags $ displayName $ sambaHomePath $ sambaHomeDrive $ sambaLogonScr
 ipt $ sambaProfilePath $ description $ sambaUserWorkstations $ sambaPrimaryGr
 oupSID $ sambaDomainName $ sambaMungedDial $ sambaBadPasswordCount $ sambaBad
 PasswordTime $ sambaPasswordHistory $ sambaLogonHours ) )
olcObjectClasses: {1}( 1.3.6.1.4.1.7165.2.2.4 NAME 'sambaGroupMapping' DESC 'S
 amba Group Mapping' SUP top AUXILIARY MUST ( gidNumber $ sambaSID $ sambaGrou
 pType ) MAY ( displayName $ description $ sambaSIDList ) )
olcObjectClasses: {2}( 1.3.6.1.4.1.7165.2.2.14 NAME 'sambaTrustPassword' DESC 
 'Samba Trust Password' SUP top STRUCTURAL MUST ( sambaDomainName $ sambaNTPas
 sword $ sambaTrustFlags ) MAY ( sambaSID $ sambaPwdLastSet ) )
olcObjectClasses: {3}( 1.3.6.1.4.1.7165.2.2.15 NAME 'sambaTrustedDomainPasswor
 d' DESC 'Samba Trusted Domain Password' SUP top STRUCTURAL MUST ( sambaDomain
 Name $ sambaSID $ sambaClearTextPassword $ sambaPwdLastSet ) MAY sambaPreviou
 sClearTextPassword )
olcObjectClasses: {4}( 1.3.6.1.4.1.7165.2.2.5 NAME 'sambaDomain' DESC 'Samba D
 omain Information' SUP top STRUCTURAL MUST ( sambaDomainName $ sambaSID ) MAY
  ( sambaNextRid $ sambaNextGroupRid $ sambaNextUserRid $ sambaAlgorithmicRidB
 ase $ sambaMinPwdLength $ sambaPwdHistoryLength $ sambaLogonToChgPwd $ sambaM
 axPwdAge $ sambaMinPwdAge $ sambaLockoutDuration $ sambaLockoutObservationWin
 dow $ sambaLockoutThreshold $ sambaForceLogoff $ sambaRefuseMachinePwdChange 
 ) )
olcObjectClasses: {5}( 1.3.6.1.4.1.7165.2.2.7 NAME 'sambaUnixIdPool' DESC 'Poo
 l for allocating UNIX uids/gids' SUP top AUXILIARY MUST ( uidNumber $ gidNumb
 er ) )
olcObjectClasses: {6}( 1.3.6.1.4.1.7165.2.2.8 NAME 'sambaIdmapEntry' DESC 'Map
 ping from a SID to an ID' SUP top AUXILIARY MUST sambaSID MAY ( uidNumber $ g
 idNumber ) )
olcObjectClasses: {7}( 1.3.6.1.4.1.7165.2.2.9 NAME 'sambaSidEntry' DESC 'Struc
 tural Class for a SID' SUP top STRUCTURAL MUST sambaSID )
olcObjectClasses: {8}( 1.3.6.1.4.1.7165.2.2.10 NAME 'sambaConfig' DESC 'Samba 
 Configuration Section' SUP top AUXILIARY MAY description )
olcObjectClasses: {9}( 1.3.6.1.4.1.7165.2.2.11 NAME 'sambaShare' DESC 'Samba S
 hare Section' SUP top STRUCTURAL MUST sambaShareName MAY description )
olcObjectClasses: {10}( 1.3.6.1.4.1.7165.2.2.12 NAME 'sambaConfigOption' DESC 
 'Samba Configuration Option' SUP top STRUCTURAL MUST sambaOptionName MAY ( sa
 mbaBoolOption $ sambaIntegerOption $ sambaStringOption $ sambaStringListoptio
 n $ description ) )" | ldapadd -x -D "cn=admin,cn=config" -H ldapi:/// -w elaborata


 echo "dn: olcDatabase={1}mdb,cn=config
changetype: modify
#Exclui as bases caso jáenham sido criadas, caso contráo comente essas linhas
#delete: olcAccess
#-
add: olcAccess
olcAccess: {0}to attrs=userPassword,sambaNTPassword,sambaLMPassword,sambaPwdLastSet,sambaPwdMustChange,sambaPasswordHistory by dn.exact=\"cn=pesquisador,ou=Servicos,$Base\" read by dn.exact=\"cn=replicador,ou=Servicos,$Base\" read by anonymous auth by self write by * none
-
add: olcAccess
olcAccess: {1}to attrs=shadowLastChange,sambaPwdLastSet,sambaPwdMustChange by dn=\"cn=pesquisador,ou=Servicos,$Base\" read by dn=\"cn=replicador,ou=Servicos,$Base\" read by self write by anonymous auth by users read by * none
-
add: olcAccess
olcAccess: {2}to attrs=uidNumber,gidNumber,sambaSID,sambaPrimaryGroupSID,loginShell,homeDirectory by dn=\"cn=pesquisador,ou=Servicos,$Base\" read by dn=\"cn=replicador,ou=Servicos,$Base\" read by self read by users read by anonymous auth by * none
-
add: olcAccess
olcAccess: {3}to dn.subtree=\"ou=Computadores,$Base\" by group=\"cn=Domain Admins,ou=Grupos,$Base\" write by group=\"cn=Account Operators,ou=Grupos,$Base\" write by users read by anonymous auth by * none
-
add: olcAccess
olcAccess: {4}to dn.subtree=\"ou=Contatos,$Base\" attrs=uidNumber,gidNumber,uid by * none
-
add: olcAccess
olcAccess: {5}to dn.subtree=\"ou=Contatos,$Base\" by dn=\"cn=pesquisador,ou=Servicos,$Base\" read by dn=\"cn=replicador,ou=Servicos,$Base\" read by self write by users write by * none
-
add: olcAccess
olcAccess: {6}to dn.subtree=\"$Base\" by dn.exact=\"cn=pesquisador,ou=Servicos,$Base\" read by dn.exact=\"cn=replicador,ou=Servicos,$Base\" read by self write by users read by anonymous auth by * none 


dn: olcDatabase={1}mdb,cn=config
changetype: modify
replace: olcDbIndex
olcDbIndex: objectClass eq,pres
-
add: olcDbIndex
olcDbIndex: uid pres,sub,eq
-
add: olcDbIndex
olcDbIndex: cn,mail,surname,givenname eq,subinitial
-
add: olcDbIndex
olcDbIndex: uidNumber eq
-
add: olcDbIndex
olcDbIndex: gidNumber eq
-
add: olcDbIndex
olcDbIndex: dc eq
-
add: olcDbIndex
olcDbIndex: default sub
-
add: olcDbIndex
olcDbIndex: loginShell eq
-
add: olcDbIndex
olcDbIndex: memberUid eq,pres,sub
-
add: olcDbIndex
olcDbIndex: uniqueMember eq,pres
-
add: olcDbIndex
olcDbIndex: displayName eq
-
add: olcDbIndex
olcDbIndex: sambaSID eq
-
add: olcDbIndex
olcDbIndex: sambaPrimaryGroupSID eq
-
add: olcDbIndex
olcDbIndex: sambaGroupType eq
-
add: olcDbIndex
olcDbIndex: sambaSIDList eq
-
add: olcDbIndex
olcDbIndex: sambaDomainName eq
-
add: olcDbIndex
olcDbIndex: entryUUID eq
-
add: olcDbIndex
olcDbIndex: entryCSN eq

dn: cn=module{0},cn=config
changetype: modify
add: olcModuleLoad
olcModuleLoad: {1}syncprov

dn: olcOverlay=syncprov,olcDatabase={1}mdb,cn=config
changetype: add
objectClass: olcOverlayConfig
objectClass: olcSyncProvConfig
olcOverlay: {0}syncprov
olcSpCheckpoint: 100 10
olcSpSessionlog: 100" | ldapmodify -Y EXTERNAL -H ldapi:/// 
fi



echo "Adicionando Entradas"


echo "dn: ou=Usuarios,$Base
ou: Usuarios
objectClass: organizationalUnit
objectClass: top

dn: ou=Grupos,$Base
ou:  Grupos
objectClass: organizationalUnit
objectClass: top

dn: ou=Servicos,$Base
ou:  Servicos
objectClass: organizationalUnit
objectClass: top

dn: cn=Pesquisador,ou=Servicos,$Base
cn: Pesquisador
description: Usuario para pesquisas autenticadas no diretorio
objectClass: organizationalRole
objectClass: simpleSecurityObject
objectClass: top
userPassword: {MD5}F5MpVcmAMa/ZZsja/s+pBQ==

dn: cn=Replicador,ou=Servicos,$Base
cn: Replicador
description: Usuario para replicacao do diretorio
objectClass: organizationalRole
objectClass: simpleSecurityObject
objectClass: top
userPassword: {MD5}F5MpVcmAMa/ZZsja/s+pBQ==

dn: cn=Colaboradores,ou=Grupos,$Base
cn: Colaboradores
gidNumber: 1001
objectClass: posixGroup

dn: cn=Financeiro,ou=Grupos,$Base
cn: Financeiro
gidNumber: 1002
objectClass: posixGroup

dn: cn=Comercial,ou=Grupos,$Base
cn: Comercial
gidNumber: 1003
objectClass: posixGroup

dn: cn=RH,ou=Grupos,$Base
cn: RH
gidNumber: 1004
objectClass: posixGroup

dn: cn=TI,ou=Grupos,$Base
cn: TI
gidNumber: 1005
objectClass: posixGroup

dn: cn=Diretoria,ou=Grupos,$Base
cn: Diretoria
gidNumber: 1006
objectClass: posixGroup

dn: uid=fulano,ou=Usuarios,$Base
cn: Fulano
userPassword:: e01ENX1JQ3k1WXF4WkIxdVdTd2NWTFNOTGNBPT0=
sn: de Tal
givenName: Fulano de Tal
gidNumber: 1001
uid: fulano
uidNumber: 1001
loginShell: /bin/bash
homeDirectory: /home/fulano
objectClass: inetOrgPerson
objectClass: posixAccount

dn: uid=ciclano,ou=Usuarios,$Base
cn: Ciclano
userPassword:: e01ENX1JQ3k1WXF4WkIxdVdTd2NWTFNOTGNBPT0=
sn: de Tal
givenName: Ciclano de Tal
gidNumber: 1001
uid: ciclano
uidNumber: 1002
loginShell: /bin/bash
homeDirectory: /home/ciclano
objectClass: inetOrgPerson
objectClass: posixAccount" | ldapadd -x -D $Account -w $Pass -H ldapi:///
