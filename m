Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp405348njb;
        Tue, 13 May 2025 03:04:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6Zv2m/vj+dFZHCZD3GvU+7prKObJOl76mCoJX4H7GPzzbWW/oNEueCzVcjyIDLrhdjxehXkP+Z/pz5Q==@linaro.org
X-Received: by 2002:a05:600c:a410:b0:442:dc6f:4a07 with SMTP id 5b1f17b1804b1-442dc6f4b16mr88059955e9.4.1747130655168;
        Tue, 13 May 2025 03:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130655; cv=none;
        d=google.com; s=arc-20240605;
        b=StSBz1fzmu+fsCbkV1CKwU1WgojQvHxIzXV93KrInyTmcLNHQP0IQv9Vv3cVUN+FYb
         pvXj0zUJxOpA9ZfW+B//KIu2DWB0FdSNghtxhyBPuoJerL0XOTaZZbk4GQ06Jo6y3uFz
         Eb7H+4iG4QAGDlcznRy4JZwqhyKKw7PRG3chagdPDZCPkLPBIOf+sdQTxXHGc94+BfX4
         xHtwV09j94uVoJ61eZGZJJMBUzN/CkZQUfJ+xWYtu1nT35+kDWMtxZs7cQslyLszh4YG
         cbk0rr5JwHDhN6zCGRIneEx92P2bVX8bdfs2IgYRV1g7YbRepNaMVZMP0GYWAlcOUpcR
         m6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O26A2fBk0skF5B7osCNfgV1APu4SFdINbgcxdHAht7g=;
        fh=E/8YEbC/qLteLSGQPoE/p/n9voCewb6mDA5T3kCj16I=;
        b=guMtIEGMaZOoIQEVwJik3uCVWXLtEWgxH4pGNOKX6ljHVWtUU1zHhuMr8AyC+XSuN0
         JhCvWzbId5K6jjwx5H7Tizb5fdzLeJtG5WQFV8Txb7SXknXqNoDv58RsZ6tlQIRnzXxY
         EqCr/vMw8UvCv74HVb9FsjMJtIhWIiPL2NTN+HItg1ayjsAHsrsoZRyxhs4gKAIH1WKh
         i+2dQNGQGon/wyHa7ZegyckbQwQMefmCtSXoO8FzpibSYXDZKQHbIZd3kn5GJmXNOGX2
         eb7ygTeoRHxX8dJGnd12eX9F9GGpuMT3/cKLxSre+5IIAlffhSHP2BNPHHTi+i0FZnkh
         bwaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJ0DqI6P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d67fb0a4sor31279185e9.2.2025.05.13.03.04.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJ0DqI6P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130655; x=1747735455; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O26A2fBk0skF5B7osCNfgV1APu4SFdINbgcxdHAht7g=;
        b=SJ0DqI6PfRsYEKWKHpHeq4RUQabP7ZHjy8D5bHGpOcYPMJpB85V5es5678XKV0Bwx/
         IMiOozbQF9FOdQCuFgPtQwzpNqwqYYyHSXXvr5tsNEob/B+Bmx61dTqCc5JtZpPAfRnS
         9yuXhACTxyaannD9/d7qhfRKMN+d3wjUVo5PrswTaU/Drn5MIVRNbq5iyEi2Oh3KPd28
         m00eZaP3Yqky7VYHDyBlquZF90KcRx9FRXNh8zSBag0V5ZYlpzKTENWBw2p4KGxn7f7u
         TS0lDwgKpevuVbZnRzT9zLKrINtx7EsdP9ICYpyUwky8QLSRFccamdg4mMFBGtEPm6TJ
         EKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130655; x=1747735455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O26A2fBk0skF5B7osCNfgV1APu4SFdINbgcxdHAht7g=;
        b=IsJQDVOr+ce+hCRDzaK+U3tuPG6wpqWcxJwCcQrlsOxG25sYoa/wYyYdEGZGzAdhXz
         wI14i2DoH4agae+spuCTId20Y+F7GOxLtdejDK1f3pJBVWg9oOxmecgIriqOI5IR6RBM
         xspbaJoxT28Z1LviTAC/EIMIMOctqS6pLB0btC0RigsRTxfvulP4VDzmsGnkuI9S8u4T
         GBpnpmVaA4F1ktDEFEEYyRM2UShs3kjpGKJGNEs0ukhKCCVSI2D38gQQys4FMpLkEVxH
         QErKDYhb49+PAfQcBy9q5LtiscNVQwxUBdxf1pqJacTK5Mk1jXTEtbYJK7sKnIoDgQKM
         OUBw==
X-Forwarded-Encrypted: i=1; AJvYcCV+B4dW+AgG6HtRyRQaA9TuhCpT47ZCXbc4TWy54Ho7bki94gUTv/2h2H6bVaeVKPGmWxb4ZQAsB3KvSg==@linaro.org
X-Gm-Message-State: AOJu0Yzt2VK5QYjGigF+ENVcD9YpcYVFNnsDnpQiReeqstQ8sAImNTx6
	RVaqE8IzakHzQdb9hRnv5WLEEe3R44OoxgJ9UftSCsSPxtp9ylhxDBZwAlRWpjoDDQ==
X-Gm-Gg: ASbGncsWWeb1qLwHcJV3pY+rSKreU1Dpihj6O+jzRyV2XmiGIeJJjc3wOHwxaEXwCJA
	pQjwG5ub6DzdBBXpf8Sh4lIsIRftacVf/+EKogQRy+fVnnYWCR/kLjI/2EAlmFaU+4vNwn0aht/
	g+0C8VA0pT+lk5eOrPlz4mmWCxro2CrznfM+ClTbXHMP2NqGrwIuIaIhxzVbPjMv/NFbbO9eO7K
	MgpSDSiTHo6H2P5LKSNeUL2KkCW57s/CKNacFUsSdYSuF9E0eRXHmLd6S0YgXk55dFZ0gFQPrIe
	7/N5sPT6hAoLQGiDBl4UBd5fX83kqKYS+g4iXL/VpCk4g+wrIW9ubJ+wighww4pLsBoLb2QfgPl
	X1zfZCpoodW0JcOckyw==
X-Google-Smtp-Source: AGHT+IEHDHtezTiJB5tUD8EfZ22mA3DyFbXAC/zzCzkc+WrSz4sdpni0P2osv+urenM/NTyI6Pgh9w==
X-Received: by 2002:a05:600c:c10:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-442d6dd23a6mr103613275e9.28.1747130654605;
        Tue, 13 May 2025 03:04:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd6asm15839928f8f.35.2025.05.13.03.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:04:14 -0700 (PDT)
Message-ID: <7ab5b60a-a696-4133-97e9-ee37aed218f8@linaro.org>
Date: Tue, 13 May 2025 11:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/48] target/arm/helper: use vaddr instead of
 target_ulong for probe_access
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: u9vpC9S69EZb

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h        | 2 +-
>   target/arm/tcg/op_helper.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
