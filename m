Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1987728njj;
        Sun, 4 May 2025 09:11:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqXMu+7lgZC/skRJoRfe69oIUtUsBG26Id/2OWMCrB8C8AhGqD/4WuGDGPA+akSo+kQvAAwTqTh572yg==@linaro.org
X-Received: by 2002:a17:903:1247:b0:225:abd2:5e4b with SMTP id d9443c01a7336-22e102d0b6cmr131177315ad.16.1746375067216;
        Sun, 04 May 2025 09:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375067; cv=none;
        d=google.com; s=arc-20240605;
        b=PZVrfmbP68jRNlBgUS0YiERI2kkFzB1chYhdaIM5Y6xrFG2QFPhzZBaUyY+fQSjtTx
         hkAq33oiJ1mNzlwNX2GId2RIxv7yc/LThaMl961SVONuYSfTMSicbRULZOr5+wXpXFa7
         ZFCm//ItrMgrtbQzdUbJu8njDv1P9g9nIX7z7ezQhf3g8wM20LFdhHBifuXMQPGYLwuT
         Ajypccnw/mReCY6D7GX3movWyGg8bRBnbu6NVHhBKl0KYrakbwwhqfH/7p3pg4e55zDG
         bPvM8PKg5+BakMIH5cBVkFycpDnaAJeYZxuyAO+JkxWbkP/9ycBDYysjZA3FamE89tmE
         tedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mg5H46AAeuqeTMZmfCyrih9/4ePsSGqG0Yc0d6h12cM=;
        fh=Lh/xSNF8FpeEDiQ6IJJU/OSjPzgw7lOu6XPynzKDH8k=;
        b=iTVq/Tb8Z4TCxnBn/SVObGsxq2b8+cCQ0beCbzgkCs7Q3+R+vZeqGX3lOhEDx8AtWR
         oCQho4UOPM97fjR7GkInBjMIW5S71zoJTH6UVpROMnsjDJYC8DweX5Np8f2UsSzbwYW4
         1wwuhADUkCcc72koesgzAfP2SlgH1yPtecYwH5Yby45em41agktKjDzSk+rib0OBModm
         FlAiv2IlNGTI/B/1ERo9sAc5/Jb6AqK7ZUDv5ZctFDk+sc26pi8jhW8N4Essswxa5ufO
         9eBtl/6upZPGyeIMk1OVBN0ebxLi2IgMb7bkZ9ppxmPX6kkWnyiCD4MIY2H/O5xvLn/7
         Oahg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QSIJN/2s";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7f9fesor34687245ad.14.2025.05.04.09.11.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QSIJN/2s";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375067; x=1746979867; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mg5H46AAeuqeTMZmfCyrih9/4ePsSGqG0Yc0d6h12cM=;
        b=QSIJN/2sZJDR64A/RBSDEV0IfDZ41ewCOiVLzaO2Dl3g4KS7/QAV22PYryL4Wvnpuk
         dHML+xsW58GmZ8Uvbbbvnp0/0blQLLeeNQCF8+xpFfeupW6eOsQvfb/oXujwnaa3lnDw
         VU8qdDeevTBQWM5IA4IhsWbf1UW4i4ljV+ylJzxfzDHsXkhV8mBVUzL/pKG6msqwyrex
         T8+rmSSyfUGbNogZ+fKJIuMeh0GyOdKaWfpoh3Mg3Y6FCdhlGISuKiM2KlEAP4HeAUhg
         HfaxxDEwK7ZWyJCZDbDrs0I53VTcCpgxaDWYI3jqWIC+ZHXLduPMhVnxcETcBGU8+0BN
         YwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375067; x=1746979867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mg5H46AAeuqeTMZmfCyrih9/4ePsSGqG0Yc0d6h12cM=;
        b=OyItUaEg1RX5xp6szSl3INn51Y4NuYiRp4W9fOtTlljX49IvcMFFridJGZNyJ2boRV
         XA0Jk27YngS6mReA/nQy6++yUI2bDHDr6V4LWKqAssBubIJPZEy4FbsGFAcGiri1Lelt
         ok+8FUo9lQ6jl3jV44skSzxVBs7gWJvVGkw3GufpkDGm8ElYv7AMkTKrpptoetzHgreE
         MVKs/pXVLopTmnC7gS/PqOSZ3qtUHLepy4/4idk+W6z+Ek6/c3nEX8mPhdkYdwYmCAl2
         br1W8Cgchitipf2Ma6xndcK+WD7LK4ctMF0yTjTEhloNScQWoi84O/x7scyNte/sH8Wc
         qnsA==
X-Forwarded-Encrypted: i=1; AJvYcCXZohLArDfhg8nUHwt0jATxgvUrwgLOvUh1nN5VsRFtZ8gi7i91UuXeJcyaNUKJXq/Lpfbs1PZ7Z5xJxg==@linaro.org
X-Gm-Message-State: AOJu0Yydwcy/es0m2L9kCBz9U6O0m4jAAjAg3CCsD6msHJKLMuRlVE4c
	0pQpiLc3SpQOBttHZCPQofYw6D2L9aBECDtWDYylPYoWj5Zc40SEW6hcf0UbijOKSA==
X-Gm-Gg: ASbGnct4vr+7D0Qf2eNXP5l0fVPfvbB37VFDpStcjeVB366isTdMrfzeWZ+wTW72EbV
	56mtynRFaDVB9YiEHjR4/VdUKgv/HXJL2MdgA2JU19lnDBkPc45X7s+nDyUlmveGUtTHDmJn7Uj
	Swc0fQLKCuFrwnPvsE0HfqjSL4wOdEiEVGQTVezjze77KnIUePKXGVZMAWGK7/dWs5211h6OftJ
	fq8EGWtUG02CLsr9pPmjfOts0ypV3q8pW+FwdusMvAjRIuH6/LOmYuSiP8m92zxX/4ObUlVxmgr
	2wZqN0sL12/5gyVtXF8j0Z/w3TDWuCSjw/2wWgEs9i3vumzSyLwJIdi5X2ZwuS5HU/fXIY+b0d3
	5sy0ZUqI=
X-Google-Smtp-Source: AGHT+IFuPHwThnZ7gM50lbIZGvWCd/owSisb1zYGcYT/GUvXIiYYxIG9Y0DQtl31DC2c3pM+nqyqRw==
X-Received: by 2002:a17:903:120f:b0:220:eade:d77e with SMTP id d9443c01a7336-22e103559d3mr163818725ad.40.1746375066754;
        Sun, 04 May 2025 09:11:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152291eesm39090825ad.192.2025.05.04.09.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:11:06 -0700 (PDT)
Message-ID: <3d8b8f31-4986-4734-aad9-f73d01c735c7@linaro.org>
Date: Sun, 4 May 2025 09:11:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/40] target/arm/helper: use vaddr instead of
 target_ulong for exception_pc_alignment
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-16-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XD4QtmOq1juU

On 5/3/25 22:28, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h            | 2 +-
>   target/arm/tcg/tlb_helper.c    | 2 +-
>   target/arm/tcg/translate-a64.c | 2 +-
>   target/arm/tcg/translate.c     | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
