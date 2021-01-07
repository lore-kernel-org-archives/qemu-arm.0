Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp247509lfq;
        Thu, 7 Jan 2021 04:17:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2PO5rX1KREEZ74470YpEPzWAVUMdyqelRoLt3zBpyOIYVY4hdacZj6FPvMHnj63AkEzHE
X-Received: by 2002:a5b:54a:: with SMTP id r10mr12925613ybp.250.1610021845779;
        Thu, 07 Jan 2021 04:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610021845; cv=none;
        d=google.com; s=arc-20160816;
        b=aXHDlX7KWSwhW0z3QFJ1yY8pUelUexaL80TcPrrPyUwNb752UqG4+yMMOMTiNwQC/J
         XJlQjHkS/uNG9PX8hc4igIOxqzzfKXCYG2Ygp2h5ww/SyV6OTVnBp+7ZTn9OmqMXq4HY
         unKvvdIIBb+uJMX49FfuYI3lzb0tUbcrSxWh2WpG8ZLplj92lOK+MQvCFzr/vqsHsl9k
         9Nf7LmlBEnuvBeolRYAxiM/lMwoP75rThfGYX35z9Nny4giJZNzz4PWsb76/qAQTFZFb
         R8qCZCrg2zmO7+fGk+VP7fmY/TQj1JipjJKj2CONg9qz+LAAJezH8JXAddf6PN+yJR2O
         Nuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNNwoy5PFKpKN9OXomCECGA2LaR6TvbCOQym7aWFzH0=;
        b=KtWwiMlKy++wLlchLD+WCSsfBnBJtobn3UDpbrsKwE7JRaWX79YzgpPJ5VRJhy+jwE
         PMjKqvalSzi5nlHS9D2Sh/Y4kaEdejDFrDNliinP2gxuc7kY+BQyx0MNTwMa5vnfwtCs
         kl6ZhYz9SDC1Aizq5xcGAdbE0lksnIa2rIxX8gKwyAkY6SFgV2lmLdt+WMEyWIf3p9Jq
         mHomZ7ah6uPmygbuHA7pt1ZXZzFHqJ7fpu55Ul5jCrc8B9TWrr1AgTUGjaRfZlVP+r89
         gbr2pXwJogPEw27HNTdPnHze0n7FpqzIdymU9UyOfm1BaOI2jS6XspLDQzk3pVwRTsf5
         3zww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cn3kMB0J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v133si5287537ybv.365.2021.01.07.04.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 04:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cn3kMB0J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxUEH-0001Ws-5U
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 07:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxUE8-0001WF-4V
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 07:17:16 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxUE3-0002CL-VO
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 07:17:15 -0500
Received: by mail-ej1-x62d.google.com with SMTP id x16so9375171ejj.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 04:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNNwoy5PFKpKN9OXomCECGA2LaR6TvbCOQym7aWFzH0=;
 b=cn3kMB0JMRs6yRYvCyP3yS/0KwDIvNraZqD+5Dz7ErU97Fya0TmGWvF2q/1fsQRpgl
 h4ud0VX2wDogN9F9X1Z8R0nhtzcr/y7KVMbanOSsAkdk6RrsCFMb4xiZYRdglTGsvSQc
 B0WJZdKwcu30zuhoRj3rT6vv5+3vSn/rDiUIyrKvVZOkGkKjPfPGs3STQt2bWmY1db36
 otPqDYqkHVxUEKmjaGyISuoXTp5fQJDjQpFlLCcYex+nnojA8vwu+3m/srY/5JJ+PJHE
 qkzqzp4+im5EjbErmPxkQF4VuDwRsx2IoIdX8vzCj7D/q5b4rYX/cTapf/BBcZa/mC4K
 ENTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNNwoy5PFKpKN9OXomCECGA2LaR6TvbCOQym7aWFzH0=;
 b=bJN4Xq599W2gPicxe/lO+rjjVMExiAhcTbGlPtKLfS6qhxx1/iyczlAAsgk08p64V8
 k0O6OBRZ8y6B1pXnMcJZG1S37SByTpskfsuSIWAXVN+QD0dyMHq+job1IZEUbavEkOUV
 cc46IyYs9kBAwJNWRT0rlefaKFAD2+ZW5AK/vIxPh8PYy262wQm76j/Ll+Ec9c/YCKoS
 JG/pBR4KxLoY8KsnDPNQLT3vbX54F8qCEODXAvnieipajn43dMf5QdejCpWjcE4OehGG
 5DqAAIxsOjltzGFCkL31kKh1x0D9vbDrHDj7Xl4JpX29riuR29fT/PMwOcl+gwwqpX6w
 s6Mw==
X-Gm-Message-State: AOAM5330EgFadEWPjSNinxSt7LKRvjZ5wMVRvt1hnMjFdJ6hGKM5HGOK
 N30kdSOXoR26XsTOfV07CieiLAZzL5vOCkIudwcTQA==
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr6372811ejb.56.1610021829946; 
 Thu, 07 Jan 2021 04:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20201215174815.51520-1-drjones@redhat.com>
 <cun8s9zorr3.fsf@zarquon.hh.sledj.net>
 <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
In-Reply-To: <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 12:16:58 +0000
Message-ID: <CAFEAcA8MQoThWcmcoC30oEGGQ8POtz=ixBd7HUjZT+8YnJfvqA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Ying Fang <fangying1@huawei.com>, salil.mehta@huawei.com,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRdDO9XWfqul

On Wed, 16 Dec 2020 at 06:44, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Dec 15, 2020 at 06:20:48PM +0000, David Edmondson wrote:
> > On Tuesday, 2020-12-15 at 18:48:15 +01, Andrew Jones wrote:
> >
> > > virt machine's 'smp_cpus' and machine->smp.cpus must always have the
> > > same value. And, anywhere we have virt machine state we have machine
> > > state. So let's remove the redundancy. Also, to make it easier to see
> > > that machine->smp is the true source for "smp_cpus" and "max_cpus",
> > > avoid passing them in function parameters, preferring instead to get
> > > them from the state.

> > >  static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >  {
> > > -    int cpu;
> > > -    int addr_cells = 1;
> > >      const MachineState *ms = MACHINE(vms);
> > > +    int smp_cpus = ms->smp.cpus, cpu;
> >
> > Is it house-style to have initialised and un-initialised local variables
> > declared on the same line?
> >
>
> checkpatch.pl doesn't complain and a grep of qemu shows hundreds of other
> examples. That said, I only see one other example in hw/arm/virt.c, so if
> we'd rather avoid it, I'll repost.

I think this is one of those things where the style guide doesn't
say anything, so it comes down to individual developer preference.
Personally I find declaring an uninitialized local on the same
line and after an initialized local is a bit confusing to read
so I've tweaked the patch, but it's not a big deal either way.

Applied to target-arm.next, thanks.

-- PMM
