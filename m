Received: by 10.25.159.19 with SMTP id i19csp1229596lfe;
        Mon, 25 Jan 2016 04:58:01 -0800 (PST)
X-Received: by 10.31.54.12 with SMTP id d12mr10710166vka.34.1453726681587;
        Mon, 25 Jan 2016 04:58:01 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com. [2607:f8b0:400c:c05::22e])
        by mx.google.com with ESMTPS id h82si17912962vkf.200.2016.01.25.04.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 04:58:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) client-ip=2607:f8b0:400c:c05::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22e.google.com with SMTP id n1so72987490vkb.3
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=EqkrplzXYUSHCHs1sENeVufAzr7Sq+IuxCWD2Vo/TF8=;
        b=VuEtoKwWy5S8mbIhKmAqfd9fnsOwTyqZtmKtnMOD8aJ8A3ARbi4Fj1CIm7YJlF37Rh
         mjIkdXdKSyVmxEtGZbKk/zDv9N2rNeP5fvQWX07F7aObLZDYp5EmDLw1hSYAhbKOogeb
         qCDn2CPSnkkWnvr1J/7Kx/+T9DV246SsUSYC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=EqkrplzXYUSHCHs1sENeVufAzr7Sq+IuxCWD2Vo/TF8=;
        b=ikEB6zb1ibSyAI+kIuSQSHvTmvCcglCjZwkQTtEiSOXLt8Wg54oNHOp62dwYWNVh7I
         mK5yKh6nU8rLfgBZCwIWMSK8wbvUljO2p7VytIyORKc0X3W7vVXE+A52G/7zUmvvmAyU
         ygjA5NgX2WCTqHaU2CyL04FqnqpRtdBUOeeyGapsxjvFUw4fUK1Yrca4I9PSdl9Aiv5k
         Yl5C39ePJKGqLs0xfWuxAyiFyijkY4Mn6ARv45f4NprzcNZ42hxr2KhyFz1xTNz8Redl
         msJnNfPCtcTYFfMnO07F6IzXzuH3XMfGYFPiBemC4vScWrIIdz1Gqmz4fDwEgh607bLr
         XXlg==
X-Gm-Message-State: AG10YOQpYACOcCT7LlzLT4jZL/kaXOawCDlNEig+ZwtqMOJBy1tK2pPavDbcUb3bWhWPL3GMukvz2/wlDQIb6rFeEmc=
X-Received: by 10.31.131.199 with SMTP id f190mr3660092vkd.90.1453726681322;
 Mon, 25 Jan 2016 04:58:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 04:57:41 -0800 (PST)
In-Reply-To: <1453456243-19879-4-git-send-email-edgar.iglesias@gmail.com>
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com> <1453456243-19879-4-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 12:57:41 +0000
Message-ID: <CAFEAcA_XE9vDZ-uu6WezP7-aFr2n8DJPMf3eV2AVCjzy-pYvFg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: 3V6H5n6D6Xpu

On 22 January 2016 at 09:50, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Implement the inputsize > pamax check for Stage 2 translations.
> We have multiple choices for how to respond to errors and
> choose to fault.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 2a6fa94..8901762 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6809,7 +6809,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>           */
>          int startlevel = extract32(tcr->raw_tcr, 6, 2);
>          unsigned int pamax = arm_pamax(cpu);
> -        bool ok;
> +        bool ok = true;
>
>          if (va_size == 32 || stride == 9) {
>              /* AArch32 or 4KB pages */
> @@ -6819,9 +6819,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>              level = 3 - startlevel;
>          }
>
> -        /* Check that the starting level is valid. */
> -        ok = check_s2_startlevel(cpu, va_size == 64, level,
> -                                 inputsize, stride, pamax);
> +        if (va_size == 64 &&
> +            inputsize > pamax &&
> +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> +            /* We have multiple choices but choose to fault.  */

Can we say specifically "This is CONSTRAINED UNPREDICTABLE and
we choose...", please?

thanks
-- PMM
