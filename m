Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1205022njf;
        Sun, 27 Oct 2024 19:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN5tAJJkAa+7Hl3bHFLFawVICuE3D5tMj6/MPjr8gNv0g6cxYnnY3PsHCYfvcSS0eVsr3lr75qcqarxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF0OcruLJ2+8rIgxZnBuRKX5YS9M+SOfy6Nok+JZyR+JVWH2ETH1DSdnJFOr4zqIQgQ61iI
X-Received: by 2002:a05:6902:154c:b0:e22:5db2:a950 with SMTP id 3f1490d57ef6-e3087c22341mr5678265276.39.1730082803075;
        Sun, 27 Oct 2024 19:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730082803; cv=none;
        d=google.com; s=arc-20240605;
        b=C4XhAmpf8nWyjEHV73DgaXLfe6FmXi5uLJyQnc+jXre08yXkAxkPprufukY3rTWJDT
         aLKmC50HU4k6xtF/RDMYf22KiPkSw/LhTpG+b85ClFVHmSx6DT1jBQOuq7poHAElk9vG
         1mcSpT5tufwrSBbxqwvVZwjplUKVslY656tvZarW9aMpF/G8OPwqWW0ifUnp2Tpjyo7G
         mvHQWOS8QrDbpbLCUACWa+OEP1L9ISjoE4QgNfOohx0WUdLVpWFORQRCbMvkeQGuxCZA
         rsKp8KOYChZr2vQnYzEQ8Z4dFEuHxnao1Msnhne4QzOb7X/7+WyPQNDBXEdlHzhaNJgQ
         Rl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=x4x//kc8+BCnkQuVwDaTdlhfy3ACgrvQulUJdmWx6kw=;
        fh=UUZ4Ci6bt9s+K93X7nn3UPoTO+k2Mou2Zx/rYafv0Qc=;
        b=TKbZb53O3XffLUB7RSE4Qk67EDVvRcHOhB7qRj4cCFh4cT2vD5C4DziA8Og2U9kU/l
         FPWBj3AWwFPMhtspilhJQJb0kd3Gxu7+8aKBO+tuc+5UqiZlrcurrHQNZo2KqItwFW69
         wiXVY84NLv/aH56+XCg8yryd4eczNoE73bnkvICiVMXBqXZAnrG6rFvuMovExP2lBEvf
         WczEz5y/Erny+moPCzsnFHCQoki2x9sSl/ow0H/e+aLtoEjmXLeArGSO6zRD7sakoKwj
         MVBT9gG6PRmAhSIWd8CdSaazyA7FCllnfpW1KEJKy1zWMovziuxyFGO0tErp2+pDbSG/
         TgaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46137a3c810si73336051cf.179.2024.10.27.19.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Oct 2024 19:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5FYx-0001MX-Rb; Sun, 27 Oct 2024 22:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1t5FYv-0001M7-PY; Sun, 27 Oct 2024 22:32:57 -0400
Received: from mail.loongson.cn ([114.242.206.163])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>)
 id 1t5FYs-0001qU-Cy; Sun, 27 Oct 2024 22:32:57 -0400
Received: from loongson.cn (unknown [10.20.42.62])
 by gateway (Coremail) with SMTP id _____8CxMK_I9x5nkMgXAA--.25875S3;
 Mon, 28 Oct 2024 10:32:40 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
 by front1 (Coremail) with SMTP id qMiowMAxXcLB9x5nOPcgAA--.40082S3;
 Mon, 28 Oct 2024 10:32:35 +0800 (CST)
Subject: Re: [PATCH v6 2/3] hw/acpi: Upgrade ACPI SPCR table to support SPCR
 table revision 4 format
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com
References: <20241028015744.624943-1-jeeheng.sia@starfivetech.com>
 <20241028015744.624943-3-jeeheng.sia@starfivetech.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <6c1a5935-31f5-8310-716b-1408e0cc44c8@loongson.cn>
Date: Mon, 28 Oct 2024 10:32:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20241028015744.624943-3-jeeheng.sia@starfivetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMAxXcLB9x5nOPcgAA--.40082S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxuw45AF43Kw45uF45XryDtwc_yoWxWrWkpr
 4qv343tr9xXryfZ3WayFnFkF1rWr4kGayj93yIkr18tay2g340vF1UKa1aka4ayw1kGFWk
 CFnFqF48Wa1xZFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc0eHDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=mail.loongson.cn
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.811,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ddqolr4RHP+R

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

