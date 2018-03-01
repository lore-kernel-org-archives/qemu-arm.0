Received: by 10.28.91.67 with SMTP id p64csp1581499wmb;
        Thu, 1 Mar 2018 00:43:53 -0800 (PST)
X-Google-Smtp-Source: AG47ELtrTmj+5AlSv7okfmAgo3PIk5Ub/IkrKYJUmw4fZ0+uGCTxyqQS6ZoqoeCGPCqiCGlo0Un6
X-Received: by 10.13.205.3 with SMTP id p3mr510325ywd.377.1519893833267;
        Thu, 01 Mar 2018 00:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519893833; cv=none;
        d=google.com; s=arc-20160816;
        b=lI3SmiRKYrUeg3CrorUL56VydoCcZdSxxRSDIwaCAAeFRUsABmjp3H7gy40Rzw0J7g
         sG8A48sugLS0u4Voh9PtXTRm5rQP/m9RoO2WGTDvDRMWsrO77O3+ydB1BPWcJJxFyzjL
         jvyNTPpnneQDZKZNEW9/07aqkF67uKfq7BDGQ8gfhGNrlZzsP2VXdzwQTePpgq2MSY7+
         Rh/a1fxhB5dLVDwLWPhg508QAtuirEt5gEA8f04xFpzpaB+w9KAugexNEBRtBVV9GvfD
         rme4m+zKXiMOfuih9AWblczK0+Qf5O5NyTXiHrJzXSI/oZg2IchemjxlQjEvZVSmEH6B
         JRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=M41qjvOTzB+zJSLhuL4ASR64Kv35r48hTuQTgBvwoAQ=;
        b=cyAqj/IzjN2c32QQ90h9f11qtyakxeecjZjYJ0a2UaVpHC2OJ6Ne8YgGS6BjBHJ5yP
         sguFs5QPZpFkMrmWKhKqD2s9kc6C34a1VnxnYPgzDmizHaleAfYaGHPOES0ppJ+Npa93
         URZCtJ4RQ5bh+YYLouJ96pSbFse2sJe8SugM2WSO+YvNE5G26x0LwxxJxW6BZFvWXU+H
         7nFvaF1KZpIVBwG9gmC2xRzcMOnkXp1YNp+Jrh1eV6ydjoYaIFAJQ3pp3UqZZlIxMOcF
         u1LTNdO8igAzQINMEj/dJcHRiOnUcJvq5kFo6HY9Adl/u/1vZiOT3rt20A0jzq++cdS8
         51hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 187-v6si578043ybd.298.2018.03.01.00.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 00:43:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erJoe-0006ss-Nx
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 03:43:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erJoT-0006sO-BP
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 03:43:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erJoR-000694-2V
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 03:43:41 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42008 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1erJoQ-00068s-SI; Thu, 01 Mar 2018 03:43:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A26EEAEAB;
	Thu,  1 Mar 2018 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2872024CAE;
	Thu,  1 Mar 2018 08:43:36 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
	<1519827835-239519-7-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <31517fc9-0a14-2e41-3792-8455bcb6c01c@redhat.com>
Date: Thu, 1 Mar 2018 09:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519827835-239519-7-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 01 Mar 2018 08:43:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 01 Mar 2018 08:43:38 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 06/10] pc: acpi: isolate FADT specific
 data into AcpiFadtData structure
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JTH4DEcx+RwZ

Hi Igor,

On 28/02/18 15:23, Igor Mammedov wrote:
> move FADT data initialization out of fadt_setup() into dedicated
> init_fadt_data() that will set common for pc/q35 values in
> AcpiFadtData structure and acpi_get_pm_info() will complement
> it with pc/q35 specific values initialization.
> 
> That will allow to get rid of fadt_setup() and generalize
> build_fadt() so it could be easily extended for rev5 and
> reused by ARM target.
> 
> While at it also move facs/dsdt/xdsdt offsets from build_fadt()
> arg list into AcpiFadtData, as they belong to the same dataset.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v2:
> changes requested by Auger Eric <eric.auger@redhat.com>
suggested ;-)

