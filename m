Received: by 10.25.21.156 with SMTP id 28csp2982876lfv;
        Mon, 8 Aug 2016 02:02:43 -0700 (PDT)
X-Received: by 10.55.162.67 with SMTP id l64mr26764355qke.106.1470646963272;
        Mon, 08 Aug 2016 02:02:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l55si19377272qta.11.2016.08.08.02.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 02:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWgSI-0004Ri-Lb
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 05:02:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bWgRW-0003t4-0s
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 05:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bWgRU-0007Gl-NK
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 05:01:54 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bWgRM-0007Fi-3w; Mon, 08 Aug 2016 05:01:44 -0400
Received: by mail-wm0-x242.google.com with SMTP id i5so14133067wmg.2;
	Mon, 08 Aug 2016 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=YH3rxehuZMYboQikewTz0Y6pLwH50y1YIrbPrmyuLcI=;
	b=GGn1Pl0uvZEc2Hpsi6Nt5/o8885d7/kfoo+OIhMMwQnVHwVV6i+7/SWgJH4eDvW54G
	33S9bDUSluha6CY9uYl7VL0oHsBjpmrSSVIfanJu2QfPj9Y8WQDHQaQJ9+Cnv0csiRLR
	hBELYBDGJrY24jNDf//Rh70WjDyawkzwiWnDySFAgr6arXgxvmCp2uYgj2AoAkoUVdAZ
	/6HNQsNr83EMDX9VJaoKGRZRLOWmPC2BJbc/4Hmql/PQa71ZwyG2ceDybhOO6ZxVGPv9
	5IeNEVYqMDU9Ep8/NuYWxa6jIKj9j1qNezOfkCfj9LVPyL46vMHV+4nlOnpvQT921Fsx
	nZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YH3rxehuZMYboQikewTz0Y6pLwH50y1YIrbPrmyuLcI=;
	b=coFXO9LG9oMHR/rGW5JMaEfSw+KrPKBztplETUVFEzEkPnvx94NaU3i9S8xR8pVPgA
	BSBVA03FehmhV/esHUiusbFqVplp0pR3X+IyDwXr9hwVRxrH/STxuz1X4zAoZ06Ipabj
	UZUinbYD1pEr94GK1C23VQhBt1bIhNSrCwf0RH3rhQ31bIH8W8H+QtFfxQIGfEYbUQ/I
	uEGH6RGG2+O2gZsXuhLn/MFVJvcx4x1QfIAlo7Z06nFcXH6ice5PbQuMs+zCG/kuEbzq
	BonfbJmQ30WcyHw28p3l6P3KYYZQZTEamGls1q4Zph+sRGIxPFxGdv6X6uql8Wh7vRxP
	/zIg==
X-Gm-Message-State: AEkooutsLfLAh5HAEi88Zm0YDUmKzbhCjv7V4xjLsKF1Qla0YBFB7/nMAXou4t2NcXl7rw==
X-Received: by 10.194.185.202 with SMTP id fe10mr79357189wjc.93.1470646903155; 
	Mon, 08 Aug 2016 02:01:43 -0700 (PDT)
Received: from [10.201.49.221] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.googlemail.com with ESMTPSA id
	a2sm31773996wjg.46.2016.08.08.02.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 02:01:42 -0700 (PDT)
To: Lv Zheng <lv.zheng@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<a0a25b78b9a593b7cf3c73b54342ee9b331688da.1470643610.git.lv.zheng@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddc6e401-27c3-adb8-74f4-bbca022c6a4b@redhat.com>
Date: Mon, 8 Aug 2016 11:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <a0a25b78b9a593b7cf3c73b54342ee9b331688da.1470643610.git.lv.zheng@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [PATCH v2] ACPI: Add -acpifadt to allow FADT
 revision changes
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Lv Zheng <zetalog@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMn2m9KgPh5j



