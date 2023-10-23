Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1356720ejb;
        Mon, 23 Oct 2023 06:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQPGyqyLrY/YQEcVsnRxkzBKPfzlZghInebZ4lYxf3B1OzqznhEdp60ssQsz+RjLrS9cic
X-Received: by 2002:a54:4581:0:b0:3a8:ccf0:103f with SMTP id z1-20020a544581000000b003a8ccf0103fmr10261352oib.3.1698067083815;
        Mon, 23 Oct 2023 06:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698067083; cv=none;
        d=google.com; s=arc-20160816;
        b=YfBFDbHrYuodVHfAAVU/t3SU0g6LsQUzx3PPpT8n/jtW15G8KFl4faBPofC5X2Wna9
         OpQWhx+IwTIS6qpcAtsuLkA1WLrz97p4Ld5pf00x3M4dFJUjdlpO/8lYtEecSTExa1aG
         q3mgZouAG/874B3at8iHA+mlhFzxVqn3tmazQ8JteTXXVj8sMkmrdKsZs8UVaVFlfL7A
         kwarb/wB50s0N/YImiD7vDqNq6SfK/uyCUia3xNac/fP4QRP1R90wNcAzpwUDMaeMVFa
         cbZAheMpWNifO2CYhIcroPd0NIaAXW7sHbk2pL566FasprBVR5sOWbbrL7UKTGAuXYQW
         RiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=08Ns5r0OQR+V9W8vMSPerOUKx+75ry4tY92zwJak5PU=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=tzGjP2isZOuV/MwwsyiA98Mx6fVxFGPL0nKgm1E8dSfIDNmPsPulUOMvUTedhodFDv
         5zfwerVPWtnP6/cFzu0w3WDHZG1iV8H35VDjFk4IfmgzYVcujVYvrVA+uPJb3eRlyUZb
         nrs41OiPLUZXqxtShPpMC6MwZsoRRzgHlDcKj05LWWXXfaiH+KLgUvv+b9mdZWlWcat8
         8dhoLxILMviQIBgvB/BIYp8nyJQij/aa+uVS6bJ6+lh5n+hYEB13XeELHTjxM4g+gmJR
         y2UXw+VQEtKajTyuVWuVUs33wYNlwFiRgN7iW9W7M88XoEVq/dbNSU4vpTx+MqP/BAWn
         BzQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JqLZnf1c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020a05620a414a00b00778a4a58bedsi5728930qko.659.2023.10.23.06.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 06:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JqLZnf1c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quuoR-0003wH-NV; Mon, 23 Oct 2023 09:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuoE-0003ky-2d
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 09:17:30 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuoA-0002Ei-H0
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 09:17:29 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so468640466b.2
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698067045; x=1698671845; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=08Ns5r0OQR+V9W8vMSPerOUKx+75ry4tY92zwJak5PU=;
 b=JqLZnf1c8wutxBxgZaASw0k8SE18Q1uuD78bsFGrAUMQgZf3+zyFAhiZ0KqtqXPEV2
 A+nWw0dpGGWLEh13sfzPkMQ42aNapOQWqRX5XoqEO8Jr3iqWQbGOwzYsxHyafb35xMiA
 C/zWuwChjpvfhvgIFO4xJWg7EWCa9QB5A2pX6MAKIwimpJIgYRu0M4YWnQQeSVdc/MOK
 7j4K1UWeO2IY1NXP9KNSUfYbN5U14yd2SO0jWXMO4NN5tW4bkcMeUraaqs1j7xTRKl5O
 HdksOkGF6+ELOaiEAmrMiBwPReuAb8HKPOug/nfVrDCzHO/cCOApASz04HUtccQBjPxN
 yH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698067045; x=1698671845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=08Ns5r0OQR+V9W8vMSPerOUKx+75ry4tY92zwJak5PU=;
 b=iN88wPYT3MZ84jW+Nsybr/y/NNH4IBJ7HZCeJ7VB37AsU3t3Zzo+tmuFtDTNlFa6HO
 O+OpsjJm4arx361ZFfj3nyxGSC05fX40oJY2stUp/oCkHYCp8jSvFXi/REwSQ7UoIAkY
 JSfoONfsnoHrdRfPzjfXNzdr5Ti83spO1A94K2SuZwWnlZlwtBPL7Zk7wasVNeZg1Q0J
 Gpjg3Qecg3J0Nq2Gxh2UYQ8NoupAYhAQ9bkpFM2fJNvdYiBsXuKV4eQdbsst1/HO3buN
 Z9HTefCo4PB0NemVFTCeNBmHaSV0oyFn0sQAQd3Q66yEreTJ416h4ZNOxjkxDlxDTg0b
 uvDQ==
