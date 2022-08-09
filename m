Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3302973ejf;
        Tue, 9 Aug 2022 11:49:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4G5Um9AzVXKY0XdU7akE/AIVKFEZJ/ah8RckyaUMng3vC3aWD3f1Kf4YOJmjjKxzZ2Ha5V
X-Received: by 2002:a05:6214:400a:b0:476:10cc:f92c with SMTP id kd10-20020a056214400a00b0047610ccf92cmr21430715qvb.4.1660070980593;
        Tue, 09 Aug 2022 11:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660070980; cv=none;
        d=google.com; s=arc-20160816;
        b=0g9YLZzeBEVDMfT7r3fEYoT3CWLT6kZmpkrBWkRMjvHP1S7w8Lklp+lacZK23kUxXi
         XyRUUtYdF4JrEAx+xHgP8M0xO8G8KR/og3HNymGgLH69zcT5PQPqmjhuctlqlfJJO5dR
         6rMsq1H/dVw8ou9RHq4kHVNPWWPC2lY1VhQaQLhPZdLGSC46UO6AtpyWrIy9cZf/TWNf
         MFZXMkXo+VjSGQxy5tMaRUjPNOeCsjZEKpTwbizzk0Kp1kV1d4LtbRkdiO6wFuDlXPE2
         +Zop8a5cqAdh3bp7dwQfhDUFxgSE/HiscB+xr6yC1/wERTSF+9BU77kva2QOQxD51xTb
         unnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=c+HC5EWYBtG8/m4FRcCr1T4R5WfuFbkKhDR9Vcqqy8U=;
        b=AFSObMvYulS2Du7DYKbOpPJcIhBzDiEzqHfFkvwnXcVEN4pvWRztJFqr51y2LaDuNy
         fGzhDuIp2fK2s1X4S2xNLTbOOlvBCYezizzvdjUHwDwPoQIWkG5h8KBNvBPbfLGkELKA
         KqAH7UJjR00whSjIVjDuwwiF17J/cWl6cMIHOEGtKUMObizVGW9mvTS3AEUV6RgrtnFD
         D9GGfXgELlwW5wL0eDifCyZquVkeUNU8gFUv7MLfPGRaz/VLfQhmSy9ROQGKtuRzus+u
         CgfCSHOpJwgZehzwNzNqZqYvjeknjReoeLjJ4n/9/7WFiodK47uWZBx3b6XNE2gZuNup
         G/pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05620a414c00b006b912c2e3f1si9611400qko.154.2022.08.09.11.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 11:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUIO-0007Jb-0K
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 14:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oLUHX-0007Gy-P3; Tue, 09 Aug 2022 14:48:48 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:40862
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oLUHV-0001Rm-CF; Tue, 09 Aug 2022 14:48:47 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oLUHO-0007yn-On; Tue, 09 Aug 2022 19:48:38 +0100
Date: Tue, 9 Aug 2022 19:48:38 +0100
From: Ben Dooks <ben@fluff.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v3 5/5] hw/arm: change to use qemu_fdt_setprop_strings()
Message-ID: <20220809184838.en4x5kcxiatclmfy@hetzy.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-6-qemu@ben.fluff.org>
 <CAFEAcA9DADLZaSrRmRLXxex6V1ewbi8zV+ey9NLv0JNPJOc9hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9DADLZaSrRmRLXxex6V1ewbi8zV+ey9NLv0JNPJOc9hw@mail.gmail.com>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BiEhwsdp+wLV

