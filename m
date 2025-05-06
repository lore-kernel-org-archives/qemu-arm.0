Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3158650njj;
        Tue, 6 May 2025 07:28:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBBUE+IrEaOucaYXnLsD6zGXDaT/CALgrdUfOjrj/OYGSEBhfad0p7961ngY4IzW11FOZz2NbHzolH1w==@linaro.org
X-Received: by 2002:a05:6a20:9c8c:b0:204:4573:d853 with SMTP id adf61e73a8af0-20e96205d7bmr14754393637.4.1746541718114;
        Tue, 06 May 2025 07:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746541718; cv=none;
        d=google.com; s=arc-20240605;
        b=QrCaullxyUt6G5MuAD3L8NnKtdI7ZZ1cdGiJlBWoSljF6nSZTiM1/i/92wGtcDZ6Cm
         A+UV00oX+InlnONQ/wGUzh2EaDm0Uy/rsm+9EiDx8eCa7/+qmLn/6O9JQisFv3kDcM2d
         iDomoepgfjTQdi1FMufJ06mAvwsYVRRXBTaf7y31Yw7cEKHCRv+x/1mWm9SS9zMRZzSf
         q8S3xjc5hghoiJucIn1hwGXG9WXw1tHi/+WOUxrn80wk5sAMvxw57RCuAmIQw990Pmnh
         932LjP8Ic5B/watwgc0RiSgdTvPHPeovQ2c4Z7KpsF54W+zK6Y3o/o4Q3xyKgwytvsov
         DoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bMPyqqctJRKXmx6qPaaZNnXEXcsZ3fgKNTkMa1UTq/0=;
        fh=vx2zd9loOsTv/wQqnDLUhC1AlUhOmcxxofkl1tZ1CtE=;
        b=hYYl4QyizVk+h9gikTJGTSx2d6degXM4znLwF37NI+rvLMJhy1/KL2z422vi3e3/h5
         PWRc6KXfLSp1MPLkPQ19BVeV/s+pkjJCOR+VuQ5Rwk+bRjHknfXuodZouCb5wfYVivwH
         uVNIiQ0rrS+PhKGtHdqxUhhbW6Pfi+Bn1tOqCjqa1Zd5rJBPvZwwLVYfw1UJSUrZ2+Rf
         TKeiv8kuh+amfWjsEYjgsY+D86KvZkHOJyWkCM26K2Y6wgVwlBU69gqFbi2+AU1bvRPG
         VNhgB7YrzW1VnmrwrY9qDYjgKYppEoPenE/4JvP+emyuKzCFMA+Td2Ez20gQb6medl0G
         RRlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fo5UayJB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d0ed370sor5938629a12.0.2025.05.06.07.28.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 May 2025 07:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fo5UayJB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746541717; x=1747146517; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMPyqqctJRKXmx6qPaaZNnXEXcsZ3fgKNTkMa1UTq/0=;
        b=fo5UayJB/NzPo0NmJUBFbhURoxbmDDoj6ztRpOsHX16sULOyHWVPTXLFqB+MkJZYRJ
         7SrBKOy2xFiUE8oExr+v/ejMGWw1eAZ4dVP9FDmuQ3ljJLC3nqRwchXv2DomFGl0ENh2
         svWE8SGs2tF5hO/umig48YB1vtfCdXUfzVatbi16D7Xz6L+9TJnzuu132lBNTlv/kxME
         7FNYawBoMv9aoDhVmnyhvIw2/70hq1rxYSzZZPTJVsiXRFm73PXtzJgMiht8a2jFgDpm
         idXVGQ2By7xszsAC9xOPwNpcIoYhJ25V9IDM0QKaNxfTVgL0PlpJ/9pjhbg1wvEfgkVp
         ARTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541717; x=1747146517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMPyqqctJRKXmx6qPaaZNnXEXcsZ3fgKNTkMa1UTq/0=;
        b=b9tDCRU2Q61sGXd0XFWZ2LZZvYvclWUO1NyeE5kM4KJMbLB/k+8Wv8wV7jUVAlBxiT
         c+MkI/ZXjrbP48X+Vcf7rleh2d6pG1tuP+haHHT32hLkTheRFyZx+zPzOd8TiEDCrtV6
         1COjVavjNhYY2FFQyX9sgdlKNGV3cg3r6bPlH91EKX46SzO+Xr8hok9ZgH51NToGDulO
         xr38TGCzWkMCU3xXsmU8I3yKlOAFTBorHlmo7MfcCj6qnJq3nP4wFzEBCQj8olRzJoZV
         PanV3fhm2gz3h/1fX8ET6hMAmUqldIaQ3QeJYm1UflaWqtyE74G1b6To8Cxx28eo1ws4
         lm5w==
X-Forwarded-Encrypted: i=1; AJvYcCWj9kvh/w6WUAZT8qh8DYQKgrmcPTPb+EU4Id/J4gBwuPLmwDMilgwXC9EaOclgOdtCn/mnraY650MnZw==@linaro.org
X-Gm-Message-State: AOJu0Ywa0LRSN6tESQ5xSIoiinZ6ip8Q535Zi6jwhMbZRzrNSeGgCJki
	wZIzWdOj6V57ElraZwQCOhBhedWOL+xIZ5Cqd0ZvSVwMdGGgAcfVm2iV2Oot8hhGOg==
X-Gm-Gg: ASbGncvkU1uIEMxo2NT0nqJ8FYJGyudT1/Lx/PUsZLdrfGrfbgsh/U3R5tcJWlHlWDP
	AlM2KqG3oswzq2CDAEz0+DaiNxT6t8tPhpga+mw48hyez6FMcTB3leaxV0BmslrbQligZBR6IXr
	qRMODLmqwXxoB+lK4FLP+mHb7NjyTh1wOOvZ0X9okadGxCm5K5PkAg/IiqoLUEBBYBexeekxTtQ
	q835asjczzi7dU13cFUrl/c3NE3p5W3/zpk9sX08kwJaUoUzF/bij6lyTnP9ApQnCMAPvyhYngm
	3O9TEUvtnQG2hcq3dBpptiLG54CVTcsg7gAPR4PiSpIOmG386ZLTl53Vimmoj92nUTXMGapcd84
	lLxkd/Qc=
X-Google-Smtp-Source: AGHT+IFkACUswVWWtARWPDjK+IX4zNVwmBH/D5cmtDpJYn2aeM1KH+eEZ8Js0pT9+YQ9kx8GApJ7cQ==
X-Received: by 2002:a05:6a21:9981:b0:1f3:33c2:29c5 with SMTP id adf61e73a8af0-20e962fa3b8mr15015753637.7.1746541717650;
        Tue, 06 May 2025 07:28:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df2a6csm8979563b3a.81.2025.05.06.07.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:28:37 -0700 (PDT)
Message-ID: <c57928b4-e6db-43e3-85e2-02f055ed77b8@linaro.org>
Date: Tue, 6 May 2025 07:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 47/50] target/arm/helper: restrict define_tlb_insn_regs
 to system target
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
 <20250505232015.130990-48-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505232015.130990-48-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Q0UvnziagHA4

On 5/5/25 16:20, Pierrick Bouvier wrote:
> Allows to include target/arm/tcg/tlb-insns.c only for system targets.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
