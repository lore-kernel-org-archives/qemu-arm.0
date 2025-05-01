Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp278973njj;
        Thu, 1 May 2025 08:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkTU5qNmAdTWDAhWOidBWXzQxsvZLrVDGErQAzmrfouBWW2QVbVqc9TWuIGEGGR9SXhL8t6kT+TmuCgw==@linaro.org
X-Received: by 2002:a05:6a00:10d0:b0:73e:30dd:d14b with SMTP id d2e1a72fcca58-7404790522amr4292278b3a.15.1746113014745;
        Thu, 01 May 2025 08:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746113014; cv=none;
        d=google.com; s=arc-20240605;
        b=KMIQZOHQ0uxDlQfaBt0LLhFplWc+0gItw5RgV0qKXDw8ePHvCV3wy3unLcgcS4ka2G
         Md3Bkc4FQUlCh42k88tpqGt14uziVXQPX4IswyIK+OXSbRGPtMpc9W3FwTsGbbdY5LtL
         AQL7m6gDlzy38H3qG33jtK9jDUR5MXyq/uRpqZp2cIo8jF9xU49nQovzVn0ojcEAVr11
         gS0dLg9VrI+Am89n6cwiJEN1V4w1u0OVMYtDz2NvhIKnATal+Cs3wUG/0Sje7UscPGFa
         wHIu+K0fyVnjG7t7sCccShBEyl9KpyvGeVqzO4KMoMLwbjG3yH2WqoGf9ry7O6N4Ywzz
         WEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b7n108UvSqkNg4G+6t+Prq0mGC9LU+Xzgi3XWfeqdPY=;
        fh=JLiPgNF1ZDI/k6k9ZNqvZY4hKbWnY4xTdszDYTNagCY=;
        b=B15vGNBkamDQMaKsnBLJo5fiaDyk/5JUffi2zeo/TeElhLxFnT7C/qkbD2vYqpqi5I
         YsmvG8cpMTUwMjlKWNDQoYgSDMU7HfdulNpVHX4Xo+UY9t7sd/SWIW1tR3tGUkibw2hX
         55PNiWLgwFgMv8PfcrJghEs0hfnjPIfIrMKeKL0EXiw9WuDF9b+OEVhC2uZFnO76Mb9M
         0MzjuYPzqFYLXJmzJN3YUzs0TTPHh5pdBs2vCWXh4lumjd89mEh6sboyj4pprH3It0Sw
         6ZttRkNO2BUqEi/BOgqMBjUwN36SrygEDrq2pNtq+4BBM6ZaMiHSmO7p42NdSvSLEWHX
         pYuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfYyLGSy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea58d3sor525367b3a.1.2025.05.01.08.23.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfYyLGSy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746113014; x=1746717814; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7n108UvSqkNg4G+6t+Prq0mGC9LU+Xzgi3XWfeqdPY=;
        b=zfYyLGSyngYuRZudMNjs4vp1tguM2U93juTZ1bjQrcLEh9j4LP3GJ2TMa5yWielKFs
         Uu/bltel6v8yUG2083I5Vel9l9oeIh4yvEQBIKe8D0ydmKOPWIk28PG15yKly5XoSvTs
         5GiihcF1Twd3eU+l8NzXJE08vB3nkkYPtHcX2FF97xcDL+0TTngQ2jikC9jL/UIJZT7y
         OnasR5JdYIP+fMb4bddEhM14H2//A2DB7Z7Dp/eJmRWlkr6dorUtPPJSTvQnvnVj/oUi
         dbUooZMDTuV1J2w6SlBXuua4Kdf6JCJnEUEXJk3V2Vm+fgMQC9bV0NOf5QtgGG9IskTE
         MLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746113014; x=1746717814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7n108UvSqkNg4G+6t+Prq0mGC9LU+Xzgi3XWfeqdPY=;
        b=mhmG1esbuyVrLpopEshJGgd4BoB+o1XaoJeIwPhRtxOF5fr8FJ4Yx1ZSNCRnRiaj+p
         8gRRc1W96ZUml1GSy7d0JJXzcpIlfx7cEZaEqPkkddW5nNpCFfmLbfruZ+bJyeZAip4D
         voJ7RJz5+OS6zwwEKPs1PEixSpq2mc52qyf9DwvvOQUo1d3fmkfh6r19MYT/T8OIWY/H
         6f9oAmmbNGlKA6VZMhAUY0HDr8VMRrr97ciwaTQxsQro0o7FEsFkPC1gMTcwL4xsw4HP
         Qy3J0924T7nImpZfPtRihYXI+/bHW+Al/RMLGXxKvXk/ABGUDSV1AfxZi5FdzE/CLj8D
         s2gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpg5PxKrX89Nk2vdqTzBG/A8yKSRq0UxSp2K8GfjWUXjGn9Z9n99bTSgc/RllHtZDiGba/HTrdsYs1BQ==@linaro.org
X-Gm-Message-State: AOJu0Yw6QEpH9LgLhT0eQpkCnrE5UrmY3z7BTu9MvoJF3aar30SZA6DH
	Cq8dtazdsoydJYpmH3bz1tK8VR5UuoP2GSDEfPQuP253a/1PV2n2TKCm67JXA2GR/A==
X-Gm-Gg: ASbGnctjDeiRZvUMb7gEO9Jr0OrgLWyB89ux4VSQHmrOGExIuob5fvgviaI7vmPNFyw
	jGFMwU+/lczskQYQuGxolDuq7py6ytStojKNH4A3MkPXeDjIVMrEMsJ3RR2VK4w7s2Wpp0Y3pHp
	nYM2gzJrNgMeemhov410icEIty2oqKDS010hKEOH8VCEgAe/jur/rcu9Fe0BMTM57iO+Y6TXAd4
	S/m5zfqPvmAa85/Y1xPlaySYWUzDDxK9tscZDE/fdH1WoHaA8i4cVT0TBJhgV4E4eMJyrzBDXB0
	QpDIdx+ONxkzRwzENKmY9hK5gkobg9IxDGw6f3ECS47KqFWnPa38DcB4YCKHZTuTYPAeZfX4rl8
	5hZFThIo9kddnw7LMtg==
X-Google-Smtp-Source: AGHT+IG+xQpwe9JF6Emr8LMDFsv4jviepaSVeUO75oUuLU3qAugUOfQvpi7rbysYNF5LL/QQQa9dMA==
X-Received: by 2002:a05:6a00:c91:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-74047785114mr4469458b3a.10.1746113014345;
        Thu, 01 May 2025 08:23:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404eeb195bsm933775b3a.36.2025.05.01.08.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:23:33 -0700 (PDT)
Message-ID: <cf287b71-59c4-45a9-b0cd-42b9425b410f@linaro.org>
Date: Thu, 1 May 2025 08:23:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/33] target/arm/arch_dump: remove TARGET_AARCH64
 conditionals
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-26-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-26-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /zaI/nsWRrxv

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Associated code is protected by cpu_isar_feature(aa64*)
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/arch_dump.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
