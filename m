Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159A4CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:58:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1mTK-0006q5-RM; Thu, 25 Sep 2025 09:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mTH-0006pZ-Mm
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:57:20 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mRG-0002U6-DT
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:57:18 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-635283199a9so411215d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758808495; x=1759413295; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JPitgufYREd3sp3mlhfbyYLeiVT2Xjtf4HSuOODcATs=;
 b=fwxA8xFCIKDLSZjRgzA0FTyRd/+ls6TjyQysA4XWE8++T4zSNyDWAvhElgc01qfzVe
 /u9Fn+I5QgNxCazVxCkSAuvJfaf0odpocujLb0z7HIbtQAP12TZtnfx+NoCm90fr0esp
 19tp5Gl+bKTVKWro5yzp8tIpLJ+mK2E7kFWy8TZcEHrvJbqIDkTDpDG22LBUyIF+zE6b
 OxfPSI2mSdo9Btuo5sNpkla56ejTWXrfnuoWBdvhBVy1beQu9ZxxV+61pcA/AK5nsHLC
 jMyXd3xhqBOBv17iOw/9aH9Mj7BKk3mQ3KufSVHsP8uNSJHpfK+jsLJkWUwmiuCO/a9O
 GYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808495; x=1759413295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JPitgufYREd3sp3mlhfbyYLeiVT2Xjtf4HSuOODcATs=;
 b=NbIFCbZMjmwjf72fTPeUXMvK2vOOP3VaToBkgEvIIc1rPayXhRZVg+5MXoKchPwmgJ
 KpIF1y9U78twT5Wl15fCqei96iKtrk9x3QfIRtMG1ry3M/MmjAFNKjQrWG57y2z+WRcz
 xPqB/E1CQ0zdNSuB4TgmkIX+o5RR6/96IjEP9s3I5PVWY1jS4LnE66qGL7j9fS45lMmW
 MbY4xHm4bi2rXM1GGzDfqSor7KOqARwPkm6S+g6XP5HlNsBz8J0Mq0Rz2lai7vQigzzz
 s84e5mlElORKM/lUyUSX/SwHGfZU/LSZ0P5hI29DkEY65amSuqwSfrvUW07sKpPLihxP
 F1Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3t66swa6NFbF8GGqSB74Jpv8O9KLZJe3Jqv5SPOPSqGMxZKdONZBhQfViu8Yia04v3NrGfN1w0g==@nongnu.org
X-Gm-Message-State: AOJu0YwZB8MKqNx9Jn3TlGPeUsIHNRhfiyTI+OJh2Qf0kuWk3C/LrcMT
 85G5eKyNM0VIrxPFvguCDyrER5NB29edLYNbvi/UqLjwohM7liyfXk9+de3+tdBq7c+z+rdl7O9
 1rLrXFPoOwIn7wYmMWOIcQnfEiVNt1m6pkxiP4qipjw==
X-Gm-Gg: ASbGncsFE1DwrT408WcmskJxYHZWHib5qwy3r1UCni1l6TPZHN3gPM/9HSSbbg7odYS
 CTDz9tSPe/gu5ftXrHxtaheutfBDRBwDRQzZcgavUXQByiL6lmmcTHk8yzCITlgxw9v35ajKDOR
 OpmrQenOlmIsR6ngGC7bm10CMlgkd3Yg0PYmFKW87sAlRhIM+cmVK6C3kjKvhhN563Xi1iuq/9d
 7A10mpM
X-Google-Smtp-Source: AGHT+IFTb363n43DEqxuOrhV8YksX0YbT8p43C8aSe4ylxrhCHWsmow/i8lSaDalbeXKqK0XDpC4lzmxCHoy9pX2/Yo=
X-Received: by 2002:a05:6902:228b:b0:ea5:cfb1:f9ff with SMTP id
 3f1490d57ef6-eb37fcc7da5mr3370547276.51.1758808494032; Thu, 25 Sep 2025
 06:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-34-richard.henderson@linaro.org>
In-Reply-To: <20250916142238.664316-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 14:54:42 +0100
X-Gm-Features: AS18NWDI-ENLYKBFywdYleJgkRWNYuEXR_-5gqNBdWE-TzWeMoulJ02nML9WNrI
Message-ID: <CAFEAcA8iTS6gpHwchagCFTOwjU=KKOJrmp+d7m4oMR2_xRfvkQ@mail.gmail.com>
Subject: Re: [PATCH v2 33/36] target/arm: Redirect VHE FOO_EL1 -> FOO_EL2
 during translation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Tue, 16 Sept 2025 at 15:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h            |  6 ++++
>  target/arm/gdbstub.c           |  5 ++++
>  target/arm/helper.c            | 53 +---------------------------------
>  target/arm/tcg/translate-a64.c |  9 ++++++
>  4 files changed, 21 insertions(+), 52 deletions(-)

> -/* Test if system register redirection is to occur in the current state.  */
> -static bool redirect_for_e2h(CPUARMState *env)
> -{
> -    return arm_current_el(env) == 2 && (arm_hcr_el2_eff(env) & HCR_E2H);
> -}

> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index c0fa2137b6..3ef24fb0c3 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -2573,6 +2573,15 @@ static void handle_sys(DisasContext *s, bool isread,
>          }
>      }
>
> +    if (ri->vhe_redir_to_el2 && s->current_el == 2 && s->e2h) {
> +        /*
> +         * This one of the FOO_EL1 registers which redirect to FOO_EL2
> +         * from EL2 when HCR_EL2.E2H is set.
> +         */
> +        key = ri->vhe_redir_to_el2;
> +        ri = redirect_cpreg(s, key, isread);
> +    }

I was looking through the details for this one, and noticed that
R_PHHPL says the redirects from FOO_EL12 to FOO_EL1 apply
when "the PE is executing at EL2 or EL3", so I think our
check on "EL == 2" isn't actually correct. But as you can
see in the old redirect_for_e2h() code this has always been
wrong, so as this is a refactoring and shouldn't be introducing
behaviour changes:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