>   - s/pm1_/pm1a_/
>   - s/c2_latency/plvl2_lat/
>   - s/c3_latency/plvl3_lat/
>   - cleanup ACPI_PORT_SMI_CMD TODO, move  it to hw/isa/apm.h
>   - move
>        if (f->facs_tbl_offset) / if (f->dsdt_tbl_offset)
>            bios_linker_loader_add_pointer(...)
>     into the patch that makes build_fadt() generic
> ---
>  include/hw/acpi/acpi-defs.h |  28 +++++++
>  hw/i386/acpi-build.c        | 190 ++++++++++++++++++++++++--------------------
>  2 files changed, 130 insertions(+), 88 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 9942bc5..3fb0ace 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -175,6 +175,34 @@ struct AcpiFadtDescriptorRev5_1 {
>  
>  typedef struct AcpiFadtDescriptorRev5_1 AcpiFadtDescriptorRev5_1;
>  
> +typedef struct AcpiFadtData {
> +    struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
> +    struct AcpiGenericAddress pm1a_evt;   /* PM1a_EVT_BLK */
> +    struct AcpiGenericAddress pm_tmr;    /* PM_TMR_BLK */
> +    struct AcpiGenericAddress gpe0_blk;  /* GPE0_BLK */
> +    struct AcpiGenericAddress reset_reg; /* RESET_REG */
> +    uint8_t reset_val;         /* RESET_VALUE */
> +    uint8_t  rev;              /* Revision */
> +    uint32_t flags;            /* Flags */
> +    uint32_t smi_cmd;          /* SMI_CMD */
> +    uint16_t sci_int;          /* SCI_INT */
> +    uint8_t  int_model;        /* INT_MODEL */
> +    uint8_t  acpi_enable_cmd;  /* ACPI_ENABLE */
> +    uint8_t  acpi_disable_cmd; /* ACPI_DISABLE */
> +    uint8_t  rtc_century;      /* CENTURY */
> +    uint16_t plvl2_lat;        /* P_LVL2_LAT */
> +    uint16_t plvl3_lat;        /* P_LVL3_LAT */
> +
> +    /*
> +     * respective tables offsets within ACPI_BUILD_TABLE_FILE,
> +     * NULL if table doesn't exist (in that case field's value
> +     * won't be patched by linker and will be kept set to 0)
> +     */
> +    unsigned *facs_tbl_offset; /* FACS offset in */
> +    unsigned *dsdt_tbl_offset;
> +    unsigned *xdsdt_tbl_offset;
> +} AcpiFadtData;
> +
>  #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
>  #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 699f3a0..1f88ed1 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -91,17 +91,11 @@ typedef struct AcpiMcfgInfo {
>  } AcpiMcfgInfo;
>  
>  typedef struct AcpiPmInfo {
> -    bool force_rev1_fadt;
>      bool s3_disabled;
>      bool s4_disabled;
>      bool pcihp_bridge_en;
>      uint8_t s4_val;
> -    uint16_t sci_int;
> -    uint8_t acpi_enable_cmd;
> -    uint8_t acpi_disable_cmd;
> -    uint32_t gpe0_blk;
> -    uint32_t gpe0_blk_len;
> -    uint32_t io_base;
> +    AcpiFadtData fadt;
>      uint16_t cpu_hp_io_base;
>      uint16_t pcihp_io_base;
>      uint16_t pcihp_io_len;
> @@ -124,20 +118,59 @@ typedef struct AcpiBuildPciBusHotplugState {
>      bool pcihp_bridge_en;
>  } AcpiBuildPciBusHotplugState;
>  
> +static void init_common_fadt_data(Object *o, AcpiFadtData *data)
> +{
> +    uint32_t io = object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE, NULL);
> +    AmlAddressSpace as = AML_AS_SYSTEM_IO;
> +    AcpiFadtData fadt = {
> +        .rev = 3,
> +        .flags =
> +            (1 << ACPI_FADT_F_WBINVD) |
> +            (1 << ACPI_FADT_F_PROC_C1) |
> +            (1 << ACPI_FADT_F_SLP_BUTTON) |
> +            (1 << ACPI_FADT_F_RTC_S4) |
> +            (1 << ACPI_FADT_F_USE_PLATFORM_CLOCK) |
> +            /* APIC destination mode ("Flat Logical") has an upper limit of 8
> +             * CPUs for more than 8 CPUs, "Clustered Logical" mode has to be
> +             * used
> +             */
> +            ((max_cpus > 8) ? (1 << ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL) : 0),
> +        .int_model = 1 /* Multiple APIC */,
> +        .rtc_century = RTC_CENTURY,
> +        .plvl2_lat = 0xfff /* C2 state not supported */,
> +        .plvl3_lat = 0xfff /* C3 state not supported */,
> +        .smi_cmd = ACPI_PORT_SMI_CMD,
> +        .sci_int = object_property_get_uint(o, ACPI_PM_PROP_SCI_INT, NULL),
> +        .acpi_enable_cmd =
> +            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL),
> +        .acpi_disable_cmd =
> +            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL),
> +        .pm1a_evt = { .space_id = as, .bit_width = 4 * 8, .address = io },
> +        .pm1a_cnt = { .space_id = as, .bit_width = 2 * 8,
> +                      .address = io + 0x04 },
> +        .pm_tmr = { .space_id = as, .bit_width = 4 * 8, .address = io + 0x08 },
> +        .gpe0_blk = { .space_id = as, .bit_width =
> +            object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK_LEN, NULL) * 8,
> +            .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> +        },
> +    };
> +    *data = fadt;
> +}
> +
>  static void acpi_get_pm_info(AcpiPmInfo *pm)
>  {
>      Object *piix = piix4_pm_find();
>      Object *lpc = ich9_lpc_find();
>      Object *obj = piix ? piix : lpc;
>      QObject *o;
> -
> -    pm->force_rev1_fadt = false;
>      pm->cpu_hp_io_base = 0;
>      pm->pcihp_io_base = 0;
>      pm->pcihp_io_len = 0;
> +
> +    init_common_fadt_data(obj, &pm->fadt);
>      if (piix) {
>          /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
> -        pm->force_rev1_fadt = true;
> +        pm->fadt.rev = 1;
>          pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
>          pm->pcihp_io_base =
>              object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> @@ -145,10 +178,19 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>              object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>      }
>      if (lpc) {
> +        struct AcpiGenericAddress r = { .space_id = AML_AS_SYSTEM_IO,
> +            .bit_width = 8, .address = ICH9_RST_CNT_IOPORT };
> +        pm->fadt.reset_reg = r;
> +        pm->fadt.reset_val = 0xf;
> +        pm->fadt.flags |= 1 << ACPI_FADT_F_RESET_REG_SUP;
>          pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
>      }
>      assert(obj);
>  
> +    /* The above need not be conditional on machine type because the reset port
> +     * happens to be the same on PIIX (pc) and ICH9 (q35). */
> +    QEMU_BUILD_BUG_ON(ICH9_RST_CNT_IOPORT != RCR_IOPORT);
> +
>      /* Fill in optional s3/s4 related properties */
>      o = object_property_get_qobject(obj, ACPI_PM_PROP_S3_DISABLED, NULL);
>      if (o) {
> @@ -172,22 +214,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>      }
>      qobject_decref(o);
>  
> -    /* Fill in mandatory properties */
> -    pm->sci_int = object_property_get_uint(obj, ACPI_PM_PROP_SCI_INT, NULL);
> -
> -    pm->acpi_enable_cmd = object_property_get_uint(obj,
> -                                                   ACPI_PM_PROP_ACPI_ENABLE_CMD,
> -                                                   NULL);
> -    pm->acpi_disable_cmd =
> -        object_property_get_uint(obj,
> -                                 ACPI_PM_PROP_ACPI_DISABLE_CMD,
> -                                 NULL);
> -    pm->io_base = object_property_get_uint(obj, ACPI_PM_PROP_PM_IO_BASE,
> -                                           NULL);
> -    pm->gpe0_blk = object_property_get_uint(obj, ACPI_PM_PROP_GPE0_BLK,
> -                                            NULL);
> -    pm->gpe0_blk_len = object_property_get_uint(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
> -                                                NULL);
>      pm->pcihp_bridge_en =
>          object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
>                                   NULL);
> @@ -273,73 +299,53 @@ build_facs(GArray *table_data, BIOSLinker *linker)
>  }
>  
>  /* Load chipset information in FADT */
> -static void fadt_setup(AcpiFadtDescriptorRev3 *fadt, AcpiPmInfo *pm)
> +static void fadt_setup(AcpiFadtDescriptorRev3 *fadt, AcpiFadtData f)
>  {
> -    fadt->model = 1;
> +    fadt->model = f.int_model;
>      fadt->reserved1 = 0;
> -    fadt->sci_int = cpu_to_le16(pm->sci_int);
> -    fadt->smi_cmd = cpu_to_le32(ACPI_PORT_SMI_CMD);
> -    fadt->acpi_enable = pm->acpi_enable_cmd;
> -    fadt->acpi_disable = pm->acpi_disable_cmd;
> +    fadt->sci_int = cpu_to_le16(f.sci_int);
> +    fadt->smi_cmd = cpu_to_le32(f.smi_cmd);
> +    fadt->acpi_enable = f.acpi_enable_cmd;
> +    fadt->acpi_disable = f.acpi_disable_cmd;
>      /* EVT, CNT, TMR offset matches hw/acpi/core.c */
> -    fadt->pm1a_evt_blk = cpu_to_le32(pm->io_base);
> -    fadt->pm1a_cnt_blk = cpu_to_le32(pm->io_base + 0x04);
> -    fadt->pm_tmr_blk = cpu_to_le32(pm->io_base + 0x08);
> -    fadt->gpe0_blk = cpu_to_le32(pm->gpe0_blk);
> +    fadt->pm1a_evt_blk = cpu_to_le32(f.pm1a_evt.address);
> +    fadt->pm1a_cnt_blk = cpu_to_le32(f.pm1a_cnt.address);
> +    fadt->pm_tmr_blk = cpu_to_le32(f.pm_tmr.address);
> +    fadt->gpe0_blk = cpu_to_le32(f.gpe0_blk.address);
>      /* EVT, CNT, TMR length matches hw/acpi/core.c */
> -    fadt->pm1_evt_len = 4;
> -    fadt->pm1_cnt_len = 2;
> -    fadt->pm_tmr_len = 4;
> -    fadt->gpe0_blk_len = pm->gpe0_blk_len;
> -    fadt->plvl2_lat = cpu_to_le16(0xfff); /* C2 state not supported */
> -    fadt->plvl3_lat = cpu_to_le16(0xfff); /* C3 state not supported */
> -    fadt->flags = cpu_to_le32((1 << ACPI_FADT_F_WBINVD) |
> -                              (1 << ACPI_FADT_F_PROC_C1) |
> -                              (1 << ACPI_FADT_F_SLP_BUTTON) |
> -                              (1 << ACPI_FADT_F_RTC_S4));
> -    fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_USE_PLATFORM_CLOCK);
> -    /* APIC destination mode ("Flat Logical") has an upper limit of 8 CPUs
> -     * For more than 8 CPUs, "Clustered Logical" mode has to be used
> -     */
> -    if (max_cpus > 8) {
> -        fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL);
> -    }
> -    fadt->century = RTC_CENTURY;
> -    if (pm->force_rev1_fadt) {
> +    fadt->pm1_evt_len = f.pm1a_evt.bit_width / 8;
> +    fadt->pm1_cnt_len = f.pm1a_cnt.bit_width / 8;
> +    fadt->pm_tmr_len = f.pm_tmr.bit_width / 8;
> +    fadt->gpe0_blk_len = f.gpe0_blk.bit_width / 8;
> +    fadt->plvl2_lat = cpu_to_le16(f.plvl2_lat);
> +    fadt->plvl3_lat = cpu_to_le16(f.plvl3_lat);
> +    fadt->flags = cpu_to_le32(f.flags);
> +    fadt->century = f.rtc_century;
> +    if (f.rev == 1) {
>          return;
>      }
>  
> -    fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_RESET_REG_SUP);
> -    fadt->reset_value = 0xf;
> -    fadt->reset_register.space_id = AML_SYSTEM_IO;
> -    fadt->reset_register.bit_width = 8;
> -    fadt->reset_register.address = cpu_to_le64(ICH9_RST_CNT_IOPORT);
> -    /* The above need not be conditional on machine type because the reset port
> -     * happens to be the same on PIIX (pc) and ICH9 (q35). */
> -    QEMU_BUILD_BUG_ON(ICH9_RST_CNT_IOPORT != RCR_IOPORT);
> +    fadt->reset_value = f.reset_val;
> +    fadt->reset_register = f.reset_reg;
> +    fadt->reset_register.address = cpu_to_le64(f.reset_reg.address);
>  
> -    fadt->xpm1a_event_block.space_id = AML_SYSTEM_IO;
> -    fadt->xpm1a_event_block.bit_width = fadt->pm1_evt_len * 8;
> -    fadt->xpm1a_event_block.address = cpu_to_le64(pm->io_base);
> +    fadt->xpm1a_event_block = f.pm1a_evt;
> +    fadt->xpm1a_event_block.address = cpu_to_le64(f.pm1a_evt.address);
>  
> -    fadt->xpm1a_control_block.space_id = AML_SYSTEM_IO;
> -    fadt->xpm1a_control_block.bit_width = fadt->pm1_cnt_len * 8;
> -    fadt->xpm1a_control_block.address = cpu_to_le64(pm->io_base + 0x4);
> +    fadt->xpm1a_control_block = f.pm1a_cnt;
> +    fadt->xpm1a_control_block.address = cpu_to_le64(f.pm1a_cnt.address);
>  
> -    fadt->xpm_timer_block.space_id = AML_SYSTEM_IO;
> -    fadt->xpm_timer_block.bit_width = fadt->pm_tmr_len * 8;
> -    fadt->xpm_timer_block.address = cpu_to_le64(pm->io_base + 0x8);
> +    fadt->xpm_timer_block = f.pm_tmr;
> +    fadt->xpm_timer_block.address = cpu_to_le64(f.pm_tmr.address);
>  
> -    fadt->xgpe0_block.space_id = AML_SYSTEM_IO;
> -    fadt->xgpe0_block.bit_width = pm->gpe0_blk_len * 8;
> -    fadt->xgpe0_block.address = cpu_to_le64(pm->gpe0_blk);
> +    fadt->xgpe0_block = f.gpe0_blk;
> +    fadt->xgpe0_block.address = cpu_to_le64(f.gpe0_blk.address);
>  }
>  
>  
>  /* FADT */
>  static void
> -build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
> -           unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
> +build_fadt(GArray *table_data, BIOSLinker *linker, AcpiFadtData *f,
>             const char *oem_id, const char *oem_table_id)
>  {
>      AcpiFadtDescriptorRev3 *fadt = acpi_data_push(table_data, sizeof(*fadt));
> @@ -347,29 +353,29 @@ build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
>      unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
>      unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
>      int fadt_size = sizeof(*fadt);
> -    int rev = 3;
>  
>      /* FACS address to be filled by Guest linker */
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->firmware_ctrl),
> -        ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
> +        ACPI_BUILD_TABLE_FILE, *f->facs_tbl_offset);
>  
>      /* DSDT address to be filled by Guest linker */
> -    fadt_setup(fadt, pm);
> +    fadt_setup(fadt, *f);
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
> -        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> -    if (pm->force_rev1_fadt) {
> -        rev = 1;
> +        ACPI_BUILD_TABLE_FILE, *f->dsdt_tbl_offset);
> +
> +    if (f->rev == 1) {
>          fadt_size = offsetof(typeof(*fadt), reset_register);
> -    } else {
> +    } else if (f->xdsdt_tbl_offset) {
I fail to understand why you added this check in this patch on not in
[PATCH v2 08/10] but anyway

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>          bios_linker_loader_add_pointer(linker,
>              ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
> -            ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> +            ACPI_BUILD_TABLE_FILE, *f->xdsdt_tbl_offset);
>      }
>  
>      build_header(linker, table_data,
> -                 (void *)fadt, "FACP", fadt_size, rev, oem_id, oem_table_id);
> +                (void *)fadt, "FACP", fadt_size, f->rev,
> +                oem_id, oem_table_id);
>  }
>  
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> @@ -2049,7 +2055,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
>      crs = aml_resource_template();
>      aml_append(crs,
> -        aml_io(AML_DECODE16, pm->gpe0_blk, pm->gpe0_blk, 1, pm->gpe0_blk_len)
> +        aml_io(
> +               AML_DECODE16,
> +               pm->fadt.gpe0_blk.address,
> +               pm->fadt.gpe0_blk.address,
> +               1,
> +               pm->fadt.gpe0_blk.bit_width / 8)
>      );
>      aml_append(dev, aml_name_decl("_CRS", crs));
>      aml_append(scope, dev);
> @@ -2696,7 +2707,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      /* ACPI tables pointed to by RSDT */
>      fadt = tables_blob->len;
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt(tables_blob, tables->linker, &pm, facs, dsdt,
> +    pm.fadt.facs_tbl_offset = &facs;
> +    pm.fadt.dsdt_tbl_offset = &dsdt;
> +    pm.fadt.xdsdt_tbl_offset = &dsdt;
> +    build_fadt(tables_blob, tables->linker, &pm.fadt,
>                 slic_oem.id, slic_oem.table_id);
>      aml_len += tables_blob->len - fadt;
>  
> 
