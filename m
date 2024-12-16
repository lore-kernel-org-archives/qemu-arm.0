Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2425406njb;
        Mon, 16 Dec 2024 11:10:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHxYHAMutAsX48quCE3K/6njPQZHscDZKtEKClSfLwbQLbAlztMd1gjc/L7zYPhayY+PZFel6aHKsLNQ==@linaro.org
X-Received: by 2002:a05:6870:ff8e:b0:29e:6f32:6da1 with SMTP id 586e51a60fabf-2a788fb925bmr520976fac.31.1734376230037;
        Mon, 16 Dec 2024 11:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734376230; cv=none;
        d=google.com; s=arc-20240605;
        b=P6oD5if0lTDCxgNteydL0Q3NGl9aUmXTf5VJ/JHwVrd6OME2TVERWUfNaj21QtsNeT
         qKb0Gx0bf4Mk/VfkBQKiQWljANDCBqf1DnW/YsAiBoe9Y3XV0Ob5F9XzrHF7DG1iHIDP
         UjhV3sQEdEZ9R8rDrZrWuyK97tFgkuTVoxQA0s3jyRxCzMBsKlVm2fkMY7PPcewQW70v
         sselsvnkFHKOseoUJSFb9iMBR4TJZjzaGGGrctoUzj8Qb3ptWVdhgdE/mZfN4f3EiQFW
         2Vq7knlvcZ+qSHGNBX7zhn9qi7heL1HuIoA33s077eCyWW6z9+PvkDQelJWROHbylS8y
         54lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vrMzXbGQ/6saqJjq9+YQdrMgVIjm8J/9nparMXKjcCU=;
        fh=RBFNN25p46ZgnNeEh3jTShyY1HY6jsILV5mywUbyo+w=;
        b=GPTrohGeTqGfkX7sfY26EwQzxs42iA8wKvS5nXYYL9GI9SKpz2YpMlEBxFLl3eYiGi
         qRagKHyapnvjFFoKNsTrEapxdNGfqyaSr6zh6wcQCMvY2BOM+4uMJGocQwt5VwRHy91u
         Q/aWK/AvnpeLEaaR0msKts9fY0H6RIad/9C4sTPXtmoYrdr5i6ouYc2jJ3hjukb6X7Ey
         DvSTeBw3ZQwCZ1LZRUP3ygSgGzjRT4jcWFBfM+D3yO4qESWjP7nlu5kSr4Fd39u1rr4Y
         as7PsSJT9T2XqZ9Lfr05NqWn33C4w2OanpvRoY4a/7n8W9Nr7sUrDcGnz9Xbz5lgXM1D
         1VRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MR772HV+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-71e4845c32esor1918140a34.14.2024.12.16.11.10.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 11:10:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MR772HV+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734376229; x=1734981029; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrMzXbGQ/6saqJjq9+YQdrMgVIjm8J/9nparMXKjcCU=;
        b=MR772HV+IJiq1u8zKSzGdJbb0lfzjnVbveuzR8sl3boX5AKuriVbFKmEUpHJc9Mvq5
         Pyj4NsEztsZ77ng6cdmAgYgGqodqHJW9aMFycZFb3bskkPD/+jDPbBoq7evwPIN7sccB
         mDbYcbF0X1WpHpZP4jChJXXleL9fpQWpskWnmMchIxeUhpyjbPjf4vO/qyUtVfyu3OiE
         JpkTE32GC8xPzir/c/JZUIQV7as8iNaG6cAgpPbyfU7BONWJMHfZHnWQmm+pAbJWAcIU
         eGYczXRbt/VMb2DoKgUY1PoCUaaq3MTmjIl6aZzz6lmla/QbFCza6/eMkr8outFsLgN8
         frhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734376229; x=1734981029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrMzXbGQ/6saqJjq9+YQdrMgVIjm8J/9nparMXKjcCU=;
        b=gohQ2q2/mEljsp/ZFsLHLHYq6OVqnjNz4xa0L0f2QLAPpQv3jwUCE9yA/4z39PxtqK
         Rwqgve/5Ah7ROv1AHvnsnj1Ut70Zz1YGW2W5FA2dLwhAVe71joZq/55wxHhNV87sM7HC
         jrTg8YuGvniv5GdgMYOXwumzfwNpGvKHiWgYPzPdvphnE6LS2SIaae0EPSCB/HZ5w9MZ
         1R4aDlfT48LO75N/3LKBksq+pqw0G1erOURkgsQGAeJSnzyyxzQhl/7lmrY5s3ChKEkB
         pSw8rKij2eo2+5EeursF/XBypq1djNjus3GFGKtuKwWHH6REjb+7upJfI4SnCnG95DcU
         tD8g==
