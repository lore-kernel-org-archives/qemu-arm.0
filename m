Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2651293njj;
        Mon, 5 May 2025 11:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWi7+TY6kwFmZyDCu8OyHiTNpQxKjqY6jJydiSsFpdwUMP8HCmT9QYh2N8fIuwR34QLrcfijXmtF5IEA==@linaro.org
X-Received: by 2002:a05:6a21:398a:b0:1f5:a3e8:64dd with SMTP id adf61e73a8af0-2117dcfed41mr598792637.0.1746471135140;
        Mon, 05 May 2025 11:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746471135; cv=none;
        d=google.com; s=arc-20240605;
        b=b0PnI2wCcjvgiDj41HnAFjsozHzaO/JlOeAH1WHAjg8lhnInZvwINcHbCFeQWewAf0
         apyETFxo/nZocIvNUl+cQmvBgLtVSoFvEV1hcUaXgJqHGdjz4kLdYLuQyLI/gKihTN0t
         Y84x5atJ80K60dNNCUx1JeNczzMPoYG6JMUyIugMV9UdYJxNU6pdlH6BCU4EkMKVnKnU
         kMeNontwfBrRNILJNJU4DIUbPr5VjuwRjfCMVinRM0Vwqm61KUxDKyEUCQuguQX1lt6C
         9I5fO9Nziwsma+grIiBVWDXm+CVElfuM9BWBxUbbKdiF70aK8h962IkEP5tW8SRPPutu
         J3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=00bWzvaWCIBwpMCAX5b1llfSuwpHrhqcBu5fE9MIR+c=;
        fh=LwWnZKRw0ZmFBi0I1AbpaE3uDbfaH5dWn7QOcb2sXl4=;
        b=NHXXqGcCClUaItEB3nQ/otZI6xU7UO4f3UloQ3IXPhRULvYvj1CbI1D0M5JhelDk4C
         M/P+wrBC79ZzmuXH83HI99GlQgA84R5HCgj9ZopjuIuuhRVYNSNxFM1mfUVsGcriJFhj
         UgtbZMT1In14HeOrYaQEqtJQZ4EWOq9JUNXiajgibnTovqMwZzA6CEJtaJsRHT2EL+EZ
         IGXfFcCG4vVBpd1YXNiXZQXlYOoeSS20v1HHbeoEFNASy0BE6HIiOWn2KnNoXaDoUFKs
         iUEu/0V1Yc5EI8oEjncU1hlh0RIvUKxMRrDyu4/ElszNg2u3lLJWGjweTQBgHjtTs6k+
         eRTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEnY8mvm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d4a0760sor5033072a12.1.2025.05.05.11.52.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:52:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEnY8mvm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746471135; x=1747075935; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00bWzvaWCIBwpMCAX5b1llfSuwpHrhqcBu5fE9MIR+c=;
        b=pEnY8mvmqINhyWsbipNeuqWFhMaLIytJXaZVrfoEbOrhoq9yylnO1jMpe8f0TRoNvb
         JuuOv08o0yzBmBYmt9F591JOoBaU6D/pL/QmAYP2SKaPTKv9AuEFst6PogZL6VP6f+Nu
         XT04E3+/mude1VlFlfqrHG3+x/GgOxGqGb/RaKOcdFV1fWJWepsk1l6EYI38Wp1HLq4n
         BRPzrIbdf7F+uT66cvD0W412MIeXpRPewPLMq1rf+vH+GPrMa2Dox+/hEHYACBGVRtSY
         tcRoFwDDYUxKlS02y/E3UUXsN2qBmEJbFnRJzA5xYnSaknO80DFt8/8OSZUJoAGypSg6
         iiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471135; x=1747075935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00bWzvaWCIBwpMCAX5b1llfSuwpHrhqcBu5fE9MIR+c=;
        b=QxotEKpNsR6sIJnFnZnFGwpbSactXEkXUWUjkdbTJRqspgWralgrezy/h7uCKLfVDC
         xf02AmKDzcGzTtObVIHVjd7A2dKSPs+9ml2cOkYyXYsxEeZkKiUVakfBH9zhlMrsbA+s
         3Y3SoVBOrZXpRdLWiOuFgqXL+YEOcI1qkU7v5cQQ+r2rwVeGFlkFm9hTDGF3V43Z5N17
         mqig8s/+h8uULB2nURPulX/552lYNKkdOdmAZdVksE0zSGpJxHha7fdjuHNLVs3025g2
         1ROLN5yeFKne3maINd9r5Ump88A87z0apZD40f/IkTguCUPUtTMEuAZQZtCksLqtTqsx
         p13g==
X-Forwarded-Encrypted: i=1; AJvYcCXrgmprXF440r2oa0I1v+0cUW5f3irXLaJ18KZSV3QvctXQJY1mZ3yw8RzClKteVknHv5bKS9Br8zoBAg==@linaro.org
X-Gm-Message-State: AOJu0YwUt7YUYAabPaZTi0F8XxhkVchKfJMjuiFogLKuXYUfDqxqTiEk
	VnS8E1MGfSBSRuWhxwtNSEenGUY41FzinG3sg0pR+qYqhzZAPTLDeoPh3FG2Ld3UJQ==
X-Gm-Gg: ASbGncs4FsJIz5knC+Q83fNRbRsoOtBqQ6Q7IIIbQ2q1LFWtrG90xygjp8vPXp4Mqrx
	S1IlCtirq21Z8tcn3QdLj/NtQhGhaK6bgjA2Ax6o7IlfpJCG52vH5Ue2aerNPc7cu1pUUkZJdZz
	T0v4A9zYn+pVg3llxQGYoCC5Ma8Ta5DWBARRUN0D+QIt0aeBfJbzHbAnIqqOrZSwhlvOtQU1QDx
	jn8K3zHay+ZQppu79e70LXgMiAi7+GaLQifoDJkdvrcbmsFumjt+T/RcTH4mxg3m73RUzfFYAf8
	G/OpGtWyU4//USZBu8Xt8W+Cn1Yk7yUKL7LknnKFbtClUInpx/fJQfWzdClHJNG7y/q6EKUdBrC
	JTwZLWSg=
X-Google-Smtp-Source: AGHT+IEizPqXMalLaQpsANWhLbP5yYDSnFHw4NZQia9c2v8i7CH2qpEo3yLuK2W8tSkgyFV55N+vNA==
X-Received: by 2002:a17:90b:5486:b0:2ee:af31:a7bd with SMTP id 98e67ed59e1d1-30a7bf6ccdamr673874a91.5.1746471134659;
        Mon, 05 May 2025 11:52:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm58715695ad.96.2025.05.05.11.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:52:14 -0700 (PDT)
Message-ID: <ee6fc6e0-2c94-4108-a138-920ec3fbf15e@linaro.org>
Date: Mon, 5 May 2025 11:52:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 44/48] target/arm/tcg/neon_helper: compile file twice
 (system, user)
From: Richard Henderson <richard.henderson@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-45-pierrick.bouvier@linaro.org>
 <7ff2dff3-20dd-4144-8905-149f30f665b1@linaro.org>
Content-Language: en-US
In-Reply-To: <7ff2dff3-20dd-4144-8905-149f30f665b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ayFqg1n5BCnj

On 5/5/25 11:44, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/tcg/neon_helper.c | 4 +++-
>>   target/arm/tcg/meson.build   | 3 ++-
>>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> Likewise, I think this could be built once.

Likewise re crypto,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