On Mon, Aug 01, 2022 at 12:37:33PM +0100, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 23:44, Ben Dooks <qemu@ben.fluff.org> wrote:
> >
> > Change to using qemu_fdt_setprop_strings() instead of using
> > \0 separated string arrays.
> >
> > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > ---
> >  hw/arm/boot.c             |  8 +++---
> >  hw/arm/virt.c             | 28 +++++++++------------
> >  hw/arm/xlnx-versal-virt.c | 51 ++++++++++++++++-----------------------
> >  3 files changed, 37 insertions(+), 50 deletions(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index ada2717f76..bf29b7ae60 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -490,11 +490,11 @@ static void fdt_add_psci_node(void *fdt)
> >      qemu_fdt_add_subnode(fdt, "/psci");
> >      if (armcpu->psci_version >= QEMU_PSCI_VERSION_0_2) {
> >          if (armcpu->psci_version < QEMU_PSCI_VERSION_1_0) {
> > -            const char comp[] = "arm,psci-0.2\0arm,psci";
> > -            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> > +            qemu_fdt_setprop_strings(fdt, "/psci", "compatible",
> > +                                     "arm,psci-0.2", "arm,psci");
> 
> I think you may have some stray trailing whitespace here.
> checkpatch should be able to tell you.

ok, will check

> > @@ -858,8 +855,8 @@ static void create_uart(const VirtMachineState *vms, int uart,
> >      nodename = g_strdup_printf("/pl011@%" PRIx64, base);
> >      qemu_fdt_add_subnode(ms->fdt, nodename);
> >      /* Note that we can't use setprop_string because of the embedded NUL */
> 
> With this change, this comment becomes obsolete, and we should delete it too.
> 
> > -    qemu_fdt_setprop(ms->fdt, nodename, "compatible",
> > -                         compat, sizeof(compat));
> > +    qemu_fdt_setprop_strings(ms->fdt, nodename, "compatible",
> > +                             "arm,pl011", "arm,primecell");
> >      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
> >                                       2, base, 2, size);
> >      qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
> 
> 
> 
> > @@ -285,8 +280,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
> >
> >  static void fdt_add_zdma_nodes(VersalVirt *s)
> >  {
> > -    const char clocknames[] = "clk_main\0clk_apb";
> > -    const char compat[] = "xlnx,zynqmp-dma-1.0";
> 
> This looks suspiciously like a pre-existing bug to me.
> Alaistair, Edgar -- shouldn't this be a NUL-separated
> 'compatible' string, rather than a comma-separated one?

I think the compat[] is fine, I should have probably added I also fixed
up to just call qemu_fdt_setprop_string()

> >      int i;
> >
> >      for (i = XLNX_VERSAL_NR_ADMAS - 1; i >= 0; i--) {
> > @@ -298,22 +291,21 @@ static void fdt_add_zdma_nodes(VersalVirt *s)
> >          qemu_fdt_setprop_cell(s->fdt, name, "xlnx,bus-width", 64);
> >          qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> >                                 s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> > -        qemu_fdt_setprop(s->fdt, name, "clock-names",
> > -                         clocknames, sizeof(clocknames));
> > +        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
> > +                                 "clk_main", "clk_apb");
> >          qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> >                                 GIC_FDT_IRQ_TYPE_SPI, VERSAL_ADMA_IRQ_0 + i,
> >                                 GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> >          qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> >                                       2, addr, 2, 0x1000);
> > -        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> > +        qemu_fdt_setprop_string(s->fdt, name, "compatible",
> > +                                "xlnx,zynqmp-dma-1.0");
> >          g_free(name);
> >      }
> >  }
> >
> >  static void fdt_add_sd_nodes(VersalVirt *s)
> >  {
> > -    const char clocknames[] = "clk_xin\0clk_ahb";
> > -    const char compat[] = "arasan,sdhci-8.9a";
> 
> Ditto here...
> 
> >      int i;
> >
> >      for (i = ARRAY_SIZE(s->soc.pmc.iou.sd) - 1; i >= 0; i--) {
> > @@ -324,22 +316,21 @@ static void fdt_add_sd_nodes(VersalVirt *s)
> >
> >          qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> >                                 s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> > -        qemu_fdt_setprop(s->fdt, name, "clock-names",
> > -                         clocknames, sizeof(clocknames));
> > +        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
> > +                                 "clk_xin", "clk_ahb");
> >          qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> >                                 GIC_FDT_IRQ_TYPE_SPI, VERSAL_SD0_IRQ_0 + i * 2,
> >                                 GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> >          qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> >                                       2, addr, 2, MM_PMC_SD0_SIZE);
> > -        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> > +        qemu_fdt_setprop_string(s->fdt, name, "compatible",
> > +                                "arasan,sdhci-8.9a");
> >          g_free(name);
> >      }
> >  }
> >
> >  static void fdt_add_rtc_node(VersalVirt *s)
> >  {
> > -    const char compat[] = "xlnx,zynqmp-rtc";
> 
> ...and here.
> 
> > -    const char interrupt_names[] = "alarm\0sec";
> >      char *name = g_strdup_printf("/rtc@%x", MM_PMC_RTC);
> >
> >      qemu_fdt_add_subnode(s->fdt, name);
> > @@ -349,11 +340,11 @@ static void fdt_add_rtc_node(VersalVirt *s)
> >                             GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> >                             GIC_FDT_IRQ_TYPE_SPI, VERSAL_RTC_SECONDS_IRQ,
> >                             GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> > -    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
> > -                     interrupt_names, sizeof(interrupt_names));
> > +    qemu_fdt_setprop_strings(s->fdt, name, "interrupt-names",
> > +                             "alarm", "sec");
> >      qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> >                                   2, MM_PMC_RTC, 2, MM_PMC_RTC_SIZE);
> > -    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> > +    qemu_fdt_setprop_string(s->fdt, name, "compatible", "xlnx,zynqmp-rtc");
> >      g_free(name);
> >  }
> 
> thanks
> -- PMM
> 

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