X-Forwarded-Encrypted: i=1; AJvYcCXjEYtpEBQEKNNWUBBWTgIG8Za+EoZArr5exVXaXzg9502yA2bMpZZ0xJ0mcPoHhOuk3HtlZjLUDXvZeg==@linaro.org
X-Gm-Message-State: AOJu0YyRnAECnOUa9JdASyoehgScuk3gExQePRBllq5oOZvmXsv9qpK/
	b50eBfaWKSJrtl4DziaJOOe+qKsJHOLvIxPwRbgnOCx/l/5IaTJO0nDwcUQAXIWayQ==
X-Gm-Gg: ASbGncvmx9bEwjNmQB03dJPDKl/+LPqrvyS9oyF0Vd3t6bNQB6KgBUldFNBK4AuC3eJ
	dTm52ssbU+ZM35bnNX2jUViuwVInUSiOnHRC7rZ9rTe2UO4VZ3Zjr0mzAy8nZ4BI7QIYHrwTIG5
	8OrHChpQq1QQi9jL6mgQmrFVscY/VS5fqpHYxFaZE5Xm6tO3VNsZfIsQmzlkm8dV7Ra5FG6p7yU
	3M4wnYKdnruzGaQ+zYnEQ1l4bVemwXLNW3Xe+cbKDwawM5a2ov5NYSnkzB2cdKvP5Tcgw/S9mGM
	BPTjHonwizIo/TjcyYJwlk+cxir3NzdBYQs=
X-Google-Smtp-Source: AGHT+IGNNy3SvbQnCH/70Byv4fsxCVwaA8q+xVu9Qw7jp+XKmDKbZVcDMj4AV3JrmsSjmHNJhgOfzQ==
X-Received: by 2002:a05:6830:2641:b0:710:f375:a6c9 with SMTP id 46e09a7af769-71efdb92b78mr601421a34.7.1734376229525;
        Mon, 16 Dec 2024 11:10:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71e48308005sm1545654a34.13.2024.12.16.11.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 11:10:29 -0800 (PST)
Message-ID: <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
Date: Mon, 16 Dec 2024 13:10:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sVXVId/vQ4m3

On 12/4/24 15:12, Pierrick Bouvier wrote:
> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
> spent up to 50% of the emulation time running it (when using TCG).
> 
> Switching to pauth-impdef=on is often given as a solution to speed up execution.
> Thus we talked about making it the new default.
> 
> The first patch introduce a new property (pauth-qarma5) to allow to select
> current default algorithm.
> The second one change the default.
> 
> Pierrick Bouvier (2):
>    target/arm: add new property to select pauth-qarma5
>    target/arm: change default pauth algorithm to impdef
> 
>   docs/system/arm/cpu-features.rst |  7 +++++--
>   docs/system/introduction.rst     |  2 +-
>   target/arm/cpu.h                 |  1 +
>   target/arm/arm-qmp-cmds.c        |  2 +-
>   target/arm/cpu64.c               | 30 +++++++++++++++++++-----------
>   tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
>   6 files changed, 38 insertions(+), 19 deletions(-)
> 

I understand the motivation, but as-is this will break migration.

I think this will need to be versioned somehow, but the only thing that really gets 
versioned are the boards, and I'm not sure how to link that to the instantiated cpu.


r~
