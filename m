Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp499678njc;
        Thu, 14 Nov 2024 11:24:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTGc5Yir27/w5SMmUD2ATDlcgip7IEyFc4FH6OGLknRDUDfJ8bvCPk6o1xuZyIQnv09unTm2dyPtbQ5g==@linaro.org
X-Received: by 2002:a17:90b:4f4b:b0:2d3:c638:ec67 with SMTP id 98e67ed59e1d1-2ea15202e92mr143189a91.0.1731612247944;
        Thu, 14 Nov 2024 11:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731612247; cv=none;
        d=google.com; s=arc-20240605;
        b=ia9c83bLFgN315wwgjDBJ9l9xEnkTMMrvh4GIix7e/qQKnTjhktmoXYSUfd9XMMISq
         h7x3D44gMCn+AAfsVc/Cn01Be651Vj3QNhAWa0pesd+AwDztGLhJLyOxzXg94hGwv1ye
         RY/4ESu5PdEFDeOFHgaPBp+U+vM1E12wesdS7nLyyFIK2fUF0qwZ1wCV+3CDD/4w3p6v
         9ePvPFeeEytYxlhASmfPcxIpiOhY6Tn7JNUEybx/8sFLWUHVEvXes6k8xSq7A1vUNP/O
         oVLpvCPZ2q9ecKTGBpJ3POmLiVJ0JZKqPSY8Q1BTKGgdQwMWbHMVrZqz57Hs38uoeaNX
         Lhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nWzEEnlQd4+qzmkCl9aS0fWcrCHVt1NBXqcmw/IuSSs=;
        fh=+NfQj67xz/pon2gcfQ4M+52XCFEblJ8mUXxQzv/qZZc=;
        b=V3sTlH3pij1PRUXYB9KY8pmCItKlAVZHvbzPQE6LfStvHYTGqPAPf/3De7A3BTzc3w
         a/XcyTJVoKqIvM1KBy9ZLZZJ7DLkInVVucXiH06pgJHDYT2iELseZ1Qa4/wAm5TODizf
         JZes+/lMzTteb4h9/XwuUtHldj4G8qDRZAGqMmsmKKVy8uE+a161M3oaFD//ztz3YIg9
         kCGPHF09lIuh4ZCbpp8IuObqulqASvQndcBgG5iVhyjREXTveJGYYN1ldBlnbqqoEb5M
         63cUVDBcoLnT8tSjAQVWUlLvafjRB+O6i66F9nshwK/CTyD5K1K1Z7jNQaDQsKDTZzG+
         STiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pB+/9BsE";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea07e5ade9sor1320284a91.2.2024.11.14.11.24.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:24:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pB+/9BsE";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731612247; x=1732217047; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWzEEnlQd4+qzmkCl9aS0fWcrCHVt1NBXqcmw/IuSSs=;
        b=pB+/9BsEHyJDgNpIhbdL6omUKUCqluJ1tW30zqdQU1aYgfPswRwmYKdJ3b/Wd5akYd
         Sn3oqj61XekNY6Dks9IjqwLkonsNzjrXJBvm+VjBo1fsfnxieTrc2siqOMYRf2AMdqbw
         WH0fgInY2aQl1vF58syu6CxpRxYVw7eeKFM9gpqcsIK8hc+AoHL0tyw6L+/LQ8Tjtxwt
         URHgJqJff35nbfkZpxGrewIPQQyMi2ny2KHBYXBXIPjX5fw+kOgx7zy2bBtNkS/Q+NVn
         f4xTgd7LsXcAo/VNmx9KjH6YR+FW870XXyV5dbxh0YWSsIL0Js2L/5Fu4jFg1o22rNlW
         RKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612247; x=1732217047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWzEEnlQd4+qzmkCl9aS0fWcrCHVt1NBXqcmw/IuSSs=;
        b=npmnWWkoJ2ha2z7CsKn85s0nihCiaPqMibT5UxfWJYV5dAZ4UhoCWz3rIgO1LwbpJB
         XDv1vdrnLmsF49p7x7c6T5yEeERWBgDVYcclMKLu8tVYlV3IGknhJPzxdGg0BdRPaZpH
         1Q5QbQ3E5a4mYJ9bLZ/FFN0zRlGI8wQoz+ndfZsSLh0mgFBgid1L4xVWuTufmfaZRP5+
         KtqKcbfyv+pMi3EZaBLsdPB9KiwG6G01RG9yCBP4H2DCzYElUuIoaATrByDl6nL+Euce
         zs35h+oMES+hF+wbIy5OO2hpvB21IwMLCWw8F4UaQWAvUtKYvhs8oAFPVn7bCaAenESx
         xkRw==
X-Forwarded-Encrypted: i=1; AJvYcCVC6iJlu0LAQq0V59TI5QA+CgNJBtbIHYnLNgNRZABpHOL6eXkQFEpQLYIv5spJgSKFVgzQae63SZ6gXA==@linaro.org
X-Gm-Message-State: AOJu0YxuZI7GKIxM5aBSablWITlfqO8+7smtIbFp6HL9fZfXVvMlmy3+
	gVOHuLgw5wEhGL7SSpfOXh9dfZSPPrQqQgWzI/1n9Tne/RjJnTUTYjc5xjPzjsrN2g==
X-Google-Smtp-Source: AGHT+IEFNzWQS2Ydh+tt1sUmQqj/IC9+BHv7wRXaOAxzDkVw4G20S9b0lIu4eFluAR1M27fMoJg2Vw==
X-Received: by 2002:a17:90b:1804:b0:2e2:7f8f:3ad7 with SMTP id 98e67ed59e1d1-2ea154cd17bmr92862a91.7.1731612247433;
        Thu, 14 Nov 2024 11:24:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f1e24ce4sm3506278a91.0.2024.11.14.11.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:24:06 -0800 (PST)
Message-ID: <30f61376-41c2-4461-9e56-3f98748fd871@linaro.org>
Date: Thu, 14 Nov 2024 11:24:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] exec: Declare tlb_set_page_full() in
 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BeHxaF32X/BS

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cputlb.h     | 23 +++++++++++++++++++++++
>   include/exec/exec-all.h   | 22 ----------------------
>   target/sparc/mmu_helper.c |  2 +-
>   3 files changed, 24 insertions(+), 23 deletions(-)

FYI,

https://lore.kernel.org/qemu-devel/20241114160131.48616-53-richard.henderson@linaro.org/

unexports this (and related functions) entirely.


r~
