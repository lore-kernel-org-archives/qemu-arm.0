Received: by 10.28.91.67 with SMTP id p64csp1623393wmb;
        Thu, 1 Mar 2018 01:39:16 -0800 (PST)
X-Google-Smtp-Source: AG47ELuoWFGVyBMqDGhK7lxVaXfvQxFvHgzj2O+xOPJ+7BaY1mCARHVm2rmtM9RCfdg1wdgLzcBd
X-Received: by 2002:a25:2351:: with SMTP id j78-v6mr60101ybj.380.1519897156701;
        Thu, 01 Mar 2018 01:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519897156; cv=none;
        d=google.com; s=arc-20160816;
        b=YEGLP3sO9FMP2XbM2/GgwCXL3dEuWlRW36R9Aarzd7LyTy1Bz6/G9TjPJrj04AukFn
         axP6mwbcD2m0Mdxao9vnRZz+irIsnYvF3cuAHV+IZVafU1PIHX7yl+C38qpNvFcZAH2K
         0+TEWATQT40qxw0IY/T/LiZc2fc0wsvaW0n2BH5+dU4cnhF1086Eoa1pxkeEnQd1MNHF
         IHOAuceP4SYZcWshbm0g6dZp7ff/0KnAkV3WCNQwOv+VfVlhU6b5gHkiXEt99WyosV7Z
         dX2RVEP00GjSvq53juLylBuvxcviy+HvifSF/JHqc/WQe89ii4dz8mXN6lc9rO1FXU6x
         ymmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=sMc94Ts9LsV1T3u8BDgWvENDFdtjUq7S9aXHoQLE6UM=;
        b=BmSrmyWSgTG/DDrPSEUimyG4600sJNBXhKi1rggoEvvIUfA11CkXHB6cTqEbKO1ukl
         URSqTqCX0nYBiYiUfLTRSx/TEj1rPBePi6/TKgV+flnaZZADU5qMyi8sILHcySIPwqRS
         PANd+QVWVbPaYIXVXMOtkVzcyLhU2EgOwuk/BpzJ0CDrbXqkguiXet7EF5XS07kU9T3+
         DYVLDuzaV+cAkVoPzeOhEdXIA0vEUdNrzcdHZGUBUiZHv6gh8WzTnIgRmOgWmouPlk4Q
         TYkDmOyIzvFjG/kIETaYF00VM6qCfqwyMBxr2rPgpIlxvOyXHVc7iW/uAHS59ssPgaaj
         O+dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l18-v6si593097ybf.291.2018.03.01.01.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 01:39:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erKgG-0006Xn-4W
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 04:39:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erKg7-0006XW-BF
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 04:39:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erKg4-0002UC-6e
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 04:39:07 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38364 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1erKg4-0002T7-0Z; Thu, 01 Mar 2018 04:39:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76711402291E;
	Thu,  1 Mar 2018 09:38:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 300DC2026E04;
	Thu,  1 Mar 2018 09:38:53 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
	<1519827835-239519-10-git-send-email-imammedo@redhat.com>
	<986e15d2-47cd-be73-da0f-39874b38a325@redhat.com>
	<20180301102153.0a07f96c@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ad05c82f-eb31-694d-4688-ae250287cfd6@redhat.com>
Date: Thu, 1 Mar 2018 10:38:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180301102153.0a07f96c@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 09:38:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 09:38:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 09/10] virt_arm: acpi: reuse common
 build_fadt()
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2s31GsfAcT8h



