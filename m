Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1607272lfa;
        Fri, 4 Jun 2021 17:35:58 -0700 (PDT)
X-Received: by 2002:a17:903:2289:b029:109:8cf1:7d9a with SMTP id b9-20020a1709032289b02901098cf17d9amr6826995plh.53.1622853358628;
        Fri, 04 Jun 2021 17:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622853358; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy41It+VvNt86Llwjjd5UteME8rYTdeVVlWd1vkidhfOrZGQVnre14gvJXkeIOMTA3
         VWCChfJgsleFDa1kZvilxPV3xTOMBoqKL1yjk1q8YOqissx1h4AmInvX71gCY6nPq7U3
         YrZPtT3BaxESVwKjexDN92fK7RbW7tEt8CDVP8sPGCID1Od3nwksKwU8ONJphT/mkS7b
         mpCXpFfPAxM9UtAVwo6pxnfVlSMOVqI0P48fNtbB+dqXRL5SdgxBT4zMfHUDfWb40Ose
         dPOeTHKNbOSBYcb/0zVJZYG5wKqBrfgqj77442JJdPVg2aIDZeE4Vatftezv7nHO0igV
         llqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SqPhAJBRJ6ATK59JwkbRw9lZ89UVO+JgBVjp92QtGMs=;
        b=DW+6itmkDQH8CvvCvUYiviVSytWAeCcgA396d+OafFI6ZVnzUsxbDH5Rk1Y0zynKpC
         6nHuFuqwoi3wF2R6dTM5c1Td8iWsdWasqMh0bYaUfbuTg9UhC60FTa+drRvT0pauLPRB
         X/I5WIWrcI1ZWjAic87HZnt/WUEJ+1lDZlZy9PbBA83LI5B4blDzmx/cKO0+3umSfbMU
         V8NikU0Uy4BW9nRJ0aV9DdfdwkvH5wnC5FgD2DkFyNYs8H9J5Yd41YGy/aq77ynzhqIQ
         aepXb5uJVUaWe8rCm3F245NvF9+hLVriC4g4Y/g+RArHmRA39VcIUy4HCIcIFpcB06/V
         3qKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAy25sD5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q138sor1961759pfq.28.2021.06.04.17.35.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 17:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAy25sD5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SqPhAJBRJ6ATK59JwkbRw9lZ89UVO+JgBVjp92QtGMs=;
        b=cAy25sD5b4hUXBEKmrB+s9xGMJ8gocdNUWKTaExhkhNmegReiFpEWFPG+D/+Sq8H3t
         KrSObsnXvmC3yg789/dF9HlvTLlLwb/hdnh1VaSCx3P56RXceP5uPYtcgnSIjp95j6fM
         7yCa4NkOhSi/+P9sewtDPbtbArEg+O1gOvs2KJaO60BzpBkETLHCI/VWCZbBqdAWUu7E
         9tJUFnLVFwRy3azWIEivVYC+9/LJ38tDZM++xepl3nj+ezueknpG2fS2tWp+IXP6fQmf
         WirsicaGLf60AUeGWOkdTui0fy1o/9KQf/qC84VIyA7saZAEbMdMKtY954DP4qHS61dG
         9Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SqPhAJBRJ6ATK59JwkbRw9lZ89UVO+JgBVjp92QtGMs=;
        b=NApoHfYRJjUPL7mlCJHPEDAkWmIrfAWXIkRgHX3bCPDdY2yJ53d/Tosqjl45p+x47s
         5SgIEO3P/JQmufO8vc3P4sliknggbIWCez4W07KkdoqLnjEDDaMXfLfIvpP971b5Et1T
         l9f1vRnhElYValJWm5MqgVeXoj5nsrLIaWU2+PYn1cWIuONLsJcCr+XPXIAEin3wPVjj
         NZWNMC8VtXH1kFrUpnYsZdukj/pMp97UuAUEXz8lrj2qW+/JWvYaq+PoiGjm9bZJwc3g
         Wb4GhwmiHag3Rpcg4uiYRY1ber8Hh8J2XrvLu5J78ip06TySlJp+ndJwza0ijDcOmH7o
         JFtA==
X-Gm-Message-State: AOAM533pkSYm12/V6Fro3fiILxkSX8B2ioa7Ac+IROJE7JrT1mbe0f06
	AWpi/Ks2tFPAFFB7j2H6WyK/Q/3/
X-Google-Smtp-Source: ABdhPJzCpDBNHdsbBsWbKFqpufpic+6j22aIAbwwof67mU7A+V9fqio7BDmwiOafsPAUHMLf5HAljg==
X-Received: by 2002:a62:92c7:0:b029:2de:61c9:fc2 with SMTP id o190-20020a6292c70000b02902de61c90fc2mr7346455pfd.70.1622853358043;
        Fri, 04 Jun 2021 17:35:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id 22sm1888742pfo.80.2021.06.04.17.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 17:35:57 -0700 (PDT)
Subject: Re: [PATCH v16 48/99] target/arm: remove now useless ifndef from
 fp_exception_el
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-49-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <490a4032-2dcb-2bec-3eb9-93d6d4bcea2b@linaro.org>
Date: Fri, 4 Jun 2021 17:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-49-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CXid1Lt1Ltiy

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> after moving the code of fp_exception_el to a sysemu-only module,
> we can remove the #ifndef CONFIG_USER_ONLY.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sysemu.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index 128616d90d..0d80a0161c 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -417,7 +417,6 @@ int sve_exception_el(CPUARMState *env, int el)
>    */
>   int fp_exception_el(CPUARMState *env, int cur_el)
>   {
> -#ifndef CONFIG_USER_ONLY
>       /*
>        * CPACR and the CPTR registers don't exist before v6, so FP is
>        * always accessible
> @@ -507,6 +506,5 @@ int fp_exception_el(CPUARMState *env, int cur_el)
>           /* Trap all FP ops to EL3 */
>           return 3;
>       }
> -#endif
>       return 0;
>   }

Ah, squash with previous.  Just like was done in patch 45 with sve_exception_el 
while moving.


r~