On 08/08/2016 10:16, Lv Zheng wrote:
> This patch allows FADT to be built with different revisions. When the revision
> is greater than 1.0, 64-bit address fields may also be filled.
> 
> Note that FADT revision 2 has never been defined by the ACPI specification. So
> this patch only adds an option -acpifadt to allow revision 1,3,5 to be
> configured by the users.
> 
> 1. Tested by booting a linux image, the 64-bit addresses are correctly filled
>    in the dumped FADT.
> 2. Tested by booting a Windows image, no boot failure can be seen.
> 
> Signed-off-by: Lv Zheng <lv.zheng@intel.com>

Hi, please make this a suboption of -acpitable instead.  We try not to
add new command-line options without supporting them in QemuOpts too.

Paolo

> ---
> History:
> 
> v2: Fix coding style issues.
> ---
>  hw/i386/acpi-build.c   |   62 ++++++++++++++++++++++++++++++++++++++++++------
>  include/hw/acpi/acpi.h |    1 +
>  qemu-options.hx        |    9 +++++++
>  vl.c                   |   23 ++++++++++++++++++
>  4 files changed, 88 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ce7cbc5..4479695 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -276,8 +276,22 @@ build_facs(GArray *table_data, BIOSLinker *linker)
>      facs->length = cpu_to_le32(sizeof(*facs));
>  }
>  
> +/* GAS */
> +static void
> +build_gas(struct AcpiGenericAddress *gas, uint8_t space_id,
> +          uint8_t bit_width, uint8_t bit_offset,
> +          uint8_t access_width, uint64_t address)
> +{
> +    gas->space_id = space_id;
> +    gas->bit_width = bit_width;
> +    gas->bit_offset = bit_offset;
> +    gas->access_width = access_width;
> +    gas->address = address;
> +}
> +
>  /* Load chipset information in FADT */
> -static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
> +static void fadt_setup(AcpiFadtDescriptorRev5_1 *fadt, AcpiPmInfo *pm,
> +                       uint8_t revision)
>  {
>      fadt->model = 1;
>      fadt->reserved1 = 0;
> @@ -309,6 +323,25 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
>          fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL);
>      }
>      fadt->century = RTC_CENTURY;
> +
> +    /* Build ACPI 2.0 (FADT version 3+) GAS fields */
> +    if (revision >= 3) {
> +        /* EVT, CNT, TMR register matches hw/acpi/core.c */
> +        build_gas(&fadt->xpm1a_event_block, AML_SYSTEM_IO,
> +                  32, 0, 0, cpu_to_le64(pm->io_base));
> +        build_gas(&fadt->xpm1a_control_block, AML_SYSTEM_IO,
> +                  16, 0, 0, cpu_to_le64(pm->io_base + 0x04));
> +        build_gas(&fadt->xpm_timer_block, AML_SYSTEM_IO,
> +                  32, 0, 0, cpu_to_le64(pm->io_base + 0x08));
> +        build_gas(&fadt->xgpe0_block, AML_SYSTEM_IO,
> +                  pm->gpe0_blk_len << 3, 0, 0, cpu_to_le64(pm->gpe0_blk));
> +    }
> +
> +    /* Build dummy ACPI 5.0 fields */
> +    if (revision >= 5) {
> +        build_gas(&fadt->sleep_control, AML_SYSTEM_MEMORY, 0, 0, 0, 0);
> +        build_gas(&fadt->sleep_status, AML_SYSTEM_MEMORY, 0, 0, 0, 0);
> +    }
>  }
>  
>  
> @@ -316,9 +349,9 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
>  static void
>  build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
>             unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
> -           const char *oem_id, const char *oem_table_id)
> +           const char *oem_id, const char *oem_table_id, uint8_t revision)
>  {
> -    AcpiFadtDescriptorRev1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
> +    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
>      unsigned fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
>      unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
>  
> @@ -328,13 +361,28 @@ build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
>          ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
>  
>      /* DSDT address to be filled by Guest linker */
> -    fadt_setup(fadt, pm);
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
>          ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
>  
> -    build_header(linker, table_data,
> -                 (void *)fadt, "FACP", sizeof(*fadt), 1, oem_id, oem_table_id);
> +    if (revision > 2) {
> +        fw_ctrl_offset = (char *)&fadt->Xfacs - table_data->data;
> +        dsdt_entry_offset = (char *)&fadt->Xdsdt - table_data->data;
> +
> +        /* FACS address to be filled by Guest linker */
> +        bios_linker_loader_add_pointer(linker,
> +            ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->Xfacs),
> +            ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
> +
> +        /* DSDT address to be filled by Guest linker */
> +        bios_linker_loader_add_pointer(linker,
> +            ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->Xdsdt),
> +            ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> +    }
> +
> +    fadt_setup(fadt, pm, revision);
> +    build_header(linker, table_data, (void *)fadt, "FACP", sizeof(*fadt),
> +                 revision, oem_id, oem_table_id);
>  }
>  
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> @@ -2681,7 +2729,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      fadt = tables_blob->len;
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt(tables_blob, tables->linker, &pm, facs, dsdt,
> -               slic_oem.id, slic_oem.table_id);
> +               slic_oem.id, slic_oem.table_id, acpi_fadt_rev);
>      aml_len += tables_blob->len - fadt;
>  
>      acpi_add_table(table_offsets, tables_blob);
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index 7b3d93c..63df38d 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -173,6 +173,7 @@ void acpi_update_sci(ACPIREGS *acpi_regs, qemu_irq irq);
>  
>  /* acpi.c */
>  extern int acpi_enabled;
> +extern uint8_t acpi_fadt_rev;
>  extern char unsigned *acpi_tables;
>  extern size_t acpi_tables_len;
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a71aaf8..cff34f6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1492,6 +1492,15 @@ STEXI
>  Disable HPET support.
>  ETEXI
>  
> +DEF("acpifadt", HAS_ARG, QEMU_OPTION_acpifadt, \
> +    "-acpifadt  n    configure FADT revision number (1, 3, 5)\n",
> +    QEMU_ARCH_ALL)
> +STEXI
> +@item -acpifadt @var{n}
> +@findex -acpifadt
> +Configure FADT revision number, default is 1.
> +ETEXI
> +
>  DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
>      "-acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n][,asl_compiler_id=str][,asl_compiler_rev=n][,{data|file}=file1[:file2]...]\n"
>      "                ACPI table description\n", QEMU_ARCH_I386)
> diff --git a/vl.c b/vl.c
> index e7c2c62..220e36d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -64,6 +64,7 @@ int main(int argc, char **argv)
>  #include "hw/bt.h"
>  #include "sysemu/watchdog.h"
>  #include "hw/smbios/smbios.h"
> +#include "hw/acpi/acpi.h"
>  #include "hw/xen/xen.h"
>  #include "hw/qdev.h"
>  #include "hw/loader.h"
> @@ -158,6 +159,7 @@ int max_cpus = 1;
>  int smp_cores = 1;
>  int smp_threads = 1;
>  int acpi_enabled = 1;
> +uint8_t acpi_fadt_rev = 1;
>  int no_hpet = 0;
>  int fd_bootchk = 1;
>  static int no_reboot;
> @@ -2301,6 +2303,24 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
>      return 0;
>  }
>  
> +static void fadt_parse(const char *arg)
> +{
> +    unsigned long rev;
> +    int err;
> +
> +    err = qemu_strtoul(arg, NULL, 10, &rev);
> +    if (err) {
> +        error_printf("Invalid FADT revision.\n");
> +        exit(1);
> +    }
> +    if (rev != 1 && rev != 3 && rev != 5) {
> +        error_printf("Unsupported FADT revision %lu, "
> +                     "please specify 1,3,5.\n", rev);
> +        exit(1);
> +    }
> +    acpi_fadt_rev = rev;
> +}
> +
>  static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      return qdev_device_help(opts);
> @@ -3622,6 +3642,9 @@ int main(int argc, char **argv, char **envp)
>                  qdev_prop_register_global(&slew_lost_ticks);
>                  break;
>              }
> +            case QEMU_OPTION_acpifadt:
> +                fadt_parse(optarg);
> +                break;
>              case QEMU_OPTION_acpitable:
>                  opts = qemu_opts_parse_noisily(qemu_find_opts("acpi"),
>                                                 optarg, true);
> 
