Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp342543ejb;
        Mon, 13 Feb 2023 08:23:38 -0800 (PST)
X-Received: by 2002:a17:90b:3b48:b0:233:f7a5:9941 with SMTP id ot8-20020a17090b3b4800b00233f7a59941mr4402415pjb.27.1676305417970;
        Mon, 13 Feb 2023 08:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676305417; cv=none;
        d=google.com; s=arc-20160816;
        b=ySlPg9r/6sf+2vVaAsNEFoG+QD1HHIO740xtmPd6agz2Hk0Nu+LOEfT234nWWb0Y2R
         2LOGpFW/91jEW4nUYAdBX7BVQuZJQRov1WreWMTg21K6caf4HByKvPcpi5e9WzYb8tHt
         gtUTbaJIc/ZxCK4fAn6WriLm/9J3NB6dQq/1dZgwtFe9DJdnFUMtauY6LjfBdtTKip9w
         kB5yBLsVAWyXunllgTP3Xfn/cQ2Fqk4KGgkiRhzLRiT8T+3+92l/nGHdCk6yMe141pNs
         aA28+jYnbw+YY1iCb1GUJbRF7YM+Fv+QNIN+RA8ebJatWpviOGmhTrNCsAkv9tnCARYC
         KUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6l2/UFdvX+slMeMMiN5z/2mBC0bdhmSyJAGs5dm5osw=;
        b=IMFI4zGVGh7Wq9u3sqCOQ32ojFDLelQ7gK27i+pkkhbgVJZb7Xn6bnoBFtq6servQd
         wFFTeIZdGPnYsSQpba0MDaZMJkB6IQDB6vcegH+TWV/Q/08oTX/lnK9ylCkOl45rqUmx
         tvj5sCF/6b8g+XQgixRS1EdRCxXleFOZAuSHXz9rvJPO8DAw/+3+k7s+AMl+wQt4Yz/5
         xMEmI7vokg6fDrRiGh95Uzy+IHj4QAR6bwb0mccht8CsaDMiO/HDXiMGcn0FOSOVtFGC
         WId0/t6mhKVNnPPWUOiKQtuS20kbZf1h/Wh5cOIVS0wf2QjvsZLyqc/n9ATMi3Dka0/s
         POyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQYcdRr3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3-20020a17090a2dc300b00231286c6f31sor2430910pjm.12.2023.02.13.08.23.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQYcdRr3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6l2/UFdvX+slMeMMiN5z/2mBC0bdhmSyJAGs5dm5osw=;
        b=GQYcdRr3A2Da/rQearnq6vJ+QfKuOUzimbLJSC/PH4ZpehYEu1RaqLT5Pl0xMDwWEG
         WaYoSs8mHZCcs6vNgd4ucMFNvcu+V+Fchag3c17VG13g0ZxOaDrtgPxvGR1CQWsEj3kU
         bKtl92FAXAtXqrDj/FFXqb7FBWFS+DI0YvCu082gJnmVYl/8DACBjBoKv46esojDodHL
         n47gahR848zmM6P3mVTnQkqFoZiFT0l3bfyj1YS1zdBsC6T+yD8A7TYoHOxlqAYgWvNm
         2Z9mDpmy/tfDV8zUkxQmOliewdeBwgYpTbnJFZULiWuOADz5+3y4mTXux0z/LwZ6Ckef
         S0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6l2/UFdvX+slMeMMiN5z/2mBC0bdhmSyJAGs5dm5osw=;
        b=YcEGiqaY/WLMbSmJ3U5cQdwOsbVL3vmaKDiVNSiZ5Ux6bnxeuto3NokXrc483quhqi
         9JSxZ92KIWSuqEjsGg2q2xsjweGp+C/L99lWCnsheV7Kp9Zrh/4P4H+lYBPhVPHyvoE8
         V5EOd0Gq3jEYZV2xCGr1Xszuce7cMKdwJ/r1/Krj9dNtdxp+FD5N6/w/3n0JadHRHi9L
         N8BaYTp8oSszS+ni/zVFuhdp/Ga8xxt3id/RSHkrrSzmFbx1bHZsja5apWwZl8kSJUnN
         7UniU7FbpTAJLQiq4l+PqCaCVaPS+xtw20rE/LE7QXVDoPqAp1gbd4Qo6v99DnErNuQ8
         I3vA==
X-Gm-Message-State: AO0yUKUZCckkalgHeoJxa6eItKjpVeCzVf4biOMJs16QVGE36upneL/2
	7h1gfO3ruESgC5Z8viPGH7QOafhGKu1L+vaKwKVPYCbeTm7Vwe7G
X-Google-Smtp-Source: AK7set9EYUFyVv2ZxhxcDoPVhUU23HlE7ObkmU3n8anedmYaTWjLXB+lKOMFYmpAPvFqmJJke1ML5bCga+cYKjV0hCg=
X-Received: by 2002:a17:90a:384a:b0:230:bcbd:b871 with SMTP id
 l10-20020a17090a384a00b00230bcbdb871mr3872474pjf.75.1676305417423; Mon, 13
 Feb 2023 08:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-4-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-4-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:23:26 +0000
Message-ID: <CAFEAcA_gL_9CD83jxn2ebXVEfC47+AnC8BTf371xVEDuwnZUTw@mail.gmail.com>
Subject: Re: [PATCH 3/7] target/arm: Implement v8.3 EnhancedPAC
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: wB10M1BgSiYa

On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index f525ef7fad..a83956652f 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -347,11 +347,15 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>       */
>      test = sextract64(ptr, bot_bit, top_bit - bot_bit);
>      if (test != 0 && test != -1) {
> -        /*
> -         * Note that our top_bit is one greater than the pseudocode's
> -         * version, hence "- 2" here.
> -         */
> -        pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
> +        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
> +            pac = 0;
> +        } else {
> +            /*
> +             * Note that our top_bit is one greater than the pseudocode's
> +             * version, hence "- 2" here.
> +             */
> +            pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
> +        }
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
