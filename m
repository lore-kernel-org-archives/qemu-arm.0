Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp323216njj;
        Thu, 1 May 2025 09:30:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/IPli+0rqCxJpzPdUhBmfRkA5Z+uCyQFIKoQQYZvzAHr263cp/7Ah6uijS5U2h3ucMvcjxfdNszYDKA==@linaro.org
X-Received: by 2002:a17:903:1a84:b0:223:619e:71da with SMTP id d9443c01a7336-22e08650c49mr47553235ad.49.1746117034502;
        Thu, 01 May 2025 09:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746117034; cv=none;
        d=google.com; s=arc-20240605;
        b=W1edOGsVsPpv+LEil5mQBqRtUehOMPGtPmYXUfb0zmf0B2oFbfdiS1dgiVxYTXlMTt
         cnEhyCEkwRk6P7KxJ96AIGotC1sA4/vq4sBMMABm6F0s3pasBrnmrR93vqnsJfPinYTi
         S6Ef/z1lo6raw1g98O+EqDgPwV9pKQSsgflOkVJszK+3EGLUn1qsXMAwNKfExNMkSySN
         U25nV3coPaevxyHXOwTP+KcbdYOzfR5LT6O//QUjvZnCBSLif0PiXRLbevOg0ZCT+DUs
         XvgW4aZh9yribCsi5mxh9EQZgyff0CgZsSN0oLwl6GiJHbicLtjbQ7tajfEJs6krkO6V
         52Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/b9sR/a1jkRMuRGB1+qsGBSWC0mmzSLV2+K1kJwm2vo=;
        fh=kp4EwnyqemIdVwAeSGc6s45acpqU4N2pwKgvtgrHa40=;
        b=ayFVZGryGLw/5krIC7fGyIX8g2U3wpOUrW/BIWLSjnSiHTEpfVEI5Hl1qdZ53sfLFI
         iSlc9t7cOcImsIywhWkvnVJ3T/jzz8dEhNKMo8+w4igOpU7mUYVp8RC9IX/KDEoTNhLt
         R+yu1J4yqe2cOSbWOfj95FK3pNY5qx9htZ2nsNnk3kNw2ubFBYn+kn4kVoUYlj1U3nxh
         ExMTG0/eteusCY8AX+DYZyx54MTUvFEj+74ECqxLjMLn9KZEeVSvgB4JNH21RhOoMteI
         OLZsNHhx5jGqfsepSGWNYHs/FbImWMZfXb7koaFuOgPuue4HO1nExswcKHE8mijhWr7g
         yhHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEb49IgO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0efafsor9340535ad.5.2025.05.01.09.30.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 09:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEb49IgO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117034; x=1746721834; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/b9sR/a1jkRMuRGB1+qsGBSWC0mmzSLV2+K1kJwm2vo=;
        b=aEb49IgO+/zyLbhYDaLSUvxvQ/XH4FLGJ27ta78uiRFciP5CEfmt/omz5pLl4c901k
         eqHVb+ONutq+wCrI/iULzcJ0Pw3GsLEd+R5LZTqFPQ/zKDd7iS4EfHHtE60DL6HuK6DJ
         ayHG9xkOLm7GqeqhYHsU7KB1HRXbctvOtpRgGlerRePWXsVWs3zkB1FmzZw3d9ncqWlO
         Jz1gjh7yl3Vn94ySCVklqgxXYEZNownimOXQMIAIA/GqlAPx65mJDNoF5zm9RO3dW3Z8
         kKO758pcoKpenvhgbIQTcH4yPX97WQ1mmgOTctTYNV+XEEgMRnLd1h/4Pkv6GxTNS35I
         bqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117034; x=1746721834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/b9sR/a1jkRMuRGB1+qsGBSWC0mmzSLV2+K1kJwm2vo=;
        b=ibgKC82jGGuQnuTBCEDbXsetJsclzoP41546Bwbio5hQe3m9SbAC0WpQ2kJYm+EKGG
         URw3sUc3bn5R69Fqdij3//tvMvgGpfdxcbllLiRuFolIIKH4b/q8z6cVluryqiEr0B9U
         4sZe0wd4UzVeUCCXhmncLOJh5St0RDksD1z/loXeAKb72yP55mSU6vIDc6l3XfcbWDBa
         /VusPtYOgrA4wUZtKM4NpAxnmD4UFTGMpRIuwr9wu/KpDFfqhs6R4WrJ1jdvg4z52zOn
         MHwQuyQmaEyHF1QUUytrc7uxRGY2GcJvtQnQtFHFS/mrZKIFl8byFRuwLvlB71ymWs2I
         PYsg==
