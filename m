Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp423959njj;
        Thu, 1 May 2025 12:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgw8WPP66J1SAuys7arEqrXEuRLFQGUbGQCbCjZc7Of2fdeN9ggk/1rfMlDKndiKtqMc0CpkxSDerAyw==@linaro.org
X-Received: by 2002:a05:6e02:1fcb:b0:3d8:1b25:cc2 with SMTP id e9e14a558f8ab-3d97c196853mr2018405ab.8.1746127845352;
        Thu, 01 May 2025 12:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746127845; cv=none;
        d=google.com; s=arc-20240605;
        b=GoynXz+gCGuzwOxydKYI/bPE2iYwAXcWdtSVQoEYCGC5yv9HFXqh/ZcL5lTura0R6i
         KW4PQpJjWqFVLkfbK+mVX+qH9PfIObhVjGkDjyId1PMxqo+Apo/iA5uZUsYlw+WmgJ16
         0XG41JbSlI0YLMvs3d35PY8Uf2mzxBKt2ohtqfzUXOPe+3BB63uxiOd7wZPh+TzU+hJA
         dr0YWALS+D56PZW79gdeDQ/UFI4nXNfF6Y1UDXkIe7TBNjG19QGOlAbN3koAMc7GLYR+
         0DxrToePWMko4tV7BeyII8QsMejbH1xRpKBTd05UbstLHCsyRVFSj+pErqNGrkDyoSjv
         IT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+Hb91IPuLXKJoQyP6cAOpZVHX8T71l5f/umHeyLbAqA=;
        fh=SAej3egZwxR88B/V1WAoNFuNbld/BPxz3s2WqkXK+7Y=;
        b=e6eK9TwgWYKPZdtP1nlL5HAYTyRzOBnzRtVTZWzIT5EdRLhTDW5vX8KcLu7ZhdEz2o
         2t6CFBuD+hNDojB+5kWW8+iAreYp9mgBhyk7lu7MiQrilUZp2pfZHCbV8ck5/pTKtUIH
         Gmt3pUY+RozVfDyV7L1jC09Pz2cR1nzQiC3yd4uRvLqASf4Codi9WaxNO5eAnn8i+z3Y
         pq4Mz4Hq46KgqwJ1B+0dYCORTV1UpfDXuyihsC+a6jxBhVShHLxMdyvHFct9m6xzu8WI
         r/JmuS0S+m1TIAMbTlN+NqmjAhm5z1BdVj+b/MEzymBtXPbZruQ8fBF2mZSTTKdiKVIq
         r/ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ld8tuiTK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8926c6da1cb9f-4f882e984d6sor1066562173.2.2025.05.01.12.30.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ld8tuiTK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746127845; x=1746732645; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Hb91IPuLXKJoQyP6cAOpZVHX8T71l5f/umHeyLbAqA=;
        b=ld8tuiTKp7ksBzJDRPKIcZ8S3mxCBCoHRPqoqXpMzu96fkWEjqdYoFOdDyGhLwzmDB
         9Dy8JrvWa/05GXOFb+cgxM+bPlw6Rc30YFOpNtR1KnVh/73NWUl+fE9iku0VU2pWTux7
         6jvHz+6fC5RkoBr33I35i7bpfWX2UWNFMvBf+sv3k+SOFKUwbDi8o1Svw/7ZH6Hs5laa
         H3bR8gEH2e9FFU/MyW3IS+1IBOHn7G/uOYjlhFIOa1zvzvZzoAMZ+iTKQBhq6x3YW6B1
         OIWgCw8Jyg2BFS5loL4MrKDKw7i7mg925PH3KarDYXge+KLPe21AJEjC5A35FkumA8g3
         +zCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127845; x=1746732645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Hb91IPuLXKJoQyP6cAOpZVHX8T71l5f/umHeyLbAqA=;
        b=wRTFxcP0w32CYHjFHa5Ru9lf4nSnWY+J1/oSeUVzMCU/XlslAwHEapVld/v3bs+HLW
         DkOFPWde0hXiCP0sGdh08CeVLcekMU4fQBJDhiGfN99XUlX2tYm5RRRNVcCjc76THOLF
         eFg2B7/Wq5A92jL/TG6o6/NScCksFOC5WkTTE1qIpIRWLqxN0xbjILGuOM6wSrDaMGTj
         FCvgAfhbwsc+LBPVUHc/aiaLU1PmhQzRdABvRC0QDCq6dBY7gTSxTrxmCmU4fjF+OlBD
         bCb0K6lDdOjD6fZEdalNt00W8puHkrkn5ovPV/iPfbjogku4ZOMqxSKMFkjhlH6jetA/
         yZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnp54r6m7YwX1P2uQ2/7tf0SALKtf7drjWAsmtsTPfgG2iZ9Y/xaEUfXbZNkuW+QQNIDU8QmWIZvmUfg==@linaro.org
X-Gm-Message-State: AOJu0YxILf+pEkhBp8EWEFnUDEW3UTwUxVbwl3DaQBbOdY2OHKisN6TQ
	+9bYDlEJ5/B2mv+sKOmsDUEt0ZVSFTIEXbWDlNJLJUC9yWDWDyOp/JkLK9UHxM0qDw==
X-Gm-Gg: ASbGncvVGuA5weM4yXpdPWK3nu6WlxU0Y5HXmlK6wAUuXVrdBemkkX6u6Txr1Rgb0ZN
	IHYJO9uPC5Rw+njtps6EwmWJEFok8dCaujwQzaEeltbJalCIksMs5whLHrQwMV0uDd0e0A54dxQ
	M4Xj8sT1Xu352H/2+sEYi4VX8lEBUdtrb1GUb4eHSOcsmNrrT8pH8PRI0xFhsV/jr/qYYyZap63
	fUYM9tBEtpNoqG7QEqqk12H9M6Ixe5CSE0C5q+Zs2HznANtEjD4FMR/WGAdSGhEp4N6TxLS3M/R
	MEISSDawMR4yiBW787qpsXM7yTpIhcQlJsinQiHPODuJ8deceeuwVN/2i5W034iOBHCh3lJimwd
	abA4c5CB7aqRkNsSW4PxssAVE
X-Google-Smtp-Source: AGHT+IEGwirHslwhuIZ9+rShS20f1JaFjO5yKz5qatVFPhxgLt8HRbW4UFj1Y+LjXp1SbZ9We+Nlvg==
X-Received: by 2002:a05:6602:398b:b0:864:4a82:15ec with SMTP id ca18e2360f4ac-8669fad4facmr76490939f.6.1746127844964;
        Thu, 01 May 2025 12:30:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aac7f4esm8058173.136.2025.05.01.12.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:30:44 -0700 (PDT)
Message-ID: <91c5f1ac-105a-4567-b1c2-e1d230d8cfc9@linaro.org>
Date: Thu, 1 May 2025 21:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/33] target/arm/arch_dump: remove TARGET_AARCH64
 conditionals
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-26-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-26-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LO9usCAqu8Jm

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Associated code is protected by cpu_isar_feature(aa64*)
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/arch_dump.c | 6 ------
>   1 file changed, 6 deletions(-)

Should we assert() in the callees? Anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
