Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8310815lff;
        Thu, 16 Jan 2020 04:38:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+7Lfa3qpzOYDaR1eh8JFaXdlHEXxVca33s0GhtNzSHVhDfOtQcvpXOr6tZQeGHAv0Cst1
X-Received: by 2002:a50:f382:: with SMTP id g2mr36263482edm.260.1579178285589;
        Thu, 16 Jan 2020 04:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579178285; cv=none;
        d=google.com; s=arc-20160816;
        b=U/LpP95wOroVW4q1q8XuI34WeGlz930HMgMhVV7hLY2IS1BNTBGEhcDcVAPEn9QsRx
         3PdHT5OovpTY6uIs0Z76vSHtXlXFV81jYd4iYshZ74SN1xIdf0A4MLU0DBc0OAcN2Ogx
         KaxPOl6KUA+mYneE1SJzYxCqKjv8qF3DSwOeZ/aiVsRdqm5QXijKbGQ8LcOL3oWiqJpK
         46lWckqsVV2xv6vuUXlH0PjFdi+2oYL7u91RbvRDl6p6a2MinF5/N7vN40W4fRu08RUe
         TDaeE6UDc1a/Nv0XxrRUW6kYzxw5+Dqsr37G05iB5ZMFyr/Aw34ype96sAZ4S+qcRsxW
         CG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=p9+sQuwUvImEm3U8dWONjcope8Kmar7oTAj3AbibbOM=;
        b=umAo0Deh/FYJcBtdXxrU8pPNhMT0hw8NsTJdVOpX/QZmWIl4ygT5KR8nYa8LIRQKFW
         WcCQA9z0mFSfA/X1nGogTZ0tSHsnF1lrjhzuxrWW6XZ7anH8fCAz58VqB97InstiPKe4
         cg3Fo+sY74b/1dmakqdgX4QJ1BX/eRcF/zU0PLvRg4vjRx4H4CaBFf0S/LDKdwlSMiUO
         AGN7dlJfGp3lUmy8e5oTS1T62sRAlEDrAZ6ktJeikFWRKKQsWp84OSWCzNT3GhYwtEL+
         zpX92rHcS6FS+M4X1Ek+EhkPjNPnkFtBy9aqRmour+ixLI8thwtSQaKiQ99OgNbf2D/V
         mnvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id us5si13611056ejb.142.2020.01.16.04.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 04:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is4PU-000651-Dg
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 07:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1is4OE-0004wn-IT
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 07:36:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1is4OA-0006ui-VK
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 07:36:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51472 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1is4Ny-0006oL-5j; Thu, 16 Jan 2020 07:36:30 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 72E0A1E0430687E18D8E;
 Thu, 16 Jan 2020 20:36:24 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 16 Jan 2020
 20:36:17 +0800
Subject: Re: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0"
 from PCI0
To: Igor Mammedov <imammedo@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-2-guoheyi@huawei.com>
 <20200113133702.1dea867b@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <1089b0d5-548e-da54-b59d-484517843411@huawei.com>
Date: Thu, 16 Jan 2020 20:36:16 +0800
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
X-Received-From: 45.249.212.32
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBzpUYCUnUCj


=D4=DA 2020/1/13 20:37, Igor Mammedov =D0=B4=B5=C0:
> On Thu, 19 Dec 2019 14:47:58 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
>> so simply remote it.
> Could you make commit message more concrete so it would say
> why it doesn't make any sense.

The reason I'd like to remove it is that I never see a reason that it=20
should be there :)

1. I searched through ACPI spec and PCI firmware spec, but didn't find=20
any reason for its existance (might miss something).

2. We don't have such "PR0" device on PCI host bridge object on physical=20
arm64 machines and these platforms work well.

3. The VM also works well after removing this device.

4. This device looks strange to only have an identity (_ADR) but not any=20
other attribute; also this device was introduced in the initial commit=20
without any special comment.

Thanks,

Heyi


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

