Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2435919lfg;
        Mon, 1 Aug 2022 04:38:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4QAjV+ovqhiTlccC6YBVqNvjn+f11G+8CMP2fUKgsFG+Jf06l2idjRQjRAPsBHaC5s0ikB
X-Received: by 2002:a05:6214:5281:b0:474:16b4:9676 with SMTP id kj1-20020a056214528100b0047416b49676mr13842098qvb.13.1659353885547;
        Mon, 01 Aug 2022 04:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659353885; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZDg1KCuV8N7rfCr+PaL8YeAVziltnVEZ/z30BkRua5TJ6UTbOImPv5vv7xDsX3LpQ
         BJ5y9/0276N3xWPoOA/SBfe8p+dV6ZRxzsnlYX5KpCfCbjoHy8cNMxNgRDgXdjPeswZP
         eGElFK+O2KTw7OVJIPrPY5hFleeafXVjKZBPA4cFPqElfVu672hg8qF4PWtLrHVSScGp
         eaXXEC66Par9rCzQ37g+PVVU/+mDZ5yVMz3fBCjhiZfco+COJKOtI560Un0EE2exx2k3
         0ZlTV2mlgco5kUdcuimedEzClrGutpvgXeAwsC37sYyrG7Grf+MnoVmybAOg1D44VSf7
         2azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HaAXL/qO9BHNnDeVfHOncjqYo30Q5/KoR/nNrpYAUlI=;
        b=wWx+LI28uImHES4WkpbG4CjRWlneWX7gTyk5cQksPp8ii2h9sSWAEDsHacZZhBUaRK
         Iyh4cxYb6ilU9NYFfDIXIRaU/rGK2wuDviyR53DKgKe+RzbweXZzJwFGetPqsHGIIxee
         50zSoXS9lF5fpdO8q4OdYU9/wTdDIr/wwYQa+4dBp3XlpqtQtxndhBRm39yxsSG1RS8j
         x7PoiVczcBHMiphybu5WxK7ok9LcY0RMG5XhWfO79KBoHidTfF0lVAVzUf9KpiAON8Jg
         r9ddSMqvwkOUjOFy0+MWSUhLVMKqQlLLwhUYgduTZzdB/WTpVtV1kpmFZ3g+s22deMg/
         85/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RR626Bnn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a24c100b006b63aada7e7si7732489qkn.329.2022.08.01.04.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 04:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RR626Bnn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oITkK-0000Ue-WF
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 07:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITk4-0000TD-4n
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:37:48 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITk1-0007AS-RO
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:37:47 -0400
Received: by mail-yb1-xb34.google.com with SMTP id n8so18498360yba.2
 for <qemu-arm@nongnu.org>; Mon, 01 Aug 2022 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=HaAXL/qO9BHNnDeVfHOncjqYo30Q5/KoR/nNrpYAUlI=;
 b=RR626BnnnUqVpHR4u/9Y42KwEPCx4LhSwEEihKPew0M+c1ck/T30rngFX8Xl0+MGaU
 qeJGNr4YfASuVOnIlT8QueH3Hg5mD+4JbrahCQPCrWaAnb9iaMmDKJz9iVz8poYvYtXV
 TU5M6NQKsG7G1UrsB2bsrMWNy3YzEq9SPDHsw3TVYaNF2cFrlfrkhtcfM/aVh+QNTkDn
 uzXybcXTkHiJzpmNVB+0lEQkKiTbokXt0kIk/Uin26tLVHYtW0C9xbNAiwVFjVo1KDqO
 JrOtBpRk10uHpNGtum2erWWooejtJhKI08UwIj8i/3GnYvl+DPpFJ2PtPGJcgJQ+r3jL
 7IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HaAXL/qO9BHNnDeVfHOncjqYo30Q5/KoR/nNrpYAUlI=;
 b=GisAms8DG6bQ0AJi6XQSsFUd4qBVSRBZvM8r/yA2VfOmSv7YDf1d1vpn9H5sotMmM/
 Gt5yR8wUwmHafS5/rwkNNHXExOXNVfbI+4zXxAWr80uCtUb6qvUTXiP/tYb2C/hNxWvm
 wDj7RqHmdyrM1U/mxFZUZGmB1vGTxzOJar8vlr13Dq3l5w4kVDS4BcSZHzMFmx2xAmZc
 4cN00AuYhPBswd3YcOz4JlLrRYDI98GWaDdLQQzJWBaohw3sRB24ZeMSSjbU3RFD8E4W
 /U2xzweY1VzwvARCVXMr8GMheY7wL/hVLUotR0grtAGAwud8+38ctQGZApSiBr/QgukP
 T/Rg==
X-Gm-Message-State: ACgBeo0m0WHz5+U9WV0MOtMF2Zu+HNYy6WGsCqs/rEI/vbzj1lhaL0LN
 5hgVDZXN75ZGPZrrBbBaeV5HPASEgntzucPPPDd2qg==
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr10603556ybq.140.1659353864693; Mon, 01
 Aug 2022 04:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-6-qemu@ben.fluff.org>
In-Reply-To: <20220727223905.624285-6-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:37:33 +0100
Message-ID: <CAFEAcA9DADLZaSrRmRLXxex6V1ewbi8zV+ey9NLv0JNPJOc9hw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/arm: change to use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jUFyRdu7io+z

