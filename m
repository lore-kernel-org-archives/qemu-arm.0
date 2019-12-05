Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2384442lff;
        Thu, 5 Dec 2019 09:43:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqw73SX4INnaSSaCPgLbLqesNx2W5E/2ggolNkyBd07FeRs9LmW1U/eC2MfvT5FBPuclQvFn
X-Received: by 2002:a9d:1425:: with SMTP id h34mr7558793oth.166.1575567780263;
        Thu, 05 Dec 2019 09:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575567780; cv=none;
        d=google.com; s=arc-20160816;
        b=oXZZSlpSAdDbZiAPaU5iFGZOjdvgVIWwb3mlEzMxLHIsUZYpKmjECy8RBpe/0CaVLY
         UChYNAGiaCf+rPh1N9OK14NYLbaxIlB0zyE8S3bcn6m1jJBeFCXXZijGGrvQNtzsyvC6
         K2gZbhIs3zXaJvWxIa3+9FQnQEjgkeBrUwIRYBKeir6VCckWXUOU7M3ZJWMPFwTahpjd
         DrM8Jh5SWmjmmzPS3c4x4pAssElUumQdzZI4icM0sHXWZwa24uMGNupgcljb2DotZlfN
         +UZPt8yu9eZQ0tDL5yKtwSi5wqJ1pdg/PPq0Ou1pHPASZRkqH/rK7GsZA9PxIYCwMAIS
         HvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iNUL6o24JTKX4/e7ryKKlUun/EEBdrrjt6MWlFZHtt0=;
        b=ykJcDokdahTM8r5zoF52MvdbYZfWwTBCPA7aCznpKEqxcnLNypgV85fn9rJ/eksr0n
         Yr+lkBSp/v3l1tNvIaCAeRr/HPIB3sJWu3FDZCl+DfCmWKxLRaX6CesC6meCHtftjxuJ
         73ck2C1rxre6GH1znHa1G6rNgG+hOOqF7UR3myR9yVlTX/+nysxICcfaJbO2xZa5VDzh
         atZSRkfNGcExey0ml8EcukiZlD5RokwDeYGg61vCdgbM3dyYrJSvJMopUfPc6/eiuE2p
         y76Ye2vtrZgpxi4nKLxgstKqNESK0VPD2gLd4B1xCBZLjrkL6Bc3PEsBAfQGpR5Fg4bw
         Hs8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dh0rYjcg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v202si4109113oie.79.2019.12.05.09.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 09:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dh0rYjcg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58629 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icv9X-0005Ys-EV
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 12:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icv9K-0005VK-EE
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:42:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icv9J-0001hm-2c
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:42:46 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icv9I-0001d7-RL
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:42:44 -0500
Received: by mail-ot1-x342.google.com with SMTP id a15so3374326otf.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iNUL6o24JTKX4/e7ryKKlUun/EEBdrrjt6MWlFZHtt0=;
 b=dh0rYjcgJ3RUdG6Gi37DLPiYYqEgTj835qJegCy0kyY+lDtuZ6AKZ/RlvoBGc6KWUW
 eBHRoQ8REevtPRuvV8kANU8dLniuLz7/IAw1gpX/vBEGKoEf+kXVzpe5pbXy6MABH43U
 74s1C5XjKl0rVVXtaDYOiHeLHPmbLFZ9BU9BTlgTzgGs/0ZeLZF9VdA3JuHWdMayVLnw
 X3oDG5Ipcffb9bsqxmEZ0MYyd5k+p+LKRFEXcImh9Y5yAtGfjym8CCqLMrM4RlS1YC+G
 YRn0RanjRCXuwSKKdUS4UgHXTqF8Zmhe9ydXg7pAe9rhXXQZ4DDYvxrFsh9RmYtm8L1j
 /39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iNUL6o24JTKX4/e7ryKKlUun/EEBdrrjt6MWlFZHtt0=;
 b=dXXQOl3Lvt3PNkXyYEVNpD405+Xi91XOUD6qG3pCzPtSFtzVknBEmYFKrtXaMgzCY6
 RFKnKDMxzqjMM5KRcikCEqQwdlEt3+e9iVnQHsV6fU3icF2pMWqEvufkKz393La2alAh
 pA8ePxQKUhVOpcsvdfMmaK+AI/b/88dSlgNO6OhpYpxUCqKrqxhhE/uG//OBAMTI+eFN
 +eVtUXGXvQLHKd4tFwkh0ds1d+tfaoPgk00IsrMhWiO1JlL1nE0uF/LR+MWJ0BmP8dR7
 yhwfkWey7iCIuH2XPxv/V8/FRn4NkGx9boFG756oMZbJ8XrDuaKoU8379RBAfYbiCAKb
 8qOg==
X-Gm-Message-State: APjAAAVCfDjQa8Wl3SRmGteSo3sfARANn3MyVdDjqCwrmhOInPjKze5V
 8JsfCkk+MC56Whl1ZgzWgehTx+htMc3GMyXWwbXdhsBnz8c=
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr7043345otp.97.1575567763730; 
 Thu, 05 Dec 2019 09:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-14-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 17:42:32 +0000
Message-ID: <CAFEAcA93YL0mkN+uMpOD12U1S6uoPNqpkPZ+EmDabNAQC+m-Sg@mail.gmail.com>
Subject: Re: [PATCH v5 13/22] target/arm: Implement the LDGM and STGM
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X62BKZLdjvCx

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Require pre-cleaned addresses.
> ---
>  target/arm/helper-a64.h    |  3 ++
>  target/arm/mte_helper.c    | 96 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c | 42 +++++++++++++----
>  3 files changed, 132 insertions(+), 9 deletions(-)
>

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 4ecb0a2fb7..4e049bb4aa 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3592,7 +3592,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
>      uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
>      int op2 = extract32(insn, 10, 3);
>      int op1 = extract32(insn, 22, 2);
> -    bool is_load = false, is_pair = false, is_zero = false;
> +    bool is_load = false, is_pair = false, is_zero = false, is_mult = false;
>      int index = 0;
>      TCGv_i64 dirty_addr, clean_addr, tcg_rt;
>
> @@ -3602,13 +3602,18 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
>      }
>

These are the insns that should UNDEF if we have only
the insn_reg dummy flavour of MTE.

(Also, unlike STG and ST2G, none of the M insns want
Xt to be <Xt|SP>.)


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
