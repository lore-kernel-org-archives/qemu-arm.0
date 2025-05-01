Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp410678njj;
        Thu, 1 May 2025 12:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmVANZizxJ07nD6bTJKxWV5+Kxk3M+SIuhCiBA/mKyztIfDZd/rXAX7SVE0jHmi9tISY7r+LhfPMpKlw==@linaro.org
X-Received: by 2002:a05:6602:3890:b0:861:7d39:d4d3 with SMTP id ca18e2360f4ac-8669f967ce1mr48673539f.3.1746126277112;
        Thu, 01 May 2025 12:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746126277; cv=none;
        d=google.com; s=arc-20240605;
        b=jKRUytM91FfCusg40MhQ/TNXHDqFjJgbfVQfq2ZanJaV6w7yvQNEYwCTzwPq/ZGx3q
         cx/jstY1c5usHjo4q2/MkwLHeySNE+As8r7ZtfMfIAHOihKOqxB2qv6M5zLO3t15oY8O
         SGwWlqBDHmadP/7ukW18kKmGUy8rLyt310mLObdRfymTGnmwTezRd6ktW4huIMKG4wko
         uQYg4gOgXl6syTIdo/QbWZuo28U3WxUfTPIJDC61KA9xjN58BWymulyX3xSZcQRTmRFD
         Ef0V6WhceklZNLujixqkissFuS15DCkRoZ3+qMG5I1Nv10JjuHMdRFX7Elb5VI/wuilO
         BFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=K4YDmSyud6q/pard33P/Y1HZdOYsUvHM646Z9mKyr3s=;
        fh=i59kqE0Zvepjv4wHiwCdpnmrrmQ1+IqeacuOFIHkw4U=;
        b=kmuTSbxh2ieN+HOSsxGzKWzg83pBv5/+K8YDlu0BRelRgaZej+lscjVIUXrpvmbTl7
         XzRGcsaXL5N9CfXk21raMVHnvUfYpcXDf0FF6ZJSPQIYqlGN43alYbRK4vXc+g9eJBF8
         DjY2u+GwOA7KaudgTKnKuyTa176cuNGTtV2QG9ltQSHlxM1DxzBjwVzuBiylUaPZD/I3
         JpicRj1euhLHgQCDt4TB4CkE+Af4P8czSC51wZSb349JrxR2ymzxpkWN4txMic4YoAnr
         zSzvW/+wa2laliAjMLtdb7cBuE4P8OiBl/KSAINJzeGQbJyboMwS6ncrtg/LAHENdk9H
         qFsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcGGQoeg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ca18e2360f4ac-864aa2be2b1sor62474139f.2.2025.05.01.12.04.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcGGQoeg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746126276; x=1746731076; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4YDmSyud6q/pard33P/Y1HZdOYsUvHM646Z9mKyr3s=;
        b=XcGGQoegReHclJxtbTKMe/tsBn2fagD7Px6u6mtZHumRWI6oFxS1GS1z53up0X8q4L
         SR/Vb37at/yB4K2sf1xnmIqQ47wnCAzTE28Wb993FcHyIuChxCUmv4VYs4tA0bXf5bJc
         mbhux5h/pKoWjzO1K9VhqhYmZUb53EvVqaR+y2hJ/OpDcIwJNGl/QyPQwFtlfmqZFkmO
         nzA9gkqllsxwcBDC/gOkCmzgIUABoA++U+es/sOyexzq6Z38SmMbE40wQ30BezrLXo+q
         iffkQqOHmV2n/VRZLMkvN465VZ3ARum2pycU6FCKDa/Qb3kGBMvuDrxshFsyoHM4Sw3n
         cLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126276; x=1746731076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4YDmSyud6q/pard33P/Y1HZdOYsUvHM646Z9mKyr3s=;
        b=QKdZ8Iv9E1ZjUlK8bnhj/C6cEY08WWQ8zjtAkfI+4zSoQ/BxItyPSljvPIyogPsJWB
         eculj/IzHEpgur/8DLXvFA1jAJy20wEyhPvQoAcGtkWPZ6rE4MgX4MsWE8dR2xwRbAVd
         bm7XjmHSlgzJ7NXJH4EYCUzC6eqs/j7EfUBVZ9mXp0OK0DAa8RB2PrnyiN/zFTkTe4bI
         NTh8fdHJ2pAXO3fAj4wgFdoK28uZ1CAPjEM5foNmeX9was6Rj6ZRVOf5Xc8F0Kd60XkQ
         UZsXJCqePrf92/zPYH2IfZVLXKz25T/fVIeTIujok579H/NBfU152yzmzX8NOaFhYhm9
         mNnw==
X-Forwarded-Encrypted: i=1; AJvYcCUmsilcSdHkOU8Hik8ZIvD4iFMTAsWQ+2hYHtfms6GFjOrgBkdLZFjjrPGldTD2K1kInfhj0ssOKrsqKQ==@linaro.org
X-Gm-Message-State: AOJu0Yzr+2q3FT5qr3hGHjCdmzWvvbE6dAO74upZFkJQBQRoH5kyR305
	FAB+ei3S0Fgm8BmM4FlPMhpWew2iJemvf/6qLQXW3NHsW19R9v8wSCSdo0aIkwH03A==
X-Gm-Gg: ASbGnctM13yFQ458DfS40Zy1gztm5KmFl3wJTpe18OK3Asg366C4+gEfJWjC7OxvXFO
	kqQdkCVlRrvAkCwoIVBzakZ9SOWoLrkm4AlXX9BrHDpykmNGnE+8ALfEtyBq0X+5HzLRF8V84y3
	mR9tNt9eZbUVhc6g5Qice08l2Ajf7DQW1/RhlQpTKDG5+YweMWFzRPCeaHJ1z/7G0YJun7GRT6M
	VtrLS0+GScejlboJg7nrlJxU0Ukuh/Tos4GnXq0/yBq7v1NIUIpkyBN/uf772PJVGa2TBV/a9rY
	3z8Dep8Bt8uLXcpfHHiWuBou0j2qd+w0D0Z28dzvAq7x8Xv7i18MB7EzjVsFeglpPIB1iC4FeUB
	bvPEsNxwe+2bHLA==
X-Google-Smtp-Source: AGHT+IES7gfo924cu6NmC6Fpw1p44/31nhllgml6j8ZZP/Q+e4X6+bk0kLicbSEp6P9W/EBJ6lnsOw==
X-Received: by 2002:a05:6602:401b:b0:85b:3677:fa8b with SMTP id ca18e2360f4ac-866b424e060mr41003939f.13.1746126276702;
        Thu, 01 May 2025 12:04:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cda94sm3393173.18.2025.05.01.12.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:04:36 -0700 (PDT)
Message-ID: <e8976a2f-b050-415b-912d-3f2231f20fa8@linaro.org>
Date: Thu, 1 May 2025 21:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/33] target/arm/cpu: move arm_cpu_kvm_set_irq to
 kvm.c
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-7-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TWkJjOBB+Fxi

(why?)

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm_arm.h  |  2 ++
>   target/arm/cpu.c      | 31 -------------------------------
>   target/arm/kvm-stub.c |  5 +++++
>   target/arm/kvm.c      | 29 +++++++++++++++++++++++++++++
>   4 files changed, 36 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
