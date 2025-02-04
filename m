Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp186291njb;
        Tue, 4 Feb 2025 04:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNHK9x1Xlgden1EzBu5l8Lyc3EW5MA544dE5gXNs10VlqeHZ/F9uq43c8NYv/KApuHr9NkLtZx6hM5FQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3lsW7ujXfJkmxFswu4Phfs/MiG7UIyDiYhznAqWMOBUf1sv7q1PU60p/7RciUrpLG1nqT
X-Received: by 2002:a05:6214:3c8e:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6e243c9b6b1mr479509956d6.36.1738673731981;
        Tue, 04 Feb 2025 04:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673731; cv=none;
        d=google.com; s=arc-20240605;
        b=LUh2v0xT6r/hwJ3tzfgH9LRDpFVvJPr90SNsIBra5HYQ9TgbyGRPla9KECP80+DGsT
         y/lqAI8AqRTRnox1Xm0W/8MOE8eHNbx/QJLIEAyI7O6QX815r7b2cvZIvDVRBAgxOIU8
         Ffcv1txVotHYX1pV5lx1bK0HrxgwLIgzgE4sf3+bzfw2xjor19kwi4vet42VoANbQ64C
         VKXT8XKPHbrfHyv5OGaVEXNbr1U9CC9ZrEEnZPQAXtQBx8DXROD5rk+BN1iqr8bPLQ0m
         gO9Asj+n8JJL9Kxv1KBlOBF+3wFihb+EvvZeK5FkuXBUh3yuPBy6DSbisWa6EXZ3aeZ5
         FWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oyQ8CXOngeg/b735pN3KNX+FSZLfevEtQ3Xv4cbYKyg=;
        fh=VPvurnOvX+G3hXWP3tnhRmx19lDE7BdmbEmyt2bcJm4=;
        b=J9xSn/qouE93yFIL6FYVawHhpcI3TxrzXXv48cjBLtpYQ3/ah2YIU+BDonnjH67Rw0
         zkH4GeFmkD8Bk6RLMWj/MlcluocatED/V0yyetuTWM1XfT+UQA+89H0JxWyeyPS1PPVF
         OFVue4BJBtRMZKPWo0/EGzZzUBbTNvguqC0gcvCNYc0ERZuktLmZkPnvKGHAT4yjdUs4
         m0mtJ8JZZyD4JWlo6Fm3jWLLVO6nmiHetgdOFUyXdj+agtkM6sJy8eQxhrbM3bnXF/VI
         5stvlO/pm7ynEmdaMcjlrAn2SsOVDOgDyWFaNgMT3XFM7mhv//be9qZ3wtK9HMYkvT19
         t3Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNOY7puj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e41fdd6d58si25584456d6.56.2025.02.04.04.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 04:55:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNOY7puj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfISP-00082M-BG; Tue, 04 Feb 2025 07:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfISF-0007wH-8p
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 07:55:09 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfISC-0003IN-Uo
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 07:55:02 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e3983426f80so4875796276.1
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738673698; x=1739278498; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oyQ8CXOngeg/b735pN3KNX+FSZLfevEtQ3Xv4cbYKyg=;
 b=CNOY7pujLKsYsYuIyNhKD+kP0fdxERVBRrWZtdfhypzx2S3raFGKhPKFUFAwF2Utbf
 2xXtyJv7CYCwW1EjG8bRIf8NBLyyUJR4l+Ishj9ZX2WdoktGkO06mqpgwKQmQYgnIEvS
 mTb/zCU5Y970VdOhOJBMG7ME1BloOq3J7cCniiefuodADDQbe6MCIJuURV01PaCUB1y0
 aoORK72XxKQupB9VGc7JvOrowkTGDnBfAsP7Itkt7r0g3vSnFDSpWexwT+KdOdO2ij9C
 2tkq3t507kejkE9xpZTzORYguMM7JxVvUg5K+Z1Xw8B5VeZITUKXgHlt5rxLYHHIm8/j
 23+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738673698; x=1739278498;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oyQ8CXOngeg/b735pN3KNX+FSZLfevEtQ3Xv4cbYKyg=;
 b=sLhlDK9QyaqGnbjjdQBRAsJz/7fIyJ2M83VZH0gXFv9kxRRLy3wA8twsQVUMDFGI/T
 BAdmIRcVww2mQogT5EVtDptIp40tryWwLSxrSzEEDZCTC4GWeoDSwr3uvKxPKz7cTpDY
 b5ZXQkXMY0mV5IGYhgbntdxSwo5ePBFlCcYWKvGizNLg95uunDE+oR/MbAXcVjGt+KDn
 B5t0ujkAX8GvsFydw5kPWZcgkF11oIYWFvQ4c4VvvX2IajAsQ5QxVgWsdiOKpZLn4riF
 k7jQJ04+N4JJ0V+BHRQhdvX2f3OV3JzX805KI/KVKSh3a5gSO12gHIVopbAhlgLUMu/m
 8wsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxiVjOKhVv3FvlC8P/ZMgZ+HJvD7bb6d1WSOcT+czZZs1h9pSbJgPhsxZC5amKCYHH5RB1C5qrT5I7@nongnu.org
