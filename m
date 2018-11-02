Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1908357wro;
        Fri, 2 Nov 2018 03:06:15 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fvayvtpu1yw2ghXnokumYFFcjbtn2B8dzORqtIT6ytVEwqcUVCXuk91u6auYFY8vgmA0b2
X-Received: by 2002:aed:21d7:: with SMTP id m23-v6mr10304386qtc.121.1541153175474;
        Fri, 02 Nov 2018 03:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541153175; cv=none;
        d=google.com; s=arc-20160816;
        b=Jgr3Yd256Ezafo8g4mZlG2sHi/kR1ZiWx9cgT9eauOdw5t4drjIIc3KR3GlsKR0YdR
         Gl2A3v7GV4I7Tpc1U7e9gut9Td9Gyyc2vEGvV4KLjHJnrACXLH6e5I6QDhDgrtzHOC7r
         UJtXHCAD4jjITCU/Q4wZdDITceytANpSvlSYyRmkarsaT6trMhHHy1QcUII1qxNxEtU8
         OP/BWk1uYXrox0dzShi3VUxBgS4j9sjW3kxi13qTg9d+KqTxWrJmmUeRRhVRyZxnBvLR
         ysayVbTTNfV88XX4zEOZLuP85hHitvgUGUrOrV0/GLDEj2M0JgumPRal3Ayowph+pBPf
         /78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature;
        bh=FBJ6sibVIhPogS6QfhgQGNGKm0j6tgLkRwhMDCu63h0=;
        b=tiKnHt0X28m/yShrRWlxfKDcBGZN3zLurojf5Hh+fukiqPJwk2h55wjXEJWBX4LlzZ
         8MQqBj2PNlUdQ6BgbFAkG7iwcAEpQ794nBGp801hyxrVknjlsUse3hQWWsjCerzkeMNy
         2RYDg9iE4yfrdq0E5TILaDB+ZMb2e9niI6G7ujtHJKwUGZ/QhoDrXOlj7BN2w8UAw0/V
         QtVYvE5pR8sdV/kEH638CTi8G4nQoKSgnMslll/Oej4MrZS/X6lV/0ViRz0JbI9+XIT+
         zpjQUsK2Fi1gzJqHCas4gMOsSlHnqDQ++QCY1vxwfigqnAjZ32nQ6lWpmercBligWlH/
         YWsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oo36oBD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w1si461941qtj.360.2018.11.02.03.06.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 03:06:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oo36oBD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIWLH-0006hA-1n
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 06:06:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIWL8-0006gx-LE
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 06:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIWL3-0004ra-Pe
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 06:06:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40525)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gIWL3-0004r5-KG; Fri, 02 Nov 2018 06:06:01 -0400
Received: by mail-ot1-x341.google.com with SMTP id m15so1204377otl.7;
	Fri, 02 Nov 2018 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FBJ6sibVIhPogS6QfhgQGNGKm0j6tgLkRwhMDCu63h0=;
	b=oo36oBD4b0LJVG65VKtm2gHwZqv33izoWm5fmTt3JrSbfVGnUtMe3LzNVPzm2H53IC
	uLvjTxMq4/CKJKlUv/D4GE7Zh/42DtEuVFIpH99owtR+kQWrNfb9ftxZFplGduWNZukZ
	sw37Zq26y4o1Y6DReSKg/EPojO3ZE9S4uN6aOLv6MkmNhPM/ttQR1H2zQIyGVroUh93I
	4eUB3flnUe9yXmxKbr6318AXzE7R1xYRpZVaXxnajh+oaEyg+B33RKv1lpMgxhMmZU9M
	vkov4u94lW1+0AYuEfIRKEQpfR1vqIr2ZXCgVStng39QaK9ShPgSoXop8sZbShZ3NuNS
	Q8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FBJ6sibVIhPogS6QfhgQGNGKm0j6tgLkRwhMDCu63h0=;
	b=BFglQMtPifaE/nZLk36V3r5XFiCLS3wWtbsASbTBgbF3FoDuO54g1GV45LNZRJzsCF
	W8I0OrR5MNsWJHSZ+yszXpqt+Ht5u2KCsZExhyh8/CYjNNmEyo6SeaGueLnAH9rS+j6v
	Ls9ZBQoZ1jKCStiIVlyoAk1jG7lzGryEwnTBMN9jjakVV0bo/usQmHY16UeDtqltaAWR
	VaA5FTFLkJ2XaCbCWCITqKVGNlEYaKiTr6/IxTNhleK1FX7ZIf6+6EEdfwb+hgQnkmZF
	c6blfcy194V3vIFfr8HkG1g8eK8mZhMC+KJe+bschnm1CRdRYtSo+opwBVgn+Y8bGZK9
	Zv0g==
X-Gm-Message-State: AGRZ1gIvdkn+QGCy2nZ/kj/4UC7x7Xr5h4+cH84i0uXi2a0a0WKHVoPI
	KDHPmDxRQ+vedxI6Ykg/XvxilSGv5HI=
X-Received: by 2002:a9d:1f3:: with SMTP id e106mr1853581ote.369.1541153160788; 
	Fri, 02 Nov 2018 03:06:00 -0700 (PDT)
Received: from [30.43.112.38] ([47.89.83.58]) by smtp.gmail.com with ESMTPSA id
	z199-v6sm14041472oig.32.2018.11.02.03.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 03:05:59 -0700 (PDT)
From: Shannon Zhao <shannon.zhaosl@gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-6-sameo@linux.intel.com>
	<c88b4769-a517-36da-b181-e59a4380bcea@gmail.com>
Message-ID: <46c01c7d-cab1-8096-821d-dd77c62b240f@gmail.com>
Date: Fri, 2 Nov 2018 18:05:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <c88b4769-a517-36da-b181-e59a4380bcea@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 05/23] hw: arm: Switch to the
 AML build RSDP building routine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GgwmfQQ4wEZY



On 2018/11/2 17:35, Shannon Zhao wrote:
> 
> 
> On 2018/11/1 18:22, Samuel Ortiz wrote:
>> We make the ARM virt ACPI code use the now shared build_rsdp() API from
>> aml-build.c. By doing so we fix a bug where the ARM implementation was
>> missing adding both the legacy and extended checksums, which was
>> building an invalid RSDP table.
>>
>> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 31 +------------------------------
>>   1 file changed, 1 insertion(+), 30 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 0ed132b79b..0a6a88380a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -35,6 +35,7 @@
>>   #include "target/arm/cpu.h"
>>   #include "hw/acpi/acpi-defs.h"
>>   #include "hw/acpi/acpi.h"
>> +#include "hw/acpi/aml-build.h"
>>   #include "hw/nvram/fw_cfg.h"
>>   #include "hw/acpi/bios-linker-loader.h"
>>   #include "hw/loader.h"
>> @@ -366,36 +367,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>>       aml_append(scope, dev);
>>   }
>> -/* RSDP */
>> -static void
>> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned 
>> xsdt_tbl_offset)
> Note: here we use xsdt table not rsdt for ARM. After your change which 
> assigns xsdt table address to rsdt_physical_address, it doesn't work.
> 
Oops. I didn't notice your patch "[PATCH v4 04/23] hw: acpi: Implement 
XSDT support for RSDP".

Thanks,
Shannon
