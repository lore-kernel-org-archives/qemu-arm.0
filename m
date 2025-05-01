Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp319131njj;
        Thu, 1 May 2025 09:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiOj33X9xFcMbn0iJI59PrreiXR+1XaHNMr0KTXBqv9hQpxK5dt47g/iMYGKh7Saip+99YpOPRPZE5Ww==@linaro.org
X-Received: by 2002:a05:6a00:a96:b0:739:4723:c4d7 with SMTP id d2e1a72fcca58-74049273491mr3831367b3a.22.1746116656298;
        Thu, 01 May 2025 09:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746116656; cv=none;
        d=google.com; s=arc-20240605;
        b=YfxNWByi5wAMXi38ee/S6AfiyauWIvykev5PFocmtsavokGLj8RNhCIjW87udZeb3h
         v5UYG/bBlhplTB/y3KdwwO9hsCby1uGdqSehU8XATpyykVCNL1ABpFRox2bwYmodmHGv
         ck9tdSpFeZxhPkQUR93Gd/OnZnB1pzqQqUyz8UXYj1GDgEAUvcMVXtuuGlTDvp5FB4jW
         7Phd/XPYx4sqo5Tkr9Hx7+ArflVQQy9Q1pnlVtS1yHpJYI9xa9xy1ZZyA8+8/XkVOVct
         2PHj3zXhQ7Xhi9R4G0ohjqO2Pijln2amG9tGrerNhiLG+f5useJ3a0uZFwlpRBB5Yn4x
         F6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8shYTt0huEPDIa1HB4ziLet0D+S6VQEydJTXu8w/URY=;
        fh=6/hMFojNAZ8kUFDpAiPOHIw5cQVlCNZwauVQCnyMbe4=;
        b=C+T8AYs3tiL/gfgqQoXWjsXYqgJODsNRT4Z78ERgOWWBkZOh7JWCB8ZP846t2hxZnl
         8Z/oFY6OgZEKuRGNdwgWAjgfvmmJPoW/CX2S3d+zEtLTMalUM5eoS/lLmUDEGMnX6e1Q
         vsE3Kg6rZBpGB4TfQCyjlU7lxxXdMpWg7zZOkxND/N33t4bMAETlvT9WAbx8n9nhsU5o
         IidAUQl8chSErvW8P7p9JjKqCDC5+h4tgc4pR5mayAFCqDe4C1ywMFP4VlgQWZLdk1FQ
         og5xubfkHJ+mO7iWaCztPjpbHsqJNeOqUpLt+BNXW4hh0Bqma5/xhxW6u6a3sqA4hxZG
         XZww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IFgS0Ffk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e59f81asor638600b3a.0.2025.05.01.09.24.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 09:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IFgS0Ffk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746116656; x=1746721456; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8shYTt0huEPDIa1HB4ziLet0D+S6VQEydJTXu8w/URY=;
        b=IFgS0Ffk6zA7n4jWpl1/vHnZqsvwfPgQV3wPbzmZHjgAisly7yXZKuonASmds5ooL8
         MCmJ72GJZB1PAPYwIefCtkuOHEYv3znpvxQ6urMtQ3fu9a/cjTsaOVJqLiMO8cDkOykg
         x7QmGHxtneIUWXEn7HK1b1pRE1dypcNKvS0vRDBKoHKHxh9sNfMwbsYuoVO1u3EzH8Aw
         82CUGvA7zqfTGdg34nml8sQeunUoba31uWkOFVPmS1HGFolD7qlvRhvSUgwOljWsHgaJ
         Qhy3rt7pQJ0LANWI4eQq/WBbRsEXDSpYfyk8Wfae789DregwXR5o/AndGWOL02oOxiV4
         FNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116656; x=1746721456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8shYTt0huEPDIa1HB4ziLet0D+S6VQEydJTXu8w/URY=;
        b=kmoTLeunwIiGGOwORRWi3HnE0bwJfIiA4dvX4cA3D/1gWyskqCwiSjsjoH3t9dpoah
         80s5vPji/9yAN/zXdHRiBENbqVz1r78COPaHFhgCRINi/KwTs3YFZ51g/Tk7EzGVIVXT
         Z7mV4UelGQdW1ouFTygrwNQg+3qmIqoq1h605gOOQuQL1mJ12acqh5GlQdEIlSAReRd0
         wRq3vqowXaOa/onXlyEJQYafR2o3ZkDN/H6ZVMGypLhwaiCpU90Oz4N9T0sDCTHa+5vW
         hUTm2YN++HJy7iFXqakvTNL2F2cHEZP/5nWzOvMFD8iRt/qryJBisuwouF8200+454hz
         21cw==
