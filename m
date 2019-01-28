Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3546409wrt;
        Mon, 28 Jan 2019 09:49:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7QLRbTNVsietSXalzDJVZ/+RcMgmUp9r0G6EwSCPEBwoTvvKyAo2y4k0CE4DHpt1Kpyl3s
X-Received: by 2002:a1c:d082:: with SMTP id h124mr16892304wmg.21.1548697778391;
        Mon, 28 Jan 2019 09:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548697778; cv=none;
        d=google.com; s=arc-20160816;
        b=tFnRCYEphc+Tdxb3kVmm+uf3+qrnCWxgGrK+NV1ZWoRZPPSk9e7dvklvp2vURuqAB3
         lo26jC1xy9uKjBuWFQBJekaHLnaPhZSy5paaFUiodqJwkrad50PMrfn2wCsLO/i0iIwE
         LTr8lLMvubxg8LtOuPyfExUCNsmF3/pRKSIwdmkCTtCjFpglnVlXYd1jM/Iyqa6YFCUw
         D3T0q1QpRcQj9DnnZcWQy3tjka9f8rSPQizK8DuAaJVoIgr4KIRA/Kiw8mPYxHE6hMNM
         tamrtxQvIHrJ/vhmOoZTqVXk41TEb9U0xYVCgG1LhTS5L8Pp5sZy6MUt8rcfpjDqW6mx
         +ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=YeZkN/SJ93KiRkj4k7mVL79ijcppDl37H0vwmK2iU1g=;
        b=LqNxSwTtgNPFnJee37gUhc+mTnW0mQ/AQKFJwuEccGt1xg8181lgFPc7akdQA74e8l
         cea3mzBcUznRzWuNgfv4h9N7C3vlOkzWX7fgCZkcIYWO+7/d26LngBs+4va7GICv10J+
         Eh/Hr1hIaLDRRoK479mT40JTIQvH55hhokFaxvLdPJI98N0+QQZgmrKuxF06cwhcPV5n
         05f+DEN0jliluYg6bwic5QF1rmTvXtdx50X9JYodsvGpAA5hZynfUUtxtS6Oex3vbFDq
         jtg5gJ5UCHCgldGVvI7CXR/7B6d6p3ti5yVxePIl70LvijAyXMJSMDlEtJzIDa/u2qqK
         xuQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id t8si68860wmf.11.2019.01.28.09.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 09:49:38 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MNKuI-1gYBgj3bis-00OlsJ; Mon, 28 Jan 2019 18:49:36 +0100
Subject: Re: [PATCH v1 3/4] linux-user/elfload: enable HWCAP_CPUID for AArch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
References: <20190128173940.25813-1-alex.bennee@linaro.org>
 <20190128173940.25813-4-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1fe0a234-c951-2862-8c6e-a2da8b9d7d88@vivier.eu>
Date: Mon, 28 Jan 2019 18:49:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190128173940.25813-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qrNShLdY+VJf2IBZx+rdZNuhYtm1Lj7I6IYGYC/24uxH3VZbX4+
 2beHkraswHJg6Jap9zFzS4EZkO2CjWHr8aURKfPuHUHqwyywHvsBU3Om+7u/pCvkmkob8El
 HtlyEalcQK2TR0+bPFsaMs2s3dWmqW7wcl+l/pXjM2Ms9ZcEDS9KzIOjtzowqZQteeo5CaL
 4N1L77Cdr8fRilEJuABgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lMIGuvh0CT0=:UeMoCVkfNk2Bshivabu82I
 QaBL9Vml8VuM4fkHmApf3G8zu5w9uJCa3Vv5AVUNIRuWNjlsbTXMtIxO4HT0zl8WF/IOvGqzL
 1HFGUxXj4m7UZeKHEYIlY6GTI5fT7gSKe74UamIVAWIg3ptn6r8FHgq0lE0PvPETFTd2/GrXF
 q8oEkTYHGgJlf0qqiiyq6wf0h3AdN8ElUND1zGQiPhaaBWd9jjzxmMuIXvcAdmCwevn76rhap
 ql+Hdfjm9TQsULixHyjkBoeIu6kjt7sJXA1H5IAPY1d0OtRR1MFwOtyfYWT06J+LYw/j8jVkU
 A/51ww09Ek+kTLo3lAtT4FTDgg1NEpkzJ10lo/q1HKTMY8gkzwZPgh9VJZx8Qv6XsIyi0zGn4
 wJZ8kOfTeW+P9/3M0DE0wZhecfmP6uLNUmVjuurbvOhRKQvjXf/hEoBgHSisRDJT8FSAigThR
 DTU6hZEdA33HwiXhDbND+h7HXPtv5YVSY5QcNZMloB09RbQt13AtcNFSn39oTV/SMnZ6AHCeq
 TXs+6Un+k7mzhzfp49v1aXvqnMf15pxSCtuLErfW8ixjceT/lGQCltCCe07o3IUCUbu/Tt2rq
 lwB22WMf+FJ4BYXl9SSygO6O02+ghyanp6XJ9449rC7lxkJ10xj7/jrTj4mlq7laehOhE1oxl
 NkYAejp2YwIz8IMcGSebeg/aGL9YioHp18m0AFLPzj/QF3QlfBdE9msUt7qVabisF/bXxCRjR
 uGfuz4WDCRNEvVTRbN3gXiuJ9ocaewVTNx74v1/T0igD5hQ7RI7qjZvupJo=
X-TUID: VbgvNYWrPlfW

On 28/01/2019 18:39, Alex Bennée wrote:
> Userspace programs should (in theory) query the ELF HWCAP before
> probing these registers. Now we have implemented them all make it
> public.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 4cff9e1a31..e95c162097 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -571,6 +571,7 @@ static uint32_t get_elf_hwcap(void)
>  
>      hwcaps |= ARM_HWCAP_A64_FP;
>      hwcaps |= ARM_HWCAP_A64_ASIMD;
> +    hwcaps |= ARM_HWCAP_A64_CPUID;
>  
>      /* probe for the extra features */
>  #define GET_FEATURE_ID(feat, hwcap) \
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>
