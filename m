Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4157053lff;
        Mon, 13 Jan 2020 05:58:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjE5NmMrD4W0S55IxjXJOic09nJJ4DziPZDc2S7A6s+JnHE4btiw+gyBT/RdwrUCjv0uiR
X-Received: by 2002:a17:906:15d8:: with SMTP id l24mr16852498ejd.170.1578923902600;
        Mon, 13 Jan 2020 05:58:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578923902; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTglY9Z6YQrr7LojtI3F1Rqsm46XJPflfcwhB7ENimKaurya8Kgu9o/26K1cys11sb
         nfh6yi37V1qRp2EADQ4WXLK5f5URgnhoRe1jO96OKy4RRWoVZaHuj+jK5mPTQwcFuOPn
         FPOvt4i6DQtBR20rQhKC2ESDlqMyn2TTpIrGYrcjf6A92loNsGev1DVPEwiDK46kdSWl
         20iXglpGjZEpGWGJBFSpQX2ls225PyqWza4u+AMWfTPcrc8vFQiVG0BZPY3/RAiKSaqh
         zIkEV5ke3ZFTA1e5UFwizYyfMj3O2DVMAQSAj5n0F1nxgc0z6g7JGftD6boRFthc1Qos
         AFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=gxT7YGoCJkWNsdoKmEOUs4+BoyujG6PcQZRQBm/TQYk=;
        b=fN3oLkElL6oI5foQW7hdYh+5zyBy4w6iu+W0QJ6z1Tgo8tHt507DvZ2dXN9x0BBYYT
         BNhP34zpA2Y04ZM41MclSTMaPUlkMmBmfeZbf952jAP1XfFeATQKLPngEGr/50P3ZM5x
         SLvU7KlTnAsYnIJORBQi0texM5kQV3UCNbGJGUIq2j3IACQhv8UWEG/Xe5iLTTN0gUFQ
         z+a7bJchia5ocKBcx/jJSQWnLmb32emlRPAZNuqb5u95hLQdkubhgREETEGTAXnahknb
         pHyARYkvC4TeHycThWG6daYQOiq3cIhKaV/WOEbJoY4pxEqOOf1NwCmZ/PwnLtRNeon+
         pTXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si6890981ejj.363.2020.01.13.05.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 05:58:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir0EX-0007Iu-BI
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 08:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ir0EN-0007HU-S2
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:58:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ir0EM-0000qw-9T
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:58:11 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:54242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ir0EL-0000ko-VR; Mon, 13 Jan 2020 08:58:10 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 15102F024933C4CF919E;
 Mon, 13 Jan 2020 21:58:03 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 13 Jan 2020
 21:57:56 +0800
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200113130802.5a961482@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <b5d91ae3-bf37-d27e-264d-ea21ef23776b@huawei.com>
Date: Mon, 13 Jan 2020 21:57:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113130802.5a961482@redhat.com>
Content-Type: text/plain; charset="gbk"; format=flowed
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aW2vczG32dRA


=D4=DA 2020/1/13 20:08, Igor Mammedov =D0=B4=B5=C0:
> On Thu, 19 Dec 2019 14:47:59 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> According to ACPI spec, _ADR should be used for device which is on a
>> bus that has a standard enumeration algorithm. It does not make sense
>> to have a _ADR object for devices which already have _HID and will be
>> enumerated by OSPM.
>>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Are you sure it's does not make sense?
> Have you checked commit f264d51d8, that added _ADR?

I searched in SPCR spec and ACPI spec, but didn't find such requirement=20
for serial port device description.

Hi Andrew,

Could you help to explain the reason?

Thanks,

Heyi



>
>> ---
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-devel@nongnu.org
>> ---
>>   hw/arm/virt-acpi-build.c          |   8 --------
>>   tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
>>   tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
>>   tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
>>   4 files changed, 8 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 9f4c7d1889..be752c0ad8 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const Me=
mMapEntry *uart_memmap,
>>                                AML_EXCLUSIVE, &uart_irq, 1));
>>       aml_append(dev, aml_name_decl("_CRS", crs));
>>  =20
>> -    /* The _ADR entry is used to link this device to the UART describ=
ed
>> -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR.
>> -     */
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base))=
);
>> -
>>       aml_append(scope, dev);
>>   }
>>  =20
>> @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const Me=
mMapEntry *memmap,
>>       aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>>       aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
>>       aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device=
")));
>>       aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>> @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const M=
emMapEntry *gpio_memmap,
>>   {
>>       Aml *dev =3D aml_device("GPO0");
>>       aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>  =20
>>       Aml *crs =3D aml_resource_template();
>> @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>>   {
>>       Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
>>       aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>       aml_append(scope, dev);
>>   }
>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>> index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf5051=
9a6aea296e5e0f1e0c 100644
>> GIT binary patch
>> delta 72
>> zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=3DgU!!5x$Pt+
>> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8
>>
>> delta 94
>> zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao
>> tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_
>>
>> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DS=
DT.memhp
>> index 69ad844f65d047973a3e55198beecd45a35b8fce..6e5cc61977e4cd24f765fe=
c0693f75a528c144c1 100644
>> GIT binary patch
>> delta 72
>> zcmX>#i*fTTMlP3Nmk?uL1_q|eiCof5eHSLGt1wzk^tIeLL4lL8ZSqD=3DgU!!5U7RH)
>> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>03)CjmjD0&
>>
>> delta 94
>> zcmdlyi}BPfMlP3Nmk=3D*s1_q}3iCof5t(PXMt1!8;O!Tqj;)r*23F2X3VBp-?s=3D&$E
>> tGkF=3DO0W(l&^JPwVXL<R6@E|9Scn?n(-T=3DP<17`zg2CxPo8S3f6006qZ7#siq
>>
>> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/=
DSDT.numamem
>> index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf5051=
9a6aea296e5e0f1e0c 100644
>> GIT binary patch
>> delta 72
>> zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=3DgU!!5x$Pt+
>> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8
>>
>> delta 94
>> zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao
>> tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_
>>
>
> .

