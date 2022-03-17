# Windows Server 2019

### Upgrade Windows Server lên Full Version
[Install a product key](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys#install-a-product-key)
```
DISM /online /Set-Edition:ServerStandard /ProductKey:WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY /AcceptEula
```


### Windows Server 2019 Datacenter:

```
slmgr /ipk WMDGN-G9PQG-XVVXX-R3X43-63DFG
slmgr /skms kms.digiboy.ir
slmgr /ato
```
 

### Windows Server 2019 Standard:

```
slmgr /ipk N69G4-B89J2-4G8F4-WWYCC-J464C
slmgr /skms kms.digiboy.ir
slmgr /ato
```
 

### các phiên bản khác window server 2019 khác:

```
slmgr /skms kms.digiboy.ir
slmgr /ato
```
