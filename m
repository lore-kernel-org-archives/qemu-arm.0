Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D584FC5926
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 10:30:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvYcm-0004L7-Ak; Thu, 26 Feb 2026 05:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYck-0004Jn-Ms
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:29:38 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYcj-0005Yr-4Y
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:29:38 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso539267d50.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 02:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772101776; cv=none;
 d=google.com; s=arc-20240605;
 b=QbYkooaYod7Y4TgXsNd7r5XA9/YxlNBQQ7RBpPsU69LBSraEtvJKDKi9RVJCnTCPOL
 uzZI3EhHXj7LiZeUvXhkCo2buLUsbGXuZO0Hc/07gAwcEZfLV4/1PR+dD2wXAEPIzZ4J
 A+zl6Nu5JgzUmWrqSueRqnqPzrepW42jrm9PALNutIPX6HbAHgLHqgE0Wnra5itHcKMT
 iG3JLMXt7Zu4fvvEXw+dmywZHJtXmaa+zUhbuj//JBjkO0zVygMPw50a5l3HManPO8d9
 T3gQVkCGs08i1Muh7Dapi4EkXSUNnoxYZUhwv74CqqG+BXjyIj1u4FvQPF/UUeQmaZj0
 kbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ah9ojG0q3uo3b9b+2P9a9B8y88QGjOnwpMnd7A74Iz8=;
 fh=ba+vcpJWHIPwraG96THxj1a6HzO5CdadslVak6WHjCo=;
 b=HlWzTtlqDeAxtiBamSU+GNbsCCHwtS6hWTJOE0lc8jkEppWAfCObBFMZHfGXyzkJMR
 gdxzic7SHQUe5bDUFPdpz07UnROki+HirIQ8ef6eJRzciMCcUHqBVn89IkW6+a3y59zC
 THEEY/pyRXw4aBSA3Ib29+YKTvPOAoi5DcIqAOIryxvebquVcd7OBDFg2/5nH3CSCcNl
 /hgS17SqjkQ2bwCUApWgZrQJVaBhmGOpPTXuT2bNCBSj2h6my0iGbtio/Yj1is5cU4VG
 xPW54V7P5TD6NzLS6fEKBl4nMpBN++vVR/e1I/r6m3/N3OqjZpcarfyjpEyPa12NxWMp
 jiRw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772101776; x=1772706576; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah9ojG0q3uo3b9b+2P9a9B8y88QGjOnwpMnd7A74Iz8=;
 b=pjxBn1N8LzKZ378tiMKBYr7cxjN6iRJjz7pk1W2Nam6adGYnmtxVlTARk/1QhetaNv
 ASO6SlhYAN5IfPgh8jBEyW4vhtoTbLrBoBqtd1KBlkxf4qd4lw3a25IFVW52etrF5O0X
 tlCarRVWmfFnxcRfmMc4f2SQmxTpEC46yDQNHDILK8AqyE5ndur/oQAKBUbMJ6MxUGOG
 EdOWXKKS2qwqrkrrQ070KtNQcDNNc9lcUShfSc4zh/J45DzTpaww8tOvQQKLMLNbYUJv
 E3T8m+XT9uS/JeFAczacS7EM7jKBcvAd+2YlDNwBG4jEzyKNLdXvFoWBciiVczk+YkbD
 +nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772101776; x=1772706576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ah9ojG0q3uo3b9b+2P9a9B8y88QGjOnwpMnd7A74Iz8=;
 b=n1/wBBkCKxZuF7+gNNXYq/yl3ZkGLXNGFwVIpPv+aM5Z+KH5yrLKIWsItPtC7tXfuQ
 Z2+3U+TDfPJpyJU7pL339NNIQPJh6EONfViZLHsI6xyBpbQNZNQYWN3CwAXZvCgPbseq
 pELeEuIUF24kz+ldbC0jYXyBkmOfwvXr2ZSQf5WM8kk1hUpBywvbEKiJ7/Fg3pWplLdZ
 XLBUgAkt0RHOpWSg3VqYbjDQtCEiozosvO/fOATCdj/IvHYlD1sen90Ze8aLzS0ENE4t
 It2Gqy5NzMcD4iLybI1TkuVOKMnSlAb5PNsgdK6koIvSB8pBNSLhjcOI9qHOrrFFi7Pf
 /hWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLvY00Cs0u0g/AtTI7ZG6fIzSDA9n+bQ7TE87J3vnJSfbBGx2a96ixsPyZJJklW4Wm3jYFdaGCWw==@nongnu.org
