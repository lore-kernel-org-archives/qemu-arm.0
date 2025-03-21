Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp444157njc;
        Fri, 21 Mar 2025 09:36:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlAjF+9BQEzVwRMARhkLBVcEhiLoEA7jkedz7kW16NNUaF6DnLoODIvcuiNg8gOP2tjR5YgkE19nQBqA==@linaro.org
X-Received: by 2002:a17:903:234d:b0:223:37ec:63d5 with SMTP id d9443c01a7336-22780db7783mr54981415ad.28.1742575011069;
        Fri, 21 Mar 2025 09:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742575011; cv=none;
        d=google.com; s=arc-20240605;
        b=b6NPYcht+fKvL+e2/TdbL8Ui0jyUU0KRCVRMhd55sJ4GTFSy4zjCgcc3FvwplvrSMO
         W4KtPuKx5eGexMicsoDfsPf86J4xT8QkFlVG7AGsZs7AY0mmYELTYqww7sllTf9jPuQP
         fC0AbQMoDt1HIVFMdz/uQihHfHQOzPXkrcO/7t6AAkjLX7rxNA3Juljs7tJ+yG3+kY09
         pJ74SluuC5f98A2PDvTONvU1FDLVXUzjRhadZM+p/lHyUvc8Y8ias5ZFf0BZQ1R/ys/5
         m4OrDHITyQMXetvOKXBo7JeI1R3mRdwerNYD47mAYRdrPAZ8aEXOrQOWjvpjLUHux1tO
         yOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nyAxrcxJpaXDZ7GiFFU2INjbqCkqjtifUru6VAPSebo=;
        fh=anhrI5DCjLmZB2JBDYU+Z70JBEtXdeOX4SkBhiIaTzE=;
        b=cmoMClYryRbPH0aHsIjoHSdOVx74q0ZYh1Ndksi2Dn7uZBQyKTHrhYA4r84FZfjT3e
         wKC6QmaCmQIivdP+t9vrwy4M38oN9zsk3/rxWX6T6yfQccYvGGfbM0JBkQtatK4V77mk
         2D6f9X9eUEXXkQcpOzmMYUoSdz3dOju9PCEcPzJeMtvUskudTQIs86WFQnvgKm+9pHYi
         RV6ezL4i194yr1rDlL4/yrm27rfjMQVHmKlBLiQXzP8Rh3CLXBsCU+u8VWN5NpAFrgWS
         7UeKe3ZV2Db9yD41xKLJnMPIgP2tApETPEUC19+qzf6550bNs3c/qzq7g08udecWR9TN
         YNxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ri2EVynA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811a3574sor21463385ad.14.2025.03.21.09.36.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 09:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ri2EVynA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575010; x=1743179810; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nyAxrcxJpaXDZ7GiFFU2INjbqCkqjtifUru6VAPSebo=;
        b=Ri2EVynAeYYJsEvAKrM0R7wTorqShJ6INaqHkdIbo6OSxotonzrtxCQMtarQV07/9N
         S/gwjIi22LnQlwILuJEOmHrq2dSGsNTIc0EKv+R9WsqgnZL2mdaI12cXEYDtJPIXq4aG
         t7LmeEaxJiZX4h+Qse8bP7zIXqNisz6vgcAJsq2gsZ/C+zC53fgfQJis8nYDGTvKXQIW
         h759kSWF8QVW14j2yiQHwRH9R5ZWU2luSgzikY1DdurrqCCCX/LK0nbGg4Kx6FaLCP7C
         Ajf85SCwKGDg8GrFz3j/wPjseNnzev85FVpKIV2qXnppz4UASnp5SumJNNkxE0xVlKrp
         0Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575010; x=1743179810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyAxrcxJpaXDZ7GiFFU2INjbqCkqjtifUru6VAPSebo=;
        b=ACo2fCJep/+CC3GxrtOUK8IVxWxLgUpO3wHZR+tW7uISQHKt4J4dV/wI3S3NHK3eFH
         VUogzwL4uywHNY5g9vMU6Jt1R63oYaUn8o8RFZjENQBo+OeXfsbqY2hdpUmmH1xkHz/U
         STHD/oVzTedkwWM1RcyzMyBxz9Rt7vbypabtNIr5yR+OZ3Mwj6cp+TAvWubZcpubgqLy
         AkfV3DmP6dBIIwRVmqTcO0x8+GD7fRGdDPhrMoRFAFGdms4IU+u3Uqao2hEtcC3am+in
         9ys3IQgp9XA43J97LMrst9yE+qQeLVEqi0n3N5FjR7UjZJoQbTDhFhJs0buB3PBlp+RA
         X6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXv9p6KaF9BqBaiRWSAzauWzXNgfYgTz+FkNq9nBklQgh7hkT3DvtWoOcyrzjYUMIT+NKxZtE8/qiJxHQ==@linaro.org
