Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp941809njc;
        Fri, 15 Nov 2024 04:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcwnbxuinaJ1zZaWfI/vpo6itJUyV72T1jWjflQYyj/6KMhZui9IoWyvq+MqTNlhzkj+k9m+vOwMQVGA==@linaro.org
X-Google-Smtp-Source: AGHT+IGZ48vsQ3Qc/BV/tyQYH0tGY9e2drj3BBKYe4W3ud4UpE6PuJoU237i0WsYaVpa89falzNd
X-Received: by 2002:a05:620a:2492:b0:7af:ce63:cadc with SMTP id af79cd13be357-7b3622d165cmr354795285a.33.1731675579860;
        Fri, 15 Nov 2024 04:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731675579; cv=none;
        d=google.com; s=arc-20240605;
        b=NO/bPKlZsEwA7sR6HOKkKN3pXTuz/MWWaalDO6cosdZxgTwwEYKpT03ekBDTd6I+dx
         nKo4Kp8C2qNhIt5I7hT+wARN/jTYwNMrIJyH05Yvm05yvfOqRsXr/2PtTMeJqXM/Lw2g
         p+9CrNTb+29aeHtK/h745YQaAtAXy2zDhgNu61GhP+c8rlMAm8MmOowcHmjkqnUvrnpd
         RyBD9wD/UrsoiC6woc2rLihK3JwEDmHHxGjXgz403b6RDoO8XSTS5R+ifnxFLmxtDLI9
         4Ids/A1Q0XhIGJ5eeyGDiP+NcGn1rr3Ii0Mw744Ow+cz15iGkR9J8z2vdll6Rreop1VH
         rYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uzNKzJvzt92sdn/iXGVjikpGgnqoCCvyBSOAdEirGf8=;
        fh=8ghdMpqalj7ow1smktT1Uoew/cOd5XjlJDGf3Vqb7bY=;
        b=Y4jFZH9Sc8rmteKdKcIli3ywaeTGWzEEHlvtYjMhAb7fQ14VDCjl+nQH9DHJp9r6rS
         iOcnZXcoOfkzZ5ouF0ZTDl2lTAh+UFxJWN5EZZ5zXTZaX+ST/zJqAHERyy4jo1IGAGbT
         H/HWU6RviTfM4ywV0tCrV5IRBjOXjgWfdPNPhEJ5bTEeGgAkRltVgOVEEDvHCGnJ2AYt
         ZnFAlL8WPsmyKTwbUhvVAhSuU7819QeSbhGrL+miFoANO9uuj/qLj/7dz3DGkZBxmn9Z
         7t+VQe9lILQZtuT/UiIOMb3gRdiknzc5HIWJJCWMxxTukxsydNNEit45KtYtGGo4rh/g
         Mnlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LpMCd1fa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca9fbdesi347742885a.452.2024.11.15.04.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 04:59:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LpMCd1fa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBvuz-0007f7-9r; Fri, 15 Nov 2024 07:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBvuu-0007dW-OY
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 07:59:18 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBvut-0002CE-3b
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 07:59:16 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c94a7239cfso1085916a12.3
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731675553; x=1732280353; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uzNKzJvzt92sdn/iXGVjikpGgnqoCCvyBSOAdEirGf8=;
 b=LpMCd1fa4lhNN04TA4KgSWkYri8goaHpbmtPuseAG9fdJd1tsgeTwK9wdml23hAyL5
 CrSmujjalfKigdz2Bg3MIJXB53gmwmUrayifJCHQ58uUOl9P/73a9b9hk2zZchEOitRZ
 CMYrelbH+hdx1Gg4UDUWmygXo7Spq314U0uY5vInmxPUqesqsJmK37El1NEw71L/J4Wf
 TZyYZkeE3kel15/LvY2a/vH4WMZHz/SXjIATklF2yB2iOK1RL/pMAiplU7xFDJlbS7AV
 AISZQETB7XHe/GGNMrkH34AJY81W7G9MlRGmtmwvGXowc60+/WdYjUOfYg49RpVi8rmq
 VWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731675553; x=1732280353;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzNKzJvzt92sdn/iXGVjikpGgnqoCCvyBSOAdEirGf8=;
 b=iIBgwes7xdrLSMXPKPC0LHU7IMwYBvPVTu2vwiHzXgolZw/xNRLq/+19wNUGICKCyt
 l7EGiwJOfD6o/68Xl40UFpnUkwce1k3/SwVswPe+Vu1EuW0CqCPUBZtfu9NByI+3Huof
 Kij2+dc4WaAUz55q06gDP1YCgqPNOKvQ/zqX3zM1funaJOOnRdW5pzWQ3FppjOwrngEq
 TqUvcGz/MWpEABPSyZ3IAHV0Tktqq+TF3ybZrflWMhV17Gk3i5UsrINyDhKhhEdfkNDt
 dkXfLA6sG8ZQU0ADISGj3kh2l6MLF1PZsH8yUEmjKGY5odaDYd5IpHj97VthT2cYKTDn
 uLJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZWPcoLhsyurRVJ0nOKoEHvt0UjcVb7WGv/JzBGfOU/E2vt2njT/AReJSQSCdBMVemFkwZj9991A==@nongnu.org
