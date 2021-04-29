Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2145901lfb;
        Thu, 29 Apr 2021 16:41:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7fw3eykNG+UnShgtZXxkOhhNQqe8hOhgagKmFWZGicoR8SU7H3UkZ+poE/nusFh5rRBFV
X-Received: by 2002:a5e:9202:: with SMTP id y2mr1581100iop.114.1619739678328;
        Thu, 29 Apr 2021 16:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619739678; cv=none;
        d=google.com; s=arc-20160816;
        b=unqys1bAMgFRLeN00MhXorSCR/cSMm9opcyx7EotO21YNPuSypNXv3tZ2GuHT9w+xo
         uuMVu4UVYNfhNHln9ugeDS6lGaG9wIf7+7l0uCFkubgYOckbY9f64r87pKBCeTAVMwXa
         ocLsrIafBycrCAwPPKK/JCN43+MVZ1eBSbCn4M6dKWbWtyrT+QacNEYgWrQzeLKSUgnD
         HtkL5eEuehKyNjWdmWFXTVqAUgtXjrAl8TojJFmqxEXB3KBr8Jl6/2XFZx2n/Z6ZgaGm
         gLZyBhDX/b/b7vmFea8UNihQuVYTBRI6qF5p10MJRXEDgjvzeCUxJXe4MrRrDTC/R1i/
         AzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=UthrhI1FF6C3/9oIjvfrVHKdVudCOe9x9FHbGKyLX3Q=;
        b=doXckadAvRhLKZWHnIMJXuDDrb9UFfkzD1DrD9Y8GAg1lFiNzkex+viyTd0PjR3J3S
         Y/Cq7F08Mw/0gM9GIPCtqHjL7EH2TdlHk3/KPMF4o0YsO7MUy3CX2ZgnbN+VQG2+OTYu
         fSbDZ8YpmRWkkiLDSDAxUungHt2uo2QlQ3VPlok2zhU6kAIGQ9SCLttX0WVmgsNMn73j
         w60h0iNRVVJB5QhDUyuzrLo/8p9NAaBnnfQ9IfraDI41q0SA/HeSTCsEOa/VfsUtHOmq
         lFzNQl+EMln2d8BEugOrJ7qA80E/3d++m/+KCkuU1cOOspv3KdEongCAzYirL/hoKOdK
         Vv+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a9RY2ZGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si174876ilv.72.2021.04.29.16.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 16:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a9RY2ZGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcGHV-0004nd-Hn
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 19:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGGm-0004kL-VD
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:40:32 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:40785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGGl-0003ay-6A
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:40:32 -0400
Received: by mail-qk1-x736.google.com with SMTP id q136so48075106qka.7
 for <qemu-arm@nongnu.org>; Thu, 29 Apr 2021 16:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UthrhI1FF6C3/9oIjvfrVHKdVudCOe9x9FHbGKyLX3Q=;
 b=a9RY2ZGHDrs+wE9vXv6p0Jn0UaqxxuMbNpwZWOK8SNFmiicnUeTeiltkg0P1VsA27+
 9rdSPDzH8kTX7GC9x9UcTjtdyjbA5ldOKJu8iwqwloztnu2+E8vI2GWvC+SW+Wk2nWnn
 r5t7uB+y90VjnHhzqKfXCEqDUVMsyDVP/2fwvm4UozQ0AYJCi062z5y0XkocDgWmN0S0
 B8HhwGFQF6aYZyk3rYH3PkkG4VEMHRewWr23/W2QFxZ+ybGfWOdAt3kN8jJRqLMviWJo
 8jOsXq1ihAa9kr5CJ1P4gXS7qjtBMH8Edaig1tpg7XS/uI19mLkXZCydZ/xL24EcNHCD
 OkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UthrhI1FF6C3/9oIjvfrVHKdVudCOe9x9FHbGKyLX3Q=;
 b=AjNBpjFEyI9fWDXzlQkmxXpdEkVlxCuRPtwve5XA9jIb2Lzj7gfFC3+Nzed+FGAqr1
 T9gFYpUcvjagEaMPF6cp+niGB81bpIdybdFnQm8mq4T+tv3QUil1+haPtM0KJYyJKzw7
 R72d/86bbcd/uljiKnFz4WXqRlRehlc8HHk8JT6+B1kNmhsHZgRpth+qgjCNPkgVwiI/
 bQK5dyp2LeSiTSTQJ0dMqXbCrf5JxIJngOsyFyThxLqsqPL/x4NsZ0HR1qmieenf9l7i
 kDCmyZK96n/XqH/P5wZ2kE3gnOvUDFBeGIYnuL/fmq/FXfLUwLmio7VlXzfvHAqciD51
 +EhQ==