On 01/03/18 10:21, Igor Mammedov wrote:
> On Thu, 1 Mar 2018 09:51:14 +0100
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi,
>> On 28/02/18 15:23, Igor Mammedov wrote:
>>> Extend generic build_fadt() to support rev5.1 FADT
>>> and reuse it for 'virt' board, it would allow to
>>> phase out usage of AcpiFadtDescriptorRev5_1 and
>>> later ACPI_FADT_COMMON_DEF.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> v2:
>>>   - update comment to mention that build_fadt() supports 5.1 revision
>>> ---
>>>  include/hw/acpi/acpi-defs.h | 12 ++----------
>>>  hw/acpi/aml-build.c         | 23 +++++++++++++++++++++--
>>>  hw/arm/virt-acpi-build.c    | 33 ++++++++++++---------------------
>>>  3 files changed, 35 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>>> index 3fb0ace..fe15e95 100644
>>> --- a/include/hw/acpi/acpi-defs.h
>>> +++ b/include/hw/acpi/acpi-defs.h
>>> @@ -165,16 +165,6 @@ struct AcpiFadtDescriptorRev3 {
>>>  } QEMU_PACKED;
>>>  typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
>>>  
>>> -struct AcpiFadtDescriptorRev5_1 {
>>> -    ACPI_FADT_COMMON_DEF
>>> -    /* 64-bit Sleep Control register (ACPI 5.0) */
>>> -    struct AcpiGenericAddress sleep_control;
>>> -    /* 64-bit Sleep Status register (ACPI 5.0) */
>>> -    struct AcpiGenericAddress sleep_status;
>>> -} QEMU_PACKED;
>>> -
>>> -typedef struct AcpiFadtDescriptorRev5_1 AcpiFadtDescriptorRev5_1;
>>> -
>>>  typedef struct AcpiFadtData {
>>>      struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
>>>      struct AcpiGenericAddress pm1a_evt;   /* PM1a_EVT_BLK */
>>> @@ -192,6 +182,8 @@ typedef struct AcpiFadtData {
>>>      uint8_t  rtc_century;      /* CENTURY */
>>>      uint16_t plvl2_lat;        /* P_LVL2_LAT */
>>>      uint16_t plvl3_lat;        /* P_LVL3_LAT */
>>> +    uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
>>> +    uint8_t minor_ver;         /* FADT Minor Version */
>>>  
>>>      /*
>>>       * respective tables offsets within ACPI_BUILD_TABLE_FILE,
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index 8f45298..3fa557c 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -1679,7 +1679,7 @@ void build_slit(GArray *table_data, BIOSLinker *linker)
>>>                   table_data->len - slit_start, 1, NULL, NULL);
>>>  }
>>>  
>>> -/* build rev1/rev3 FADT */
>>> +/* build rev1/rev3/rev5.1 FADT */
>>>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>>                  const char *oem_id, const char *oem_table_id)
>>>  {
>>> @@ -1755,7 +1755,14 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>>  
>>>      build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
>>>      build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
>>> -    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
I meant we could have assert(f->rev < 6) here
>>> +    /* Since ACPI 5.1 */
>>> +    if ((f->rev >= 6) || ((f->rev == 5) && f->minor_ver > 0)) {
and remove (f->rev >= 6) as in any case rev6 is not supported
(Hypervisor Vendor Identity field (8 byte) not duly added).

Or do I miss something?

Thanks

Eric
>>> +        build_append_int_noprefix(tbl, f->arm_boot_arch, 2); /* ARM_BOOT_ARCH */
>>> +        /* FADT Minor Version */
>>> +        build_append_int_noprefix(tbl, f->minor_ver, 1);
>>> +    } else {
>>> +        build_append_int_noprefix(tbl, 0, 3); /* Reserved upto ACPI 5.0 */
>>> +    }
>>>      build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
>>>  
>>>      /* XDSDT address to be filled by Guest linker at runtime */
>>> @@ -1779,6 +1786,18 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>>      build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
>>>      build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
>>>  
>>> +    if (f->rev <= 4) {
>>> +        goto build_hdr;
>>> +    }
>>> +
>>> +    /* SLEEP_CONTROL_REG */
>>> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
>>> +    /* SLEEP_STATUS_REG */
>>> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
>>> +
>>> +    /* TODO: extra fields need to be added to support revisions above rev5 */
>>> +    assert(f->rev == 5);  
>> My previous comment about asserting here if f->rev != 5 and previous
>> (f->rev >= 6) check was skipped but that's not a big deal.
> I've thought that I've replied to comment,
> maybe I just didn't get meaning behind question?
> So I'll try to explain again.
> 
> If we reach this point rev must be 5, so f->rev >= 6 would be confusing
> at this point. When v6 support is added this assert should be moved after
> v6 stuff and condition is amended to f->rev == 6.
> 
>  
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Thanks!
> 
>>
>> Thanks
>>
>> Eric
>>> +
>>>  build_hdr:
>>>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
>>>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index b644da9..c7c6a57 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -654,39 +654,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>  static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>>>                              VirtMachineState *vms, unsigned dsdt_tbl_offset)
>>>  {
>>> -    int fadt_start = table_data->len;
>>> -    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
>>> -    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
>>> -    uint16_t bootflags;
>>> +    /* ACPI v5.1 */
>>> +    AcpiFadtData fadt = {
>>> +        .rev = 5,
>>> +        .minor_ver = 1,
>>> +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
>>> +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
>>> +    };
>>>  
>>>      switch (vms->psci_conduit) {
>>>      case QEMU_PSCI_CONDUIT_DISABLED:
>>> -        bootflags = 0;
>>> +        fadt.arm_boot_arch = 0;
>>>          break;
>>>      case QEMU_PSCI_CONDUIT_HVC:
>>> -        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
>>> +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
>>> +                             ACPI_FADT_ARM_PSCI_USE_HVC;
>>>          break;
>>>      case QEMU_PSCI_CONDUIT_SMC:
>>> -        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
>>> +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
>>>          break;
>>>      default:
>>>          g_assert_not_reached();
>>>      }
>>>  
>>> -    /* Hardware Reduced = 1 and use PSCI 0.2+ */
>>> -    fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
>>> -    fadt->arm_boot_flags = cpu_to_le16(bootflags);
>>> -
>>> -    /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
>>> -    fadt->minor_revision = 0x1;
>>> -
>>> -    /* DSDT address to be filled by Guest linker */
>>> -    bios_linker_loader_add_pointer(linker,
>>> -        ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
>>> -        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
>>> -
>>> -    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
>>> -                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
>>> +    build_fadt(table_data, linker, &fadt, NULL, NULL);
>>>  }
>>>  
>>>  /* DSDT */
>>>   
> 