X-Forwarded-Encrypted: i=1; AJvYcCWLoBx98E9GllYhD88cs3vcKiPE3khUFGJLvR7SFPi7f0gzt00y8fahuCSG6O4wyIQt8dntwfZ72kWijQ==@linaro.org
X-Gm-Message-State: AOJu0YyinjzemrBLfwWGEjDfPhB3BFmt01/nmAF6juUCxKVGMyEAKGXF
	vGARYgF7N0aqxssgZ+SwIV7Qn/MaIidqLYraHZwk9NVv8/ATjfTjPfAGuwGPzYv7MA==
X-Gm-Gg: ASbGncvYFBmY7mQSNw01zGaeFJo/06SVv77AHaaJcWb6pCnrUvU/yrSSIs3OtLQtPEG
	Ih6KlwQWrN5tR777784gYAluvd9jS9ih+ENMhhLYTw2qgXlX9XPK5nQA46XJJ2AkuysyLb51G+x
	8iI7uk2HfYx+iJOZRPLDUtmlmBd1aG9ET+FkgC7VZh5N4SApeUZzsEFCAwMssUHdZZzGzdnjLOQ
	rQNdQQuNobHLhY0FuyFDlfNNec+5yzF2vpROue/ac3/eDSD+B4CJCp2T0OY7AQ2wKQKEGNgxC0D
	1zKbh7zRqiajP39wOJocfxstp6xNSfbdPu2XRPK+XVmtwtybFAYRQZcsHyXAATYeqVn6Jr2UjRg
	yqQBJcGyo1MYideqWow==
X-Google-Smtp-Source: AGHT+IFp9RYUi3DTgZBnQQd1bJeJF3D8RFCuafFxfdL4LtCEbdgaydTH3sWqG75vv9BY+KKGRU4EGA==
X-Received: by 2002:a05:6a21:6d8c:b0:206:a9bd:ad7b with SMTP id adf61e73a8af0-20bd6556ebbmr5219945637.7.1746116655846;
        Thu, 01 May 2025 09:24:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d6432aasm908860a12.50.2025.05.01.09.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:24:15 -0700 (PDT)
Message-ID: <a6fdb501-438e-4591-b166-87c8dbd14887@linaro.org>
Date: Thu, 1 May 2025 09:24:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/33] target/arm/ptw: remove TARGET_AARCH64 from
 arm_casq_ptw
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-31-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-31-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 435lkxvGd5Wj

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 424d1b54275..f428c9b9267 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -737,7 +737,14 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>                                uint64_t new_val, S1Translate *ptw,
>                                ARMMMUFaultInfo *fi)
>   {
> -#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
> +#ifndef CONFIG_TCG
> +    /* non-TCG guests only use debug-mode. */
> +    g_assert_not_reached();
> +#endif
> +
> +    /* AArch32 does not have FEAT_HADFS */
> +    g_assert(arm_feature(env, ARM_FEATURE_AARCH64));
> +

I don't think we need an assert here.

The ifdef for aarch64 also protects the qatomic_cmpxchg__nocheck below, because aarch64 
guest can only be built with a 64-bit host.

Are we still able to build qemu-system-arm on a 32-bit host with these changes?  It may be 
tricky to check, because the two easiest 32-bit hosts (i686, armv7) also happen to have a 
64-bit cmpxchg.  I think "make docker-test-build@debian-mipsel-cross" will be the right test.

If that fails, I think you could s/TARGET_AARCH64/CONFIG_ATOMIC64/ here.


r~