X-Gm-Message-State: AOJu0YyDm+gmPdH7I0vxb/0V1R2DIr7mwFFt6/hNOFZ9EP8jRMzDnghn
 q3h4sAaVu7gxTjCn90HJweoq/48QXaniO0cQLe3U9oZte3tKSU/nbURDIQR/WIx9G2DtFibDuW6
 yJUrhscG83c+5Aqa6hNHDVKK6mRVc8TUTVhFGxg==
X-Gm-Gg: ASbGncuaLO7vmyPJoV/WAtewRl6AenbtYblo8vpc1iAP/RuKK4ZlhpkBFW6PFPn2Rnd
 5b3idXxsqm+I9G3Xst+ixyLdwRxPHLbwVcyqC0MG4YHQJcS3ovkStvKQDQlUcGEHlnlMKH67TAg
 ==
X-Received: by 2002:a05:6902:1ac6:b0:e5b:16b3:ecfb with SMTP id
 3f1490d57ef6-e5b16b3edafmr1190308276.35.1738673698111; Tue, 04 Feb 2025
 04:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20250127123113.2947620-1-peter.maydell@linaro.org>
In-Reply-To: <20250127123113.2947620-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 12:54:46 +0000
X-Gm-Features: AWEUYZmFgUpkCvg6DWFgEyBWwRxPuynyYrJZJmt0_i4uSp_OUbuCqwhzPbaHjTI
Message-ID: <CAFEAcA_J+dVU2gKHVf8y_mrPMfyBWKCuJZQoaurbT7qGha-9HA@mail.gmail.com>
Subject: Re: [PATCH] qemu-options: Deprecate -old-param command line option
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: og+ByMoSCH/0

Ping for code review, please?

thanks
-- PMM

On Mon, 27 Jan 2025 at 12:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The '-old-param' command line option is specific to Arm targets; it
> is very briefly documented as "old param mode".  What this option
> actually does is change the behaviour when directly booting a guest
> kernel, so that command line arguments are passed to the kernel using
> the extremely old "param_struct" ABI, rather than the newer ATAGS or
> even newer DTB mechanisms.
>
> This support was added back in 2007 to support an old vendor kernel
> on the akita/terrier board types:
>  https://mail.gnu.org/archive/html/qemu-devel/2007-07/msg00344.html
> Even then, it was an out-of-date mechanism from the kernel's
> point of view -- the kernel has had a comment since 2001 marking
> it as deprecated. As of mid-2024, the kernel only retained
> param_struct support for the RiscPC and Footbridge platforms:
>  https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
>
> None of the board types QEMU supports need param_struct support;
> mark this option as deprecated.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/about/deprecated.rst | 13 +++++++++++++
>  system/vl.c               |  1 +
>  2 files changed, 14 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 29de49351d1..a4c7d642236 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -68,6 +68,19 @@ configurations (e.g. -smp drawers=1,books=1,clusters=1 for x86 PC machine) is
>  marked deprecated since 9.0, users have to ensure that all the topology members
>  described with -smp are supported by the target machine.
>
> +``-old-param`` option for booting Arm kernels via param_struct (since 10.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``-old-param`` command line option is specific to Arm targets:
> +it is used when directly booting a guest kernel to pass it the
> +command line and other information via the old ``param_struct`` ABI,
> +rather than the newer ATAGS or DTB mechanisms. This option was only
> +ever needed to support ancient kernels on some old board types
> +like the ``akita`` or ``terrier``; it has been deprecated in the
> +kernel since 2001. None of the board types QEMU supports need
> +``param_struct`` support, so this option has been deprecated and will
> +be removed in a future QEMU version.
> +
>  User-mode emulator command line arguments
>  -----------------------------------------
>
> diff --git a/system/vl.c b/system/vl.c
> index c5678267182..32ee1ce7041 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -3438,6 +3438,7 @@ void qemu_init(int argc, char **argv)
>                  nb_prom_envs++;
>                  break;
>              case QEMU_OPTION_old_param:
> +                warn_report("-old-param is deprecated");
>                  old_param = 1;
>                  break;
>              case QEMU_OPTION_rtc:
> --