On 2024/10/28 上午9:57, Sia Jee Heng wrote:
> Update the SPCR table to accommodate the SPCR Table revision 4 [1].
> The SPCR table has been modified to adhere to the revision 4 format [2].
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/acpi/aml-build.c         | 20 ++++++++++++++++----
>   hw/arm/virt-acpi-build.c    |  8 ++++++--
>   hw/loongarch/acpi-build.c   |  6 +++++-
>   hw/riscv/virt-acpi-build.c  | 12 +++++++++---
>   include/hw/acpi/acpi-defs.h |  7 +++++--
>   include/hw/acpi/aml-build.h |  2 +-
>   6 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 34e0ddbde8..69c4bdfa22 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1995,7 +1995,7 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>   
>   void build_spcr(GArray *table_data, BIOSLinker *linker,
>                   const AcpiSpcrData *f, const uint8_t rev,
> -                const char *oem_id, const char *oem_table_id)
> +                const char *oem_id, const char *oem_table_id, const char *name)
>   {
>       AcpiTable table = { .sig = "SPCR", .rev = rev, .oem_id = oem_id,
>                           .oem_table_id = oem_table_id };
> @@ -2041,9 +2041,21 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
>       build_append_int_noprefix(table_data, f->pci_flags, 4);
>       /* PCI Segment */
>       build_append_int_noprefix(table_data, f->pci_segment, 1);
> -    /* Reserved */
> -    build_append_int_noprefix(table_data, 0, 4);
> -
> +    if (rev < 4) {
> +        /* Reserved */
> +        build_append_int_noprefix(table_data, 0, 4);
> +    } else {
> +        /* UartClkFreq */
> +        build_append_int_noprefix(table_data, f->uart_clk_freq, 4);
> +        /* PreciseBaudrate */
> +        build_append_int_noprefix(table_data, f->precise_baudrate, 4);
> +        /* NameSpaceStringLength */
> +        build_append_int_noprefix(table_data, f->namespace_string_length, 2);
> +        /* NameSpaceStringOffset */
> +        build_append_int_noprefix(table_data, f->namespace_string_offset, 2);
> +        /* NamespaceString[] */
> +        g_array_append_vals(table_data, name, f->namespace_string_length);
> +    }
>       acpi_table_end(linker, &table);
>   }
>   /*
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f76fb117ad..0b6f5f8d8d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -464,8 +464,12 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           .pci_flags = 0,
>           .pci_segment = 0,
>       };
> -
> -    build_spcr(table_data, linker, &serial, 2, vms->oem_id, vms->oem_table_id);
> +    /*
> +     * Passing NULL as the SPCR Table for Revision 2 doesn't support
> +     * NameSpaceString.
> +     */
> +    build_spcr(table_data, linker, &serial, 2, vms->oem_id, vms->oem_table_id,
> +               NULL);
>   }
>   
>   /*
> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> index 50709bda0f..4e04f7b6c1 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -276,8 +276,12 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       };
>   
>       lvms = LOONGARCH_VIRT_MACHINE(machine);
> +    /*
> +     * Passing NULL as the SPCR Table for Revision 2 doesn't support
> +     * NameSpaceString.
> +     */
>       build_spcr(table_data, linker, &serial, 2, lvms->oem_id,
> -               lvms->oem_table_id);
> +               lvms->oem_table_id, NULL);
>   }
>   
>   typedef
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 36d6a3a412..68ef15acac 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -200,14 +200,15 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>   
>   /*
>    * Serial Port Console Redirection Table (SPCR)
> - * Rev: 1.07
> + * Rev: 1.10
>    */
>   
>   static void
>   spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>   {
> +    const char name[] = ".";
>       AcpiSpcrData serial = {
> -        .interface_type = 0,       /* 16550 compatible */
> +        .interface_type = 0x12,       /* 16550 compatible */
>           .base_addr.id = AML_AS_SYSTEM_MEMORY,
>           .base_addr.width = 32,
>           .base_addr.offset = 0,
> @@ -229,9 +230,14 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>           .pci_function = 0,
>           .pci_flags = 0,
>           .pci_segment = 0,
> +        .uart_clk_freq = 0,
> +        .precise_baudrate = 0,
> +        .namespace_string_length = sizeof(name),
> +        .namespace_string_offset = 88,
>       };
>   
> -    build_spcr(table_data, linker, &serial, 2, s->oem_id, s->oem_table_id);
> +    build_spcr(table_data, linker, &serial, 4, s->oem_id, s->oem_table_id,
> +               name);
>   }
>   
>   /* RHCT Node[N] starts at offset 56 */
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 0e6e82b339..2e6e341998 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -112,7 +112,6 @@ typedef struct AcpiSpcrData {
>       uint8_t flow_control;
>       uint8_t terminal_type;
>       uint8_t language;
> -    uint8_t reserved1;
>       uint16_t pci_device_id;    /* Must be 0xffff if not PCI device */
>       uint16_t pci_vendor_id;    /* Must be 0xffff if not PCI device */
>       uint8_t pci_bus;
> @@ -120,7 +119,11 @@ typedef struct AcpiSpcrData {
>       uint8_t pci_function;
>       uint32_t pci_flags;
>       uint8_t pci_segment;
> -    uint32_t reserved2;
> +    uint32_t uart_clk_freq;
> +    uint32_t precise_baudrate;
> +    uint32_t namespace_string_length;
> +    uint32_t namespace_string_offset;
> +    char namespace_string[];
>   } AcpiSpcrData;
>   
>   #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index a3784155cb..68c0f2dbee 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -500,5 +500,5 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>   
>   void build_spcr(GArray *table_data, BIOSLinker *linker,
>                   const AcpiSpcrData *f, const uint8_t rev,
> -                const char *oem_id, const char *oem_table_id);
> +                const char *oem_id, const char *oem_table_id, const char *name);
>   #endif
> 

