Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp37938lfq;
        Tue, 8 Sep 2020 19:39:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2GbEv+09XnIogiI5mxm0uvnh83xyzbPmXncb457Hk4zAgDj9mDGVGIIKobc2+qdV7I9ce
X-Received: by 2002:a25:da8a:: with SMTP id n132mr2977793ybf.178.1599619180651;
        Tue, 08 Sep 2020 19:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599619180; cv=none;
        d=google.com; s=arc-20160816;
        b=PF2/007dIM50OWH3NNFORKzhfFm4W/gBkkeGPUlLtQVRAZ32jgifyChdkkl+68+D6/
         QxpuelsDU/jOkqmBC8LYHba1kwVDPdRKz84+PcMLDVXgvkFbUOrO8u4xchBrWl6ZHEjf
         gJc0NAoXpaC/lWMZZXNsGfHQEmY0pfyu9I4AwmnQMRN70LS3DhS0lSnuT7bPg/3MW1zD
         DDArksaNloFB83uQYmc6uBdCgWAfZBrXrCl+UgDAel248SNPEH9TlAHfy2cR1W6xO29V
         J44loAgsPZNX3pqaxkBAQlUPwO7C4HQ/GbIwbae2rckF6gY7BMR+s9Wz+2eeY2p/Pfdd
         OSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vc9NDn+cSIFMYl+W2YtSQC4BTkz6DvX8O9OUNytIVLE=;
        b=e1BGUqNqEbwwpnOAbKD7iZ6N8mw1QS6cwhz/pTEBP99QmU85a9w9SdSEi4kGYwE1ip
         SGp916LdhkN8jXz5I1yy/dg6dI5mU+kEfZd9AOcwcPOjQdU0O3vFvGBd2/hxDaN4LXVU
         aojDoMG+27DztzoA7ysXYA+76fKe70jyxgW5Tqm+n9BYkWt9G+DEYUWAUunMyljPE5Ad
         BUOl2gjz9qwCLlAcdZi2RL7TzzGyPR778z4qdswN2Sgy84XsJERRQnd78BDx4hhLq1V6
         sJRgVTqU8UkUb1zWjAjFJRPYhxkjexrrfZlb1e4VsU2fkZJj0Cldt/nxb9K6Us9y0H5c
         sFEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rCpP6Zi2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f197si1334446ybg.124.2020.09.08.19.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 19:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rCpP6Zi2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFq1M-0004n3-2b
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 22:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFq11-0004mk-AK
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 22:39:19 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:35053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFq0z-0001p4-FA
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 22:39:18 -0400
Received: by mail-io1-xd42.google.com with SMTP id r9so1610530ioa.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 19:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vc9NDn+cSIFMYl+W2YtSQC4BTkz6DvX8O9OUNytIVLE=;
 b=rCpP6Zi2QNofp/MAlJKwFS/2AwnS6HHnkROT3bs1tT4aJZVqhXCUPnv7ufnzSoZhsZ
 tV8w6UzlyV4IhuqErUUMl+mjq9qWFQ6UwyansedGF6w0fj6aVu/aJF6Ev9kzKFpQZ2E1
 D8pjOD7AuIUjuM5JfgeqpzopsM2r1Zvb9X9AoNF88hH39H2u74Snl0XKliUjFwWCeyXG
 KBPKYgtsyUa77Ve8eOceDYE2h598VUmzfOAwfBW8UxNOW2GVDDH/Pfx9OYDOjMKYDCxu
 qZp5pOm4OoBMsvVA1BQ9YNVhGVeN1ipl8UcqkEHDj9CHsZ5rtWt+jhdQJy5oeBa5p0WL
 3frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vc9NDn+cSIFMYl+W2YtSQC4BTkz6DvX8O9OUNytIVLE=;
 b=FUXVWmigJCNoGgUslUxO97sPd34oC5nJwkiqSrkmIIr6Bqw0/jari79mdItN40yBBy
 5PIkiLJpDrHnOGj41Iv9fx39Q5JNbNAl/rpcPKVCLk1j9YXc2rbsWSV1FWV+yCDFDO3f
 g97dbS2OR7LEEL0L2mcgNxX6WuRq8IF7cJx2g8TzqJIQhep3ucjFpWrR7+OXSVNF+GsF
 469SdN7PUuFvR9wqe1AJolhhUqDqplPYQNaqYTjyHqLjk4lKgRmDzDiSyu8jW2z94WsB
 Dyeja/BBJiPsBi/EKWWc/9rwot11WcbgP1ITK16LA4rzmZ2X3dDZmCQ7irmlzESGbmdA
 i/tw==
X-Gm-Message-State: AOAM533XulMF5v96xnxB31Wb26lTDeEzMsTi4tByjGzq/N3QhxBtd2dy
 lCFZ67jH6Xev5Zc5lFVKrN8nNQXnOFkAaw1jURUr
X-Received: by 2002:a6b:6309:: with SMTP id p9mr1710300iog.78.1599619155960;
 Tue, 08 Sep 2020 19:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <45eecae26272efc7a09837573cd5278296b58dc5.1599549462.git.haibo.xu@linaro.org>
 <20200908105631.etggiu56l65ohlyq@kamzik.brq.redhat.com>
In-Reply-To: <20200908105631.etggiu56l65ohlyq@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 9 Sep 2020 10:39:05 +0800
Message-ID: <CAJc+Z1G9F2BrtuOs5Lw5-ibBZLjWEXDzudsQur13YSqAr0=XVA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] target/arm/kvm: spe: Unify device attr operation
 helper
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd42.google.com
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Hf3F/P3rvbH

On Tue, 8 Sep 2020 at 18:56, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 08, 2020 at 08:13:23AM +0000, Haibo Xu wrote:
> > From: Andrew Jones <drjones@redhat.com>
> >
> > Rename kvm_arm_pmu_set_attr() to kvm_arm_set_device_attr(),
> > So both the vPMU and vSPE device can share the same API.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> Looks like a faithful port of what I posted as a hunk of another patch, so
> I'll accept the authorship. Please also add you s-b though.
>
> Thanks,
> drew
>

Ok, will fix it in v3.

Thanks,
Haibo

> > ---
> >  target/arm/kvm64.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index ef1e960285..8ffd31ffdf 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -397,19 +397,20 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
> >      return NULL;
> >  }
> >
> > -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
> > +static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
> > +                                    const char *name)
> >  {
> >      int err;
> >
> >      err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
> >      if (err != 0) {
> > -        error_report("PMU: KVM_HAS_DEVICE_ATTR: %s", strerror(-err));
> > +        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
> >          return false;
> >      }
> >
> >      err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
> >      if (err != 0) {
> > -        error_report("PMU: KVM_SET_DEVICE_ATTR: %s", strerror(-err));
> > +        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
> >          return false;
> >      }
> >
> > @@ -426,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
> >      if (!ARM_CPU(cs)->has_pmu) {
> >          return;
> >      }
> > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > +    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
> >          error_report("failed to init PMU");
> >          abort();
> >      }
> > @@ -443,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> >      if (!ARM_CPU(cs)->has_pmu) {
> >          return;
> >      }
> > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > +    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
> >          error_report("failed to set irq for PMU");
> >          abort();
> >      }
> > --
> > 2.17.1
> >
> >
>
