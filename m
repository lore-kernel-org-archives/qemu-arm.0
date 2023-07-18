Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6616383eje;
        Tue, 18 Jul 2023 13:06:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEQiIk9031DH/lc7R7C5WKjkZWf/HKZkeAC3auXHtrYNwshLC7QDAmUG1U1mDODcOIUFvPQ
X-Received: by 2002:a67:bd13:0:b0:445:209:cac7 with SMTP id y19-20020a67bd13000000b004450209cac7mr352792vsq.27.1689710793141;
        Tue, 18 Jul 2023 13:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689710793; cv=none;
        d=google.com; s=arc-20160816;
        b=o1LJBNtTZ24S9LEezQ3gqZzdjukZ7JwuXpbB7IlVm+b+xv2f4RUEbG38rZ/B+BVnLD
         17zB0F0t/GgpkIp/vFetuhbmlGeEaJm5CpsEAHY9hZtirGWIqTdkvcKggKEjKi3GNfDA
         GIb39tFx5wnRNJJW2nyCWJvlx8fE6ls6utyUr/H0mUa6k58Hjw5Fs/JsPbTahjAin9/y
         dVE6XlFjvqlruaA4f9dLxPDFW2BjxekREEM7bSTAz3vgdXs1t3qpdFVh2Ps79EcBuM4A
         /AgbMi438ShJDMyuOEe5TgynAqc0N5dm8SsYEEfDxyhvLdPXBm6UbzQA77FLVS84C7hQ
         uitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6ZGZx9XKmBs5vHb8DWL0de08tI/GqS6blNX40omnM1w=;
        fh=NddmdC0H7Yvd15BYzKWOWZBS0FBdcJ9zE0BWGJ3GxJc=;
        b=Q3pzGbrv16IjOVN/1pdde+F2rXwKqAvwO8ZN47tQW2wc1fPcM96QBhjLPhEDOi+M3/
         3DWQIWR11+fRckknaT2XpMJE0uYyfgJ9M8cTqK6MV8GzIARRxN1rUEFtfZ6DzrgzAMAN
         BBrOBxRqHy5c/JtWnu3JB/R4wmeGYwc8oLUH3FXmNKCN1lOB9wPj7hKk1c5mFP81qAmI
         RHOt3Sjq4/HAx4BuM2wze82lySL3xDt9hMvVSJ+9ywrn38GrSc9sk9HroEzO4RuUTs0N
         x9WPD6+REq8caM7+RtCI8BfYIPuRdrt1ppFgps1bSsSQ9zPy8lNox3aDnfJk+fa5kbtq
         JtvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="b9M/IWpC";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18-20020a0cfa12000000b0063c6c46a618si1721679qvn.186.2023.07.18.13.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 13:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="b9M/IWpC";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qLqxf-0002co-GF; Tue, 18 Jul 2023 16:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqxe-0002VH-2A
 for qemu-devel@nongnu.org; Tue, 18 Jul 2023 16:06:18 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqxa-0004qn-G0
 for qemu-devel@nongnu.org; Tue, 18 Jul 2023 16:06:17 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1b03ec2015fso4295818fac.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jul 2023 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689710772; x=1692302772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ZGZx9XKmBs5vHb8DWL0de08tI/GqS6blNX40omnM1w=;
 b=b9M/IWpCAlhnFLvmWVVWAS3sRuIm6/D5nM//SlgeyPdCmpOsm/ItoalW8F334muRoO
 Pacg+E8WbW3i15XTvrQZhMRMHayKjBKqQt01o4qHeytP3upcDDwS2g5z95DMJE4Hgqbz
 eGBu71SVH+IHXnGGoz27pTEakmCqMJViw/awvpcRzqlZN/90ZA6FbF8dIldE2rEC0iXM
 53nh6NkyV/1N+Fg98fO+LTG87NCV+nrlFLsu7T+oMqyWoUEjYuWersuEX38SldL1soJU
 /GnMN/MfTAhX3HaEHhjVBmhCtRXIiyzeoK+BiOUXRo58omHuRmoaZ+d2ZWCD6zrRFiar
 1sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689710772; x=1692302772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZGZx9XKmBs5vHb8DWL0de08tI/GqS6blNX40omnM1w=;
 b=BCWXWZyHLi0ZhAAoVCw61TJrNhwmXHbyb76POXIzSaMcAvg30Irhsqf4NN+5XGce9i
 2ZLtxXZJjt3+Cv6vKPiS7J5sIWVJIAbSQf+D+2j64lVx4TdxJ1G2mYf3ZtWqUKqWRjyd
 znToWxeFQu/XKpuuQokZN+B0sjkenIMlc+s7qA/oXqJHxeQu+qdUmQR5ZX5OnjxHi5Ic
 vqOeoxIGg4ESEGPvpZNNrBU2tVzJSN5ohx/xHuZRDHymHZybp/CJekKnKDU6cZs8YnZq
 AsuIqzQEIF1769Syo9YyaEmooZVOPc2uCAyin5dz9pnugFBtkYR1OPkMgZtM+VYtEj4Y
 NB4A==
X-Gm-Message-State: ABy/qLZIJw9+ARKbwmj4ySddAgA4bhERHKy5uUwNfIJ2Yc/B23WX6Y68
 1dVmgqqGD3TprVu8VqGMSjuJgw==
X-Received: by 2002:a05:6870:b311:b0:1b0:1e3b:5c21 with SMTP id
 a17-20020a056870b31100b001b01e3b5c21mr323400oao.1.1689710772220; 
 Tue, 18 Jul 2023 13:06:12 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 i2-20020a056870044200b001ad21a705a8sm1256406oak.49.2023.07.18.13.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:06:11 -0700 (PDT)
