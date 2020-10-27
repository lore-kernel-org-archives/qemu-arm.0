Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4190922lfa;
        Tue, 27 Oct 2020 14:20:51 -0700 (PDT)
X-Received: by 2002:a50:9ec6:: with SMTP id a64mr4237866edf.382.1603833651374;
        Tue, 27 Oct 2020 14:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603833651; cv=none;
        d=google.com; s=arc-20160816;
        b=xSEUREn3QX1teruHwYLn6MwwoknpTuQPc2ihRdZ2qgEMLfHzZvHCwaqkaUjRRB5F9t
         gK7g8i76p0LRZeEdAC82QwPWK1ZNq9fo6JL6ZL7yOEPPnPuyR21LDszbFxqdkAcRJ+VL
         bFbR5Qk7ysU+p4R4xtUFR10BpCtnQIjS0epgIIopoGLLf42Sg1cwuz7v6Q3UyKgLQY7b
         uilqblkfZjFdnG+V8JftGxW5gTzv/Ol6pPPOh6W8NTuZdbLRM6CvdSsQkANDb2stT4LS
         AjnxUG4j+12UDWVs8bo1mSIAft/7l1l6Z7JsDP+J6+cD+SmXzukndJ+9mpJjXZ65ofsz
         dWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d0UbQvo8Vb3wDc/aJyL7VyV7Y6DvIzJ3l15+MRR+t/M=;
        b=VLtFMqBk2kKQ7jCmfiKgsZhC8JluLIp1/tRuFS22D0eLV7ZdnzIKggtg4VWZtBLfRr
         gArnDnmCQJB2x9ENcRsRjrPSSH2WANs30aVKYFZM/d7cTGqc4037MSryO5mSa8SSlLMr
         rDyxnZc1gd7762hhNTE0JsFqwT2NISnIqqmbQ3tdXBvcL6MO3rUFG85pHonYWnOaQpl0
         B99fHCPoJPSqOi0+HdElzYQHO/sVDaJYq/WB6aot+qYgnbNgVzSaruSOZFVgsyjVK2eQ
         dBjqE9dqhamkBhdPpHQETuLvaCrlIDA9nU3FwLGWRChUGBqRNY+Xxl7J8MmW0VM0RQlJ
         LUMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ru1c9M3E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m16sor28608edj.8.2020.10.27.14.20.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Oct 2020 14:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ru1c9M3E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d0UbQvo8Vb3wDc/aJyL7VyV7Y6DvIzJ3l15+MRR+t/M=;
        b=ru1c9M3EPVQKRU7OXH0NpPO9pQ7KwB+L4L/EQSJA3KWr8bk55h7RZD92/QoRflod6q
         gLLU00LoyqQIP9A4dRp3Zbg/Jnp5XLqRzkdP8jm/5UOAUWadPM1h8m0d35uQBs9twpnD
         MJcf1kI2ZVb4U6gx4jhvcHKMEevJm65bIpQBz99JYY+VwNW/SUnZLURbf9gbmotoMXLn
         DM3s9dy4F8O9RtSZpMJHJRNbdnCNAKOEDVQlxJl560Dp7QQTVW1w1XrelLgF+NZgp3+s
         LqbdMzsIkk43DwEWEGXqjF/1LaNhT6Rmz6Qh/olIUP/8DRxTFM77w3MAl0o8/I5+P8Ik
         vAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d0UbQvo8Vb3wDc/aJyL7VyV7Y6DvIzJ3l15+MRR+t/M=;
        b=jqP54W3kI3SMyIZjm4v2bW7KSyljNvTaJIGwI2+sfUihLq7UGg6tcYY128bbSrs9GD
         CIcbEMsx8EpxCD/sImgf8B5GBXtWlmYQM9m+8hgWk4/ZInvstt8wKHoYYLYa4prKNFS1
         4WPcUNDgEKi35GyQg9P/0SlAp6JfJKK7cul2sRNPNz5cryzo8dpvb9gmYCF3G/IGGHMP
         w60MLWqWTFPB2em5+Khl6Vi0fSE/2DPwj9fMVd1UWYWxIpajld/zUIHGfFRMCQTZs9o5
         3utpugpsXBBECh0HK7kl1mdySj+7Br5P1lRG9tG1z5hM1ZcW46kDMzbw4RJKjrOzVMeg
         Pz8g==
X-Gm-Message-State: AOAM533yXsO5O6hPa/3v9uCtqKJjSKuR+JyM/tfnLwdLLO0hpNfgtpOr
	0JHVEeJ129y+AtLCGYTM1JHRGZp4P9zBxKrWQWcupSpd
X-Google-Smtp-Source: ABdhPJxhKBsnrlh4qEzVXJOYba0Kccwr+goxR7w8UfSVC7voQImgwhCSMfw3fM3ek3Te8BbZ9eI+0eZquslGeeVBQEc=
X-Received: by 2002:a50:f41a:: with SMTP id r26mr4258583edm.251.1603833651094;
 Tue, 27 Oct 2020 14:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201026212853.92880-1-keithp@keithp.com> <20201026212853.92880-2-keithp@keithp.com>
In-Reply-To: <20201026212853.92880-2-keithp@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 21:20:39 +0000
Message-ID: <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared directories
To: Keith Packard <keithp@keithp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: d9JAccvCW5GN

On Mon, 26 Oct 2020 at 21:29, Keith Packard <keithp@keithp.com> wrote:
>
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
>
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
>
> The build system was modified to reflect this change, but the contents
> of the two files are unchanged.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
> ---
> diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
> similarity index 100%
> rename from target/arm/arm-semi.c
> rename to hw/semihosting/common-semi.c
> diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
> index f40ac574c4..fbd2841e59 100644
> --- a/hw/semihosting/meson.build
> +++ b/hw/semihosting/meson.build
> @@ -2,3 +2,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
>    'config.c',
>    'console.c',
>  ))
> +
> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))

I think this adds this file to the compilation for all TCG targets;
you only want it for targets which have Arm-semihosting-ABI compatible
semihosting. (Various other targets either don't have semihosting
or have their own ABI.)

thanks
-- PMM
