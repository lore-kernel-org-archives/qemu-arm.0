Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5890BC79F99
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 16:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3yOd-0007NQ-Ip; Tue, 08 Sep 2026 12:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3yOc-0007Mk-Ky
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 12:10:06 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3yOa-0003Ge-UJ
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 12:10:06 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-861feb6d61bso43434167b3.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 09:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883803; cv=none;
 d=google.com; s=arc-20260327;
 b=YG8Gt9A+Ii0jnvAQSZ+WKaEk1vuFsCB2oMLTpyAHjhLEmICAp6MOT0Vjuloqmi2n9G
 wr1PyBGoljSThholkmnnqPIpjX5FDMoUHUNIdca3IybOew/qFCjKdewvDOWEM7p9tQ3n
 +QZWyxFHNPFcbzGoiNM0nV7glPhf8TO+BokEEw5CIweH169g3SFlbKCRsyi+ZW5vL6vg
 GKUfZ21HkC4ed19KPGroRow35OFAeU/7yzCvmTAukh4niV2sA9ZpjC4UjHG+l7gsWcle
 Uq4zp84YTj5IWP99zmOkVRNxjsKXFROnVXxRCI4xUf102wvTGGk7/b9/r6xF4kYaoV3h
 NVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vAEuw08maigOcy72eNyfJe9xbcSK+2Att5GuaQphA+c=;
 fh=+6fRtXDoyWzdTzHDItw41ultk4h20JFm5AMuCKcZfB8=;
 b=PvwZH7k6poifL32r9oLvc6nBzOXJq1SKqIeei8tpESeS7R1DMSgPaluwyyrpKhzkuq
 wv5yCb6J4+WLi+b5Yel+41qv1cd2JyBeSYDs8SZ9VYS+mTwPg20atV4Qcw3y2+znnKVk
 t5dJgIgLxorN6oMQVChIDPGY3VMNmVRIOBH3Js33Iv3/TRsi7DG2+nbyvv4ZxHBwKa3G
 1UFYr8NjHL7m+lNVpN1V09bJNMZaMiS3wdMmVj7mdoAY5fxDdQ16MhjxOumH4h9NqyyQ
 hqV8xhclB4yWRWf3a4VpUMybVqgp+ypk7IKDFF8OKmEsMT7uoNmy4S4QJVvLdNjoFM77
 QzwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788883803; x=1789488603; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vAEuw08maigOcy72eNyfJe9xbcSK+2Att5GuaQphA+c=;
 b=T7/zERxy5oBE4iE8xlUpY3qx8zWek/4l1rk3/x8zO/qcpbNJik0Bk/wLqzxNZ6J5Fm
 vCD8E9tCg5o8UhTixHpLkfxFgFtBLqYi6kso4hcBtMzDcWBtUO7i0iVq8PS9zyUGTDaM
 QAwfbnFX2Y6rJrECTlRMwxgw/h2qb7Po7NkwBLByygyiPlPdRWOVxkhbm7rxljZbhSqm
 sRXryUh6WIaymb0hXhWRIhMpUK/fajzIhoeZAVrnIj9SoU3/UDT36391VRm2oY69QV5s
 +/1JdfcpCX+HPPQ9xSBG6acb8v6KYycOoXZrp59dGMt7P5U8TF1zjL8NgXlYz4Ulp4xs
 zbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788883803; x=1789488603;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vAEuw08maigOcy72eNyfJe9xbcSK+2Att5GuaQphA+c=;
 b=QXbsWsdKtR+WI7xXr9I3unlZfPofz4Uay6YrDw18SGdshf8oH7370rPnImmgE0dmmV
 lN643YlhIwv2hwcAfYWcvvoevS4dOi/r/c0N+TSDTH6BBVYoYP8T720Jjd4MZBhBmMbW
 ucFipOUU8fDqCXs51PRcDBOeB80B8u2ipdE4kZ16SV9MFT8sgK7FJO075vs9NmlRW5RN
 jE4hBIOuDEkvIUEkTwLsi8mzbO5gBTc68rmtNkf8q5iehJXRn9ZQZNavXk5+itR+g/8n
 bSd58HFTA+85O3DFUjzbBJYSw2rWYVbm6pQat/xtu6Fjx/3f1JMs2yA6JoQuJpwFgrkU
 bNDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYWzlaF+wxNt2xp+RpgkHlyJUrgThRAfKdBZaPiOFnMugXlbNSJOIRblw7CDliDBgOBfUwyu+HRw==@nongnu.org