X-Gm-Message-State: AOJu0YyHn1Eo0C4+bmJjSA4NwGIjPT3P4DbV+rlxGnlos179RI2T2vFo
 wV7YVKbCCxGj0ZdiELl3QCyvJTn4U71u4xncVrlrMhitNpXZoHA43ZAZzuU+8fAkkuXiiLEZ5ul
 YxiPhx0424BD6kL6Fku1Y34wIKDY47h2jiT1ejUlJkg==
X-Gm-Gg: ATEYQzznI/R8TdcRC9JFElf/gja5O/Xu4dppPGc4yDxDKCpXhsVBUv55m6Ygbkzabud
 UtVxS9efLpJgw55AgCpoR+mzPGM8t/B4qUJ/7P8uM0Gs+g46PuN8+cgWgHqgicZradwizGG8f/O
 RNE4WpsZk4ODMB2aNGc0BnuZnv2pJupBIAXDAVh0FWpIVdshSpVCB3clHMxQbG5KzRgIni64eJ8
 cmQ+aC1seBilog4gTtUA7c9M2GnDr0+ratm8qhELyWOBGmefzKdUgOFFkWMdJ7cuJ4NGFakUmWB
 /+Er13/aALu97M3L23qTZtysgr9nZQSEiHP6BxIWiiJFkWHXYmUOWhi/rFqPKSSp0Bg=
X-Received: by 2002:a53:ac88:0:b0:64c:b242:496e with SMTP id
 956f58d0204a3-64cb2425731mr2910841d50.17.1772101775643; Thu, 26 Feb 2026
 02:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20260224154347.344219-1-alex.bennee@linaro.org>
 <20260224154347.344219-4-alex.bennee@linaro.org>
In-Reply-To: <20260224154347.344219-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 10:29:24 +0000
X-Gm-Features: AaiRm52sjpMfL2DsXcKotaMr15GNp12jlu3XaMBA5wXiQeZ0_juQvmmrhoogx40
Message-ID: <CAFEAcA8km4H10ZseUd=D6KWTpHQptUaL0D3dSrg3-LGWY1bcgg@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: pass rd directly to wfit helper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Tue, 24 Feb 2026 at 15:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> If we generate an exception for WFIT we could also fill out the rv/rn
> fields of the ISS. To facilitate this pass the register number
> directly and read the timeout value in the helper itself.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/tcg/helper-defs.h   | 2 +-
>  target/arm/tcg/op_helper.c     | 4 +++-
>  target/arm/tcg/translate-a64.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
> index 5a10a9fba3b..a9a062cf777 100644
> --- a/target/arm/tcg/helper-defs.h
> +++ b/target/arm/tcg/helper-defs.h
> @@ -55,7 +55,7 @@ DEF_HELPER_2(exception_pc_alignment, noreturn, env, vad=
dr)
>  DEF_HELPER_1(setend, void, env)
>  DEF_HELPER_2(wfi, void, env, i32)
>  DEF_HELPER_1(wfe, void, env)
> -DEF_HELPER_2(wfit, void, env, i64)
> +DEF_HELPER_FLAGS_2(wfit, TCG_CALL_NO_WG, void, env, i32)

Why the change to NO_WG ? The code change doesn't remove any
writes to globals...

>  DEF_HELPER_1(yield, void, env)
>  DEF_HELPER_1(pre_hvc, void, env)
>  DEF_HELPER_2(pre_smc, void, env, i32)
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index aa14f15eb62..28a1c7243ad 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -409,7 +409,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
>  #endif
>  }
>
> -void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
> +void HELPER(wfit)(CPUARMState *env, uint32_t rd)
>  {
>  #ifdef CONFIG_USER_ONLY
>      /*
> @@ -428,6 +428,8 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
>      int target_el =3D check_wfx_trap(env, false, &excp);
>      /* The WFIT should time out when CNTVCT_EL0 >=3D the specified value=
. */
>      uint64_t cntval =3D gt_get_countervalue(env);
> +    uint64_t timeout =3D env->xregs[rd];
> +
>      /*
>       * We want the value that we would get if we read CNTVCT_EL0 from
>       * the current exception level, so the direct_access offset, not
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a6=
4.c
> index 5d261a5e32b..073454b9195 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -2064,7 +2064,7 @@ static bool trans_WFIT(DisasContext *s, arg_WFIT *a=
)
>      }
>
>      gen_a64_update_pc(s, 4);
> -    gen_helper_wfit(tcg_env, cpu_reg(s, a->rd));
> +    gen_helper_wfit(tcg_env, tcg_constant_i32(a->rd));
>      /* Go back to the main loop to check for interrupts */
>      s->base.is_jmp =3D DISAS_EXIT;
>      return true;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

You might squash this in to patch 4 if you like.

thanks
-- PMM

