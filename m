Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp444629njc;
        Fri, 21 Mar 2025 09:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXV61LlHYjZ8FptBHmbxPNW56IlSVthqYzsqe5bhjdA7zAG12UdOdn/vtF9URYjvbz3yUamGJdsWmAK/w==@linaro.org
X-Received: by 2002:a05:6a21:1513:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-1fe4347eb7dmr7725407637.37.1742575059339;
        Fri, 21 Mar 2025 09:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742575059; cv=none;
        d=google.com; s=arc-20240605;
        b=fzk3gpm4iJ4E9xfpCNMs4x65uCYLyOIYkpKfK3++AuR3TZBV2crVlVqbxG0Jqcoagv
         uEGTEd3neIIR1X4KKeSU1l8BF/Co+s1z8Hb9krLq5oZ3xCDXsHGhmwI05WVm5EZZEdne
         3mJq0sc3eWSkEyWDi47hE9EQuBgmQemY4EadBSMh7jXqi0Y9mCQGZ3K4gYosf4NHf7KC
         awm31nEVUJa+B0v6XpGF1PA7K+yx6Do0C+KD/J4PBWOqUWBwilD3tjLpyZ4zKxyhfPCa
         OnsRUfZOqXARCb2SaWWn7wcbvKsS8mlLawjgpiiwP2tJouyRZC3BnUBJMT1Pbuo9szi6
         O06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y59C5Qrj18DiWWjCyKGAGj8vz+PXlW5k6VnD2BYRmjo=;
        fh=9R9cCC2cCTHDHCRtdOSh2hxhkO7QwHedRbLaihJ1+jg=;
        b=gachb9P7qQviLFGpHraDuATcIrOYEGMQgXBL2aeOYhvmbfU34Y+MQ04An4zZRxZoJs
         37Eo84XwLr5o2AHk5bZCgU1BH2KuKZRYYNU5VeBJbKvA1XBX7ArXKvzBdjIpaMwf3Pk3
         7NuvC8S2eZFyh2X7f40r3Pd/E+72a08wcnxEG6LnTjXGrcBrrXM0jqjgxQzLrZWLKMk5
         d5bDEypjmJSZMMBeuugWogVI3JW9Wciwvz076rHHeYhvTygzwbhjSmmNjInSiZxv8tcv
         LCEDA6b6i0/iVuJhTsBj6M9C2NCVeR3KrfaqGFVZgEPhszC4dZIIjSTaRC12eZCRZXfU
         S1ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lvWQl+lW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a33fd8sor1447496a12.6.2025.03.21.09.37.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 09:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lvWQl+lW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575059; x=1743179859; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y59C5Qrj18DiWWjCyKGAGj8vz+PXlW5k6VnD2BYRmjo=;
        b=lvWQl+lWa/mD0NEIfzVNIkkzgQ6WPkeznwQx17UaLo5GosObDnX58C4wCf7hQFjlZc
         ELDvn4ujR0THwGpxOJQzDxYaKX27odHtBlZd7o7Mwh9qm8WvZVrGdbmIi8F/l+BGZxml
         SWmNQ/I5udpyzh86k8fWwY/UWWAe7fbKgzcor8TTaEPPw3QCCmFK5FXJSslBESzQzcDs
         z+ZxPBJTZLMI9SNBOtKX+ZYIU6Sub0cxWhy/UovyqK5FOCWbNP9VEo6puSkh981IeFGb
         w7XZbdB2OfYVUCJTRB8Udfhb6H2f+IC45PBXMgC/+fGTO+QEsTZzIEqLVkRo0V1vWHD5
         2yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575059; x=1743179859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y59C5Qrj18DiWWjCyKGAGj8vz+PXlW5k6VnD2BYRmjo=;
        b=lj0yVUTIYOXEZgbb/ldnoQVLt0M4tZHSusqc5HZZOtXtpZKRrNj7mQrGw8956YD+2S
         XznLxC3OhK0LpnXcrtg2I3UHOFKzToLhDLnd6SNHpmZghiLrsBbfDZvIqNI6w/o/RSGf
         tAV+ZZyY2yvpL62vwg9YFFxqnsTyUccEVLI3CjZJXyPVFNNI8uGvebDdetjdC/b6cXa4
         szYr7wanAGzzSFhJBYzYAvsjCqaQJ4KDyZe3MtXwJzE7yLcUMErzjg+f79fCNeV9YE2W
         3dwr908siaUEZi/OCA8BN25IexmBYyFy9lLJaZgWOAzWb3XZti3tzmNe55XJdndbDFkz
         chuA==
X-Forwarded-Encrypted: i=1; AJvYcCWR58mY7yZLAgC+y3gBzWvvV3/IjcZjYYWG6xFJUib22s8E1oPmD5YxKyKTcpbNleVGdPXEGsOALipy0Q==@linaro.org
X-Gm-Message-State: AOJu0YxbBSckUCsZ1nvjt3AahI3u2SzorYp1z5iV+Ys1yMvDVr6e8xNB
	IYcjyyHWSNIzlH3ch9jhFU1ntwQPe4z6blq8WSjGLDe+6Hyc+xg2NXynsTE5FSGX5Q==
X-Gm-Gg: ASbGncvnsbOm/9AQOojoAh6hIiouRLIicGIZlexM+FHr3Cd2a1Ixq3L9UEdhORnnLRB
	Du3tMp9s0ObDbhi7XoBKMxuhwkH4b5Ry+ZX4DkMvspmbeRsgo8m6pO9RoeTRmmFU90+Kmp2FTUH
	GSrdRj+YTvKVQN4oI8e7/3yysSPfX9t+NKWLvlBI+TxdXKV9bZu5Hbk48P3X8aWLwtiCi1cQN9u
	Ld1PTFmGmcPekAQMEffyYQC09jBvg6+6Qt8b82gTTbC8PpouaxYosZs6oqMrpK+eBKwit+CPF7n
	wvkvhL1CgSN66kMLSOQA5GJUJN/X7nwgRfqb2/YHemhpKViJVE0zg0L7Sgne2hFcNnYku1PHSsH
	vLZSRpCBN
X-Google-Smtp-Source: AGHT+IEZrO7nUw4P8/L9oXnNbpWNLCvFQg8dOSD+kcKxwvCK1Gn6uemtpZ/wD0vshfT03aSdYi8KUw==
X-Received: by 2002:a17:90b:2703:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-3030fee5ef6mr6721415a91.28.1742575058884;
        Fri, 21 Mar 2025 09:37:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f45b2sm19128455ad.214.2025.03.21.09.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:37:38 -0700 (PDT)
Message-ID: <543e972d-8154-4a35-bd00-b8b950f4c794@linaro.org>
Date: Fri, 21 Mar 2025 09:37:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/30] exec/cpu-all: remove tswap include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Ag6+hF6pGFZx

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h               | 1 -
>   target/ppc/mmu-hash64.h              | 2 ++
>   target/i386/tcg/system/excp_helper.c | 1 +
>   target/i386/xsave_helper.c           | 1 +
>   target/riscv/vector_helper.c         | 1 +
>   5 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
