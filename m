Received: by 10.25.159.19 with SMTP id i19csp1050658lfe;
        Fri, 29 Jan 2016 08:47:53 -0800 (PST)
X-Received: by 10.112.198.102 with SMTP id jb6mr3678016lbc.44.1454086073850;
        Fri, 29 Jan 2016 08:47:53 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com. [2a00:1450:4010:c07::243])
        by mx.google.com with ESMTPS id jm10si8528503lbc.26.2016.01.29.08.47.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 08:47:53 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) client-ip=2a00:1450:4010:c07::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x243.google.com with SMTP id t141so4082601lfd.3;
        Fri, 29 Jan 2016 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=v18ZbfBmifdtX5qjS7OVKYExjeIV5XQR4CtJyMXcI1I=;
        b=bwetdUYv57kM4P8CeyK9Ie52ds0On0JSJyMaDIGJw3PmBz8eGUWLtOWel9avH5pBoG
         +DK6gv+AkTA5cxlV/NDM29s2tJrNlBeJFh/WOrxvUmhMGmVBkxPfsYGxVW6cXl851nCJ
         fdQoO3/JaLd/rOVh/vZYSp9XdjU2ScW0Tzf/Txhmf1l5N06Q5Kpa7TmweVDHpwVLNxUy
         cyA17p4PqejmGlvchnjV40T3LrXoxXNxTQl33DxOsc9QDrnX8MFRcem33MivoiaEiVxx
         k9ieox/M9w4Vvym7IdW7lyBx6pIHK1ArDIrSjWDRFZkQyYnYJHPwAeYR37CUbgpIw5Zp
         i+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=v18ZbfBmifdtX5qjS7OVKYExjeIV5XQR4CtJyMXcI1I=;
        b=Ep/GdrL0XeyfGlA8qEgqW6HR8IgR1MzhU2l4MIALYhcg/UFH6gr3+ypq3iLMaotZbP
         gYcwwm+k19jGEVbDYI1XUQgRgUUWKek/ZJ/ENnTWoi1Rmj9pgBIN1W8uKG2N6EzBnfLj
         JCNhUeT230WXyA8apwDZ1Opj2isZwnrpZyf9DWtXarZUUvr56NpHDkBAB98Hq8SfjlNn
         70g8Nt1SMPA+FNoI0BYVnYWWcCzIwQapYe3udpHhXPl5F1N98MjmCPNyXXuLKWSo5qRi
         IlsYI6PQd9+oH3DtiaEQkD88hLk0TncXCFpoZd30tYuPk1D77gFH4yISIFTIWZpaGeKn
         zxlA==
X-Gm-Message-State: AG10YOShvSbGISi26nZZaJAOdCl3dOg36x8BR5rybXmJWOUe3zraxFTwm2RwlHPgAU2pdg==
X-Received: by 10.25.136.84 with SMTP id k81mr3933246lfd.78.1454086073617;
        Fri, 29 Jan 2016 08:47:53 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id e17sm1272104lfb.9.2016.01.29.08.47.51
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 08:47:52 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 7/8] target-arm: Implement remaining illegal
 return event checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-8-git-send-email-peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB97B7.4040301@gmail.com>
Date: Fri, 29 Jan 2016 19:47:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: nr/d3CMORHTj

On 14.01.2016 21:34, Peter Maydell wrote:
> We already implement almost all the checks for the illegal
> return events from AArch64 state described in the ARM ARM section
> D1.11.2. Add the two missing ones:
>  * return to EL2 when EL3 is implemented and SCR_EL3.NS is 0
>  * return to Non-secure EL1 when EL2 is implemented and HCR_EL2.TGE is 1
>
> (We don't implement external debug, so the case of "debug state exit
> from EL0 using AArch64 state to EL0 using AArch32 state" doesn't apply
> for QEMU.)

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/op_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 38d46d8..5789ccb 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -718,6 +718,17 @@ void HELPER(exception_return)(CPUARMState *env)
>          goto illegal_return;
>      }
>  
> +    if (new_el == 2 && arm_is_secure_below_el3(env)) {
> +        /* Return to the non-existent secure-EL2 */
> +        goto illegal_return;
> +    }
> +
> +    if (new_el == 1 &&
> +        arm_feature(env, ARM_FEATURE_EL2) && (env->cp15.hcr_el2 & HCR_TGE)
> +        && !arm_is_secure_below_el3(env)) {
> +        goto illegal_return;
> +    }
> +
>      if (!return_to_aa64) {
>          env->aarch64 = 0;
>          env->uncached_cpsr = spsr & CPSR_M;
