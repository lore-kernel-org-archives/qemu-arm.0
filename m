Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp444290njc;
        Fri, 21 Mar 2025 09:37:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmNOONxPRpzi8Gz7LLPG9UqtzGNuKyAG/Vls9UY8B+FZ/o/tPJoObSCvCwJGMI8xl90casQH6JxmfDJw==@linaro.org
X-Received: by 2002:a05:6a20:9151:b0:1f3:47d6:aa05 with SMTP id adf61e73a8af0-1fe42c6bce5mr8211540637.0.1742575025808;
        Fri, 21 Mar 2025 09:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742575025; cv=none;
        d=google.com; s=arc-20240605;
        b=IoeDCClUZIdfkKcbh+zefmkVjWVCLcbgxSUvOZDnb63zbTqShOuTyp8Mp17KjsI6b3
         2ZZchmScL5o5kvx8ICt3p98wIXKibWxAh2ws+CNYXHGjccXej6xmKYiF35ak5X0y2zlw
         isxBYkGRj8CTugcMhEKWEEiX/IdKdvTUdJQJKLdVKQmh8sW3VORRwrJMyiyOd5blf1TL
         1UnFWwW/2ruhv3MA3Q86zbt08/dSU2llCwUiynWCJ1Kv3F4nxjg5dhAYlUgYt8vG6sUi
         xPHS5FhCpfYWdDfEvs8+VPsUXo5pSLYwBhFL9JuImqmh9IktZVfIertJRjbkHBhYzI7F
         RJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wd8JQPF6330iFbrfqEOHPqzvf3WyiSqrdPORWZKD/hg=;
        fh=K4UqP4hB4aFs2q5GuZf4Krku7wq/HMvlAhOOQ7Ki99s=;
        b=lGVzWwm087y9AE4VXHYqvtQBMFwlkzhpVwQ1v6atblq+WmaSQ5ETBF95qKQmGPQsCl
         X8ojBpdCQPiDWOf9G7sUxHpYOzTTCjuHgSCOJyAUOfYPGtVMkG7YNKwynhi1qGf9q026
         fFtEIDvqpFufysfBp270KgXArlg3ms66mOoVoNJSd2YUR116H4uu477FnvIH4abT8V7e
         cQpHJ0ooSOqN9Z/ZIj0ylRvW6RIZWALjy3kYe2VkYL8EK2j1DlKbtL5QqcKqme4/jDIc
         t5SNsLL9suCOxVJkzFRNJ/hHnLJVlM8M15XyX0TH2HyoKxSy+taYGex4Z5rbsY3undah
         jCHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wAfxRk7f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7390612a678sor1842282b3a.9.2025.03.21.09.37.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 09:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wAfxRk7f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575025; x=1743179825; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wd8JQPF6330iFbrfqEOHPqzvf3WyiSqrdPORWZKD/hg=;
        b=wAfxRk7fz/d8iB4GSRK6CU2KSOXjLeJa9BMB629ZQi65eIKU2nrU5t8UUfIbUSsQuL
         eq1aQEUOVjK/xvnVPrIWHMXWvBg97J0P6QpQKR1VUQEqOz9fKpCPKS1CfOqjMzFfs0pH
         de7lL7mqbcVTuH2gA9CaJGDNCwvFnf3AFFnSB5SoSzpl+DtRKAMRtO7m4mBP14CZG/Hu
         zFtpQrKMzLRq4fnwKUKh+OHrQo0k2J4Vj4/SiQMfhUw5hGITKqjJR0Gbyoewt3NjS+TA
         jpmbXTq25L6clZetpoArOnVQqvvzKxe9g3yBcJiXTyWaE7EWCmzzeWaGj2TGpsKducb1
         00ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575025; x=1743179825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wd8JQPF6330iFbrfqEOHPqzvf3WyiSqrdPORWZKD/hg=;
        b=f2Pv9etlsTGf0cOwCXqNIrrvlbF0SeKyV6mvg8lEUpaD8n4Yht7+OzdwnS9tRCih4n
         HZW1+d76QGYiyB24DiOQ2uWHm/fPYG3u2iruqXb91wQfH2iLhAVPgIi2n0EvhYeVK1dJ
         z12KSsVf82WL4IAqbsD9/+vYYdw/mRNbBylNY1bDziR2kflnNjVzkWT52RJ3gtxjLWR6
         JA9SYU3fqeZKSSvwtowCi1hKLILajn6Oqva+1xQ0f5lim5MtKPhpV/wZnDdmBPGxsGQt
         s5wRD/EB7l3KmVuCGTZ/v/kj7+XjeCJWUyC8UH0B3njlqWntX4i6o02RdsiULNYEcNIn
         sJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8dlFaT1+eS3BlLvg8lWQt9dCQHoF+aJZV9tYQoG3rOQ0iruPAXH2K7n9ZzkzBR6F3/3dF1IW77waHcQ==@linaro.org
X-Gm-Message-State: AOJu0YxRdvTqVK3QCaoDJiiC/wtzknjyIKy3PvWfwiT/8OI6jnsmtsCd
	Pf2Unww1WfBYhDKjt18+eqQ8EiCd1rWcz5KHqpREDmFFLRyvV171owvFhpd2jQsvSA==
X-Gm-Gg: ASbGncvpba+vh0DIw3bzr7zm5ynwhpbISJMBDcHdiZ+Lx0PkgXOpP76W5NntOB09phP
	QbrjNijib+hJEbnzaAyVsMrDZ6HsF2NB3LsozVFjPxiLaegUUQZ1wDj0HTfDVb2DqeN5Ucv/UPR
	CElSkfrXRyUOTmIynw9Ve/AIgK99OZqw3WW/pBnaZdnsfN1Pevlu2noceGy/AKp0YMK71IHm+VP
	mgPWdfZ/PIwuITDYjnH43lnlppzlSuB16eYMeiONmTVpIrUPH+o/QNnxWw+qtDdcB/f2QdPq8AO
	wI4HNTlUEvrCqvWaRE0S87i1VuyS4fNupV88kgUnGGRY6OS7KemKnNVszGpsbOi4LC9tRr3Av74
	G5bAnho8C
X-Google-Smtp-Source: AGHT+IH312/S8AbQMYSlnowN41JPgfjb2YW1tfawXIKSwpgCXNTMnxdSiRZRFkLJzTfeH40cXjqH8Q==
X-Received: by 2002:a05:6a00:22cf:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-739059667f0mr7619951b3a.8.1742575025097;
        Fri, 21 Mar 2025 09:37:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906158066sm2143401b3a.150.2025.03.21.09.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:37:04 -0700 (PDT)
Message-ID: <ebeaab45-ea1b-479e-8250-b263acb05cf2@linaro.org>
Date: Fri, 21 Mar 2025 09:37:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/30] exec/cpu-all: remove exec/page-protection
 include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-7-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YTwddCNxfd70

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
