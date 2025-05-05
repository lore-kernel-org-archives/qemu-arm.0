Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2630896njj;
        Mon, 5 May 2025 11:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpVPXP+UlSN7nuiN6vOYsBk/M1r/VBxydpSufmFHzGb7LZBGs8rf+4ZqMooGTLWgHAUxW922hC/lpSTg==@linaro.org
X-Received: by 2002:a05:6a00:8f0c:b0:736:50c4:3e0f with SMTP id d2e1a72fcca58-7406f0b5e78mr9565673b3a.10.1746469004887;
        Mon, 05 May 2025 11:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746469004; cv=none;
        d=google.com; s=arc-20240605;
        b=TH+f3lZMLu24et7+Exue1VmXoLUgr7BBBvNwEam6aRtWAQHbVQquJ/buWe1PweyGCw
         sMCZCYsZ+hA0o8Q/S7XJXghSgEmIAZA4zfYnxZmb7DJKbyQzXd2OGQCN6dpckWDh98ko
         f6od6W6nlt7HdXPOBXNO6kgY3UsCh9QtQF3m1Q9fgSxFOpnElU5KJT35Xv4xq/5MCrPm
         xHx+AVbRli+99Ybd5S+VFq/+j2k3WBLD+EswSEM2PHR9FS2ZUhU2medJXZqmdrTR5lG5
         GgIshA4LwUTwYdL1ugWrEuZjxnJAxgEE1dJqrK6lY5+9CSk3fT4MAAkW2Oc4fx80/M8b
         I1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BchCeEPL8wuRtLs78ZrLwBtVoYzaAUcUsNidwPxVufM=;
        fh=wTRICrTdeihWaJugYiaYuSDe1UJiQUR54ZO7ITU7V0A=;
        b=aLhcRmSAuVdmXJPoT5weF0aARy6AnSpVBhC4hZSBpNId4Pfyl16YNmo5id6WdYIouw
         tX887XT6cNO0hKMx3BQfCbkh4kq1o6gcZG1sCdsCn5xPq19lOLtXzuwTXZxQIJvDddRi
         Dof7ZKt7tggGDPNGTDoxR5TjZ5ItZxIGSYyOXe278wNXyqzFC+Eo3jZGStFpBp8GaLAG
         pRVDAivWyHWwD+Aynj9sbh6pobBHL9nXTzGlLvTfXIK4q8gUC5up4XLlS0f9/HmYOFFR
         jzEtic2+ZUScXB4E9IxAoU0/uhnTtMoLde416/M8GjBUsm44LaxcnhYDCdD78A9yNQjo
         yPsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NJOSF/Ut";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef18c34sor4411191b3a.4.2025.05.05.11.16.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NJOSF/Ut";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746469004; x=1747073804; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BchCeEPL8wuRtLs78ZrLwBtVoYzaAUcUsNidwPxVufM=;
        b=NJOSF/UtbryQbINsEWVMiTpSIuumUPR9KFK/vAEQpS/RUU8VByecCiDBeyiqyms9Sv
         p3D96mT4Zt8Tf8U//7OTq7j+jPRXPk47AqUekLt4JdgDQ/10If3lD7MR/WIutflvfNwY
         tn03uiy1d742HUXkG2v73YizSo2CVQAbfdfq6Uw3z3TgKDvEN6Kako+IW37EejZsxTOF
         rPpuO5Sn8L3bIvNNo4ZGzrKHomsA+yk/0AgfmLd2a/u+2NQYmrXzShVf61rpui+YL0p5
         wFq68ql99NFft7uS4sY49swIT+i4E7fRE4z0CCLqIc47grjg3XKpBFu+7tIcTXFMy+9G
         BqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469004; x=1747073804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BchCeEPL8wuRtLs78ZrLwBtVoYzaAUcUsNidwPxVufM=;
        b=bP4wQGLLdIHtsZCUyCKu6O7vQ8uDTl9Is03ezeEcXBxX3egPiCd5WFC/zOA7xY/XUp
         K38Occum7IUekbV5+R3etRQ0cVoNRVx4a6rbLJs7esGRmyE8IVOJSgi6+L3e7HUY3kpm
         Z+1cljPBbIwOBr6acOYzSPfypmZWg4Az33BcXvO5LW5N9cKam/ynBo3qtvXMKTB5ae/O
         BDlgAKs0SIvkq6eVQOo3agR0Ce1lIl9P8q4ukjfEkHyLCUR88Q5bnS7R7hFoRb9Cme9W
         npiNNQtUTvcswtW+8fWfXpAKueHEsEkQghy3za05khLVLArThvEGocab18yo/o364vMW
         KvHA==
X-Forwarded-Encrypted: i=1; AJvYcCXVJ6BctWSDYuvtWeKOcG6Zf5l9PfHolwbgTlWrUEKSkaSsIFGOu13Rf5Q98fw/AECK98O0+/wLv28fbQ==@linaro.org
X-Gm-Message-State: AOJu0YwAqwvAgwMUNGVGZGX4HmQf9gGCH/wQMHsYaB0+ympFpa/LBoPY
	9c96AB0UskBCCXaulBo+TaPEmzHRts8c6E8h45stssEJLzLkcN8rbTPvkHKItaEKX18XcglUala
	mDJw=
X-Gm-Gg: ASbGncvPQoliqnOhUtBDrlGihzzaUfOjgWPJS6PnzDxYDhiKa3ae7IHWVG7u/9WjPFT
	OUTAnjrHfQhv7m79yCoibHg38T+6APy8pXxVP5OIGIN4MjfjnXLXDe75E5VYdo2Itb+7dMH6gSf
	zHULzuEW4ecQRyvf/7c/KJe4G/YUN+6KMQc6DTnZbeg3mt5m1EaugJZbDaOm+VZp6sCyvlttNW5
	2q8n3zXZCdjZTAKlp5st+jNSurXbCqvSBmZme/qscucsTLO//pktQoQ2is0mB7LjQ10MnJp1xZ4
	p9+BeUFI8+mblspfAWmgZP57/kAkn3GEmr5JpbiFgkIoH4+zpojhdjev/tRXBem3289XG6ltw79
	KSCleOmc=
X-Google-Smtp-Source: AGHT+IHLaJqv/nTfqTpCIyc/1kl9cKYSzSNidERZv/lJL28Ems3xAyS3U4DNz3L90vSb0ZsaJ7JV0Q==
X-Received: by 2002:a05:6a00:ad8f:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-7406f0b12dcmr12173654b3a.7.1746469004375;
        Mon, 05 May 2025 11:16:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbe30sm7373448b3a.62.2025.05.05.11.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:16:43 -0700 (PDT)
Message-ID: <a4db0117-ad89-47b3-b027-9c4e8cdc45ac@linaro.org>
Date: Mon, 5 May 2025 11:16:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/48] target/arm/helper: use vaddr instead of
 target_ulong for probe_access
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-17-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-17-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vik/ZXQDeJu5

On 5/4/25 18:51, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h        | 2 +-
>   target/arm/tcg/op_helper.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 95b9211c6f4..0a4fc90fa8b 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -104,7 +104,7 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
>   DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
>   DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
>   
> -DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
> +DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, vaddr, i32, i32, i32)
>   
>   DEF_HELPER_1(vfp_get_fpscr, i32, env)
>   DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index 38d49cbb9d8..33bc595c992 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -1222,7 +1222,7 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
>       }
>   }
>   
> -void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
> +void HELPER(probe_access)(CPUARMState *env, vaddr ptr,
>                             uint32_t access_type, uint32_t mmu_idx,
>                             uint32_t size)
>   {