X-Gm-Message-State: AOJu0Yx+51icMaYXzApBBix9wlGSErZDI5oh+6hsOpaQVWUNWRcwTKXh
 JOuq15iA2CgyCbTMbMpgFAJBkw==
X-Received: by 2002:a17:907:25c3:b0:9ae:5c99:f2e2 with SMTP id
 ae3-20020a17090725c300b009ae5c99f2e2mr6997333ejc.43.1698067044174; 
 Mon, 23 Oct 2023 06:17:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ga23-20020a170906b85700b009b65b2be80bsm6611455ejb.76.2023.10.23.06.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:17:23 -0700 (PDT)
Date: Mon, 23 Oct 2023 15:17:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v3 07/12] hw/riscv/virt-acpi-build.c: Add CMO information
 in RHCT
Message-ID: <20231023-c3b85e7af47edaaba7eedd6e@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-8-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 660cVBdJ/8rg

On Thu, Oct 19, 2023 at 06:56:43PM +0530, Sunil V L wrote:
> When CMO related extensions like Zicboz, Zicbom and Zicbop are enabled, the
> block size for those extensions need to be communicated via CMO node in
> RHCT. Add CMO node in RHCT if any of those CMO extensions are detected.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8fa358d034..bf47eef792 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -147,6 +147,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>   * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
>   * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
>   *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> + *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
>   */
>  static void build_rhct(GArray *table_data,
>                         BIOSLinker *linker,
> @@ -156,8 +157,8 @@ static void build_rhct(GArray *table_data,
>      MachineState *ms = MACHINE(s);
>      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
>      size_t len, aligned_len;
> -    uint32_t isa_offset, num_rhct_nodes;
> -    RISCVCPU *cpu;
> +    uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
> +    RISCVCPU *cpu = &s->soc[0].harts[0];
>      char *isa;
>  
>      AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> @@ -173,6 +174,9 @@ static void build_rhct(GArray *table_data,
>  
>      /* ISA + N hart info */
>      num_rhct_nodes = 1 + ms->smp.cpus;
> +    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
> +        num_rhct_nodes++;
> +    }
>  
>      /* Number of RHCT nodes*/
>      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> @@ -184,7 +188,6 @@ static void build_rhct(GArray *table_data,
>      isa_offset = table_data->len - table.table_offset;
>      build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
>  
> -    cpu = &s->soc[0].harts[0];
>      isa = riscv_isa_string(cpu);
>      len = 8 + strlen(isa) + 1;
>      aligned_len = (len % 2) ? (len + 1) : len;
> @@ -200,14 +203,59 @@ static void build_rhct(GArray *table_data,
>          build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
>      }
>  
> +    /* CMO node */
> +    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
> +        cmo_offset = table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 1, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 10, 2);   /* Total Length */

Comment should be "Length"

> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +
> +        /* CBOM block size */
> +        if (cpu->cfg.cbom_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cbom_blocksize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +
> +        /* CBOP block size */
> +        build_append_int_noprefix(table_data, 0, 1);
> +
> +        /* CBOZ block size */
> +        if (cpu->cfg.cboz_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cboz_blocksize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +    }
> +
>      /* Hart Info Node */
>      for (int i = 0; i < arch_ids->len; i++) {
> +        len = 16;
> +        int num_offsets = 1;
>          build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> -        build_append_int_noprefix(table_data, 16, 2);      /* Length */
> -        build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
> -        build_append_int_noprefix(table_data, 1, 2);    /* Number of offsets */
> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> -        build_append_int_noprefix(table_data, isa_offset, 4); /* Offsets[0] */
> +
> +        /* Length */
> +        if (cmo_offset) {
> +            len += 4;
> +            num_offsets++;
> +        }
> +
> +        build_append_int_noprefix(table_data, len, 2);

Missing "Length" comment

> +        build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
> +        /* Number of offsets */
> +        build_append_int_noprefix(table_data, num_offsets, 2);
> +        build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
> +
> +        /* Offsets */
> +        build_append_int_noprefix(table_data, isa_offset, 4);
> +        if (cmo_offset) {
> +            build_append_int_noprefix(table_data, cmo_offset, 4);
> +        }
>      }
>  
>      acpi_table_end(linker, &table);
> -- 
> 2.34.1
>

Thanks,
drew
