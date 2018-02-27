Received: by 10.28.71.27 with SMTP id u27csp4911546wma;
        Tue, 27 Feb 2018 06:57:56 -0800 (PST)
X-Google-Smtp-Source: AG47ELtqFmq6RmtdMVvtzbNv2cQrfNdoqM01nP5tIl8YA7dvSVgYA1tWOVif9XSUefgP7r2gIYwH
X-Received: by 2002:a25:dcc5:: with SMTP id y188-v6mr9530659ybe.385.1519743476182;
        Tue, 27 Feb 2018 06:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519743476; cv=none;
        d=google.com; s=arc-20160816;
        b=ibXlI4x9Ttg15f36JPnJhphOXaVUJaUBo05TGK+VhG3Po5pV5hU/23FuyaSnk5Cr9W
         2KGia4iTRrQMz6l5XO0t2e3xhfGcMeSqtPdt+W/FHePLLCP7hdNbmjFCL/elumVZlIan
         aYfkqus8vO7J2LT4tPnRKqQ44xZXHmr3VOvTB7usTQoa/AQWZdt307o1C7baKlhe/ImF
         qDaElG/EKjuYXYA8c3yQiX6aDNM2jev+cG9lm9G6GBvCJzMZ0NV1PsMpfXarQxVIFTZX
         sb/5/CEINQAhPZpLiacptxqcoS6MKTO8SquBnJoC7bAxMaL8qPfYDT8octR+8Pd+Ud0j
         +Ktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ANFwKYmHUeBKn8gIoYGTEwP+tMNMnBiOZXiYMlT7cUc=;
        b=q4D4zcmpWcStYwbgNNWBtx0b20g5JwkpdiDZQ0UaVzWbETEN1/EefDpszLHBxyYRgU
         DRj2f7ePSwhEYjVrDSotNwnI9DqRmMQguKdiJygilgvCnYDC1P/aAp+ouDWFjtg8KqVN
         bebuRWT+bGtKvzozTAguTYZcGGQ8FzkuyPRJgm/9bNwnbohliUU14PwrafM+Pcauc/Xt
         6U8reVZvMO9R+S2nJPyWBu3VX2rFX4RnqKBeLHk/pQxtf4bKIpsgn9gPmNRi2rlW3+tG
         OyfrKEtl/ndxAyc8CF6vuvVCvaRv95meBDUoVoBgIVaKIsc1Yyw5iK7XkaaHrMAZyiXS
         2YIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7-v6si1939117ybg.449.2018.02.27.06.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqghX-0003Pw-Hs
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:57:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqgT9-0007L7-LP
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:43:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqgT8-0002l7-Dm
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:43:03 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54640 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqgT1-0002YL-EY; Tue, 27 Feb 2018 09:42:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B59C540201A6;
	Tue, 27 Feb 2018 14:42:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 210B9AFD69;
	Tue, 27 Feb 2018 14:42:43 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-9-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5c1754a0-e3a5-1baa-9a69-465c8a5892ad@redhat.com>
Date: Tue, 27 Feb 2018 15:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-9-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 14:42:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 14:42:51 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 8/9] virt_arm: acpi: reuse common
 build_fadt()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpDNdbvY8vd6



On 22/02/18 13:42, Igor Mammedov wrote:
> Extend generic build_fadt() to support rev5.1 FADT
> and reuse it for 'virt' board, it would allow to
> phase out usage of AcpiFadtDescriptorRev5_1 and
> later ACPI_FADT_COMMON_DEF.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/acpi/acpi-defs.h | 12 ++----------
>  hw/acpi/aml-build.c         | 21 ++++++++++++++++++++-
>  hw/arm/virt-acpi-build.c    | 33 ++++++++++++---------------------
>  3 files changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index e0accc4..34e49dc 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -165,16 +165,6 @@ struct AcpiFadtDescriptorRev3 {
>  } QEMU_PACKED;
>  typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
>  
> -struct AcpiFadtDescriptorRev5_1 {
> -    ACPI_FADT_COMMON_DEF
> -    /* 64-bit Sleep Control register (ACPI 5.0) */
> -    struct AcpiGenericAddress sleep_control;
> -    /* 64-bit Sleep Status register (ACPI 5.0) */
> -    struct AcpiGenericAddress sleep_status;
> -} QEMU_PACKED;
> -
> -typedef struct AcpiFadtDescriptorRev5_1 AcpiFadtDescriptorRev5_1;
> -
>  typedef struct AcpiFadtData {
>      struct AcpiGenericAddress pm1_cnt;   /* PM1a_CNT_BLK */
>      struct AcpiGenericAddress pm1_evt;   /* PM1a_EVT_BLK */
> @@ -192,6 +182,8 @@ typedef struct AcpiFadtData {
>      uint8_t  rtc_century;      /* CENTURY */
>      uint16_t c2_latency;       /* P_LVL2_LAT */
>      uint16_t c3_latency;       /* P_LVL3_LAT */
> +    uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> +    uint8_t minor_ver;         /* FADT Minor Version */
>  
>      /*
>       * respective tables offsets within ACPI_BUILD_TABLE_FILE,
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 17fb71b..5a33cd0 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1755,7 +1755,14 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>  
>      build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
>      build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
> -    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
> +    /* Since ACPI 5.1 */
> +    if ((f->rev >= 6) || ((f->rev == 5) && f->minor_ver > 0)) {
> +        build_append_int_noprefix(tbl, f->arm_boot_arch, 2); /* ARM_BOOT_ARCH */
> +        /* FADT Minor Version */
> +        build_append_int_noprefix(tbl, f->minor_ver, 1);
> +    } else {
> +        build_append_int_noprefix(tbl, 0, 3); /* Reserved upto ACPI 5.0 */
> +    }
>      build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
>  
>      /* XDSDT address to be filled by Guest linker at runtime */
> @@ -1779,6 +1786,18 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
>      build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
>  
> +    if (f->rev <= 4) {
> +        goto build_hdr;
> +    }
> +
> +    /* SLEEP_CONTROL_REG */
> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> +    /* SLEEP_STATUS_REG */
> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> +
> +    /* TODO: extra fields need to be added to support revisions above rev5 */
> +    assert(f->rev == 5);
> +
>  build_hdr:
>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b644da9..c7c6a57 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -654,39 +654,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>                              VirtMachineState *vms, unsigned dsdt_tbl_offset)
>  {
> -    int fadt_start = table_data->len;
> -    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
> -    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
> -    uint16_t bootflags;
> +    /* ACPI v5.1 */
> +    AcpiFadtData fadt = {
> +        .rev = 5,
> +        .minor_ver = 1,
> +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
> +    };
>  
>      switch (vms->psci_conduit) {
>      case QEMU_PSCI_CONDUIT_DISABLED:
> -        bootflags = 0;
> +        fadt.arm_boot_arch = 0;
>          break;
>      case QEMU_PSCI_CONDUIT_HVC:
> -        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
> +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
> +                             ACPI_FADT_ARM_PSCI_USE_HVC;
>          break;
>      case QEMU_PSCI_CONDUIT_SMC:
> -        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
> +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
>          break;
>      default:
>          g_assert_not_reached();
>      }
>  
> -    /* Hardware Reduced = 1 and use PSCI 0.2+ */
> -    fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
> -    fadt->arm_boot_flags = cpu_to_le16(bootflags);
> -
> -    /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
> -    fadt->minor_revision = 0x1;
> -
> -    /* DSDT address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
> -        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> -
> -    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
> -                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
> +    build_fadt(table_data, linker, &fadt, NULL, NULL);
>  }
>  
>  /* DSDT */
> 
