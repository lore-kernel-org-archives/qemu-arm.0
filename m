Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5772580lfy;
        Mon, 10 Aug 2020 18:14:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3v/az00AWsz9jis/WQqtUSSLPBnZxq2IDVHvgZHTKVRK2KyBA8RqQaknZ7qmLvnOTmruz
X-Received: by 2002:a25:b5cc:: with SMTP id d12mr20304777ybg.190.1597108467565;
        Mon, 10 Aug 2020 18:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597108467; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGXJ7dPo0jRaObTmvRNnozpkghXhl0AnSAfX/m4MShxQD1bzC8eQHww1S8ixdAWb5Z
         9zrk39vQwHrlTCLgYTv0bFNquukR3OLO2dIvSMgVW0fn/OG4K/wbYhH35w4Fse/59tRh
         RsSPeL9SNpvcgIbEjC/BDVZlXaTw6oDJC2T47FRG4g0ZPXbC+s/Oc6+kr72dEjT/0Kkx
         b+PGydb0FKvgDKfoOYATlQv+QQZR+NDR7FvCw2X1pLYZT8WRR184pXOnsBxtvrBxCqOh
         SYwH6I/fknmyUIEAWcHC+XHWl4UNByASZamZUctnSWyxvB8gE6kcuspRKMXWoT5iYYPG
         JQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=c1JpP0g9tSj8qs+HkN0i2QSkoW49ZVNeIaewKOAYeq4=;
        b=Ta+JrHPRL2vHCSZbYO50uXcNtCusJuXJlmIIf4NuEylzh+iocTr+VKBPE1K5RfJS58
         JrFiaOJvlbpM1E7opuOqq9fm8BskrU/RyFceucTDG7CYLJMXNL4eKUljVtK3lJ03PfK/
         R9xaemtqMv99In+o9MzxfjzOWIg2NQx8yoXOArRCR2R/wEiaiQ72HMg+a8tY8dhZL4hf
         vhBPzX5Ye45MLCEhHTpiHMMWVEqBYuv/DPjPAwZHvoy5t5yaCwCZ156haQlXEILW+GgQ
         +34W+vjFF9QsyY9NZ5OPnrUeRWnAAX9eNx+sxfztFfYSrCtInbna4Ah9A+2qgFvvzGqG
         SEkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eOc/gunO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si23394937ybt.3.2020.08.10.18.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 18:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eOc/gunO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5Iry-0002yU-R7
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 21:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5Ird-0002Xc-NX
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 21:14:05 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:36943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5Irb-0007lu-Na
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 21:14:05 -0400
Received: by mail-io1-xd41.google.com with SMTP id b16so2534844ioj.4
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 18:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c1JpP0g9tSj8qs+HkN0i2QSkoW49ZVNeIaewKOAYeq4=;
 b=eOc/gunONv14c7euuK4VLxS4XT1+YUdUD8+WMz85lmdAaLQeFJsQ0j8JYRRM+N4yMq
 fZ4iaEEeqUBWzlzTkxOObRwOOYC50tlHLdd7GEkes2Z3tjbcUdDc8zxoSmr2fr+3tJSR
 v/2UmXBCPHVWh5RC7OA5oniLJqmvVE6NDzPyyQ2EZknCMhqAVqEG2YBVqtH0KEu6LEM7
 h3mZwo3uMq53Cz+nXr8rB1bYjRtuzxdKwjFvTTlJ7jznt7k4r/jqOa5D52OHLA5fVAir
 6ARxLDO7lnE/Xmy9ztvr7EvLL1XfTuDyXBEhS+2U/9qQWHHysHDh0I0RbnX22kTgL7xI
 Bfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c1JpP0g9tSj8qs+HkN0i2QSkoW49ZVNeIaewKOAYeq4=;
 b=CoD2NNIPr6sccE4in9oxWigRh+DzFFw/5pMYx1jx2MIdIXVJe2o3Fcu9amcdrmelRY
 WD6Wbm/hSq08n8FCLShbwuQJBQ2jbnfumu255APFzbFtdjONvB1vEzW3zshpKGdRPZDC
 /rGniSo3EB8W2+/qlFAj57k2g1iLvgVsnESxRhGPDlWSSBM8Ymha53Tv0aWj04Q/chxS
 qdqzwNsCuzdsUIu0QHs5CXhzorvf5OQOTBm3lpHCJH1jzktG4YA/bYgruoSNzUo4N9QV
 6GmI33LjPbxSh7m8WKjAyMOKttnmlUurScYT+mwkq7dWegIxbv81Yvxk8v0c4309QSF2
 oMPw==
