Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36761njj;
        Mon, 28 Oct 2024 23:11:04 -0700 (PDT)
X-Received: by 2002:a5d:49c2:0:b0:37d:5143:c695 with SMTP id ffacd0b85a97d-3806120ce8emr8151931f8f.53.1730182264115;
        Mon, 28 Oct 2024 23:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182264; cv=none;
        d=google.com; s=arc-20240605;
        b=Rw52PGi0W9KlJIX/2hBpJRDlfPhI9pluLbCK6/h0Hkww7DMccNxS99ZWldSQejDpo7
         SIBrBI7sxFTon8xj7HWu0opUhn/+Uu0UjA2YO6gfxD0QJO5KtqJwvc5tpgOJn2m3j5CG
         EPh1VygiWjiLw5eoFS/1a1Ajh7LlFiTU8g88EhTweXJBBBSxx6w4alg9Ak25aZNTyTn6
         wW891rHOw19IvJXmshWgiZsJLs4IY/PnZr3pTMZVoFPx5YzhyGiA8Hn6KhzY3O1MxGk5
         WX4bzpW7V+vdzxD7VaqSSN2ZU6JAvwCVaC4C78rPMUv/gv9EwY18Gm3fy5I3roT3wU+O
         HQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tw0DcjFPqeWV6b0ZQwg1a/UUMvz8Gie9VHVdzuTQErg=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=KlRMiuI3O/XkDc+FMYWgt2s3F0rr+WXb7XfvR9DUqPZggmXVBnj2o6CRYplpIYf5ZK
         tlIHPZrgr4p+jVHPXF3SLl8nSk0K5gKJRE2G68thSniuPeNcu493EYKXUOFPCpphqO79
         96uR2FnPlQ2Tq1RQU5B0LagTTubikLU0eiD6wOdN9y1yLB+/gkM4/DI9KPbzuVDxvDiY
         mzT468dHsXgZAV1VtwQAbTYPL4OY4vbJ1eJGIGmdCaUpI7Mi8i+H8LwAOpmNqbWrmOiC
         iVT40Mefh9f/Tqof2Jon+66HQxRzhoM0+TjprmjzDOVF2IYsZ8ZkY+dX+cu+ncc2J/5c
         w6Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pSM/IHn+";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38058b9f1c4sor2441210f8f.6.2024.10.28.23.11.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pSM/IHn+";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182263; x=1730787063; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tw0DcjFPqeWV6b0ZQwg1a/UUMvz8Gie9VHVdzuTQErg=;
        b=pSM/IHn+41WQQZJLmubWnH8Re6K7iyT6uE00dqz6hdO6ofHCS3NOy6VN4eieiPrQqB
         lQphwxYVlulmiEu8/JZRcWic3rE48v6odP/xtM18ESeFLHieOoWBWJpaEAxCKQIy3Dif
         xaXR+uaMZbY4aovcC+940ECE/yeccZbQf2SaDObGFkDjMb4EHGccaHRsHKJ0YDyAMVjW
         4S36qZeHSWxFk70njCakdD79COQoiVFBG2lTmT8W+FHBmmGGMbFicSP5481i4pIpR9G9
         alqrrsf1zoKgm+iLrAB+bYk7ILhSK9PqiERVnG1RUuQRfx+NwWrBhuIwCf7Sp83k+XUc
         Nzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182263; x=1730787063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tw0DcjFPqeWV6b0ZQwg1a/UUMvz8Gie9VHVdzuTQErg=;
        b=sQV00HLfK9l/H5rS+58lgFqw73swkWutQJDrtXE4ofWAWow+oAtH1LyZSe49hyob9U
         zXESx0kDByAE0/aXy1WQmqpA9oyG+4YguVb5GJMsQ+DNaZ57SkD8nbqdJQVMu4hjm9GM
         juf3Ibuj1eFmQXI+G6Pq3XwaYWxplxfY4PnFZBSZh9yMclUeoCHYaW9k14js3Q5sUADS
         ecXDLBB6mMRLXlC3oKpH2oDsIxaWT4aTbVp05yyhRtG6YL34Qk6VmW+YmjOIW6fcob4a
         zo2eq46ElaFO0IeHW3g+7tY7MPMD9RwhVuZq5b6B2x8DxxrD4dlOB/DbQc8OPEO+FH1p
         5utg==
X-Gm-Message-State: AOJu0YxSLnQcS02bg+pGn5x2fuQpijhOImYxmOiFXmbMcFXTcH4Tf96C
	f0tKxjtpUmlBjiPLDDMEAh6T8bRdsQl+fecTOHpG+42qUT5Pbn4ehNz8qZeAgvwKHA==
X-Google-Smtp-Source: AGHT+IHEIBaUPLujZoLe+2YmxHoZVxCs/XDKvKfCjBQAN/BRxNhY2YNAl35PmlHRF6naiPETtr7nQw==
X-Received: by 2002:adf:f411:0:b0:37d:4e59:549a with SMTP id ffacd0b85a97d-380611418abmr7798213f8f.16.1730182263481;
        Mon, 28 Oct 2024 23:11:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b45aa058sm12150405e9.1.2024.10.28.23.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:02 -0700 (PDT)
Message-ID: <55df000a-d9b2-4097-af91-746f4000c21a@linaro.org>
Date: Mon, 28 Oct 2024 12:24:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] target/i386: Set 2-NaN propagation rule explicitly
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-16-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: bsD68LBP350A

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status words
> used in the x86 target.
> 
> This is a no-behaviour-change commit, so we retain the existing
> behaviour of using the x87-style "prefer QNaN over SNaN, then prefer
> the NaN with the larger significand" for MMX and SSE.  This is
> however not the documented hardware behaviour, so we leave a TODO
> note about what we should be doing instead.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/i386/cpu.h              |  3 +++
>   target/i386/cpu.c              |  4 ++++
>   target/i386/tcg/fpu_helper.c   | 40 ++++++++++++++++++++++++++++++++++
>   fpu/softfloat-specialize.c.inc |  3 ++-
>   4 files changed, 49 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