X-Gm-Message-State: AOAM532/0yYLzidf/wttIVsiTSpF3Aef/W9+PYqQtZEFKsZt7zPd79Hf
 XWw/z348AAoMUS8OLAF6jBsIhQ==
X-Received: by 2002:ae9:e886:: with SMTP id a128mr2418543qkg.20.1619739630430; 
 Thu, 29 Apr 2021 16:40:30 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id n15sm1115562qti.51.2021.04.29.16.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:40:30 -0700 (PDT)
Message-ID: <c4fe0865f890d84070419ecd7d0ea6ba4ea746d5.camel@linaro.org>
Subject: Re: [PATCH v2 8/8] hw/arm/virt: add ITS support in virt GIC
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 19:40:29 -0400
In-Reply-To: <CAFEAcA_0xrjGn3WSL4Aoe+nneh4Yk3tg+d5N95GGN779M6qQYw@mail.gmail.com>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-9-shashi.mallela@linaro.org>
 <CAFEAcA_0xrjGn3WSL4Aoe+nneh4Yk3tg+d5N95GGN779M6qQYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bRNV5JhRlH1+

On Mon, 2021-04-19 at 13:46 +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 03:42, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Included creation of ITS as part of virt platform GIC
> > initialization.This Emulated ITS model now co-exists with kvm
> > ITS and is enabled in absence of kvm irq kernel support in a
> > platform.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/arm/virt.c        | 10 ++++++++--
> >  target/arm/kvm_arm.h |  4 ++--
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index aa2bbd14e0..77cf2db90f 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -622,7 +622,7 @@ static void create_v2m(VirtMachineState *vms)
> >      vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
> >  }
> > 
> > -static void create_gic(VirtMachineState *vms)
> > +static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
> >  {
> >      MachineState *ms = MACHINE(vms);
> >      /* We create a standalone GIC */
> > @@ -656,6 +656,12 @@ static void create_gic(VirtMachineState *vms)
> >                               nb_redist_regions);
> >          qdev_prop_set_uint32(vms->gic, "redist-region-count[0]",
> > redist0_count);
> > 
> > +        if (!kvm_irqchip_in_kernel()) {
> > +            object_property_set_link(OBJECT(vms->gic), "sysmem",
> > OBJECT(mem),
> > +                                     &error_fatal);
> > +            qdev_prop_set_bit(vms->gic, "has-lpi", true);
> > +        }
> > +
> >          if (nb_redist_regions == 2) {
> >              uint32_t redist1_capacity =
> >                      vms->memmap[VIRT_HIGH_GIC_REDIST2].size /
> > GICV3_REDIST_SIZE;
> > @@ -2039,7 +2045,7 @@ static void machvirt_init(MachineState
> > *machine)
> > 
> >      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
> > 
> > -    create_gic(vms);
> > +    create_gic(vms, sysmem);
> > 
> >      virt_cpu_post_init(vms, sysmem);
> > 
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 34f8daa377..0613454975 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
> >          /* KVM implementation requires this capability */
> >          return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
> >      } else {
> > -        /* Software emulation is not implemented yet */
> > -        return NULL;
> > +        /* Software emulation based model */
> > +        return "arm-gicv3-its";
> >      }
> >  }
> 
> This is OK as far as it goes, but I think we need to add the
> versioned-machine support so that only "virt-6.1" and later get the
> new ITS, and "virt-6.0" behave the same way (ie no ITS) as they did
> in older QEMU versions.
> 
> Have added versioned machine support to enable new ITS only for
> versions 6.1 and above
> thanks
> -- PMM

