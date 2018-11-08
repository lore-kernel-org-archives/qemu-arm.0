Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp409465wrw;
        Thu, 8 Nov 2018 09:25:27 -0800 (PST)
X-Received: by 2002:a1c:868e:: with SMTP id i136-v6mr1996270wmd.122.1541697927131;
        Thu, 08 Nov 2018 09:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541697927; cv=none;
        d=google.com; s=arc-20160816;
        b=Uu1rNzRMoKYb4pe1wEddo8sP/kQg/8T95Lz2Cx/ee/k1khr2bIJWuc56S5aRY78agW
         0KhYmG79N76PWgGgyY6jJoU8XGOOVaUcPtUAiOMKvsmOxKjaJ2HUBW3hmamVMdQg3xw8
         2nS+39Py907Jj5mEZzyEayMgYgxKcF6eDtM913fC2jpdcTrm3h/41vG1vnIVMr1WfrhA
         7fKNcuXWVlzoaaqfxCPI0t+QOxXUm8+xKZ0Ro7TIFSyexW9BtK2wcTRr/9k6FMhLYlJD
         ymWe7kGtA1fVBw/Yu8xY9W7kfohZ6h4jHsJIUXOq6CiuS3hEomulTUINHcwf6zI8t2po
         VzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=eYI6tvFSr4HAX6q0O2NZFGO45ohjGzznFmD692oiILA=;
        b=S4Qj3HQMYRut5kJZbWOENdlZE+EjxCdCusk4yv1JyyBmrpEsf+9oxqJ9Gde/WHpWYL
         VGX4/5EAd+vStRgPBilPp/YF66AxM/w7NTvY+Cmh0kNGgi68HZsLJD2W9XaEbtDTBzjV
         3bYiJAwC4ZBkP6rYNZmiVwL/GZMu/oh8gjBT4YTMCSl42LcwAMu41S4Ag36rweVe+pTj
         PNyame32lP1Dcplsw/ebicvXHuN/uA5ViXdTDJFjRemV3UbnOoq/6swLioP2KnPvh7n9
         H9JGOC5wdUp2DarrbbjGcs/QC70/lfA/o96hnLHfWoTdpUV4+F9fPDzBxQphyrDyufpq
         e3iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZM8aUPkD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 142-v6sor3290409wmj.5.2018.11.08.09.25.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Nov 2018 09:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZM8aUPkD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eYI6tvFSr4HAX6q0O2NZFGO45ohjGzznFmD692oiILA=;
        b=ZM8aUPkD5vxSgRaeR0OekZmt05RV8YpDwKE7O4A+cL9EAsR5B6ICXGQvOtX8zgQfO+
         UStQ/lamDKgL0mV3AyJ3ec9GYhfi73BNq20s4e9X9DTjBdmJyXnFAUD4xjMSDPGNY8y2
         BrAfPM8AaXru2K2uB7P4qCQ/RdanEbb5PBGQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eYI6tvFSr4HAX6q0O2NZFGO45ohjGzznFmD692oiILA=;
        b=DIRnqJ4ZlwyhNKuz2n6hY9dfZaCLu+30+kHe2DJrxBkXcUP+xBx++GnaFVSvwWx/Tp
         irGXjdOynjGpJeOMto2ZlR7S3vKbrgWMtXhfb2y7VA78ZgTOp8I136eCioP7zcItASNJ
         +d7aOcMGc5SIK5VDRL1VZiHJ5IP0lMfmLxFNSX/cpv333MxbOLaB4y5frCiFhQJCYat9
         ClqjmTbLEpY/aw5+p0vUdQO83jMGxKqbCvkEoR/ap/UCCe7eYliFTHsS6xHK4KwtrYJW
         oze+IiHLkdzvppw4Ap4H8w3Tl9AnaYW1iE40jSHlyJi+/6bUb0AvvAKusmsXI9kZFAvp
         PIBg==
X-Gm-Message-State: AGRZ1gJZ2Ui4/tSviAvWB4xUUele5wmvSq5culSD8HPbwyCPZ9GefX/w
	nWMcs02UxrjuazdwFq1tsZxgI+nbuSgJfQR7
X-Google-Smtp-Source: AJdET5cMMbXLRvItkt+K444urO0AwwV7EyWQnSSAHuPyxtg822Hfq8CFXwYwuvEd5tyRRHMhWU27vQ==
X-Received: by 2002:a1c:7e8f:: with SMTP id z137-v6mr1898994wmc.140.1541697926746;
        Thu, 08 Nov 2018 09:25:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
        by smtp.gmail.com with ESMTPSA id w18-v6sm9766747wrn.66.2018.11.08.09.25.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 09:25:26 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 6/6] arm: fix
 aa64_generate_debug_exceptions to work with EL2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181108163329.19940-1-alex.bennee@linaro.org>
 <20181108163329.19940-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e33f03d9-1223-3396-ad79-2a7ae264c13a@linaro.org>
Date: Thu, 8 Nov 2018 18:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108163329.19940-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oLluLSCbFbf9

On 11/8/18 5:33 PM, Alex Bennée wrote:
> The test was incomplete and incorrectly caused debug exceptions to be
> generated when returning to EL2 after a failed attempt to single-step
> an EL1 instruction. Fix this while cleaning up the function a little.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1efff21a18..a6d8eb14f6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2764,23 +2764,33 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
>      return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
>  }
>  
> +/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
>  static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>  {
> +    int cur_el = arm_current_el(env);
> +    int debug_el;
> +
>      if (arm_is_secure(env)) {
>          /* MDCR_EL3.SDD disables debug events from Secure state */
>          if (extract32(env->cp15.mdcr_el3, 16, 1) != 0
> -            || arm_current_el(env) == 3) {
> +            || cur_el == 3) {

Hmm.  Perhaps better as

    if (cur_el == 3) {
        return false;
    }
    /* MDCR_EL3.SDD disables... */
    if (arm_is_secure_below_el3(env)
        && extract32(env->cp15.mdcr_el3, 16, 1)) {
        return false;
    }

and of course more symbols would be nice, but it's not wrong as-is.


r~