X-Forwarded-Encrypted: i=1; AJvYcCXrJdznCMlJjdHIuqo1uTJYJD+BaJMwBMvV+MzyFK1O5NOSh2uROk7BaQd8w/fp5ltieO61nOTUx/4DdQ==@linaro.org
X-Gm-Message-State: AOJu0YwUZxlkLY7VK9rWJ5h0jkopJWQuc3Y7/WD11gPECfv8mYSUhDR5
	MRsnymw2JhA3ZO2JQZQzqFVrOWXmTw1OaJTAsMgAfQsnQjcCqiTHcNkXsIhknwG3mYBg589gJTX
	gOkE=
X-Gm-Gg: ASbGncuYr2y6ixQrtrnjR3gPPh75Z11jISL4aB7KelvWYXzy9HlqvZ+/B5wmLZTOuiM
	hArDZvyL/ZSyMKQ8RFDz+/iWNCLcMEb99ULcpQY8U4VkrvTrxXli2H4SorLX8NpF3rKol1KE87U
	Njkrm5oXN8jKOUsIQLQI/x9ps+2XYDW2lodxcLYOnfjVc6z6HeUQXbY197I1CvD62LZnaRUJCp6
	T+KpxdoYKpg++ocmaFehYJMmgHuGb+qjQK48CSkeK47IMBAFiQyM3bxtZCGTdeOro9rk8d7XPi7
	0YumWLpB0d9zVidcGbUX18Sv4ySVplFK+qyRk+2AbdLQnO4X04tq10GfMnXJI0HnLdRu8d6IQO7
	GLHwhO3Y=
X-Google-Smtp-Source: AGHT+IGiCAh52t7LH0a8SvFCCkcE0hYgB+oEHY1fvkQO27qj56jGPcQbgqGDJEMwfRNN4croOPIk3w==
X-Received: by 2002:a17:90b:3d44:b0:2ff:64c3:3bd4 with SMTP id 98e67ed59e1d1-30a41eeaed1mr4379678a91.31.1746117034107;
        Thu, 01 May 2025 09:30:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc7bca9sm8693335ad.180.2025.05.01.09.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:30:33 -0700 (PDT)
Message-ID: <1844146d-18cd-42c7-a095-6d1b64ad6293@linaro.org>
Date: Thu, 1 May 2025 09:30:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/33] target/arm/helper: use i64 for
 exception_pc_alignment
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-14-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Wa9VTEx3UEL0

On 4/30/25 23:23, Pierrick Bouvier wrote:
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -49,7 +49,7 @@ DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
>   DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
>   DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
>   DEF_HELPER_2(exception_swstep, noreturn, env, i32)
> -DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
> +DEF_HELPER_2(exception_pc_alignment, noreturn, env, i64)
>   DEF_HELPER_1(setend, void, env)
>   DEF_HELPER_2(wfi, void, env, i32)
>   DEF_HELPER_1(wfe, void, env)
> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> index 8841f039bc6..943b8438fc7 100644
> --- a/target/arm/tcg/tlb_helper.c
> +++ b/target/arm/tcg/tlb_helper.c
> @@ -277,7 +277,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>       arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
>   }
>   
> -void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
> +void helper_exception_pc_alignment(CPUARMState *env, uint64_t pc)
>   {
>       ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
>       int target_el = exception_target_el(env);

I think for this and the next patch, it would be worth extending
include/exec/helper-head.h.inc and include/tcg/ to allow vaddr.


r~
