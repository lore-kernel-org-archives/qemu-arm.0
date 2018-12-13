Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1353110wrt;
        Thu, 13 Dec 2018 14:21:34 -0800 (PST)
X-Received: by 2002:a9d:3b83:: with SMTP id k3mr474226otc.318.1544739694267;
        Thu, 13 Dec 2018 14:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544739694; cv=none;
        d=google.com; s=arc-20160816;
        b=uni0/7Hl5mnuEnVAkQ4EShYPF+s911nijlTQ1RPAtiXtWYTfDamVsM31AGnc8qN5DF
         wvTFbLj9wKA9y/LfnqTKpG9wVj89qay7vmeMlzR/Mp59HuXrNIu16duClS5iFK2hhbyQ
         35z+M2VCph1c+OLG7XOI2OPRFVGGBzJIBRfM80i7x6pLOs6e5JTmi61AOmJjvnPwc/BH
         clFBrVc5TFg+9Jm2XOufb06cAT1iyuFlnZLUBZBfn6JnGk8N0hrDUXEYu+SSGHS+UhIt
         BqtsJC0nGZL2oYelHPAX33O+z536toSdnaYeC+klS4aATjbZE212S4JHdR2Wz5J3TT3E
         Qvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=wKVZt0uV16vG2mzJCHryCoj7eV/YQu5KMGwbKSzFcX8=;
        b=YW0kvVZ77xEAnxEjYyNDf/ntwbqGZ6Kz16KGh95/Moeatxl7SWz8ZjrzG7Jfd9TQTn
         /3UaFlJpPK8jiFFXpF239J07z7X2pS3Zeso6qNpzT3VWWjLc0AHBK4UZHA1GUh+kQuBl
         cKKwl1y8qUz9SGi7mXRrM4VylGpVa9tHSwE1h+QdZ68ypccgaFjARK7eFye+NDdKa4Sx
         q9TwO6dpQGgmuMl6btojWm9lzZjpuuGtyGdMtpQMIjLxumNUSIuIe1SqrpT/DpAqM6NF
         uOf25VVlFnEJxG0J10ZeghO7s6REv0m/k5O76Lob4+W0tPwN9jxyCxXIsQZX0bVEwqiv
         x2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwepLRji;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b24sor1908805otl.83.2018.12.13.14.21.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Dec 2018 14:21:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwepLRji;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wKVZt0uV16vG2mzJCHryCoj7eV/YQu5KMGwbKSzFcX8=;
        b=GwepLRjiQneil+a8FXeXYR1+JYDxt4rBjKM9L6LHaukDT2UvnR7G1Pg1FFDjtQpRIA
         duMV1IzVbSnnkk/go+EaZ4kyn1YCnGNNhweRcRAiX/rOY7UwHPCC68hfTRRvR7LkpQS1
         Ivx3ckaKnlBFLvyuGvkLA6qqK/cgGpHKA+vsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wKVZt0uV16vG2mzJCHryCoj7eV/YQu5KMGwbKSzFcX8=;
        b=YIUbtWuQFvCMNBaOBNJ30jgf5GGMIx0Vy2dAo8w1Sqg5u9v9OQvicNoebEnRviUYwA
         ODkBi7BWy3wgLI2nmwPr+5F2Rmztz5r84bqP1TRj9wZA2MMJ4FwS0Keu5+CrI5wEsGg1
         I9C7CoFirhjs1bF8FzQLNCEbsK2fnA77c6xZv4zmzIBndBlKHidudeYOvRXDaa8vD8mf
         4A2HwG7Uu7C9PmkwOr1zlsfYSzVK7E4KU45wK6aG0nP/mVfQUhWMW5NAwJJb/FYG5I1a
         niZLx9INEGxD6cGqQkW2wQyyYrbhLZ33ysy+P22XL4VknclE0JX9EzyhKK3EYveYPaLx
         w9/A==
X-Gm-Message-State: AA+aEWYOxnqnZy0K0otZVtFlY0512ACONCt1Wqi5cK8DKHYghr07fYAR
	+bmNu40oWFhinRpYRLj+vF/4r3r+
X-Google-Smtp-Source: AFSGD/VKV0AqP2VaqvswEPlwh6716alK53CVRdZoxSlTfQjPzwaCsMKNxcpZNj1IAR4aMow/0pdHPw==
X-Received: by 2002:a05:6830:1004:: with SMTP id a4mr449084otp.254.1544739693819;
        Thu, 13 Dec 2018 14:21:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([187.217.227.243])
        by smtp.gmail.com with ESMTPSA id y25sm1368747otq.60.2018.12.13.14.21.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 14:21:33 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target/arm: kvm64 make guest debug
 AA32 break point aware
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: mark.rutland@arm.com, Peter Maydell <peter.maydell@linaro.org>,
 Omair Javaid <omair.javaid@linaro.org>, ard.biesheuvel@linaro.org,
 qemu-arm@nongnu.org
References: <20181213115503.24188-1-alex.bennee@linaro.org>
 <20181213115503.24188-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <035046cb-7a0d-8049-a102-103e0a8758ed@linaro.org>
Date: Thu, 13 Dec 2018 16:21:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213115503.24188-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RIjkb0p8oEYa

On 12/13/18 5:55 AM, Alex Bennée wrote:
>  int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>  {
> +    CPUARMState *env = &ARM_CPU(cs)->env;
> +    int el = arm_current_el(env);
> +    bool is_aa64 = arm_el_is_aa64(env, el);

This will assert for el == 0; for that you need is_a64(env).


r~
