Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2429464lfp;
        Tue, 21 Jan 2020 22:39:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHVJUj+YSrt7a61MKEytqVBVK+oY97KiE+zmx26mbOwjVNVmbKP2o/9vI5Li+UPGVcgiI0
X-Received: by 2002:a17:906:580a:: with SMTP id m10mr1315949ejq.296.1579675162969;
        Tue, 21 Jan 2020 22:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579675162; cv=none;
        d=google.com; s=arc-20160816;
        b=P6rpET4t9elEZyfLDX6ORx0olfqz3cX11gjWNGFCMKuTz1AgtG2SexFSQZn8DA1EUg
         Bwb06ZziqSdQY2wpzojwAh6GwPP/n1GFiWvlJzp6JFlZ8tdum10BMQg8kerZ6xAYS4pz
         so3wEZ9S6akSKf9snvx1dgq2X9ex+9SO4ChQcOLw9lJ0inalFpoWD+9WO1ww+uLnRtQL
         sVF85zY8tRM7JoKtEQ7ZRITjF0uPCE4jg107BpsQR+ZQZNKr7F1fG2B4DcPAy0u8PF0h
         W36bkentAUxFAFowc64vg7FHBmBATWgo3X2Q2VyBXTrwrTq1ari21Kb1hdoEDZriOgiz
         qFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=S4ArAae7HgxvyRSgZN0KGGi2BBlBnicogDVMV9fH9P0=;
        b=nQVkYGNYfAQEIQrZVL5qyKQeuEarAMK7uljH4quniZNqwtym560UnEMvQWh1jxDv/g
         6qZQuEVc4kvOiFvFdqZwfFK5UqgZpuClxyhnvv3tqm3DNuoOfcudGnWLrTyISlBd9PwX
         g+kFvGRCHDeurSwYjIu1JMSNrgG3NN190NYnmXrrr3d6uDICP32EecDjjpaUJVQmgi8L
         F39Cq6X1k06im9H7Sn+ldT20IjMp6yaEa/I1vViO+vAiS0Y4elbPG7Lvfn6czCqmqhqP
         TmUZ0grxNnmSvxlTvvgbz7qR8XN12bBwZN1/yg6+k9NWuDyS7JjDmPngLAB4miU6pN2H
         ZOuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si25346455edp.32.2020.01.21.22.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 22:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iu9fd-0000Sp-Pd
	for alex.bennee@linaro.org; Wed, 22 Jan 2020 01:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iu9fV-0000Sd-8b
 for qemu-arm@nongnu.org; Wed, 22 Jan 2020 01:39:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iu9fT-0004fJ-Uw
 for qemu-arm@nongnu.org; Wed, 22 Jan 2020 01:39:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:35300 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iu9fT-0004YR-Jw; Wed, 22 Jan 2020 01:39:11 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 33DF92AD10A168568D0B;
 Wed, 22 Jan 2020 14:39:01 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 14:38:54 +0800
Subject: Re: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0"
 from PCI0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-2-guoheyi@huawei.com>
 <20200122003809-mutt-send-email-mst@kernel.org>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <0db6ff09-3575-465f-0c22-f47c4c056da5@huawei.com>
Date: Wed, 22 Jan 2020 14:38:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200122003809-mutt-send-email-mst@kernel.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uraqHuyGVqUE


=D4=DA 2020/1/22 13:39, Michael S. Tsirkin =D0=B4=B5=C0:
> On Thu, Dec 19, 2019 at 02:47:58PM +0800, Heyi Guo wrote:
>> The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
>> so simply remote it.
>>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> So given this has no methods except _ADR, I think it's
> safe to remove:
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Thanks.

I'll send v2 to fix up the commit message, and follow the new work flow=20
we disscussed earlier. I found some more issues in ARM ACPI, which will=20
also be included in v2.

Heyi

>
>
>> ---
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-devel@nongnu.org
>> ---
>>   hw/arm/virt-acpi-build.c          |   4 ----
>>   tests/data/acpi/virt/DSDT         | Bin 18462 -> 18449 bytes
>>   tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19786 bytes
>>   tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18449 bytes
>>   4 files changed, 4 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index bd5f771e9b..9f4c7d1889 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const M=
emMapEntry *memmap,
>>       aml_append(method, aml_return(buf));
>>       aml_append(dev, method);
>>  =20
>> -    Aml *dev_rp0 =3D aml_device("%s", "RP0");
>> -    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
>> -    aml_append(dev, dev_rp0);
>> -
>>       Aml *dev_res0 =3D aml_device("%s", "RES0");
>>       aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")=
));
>>       crs =3D aml_resource_template();
>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>> index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3=
d32ec856feb388be4c 100644
>> GIT binary patch
>> delta 39
>> vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)
>>
>> delta 50
>> zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I
>> G{V4!>hYx%J
>>
>> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DS=
DT.memhp
>> index 41ccc6431b917252bcbaac86c33b340c796be5ce..69ad844f65d047973a3e55=
198beecd45a35b8fce 100644
>> GIT binary patch
>> delta 40
>> wcmcaUi}BPfMlP3Nmk=3D*s1_q}3iCof5t(P{ccXBfI+}XT|v(|RAjk`1(02g)*ivR!s
>>
>> delta 51
>> zcmX>#i}Cs_MlP3NmymE@1_mbiiCof5O_w*ScXBdy-rc;3v(}c2J1D>)o+IATC1|sb
>> HyBr$;t7;Fc
>>
>> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/=
DSDT.numamem
>> index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3=
d32ec856feb388be4c 100644
>> GIT binary patch
>> delta 39
>> vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)
>>
>> delta 50
>> zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I
>> G{V4!>hYx%J
>>
>> --=20
>> 2.19.1
>
> .

