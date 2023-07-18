Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6620301eje;
        Tue, 18 Jul 2023 13:13:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE2YS1K8Bf/R0oo7ibOrrV1NlY5t60OUdDZ+pGZhGznyCEuT/J3w1PUbYWupRLUFq+Qu89f
X-Received: by 2002:a05:6358:899:b0:135:6354:bafc with SMTP id m25-20020a056358089900b001356354bafcmr6405778rwj.2.1689711185486;
        Tue, 18 Jul 2023 13:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689711185; cv=none;
        d=google.com; s=arc-20160816;
        b=fHFYBgxM31GxE/INMcvPmVob8pRVJilTQzfcXBe/O9G21s+6N5z/enu2/CNSH9o8ue
         cdNh3BNe0e3oGQDqGk+5D4R2sMHt39ppGY5bZ9qJov6m6cnUA/Uv6XXqH66jjbl4Bu6/
         NCb/8NP06bO4905JA7asaGG/EMe0OVluVVtOe/1YFwwvvTxCLRWCZGRAbx014AR5SnQP
         8OPankkTaPuHUjJpLqLdcRLr1rZP54Z8v2gGX6EJCROiTo2TTKCWrG52+NmnMQ5RW3iS
         qqU1fuVz/0P4zNwtqmQydcfReVgvZ3OOitJMX78L2Hp7o6sRt18Z21tEpqZJxYuZ9By/
         WKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=59gmYg06KO9QIsscO73jfVKmO6xRE6RuiLj6GV82Gz0=;
        fh=NddmdC0H7Yvd15BYzKWOWZBS0FBdcJ9zE0BWGJ3GxJc=;
        b=NgJ1+RocbujY7at6PfWHowNrSnJZ72oWXJQ+jxxzEfX7WrHEQhr+jBlwieEnLcqB25
         5UVni+cnm+df0wEhPrfr4XlGWVC/uKSqTTIFrAtKaljtm3Vba7tS8rTg6mFagXBnqua8
         0ocigsR0ReBmAEmFmFw2WSN0I6n1tdMtEhSEFScktvcgePJ04wR0Ep4Zk+ehRybhAunW
         7I+SFG00gCDiDxK3QU5OcSir4TRiCbHrQCaD7SQxqKg1fTQIz7eZC3M4lZIYUVEqtZ6F
         UX6E0GqAvLvV42OhFWhLl64/QiXR3/r3BA6PkJvlnJEep8k4ioVmw3sSyRkz+DoIfSSl
         vKOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gUbps9u4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a05622a13d100b004033ca9d122si1702265qtk.391.2023.07.18.13.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 13:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gUbps9u4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLr3m-0007EX-DJ; Tue, 18 Jul 2023 16:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLr3j-0007E1-Ms
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 16:12:35 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLr3i-0007vY-55
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 16:12:35 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1b055510c9dso3677916fac.0
 for <qemu-arm@nongnu.org>; Tue, 18 Jul 2023 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689711153; x=1692303153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59gmYg06KO9QIsscO73jfVKmO6xRE6RuiLj6GV82Gz0=;
 b=gUbps9u4lBAt+cgEf6EEHVyX7ckFfnRjegLTok2AP7E3KoWwC6jEEUZXYZN2apxJik
 E4vh+o0iGYe2VQSb3n2dWIoLefuKaEJ+8zWZs/0OdDWoH/wE7ks0CsE+qIhyIcUnZLNs
 O4jthslR68iPpZXvwBMWvQ47QrZ76br6STGHkspX+oZIgr4RA8Uvk3Kh05jZgpoGPwnY
 86mzQhNqalwrnKmlGuNxYhQByRK127CDE4X6iUp5dzxdNsWJ7+luRAuWPAvzYAKhxhCm
 0ZNVn/OUdKzzrGbV/9pug5nRqrtIFPcDk9byf1IgwPrl8bt04Az0Pd10D4WoGpg+TsCH
 rd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689711153; x=1692303153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59gmYg06KO9QIsscO73jfVKmO6xRE6RuiLj6GV82Gz0=;
 b=ee1MCIa4q2cNFVM8kzoDvLI2pVyv0zvtel82IU6ceXVqBHWsY+Xh9U48iiquckNJSc
 cbcPu4vNx6TLz77/35I6h+gCXFgxOTxcmS+1w8GLIDAiANG712FZQdkyLLkPEbjiLHio
 6Ap7oOVHMTtNcItYTBDEARyio/dKCB3fpOOhufRVFVLdjWfFIIFimTKAcOfRqSZZcTWP
 vqvqPjw6mwWqfrl2OFKt8ScT9LEbzynKmTW7rzuqxjT1rC/RHUjzfb8+Y0grDpEQQSTK
 7HO9Cml+KahSqadE+cfAgtLgt7cuqLtX/udYVO3Tb85dPe2foMPYaLUQwYv0zyqRxC5K
 f9Vg==
