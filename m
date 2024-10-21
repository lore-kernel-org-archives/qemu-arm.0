Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2349096njb;
        Mon, 21 Oct 2024 05:58:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQFDj8V7GqQsVtVmPmGav5aaZCgMLqDGFaKiF0Oi0jh25Cj7EuDTWahwCwV3fZCzE/Ouvmw2dwMk+Ulw==@linaro.org
X-Google-Smtp-Source: AGHT+IFwTHUlAyPBnT/YTW1LBnyt7JiP0thh8s+xumo5wivUcRZ+e2bqmC5UKv8/4GGxBOy8sOEd
X-Received: by 2002:a05:690c:34c5:b0:6e5:ac5f:9c43 with SMTP id 00721157ae682-6e5bfd4338bmr79623077b3.39.1729515536113;
        Mon, 21 Oct 2024 05:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729515536; cv=none;
        d=google.com; s=arc-20240605;
        b=XzL56devtv1we+eGdQMEQoldIjXimYP3fG6C2w9PnZRdDwiWrYMKt4TrJk9atp0jgO
         e1wYZ+xSIwcAQrDZtub47XC7u2EZOKSvpRwuTZ96yn1ap8y7mHQknXjcVtBBffKJrvLu
         qG8ln8r3rUNBVaNRuKTTQv5DhiPutFI5dpI2vYfLEeR1rM0xrzKGixNf3u06X1cHT/Hx
         JXJjoy2Dqb6j+Ezmxd2OWZvrFKbN8rihBboy9h4ZHiDavxC97bXxj3ruI3uMbxBKM4Ne
         YihoF0U5IGh55XOUpTQXRBX53KGodl7IjMoafPu+K8hB6odO67+aK/oI7DdRR+gObwLf
         5JXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3aZFIo5hfSpWXFAvY/Ia2orS+55ORfi5yK3W5zNxbug=;
        fh=kCUiA2DqJiujYM523JOVIHl235QZ2vVP87othqqsisw=;
        b=bdkJn2xGZoAvbGaDHtTgF1EkB7Q9sLOUh+Xf8nkkdH8DBNwTNydvCyWMN0AkEDQMei
         4e0EojbvALislvHPZcD3D88BhjVr84SifKHpVfd01scHxwM7K1hf0eEVw3s05S/RKE1I
         Hzt1YvSqCJr5mEsm4dsRpTuQCIltwmbvP8vqIvwDcyEq2Bj8Ll9Z/DxqWgvCceqn/Jlc
         moJqplNg+Pn6KSOB9tiKZzJS+//IlvYco+6EvZBmwvkjINIygwmaXxCSasRMfEZ8ofbA
         zElhgUfbwwFkEzUE5aAYK8uzweuPzd0SuyTomIrhrDFmyVa46YmMwjhkOz5q8aYPlZt4
         Y+7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAlnq1PV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce00a02d4esi39635606d6.515.2024.10.21.05.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 05:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAlnq1PV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2rzX-0006eE-Ub; Mon, 21 Oct 2024 08:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t2rzV-0006c0-P3
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 08:58:33 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t2rzT-000576-K4
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 08:58:33 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso6027793a12.2
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515510; x=1730120310; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3aZFIo5hfSpWXFAvY/Ia2orS+55ORfi5yK3W5zNxbug=;
 b=JAlnq1PViEuRxBKxC0ku8Zy0fycJ3kAV4Bx2JqU3UNyzMG9tCzawFu+6hn4ToBxesh
 t1ZUTDFmvyjuzOMXfNTyfr7K1Kb1NAvCNryi/qI74qUiSUtxTX1qu5AdzvsIRfKefA6d
 P4u/xNlg8oxFSVNESB3gg/lT4blcV+fayYrNYwC2EXa0NZ/OwgWb7mj27wE5K9EtfzAf
 e77hPV7BQNTxm9lAOWdpvuGuA1JrI8p6mZdgGhYEZz5mXpZr1HZWLfiCDndBINHe5AIS
 hRY7BiT5Jbt1oxxK+TlB/1Ck7BDT11YL1q9UQfVViaGJkdl+kRMNrYM4SrDETgnwjpc1
 nH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515510; x=1730120310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3aZFIo5hfSpWXFAvY/Ia2orS+55ORfi5yK3W5zNxbug=;
 b=EPqi7W1Cw7ytYSTN3eDjtSdV4Ogd/ghuGlKLtyNnVyF6x4qPiBR6zlU2gx+C51nRdr
 QI+330Oc8Mxddxa/Z87jH44cfy9iJbZFwIeF95BBOvCBW/esGRRdkaD6V4BwVHQcILq7
 z8hYbDZE8PBrO0Ll4w1o9sUk3ODOIYqjWP+KbCtIwbrCt9c7e4jIKUSEQ+Oh48XDz+yd
 LjEYAZAwPPfSAJ6Y8rxgef4/oJYdXtpVLzMpzUZ1T/MlIn91m2llx6GxqLbAkr7+kHFa
 hBLnFQD888g6LqH8zmw/z9x7TYTtcDTWhFN1mpZK+Ur715u0Uwt4QjpZDkVA7vq294yN
 CLcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPfBogeM2c/tAHkYjCNp/r3nGn0Hzop6tPgHE5HqqBIVhFBfTrEXCWKextGCC+d/nTIFXeGItgxA==@nongnu.org