Message-ID: <e39b1816-7e08-fb1d-6c17-97e15af625d2@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:06:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/10] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-6-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-6-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uk/g43vrfWaz



On 7/12/23 13:39, Sunil V L wrote:
> Update the RINTC structure in MADT with AIA related fields.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 01843e4509..12b8ef0352 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -37,6 +37,7 @@
>   #include "hw/intc/riscv_aclint.h"
>   
>   #define ACPI_BUILD_TABLE_SIZE             0x20000
> +#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
>   
>   typedef struct AcpiBuildState {
>       /* Copy of table in RAM (for patching) */
> @@ -57,18 +58,42 @@ static void acpi_align_size(GArray *blob, unsigned align)
>   }
>   
>   static void riscv_acpi_madt_add_rintc(uint32_t uid,
> +                                      uint32_t local_cpu_id,
>                                         const CPUArchIdList *arch_ids,
> -                                      GArray *entry)
> +                                      GArray *entry,
> +                                      RISCVVirtAIAType aia_type,
> +                                      uint64_t imsic_addr,
> +                                      uint32_t imsic_size)
>   {
>       uint64_t hart_id = arch_ids->cpus[uid].arch_id;
>   
>       build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
> -    build_append_int_noprefix(entry, 20, 1);         /* Length   */
> +    build_append_int_noprefix(entry, 36, 1);         /* Length   */
>       build_append_int_noprefix(entry, 1, 1);          /* Version  */
>       build_append_int_noprefix(entry, 0, 1);          /* Reserved */
>       build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
>       build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
>       build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
> +    /* External Interrupt Controller ID */
> +    if (aia_type == VIRT_AIA_TYPE_APLIC) {
> +        build_append_int_noprefix(entry,
> +                                  ACPI_BUILD_INTC_ID(
> +                                      arch_ids->cpus[uid].props.node_id,
> +                                      local_cpu_id),
> +                                  4);
> +    } else {
> +        build_append_int_noprefix(entry, 0, 4);
> +    }
> +
> +    if (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> +        /* IMSIC Base address */
> +        build_append_int_noprefix(entry, imsic_addr, 8);
> +        /* IMSIC Size */
> +        build_append_int_noprefix(entry, imsic_size, 4);
> +    } else {
> +        build_append_int_noprefix(entry, 0, 8);
> +        build_append_int_noprefix(entry, 0, 4);
> +    }
>   }
>   
>   static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> @@ -76,6 +101,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>       MachineClass *mc = MACHINE_GET_CLASS(s);
>       MachineState *ms = MACHINE(s);
>       const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
> +    uint64_t imsic_socket_addr, imsic_addr;
> +    uint8_t  guest_index_bits;
> +    uint32_t imsic_size, local_cpu_id, socket_id;
> +
> +    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
>   
>       for (int i = 0; i < arch_ids->len; i++) {
>               Aml *dev;
> @@ -86,8 +116,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>               aml_append(dev, aml_name_decl("_UID",
>                          aml_int(arch_ids->cpus[i].arch_id)));
>   
> +            socket_id = arch_ids->cpus[i].props.node_id;
> +            local_cpu_id = (arch_ids->cpus[i].arch_id -
> +                            riscv_socket_first_hartid(ms, socket_id)) %
> +                            riscv_socket_hart_count(ms, socket_id);
>               /* build _MAT object */
> -            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
> +            imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
> +                                (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> +            imsic_addr = imsic_socket_addr +
> +                         local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> +            imsic_size = IMSIC_HART_SIZE(guest_index_bits);
> +
> +            riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, madt_buf,
> +                                      s->aia_type, imsic_addr, imsic_size);
>               aml_append(dev, aml_name_decl("_MAT",
>                                             aml_buffer(madt_buf->len,
>                                             (uint8_t *)madt_buf->data)));
> @@ -226,6 +267,7 @@ static void build_dsdt(GArray *table_data,
>    * 5.2.12 Multiple APIC Description Table (MADT)
>    * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
>    *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> + *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
>    */
>   static void build_madt(GArray *table_data,
>                          BIOSLinker *linker,
> @@ -234,6 +276,12 @@ static void build_madt(GArray *table_data,
>       MachineClass *mc = MACHINE_GET_CLASS(s);
>       MachineState *ms = MACHINE(s);
>       const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
> +    uint64_t imsic_socket_addr, imsic_addr;
> +    uint8_t  guest_index_bits;
> +    uint32_t imsic_size;
> +    uint32_t local_cpu_id, socket_id;
> +
> +    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
>   
>       AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
>                           .oem_table_id = s->oem_table_id };
> @@ -245,7 +293,17 @@ static void build_madt(GArray *table_data,
>   
>       /* RISC-V Local INTC structures per HART */
>       for (int i = 0; i < arch_ids->len; i++) {
> -        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
> +        socket_id = arch_ids->cpus[i].props.node_id;
> +        local_cpu_id = (arch_ids->cpus[i].arch_id -
> +                       riscv_socket_first_hartid(ms, socket_id)) %
> +                       riscv_socket_hart_count(ms, socket_id);
> +        imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
> +                            (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> +        imsic_addr = imsic_socket_addr +
> +                     local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> +        imsic_size = IMSIC_HART_SIZE(guest_index_bits);
> +        riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, table_data,
> +                                  s->aia_type, imsic_addr, imsic_size);
>       }
>   
>       acpi_table_end(linker, &table);