X-Gm-Message-State: AOJu0YyC8Gh/lVhHkcmm+FULAD5hxo+UK4yBMMlNem197PqrwEqP515d
 418SYJXlTmFzwVbLmj0dy4hak9yBYcXkdKqzSSWLbJWDimTcT0JQFwQRQJ4HMwmb8UpyGVfT23A
 b5bcvZyAdm0iaF17i9016uNdVKEn1+nHY4jjAyA==
X-Received: by 2002:a05:6402:2789:b0:5cb:f1d7:56ac with SMTP id
 4fb4d7f45d1cf-5cf8fc63764mr2077136a12.2.1731675553139; Fri, 15 Nov 2024
 04:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20241113173622.79447-1-castet.matthieu@free.fr>
In-Reply-To: <20241113173622.79447-1-castet.matthieu@free.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2024 12:59:02 +0000
Message-ID: <CAFEAcA8hb9+U0ZZoA=WHscpxKsDdJxhobgMAzX0C0k939dk_UA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add cortex-m0+ support
To: Matthieu Castet <castet.matthieu@free.fr>
Cc: qemu-devel@nongnu.org, "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: c4SvqoAY0QLM

On Wed, 13 Nov 2024 at 17:36, Matthieu Castet <castet.matthieu@free.fr> wrote:
>
> Signed-off-by: Matthieu Castet<castet.matthieu@free.fr>

Hi; thanks for version 2; this looks pretty good and I just
have a couple of small nits.

Firstly, there's still no commit message body text here.
Commit messages should explain the intention of the commit
and roughly what the change is doing. If you look at
"git log" you'll see that subject-line-only commit messages
are the exception, not the norm (and are usually only for
pretty mechanical changes done as part of a whole series
that's doing the same kind of change).

> ---
>  hw/intc/armv7m_nvic.c    | 51 ++++++++++++++++++++++++++++++++++++++--
>  target/arm/cpu.c         |  5 ++--
>  target/arm/ptw.c         | 14 +++++++++--
>  target/arm/tcg/cpu-v7m.c | 17 ++++++++++++++
>  4 files changed, 81 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 98f3cf59bc..41d2b98ee4 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1386,7 +1386,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>          }
>          return (cpu->env.pmsav7.drbar[region] & ~0x1f) | (region & 0xf);
>      }
> -    case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
> +    case 0xda0: /* MPU_RASR (v6M/v7M), MPU_RLAR (v8M) */
>      case 0xda8: /* MPU_RASR_A1 (v7M), MPU_RLAR_A1 (v8M) */
>      case 0xdb0: /* MPU_RASR_A2 (v7M), MPU_RLAR_A2 (v8M) */
>      case 0xdb8: /* MPU_RASR_A3 (v7M), MPU_RLAR_A3 (v8M) */
> @@ -1407,6 +1407,14 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>              }
>              return cpu->env.pmsav8.rlar[attrs.secure][region];
>          }
> +        if (!arm_feature(&s->cpu->env, ARM_FEATURE_V7)) {
> +            /*
> +             * armv6-m do not support A alias
> +             */
> +            if (offset != 0xda0) {
> +                goto bad_offset;
> +            }
> +        }

I think it would be neater to do the "alias registers not supported" as:

    case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
    case 0xda8: /* MPU_RASR_A1 (v7M), MPU_RLAR_A1 (v8M) */
    case 0xdb0: /* MPU_RASR_A2 (v7M), MPU_RLAR_A2 (v8M) */
    case 0xdb8: /* MPU_RASR_A3 (v7M), MPU_RLAR_A3 (v8M) */
        if (!arm_feature(&s->cpu->env, ARM_FEATURE_V7)) {
            /* No alias registers in v6M */
            goto bad_offset;
        }
        /* fall through */
    case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
        [code for MPU_RASR starts here]


You're also missing the "no RBAR aliases" handling in nvic_readl().

>          if (region >= cpu->pmsav7_dregion) {
>              return 0;
> @@ -1876,6 +1884,21 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>              return;
>          }
>
> +        if (!arm_feature(&s->cpu->env, ARM_FEATURE_V7)) {
> +            if (offset != 0xd9c) {
> +                /*
> +                 * armv6-m do not support A alias
> +                 */
> +                goto bad_offset;
> +            }
> +
> +            /*
> +             * armv6-m do not support region address with alignement
> +             * less than 256. Force alignement.

Typos: "does not", "alignment".

> +             */
> +            value &= ~0xe0;
> +        }
> +
>          if (value & (1 << 4)) {
>              /* VALID bit means use the region number specified in this
>               * value and also update MPU_RNR.REGION with that value.

The rest of the patch looks good.

PS: there's no rush about producing a v3 -- we're currently in
freeze for the 9.2 release, so this won't be going into git
until we make the 9.2 release in late December.

thanks
-- PMM
