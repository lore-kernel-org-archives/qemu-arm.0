Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4839533lfy;
        Sun, 9 Aug 2020 20:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSt+73jsNjZcN8qaxgoloGXO7Gk6FcArPxjZ6AFGg+bcJISNRAeLALUA6U91ykRL+QOc64
X-Received: by 2002:a25:a441:: with SMTP id f59mr22270604ybi.42.1597028635565;
        Sun, 09 Aug 2020 20:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597028635; cv=none;
        d=google.com; s=arc-20160816;
        b=ggWV3eGENDwti6sXBMS/UN6+GqgoHv/5BozZFSHjQcR7RazJYlc1k/P3hzCWmrJnN+
         buKGOvqjlT/0vcYtX3ltAvIlHpvE0+ceUVCQhoti8wuIGLuW5djNLF8Af7pGHOXb9q+b
         eos51te2WyKFAU20mNeOKUI6Zk3sPwglICvU5escHuW7r1avB1xuABhadeBvttooYgkA
         h33iuIZaqKhoM3azb32eW3HYzOXDqVtGiZ+8QzEeWZ6EGr7mU2Gyl3QjcPYnvM31XVuh
         h340hvMKWFJWf7JUGu2f5lUtauqE+/nUdeqKmH0VI1vDvIIrIy6AdWxuU5gvvtcp4qYQ
         6xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=irpLHooQhudsr3cZ1+6XxT+4wN2uJIN635QV+tB1xLA=;
        b=xLTnH64bl4myWEYxSA4VIqLZgn+dBP13soXWTsnshuZ+nuN34UMC7/FBrq6YIeLpfP
         /7Xzt5hae8joG4GFPzmgCT+xI0SjEwbtLpz1P+r+LQt5/bllvoZVwoa3lDDFPtrsw8aJ
         5UR7x/U2M9f31fjtoPw7YDSd4SkYtdSzJdlFL1hlinjarUjUUjv9segJ+q+5kY6HLAyx
         oDGNGPGnJaLZ2v+DTZHkw+Hk2xPq0l6RzYXJVFugj/tQRfTJxbrM76AtAeQhGus+KVux
         qqLU1t2M69O8egxab8RluDlQXmaVQfUDz9VBAiciWGnAZHxcMaNq/bPLoC+3ShsXBAIp
         hSBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q0fvskZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si16066433ybe.393.2020.08.09.20.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Aug 2020 20:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q0fvskZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k4y6M-0002MF-UB
	for alex.bennee@linaro.org; Sun, 09 Aug 2020 23:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k4y6E-0002Lz-OP
 for qemu-arm@nongnu.org; Sun, 09 Aug 2020 23:03:46 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:45321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k4y6C-0005ng-RL
 for qemu-arm@nongnu.org; Sun, 09 Aug 2020 23:03:46 -0400
Received: by mail-io1-xd42.google.com with SMTP id u126so7422798iod.12
 for <qemu-arm@nongnu.org>; Sun, 09 Aug 2020 20:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=irpLHooQhudsr3cZ1+6XxT+4wN2uJIN635QV+tB1xLA=;
 b=Q0fvskZGXLJTbJf2c/UMJAmSv32ojvxxqjcPXC39nZepn1wrzfGa+g34o4KxBRi/P7
 m9VIZrKUtDQecfU4M/Txu9FmvPOltTZmSKZ6UHtGDaaG3JyoSyzNMw0fE50qSjsgfz/T
 kj4cmpvmPiCAF0b5vV5RYE7wOFhrsaKRMoppFJCxasTxp47vUp08x1qPIjcp3RRZKYv3
 t5fA3+0NCuRrpZEbYauiTEuq6mzCgE7wzN0+5wC9TSE5c0oukG8bC9+wH88pga0KWReh
 9i+sFV80YZQ2CjIGHj4HtK08n4ftYJ+f8alZjh6qTDoors+Ypnc8uiasPxBlQXSWyU7T
 K84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=irpLHooQhudsr3cZ1+6XxT+4wN2uJIN635QV+tB1xLA=;
 b=iwe32niAKwna5FOpRjpEoakX3uwu75DgZKMFfnJZ5FU6FPTpaelw+uFTWxaHG37TZP
 AN7tK3DZGvnYl5JOWQaoG9KigeezvMgk4wp+Vj3DqxRDv7KC3jzA1p7utKxGCbGDCqG4
 p4xH5tsHkli66HU6pGVMtmDpJjBetgVk6p+OLRJ9x95rrrbxuV6m3I6twCr0L9BScvf5
 xMr7RGArOKB7I19nCJQeavkXIjFsG28cUYOjnUfZHXbSdxQc2TzW2HwsF+TJoK8GQV1l
 P+VK73sZwK07IHv5qZocxgWi4mhDMTX2XdFagZdTwm1zqQQfdxDJVmNYx45Ed8K3M3ib
 v9Pw==
