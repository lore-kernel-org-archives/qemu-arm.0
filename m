Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580EECD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:31:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4QM-0005wt-2a; Thu, 21 May 2026 10:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Q6-0005op-UV
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:30:47 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Q4-0004Vz-LD
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:30:42 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-65c09c1d000so5999871d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373839; cv=none;
 d=google.com; s=arc-20240605;
 b=Jx2inlLVlzxSfvbcUk4HewYbhqHVYx6XYnmT2IpnC3oYWkH55gPVYf/k2MW/2YIOzS
 SSFDHDX/rm1/+xcradf/ESRNiqWWEmn2y9j3BHQOzffHEaK46sYpMyUczeamJrCAbB0f
 SnGiF1dU7egiaTT3KgWlxVO0nZ9YXQoufTBP3SaYeAPNTBE/sKeYqFs+PfYvIxlWJsyq
 fK0vhIpFV8LmSbIPnaxtzPDG83bFB8AxJj3B6sEgyBuvX1Y/5BRVg4yWNr6er9DkrmLY
 tNLknuIMQpMAHE9Q0wQl+nfEu8jEO2hLVXCrmvjJC/Gye1Srz7x31jz/MnydNMMIXSqn
 Ontw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UHpUOakHGKrsWPtgderSr4NdJ/Vfh5OEciLKlTzW640=;
 fh=A+chpPg16FHy6nN4Fjtw8xknuKuuR0LYubcucEnspeA=;
 b=ELQp9uEOgFnCbmsvksHrYQO3l85YxcpcaWTI/hjrGHeW9Sj0OrugKWFYHNp+58VPix
 hIehNo6olPIHe36KuVhtAmNRAbMVvVZoTbyMNHrc73zfUvB9HyFwLLzbtMF7uO5sU5tO
 fLILFUipILX6s1DMikGoS3zEqExvaJ1dCU43kM56321pfMdZvJp3JZ9aZHOc3haZ97ju
 mtBDFIIpXAvjOcB79dXxbsSNdTqRStLsyIgu72LKjawECaSlyeUDb/zaLN4KzSW59XFx
 ADjhWTWWT+SmzTl54uE0qyPxrrW8D0kZbtFcn/iW4auBrLZUOySlTzrsaLFPx+joKVCk
 dDZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779373839; x=1779978639; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UHpUOakHGKrsWPtgderSr4NdJ/Vfh5OEciLKlTzW640=;
 b=jVLTuDTNbJ8qfcpEjYLF95LBrnN4Sr//Rfi9CyxnNXbvYywABp7N4LbiNM9LM+oJt8
 r9y3+VSqgrwaqmX2wxaIvQAfVQxpKZZ95K6EpcDGEgpjXyGxX1Gm4248yMhvq7SyIO3X
 esgLWP8HZc3XStgygMiF4BkkJrqCyhbsTgs82XtRkWrQW82pTUt3/9KIJu7imnxbduFF
 NALNfQDr96IRXPF9ajTSnHJ+Un+/DVOPfwIO8W+JvQGx6X4arGqYyPL7BNk2/A0F/9yS
 yUCgIUUeMpCgPyuB7GZyXvfDf9wEJv90wehgqjS4VOr34fqDTULuAetQVS9yWW/UrGJQ
 SlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779373839; x=1779978639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHpUOakHGKrsWPtgderSr4NdJ/Vfh5OEciLKlTzW640=;
 b=mHwepHbGIiKw4dU+4Us9YLAUx2rfgRO7cIOr6QHl/rZ9o4QX8rl1Xhzfu79S1Gelqx
 VQvhBxvZpR+2/F9prttuJRg/9X6GDT0kfSa5NIgSwhZexIizf3sU+jZG0iVolhn7sE6Q
 PkhdTHEsOqRaOtsrgiiuo840fj1WcjHv+KSQAbjGH1BiXgLoAB4hcVZlQRq2o4zvHiDO
 fNFeyyGbZ+Us2fcxC18KZPaeRZEf1lpTq+64ZI0aZZS2Dse1vQhSyoF399K0XgNwFB0o
 MrRdZewCGT9wnuXt3PIX03rG2H9ebS5OolzYeUCogBjPivioqKySZO2hqzMbKjoIvwII
 FjWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Bg3YJvVt9W06PsWEGdJss9CbRn+4A2fEaSd97Pfl4QT3OQbIJh7Po1xQ41Iv+E3onMCxJzzagow==@nongnu.org
X-Gm-Message-State: AOJu0YweNF/LWBn/irL6LUN5kuOo0ZEN4KgLT2ag9PWq3d+4bMy522iR
 qZuwyt0PQW6QWybvmyVr391SZT33ewGaBl7rYuHmIUZlWhDF7zU0D4naUiwIbrI6Y3zjkxWwXs8
 MPpZWj+tiQnNsnhJW6zk+SJ7wf0w4iH56ud9r989Exw==
X-Gm-Gg: Acq92OEZmbw1Tl6fTFZCYddkQhgZV0gvUeINC4XWNvHOj/ZKEruaG2GGfoAXt3bmQb9
 PJ1xQXsssVZ7EO6tHW2mfYBHxh28eHHKdpUQx9ZTte5WZzPbIjaV2UIdG7OUer3sFfC6iqQMDuH
 FXhkY1K7F9OM+Nqt56QQGPe8dJWM+hKI3cJ3DxlCKgfyzrlP9KAailAGkXxaeMiBBlT1305WyLN
 nHEJrgznNoeuy+nalcHbggYZg3btmZwCbSr7+Yu/acwwr5Vkip+qFsdcJ1djlX7xmPoXlJH+qOb
 kSi0WU2dosjvpktPtjZgXY619TA6B4V8M5EUiBgEHOaPdkONBdFW0R+cajCmhSlP+VM=
X-Received: by 2002:a05:690e:4807:b0:654:4441:75f3 with SMTP id
 956f58d0204a3-65eaccc6705mr1674533d50.1.1779373838727; Thu, 21 May 2026
 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-14-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:30:19 +0100
X-Gm-Features: AVHnY4IvWJpLgfVxCjZBTaLmEihop1ZDoBfKFzfEHhP42AUb9RL9git1HFMdvAA
Message-ID: <CAFEAcA89SVyb1pkUF4N_m1fwt_6UXzKxoM8XX6s6y6cBsMe18A@mail.gmail.com>
Subject: Re: [PATCH v6 13/64] target/arm: Trap direct acceses to FPMR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Wed, 20 May 2026 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index b013dd51cb..d2a4b0fadc 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -2899,6 +2899,10 @@ static void handle_sys(DisasContext *s, bool isread,
>      }
>
>      if (!skip_fp_access_checks) {
> +        if ((ri->type & ARM_CP_FPMR) && s->fpmr_el != 0) {
> +            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, s->fpmr_el);
> +            return;
> +        }
>          if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
>              return;
>          } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {

It took me a little while to work out how we do the traps on
CPACR_EL1.FPEN etc, but we mark the register as both ARM_CP_FPMR
and ARM_CP_FPU, and the latter handles the fp access trap part.
Hopefully nobody in future "simplifies" this if() into the
if...else if...else if ladder of ARM_CP_FPU/SVE/SME type checks :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

