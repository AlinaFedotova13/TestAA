#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

//Контекст:
//	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: заполнение справочника Номенклатура 
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Наименование" + $Шаг$' в переменную "Наименование"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                               | 'Unit'                                                              | 'MainPricture'                          | 'Vendor'                                                               | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | '{"e1cib/data/Catalog.ItemTypes?ref= " + StrReplace(New UUID, "-", "")}' | '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | '{"e1cib/data/Catalog.Partners?ref=" + StrReplace(New UUID, "-", "")}' | '58791'  | ''            | '$Наименование$' | ''                 | ''               | ''               |          |          |          | 0.21     |         |

		И я перезаполняю для объекта табличную часть "AddAttributes":
		| 'Ref'                                                               | 'Property'                                                                                               | 'Value'                                                                                     |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '{"e1cib/data/ChartOfCharacteristicTypes.AddAttributeAndProperty?ref=" + StrReplace(New UUID, "-", "")}' | '{"e1cib/data/Catalog.AddAttributeAndPropertyValues?ref=" + StrReplace(New UUID, "-", "")}' |



				
					
				
			    
