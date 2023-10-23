Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1360094ejb;
        Mon, 23 Oct 2023 06:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELK342SihsZpXqFB3d3+H010/JrEmLze9FC/OdOpI+sXbM+D1VivWOfS9xAhZMxOG9y094
X-Received: by 2002:a05:622a:549:b0:419:573c:59a4 with SMTP id m9-20020a05622a054900b00419573c59a4mr14287772qtx.20.1698067411833;
        Mon, 23 Oct 2023 06:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698067411; cv=none;
        d=google.com; s=arc-20160816;
        b=UiC05JDfoUOOKsT8athFU5oieht1WDd0vMqWgPVF9aa1J/UQIWxOESLsvTUzZUh1IR
         ISJqCtqJu+ggBSB2+/QnRSKKWx0SS1TCD7waykyBbhkv0+Sje2IAIN3MDTqPMj7T28fy
         pHPvzOskv1u2zhDb+K/8muaIbuF0PbnlOO6G0IO/tY8uAmuMYRxxj/6hpccKvkZ4acOV
         mRLeEc+kjylnNf31CfegU/KCJuYd/nKMiDcMfG0PIrY/NIhOki94A2KiOCIVqpRHbAxO
         EtqlBBA+78E2ClPTMmbhdPqH6ge/hmqQm7roFGOy7ZBuIX4C1jcyDGPz2hfgctD18Lyb
         9xfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Eyqs5XEhMqiBWGKqKvNdXfL/aKjeQDVM8f5JUSy9gCM=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=UI2EfTqzOl7clTQc9B/xgRju4bcv/A75btD4CvbqoKzBpVlkkxTAF0QVBhuOk5R0eI
         3TyowBsBURQcaPMDE7qQt7FoRVcpXZ54J9D0+XVWmR542pLzDTNp7jgaHgfShcfCEBry
         ljsE/b6mesZCz0Erp20jssdttcuylGf19OMLbTU4gRjUrOxkbK6G4mmcb8MsoO0MmNxu
         HdFwNT73fwbGjRJW0qRi8JJU/QsiEk8z4i+FWGMZJSwkIHxGUGkBC3wvBZ8wLeMpWlYp
         f+gv11V0zTXZvhgRP8RukoI5cJ/ysGEZs8Rx/n0Q/opWGGbypKt7YG/nffL2Nwd/+ews
         9JgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hTEKU4nU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020ac85888000000b0041810b57eb6si5571695qta.758.2023.10.23.06.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 06:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hTEKU4nU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quutU-0007s6-7j; Mon, 23 Oct 2023 09:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quutS-0007rH-Br
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 09:22:54 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quutP-0003LR-PO
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 09:22:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso5139475a12.0
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698067370; x=1698672170; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eyqs5XEhMqiBWGKqKvNdXfL/aKjeQDVM8f5JUSy9gCM=;
 b=hTEKU4nUaEY7vQfR2l1tir77D+ukIZKars+C+gaHa/Cj/7vvbTReUo4cCBxFAKQXXa
 03xACrwWBFUHd/5t5+a/vVWk3JfayV+bmoHTWmBSLkGxyMWwnFzcywbf9yIm8IeQnkLJ
 SUfueqkxdSPIEtVv/mZxF6PrEKlaCKp2r5plAJK7OivzUad74pEbnMVbArw66unUhPfv
 zfF0WnjKIEtsIvhcznMcWCTOuOBrkmfrU2pki1kucnnbAqIvF9DBQNIPIG+goMaOfZfL
 IayYMtQXTcDbO5BzK8dKcPHDaHJNj3oMlW7cJwlvpkesmiIGDVFmiheWX/xWggALjuX7
 mz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698067370; x=1698672170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eyqs5XEhMqiBWGKqKvNdXfL/aKjeQDVM8f5JUSy9gCM=;
 b=uZGGOnzw03CFIUeG46h01cl1rsSNpjhbZ+sG4XFi6Fjsh95YebXFUjcHMcDURKosiu
 IHl8NmAyqA4sSMMoTG9GaA8rZjquC7Vzx6QHDZAuX3gQ7mbuHbCbnuW/LeU7cr2LkjcC
 r4gwD6qQeM9GP58uok+N+KMG6DN9JOcYobPigj+rM9PRgy8CFE2mmoS76iBppKnPmAIr
 0uynoOp0ItA+sjgQ+J6x2NHMXyLdN1m5D0TovsqqizDnhgpm7KnxKCEx7dJkrwCJFGmK
 DWJsJznEwO3Hx8JIkK3ucGtyKwskWMfi10/PKpLq25tEIhrhQ29iLIClBBLlwvZCebGF
 mAcw==
