Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp12644407wrx;
        Wed, 27 Feb 2019 12:14:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbhKzxZ4+X5hrX6262ZO7pUMJ4QuKo+tj+wt9khy3gXF9t5cuwkmBZfMi0yUVq+BNy9/kG8
X-Received: by 2002:a5b:1c9:: with SMTP id f9mr3138259ybp.234.1551298473376;
        Wed, 27 Feb 2019 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551298473; cv=none;
        d=google.com; s=arc-20160816;
        b=TKb6qEYka3krOXL6vzm6IeKQjy+qmGZpiUqYwDX9SmviFr87PAEd7hxoY5BqPNCoLt
         Fol3CSxOZthyzKGP4pWSwXu4xPfgUns9XBDKkA7koTlYp86T/psVQdz+YAr43R0J9Uxm
         oQuvfqNUXQYVYZmQd6bxJ9vUul5Qv+v4wnwHowfbcOkeD93YqY2WzATlbxtEpnmQCnBb
         UW1144S/tVzdKuA1TSli2QrbUwg5R34VuqsXHylO2/0xs+DpOcDVbl3dxw9xzXrIy0Ly
         VNUKKN4Nv/2R9+J64bTCeYPp9+XR8uQgtElnjwvNs/tmYC7Zc1xkWI91ULohntroa0fU
         9u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=LNli0rWhWqUhbUrATIqJePJEV4QbkEB7poQCQ+6vv4I=;
        b=iMlgEvU652kTkbMgfSOGmuuU/8q2TPaHiQfBkYx1q7EVl9o/hS6bZ9Bwx/X5GQNTHM
         I0E/duSS7r7fu/hePVHMBy04GNJ3y3waPu3gFawSqg3C76wD0OhHWlHjKvVxqY3cJ+IY
         kxRqYcz0g/Pc3CuMe3sYLzH8hrAA5cmD1giOzr/H1J7kKCBwqdarnni3jPHS2pjT8IHR
         f+bZEpLBMHb9w5sx20VQ5ndem/FVBEsWXZHSYLcZsB1AjDZprBLwYlwyTH7XzR94GIS7
         xS75vxDRaXFCHE2951+PaTo1UK+k+Pv1Jq2FQOnXKTbuBF75UOPbP2Nskps4P00rX01A
         7AaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si9814166yba.36.2019.02.27.12.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 12:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gz5b6-0005mK-Rq
	for alex.bennee@linaro.org; Wed, 27 Feb 2019 15:14:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gz5ax-0005lq-VW
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 15:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gz5aw-0002jB-4t
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 15:14:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1gz5av-0002id-FP; Wed, 27 Feb 2019 15:14:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28D37C05FF9D;
	Wed, 27 Feb 2019 20:14:19 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-125-251.rdu2.redhat.com
	[10.10.125.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76A4119C71;
	Wed, 27 Feb 2019 20:14:14 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Auger Eric <eric.auger@redhat.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
	<892e3eb7-66f5-92a3-5891-de8665fc984a@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D6875@lhreml524-mbs.china.huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d3c99948-2fdb-f345-8b22-03a7e181122c@redhat.com>
Date: Wed, 27 Feb 2019 21:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392D6875@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 27 Feb 2019 20:14:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
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
Cc: "Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FlLxFDR5x55n

On 02/27/19 13:55, Shameerali Kolothum Thodi wrote:
> Hi Laszlo,
> 
>> -----Original Message-----
>> From: Shameerali Kolothum Thodi
>> Sent: 25 February 2019 09:54
>> To: 'Laszlo Ersek' <lersek@redhat.com>; Auger Eric <eric.auger@redhat.com>;
>> shannon.zhaosl@gmail.com; peter.maydell@linaro.org;
>> imammedo@redhat.com; qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: xuwei (O) <xuwei5@huawei.com>; Linuxarm <linuxarm@huawei.com>; Ard
>> Biesheuvel <ard.biesheuvel@linaro.org>; Leif Lindholm (Linaro address)
>> <leif.lindholm@linaro.org>
>> Subject: RE: [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
> 
> [...]
>  
>>>>> The root cause seems to be EDK2 ACPI table checksum failure
>>>>> as NFIT table is getting updated on hot-add. This needs further
>>>>> investigation.
>>>> + Ard, Leif, Laszlo if they have any idea of what is missing/wrong.
>>>
>>> Huh, very interesting; I usually don't expect my sanity checks to fire
>>> in practice. :)
>>>
>>> The message
>>>
>>>   ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"
>>>
>>> is logged by OVMF's and ArmVirtQemu's ACPI Platform DXE Driver when it
>>> finds an invalid COMMAND_ADD_CHECKSUM command in QEMU's ACPI
>>> linker/loader script.
>>>
>>> Please see the command definition in QEMU's
>>> "hw/acpi/bios-linker-loader.c". In particular, please refer to the
>>> function bios_linker_loader_add_checksum(), which builds the command
>>> structure, and documents the fields.
>>>
>>> (You may also refer to QEMU_LOADER_ADD_CHECKSUM in file
>>> "OvmfPkg/AcpiPlatformDxe/QemuLoader.h" in the edk2 source tree, for the
>>> same information.)
>>>
>>> The error message is logged if:
>>> - the offset at which the checksum should be stored falls outside of the
>>> size of the fw_cfg blob, or
>>> - the range over which the checksum should be calculated falls outside
>>> (at least in part) of the fw_cfg blob.
>>>
>>> To me this suggests that QEMU generates an invalid
>>> COMMAND_ADD_CHECKSUM
>>> command for the firmware.
>>>
>>> ... I've tried to skim the patches briefly. I think there must be an
>>> error in the DSDT building logic that is only active on reboot if an
>>> nvdimm module was hot-added before the reboot.
>>
>> Thanks for taking a look and the pointers. I will debug this further
>> and get back.
> 
> The root cause of the issue seems to be UEFI not seeing the updated acpi
> table blob size on reboot once a new NFIT table is added(nvdimm hot added).
> 
> Please see the debug logs below,
> 
> Initial Guest boot
> ---------------------------
> 
> Debug logs from Qemu:
> 
> build_header: acpi sig DSDT len 0x5127
> build_header: acpi sig FACP len 0x10c
> build_header: acpi sig APIC len 0xa8
> build_header: acpi sig GTDT len 0x60
> build_header: acpi sig MCFG len 0x3c
> build_header: acpi sig SPCR len 0x50
> build_header: acpi sig SRAT len 0x92
> build_header: acpi sig SSDT len 0x38f
> build_header: acpi sig XSDT len 0x5c
> virt_acpi_build: acpi table_blob len 0x5844
> 
> Debug logs from UEFI:
> 
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x9 Start=0x0 Length=0x5127 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5130 Start=0x5127 Length=0x10C Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x523C Start=0x5233 Length=0xA8 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x52E4 Start=0x52DB Length=0x60 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5344 Start=0x533B Length=0x3C Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5380 Start=0x5377 Length=0x50 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x53D0 Start=0x53C7 Length=0x92 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5462 Start=0x5459 Length=0x38F Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x57F1 Start=0x57E8 Length=0x5C Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/rsdp" ResultOffset=0x8 Start=0x0 Length=0x14 Blob->Size=0x24
> ProcessCmdAddChecksum: File="etc/acpi/rsdp" ResultOffset=0x20 Start=0x0 Length=0x24 Blob->Size=0x24
> InstallQemuFwCfgTables: installed 8 tables
> 
> Guest Reboot after ndimm hot added
> ------------------------------------
> 
> Debug logs from Qemu:
> 
> build_header: acpi sig DSDT len 0x5127
> build_header: acpi sig FACP len 0x10c
> build_header: acpi sig APIC len 0xa8
> build_header: acpi sig GTDT len 0x60
> build_header: acpi sig MCFG len 0x3c
> build_header: acpi sig SPCR len 0x50
> build_header: acpi sig SRAT len 0x92
> build_header: acpi sig SSDT len 0x38f
> build_header: acpi sig NFIT len 0xe0  -->New
> build_header: acpi sig XSDT len 0x64
> virt_acpi_build: acpi table_blob len 0x592c -->blob len updated
> 
> Debug logs from UEFI:
> 
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x9 Start=0x0 Length=0x5127 Blob->Size=0x5844  -->Wrong blob size.
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5130 Start=0x5127 Length=0x10C Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x523C Start=0x5233 Length=0xA8 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x52E4 Start=0x52DB Length=0x60 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5344 Start=0x533B Length=0x3C Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5380 Start=0x5377 Length=0x50 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x53D0 Start=0x53C7 Length=0x92 Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x5462 Start=0x5459 Length=0x38F Blob->Size=0x5844
> ProcessCmdAddChecksum: File="etc/acpi/tables" ResultOffset=0x57F1 Start=0x57E8 Length=0xE0 Blob->Size=0x5844
> ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"
> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> 
> 
> To me it seems on ARM vit acpi path, the blob len is calculated based
> on actual tables and is updated only in virt_acpi_setup() --> acpi_add_rom_blob()
> path. I had a look at the x86 code and it looks like, there, the blob len gets updated
> with an additional buffer to take care of table resizing[1].
> 
> As a hack i added the same to ARM virt and it seems to resolve the issue.
> I am not sure this is the best approach to fix this though.
> 
> Please let me know your thoughts.
> 
> Thanks,
> Shameer
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 132414c..4291553 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -50,6 +50,8 @@
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> 
> +#define ACPI_BUILD_TABLE_SIZE    0x20000
> +
>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>  {
>      uint16_t i;
> @@ -886,6 +888,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
>      }
> 
> +    /* Make sure we have a buffer in case we need to resize the tables. */
> +    g_array_set_size(tables_blob, ROUND_UP(acpi_data_len(tables_blob),
> +                     ACPI_BUILD_TABLE_SIZE));
> +
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
>  }
> 
> [1] https://github.com/qemu/qemu/blob/master/hw/i386/acpi-build.c#L2792

Nice analysis, thanks.

I think the line that you reference, i.e.

  acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);

in acpi_build() [hw/i386/acpi-build.c] masks this issue for x86 only as
a side effect. To my understanding, the alignment / padding exists there
for migration compatibility. It doesn't exist for updating the size of
the ACPI blobs in fw_cfg across reboots. The issue is masked because the
alignment is large enough (un-changed) to contain the regenerated blobs
as well.

Given that the "virt" machine type is versioned, I think migration
compat is a valid concern there too. This in itself would justify a
similar padding.

I don't know if we want to specifically care about size-changing
ACPI-regen across reboot. I believe measures for that specific use case
don't exist in x86 machine types either.

Another trick that is occasionally used (but might not apply here, I'm
uncertain) is to always generate the relevant ACPI objects, but, in case
they are not justified for the virtual hardware config, invalidate them
by overwriting particular parts of them (for example, one or two bytes
of their names). Hopefully this shouldn't introduce ACPI or AML errors,
just make the ACPI interpreter ignore the affected objects.

Thanks,
Laszlo
