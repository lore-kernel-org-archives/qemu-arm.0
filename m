Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4831865lfy;
        Sun, 9 Aug 2020 19:49:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOsQzFaJvdeRgSDNxE7R7cAczFxqTbV3UwZxcZ/N/arao1vjd/8U8DF815LHKY0SoRB6D9
X-Received: by 2002:a25:d048:: with SMTP id h69mr35674721ybg.228.1597027745309;
        Sun, 09 Aug 2020 19:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597027745; cv=none;
        d=google.com; s=arc-20160816;
        b=G8y2jVtFz1hITqcqnqh0tSI0JV5gPmWMV4kFkVQpTNEA4cuDeDVPknCWjJxfkMIIvb
         DQQJrt+kRe73F5g8Y1ZCXjM9t8uGDnvxI5QELrYyB4h7QFSxB8LGFqBUHpmNzfXDHD8r
         WXhISt6E4MmmJiqL53hs5xXUShbZRbzP7kuP0obhN73gFDuFUTUfXEFbuAly6Yy9pGwc
         VkN5ViveTR+DX8BZsVWICZgGkfiTfhUvnQAxVXv+RXS7C9TYtf8DrlppduenQJiusoHK
         p0DAxvCKOtJicCo+dRMuYEWI97w07Hv83qfhSbsyjdMh5CURvhHZH9V3/e9XVebcw2+A
         MnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3fMoH270+qW7vq3WlK8SY8mVJoSWpFyEV40E3e18lxY=;
        b=ei8hd0mzqlX6Fo4EXOaLnGHBSA5ceJKukor2WbzQ1Ko8ehBfgmcwJ8mAFgdaZclLLM
         uMQ1nS348oK1FmCwVVVHFkinIMtz08/HEDby+tekVYadFeKuH7q+Aha9J6heDe4Myf33
         gvOGesqSfhMRV8SAT0i9lQJSVm5fl2YcKpHBqpiIzCycTP8rjSDYclm88dzA2zVdXS+f
         PzmIoTB2UDBBIoTyuVqZUtCCHx3lKOyxLSUGJrY8a7BFoRXuucVHWU+erOhjL3VlKx5N
         yLML3dPB+Q6fOspIOFDfv4482JHj6Cdfi3vQusKEIGSIuL4ahV8w6PSCYzqBNlnh9q0N
         qCLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AJrdEQ5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i67si17737177ybb.71.2020.08.09.19.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Aug 2020 19:49:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AJrdEQ5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k4xs0-0007zc-Nm
	for alex.bennee@linaro.org; Sun, 09 Aug 2020 22:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k4xrt-0007yI-22
 for qemu-arm@nongnu.org; Sun, 09 Aug 2020 22:48:57 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k4xrq-0004Hn-MQ
 for qemu-arm@nongnu.org; Sun, 09 Aug 2020 22:48:56 -0400
Received: by mail-io1-xd42.google.com with SMTP id z6so7428308iow.6
 for <qemu-arm@nongnu.org>; Sun, 09 Aug 2020 19:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3fMoH270+qW7vq3WlK8SY8mVJoSWpFyEV40E3e18lxY=;
 b=AJrdEQ5oToyCfEo0UqE0GVXCjjdAN1gYHzu2nG2/90qHiSv+kAb58Ma7wrMhHmZpSj
 45UJICKRzB+24PpGrCaSbpnOqF+SV5Hrz3w5yAoZQhmeVNhVcf3PclHAYCkhCUfgCai/
 pVqIPSZ4FlNuv1Fr20p+D1XQnO8WtAIADmLZmlphtZHkPO4tkhQEUCCdM4ytdqN/DEGS
 /c0wGugLgHmZPhOOSAtQ/udHcpxF4N3NjRCSHRE2skrBaDam5ftWd8exAfN2EsZlpMbf
 yGvINQVbqFhiziaZmzxN+Zm5KAwFASuaTSPyLPzDtqcwbuPUP6rJFobfkBMBDV22iqUK
 UHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3fMoH270+qW7vq3WlK8SY8mVJoSWpFyEV40E3e18lxY=;
 b=f6PHwUQuMGF0GWbH97Lo1ELtJCkZN+LcsDlOKOPw9nvJJINZMaR3yyXPRHkc2pF0Jh
 1AvHO9p9/mPUeXk+D7KYOHqHp5NcdGaOX5bpv8+lKk4DutPta0WkjmueRnrfcdBoAekN
 YS+dzQPaS981NfuXOOUMHM6o62osJftar8cnbLRU1+phxD+MI5XlnE+HyiHq7JcxH7iR
 AoinrxyoZdtgCt9dJIjevDKH5IT9I4U8v30q9JAlOevaJF2j0P4BBGzpE9HpEGGW+/Tz
 goDb3Rm6a3t5N4d7kljK0KaPIoss6U4HQMI8p1G+naYhHxdCEI57df6RWfjOrhzM+2ix
 C80Q==
X-Gm-Message-State: AOAM532ZcO4N/+QLkFgtPTl45hA2kJ1sO1Mcm1BuptWTAAg/NrRAybM7
 vO8jVO4yYfAcR0wJqpuUew0rIH5Np634Wkwf0A9w
X-Received: by 2002:a05:6602:2246:: with SMTP id
 o6mr15401798ioo.35.1597027732602; 
 Sun, 09 Aug 2020 19:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <3cc31df5191ae6b03e060ccd8e82df74416a3ef5.1596768588.git.haibo.xu@linaro.org>
 <b4790af9-38b7-f74a-4ebc-a7e9d3684ae0@amsat.org>
In-Reply-To: <b4790af9-38b7-f74a-4ebc-a7e9d3684ae0@amsat.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Mon, 10 Aug 2020 10:48:41 +0800
Message-ID: <CAJc+Z1HzoREjCfbwct4ARmOZjszuLQEw9vqidChWjVGo19FngQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm/kvm: spe: Unify device attr operatioin
 helper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LnICBRSJ6y0N

On Fri, 7 Aug 2020 at 16:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 8/7/20 10:10 AM, Haibo Xu wrote:
> > Rename kvm_arm_pmu_set_attr() to kvm_arm_dev_set_attr(),
>
> Maybe rename kvm_arm_device_set_attr() to match the structure
> name?
>

Thanks for the review! I will update it in the next version.

> > So both the vPMU and vSPE device can share the same API.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>
> Regardless, with the typo "operation" in patch subject fixed:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > ---
> >  target/arm/kvm64.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 1169237905..75a417d65c 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -398,7 +398,7 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *=
cpu, target_ulong addr)
> >      return NULL;
> >  }
> >
> > -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr =
*attr)
> > +static bool kvm_arm_dev_set_attr(CPUState *cs, struct kvm_device_attr =
*attr)
> >  {
> >      int err;
> >
> > @@ -427,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
> >      if (!ARM_CPU(cs)->has_pmu) {
> >          return;
> >      }
> > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
> >          error_report("failed to init PMU");
> >          abort();
> >      }
> > @@ -444,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> >      if (!ARM_CPU(cs)->has_pmu) {
> >          return;
> >      }
> > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
> >          error_report("failed to set irq for PMU");
> >          abort();
> >      }
> >
>
