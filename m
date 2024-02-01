Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp261435ejb;
        Thu, 1 Feb 2024 06:17:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLn6ICmdw/zmNsBvyJ2nRrI0SGEtTSfua7MkTlYL3OZo/Hq0uUavh3GwXGGkoxGLxjYc+O
X-Received: by 2002:a05:6214:5009:b0:68c:68b9:9688 with SMTP id jo9-20020a056214500900b0068c68b99688mr5770616qvb.24.1706797075459;
        Thu, 01 Feb 2024 06:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706797075; cv=none;
        d=google.com; s=arc-20160816;
        b=NYnvfuvN7JMNWHA02cb+r1ZHDNrL8fT+RlMBlDyZZBDN6/xDr9x6h4crsprqrlpcWl
         iyfGQIHVg73sV3fx1VRaX05lautyvDZKZ21XrdviWIxHLkowYk5f5pAZp77HKvxRXs06
         ocicqd48XDIsMpLw/h9MEOjjMMbUEFY+3vefr3c7yHy10mJjEDANZDYED7coTX6Kn/Da
         g0DQJxfBu1FoJeeLCjWu3IN8KKYd3vvPVuQF5D/FRxJmATjHCNy8TgHM1/bxU8ED6Cv4
         dDI1U+wjeZI2i2cfmI64lNU3d7pvxLbrJ7CjkbK6nAI46WhhSImjv6RpBojv7ZD4ZZ77
         6daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kgMqkwOZL0NhaC+GsUct74xqFdiFXpm6R7KZnq5H5pc=;
        fh=eUOttCw7ApatsLWVj/bEcioFBs0aLG1espopQc6KZ8A=;
        b=h7Jk7/aBcbGifqDAQWxNORvCDAuEBHBTEPYZgFtbymcRvjNvko8iXFAq6fZRjuGWRq
         vZ+I7m581mHYm8IU8s+ZJmqO7jcsf2tLC42uMyosOJsDKVIwzhnIrxslVX8cBrW6deFL
         9nR9qgp6vwIUz6ofYsOXBvdybr40fp+2UM+laAfNrTV2mFsZRftpz3RgxvylwtzAsBMe
         Qpv6MG3ZRgKD4OIsCUchjUnEA8SSnVnq/h9AqjoH0peTYGii5oYAnC/P4BmPljTcni1I
         B5zrr/pEX+d9mOVGBf4AqMFxiHwlG5iHUuY/CbFngoWPkSYuByH5qAfBSWWa2MsMuoLA
         ARSw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FK3RG0bW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXSoI+v1pGGO9SeqJ4uydzquRlB+7WhrOTexXKUEFK8QbYVOcekh3/b2uRG0K0HgXIxL8pVQ5HsL+RsWy90dMxIK/ZWx1Dg
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi5-20020a056214248500b0068c61ea9984si5862001qvb.523.2024.02.01.06.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FK3RG0bW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXst-0004bM-0V; Thu, 01 Feb 2024 09:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXsn-0004Zv-Px
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:17:38 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXsl-0000Kp-OA
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:17:37 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so1256144a12.1
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 06:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706797054; x=1707401854; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kgMqkwOZL0NhaC+GsUct74xqFdiFXpm6R7KZnq5H5pc=;
 b=FK3RG0bWpk+Og2ZkLAMFoNPU1XzQ///Vhm8ET0+ihjcxoDf5wIqwjKEbIzw3TmJZlJ
 2FIffihTL8HH5ZEZjeU3C0/Z/cgAqVbKRjd+x2EHdRf/5DdP8Z994LmezgCjbldsmQMW
 cBHal4lVFz2Nyk0ZeAjnx7Bx5WY8Ez2UoTGoQAkEaue0bTkArkr/m2Qr5mJGwstsqW/9
 gqSqt7HSzUUoU5tPmb3A8IQ7L5f62exSIhCscFN2KR2XEHNai3A0t0b5MylrNKQtQYSo
 +0gXGkiKgJmu9067sZAJyYi4FFx4sZ27j+InugJuemi74Ld8AqSreeVnUb18VjoMpWH8
 UXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706797054; x=1707401854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kgMqkwOZL0NhaC+GsUct74xqFdiFXpm6R7KZnq5H5pc=;
 b=drivi5D7dpyX5Mi2yfcdYMXuihcOI1M+Wm2N39OgPk64tkDM9m27cganxaO3Rct30m
 WgIS9mMN/hDZUUzxOIMjMN348MEo54ibmCGAGJ85t2QHJi/Y1W+eEWd9s5InES1kaJi5
 JReRzhdKOONkHCv2yMShzqfDE0qjnaNE80f86m/ViOHFqHBcTspcy/JVZlnfg5eDjMfl
 IeNK/X3VvF6BoU5Q4IRzdP/g7HN50QTWesYz0aGEh2zwJH/W+YPKwUUL1lFwXUIrGH+t
 ekZxZUSs12ui+wB9HzrOI5gA/lo8rT9ji/6A6eZUcMR7WXHXj9Y4IDGGjnPyDss7OBm+
 LPdA==