On Wed, 27 Jul 2022 at 23:44, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using qemu_fdt_setprop_strings() instead of using
> \0 separated string arrays.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
>  hw/arm/boot.c             |  8 +++---
>  hw/arm/virt.c             | 28 +++++++++------------
>  hw/arm/xlnx-versal-virt.c | 51 ++++++++++++++++-----------------------
>  3 files changed, 37 insertions(+), 50 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..bf29b7ae60 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -490,11 +490,11 @@ static void fdt_add_psci_node(void *fdt)
>      qemu_fdt_add_subnode(fdt, "/psci");
>      if (armcpu->psci_version >= QEMU_PSCI_VERSION_0_2) {
>          if (armcpu->psci_version < QEMU_PSCI_VERSION_1_0) {
> -            const char comp[] = "arm,psci-0.2\0arm,psci";
> -            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> +            qemu_fdt_setprop_strings(fdt, "/psci", "compatible",
> +                                     "arm,psci-0.2", "arm,psci");

I think you may have some stray trailing whitespace here.
checkpatch should be able to tell you.

> @@ -858,8 +855,8 @@ static void create_uart(const VirtMachineState *vms, int uart,
>      nodename = g_strdup_printf("/pl011@%" PRIx64, base);
>      qemu_fdt_add_subnode(ms->fdt, nodename);
>      /* Note that we can't use setprop_string because of the embedded NUL */

With this change, this comment becomes obsolete, and we should delete it too.

> -    qemu_fdt_setprop(ms->fdt, nodename, "compatible",
> -                         compat, sizeof(compat));
> +    qemu_fdt_setprop_strings(ms->fdt, nodename, "compatible",
> +                             "arm,pl011", "arm,primecell");
>      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
>                                       2, base, 2, size);
>      qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",



> @@ -285,8 +280,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
>
>  static void fdt_add_zdma_nodes(VersalVirt *s)
>  {
> -    const char clocknames[] = "clk_main\0clk_apb";
> -    const char compat[] = "xlnx,zynqmp-dma-1.0";

This looks suspiciously like a pre-existing bug to me.
Alaistair, Edgar -- shouldn't this be a NUL-separated
'compatible' string, rather than a comma-separated one?

>      int i;
>
>      for (i = XLNX_VERSAL_NR_ADMAS - 1; i >= 0; i--) {
> @@ -298,22 +291,21 @@ static void fdt_add_zdma_nodes(VersalVirt *s)
>          qemu_fdt_setprop_cell(s->fdt, name, "xlnx,bus-width", 64);
>          qemu_fdt_setprop_cells(s->fdt, name, "clocks",
>                                 s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> -        qemu_fdt_setprop(s->fdt, name, "clock-names",
> -                         clocknames, sizeof(clocknames));
> +        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
> +                                 "clk_main", "clk_apb");
>          qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
>                                 GIC_FDT_IRQ_TYPE_SPI, VERSAL_ADMA_IRQ_0 + i,
>                                 GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>          qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
>                                       2, addr, 2, 0x1000);
> -        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +        qemu_fdt_setprop_string(s->fdt, name, "compatible",
> +                                "xlnx,zynqmp-dma-1.0");
>          g_free(name);
>      }
>  }
>
>  static void fdt_add_sd_nodes(VersalVirt *s)
>  {
> -    const char clocknames[] = "clk_xin\0clk_ahb";
> -    const char compat[] = "arasan,sdhci-8.9a";

Ditto here...

>      int i;
>
>      for (i = ARRAY_SIZE(s->soc.pmc.iou.sd) - 1; i >= 0; i--) {
> @@ -324,22 +316,21 @@ static void fdt_add_sd_nodes(VersalVirt *s)
>
>          qemu_fdt_setprop_cells(s->fdt, name, "clocks",
>                                 s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> -        qemu_fdt_setprop(s->fdt, name, "clock-names",
> -                         clocknames, sizeof(clocknames));
> +        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
> +                                 "clk_xin", "clk_ahb");
>          qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
>                                 GIC_FDT_IRQ_TYPE_SPI, VERSAL_SD0_IRQ_0 + i * 2,
>                                 GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>          qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
>                                       2, addr, 2, MM_PMC_SD0_SIZE);
> -        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +        qemu_fdt_setprop_string(s->fdt, name, "compatible",
> +                                "arasan,sdhci-8.9a");
>          g_free(name);
>      }
>  }
>
>  static void fdt_add_rtc_node(VersalVirt *s)
>  {
> -    const char compat[] = "xlnx,zynqmp-rtc";

...and here.

> -    const char interrupt_names[] = "alarm\0sec";
>      char *name = g_strdup_printf("/rtc@%x", MM_PMC_RTC);
>
>      qemu_fdt_add_subnode(s->fdt, name);
> @@ -349,11 +340,11 @@ static void fdt_add_rtc_node(VersalVirt *s)
>                             GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>                             GIC_FDT_IRQ_TYPE_SPI, VERSAL_RTC_SECONDS_IRQ,
>                             GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> -    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
> -                     interrupt_names, sizeof(interrupt_names));
> +    qemu_fdt_setprop_strings(s->fdt, name, "interrupt-names",
> +                             "alarm", "sec");
>      qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
>                                   2, MM_PMC_RTC, 2, MM_PMC_RTC_SIZE);
> -    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_string(s->fdt, name, "compatible", "xlnx,zynqmp-rtc");
>      g_free(name);
>  }

thanks
-- PMM
