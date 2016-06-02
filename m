Received: by 10.25.27.66 with SMTP id b63csp880913lfb;
        Thu, 2 Jun 2016 12:37:25 -0700 (PDT)
X-Received: by 10.25.29.138 with SMTP id d132mr4555406lfd.142.1464896244974;
        Thu, 02 Jun 2016 12:37:24 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com. [2a00:1450:4010:c07::243])
        by mx.google.com with ESMTPS id o131si1024198lfe.284.2016.06.02.12.37.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jun 2016 12:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) client-ip=2a00:1450:4010:c07::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x243.google.com with SMTP id h68so6061023lfh.3;
        Thu, 02 Jun 2016 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=8fjWH4CzEbJk7SxP9ugx99LIdsWHKgs54GTzPfmiITo=;
        b=AsCOCQK1VMLlkG3ZWaMUIPWAtfsZj8gR0v4I6DbG2GMj3Jzl4ctVvUmsvMHeN+6IaV
         8JD6wFXPSUHIO62xCiRoYhKAnB/K3Qf7WKRpQEP9MTtBmKMRr0wHukQBeFVBTJk44Nyn
         FTQLcZydTjDjaOeC2ypEN7gRdO1ThwNNKPmXSgz+ED1K2c7UNXvH32St+jXoitWA0AS/
         JVFfGpawv3s4KNPvpgXv5ilxLkB4AUByFYK0jSQhYJhi1dDrZa6r5LsfxgXPEQ5liTD8
         xByh0Bdrce//lydsVNjKnkFdQ7Wl44IDt1GF3zuTuoSXclT1B4ZdZRRjYfctOY4m66Jk
         reFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=8fjWH4CzEbJk7SxP9ugx99LIdsWHKgs54GTzPfmiITo=;
        b=JKEnFvUrTv6Zg2MIAj3zOESQO1MEE9wLZEO8HGfoHeagemsHEHBxjXC/1snkRAoL5i
         nZzwLxa1X+ErP4bR2qqH80lyBPyEhrH+bx8zSFGTGzoxO8Hfdre+Y7V1FXDG4QteT8Ns
         i4G3+tMo1UyivqR+BeD3TS81yuubmttY4jswP+95UnYHfCdsGFZBO11RukUHTw3aarx5
         t3dPIxptyTqRsIbXYxSH4bkjK0O5NepfUaxEb3Ms/BT9bUZqsShrsU0XoVtDunQ2iO6r
         q2lGBy2k/a2A+VqfG2OHHOGkII8ASVQSU2kO0/szyOv6+z+MKpY4f5UC6cOlLoy0EJ8x
         J/Rw==
X-Gm-Message-State: ALyK8tJ0o0nQuaUOE88QLZa1uY/r6KAJ/IsewaHK7pBG81nbxBQZQJM6enZ4ufSNLqilag==
X-Received: by 10.25.37.9 with SMTP id l9mr4305219lfl.70.1464896244660;
        Thu, 02 Jun 2016 12:37:24 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id g82sm20959ljg.45.2016.06.02.12.37.23
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 02 Jun 2016 12:37:23 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC v2 PATCH 11/13] target-arm: Generate fences in
 ARMv7 frontend
To: Pranith Kumar <bobby.prani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "open list:ARM"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20160531183928.29406-1-bobby.prani@gmail.com>
 <20160531183928.29406-12-bobby.prani@gmail.com>
Cc: alex.bennee@linaro.org, rth@twiddle.net
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57508AEE.70706@gmail.com>
Date: Thu, 2 Jun 2016 22:37:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160531183928.29406-12-bobby.prani@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: q1+eCH5eF6LU

On 31/05/16 21:39, Pranith Kumar wrote:
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  target-arm/translate.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index c946c0e..e1b16c0 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7980,9 +7980,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                  gen_clrex(s);
>                  return;
>              case 4: /* dsb */
> +                ARCH(7);

ARMv7 ARM says: "A DSB behaves as a DMB with the same arguments, and
also has the additional properties...".

Kind regards,
Sergey

> +                return;
>              case 5: /* dmb */
>                  ARCH(7);
> -                /* We don't emulate caches so these are a no-op.  */
> +                tcg_gen_mb(TCG_MB_FULL);
>                  return;
>              case 6: /* isb */
>                  /* We need to break the TB after this insn to execute
> @@ -10330,8 +10332,9 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                              gen_clrex(s);
>                              break;
>                          case 4: /* dsb */
> +                            break;
>                          case 5: /* dmb */
> -                            /* These execute as NOPs.  */
> +                            tcg_gen_mb(TCG_MB_FULL);
>                              break;
>                          case 6: /* isb */
>                              /* We need to break the TB after this insn