X-Gm-Message-State: AOJu0YwvAMxxPT94nUivHDnkM8g/a+dcz91zbv0m8URPI51lkKstOqzt
 1Eb344O5wQBMYSL2em95xPQdmA==
X-Received: by 2002:a17:907:9282:b0:9bd:fc4b:6c9b with SMTP id
 bw2-20020a170907928200b009bdfc4b6c9bmr7532860ejc.36.1698067369899; 
 Mon, 23 Oct 2023 06:22:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b009c0c511bd62sm6597458eju.197.2023.10.23.06.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:22:49 -0700 (PDT)
Date: Mon, 23 Oct 2023 15:22:48 +0200
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
Subject: Re: [PATCH v3 12/12] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Message-ID: <20231023-aac858ca4920965239000952@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-13-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-13-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ysgcs1KEDWwD

On Thu, Oct 19, 2023 at 06:56:48PM +0530, Sunil V L wrote:
> Add PLIC structures for each socket in the MADT when system is configured
> with PLIC as the external interrupt controller.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 2f1cc92f75..d1761ddddf 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -85,6 +85,12 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
>                                        arch_ids->cpus[uid].props.node_id,
>                                        local_cpu_id),
>                                    4);
> +    } else if (aia_type == VIRT_AIA_TYPE_NONE) {
> +        build_append_int_noprefix(entry,
> +                                  ACPI_BUILD_INTC_ID(
> +                                      arch_ids->cpus[uid].props.node_id,
> +                                      2 * local_cpu_id + 1),
> +                                  4);
>      } else {
>          build_append_int_noprefix(entry, 0, 4);
>      }
> @@ -513,6 +519,29 @@ static void build_madt(GArray *table_data,
>              build_append_int_noprefix(table_data,
>                                        s->memmap[VIRT_APLIC_S].size, 4);
>          }
> +    } else {
> +        /* PLICs */
> +        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> +            aplic_addr = s->memmap[VIRT_PLIC].base +
> +                         s->memmap[VIRT_PLIC].size * socket;
> +            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
> +            build_append_int_noprefix(table_data, 0x1B, 1);   /* Type */
> +            build_append_int_noprefix(table_data, 36, 1);     /* Length */
> +            build_append_int_noprefix(table_data, 1, 1);      /* Version */
> +            build_append_int_noprefix(table_data, socket, 1); /* PLIC ID */
> +            build_append_int_noprefix(table_data, 0, 8);      /* Hardware ID */
> +            /* Total External Interrupt Sources Supported */
> +            build_append_int_noprefix(table_data,
> +                                      VIRT_IRQCHIP_NUM_SOURCES - 1, 2);
> +            build_append_int_noprefix(table_data, 0, 2);     /* Max priority */

"Max Priority"

> +            build_append_int_noprefix(table_data, 0, 4);     /* Flags */
> +            /* PLIC Size */
> +            build_append_int_noprefix(table_data, s->memmap[VIRT_PLIC].size, 4);
> +            /* PLIC Address */
> +            build_append_int_noprefix(table_data, aplic_addr, 8);
> +            /* Global System Interrupt Vector Base */
> +            build_append_int_noprefix(table_data, gsi_base, 4);
> +        }
>      }
>  
>      acpi_table_end(linker, &table);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
