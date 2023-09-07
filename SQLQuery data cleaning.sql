select * from NashvilleHousing

select SaleDate, CONVERT(date, SaleDate) as SaleDate2 from NashvilleHousing

alter table [dbo].[NashvilleHousing]
add SaleDate2 date;

update NashvilleHousing
set SaleDate2 = CONVERT(date, saledate)

select PropertyAddress from NashvilleHousing where PropertyAddress is null
select * from NashvilleHousing --where PropertyAddress is null
order by ParcelID

select a.ParcelID, a.PropertyAddress,b.ParcelID, b.PropertyAddress, isnull(a.propertyaddress, b.propertyaddress) from NashvilleHousing a
join NashvilleHousing b on a.PropertyAddress = b.PropertyAddress
and a.[UniqueID ] <> b.[UniqueID ] 

update a
set propertyaddress= ISNULL(a.propertyaddress, b.propertyaddress) from NashvilleHousing a
join NashvilleHousing b on a.PropertyAddress = b.PropertyAddress
and a.[UniqueID ] <> b.[UniqueID ]

select PropertyAddress from NashvilleHousing

select propertyaddress, SUBSTRING(Propertyaddress, 1, CHARINDEX(',', propertyaddress) -1) as Address,
SUBSTRING(Propertyaddress, CHARINDEX(',', propertyaddress) +1, len(propertyaddress) )  as City
from NashvilleHousing

alter table [dbo].[NashvilleHousing]
add Address nvarchar(255);

update NashvilleHousing
set Address = SUBSTRING(Propertyaddress, 1, CHARINDEX(',', propertyaddress) -1)

alter table [dbo].[NashvilleHousing]
add City nvarchar(255);

update NashvilleHousing
set City = SUBSTRING(Propertyaddress, CHARINDEX(',', propertyaddress) +1, len(propertyaddress) )

Select OwnerAddress from NashvilleHousing

Select PARSENAME(REPLACE(OwnerAddress, ',', '.') ,3) as OwnerAddress2
,PARSENAME(REPLACE(OwnerAddress, ',', '.') ,2) as OwnerCity
,PARSENAME(REPLACE(OwnerAddress, ',', '.') ,1) as OwnerState
from NashvilleHousing

alter table [dbo].[NashvilleHousing]
add OwnerAddress2 nvarchar(255);

update NashvilleHousing
set OwnerAddress2 = PARSENAME(REPLACE(OwnerAddress, ',', '.') ,3) 

alter table [dbo].[NashvilleHousing]
add OwnerCity nvarchar(255);

update NashvilleHousing
set OwnerCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') ,2) 

alter table [dbo].[NashvilleHousing]
add OwnerState nvarchar(255);

update NashvilleHousing
set OwnerState = PARSENAME(REPLACE(OwnerAddress, ',', '.') ,1)

select * from NashvilleHousing

select DISTINCT(soldasvacant), COUNT(soldasvacant) from NashvilleHousing 
group by SoldAsVacant order by 2

select SoldAsVacant 
,case when soldasvacant = 'Y' then 'Yes'
 when soldasvacant = 'N' then 'No'
 else soldasvacant
 end
from NashvilleHousing

update NashvilleHousing
set SoldAsVacant = case when soldasvacant = 'Y' then 'Yes'
 when soldasvacant = 'N' then 'No'
 else soldasvacant
 end 


with RowNumCTE as (
select par from NashvilleHousing
