Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1149530njm;
        Wed, 30 Apr 2025 11:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUn+wrS6WGx01Psmaaa3EK7s5zMQA718iha6I1Ccpl7veSP8lrNh0+dktWelXcZcK/kHXDQKHLB49j41w==@linaro.org
X-Received: by 2002:a05:6a20:72a3:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-20ba75f0089mr317858637.20.1746037737368;
        Wed, 30 Apr 2025 11:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746037737; cv=none;
        d=google.com; s=arc-20240605;
        b=YqkPHm7HbuV8pcja2dyvQefG5bR5tJ+Aw+/hDwkdr13bRs3C8SC3AaaQm3t/dhnX2K
         p7D2OpU1eFLuAGvQg7tSGu4QG/lVeioIqzId52wnEfEEmRZm1ARK3cVMlCT5esES45k5
         PzZEV/sht0wjBjT2Tq/yX9KcVV6ymNgqWuhADw3uk98GD/ME8DwIGSembyjxK58GSwdf
         WDIRTadVVy20/BTfsLg4pj33PzcXn7hDfkZtZH4ZWlwivWOGY6/w+TOFEJDHdGucluE3
         4iV1JUoSl1V+RNwMXHuRNBTo1jkCRXM4TDE+QzlVIhsfEIQYE/tHsImsV1chYhgpZi7T
         3BCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xf7StgsomvAyHveK2lC2y8EKqAE1ASvZR4bG/e1uZso=;
        fh=JG7RcaMziJ9PFFSa436TN/NeaNiosy68kLxH8Tftc10=;
        b=Vz07eEmVR+bfg03HohpVUvPzh5SHPFvRO8867+lOOJEZJ3jggelsFVOzgNrPMdwKP2
         16dNP3TVNU+CUD3+MoAAvGoBCU57m+vCFJeao7J2z5Qyeg0zLbrWS6Q5rx5Huyc39moL
         Zq/jj8G1i58sgDalE2ztz71vDhaVnhuod25BRgncuKAtw7gPuvPsr2uv5pkmL740qWit
         QEfxHAMsKy5kU29wS5smLmDfyjDA/WyWnGMYMN1bCWZ68cG7UwrmkW2puDM6p87bo1X3
         Lz/8N5OVX9q+y4gPGPS6bQQoEublEKbdUT+8WUiuUCOCSpp6gWyr5ZtY+02/K1Qm4aFV
         xEzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0B6dfDT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e2536184csor8616361b3a.8.2025.04.30.11.28.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0B6dfDT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746037737; x=1746642537; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xf7StgsomvAyHveK2lC2y8EKqAE1ASvZR4bG/e1uZso=;
        b=r0B6dfDT5oY26xKbNlSnx7ry/cLrRFAeJfnySTXaxa5solFyMqb+sEQJxHFWZyD45w
         eYocChpJyctScVsKSJ/gIldIvEL8BtgNzF+CZR2d4tSxExtdoj4eu2V5Su4Dz5OiH+HZ
         rIGedVBHT5fOkJ6cnnDu/baFb8priDgxJyyDFvwfJk+Lclo+NEuau0PCjgb/j6vtIEJt
         vyU12R0s2ca4GMBq+KmRSniLXvGLCkBbZdkMDlKRD55WUhdhwZ92n2OHAGWyXlpWrOzG
         EH0N+lDPJZgXycLmT8g5ZhqUL8OtVOW71aPJxyXWGqhynWSytIOo0euCQIkJWTUAFift
         zIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746037737; x=1746642537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xf7StgsomvAyHveK2lC2y8EKqAE1ASvZR4bG/e1uZso=;
        b=pFOE234TmONtT0eZwPHmb3FvgOhGTGUayjZv6g42kKGG1N+VgpsKeMh4lK6PifsHIt
         +sjrHUJ6wb9fOjdRrbuTXbXb8h7ElRm6Yq9bwLlKsEZd0KVQqUnb5YQ1UbgwIOVFFmdw
         RTyBZhtds0kawg0Iicr61vyzBAVrZsGZbGpoZ12gXgdKMmm9Dy/KwYJvc07OSI//3Yl5
         CNmrBayoyJdVJnmE0xZlIOWZDqo6g9Ez/Msv5/isrESukRocPcd4ymZkTZtpSZNnnic8
         zq8isMRDSrLsWDQgCCYVBnX/rI1mQhNhBLSVPAwe9hcfURDit19eR13SwNAZsRksNDQq
         ReGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmTansHt5E14BClYWo+Cd6Uc7CXL22U6qfBRzMiI2s22QvRDjP5ISVozhGj5ytkpDNFSwcdp3LLBftYg==@linaro.org
X-Gm-Message-State: AOJu0YzY/Fst/alUjQeFiV4UPdvUuZTgBHJZ0Ngw44kTRL1i17NPLya+
	KyxZL+j15tS5nFqCLFdz0DNEg6osyqJ5x9vC5Ef0dyZM29NRYaLwkjjMoP/G4cOfng==
X-Gm-Gg: ASbGnctFgTjpwZie0B1XcuJFz30JxeLYbJSUXqRcDi0DRuH8cdly6znHFtrH65mP9BK
	jtr0B1+urHBY0pJSQPv7EiwW+4z7imIDelkXJnzYljTtoKSHY3xmgeDEijbgpUs3stft/tYVa3F
	4WucchkvNKw+41NWTUsoxhMM3Tcdcfln7hYyMrwYG88vnjKYrf2Z9t2E66K9MpDmRAzOdHnp/cK
	Z7BRjzPot1Z4wp0nkrpzpUXXPMvhCaQLxuLGlkAKoJZlt9SYNdZtXKk6UeUyes98Q97kQ1WL+bb
	fC1JKDjZRa5kSrq1dsXtI10c0x7pBNHTz0ABoKaEyKeUiTyJjimDdddeorag6eBs3Afy5BLTY73
	ZTCQC0qD4rLecwLml2A==
X-Google-Smtp-Source: AGHT+IE4vHbPO94ar+fxRmmWot5znQkTAFs5WKYYBmdHcNgDR8Z0P7yQbM9KTvnMqybbIMnoHBwRnA==
X-Received: by 2002:a05:6a00:a1a:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7403a836358mr4833489b3a.22.1746037736866;
        Wed, 30 Apr 2025 11:28:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a8d256sm2001099b3a.157.2025.04.30.11.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:28:56 -0700 (PDT)
Message-ID: <34184e10-5337-408a-9052-d6796ab14494@linaro.org>
Date: Wed, 30 Apr 2025 11:28:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] include/system/hvf: missing vaddr include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-3-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LjFPTok5KDlb

On 4/30/25 07:58, Pierrick Bouvier wrote:
> On MacOS x86_64:
> In file included from ../target/i386/hvf/x86_task.c:13:
> /Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
>      vaddr pc;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
>      vaddr saved_insn;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>                   ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/system/hvf.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
