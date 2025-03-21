Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp494695njc;
        Fri, 21 Mar 2025 11:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdMZZnUr5xDaAvgop1Q8WvLBo8GZegIECnK3vqbgQ4cEY/YP/d8KMtv7ya9AFyIeUTFDRLAMsWpQxJEA==@linaro.org
X-Received: by 2002:a17:902:ce81:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22780c7accfmr57663265ad.12.1742580075994;
        Fri, 21 Mar 2025 11:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580075; cv=none;
        d=google.com; s=arc-20240605;
        b=UAcjAkWYtiQCO5cUoLXNB8dcvzijZfAXYikUkMCF137Vkw9m0EG7Ip/jeCW6g+Rj90
         ReoRkNsb4+jbPxCUk4gvtL7jGRn38YuH47DSVWBUT+aCE4lcpXMg/mX/dPEJTuDAm4A0
         gOQZiugNpPA8DNNALBO3Yt2tsnpxkujpbu5Xxn/SV1raQGHWNwiDGl9ReQQ+e9B5u3HO
         PhMxs2HynRPLk2PEG1jOHux+oUwscAO4yDSiWbOQO0rzJvwx606z9K0hhlqz518kkDr0
         rpqpsA5Um5SeJiDQOg7U7JbDSDJtR8E3lxzulfSPw/yXzZXzy6MFnL10p51jruN4Joo0
         dDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UvO9Cxq0zExKjE4A3JJ2r35XbqlYJiJsGb+VZu5umiQ=;
        fh=V6FExYndEh9jN1D1qJwb4XYmlH1XwW5Rf2U21kY++uA=;
        b=L1H4VICzRY5q9vEmpbGnIaXSI8xch5tvmDKxSDMzyRVvseBsTl1D7vNXkZC9HRjS3h
         H0Zt0Coar9JaieND/NDvF8xbNpV4zpFCPGfLFzIFu3YrvirMQdcAvFvrVO47YrctyrtG
         4lIwgFJn8BqK5Yd0d8ySZ2IkhzUMwNF8g2r+skFrUMvPaObk8oMcvnE8O/N5VRInw3Rw
         r7+AhgaB2feOEA/bKZpCGhSoFD4710388if6OHp9m86MEmQUM2E02hDzeatUrOYv/A8V
         6SuuDq6ihmwXJxIImhfOmVkx4J4r3gPpEugO32G1pJoXwgGhpXbmksKN/164W9lvCCoP
         d6Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVs9ouKP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811e6262sor17693995ad.15.2025.03.21.11.01.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xVs9ouKP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580075; x=1743184875; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvO9Cxq0zExKjE4A3JJ2r35XbqlYJiJsGb+VZu5umiQ=;
        b=xVs9ouKP13qCOlU0hhfVwPwXEglGkiA57uy7PVlWwIiU9KxrosXNHyYBkRTFV1SMPS
         xCQrAv3F4Xh9endEIcok3peZrMqPM+sO7Q5nl7RS9c1Tt2lblbUMMfEr28gZAeNEGLOg
         4j45DymGh2K5byrG7gDOWOE88pKvzqL8EWzOhQMu/95Hzo8ra163eig57hl+UN2K0KRX
         sf9Bw0Cpk8wgFwGf+mUAxrO5ransJ7nisjijtNHASkqMdKfq2h9Gobq5NbdfQu45rywA
         xCfdOB+h1USbjHQsCFI9o6xfKVc0chfMT9wDPuq2D5JgpXzmSows6irHw+bxHuV6EhM/
         pOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580075; x=1743184875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvO9Cxq0zExKjE4A3JJ2r35XbqlYJiJsGb+VZu5umiQ=;
        b=hPfJFcDfj+TzXp92xr9ZcNwkuz+fU+O3pQgqiF/Ku81C5SXUQERkvDyo2BFfKCuNnY
         UvMAcmDiOQOl2ffF2/yUDvFUUaWeh67KSSqf8cPpx7MF6Ja3acdICByd2rc4jv98I2qn
         kxAkE8dNdA6T7Zonw0Bmeu+78ua6Xf6K+M5gw5x+1Qf3+yuM+IiELw9Aw+ncc446GolF
         i7KDEtngRFyzWmGb/KR6BvdEYn+fFk/aHqYI5/WgvMVtkaIqZMlNfCn7G1xYtTlHI/MH
         MzV1yWgq0ijDu6mSA+ypBABX33UgZY9aaYHddoMX5LMnnMFRSKZdoe8crZVMaRTsUydQ
         U9vw==
X-Forwarded-Encrypted: i=1; AJvYcCW7Mcp/N/mCXUKCS3FWqod/eRvhTiBhC57O0vUB4voMqy3K9oqC9Fa1J85J2VAbYU1rEfQD/TgF5Ju9Cw==@linaro.org
X-Gm-Message-State: AOJu0YzMz5ybf8Ef0ldeHp0KtEhon39ObquVIzUezk1zK3I+FKxzP6ZY
	aHXBpXDijYuSnY0qJk8O4QzYlKfq14sbqjClZ4ifxAtfOG8o3RidHOvAE3MazTlV7g==
X-Gm-Gg: ASbGnct8Tese6tQ8mtDKtni2crmWV91sCukJG1+jcddurAYqI32RtiiH0nXnkk8pBi0
	sMYkRLhRhDvZfRRuyY15iEzSyJ8OU6UYupPSSJ9QIkyQVRj2ow2vhu68Cjy2C3UANijNtkls/mB
	7RTJXi81OkiQgEIiXT7/xOvVPskVM60FOLzmkM909X02j1hKuMJw5PrYgCNVRcKt0uL19pnFETg
	sEBLq//my495bkxrymIm0HucTHo0BPEyVYAk8fOcL1wxViP3FIOHA3mWOdwbS+PFePtPOVQMKZp
	0d57g/dVBH+WQYkMcSdRbZqxtKPDpQQlDay0ltG9qTJLG8iZza3/RNpt1KVl7XhmH+P8iPWOcbZ
	lzz1OXT9o
X-Google-Smtp-Source: AGHT+IEVQBUewn2vltOJjnD3ER07wbBMzpAhk+4Mm4mpvnSWKKtf7uMQAJ10PBB7+PuIE2/DxZNccA==
X-Received: by 2002:a17:903:188:b0:220:e338:8d2 with SMTP id d9443c01a7336-22780d83b25mr69121915ad.21.1742580075407;
        Fri, 21 Mar 2025 11:01:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811bd143sm20164975ad.150.2025.03.21.11.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:01:14 -0700 (PDT)
Message-ID: <0c0197de-ac97-4acb-ac67-ae6011e6f9ad@linaro.org>
Date: Fri, 21 Mar 2025 11:01:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/30] accel/tcg: fix missing includes for
 TCG_GUEST_DEFAULT_MO
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-13-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9ZrU1XnEY2DK

On 3/20/25 15:29, Pierrick Bouvier wrote:
> We prepare to remove cpu.h from cpu-all.h, which will transitively
> remove it from accel/tcg/tb-internal.h, and thus from most of tcg
> compilation units.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   accel/tcg/internal-target.h | 1 +
>   include/exec/poison.h       | 1 +
>   accel/tcg/translate-all.c   | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