X-Gm-Message-State: AOAM531OuID39NrPRNtnsu8et8sO3TUO4Tz/zQr4QkB4UWHVTuhbXCiu
 Mgp/3TLq//zXO3qSmvY9WIvPA1F9FWfnRc8lt3/T
X-Received: by 2002:a5d:8b4f:: with SMTP id c15mr19933001iot.146.1597108442345; 
 Mon, 10 Aug 2020 18:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <3cc31df5191ae6b03e060ccd8e82df74416a3ef5.1596768588.git.haibo.xu@linaro.org>
 <b4790af9-38b7-f74a-4ebc-a7e9d3684ae0@amsat.org>
 <CAJc+Z1HzoREjCfbwct4ARmOZjszuLQEw9vqidChWjVGo19FngQ@mail.gmail.com>
 <20200810102918.jjzqt4awirszsen4@kamzik.brq.redhat.com>
In-Reply-To: <20200810102918.jjzqt4awirszsen4@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 11 Aug 2020 09:13:51 +0800
Message-ID: <CAJc+Z1FztV1WJNp4tP6XgdrZ_2LZBfmYTcsFrW2spnC4qwDd7g@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm/kvm: spe: Unify device attr operatioin
 helper
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0JsmToUzA+w

On Mon, 10 Aug 2020 at 18:29, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Aug 10, 2020 at 10:48:41AM +0800, Haibo Xu wrote:
> > On Fri, 7 Aug 2020 at 16:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> > >
> > > On 8/7/20 10:10 AM, Haibo Xu wrote:
> > > > Rename kvm_arm_pmu_set_attr() to kvm_arm_dev_set_attr(),
> > >
> > > Maybe rename kvm_arm_device_set_attr() to match the structure
> > > name?
> > >
> >
> > Thanks for the review! I will update it in the next version.
>
> I've already renamed it to kvm_arm_set_device_attr() in [1]. Also, it's
> not enough to just rename the function. The error messages the function
> may generate have "PMU" embedded in them.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg727590.html
>
> Thanks,
> drew
>

Thanks for your review, Andrew!
Will rebase on your patches in the next version.

> >
> > > > So both the vPMU and vSPE device can share the same API.
> > > >
> > > > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > >
> > > Regardless, with the typo "operation" in patch subject fixed:
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >
> > > > ---
> > > >  target/arm/kvm64.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > > > index 1169237905..75a417d65c 100644
> > > > --- a/target/arm/kvm64.c
> > > > +++ b/target/arm/kvm64.c
> > > > @@ -398,7 +398,7 @@ static CPUWatchpoint *find_hw_watchpoint(CPUSta=
te *cpu, target_ulong addr)
> > > >      return NULL;
> > > >  }
> > > >
> > > > -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_a=
ttr *attr)
> > > > +static bool kvm_arm_dev_set_attr(CPUState *cs, struct kvm_device_a=
ttr *attr)
> > > >  {
> > > >      int err;
> > > >
> > > > @@ -427,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
> > > >      if (!ARM_CPU(cs)->has_pmu) {
> > > >          return;
> > > >      }
> > > > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > > > +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
> > > >          error_report("failed to init PMU");
> > > >          abort();
> > > >      }
> > > > @@ -444,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> > > >      if (!ARM_CPU(cs)->has_pmu) {
> > > >          return;
> > > >      }
> > > > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > > > +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
> > > >          error_report("failed to set irq for PMU");
> > > >          abort();
> > > >      }
> > > >
> > >
> >
>
