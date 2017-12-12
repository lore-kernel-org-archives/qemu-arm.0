Received: by 10.223.159.74 with SMTP id f10csp3676744wrg;
        Tue, 12 Dec 2017 03:06:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBotcJDNnBjjRnKD33PwW3W/374qHJ19VxgzhwMU5rMWlGS4gV7FJifOkRyalTaGnnqTSJV0H
X-Received: by 10.129.181.82 with SMTP id c18mr889248ywk.455.1513076818555;
        Tue, 12 Dec 2017 03:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513076818; cv=none;
        d=google.com; s=arc-20160816;
        b=Fddn9A444hRnoPPrb4kFGZ3QoaOvcougJoXw09AkA+M1ytjgoOLNM1vrc03zf+nLpj
         Byo9qBgwX7byalphPVD4GfMfv8PPsPbC2kN6bg4tgym5is1W2Q7V5HvIdvCBY0E9ZEMv
         +bPC4iC8Qb09JE02/GSCUgWi/LfDkPRSA8MCms07SYPZxF8QsTjrNWR/FoWdTUWddxGJ
         ylbU5U9c3/cxsNgHdzwB8A3r/xpMqp5YdTvgntD08CUndzWnjI2/UO0yUVjEHHJVTblH
         rmn5QALoP54LIokPS7AnFFNLOxM6tEze3j9nOjAwJ+IIiy1vZA4vLKbkm1UkDd9oS3hp
         vb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=QOQ3iNRQCb6roTWkaa4i33Dga1TPikV7iFbWbpao1iE=;
        b=pnK/lMav/5atlfMRJkQXjyYo4fFTg4a3L31hUp7s4zeM2m/PwvsflA6QiLPz5EhgvO
         DfIY8z7sD+Pj6zL6VKScGRezrfrbqfOu36Kciqf04dLsmO27tLyIMpGn5mfoBR+9RjzN
         p2qp6zRSz8fz10NnMOr4+LFPLwYGlrW5gm/RLYWMyKGAJKe/T/Z7uF1Tq2J/gKSeWls8
         RmzGIgC9WBYk6ngPKlkMZR8+wDwWueHXO2BWdD/5OyWrWQ3y4LMdzRLBn+4ld3aeJibw
         OX63yhtB4eptfEWosjCGnlMZr4nuwyACex/zkZcbM8h7Rjyuig9yPl4+rUGlWjYybVAu
         phzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l132si3272485ywc.172.2017.12.12.03.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 03:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOiOo-00079U-2R
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 06:06:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOiOg-00078H-Mj
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:06:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOiOa-0004EI-OX
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:06:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eOiOa-0004Dj-Fe; Tue, 12 Dec 2017 06:06:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18829C058EB0;
	Tue, 12 Dec 2017 11:06:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-105.rdu2.redhat.com
	[10.10.120.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9556E614E2;
	Tue, 12 Dec 2017 11:06:40 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ac182406-8011-9f19-38e7-37328434095b@redhat.com>
Date: Tue, 12 Dec 2017 12:06:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <5A2F6ED9.5030605@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 12 Dec 2017 11:06:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: inkhtrz4y3L0

On 12/12/17 06:53, Shannon Zhao wrote:
> 
> 
> On 2017/12/8 23:02, Peter Maydell wrote:
>> Add the second UART to the ACPI tables.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Pure guesswork, as I don't have a UEFI setup to hand and
>> am not familiar with ACPI table formats either...
>> ---
>>  hw/arm/virt-acpi-build.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3d78ff6..a38287b 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -689,6 +689,7 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
>>  static void
>>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>      Aml *scope, *dsdt;
>>      const MemMapEntry *memmap = vms->memmap;
>>      const int *irqmap = vms->irqmap;
>> @@ -706,6 +707,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>> +    if (!vmc->no_second_uart) {
>> +        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART_2],
>> +                           (irqmap[VIRT_UART_2] + ARM_SPI_BASE));
>> +    }
>>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>>
> Reviewed-by: Shannon Zhao <zhaoshenglong@huawei.com>
> 

(Responding here so I don't have to manually update Shannon's email
address while replying to patch 3/3 directly.)

acpi_dsdt_add_uart() does:

    Aml *dev = aml_device("COM0");
    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0011")));
    aml_append(dev, aml_name_decl("_UID", aml_int(0)));

The device name should be unique. Plus, within the same _HID, the _UID
should be unique as well. I suggest adding another unsigned parameter to
acpi_dsdt_add_uart(), and hooking it into COMx and _UID.


BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
can see from the firmware code, the firmware will use the PL011 whose
description comes first in the DTB (and ignore the other PL011), in an
fdt_next_node() traversal. Is that OK for the intended use case?
(Perhaps I should have asked this under the second patch, which updates
the DTB generator.)

Thanks,
Laszlo
