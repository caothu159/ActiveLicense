# Windows Server

### Upgrade Windows Server lên Full Version

[Install a product key](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys#install-a-product-key)

[Activation.Script.v1.5.rar](https://github.com/caothu159/Microsoft-Activation-Scripts)

```
DISM /online /Get-CurrentEdition
DISM /online /Get-TargetEditions
DISM /online /Set-Edition:ServerDatacenter /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula
DISM /online /Set-Edition:ServerStandard /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula
DISM /online /Set-Edition:ServerEnterprise /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula
```

### kích hoạt các phiên bản window server:

```
slmgr /ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
slmgr /skms kms.digiboy.ir
slmgr /ato
```

#### Windows Server 2022 Datacenter
```
WX4NM-KYWYW-QJJR4-XV3QB-6VM33
```

#### Windows Server 2022 Standard
```
VDYBN-27WPP-V4HQT-9VMD4-VMK7H
```

#### Windows Server 2019 Datacenter
```
WMDGN-G9PQG-XVVXX-R3X43-63DFG
```

#### Windows Server 2019 Standard
```
N69G4-B89J2-4G8F4-WWYCC-J464C
```

#### Windows Server 2016 Datacenter
```
CB7KF-BWN84-R7R2Y-793K2-8XDDG
```

#### Windows Server 2016 Standard
```
WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY
```

#### Windows Server 2012 R2 Datacenter
```
W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9
```

#### Windows Server 2012 R2 Standard
```
D2N9P-3P6X9-2R39C-7RTCD-MDVJX
```

#### Windows Server 2012 Datacenter
```
48HP8-DN98B-MYWDG-T2DCC-8W83P
```

#### Windows Server 2012 Standard
```
XC9B7-NBPP2-83J2H-RHMBY-92BT4
```

#### Windows Server 2008 R2 Datacenter
```
74YFP-3QFB3-KQT8W-PMXWJ-7M648
```

#### Windows Server 2008 R2 Standard
```
YC6KT-GKW9T-YTKYR-T4X34-R7VHC
```

#### Windows Server 2008 R2 Enterprise
```
489J6-VHDMP-X63PK-3K798-CPX3Y
```

#### Windows Server 2008 Datacenter
```
7M67G-PC374-GR742-YH8V4-TCBY3
```

#### Windows Server 2008 Standard
```
TM24T-X9RMF-VWXK6-X8JC9-BFGM2
```

#### Windows Server 2008 Enterprise
```
YQGMW-MPWTJ-34KDK-48M3W-X4Q6V
```
