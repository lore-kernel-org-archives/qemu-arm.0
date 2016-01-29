Received: by 10.25.159.19 with SMTP id i19csp1050412lfe;
        Fri, 29 Jan 2016 08:47:16 -0800 (PST)
X-Received: by 10.112.166.100 with SMTP id zf4mr3668213lbb.58.1454086036939;
        Fri, 29 Jan 2016 08:47:16 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com. [2a00:1450:4010:c07::244])
        by mx.google.com with ESMTPS id r15si8525813lfr.132.2016.01.29.08.47.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 08:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) client-ip=2a00:1450:4010:c07::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x244.google.com with SMTP id n70so4087460lfn.1;
        Fri, 29 Jan 2016 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=fyFXa3CZf8wcUBQSo9whFdyiFqujaQSh4d45q2AiT6M=;
        b=m+TGfmo/zcN5gtyXjL9rkQd6Df/hsDs1cgcEQte9u6epuoRi7QEMU6fgdUY/40OR97
         RA0YgclrQiPmjZTxUr8VZcy/0w86DZhxQh63Rlw4O6vcBIIZiwY2YGNK0UiadvC+Bv/d
         B/QN4siaSr1YGOXir3zoiXfP9FIjeIXS6rn2IZj3Sf14//6A0qa808gs4SSRRkeXHYWq
         BfZ46tC1SbDtUbRISttU4O1FMnaB/CN0AU19xB4dOzlsHI2EhH67PRLwPbiIJu41qQTH
         55g18hu5ICGuUcgUA6R/W9c2Vwj/LDO9vcn2Pml1BixfwpeIaXz7EEpL57Uij1jl8HSP
         0nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=fyFXa3CZf8wcUBQSo9whFdyiFqujaQSh4d45q2AiT6M=;
        b=h4wgpK+YpGnOZQbs4b0W9cA/RL9X8H3i60cjCKwg7Gr2utrT/7qiE/38nIbBhjV/LV
         deHKFOjPMQeWJsAGKyBz2Hh3SjqxZntTaB0atUkoBb4PcyE+0ax7+S+dZc7lwVOapxWV
         YahSNMVjQg4id4rrNZhGcOdS/eMJw7dGJIWuGDgVthLqD4HO5pB/8apmD/KVZF4SAbAo
         1hTpYwi2nwAeaMAG4R3Ad+oZBDOLAp+pSv8I2lz6Q1H8LSPiMafQoWYQHgJ9Zfe2X9bw
         zzYfdBEbWABgrzXflxIayBylYE0tLhFKHUMp+K9OT94KW/27LOad1Pc2DTMCfKUmFXRB
         8UWg==
X-Gm-Message-State: AG10YOQglvOON8C6yKupOsTKvTMtFU4yQ8AKEfnxwAf81omdbCX8aEQFw7BHgP4ri0it9A==
X-Received: by 10.25.160.1 with SMTP id j1mr3855047lfe.35.1454086036649;
        Fri, 29 Jan 2016 08:47:16 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id dm7sm717484lbc.32.2016.01.29.08.47.15
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 08:47:15 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 5/8] target-arm: Fix wrong AArch64 entry
 offset for EL2/EL3 target
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-6-git-send-email-peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB9792.8080302@gmail.com>
Date: Fri, 29 Jan 2016 19:47:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: /lJQ5nDm5xtN

On 14.01.2016 21:34, Peter Maydell wrote:
> The entry offset when taking an exception to AArch64 from a lower
> exception level may be 0x400 or 0x600. 0x400 is used if the
> implemented exception level immediately lower than the target level
> is using AArch64, and 0x600 if it is using AArch32. We were
> incorrectly implementing this as checking the exception level
> that the exception was taken from. (The two can be different if
> for example we take an exception from EL0 to AArch64 EL3; we should
> in this case be checking EL2 if EL2 is implemented, and EL1 if
> EL2 is not implemented.)

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index d37c82c..196c111 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5866,7 +5866,26 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>      unsigned int new_mode = aarch64_pstate_mode(new_el, true);
>  
>      if (arm_current_el(env) < new_el) {
> -        if (env->aarch64) {
> +        /* Entry vector offset depends on whether the implemented EL
> +         * immediately lower than the target level is using AArch32 or AArch64
> +         */
> +        bool is_aa64;
> +
> +        switch (new_el) {
> +        case 3:
> +            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
> +            break;
> +        case 2:
> +            is_aa64 = (env->cp15.hcr_el2 & HCR_RW) != 0;
> +            break;
> +        case 1:
> +            is_aa64 = is_a64(env);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        if (is_aa64) {
>              addr += 0x400;
>          } else {
>              addr += 0x600;
