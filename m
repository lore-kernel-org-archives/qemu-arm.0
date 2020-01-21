Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp988185lfp;
        Mon, 20 Jan 2020 19:49:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxX0WkBH9Z9wedUxAKidenqLVqmVuDzKmBzx5/l3XIya7vvev6emwPpI0kuNWGmVTxbVsYm
X-Received: by 2002:a05:6214:bc3:: with SMTP id ff3mr2810348qvb.155.1579578541738;
        Mon, 20 Jan 2020 19:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579578541; cv=none;
        d=google.com; s=arc-20160816;
        b=weCVpuTN1ZoaPuS9D2n88aKAq6nSI6ALY46EKyABb51o9nIQ/iN7kcruHqde96EExO
         jm8bAknebVMrYFTSHBLgLlZaLmdbv4pCobxKov0E4/tF4/9S2EuS+ktB9ltMmsJVecQg
         smWsWskNaB8XtHLDMrWCdcZx3ekl0pcHu3k2dSq8lnL3OluKoeKlIAe7pUQhEvSfyQgL
         PIn9UPP2ssObV7/IBvlewjXtn2v05PRBs/2+mQ/JB46zsYg8gFyLG63xWyc4Trj7jW1d
         3H8zft7yNw21TcaQ2bOUWVNccIfmZ3X0YPhWBjHV556rN+iFRseg4gjPAb7CuWXbzmKX
         lfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=y9KcScqgkHBgRuD0KfsqqxYLtKIhjeF8+9JB3noN9bA=;
        b=s1kxLx14rQwYuYOytWO5qJXuq+YQrteYbLNmas0hD5Yv3Ol7Zi2YE0bdLY5cZiqdnh
         3ECLmGu2JppGWluEp9tzoaSEBTJ3AuLhU191PvnV7NhHUwL/UIdp6j8YZ1ch8WU0Uu/f
         LEMlFxco36P6iz0cBEpQlMj5kqov4SUVhwUVkRKWJkgDR1cbjVKFiV4vpiZzVBussfxy
         9yDIdc/hdWt/X0MpB5GvVg22wfciH5GT+6sjxSw7CCMaLUh8owT72Q8flMCuMqxYsNv1
         E/xtjKpD8U1ERKr7E+rUXDmrk6EiegcmWMMZe1iwu7l8TU6Dr6YXz8/xxQRov1bbP7YV
         u/VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si13866372qta.106.2020.01.20.19.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 19:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itkXE-00078h-TM
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 22:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1itkX2-00075m-Nu
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 22:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1itkX1-0000lS-C2
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 22:48:48 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:38382 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1itkX1-0000gv-1A; Mon, 20 Jan 2020 22:48:47 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4110858C8C31749A7AB5;
 Tue, 21 Jan 2020 11:48:39 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Tue, 21 Jan 2020
 11:48:29 +0800
Subject: Re: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0"
 from PCI0
To: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-2-guoheyi@huawei.com>
 <20200113133702.1dea867b@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <613eaf96-c49d-11ac-1204-8c762a8295cc@huawei.com>
Date: Tue, 21 Jan 2020 11:48:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113133702.1dea867b@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i0VTe0jElfFj

Hi Julia,

Could you provide some comments or advice?

Thanks,

Heyi

=D4=DA 2020/1/13 20:37, Igor Mammedov =D0=B4=B5=C0:
> On Thu, 19 Dec 2019 14:47:58 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
>> so simply remote it.
> Could you make commit message more concrete so it would say
> why it doesn't make any sense.
>
> It seems to be there to describe root port,
> I'd rather have PCI folk ack if it's ok to remove it.
>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>>
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
>
> .