X-Gm-Message-State: AOJu0YwK9SNtB+KlQuAvsrF80VRAPUaa0LGw90u1rRQlmAXSTV8L3cxo
 /ptnahvkzo5ZVswSzmYZIq334hvzxKSKusL7jDEkpqIo23e+WMgYsh8HZfoy0eAXY+9SYNig+GD
 BsuWjpyk0kuQs5bJfWnE6F7hI5QmdJJeIouuvmg==
X-Received: by 2002:a05:6402:4410:b0:5c5:c4b9:e68f with SMTP id
 4fb4d7f45d1cf-5ca0ac459b1mr13004117a12.5.1729515509735; Mon, 21 Oct 2024
 05:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231021122502.26746-1-neither@nut.email>
 <cover.1729355735.git.neither@nut.email>
 <be4c64f56a4a7f25a2769c0eccd2ed6e1d8cb9ee.1729355735.git.neither@nut.email>
In-Reply-To: <be4c64f56a4a7f25a2769c0eccd2ed6e1d8cb9ee.1729355735.git.neither@nut.email>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2024 13:58:18 +0100
Message-ID: <CAFEAcA8iiYG2kw=tpMiLUsN+ZB-f6aN5eb-aAOhhc7nZyjA0+A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/7] target/arm: call plugin trap callbacks
To: Julian Ganz <neither@nut.email>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LzjnYCcQOTYp

On Sat, 19 Oct 2024 at 17:39, Julian Ganz <neither@nut.email> wrote:
>
> We recently introduced API for registering callbacks for trap related
> events as well as the corresponding hook functions. Due to differences
> between architectures, the latter need to be called from target specific
> code.
>
> This change places hooks for ARM (and Aarch64) targets. We decided to
> treat the (V)IRQ, (VI/VF)NMI, (V)FIQ and VSERR exceptions as interrupts
> since they are, presumably, async in nature.
>
> Signed-off-by: Julian Ganz <neither@nut.email>
> ---
>  target/arm/helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

This omits M-profile Arm CPUs (whose interrupt/exception
handling is rather more complicated, and lives in
m_helper.c.)

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0a731a38e8..f636e216c8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -31,6 +31,7 @@
>  #endif
>  #include "cpregs.h"
>  #include "target/arm/gtimer.h"
> +#include "qemu/plugin.h"
>
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>
> @@ -11147,6 +11148,24 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>      }
>  }
>
> +static void arm_do_plugin_vcpu_interrupt_cb(CPUState *cs)
> +{
> +    switch (cs->exception_index) {
> +    case EXCP_IRQ:
> +    case EXCP_VIRQ:
> +    case EXCP_NMI:
> +    case EXCP_VINMI:
> +    case EXCP_FIQ:
> +    case EXCP_VFIQ:
> +    case EXCP_VFNMI:
> +    case EXCP_VSERR:
> +        qemu_plugin_vcpu_interrupt_cb(cs);
> +        break;
> +    default:
> +        qemu_plugin_vcpu_exception_cb(cs);
> +    }
> +}
> +
>  static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
>  {
>      /*
> @@ -11819,6 +11838,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
>          arm_handle_psci_call(cpu);
>          qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> +        arm_do_plugin_vcpu_interrupt_cb(cs);

This isn't really an interrupt or exception -- it's
more like the semihosting, where the guest does an HVC
or SMC instruction and QEMU handles it by emulating it
as if it were firmware. Maybe it would be better to
name the "semihosting" plugin callbacks something more
generic and include this kind of case in them ?

>          return;
>      }
>
> @@ -11830,6 +11850,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>  #ifdef CONFIG_TCG
>      if (cs->exception_index == EXCP_SEMIHOST) {
>          tcg_handle_semihosting(cs);
> +        qemu_plugin_vcpu_semihosting_cb(cs);
>          return;
>      }
>  #endif
> @@ -11855,6 +11876,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      if (!kvm_enabled()) {
>          cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
>      }
> +
> +    arm_do_plugin_vcpu_interrupt_cb(cs);

thanks
-- PMM