X-Gm-Message-State: AOAM5303B/YH3elwkdLfzhV8R9AEG9dw5U7NgVMggA4211yOYL/rpCDf
 dkoZYk+xOAJCrPNdLod0jgOxZZ51chETIW34NIWs
X-Received: by 2002:a5d:8b4f:: with SMTP id c15mr15492688iot.146.1597028623370; 
 Sun, 09 Aug 2020 20:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
 <5fd62d43-0cdb-d69f-c11c-4a0122b28396@amsat.org>
In-Reply-To: <5fd62d43-0cdb-d69f-c11c-4a0122b28396@amsat.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Mon, 10 Aug 2020 11:03:32 +0800
Message-ID: <CAJc+Z1ECoqwzexiGABs4oBk_DdZcA3_r6u7fQP-ZnZnuKaK7Rw@mail.gmail.com>
Subject: Re: [PATCH 3/7] target/arm/cpu: spe: Add an option to turn on/off
 vSPE support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ieMcRc3Ftnzx

On Fri, 7 Aug 2020 at 16:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Haibo,
>
> On 8/7/20 10:10 AM, Haibo Xu wrote:
> > Adds a spe=3D[on/off] option to enable/disable vSPE support in
> > guest vCPU. Note this option is only available for "-cpu host"
> > with KVM mode, and default value is on.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  target/arm/cpu.c | 28 ++++++++++++++++++++++++++++
> >  target/arm/cpu.h |  3 +++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 111579554f..40768b4d19 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1122,6 +1122,29 @@ static void arm_set_pmu(Object *obj, bool value,=
 Error **errp)
> >      cpu->has_pmu =3D value;
> >  }
> >
> > +static bool arm_get_spe(Object *obj, Error **errp)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > +
> > +    return cpu->has_spe;
> > +}
> > +
> > +static void arm_set_spe(Object *obj, bool value, Error **errp)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > +
> > +    if (value) {
> > +        if (kvm_enabled() && !kvm_arm_spe_supported()) {
> > +            error_setg(errp, "'spe' feature not supported by KVM on th=
is host");
> > +            return;
> > +        }
> > +        set_feature(&cpu->env, ARM_FEATURE_SPE);
> > +    } else {
> > +        unset_feature(&cpu->env, ARM_FEATURE_SPE);
> > +    }
> > +    cpu->has_spe =3D value;
> > +}
> > +
> >  unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
> >  {
> >      /*
> > @@ -1195,6 +1218,11 @@ void arm_cpu_post_init(Object *obj)
> >          object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu)=
;
> >      }
> >
> > +    if (arm_feature(&cpu->env, ARM_FEATURE_SPE)) {
> > +        cpu->has_spe =3D true;
>
> Being a profiling feature, are you sure you want it to be ON by default?
>
> I'd expect the opposite, either being turned on via command line at
> startup or by a management layer at runtime, when someone is ready
> to record the perf events and analyze them.
>

I'm not sure whether it's proper to follow the 'pmu' setting here
which has it on  by default.
To be honest, I also prefer to turn it off by default(Please refer to
the comments in the cover letter).

> > +        object_property_add_bool(obj, "spe", arm_get_spe, arm_set_spe)=
;
> > +    }
> > +
> >      /*
> >       * Allow user to turn off VFP and Neon support, but only for TCG -=
-
> >       * KVM does not currently allow us to lie to the guest about its
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 9e8ed423ea..fe0ac14386 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -822,6 +822,8 @@ struct ARMCPU {
> >      bool has_el3;
> >      /* CPU has PMU (Performance Monitor Unit) */
> >      bool has_pmu;
> > +    /* CPU has SPE (Statistical Profiling Extension) */
> > +    bool has_spe;
> >      /* CPU has VFP */
> >      bool has_vfp;
> >      /* CPU has Neon */
> > @@ -1959,6 +1961,7 @@ enum arm_features {
> >      ARM_FEATURE_VBAR, /* has cp15 VBAR */
> >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> > +    ARM_FEATURE_SPE, /* has SPE support */
> >  };
> >
> >  static inline int arm_feature(CPUARMState *env, int feature)
> >
>
