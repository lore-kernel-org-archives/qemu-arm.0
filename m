Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp866407lfq;
        Wed, 9 Sep 2020 17:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLdWvE7sFv+NGeG1SoAij7wcDrwq2EyBc6X8TEdRfwjsLoinNBVZoKr+8ztCoZU+GkXMuj
X-Received: by 2002:a25:d2cf:: with SMTP id j198mr9412171ybg.418.1599697911436;
        Wed, 09 Sep 2020 17:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599697911; cv=none;
        d=google.com; s=arc-20160816;
        b=C+pQxQR07mEAHlO5XVx2xl6ziWjpcCF7vr/JkKuiMREav4gLoDsLVuHOdr2BJKDZfT
         QZX3+VTNicSMlth6baQcRw+bxUqkiA123OJyprQi4UGnXps6N/DUAHutcsddOVaoCWo8
         Ng6mzexA4KS1t7AJnMxI3TejKBw7RpNKQk8z2O9wtf/qFdKkNVcixBgmj1eWPSiDqgCl
         sbf4k8LMCXmJVFwfXRwNrOybLdkqlwI4QUgpX3D5fSIspQ9he7tULR47KjlgEKRe+2eC
         ++kzI9qL51wtuxE0FUI2lc25x52QXBBGP6ON4W6rt+wXqHwzP76YgKyjNVHAwtKcJPqj
         CMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+30+VS0rk66ThWd4s4WgMggIckGxwoQaIhERxXO24I=;
        b=b0YixkALAhYEPnt0WN5IGnzVQ9gf8aoVcuuGiqwD0gV2arlfzTMQcfgzrXJ4P/K40C
         saua2TF+oKHc+v3WmtnvcGF6L1CquQaTCViOu39gcHOamSH1s4zRWA7I3x3q/RDmrXn9
         mySVQ/H9UPkHcG/bJY45Qt6948IWSURgdDCOlEb5kZfT8EFGV/ZPhqmwE3jpHi6Br8wi
         EtNjcVvGF8U4eEp0yrYW2qqsyE2JoGRXWA5NCNaoi8nxChp0RMTu+fE1E0VD8/M9+UrK
         /ef5Af1m7qph6u4kWUtfreLJBhtzMN4vtzPpfXzsUrl2LoutLqGch4s3KpYuD56MNN9d
         zcAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ys3084PJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p202si4067030yba.481.2020.09.09.17.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 17:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ys3084PJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGAVC-0001b3-SQ
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 20:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kGAV4-0001ao-MG
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 20:31:43 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kGAV2-0005GX-Ny
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 20:31:42 -0400
Received: by mail-il1-x144.google.com with SMTP id x2so4135820ilm.0
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2020 17:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+30+VS0rk66ThWd4s4WgMggIckGxwoQaIhERxXO24I=;
 b=ys3084PJ00Laa6JOhR/f0dFohEBOIbDRcdHIt1oi5IlCg0KaR24VFqJmN1fKny9pw7
 Re54tfWbya6abnZIjAs0sFxSrdMLNSl6wSR2OauIEJp0JcgAd2iCfJl1rXwJxU8bNX6E
 gB+uo6rjuu4eYVMmZtgZGFeRzWsDtzAoMNKUQOCYo+mxhUQWvNigMntsEYyqfSHx1XC1
 xaCbLMd2T4qM0j4UBCeFGGnDlhofXDu5QMnL3Dzcdt4QB0APlVmXzw4PTtFf5W9CZ56i
 qiwcrOYh0gkW6JwyAfnBDvcL75NgQyOlXPMgEtdYXrzL0Hbeq57a21uSyZfcSXh0k6B6
 YYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+30+VS0rk66ThWd4s4WgMggIckGxwoQaIhERxXO24I=;
 b=aPQ0b+0gY7dee9xoFHaEf0FAvyDo8AFwRypwsYnOcUr3LoPFHLYAxA0FHvPh6MPnTz
 wNfbDXHPP4yuBGzC2JswoGMM4IlP9O51r7M6tunYn7Mtl7PNmG35aMBslaVKu3PXFl0g
 5o1uQo5/ujPgAM8HuD6TWTxF8ZE/5OTPvSYUhbDU4ypgVKfhU7377WsRi0icYWyPXEvp
 dKhzaFzaJxCSEaOFhS8j7coC8uAESSWvYZdnaP7u6ULsld2bceIOtYwuGuy0BqBN7c2Z
 3Jy2iKuwykMOK5fFzRYaAXgCFyCcrndiBPByBI6VvbhyqQjG/aeoYtDVsz4spZBEdeO5
 i7DA==
X-Gm-Message-State: AOAM5330ntEiFnf5f6Jm3EZkD290n9ZhHYwJPkxblYlCHbMQjF2NMp4Y
 530tbv1BgXks+7A6tfQtndhHDg/9EwlA278INe9c
X-Received: by 2002:a92:bad9:: with SMTP id t86mr5699761ill.308.1599697899340; 
 Wed, 09 Sep 2020 17:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <c6ac607d2cd253de6a990538edfde7f86066f04f.1599549462.git.haibo.xu@linaro.org>
 <20200908111625.2wzzn7jh5wt4nnmu@kamzik.brq.redhat.com>
 <CAJc+Z1GCmf5fEjifa84O6jmfd6WCih1jT07AXb7vWFC7=sXfrA@mail.gmail.com>
 <20200909093435.txd7bkt6n3z7tm4u@kamzik.brq.redhat.com>
In-Reply-To: <20200909093435.txd7bkt6n3z7tm4u@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 10 Sep 2020 08:31:27 +0800
Message-ID: <CAJc+Z1Eer6HRN8P_2CnujYjCmUNzmTbXvU6CtH0Mzpr0MywwJA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] hw/arm/virt: spe: Add SPE fdt binding for virt
 machine
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HevY91e2cUwg

On Wed, 9 Sep 2020 at 17:34, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Sep 09, 2020 at 03:51:14PM +0800, Haibo Xu wrote:
> > > > +
> > > > +            if (spe) {
> > > > +                assert(ARM_CPU(cpu)->has_spe == ON_OFF_AUTO_ON);
> > > > +                if (kvm_irqchip_in_kernel()) {
> > > > +                    kvm_arm_spe_set_irq(cpu, PPI(VIRTUAL_SPE_IRQ));
> > > > +                }
> > > > +                kvm_arm_spe_init(cpu);
> > >
> > > A later patch introduces userspace irqchip support. Should we avoid
> > > allowing it until then to avoid breaking bisection?
> > >
> >
> > Yes, it's possible to break the bisection. To avoid it I think we can
> > move the above codes
> > block to a separate patch after adding the userspace irqchip support,
> > Or, just put the userspace
> > irqchip support patch before this patch. What's your opinion?
> >
>
> This patch ca forbid SPE without kernel irqchip. Then the patch that adds
> userspace irqchip support would also remove the restriction.
>
> Thanks,
> drew
>

Good idea! Will fix it in v3.