X-Gm-Message-State: AOJu0Yyoya2gTmh/9bpQviEtaU/VKr3qLZBU8axoIC6HqSjWjRYbBVwq
 DkibCArMYIxxs3JGQ2IWneB+NHoKdWkSRk1uUyoNiwA62q1Wf5W86BV4ATgiScpD8hH8slqCqTj
 7XxtleuO7m0CZ6QxjMhUXiPMjDXoP2rq72AgNGQ==
X-Received: by 2002:aa7:d5c6:0:b0:55e:dcdf:50b0 with SMTP id
 d6-20020aa7d5c6000000b0055edcdf50b0mr3248600eds.15.1706797053934; Thu, 01 Feb
 2024 06:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-2-thuth@redhat.com>
In-Reply-To: <20240129081835.137726-2-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 14:17:22 +0000
Message-ID: <CAFEAcA_mf-iGD_P3DB=dw4n=qpFyNODtAz1jFKUdjFkM1eWVuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/arm: Move v7m-related code from cpu32.c
 into a separate file
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: KWOWFaQ96qKz

On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
>
> Move the code to a separate file so that we do not have to compile
> it anymore if CONFIG_ARM_V7M is not set.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/arm/tcg/cpu-v7m.c   | 290 +++++++++++++++++++++++++++++++++++++
>  target/arm/tcg/cpu32.c     | 261 ---------------------------------
>  target/arm/meson.build     |   3 +
>  target/arm/tcg/meson.build |   3 +
>  4 files changed, 296 insertions(+), 261 deletions(-)
>  create mode 100644 target/arm/tcg/cpu-v7m.c
>
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> new file mode 100644
> index 0000000000..89a25444a2
> --- /dev/null
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -0,0 +1,290 @@
> +/*
> + * QEMU ARMv7-M TCG-only CPUs.
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "internals.h"
> +
> +#if !defined(CONFIG_USER_ONLY)
> +
> +#include "hw/intc/armv7m_nvic.h"
> +
> +static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cs);
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    bool ret = false;
> +
> +    /*
> +     * ARMv7-M interrupt masking works differently than -A or -R.
> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
> +     * masking FIQ and IRQ interrupts, an exception is taken only
> +     * if it is higher priority than the current execution priority
> +     * (which depends on state like BASEPRI, FAULTMASK and the
> +     * currently active exception).
> +     */
> +    if (interrupt_request & CPU_INTERRUPT_HARD
> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
> +        cs->exception_index = EXCP_IRQ;
> +        cc->tcg_ops->do_interrupt(cs);
> +        ret = true;
> +    }
> +    return ret;
> +}
> +
> +#endif /* !CONFIG_USER_ONLY */

I wonder if this function could go in target/arm/tcg/m_helper.c:
it looks a bit odd in this file, which is mostly initfns for
specific CPU types. But it was in cpu32.c so I'm happy that
we just move it to cpu-v7m.c for now.

> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 46b5a21eb3..2e10464dbb 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -26,6 +26,8 @@ arm_system_ss.add(files(
>    'ptw.c',
>  ))
>
> +arm_user_ss = ss.source_set()
> +
>  subdir('hvf')
>
>  if 'CONFIG_TCG' in config_all_accel
> @@ -36,3 +38,4 @@ endif
>
>  target_arch += {'arm': arm_ss}
>  target_system_arch += {'arm': arm_system_ss}
> +target_user_arch += {'arm': arm_user_ss}
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 6fca38f2cc..3b1a9f0fc5 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -55,3 +55,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>  arm_system_ss.add(files(
>    'psci.c',
>  ))
> +
> +arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
> +arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))

Why do we need to add this new arm_user_ss() sourceset,
when we didn't need it for the A/R profile CPUs?
What goes wrong if we add it to arm_ss() the way we do cpu32.c?

-- PMM