X-Gm-Message-State: AFuF++n9jWWcl5ePmo0NJ//RdCogp1I6SQUO9U2Zb1VMelRDvNEoZ6AQ
 1DsIU6prhdy2B/tHBtfmhNcMOMeIQZxik1q5kiVzS9vPZPXOJEdgrfj8yEmfoszMts4/MNYuqq6
 nIFfTM96BOFWMHV24DMOaKOp6Hyij2tQyaTINHCxR+w==
X-Gm-Gg: AYBFou2Mn6EPBvjYEcmZnkhxPu7Cp8p64lSWl5RNgdXd9ImQltznbvckeAZ871MaEiV
 x9Y7EaWOGa9ZAmPyEwNMSp1bxlkdO37G9pTsBf/XB/Ef4JzcrhuqDb+1PqChKBXUAIx8XTk/oLW
 BVaTPKmuXKMwr+3kp2E0EMkPFfOQECZpPjRF3hVeJ1eONeLGsLu3Ru309+d6caAII3k92RdlM/e
 o37YLSSqAQSv2E5YsufZVFGKDGI2/xepNTrfkkn6IT8BvMYIMT15YohWZh46eBjenGSvYgpaOXb
 Tjp9GHAQqBi2P5eyP1iRZhH35q6e93Gt+fty8kZaU+JFn9kJbXaBPY6QPwjFouymV6wiXLXO1kp
 JWVMMgOsAjBGuwKpYGihXRRRCHyWc
X-Received: by 2002:a05:690c:e1d8:20b0:87d:b776:c659 with SMTP id
 00721157ae682-87db776c69cmr15832277b3.11.1788883803340; Tue, 08 Sep 2026
 09:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-2-philmd@oss.qualcomm.com>
In-Reply-To: <20260902152044.31291-2-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 17:09:51 +0100
X-Gm-Features: AcwNN1XCnvRaYc8V1KAeF9JjDhyphbZh4b-jEOM8h43oC1OOMB17y_un4hbb4bU
Message-ID: <CAFEAcA-w24c71SHh1Sr7JkO5RTVK7THH8GP_ixVvnWiBXWQMdg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] target/arm: Call arm*_cpu_do_interrupt directly
 instead of via TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 2 Sept 2026 at 16:20, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> The TCGCPUOps.do_interrupt handler is a target-specific
> callback installed for use by target-agnostic TCG core methods.
> Target-specific code should not dispatch through this indirection;
> call the ARM implementation directly instead.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/arm/cpu-irq.c     | 2 +-
>  target/arm/tcg/cpu-v7m.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu-irq.c b/target/arm/cpu-irq.c
> index 883e8a176c3..e8a6520e5ca 100644
> --- a/target/arm/cpu-irq.c
> +++ b/target/arm/cpu-irq.c
> @@ -270,7 +270,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request)
>   found:
>      cs->exception_index =3D excp_idx;
>      env->exception.target_el =3D target_el;
> -    cs->cc->tcg_ops->do_interrupt(cs);
> +    arm_cpu_do_interrupt(cs);
>      return true;
>  }
>  #endif /* CONFIG_TCG */
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> index 48b31d5eac8..502998dbd1c 100644
> --- a/target/arm/tcg/cpu-v7m.c
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -34,7 +34,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, in=
t interrupt_request)
>      if (interrupt_request & CPU_INTERRUPT_HARD
>          && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
>          cs->exception_index =3D EXCP_IRQ;
> -        cs->cc->tcg_ops->do_interrupt(cs);
> +        arm_v7m_cpu_do_interrupt(cs);
>          ret =3D true;
>      }

This works because we have separate cpu_exec_interrupt
methods for M-profile and A/R-profile, so we can drop the
indirection. If we had anywhere where we were trying to
do "call the appropriate do_interrupt function" from
code that's agnostic to M vs A/R this wouldn't work, but
happily we don't.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

