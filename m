Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp869334ejy;
        Fri, 30 Jun 2023 06:26:35 -0700 (PDT)
X-Received: by 2002:adf:ed8c:0:b0:314:1b7e:7dec with SMTP id c12-20020adfed8c000000b003141b7e7decmr2150537wro.52.1688131595760;
        Fri, 30 Jun 2023 06:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688131595; cv=none;
        d=google.com; s=arc-20160816;
        b=VxcRfDeuR+bgwmqqkokOLhiJNR66+OrB14MZOgaP9Jf+y/gkB0yV9nfeyoiZbb5ZLA
         y9DqLwcJLbRngB5aBndhpqQ+KpUkFUx+yYVDNPuNuxz3Yu+4JhCBVxl8AhKGpDOCz+x/
         A1sbBiGos2F/+TxrLVRyEcNhd0Zz2Av6bVQtB3WqCtvoO3o7m48GufD0adqfvphlAyAj
         wVm3jey4/uG113AkH8SRtJNMpo6iB5NAeVC0ag9rJ7uvqdZrXERM7lTEdEWhCccq+W1U
         920qmxpF8aW09AeWY8DfpuXqkhGVAT71WuFT9VUAYZHYtG1cgdQcvAxsWAeBQ4i8mQR4
         VkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zO+MiD0vvqFvSc9RbHUTYL1g23zi99p73Vc40SoL74Y=;
        fh=CPyiGDZMAesTxhKGXYlDaXF9+UGe5d2kkJWeR+m1HKo=;
        b=MYJJF24TadlklaOTjsN5ANWO6bIv79TtpLKasmlw+PX7kN+n40Gh8a4sCzaIOjuJ8q
         l7NfD3rttAQJTYNISb+/K0/KDUBBgrFXtNiNThFbAT+P58rFouPkpJQ0+MvjhvCMRNGg
         1BYvlCJdJo8rgRkftcWpukvRUMmaXVOWl+daGH02aAkgQ58pTb6IXYLJwxARF81e6qJy
         s25sp3/GBwtPnnHSFYOVEPOT17Ckdq0BFwLHAjCtFdDwfmJgaMIKdXSqnQro2GFx422G
         txQ4sb5uNuy3hsKi29Z0bDZeLNV7rVz4VuUIk2Icn8DYdjYzEgv6R8CI+PjIBkdpUcTG
         X7fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lFmLVpfN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j23-20020adfb317000000b003129ecf1fdfsor2988325wrd.1.2023.06.30.06.26.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 30 Jun 2023 06:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lFmLVpfN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688131595; x=1690723595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zO+MiD0vvqFvSc9RbHUTYL1g23zi99p73Vc40SoL74Y=;
        b=lFmLVpfNejeN1TMQgO0v6ao70ZgPOcxocb8wXd0lkRdulSo3d8mj8fEYUIoaMfO3yA
         syuLh8LDOmKZHwqDVKrvcN5J386dRHHq5mWksDhKo3Z843moYCszYWGVIWQs7D69kilr
         1lqL6P9m12MHrI33HQsGa8EHFKqmztRk7jgZJCOGLgcBa0DuQrICm+08M100RqhfdK1y
         yzzKPwMTxDnNMjECMc0pKdFSpcPjqlBqj8mg3jV1cZHHWSXsdQ/JzWzAg2p6neSnDeqZ
         ppSGB61uWPbcUOZrD0Dt/kZ8p/nFTEeSLJZBzOzm8FtjPPmBJ2oprUwPO8M1blTAsRx8
         V8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688131595; x=1690723595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zO+MiD0vvqFvSc9RbHUTYL1g23zi99p73Vc40SoL74Y=;
        b=aQ2/d9kFQjNdIJwPAmvanyl3V4KmN8OvG0bp3YCbhcuPL1VLXJxKXq3bueJDlijYgc
         E0QSwuzPoY/50e0G085/y0oHOk03zjehuwLCokanXkKVcTxSAUWALucfn3gkaF1odQIw
         VPlOpsnk8YVxCGp8/jVyQVCMOBhGsxEPY3ZAwl+SJUdJR6Hi9VW3fvVE6FZPBtNIKf+a
         5kBR3yh4Pse/mLmyiLURRBEWSLAAff6KPsrTg5EmfmrNvkXl3PF7Kk3JL4rz/LbGAj+L
         KCexXBfLIBU0mDFmMYpcUibp37+bNOhcyZLyXk3+BeLJMVmJRdqaDTNDT0U+bD7uqTNr
         yQTA==
X-Gm-Message-State: ABy/qLaVt4wus4zg8+ivJ5t6OyElA9S4DdbRm3TtKrhPp5iHYbqIvL5f
	akh09R8D2pnt419LRBVYelY9FRnSA8xAGjMGFGqKJk6a
X-Google-Smtp-Source: APBJJlECowUQ31uVuXZ5NC3ox0oWtgd4OOwEGXHqRAG82Yzhfv5lXaXLS8TM7GsnJy+qYK6WorF65g==
X-Received: by 2002:a5d:4f11:0:b0:313:df08:7b7e with SMTP id c17-20020a5d4f11000000b00313df087b7emr2192727wru.14.1688131595355;
        Fri, 30 Jun 2023 06:26:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.208] ([139.47.41.96])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b00313e8dc7facsm16569370wrt.116.2023.06.30.06.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 06:26:34 -0700 (PDT)
Message-ID: <9ee9c3fc-47cd-25de-f876-7edbd874862a@linaro.org>
Date: Fri, 30 Jun 2023 15:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] target/arm: make arm_casq_ptw CONFIG_TCG only
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230630110757.417758-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230630110757.417758-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: y2Vl58zIR+1N

On 6/30/23 13:07, Alex Bennée wrote:
> The ptw code is accessed by non-TCG code (specifically arm_pamax and
> arm_cpu_get_phys_page_attrs_debug) but most of it is really only for
> TCG emulation. Seeing as we already assert for a non TARGET_AARCH64
> build lets extend the test rather than further messing with the ifdef
> ladder.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> NB: I need this because I'm about to change the probe action is calls
> and probes are very definitely TCG only operations through cputlb.c.
> ---
>   target/arm/ptw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 422bf7e3b1..8cac685aa6 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -628,7 +628,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>                                uint64_t new_val, S1Translate *ptw,
>                                ARMMMUFaultInfo *fi)
>   {
> -#ifdef TARGET_AARCH64
> +#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
>       uint64_t cur_val;
>       void *host = ptw->out_host;
>   
> @@ -708,7 +708,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>   
>       return cur_val;
>   #else
> -    /* AArch32 does not have FEAT_HADFS. */
> +    /* AArch32 and non TCG guests do not have FEAT_HADFS. */
Better as

   AArch32 does not have FEAT_HADFS; non-TCG guests only use debug-mode.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
