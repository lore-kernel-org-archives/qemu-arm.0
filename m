Received: by 10.25.87.130 with SMTP id l124csp153879lfb;
        Mon, 5 Sep 2016 07:39:51 -0700 (PDT)
X-Received: by 10.200.48.134 with SMTP id v6mr5187263qta.8.1473086391613;
        Mon, 05 Sep 2016 07:39:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n75si6821110qki.21.2016.09.05.07.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 07:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgv3u-0007fC-RM
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 10:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgv3m-0007ZU-EI
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 10:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgv3j-0004VP-NT
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 10:39:41 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:33773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgv3j-0004VI-IR
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 10:39:39 -0400
Received: by mail-ua0-x231.google.com with SMTP id 31so27184443uao.0
	for <qemu-arm@nongnu.org>; Mon, 05 Sep 2016 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=b+7F1jAwtRb7CbsOTpi+p5Unhz9cdwv4GmZ+Ky0kM9o=;
	b=fpNWGE0HKxTjcwp1am1rUQbjC938yJbyS7N/i/vMmiDC6V1JtlZLANl9SpFNu7FCRt
	k21BM6Yc+s/qiqxJM62UHSkSbCRE2cmIs+coZlXf4xII2V21V+MSJmVErHv8fBar+uAW
	WMt0UUbdzXxjdhHhghSiQVJ7uoTQaG2P32fjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=b+7F1jAwtRb7CbsOTpi+p5Unhz9cdwv4GmZ+Ky0kM9o=;
	b=NlN3YsAXxqpY0KPFc1swVz7l32nEMOx52PDYvFbi6llFTBP3U6GfmbjXMkbny1LMIu
	5ES6K4iZ/6Is73QWDwYBBttyRHL0Lm7zIU+H7qxps0ZUlfOy12h6fAVvEnL5IVOj/oPD
	2JBjcddIcAnUeKUlyZ6oMJZ6g8cVQ4WYuaIBbZ7sV41WLlzjxAown9pmvNGQUpY3paqp
	RFrjLDo0PVTAATKR2ufDLVHm/T+5ViIvVvW3Kr+yb99dThMBTWwbyPHtnPj5oFnEBpSm
	0ZSVnBCpWdqz0tdmBfCt+4GhzCan8TjdWwmwjxAUmZJasy3Ypf2OcdBAVWDLmbDxdqCX
	MrLg==
X-Gm-Message-State: AE9vXwPpPCd20/gyWzcZOzXpsOEWZT6yYqqfL2Y2gi+26JG4/myHAQE0Ahks+siscrWUquPnS0dYK6W2R3/XXr6r
X-Received: by 10.176.80.120 with SMTP id z53mr17953999uaz.38.1473086379066;
	Mon, 05 Sep 2016 07:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 07:39:18 -0700 (PDT)
In-Reply-To: <1471946352-20779-1-git-send-email-clg@kaod.org>
References: <1471946352-20779-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 15:39:18 +0100
Message-ID: <CAFEAcA_+tECGsnVnp7YKYFXWZDoi9n7mQRjFAoWGZ6hRs2FFpQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add VBAR support to ARM1176 CPUs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GnbUpFZUIygt

On 23 August 2016 at 10:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> ARM1176 CPUs support the Vector Base Address Register but currently,
> qemu only supports VBAR on ARMv7 CPUs. Fix this by adding a new
> feature ARM_FEATURE_VBAR which is used for ARMv7 and ARM1176 CPUs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

This looks mostly good; one question below.

> Index: qemu-aspeed.git/target-arm/cpu.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/target-arm/cpu.h
> +++ qemu-aspeed.git/target-arm/cpu.h
> @@ -1129,6 +1129,7 @@ enum arm_features {
>      ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extens=
ions */
>      ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensio=
ns */
>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings=
 */
> +    ARM_FEATURE_VBAR, /* has cp15 VBAR (ARM1176) */

you don't need the bit in brackets, I think (it's not complete
anyway, since v7+ also has this).

>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> Index: qemu-aspeed.git/target-arm/cpu.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/target-arm/cpu.c
> +++ qemu-aspeed.git/target-arm/cpu.c
> @@ -584,6 +584,7 @@ static void arm_cpu_realizefn(DeviceStat
>          set_feature(env, ARM_FEATURE_LPAE);
>      }
>      if (arm_feature(env, ARM_FEATURE_V7)) {
> +        set_feature(env, ARM_FEATURE_VBAR);
>          set_feature(env, ARM_FEATURE_VAPA);
>          set_feature(env, ARM_FEATURE_THUMB2);
>          set_feature(env, ARM_FEATURE_MPIDR);
> @@ -867,6 +868,7 @@ static void arm1176_initfn(Object *obj)
>
>      cpu->dtb_compatible =3D "arm,arm1176";
>      set_feature(&cpu->env, ARM_FEATURE_V6K);
> +    set_feature(&cpu->env, ARM_FEATURE_VBAR);
>      set_feature(&cpu->env, ARM_FEATURE_VFP);
>      set_feature(&cpu->env, ARM_FEATURE_VAPA);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);

Is it sufficient to set ARM_FEATURE_VBAR in the realizefn
if FEATURE_V7 or FEATURE_EL3? (watch out that realizefn
may change the value of the FEATURE_EL3 bit partway down
so you'd need to do the check there) ?

We implement VBAR in v7-without-EL3 even though architecturally
it should only exist in v7-with-EL3 because we have some
legacy board models which we implement as without-EL3 but
where the guest (Linux) assumes it's running on a with-EL3
CPU in NS mode. I'd rather we stick to the architectural
definition for 1176 if we can rather than expanding the
"things we do which aren't architectural" set if there's
no legacy config that requires it. (If it is necessary
to define it for 1176 always then that's OK, I'd just
prefer not to unless we know we have to.)

We should probably also have a brief comment noting that
we define VBAR always in v7, even though architecturally
it doesn't exist in non-EL3 configs, for the benefit of
legacy board models.

(In v8 VBAR is required whether EL3 is implemented or not.)

thanks
-- PMM