X-Gm-Message-State: ABy/qLYOTzneu0nugBXcDphpKDKG/JkOFSzoo+jS3eCF/r4cA8HiiCf+
 5xHx+Atm592NIu2I5OuPktUJnw==
X-Received: by 2002:a05:6870:6194:b0:1b4:624a:e35 with SMTP id
 a20-20020a056870619400b001b4624a0e35mr13189584oah.11.1689711152476; 
 Tue, 18 Jul 2023 13:12:32 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 dt20-20020a0568705a9400b001b02fa3097dsm1279008oab.42.2023.07.18.13.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:12:32 -0700 (PDT)
Message-ID: <e22831b7-32bd-dad0-f864-1c79614acc48@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:12:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 09/10] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
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
 <20230712163943.98994-10-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-10-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: oEWRXWdp9Zcm



On 7/12/23 13:39, Sunil V L wrote:
> MMU type information is available via MMU node in RHCT.
> Add this node in RHCT.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 2d2bd3b970..25745eee4c 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -158,6 +158,8 @@ static void build_rhct(GArray *table_data,
>       size_t len, aligned_len;
>       uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
>       RISCVCPU *cpu = &s->soc[0].harts[0];
> +    uint32_t mmu_offset = 0;
> +    uint8_t satp_mode_max;
>       char *isa;
>   
>       AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> @@ -177,6 +179,10 @@ static void build_rhct(GArray *table_data,
>           num_rhct_nodes++;
>       }
>   
> +    if (cpu->cfg.satp_mode.supported != 0) {
> +        num_rhct_nodes++;
> +    }
> +
>       /* Number of RHCT nodes*/
>       build_append_int_noprefix(table_data, num_rhct_nodes, 4);
>   
> @@ -202,6 +208,26 @@ static void build_rhct(GArray *table_data,
>           build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
>       }
>   
> +    /* MMU node structure */
> +    if (cpu->cfg.satp_mode.supported != 0) {
> +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +        mmu_offset = table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 1, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 8, 2);    /* Total Length */
> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +        /* Virtual Address Scheme */
> +        if (satp_mode_max == VM_1_10_SV57) {
> +            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
> +        } else if (satp_mode_max == VM_1_10_SV48) {
> +            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
> +        } else if (satp_mode_max == VM_1_10_SV39) {
> +            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
> +        } else {
> +            assert(1);
> +        }
> +    }
> +
>       /* CMO node */
>       if (cpu->cfg.ext_icbom || cpu->cfg.ext_icboz) {
>           cmo_offset = table_data->len - table.table_offset;
> @@ -244,6 +270,11 @@ static void build_rhct(GArray *table_data,
>               num_offsets++;
>           }
>   
> +        if (mmu_offset) {
> +            len += 4;
> +            num_offsets++;
> +        }
> +
>           build_append_int_noprefix(table_data, len, 2);
>           build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
>           /* Number of offsets */
> @@ -252,9 +283,14 @@ static void build_rhct(GArray *table_data,
>   
>           /* Offsets */
>           build_append_int_noprefix(table_data, isa_offset, 4);
> +
>           if (cmo_offset) {
>               build_append_int_noprefix(table_data, cmo_offset, 4);
>           }
> +
> +        if (mmu_offset) {
> +            build_append_int_noprefix(table_data, mmu_offset, 4);
> +        }
>       }
>   
>       acpi_table_end(linker, &table);
