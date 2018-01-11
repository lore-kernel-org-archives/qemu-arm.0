Received: by 10.28.173.206 with SMTP id w197csp867750wme;
        Thu, 11 Jan 2018 10:42:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBotX2WROz+YtK4jn/BIXQet63FmUUIhgc+0lO4As4RFXuBm3np2qmcB/Qy8gBTG3jbXwDj2z
X-Received: by 10.37.212.214 with SMTP id m205mr17207816ybf.383.1515696151885;
        Thu, 11 Jan 2018 10:42:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696151; cv=none;
        d=google.com; s=arc-20160816;
        b=hy3a2HYUqcdvmUu5GRXs7o8xUVCjrjA4JnWknUUyioYgIQHMrHTCom6r8gEW+zigGD
         4aWnqSawyIjA1oUhiqFRYfU3ONMH4wOrJBUsw8PCGMFpV6F9WYD+F+SKSF94DTdUVllW
         ECUrxt18LJEUjrz9VwL8vEBJdNWZwWLFosx1nqaTDUr/RHwkq4uoTP16XosWtqJY7BsK
         h8tJ00p2CAZemME+aECYrn80FnU6eLS4lOVc0jpY7yCRBMroh8LQ3bdgfOBzbrMQZCB+
         SBRG6OWwnwGYW7HG7C3O+X4CqG1GIo06DWhx94dyn31x01zUC5IrWF1IgRdjBgWtYUvg
         J7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CHbEHIE1I261fAoVz84tvsZASwbz/TgtrxlKm/Uth/M=;
        b=TSTzhNpiOKyOtpvRXqJsiLQp+ef/WrRwqBeCPrHIS52YS4z+5/jZCjEZWTLIvAVA41
         3tQMfktZxxBrnhFOMDRovWmvSzMzpR7PGl1zs2hqii3PtouSVTUy+ZPlkBS5FcRERMQN
         fWdUFFCKUnUQjenFhhKu68jjGXGfzlQyBt0MWpSsxr7A+no9pr2rPbHV6dnlj1DaZhsk
         phYyTqqblqwanvUIxSR25V/gQ3J3cXeGje+IUjEyLUiFwQyMSVBnaz9JPg/64FrsV4r8
         /uvKtSV9zZ0+Bu8oy1vfbORNL3yzeWEKgnadwjtETwrCoMvNB/jm7HwT4Xktso9CpPxi
         H/MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=anJmfiIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1si1833612ybj.250.2018.01.11.10.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:42:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=anJmfiIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZho7-0002wi-Cj
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:42:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhny-0002wS-BO
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:42:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhnx-0003kb-GH
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:42:22 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42253)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhnx-0003j6-CC
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:42:21 -0500
Received: by mail-ot0-x244.google.com with SMTP id s3so2931992otc.9
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CHbEHIE1I261fAoVz84tvsZASwbz/TgtrxlKm/Uth/M=;
	b=anJmfiIqkvVpRlox0gs4iJqfOqBYHUs2d7i0ETeOf3I5PPBCCA1281JvGHoqOCamHa
	UrNe9FTfbUC/KxMdfkiXSieB3Rf+WLUpKzENU00GzVXwCpUReySKZSe42n7yKANpH3u4
	pXTcosklpMNixoMQebhSXvJlieJoY17fAAN+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CHbEHIE1I261fAoVz84tvsZASwbz/TgtrxlKm/Uth/M=;
	b=Qt7v0PTg5HiRBqZcLKY4qhruK+plIXDGk41v0l29tPAXPRUaTTArPYU0Mgei5QNIvw
	M7ExgcqjibBy2/1p5X/QADFXpRwNdkm2amU+YygSPTgQBmNA9YrgkYc+SchwLt6qG8uY
	287BeEG7R9bCQoz2cDy+OUYiWzs+Ib0KvysFRwfEEbQbVitz9btC45DvQFfPJkK6sHXK
	3ty1kUWzmSPy1nhDYWT145jPATfhvULsb8gTXSOT4H4cWmDCCGmdh2RqXgFvJP8wMHiu
	oLVOe/kFEta0cofYF/GYFbhmSvuC5oJtWPuI1T6L0L/o3d+NjYY/9bzx85Pb/nhvwEz1
	ydNw==
X-Gm-Message-State: AKwxytf39fujdlCdgwjAViPG7igztkR5YjHPka7Iqe+21o5cdvIborlq
	jhM1uAC2iDtdMCKRPko9oeoKPRir4Va2Hvn2XqUB7w==
X-Received: by 10.157.51.76 with SMTP id u12mr3611010otd.197.1515696140699;
	Thu, 11 Jan 2018 10:42:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:42:00 -0800 (PST)
In-Reply-To: <20171218173022.18418-10-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:42:00 +0000
Message-ID: <CAFEAcA_DQwQzUS8Fce7zV=f+eo-MrFuh02fyT_OxKcPEVWh58g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH 9/9] target/arm: Add ARM_FEATURE_SVE
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
X-TUID: eJLCo/3D9u5l

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Enable it for the "any" CPU used by aarch64-linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h   | 1 +
>  target/arm/cpu64.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 37b8cef2e2..652e00d957 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1386,6 +1386,7 @@ enum arm_features {
>      ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>      ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
> +    ARM_FEATURE_SVE, /* has SVE extension */
>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 43b42f95fd..366ab2eeee 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -229,6 +229,7 @@ static void aarch64_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
>      set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
>      set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> +    set_feature(&cpu->env, ARM_FEATURE_SVE);
>      cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>      cpu->dcz_blocksize = 7; /*  512 bytes */
>  }

We shouldn't turn this on until it actually works, I think.

thanks
-- PMM
