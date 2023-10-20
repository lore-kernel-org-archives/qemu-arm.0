Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1158071ejb;
        Fri, 20 Oct 2023 04:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESYDYK+YRRToIT9LI5wv0dNu+d4/hJt+yk8JLazYypvodN8jUS4vAkwPijmRUwG5FHBWNZ
X-Received: by 2002:a05:620a:394c:b0:76d:5126:65d8 with SMTP id qs12-20020a05620a394c00b0076d512665d8mr1753398qkn.6.1697802605534;
        Fri, 20 Oct 2023 04:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697802605; cv=none;
        d=google.com; s=arc-20160816;
        b=DILCiygf/nvQYKzquThGQwQZ40BLs1FH/HOzJethH09bsVbrbj3aRZfQrl6x89gj8P
         D9Q95WhwAJoDdlj3PqBwjXVXRGW8OkJGg9PS7IZmmoTUekK/OHlcFN0vnxN0rIKHF2oF
         kgELR8qO7QRin4n3xKSNj99FosBPirGV+fmRI/VBgG7rGhNBJKfgrPZIfqhuIY0UnLGa
         9oucp2TtYZ0Hb4cmQzwIiwh9JdFqt72lywCcTFv1wa5/TQy+iJj5ia1ouZTY3xof0HJ9
         YA9jgsgsiwLfUQgtWaPeBLl4BD8ZgibtIFuNiqjNWID/K2DneDBADoaATlyRbUHXcpqx
         go9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Pj5vVO1o9ClGbMGR1eaFqeit54Yl97Rne7g8J9WfOVA=;
        fh=BiPEO9ks27M8Z+yWO7KETmJfWBYIhIIw/fZ9iDn9zgY=;
        b=IG2ZcZq5YgHAezwFzNehAQQFN6/UwdmQ0v4pmjb7m0nvqv3qpyiclEZfxdAZ0xCs/a
         HaqoQ8AVT/ECcM7RiFw3y3SCENDNshT12j+yK5ujohJkGJf47DL7RioEIScFUFR2FPQ6
         Q3WoVY8qTykeSulZBvhrJkAHEDpwjDWG2ejSKKHssDwO8jiBXrBYZLqs9pif9QN2RS2p
         JlsFyfZRtBczbCNAGHcMu6LdBdoT9wIO5vbQXNG4lh+B1gTzpQmdOZmGkPVzX3gv58e7
         sZYuFUdbosIOCYXOqXh+0qdVi5ke52yGNGf8cYurouS6RzHlYh5wPvVJlmfl9icJX8iU
         QqZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DYsMOMJk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br39-20020a05620a462700b00773dc958046si1203701qkb.258.2023.10.20.04.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 04:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DYsMOMJk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qto0Z-0001ik-Lb; Fri, 20 Oct 2023 07:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qto0R-0001Wc-At
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 07:49:34 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qto0P-0006hd-IP
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 07:49:31 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ce2ee17cb5so432204a34.2
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697802567; x=1698407367; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pj5vVO1o9ClGbMGR1eaFqeit54Yl97Rne7g8J9WfOVA=;
 b=DYsMOMJkleSJHH2pifbL0zgHZKGu7M8WyrYziEB1pHc93e7M9OqhJkruE9XDsw6R/0
 yj0TwsuyGvqmFDdDacHjaNdCL/tWwxELDIvL35fbmQHa0a4Q+FN9gojRdxGxzcnH7OJS
 8f/DG5f4VY/3SjljBBHf1dSBDmkLtpAY7NRx+ZfwO2dqp1qozOW2yXtN4UWZX1D+fUTk
 bBLrlMyC4xeCXbc8pOhsgI0on03lLrIDwNEzn/o+c4webWGEwaBRIIK0564/7cBkMDpn
 jhNGvLHC2X4ZPah5NiRMZl4jyeApnQ08PtR85bTp80ZS6dOlzYpR7DwrXCYgE9agvE41
 KD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697802567; x=1698407367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pj5vVO1o9ClGbMGR1eaFqeit54Yl97Rne7g8J9WfOVA=;
 b=bcKOfMzqkkY4ZlYd8t3aQKZZb/gkfK8GyLbKApcCvtKrf94mqiQ5nSaR8CPHMgN6fq
 Q/RPC3+r+9uB6V08NGuIitZNyYB9gkajrh6im1XJwqQUatagVgA05E5+tPfzmaO7oERJ
 gBZaoKUewb/SOHftRk9mL+u3+sR8gh6v774FSm0O3q29xY8ATmDPaxPbddltGLFRbx4n
 QWOIiVrEC7u093zSLkNbL5Obc4AHI51gScgrQnI1TTiYMva+FGpKfIhKb0UyFFitAt/S
 Jv29ZFm07O2vihlntiOT5nDvGP01c1+TqbFgWIWIEixHx5nrbldGpYytNkLYfiNkiOe7
 yKUg==
X-Gm-Message-State: AOJu0Yx3JKNocSJZd+sx4i8/a5PetKT+01PDZXCuyaSqGRotF8lgZKIk
 mnTjcLI9r1gihyXIFv4OK5wcRg==
X-Received: by 2002:a05:6830:440b:b0:6bd:9fa:34ff with SMTP id
 q11-20020a056830440b00b006bd09fa34ffmr1616905otv.9.1697802567672; 
 Fri, 20 Oct 2023 04:49:27 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631256000000b00528db73ed70sm1288984pgs.3.2023.10.20.04.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 04:49:27 -0700 (PDT)
Message-ID: <bdaa5804-eff0-4d5e-ba61-c277aa3195cd@ventanamicro.com>
Date: Fri, 20 Oct 2023 08:49:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>,
 Haibo Xu <haibo1.xu@intel.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-13-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231019132648.23703-13-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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
X-TUID: Z+yyL5CvP1yr



On 10/19/23 10:26, Sunil V L wrote:
> Add PLIC structures for each socket in the MADT when system is configured
> with PLIC as the external interrupt controller.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/virt-acpi-build.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 2f1cc92f75..d1761ddddf 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -85,6 +85,12 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
>                                         arch_ids->cpus[uid].props.node_id,
>                                         local_cpu_id),
>                                     4);
> +    } else if (aia_type == VIRT_AIA_TYPE_NONE) {
> +        build_append_int_noprefix(entry,
> +                                  ACPI_BUILD_INTC_ID(
> +                                      arch_ids->cpus[uid].props.node_id,
> +                                      2 * local_cpu_id + 1),
> +                                  4);
>       } else {
>           build_append_int_noprefix(entry, 0, 4);
>       }
> @@ -513,6 +519,29 @@ static void build_madt(GArray *table_data,
>               build_append_int_noprefix(table_data,
>                                         s->memmap[VIRT_APLIC_S].size, 4);
>           }
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
> +            build_append_int_noprefix(table_data, 0, 4);     /* Flags */
> +            /* PLIC Size */
> +            build_append_int_noprefix(table_data, s->memmap[VIRT_PLIC].size, 4);
> +            /* PLIC Address */
> +            build_append_int_noprefix(table_data, aplic_addr, 8);
> +            /* Global System Interrupt Vector Base */
> +            build_append_int_noprefix(table_data, gsi_base, 4);
> +        }
>       }
>   
>       acpi_table_end(linker, &table);
