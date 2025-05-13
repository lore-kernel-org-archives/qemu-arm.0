Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp408928njb;
        Tue, 13 May 2025 03:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu/qtPCwErRJ2YfCyYgEDFeZKzK6v/kqe3yDsKZs3SzAwouIJbNM3IoKkFcRDs250g1W2ChaeMsWG6Ew==@linaro.org
X-Received: by 2002:a05:6000:144b:b0:3a0:b65b:78ef with SMTP id ffacd0b85a97d-3a1f64b6931mr14233659f8f.52.1747131053762;
        Tue, 13 May 2025 03:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747131053; cv=none;
        d=google.com; s=arc-20240605;
        b=lQg+tElASi8qXlByjfs2giOeL+Okjz/02oBwrPAW4DkYboCRG9oJy373bz7DeDlUny
         TDpKi9yyaAJBfWWjYRtzzqMV9vbuc9B7NVcwjJ6jXzU72JP01H9GcXkIMqIVTs+C893Y
         PBzvq/OnbrZMSwO6aRBga+RlbDAy44NMNHrEvO7TVadLZ66nY4qqb+5lrLVpivrcqzTS
         z4gq9k6MEQCgk8lw2VYCZM5t3kZcNfn6U62ZwY2XNNiVWlcpeN7EvPiYRfv2EuVySWns
         JivC0mzw2/j/A9PHNmezicNU2SuuPEw5BXRnVkvAxk7/+qGQFxkZ0TFsUZvEVnFdQdHs
         DOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YmugX3GRqGD1c+UyMRnrvs+PUb5JfixmDAgVPG7ZL0w=;
        fh=cDYuFek2dbfsiu0qXggfXmPC3rFgZ0btDM2y1Yx8Hhw=;
        b=Q/cW8Ms7NXM/Tc7UlPwg7PTqu9ha1+DK0X72Ur4nKXJOLprS4xbbzWCyXDeIbn8ye+
         1rc/w2rvTtdO2wdZkARFYs+vVak3sL3wIxulnWQWriuTIDzAElhptA9RfQi6ZWX3o4YY
         GID31UZ3uNypqOrlioliKvLzntBztZYvJx7BhyhmH/ZPgPzYxJDZLy71iHpEJSzomva7
         B4VqRfQyHwA2iIhjNy8b3cyuGdEcynCWpaJkEffaIJSCgzLcrPp5xzyhUtOUdwmpBFkF
         XPIffxCIcU4je6/0saTsfEHRHZIfbCLoiGzDYTCD1QcC0lPWUIOYno/VKF1/rIul5MtS
         nAsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxzLylUZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f64c047esor1716305f8f.0.2025.05.13.03.10.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxzLylUZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131053; x=1747735853; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmugX3GRqGD1c+UyMRnrvs+PUb5JfixmDAgVPG7ZL0w=;
        b=mxzLylUZuHE0PkwCi35Mp20+h3tx/ASo/8Qrw3HzrILluuDUusUz7O9w1rVEJH1o/P
         0lpLxeY6N4HhocLt0ZrW3nJrijN2oZyIGl6LvfIwfIIwN9UZx+5pChy/JBAvXNlu6UXh
         4ysLdWZ3FwcBy/8cW2KSLtBwSoE2SgYQ+4XvkqW/KaQI+MLAt1GRD36cdKwrljBry+f+
         Z5XiFrWhzz0/FRngj+XnRECTIBR/66fa6MQ0DRUJlWPYSoUAofEpzZWM3PMnm/vnpJdr
         IDalXb4jRzf8cN4DsGTEZeRUqN0MvJvJ93JyqOVaxNyMhu1IdcWqiPoxGgBKSMEx1k5G
         HFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131053; x=1747735853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmugX3GRqGD1c+UyMRnrvs+PUb5JfixmDAgVPG7ZL0w=;
        b=OHb2FoMKu1Yyswy8wV/b00eTO7guo1N85v42FeJiEBz3j6wxAqsgbP8OjPUkbD+vHL
         88KT3lZGaJDzuYB0THcaqrj+2qlMSx59lMezBEczV3MT0iS/zdbO/sOxOtBKFAI2pDh2
         tOozb16L7hDk4elmOo0bWYO2t0Y9h37csJxvZbPuARM9V8L0Gn54pPlsRiEmdmVKd00M
         SDcLqgOYnxuR9Wkr/GJLgJLM82zo1pEhiDjD7BR3hjBp/gmjhJ7wsn+iklqxiaCOAnwb
         LupJ7qGK4UU6fRx4eUMM/BCc/NENsZkNwWow9qfUbK70xN/485I91DISQomTqT1wxqKj
         fMfA==
X-Forwarded-Encrypted: i=1; AJvYcCV0+3egXbfABGTR2SVkSqbUwyK8r50GZxWoYuMn0z1G5521O2HBiIQAnj+vXaTjHGlvJ3IHdEppIESrDg==@linaro.org
X-Gm-Message-State: AOJu0Yy7Cy+RWuRwlKvN7Pyn1m94+nSe64RzUTMCrcR752Hif+DH0o6T
	4vSHL+pxBXfstu0Z6VsMGiKoozKLGsgkuF0ngiPj6mtA4uyF3xkF+3ycO9uSjvbRzQ==
X-Gm-Gg: ASbGncvr0FgL+tp7mW4VjWveHDAiSPjiCU0R5HW/emkR+G8u51L6+12ptaDKyojh1++
	D3ou7aGOhF5fzCYI+aKpV+lzYIrGJpgnV6GI2R1roaT3r3zug76PxIZ1TRZqYKON7NI3cDkMMkI
	yWdjQjpFGc6Nf3qhW9usM9VE9YM462KH8C5nHlLvfhUN48wJMyRoW7wOQwDwmcBhUpNf3/CzbFx
	wPoLLyoIWX32O86t/4gG1Ns9doEnWO+5vhgmHAJe85QpmD0iufhtjmLzp81hEYaJTa2hg6BNS90
	nJEW7VCfeddnSesbDKyADYRWhSppmHqWroxFrQPXXKVbE1nvRuTPcXGus3tp6NAO7ECkQKA+fVP
	g6kw8HJhsoqOpX1YYKeGHR9tH8L1X
X-Google-Smtp-Source: AGHT+IHPSdYV9Hvg10t6s81fQYAul8iIZbBu93I4T7U/xvXG+7WQ9zkVHbb4vFUD6IQs0mSvASr5Hg==
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id ffacd0b85a97d-3a206b2e7cbmr6254769f8f.28.1747131053188;
        Tue, 13 May 2025 03:10:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d68585d1sm163142375e9.31.2025.05.13.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:10:52 -0700 (PDT)
Message-ID: <9cc2fd4a-2b8c-4cdf-ade3-ded482fff1c5@linaro.org>
Date: Tue, 13 May 2025 11:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 35/48] target/arm/machine: remove TARGET_AARCH64 from
 migration state
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-36-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-36-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hXzqeFAGBn0T

On 12/5/25 20:04, Pierrick Bouvier wrote:
> This exposes two new subsections for arm: vmstate_sve and vmstate_za.
> Those sections have a ".needed" callback, which already allow to skip
> them when not needed.
> 
> vmstate_sve .needed is checking cpu_isar_feature(aa64_sve, cpu).
> vmstate_za .needed is checking ZA flag in cpu->env.svcr.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/machine.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