X-Gm-Message-State: AOJu0Yyj0zyfxgOwdVuzw4udq24f0aB6930M0Ep9Zsp+jK5mN551oErX
	RYwK82XQtaAVX4nzcOb0CSgvCc9o7FZjoQhyI8MmwZxIOdd+83FIZjTV0PPvwKq40w==
X-Gm-Gg: ASbGncsAmqqQ+fDktWNd/7dEyhusD1+P4KZftFaJUTu/fRWT2kUNX+EhLrjbfwweE5P
	3kt1a5GR1gDuwux6p+8Whu176NZPmH5IspU8HSyob65sVu+ma+4Lhn/2tA5l9IdwDaeaWWyjF9p
	THUd1F7UY+HN7mGZBDqHAgOna2rw8bPP2ebDg11Xu3Ud1/RWTgsrfvxDgORQLlAHi1pSMenxEc3
	ezVnR/khBl2LsfBjNP0Yt9lJ3pJmx2MZ2BuSkHg00w4sJFKH14BUQHy8KqIT0QOPWjcojJf+uaR
	sRtg2QcD0hNvajvH+2hDtKhcdzNGyvPnuAVOlXLMqzF4Nabwn0Ur8Ds0YrvqMGDg6DZvr1D3Yhi
	TJU+YdL/Xk0NjxvKZ3AE=
X-Google-Smtp-Source: AGHT+IGRZBvkhTTMFTisosTyZ2ZOdK/frO3hQGPp0saPscrfsv066xw8DoRU1w1LWAfx91qFBAAnlg==
X-Received: by 2002:a17:902:d58b:b0:223:f9a4:3fb6 with SMTP id d9443c01a7336-22780c52283mr65790865ad.11.1742575010316;
        Fri, 21 Mar 2025 09:36:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811d9f0dsm19122885ad.165.2025.03.21.09.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:36:49 -0700 (PDT)
Message-ID: <6215e901-af91-4e3a-b8ea-dba9b36cd87c@linaro.org>
Date: Fri, 21 Mar 2025 09:36:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/30] exec/cpu-all: remove system/memory include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: RY9VutdXP8cT

On 3/20/25 15:29, Pierrick Bouvier wrote:
> We include this header where needed. When includes set already have
> ifdef CONFIG_USER_ONLY, we add it here, else, we don't condition the
> include.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   hw/s390x/ipl.h                       | 1 +
>   include/exec/cpu-all.h               | 3 ---
>   target/arm/internals.h               | 1 +
>   target/hppa/cpu.h                    | 1 +
>   target/i386/hvf/vmx.h                | 1 +
>   target/ppc/mmu-hash32.h              | 2 ++
>   hw/ppc/spapr_ovec.c                  | 1 +
>   target/alpha/helper.c                | 1 +
>   target/arm/hvf/hvf.c                 | 1 +
>   target/avr/helper.c                  | 1 +
>   target/i386/arch_memory_mapping.c    | 1 +
>   target/i386/helper.c                 | 1 +
>   target/i386/tcg/system/misc_helper.c | 1 +
>   target/i386/tcg/system/tcg-cpu.c     | 1 +
>   target/m68k/helper.c                 | 1 +
>   target/ppc/excp_helper.c             | 1 +
>   target/ppc/mmu-book3s-v3.c           | 1 +
>   target/ppc/mmu-hash64.c              | 1 +
>   target/ppc/mmu-radix64.c             | 1 +
>   target/riscv/cpu_helper.c            | 1 +
>   target/sparc/ldst_helper.c           | 1 +
>   target/sparc/mmu_helper.c            | 1 +
>   target/xtensa/mmu_helper.c           | 1 +
>   target/xtensa/op_helper.c            | 1 +
>   24 files changed, 24 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
