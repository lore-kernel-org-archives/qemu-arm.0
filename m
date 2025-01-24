Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp952572njk;
        Fri, 24 Jan 2025 09:07:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVKeNPReEI599du9Ga5ecKFQG3vCsrDJYQJlabEBKB6BkuWCf18AMHb2gZ/nS22ir2zsHffm+8oiiV3w==@linaro.org
X-Google-Smtp-Source: AGHT+IFD4UMTtxERzx73//xMXmRM4Tl98Sw5VBk8GCHeW1pUTrPb7flM2m7eYT2uuAfjelf+HBA1
X-Received: by 2002:ac8:7c47:0:b0:467:45b7:c495 with SMTP id d75a77b69052e-46e12a56246mr392886221cf.15.1737738476827;
        Fri, 24 Jan 2025 09:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738476; cv=none;
        d=google.com; s=arc-20240605;
        b=BRyIximRpT87sDEZg9MEBsIPEJv5FpWNgp9uLmCohkQ3mx+Y2WVGUJRZaoR2eOL+JJ
         vclc32KvBXtcM4c2enzWm98MO9Y4PANuUGKYjmxG6FNuAQ2OuZRUWy0jcSTdmWMeHO0a
         0CuIqelL3FRWvEfFMq9W138bwIh+vqd0Ox1/VehkKZo5M+GMZlG+fsDjh/gwWMDac3zd
         T4WWmwaH0NxYQ6pCW0LiHnQYTtR47gaDjq5RicAGmIYMypPVkuXCZCv/VR/xZPZOiIGk
         UO65LCrhVSzNlnw9p4osZmz+sEvXKoUKnr95IV/HcpjjL1n/EmkoxXRdcsPe6ckl5S5U
         bCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ubNcwL7MOw4wrbCa8X+I6HKjnSv8jNSDNrPOC7v+6e8=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=i3ebwBaAloY6walMUqcuIhpJjmoED1OAIIF0ukDm/dqQkFEd6u194tfk/R9iW3eYSE
         ZyYH35Dtyhj1fJ4MZudfgGmmckPP4HuUGebuY57c9yzIkjJubdyWuZZix1nSIqZ5+tN2
         VNndP94Zh5g5GIN6rrKGW9OJipBpAIRYCEw7+LONyPdcphcD9wTQLHTGWXzWXuL0pQpR
         Me2wUbUtgDNjOrPVSqu8ESBdod5VCvepdG0gSCFTqQwq8Rt5nfhKxdbGiCwyeGqLbevD
         EWryzMmbGzuc39FKl04PbB+Ej7c31W5KZNSMM6WrXOhD9ir07pFwgsB4BfMyCi6eq/Al
         fUYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dj8CrnpD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bcd1e7si31024471cf.649.2025.01.24.09.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dj8CrnpD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbN8d-00042Y-Ul; Fri, 24 Jan 2025 12:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8Z-0003uf-Ry
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:06:32 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8Y-0004u3-5s
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:06:31 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2164b662090so47374005ad.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738389; x=1738343189; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ubNcwL7MOw4wrbCa8X+I6HKjnSv8jNSDNrPOC7v+6e8=;
 b=Dj8CrnpDn6UV2fRk8W19Mv3LlR0cYuccQxMAkf/aUIfLg0TJ5l6zSxzgB/eu8mxD/G
 Q0vnridrV57dbImV3UlQCLcEpFGCX0/w6s1WQMVXXb2FoWVQqvRl+KZlq6THsRFWtbSb
 +supG83Roy11V0TSNUgd9/2GTLp6WJRqwvDTPhIUjm0UpvfHOBSDilRrCW/T2Ltvtbaj
 8lwZCl2+yRS5JPq+9Vj6vfCqaOpc4aq8j4i4cTNUqRlB1RLV3A4Iik5ovcHDoaIRl23w
 0TZhPuUJ0JPxGBFzBmdft8FMNGyu/RR+nhC6hy6BFJMH+8bGX+8DDfMdtRU97uEuO63p
 YAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738389; x=1738343189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ubNcwL7MOw4wrbCa8X+I6HKjnSv8jNSDNrPOC7v+6e8=;
 b=NEHjJGkZJuKJhvScJ/WPuSjNF/kKKjlQfcOsvq+Yrf9DTvt31jYohE9SxWOB7txVDu
 c56eeu95enSnY0DNd/D8atNPOZNDnKzeKqircmvDb98+uODnh8MPIiTIhzfJMesVRqJK
 jPb6mtwK1mkYPCxFLtKLD+ENpS5jMkfiZfqPBaVUdk8l3Wr7Pf7bqbv5J2PKQcu/+SnL
 v8DqwkjhA/ydQ7jkedg1CD76J6RZerT6afy7TIAIrfeUWi4k0Uz8ZPWbbwTgRIFw+DEk
 wc8ENJJFNffYOb50EXsqQyHlhpsd8maTvrBjiB2vLmiBYSoUF/CdJVNEtsp9eyCmvRmu
 pTwg==
X-Gm-Message-State: AOJu0YxggSPvX1jKV8CYSPIx3aLAwYdIc06SgU37ijeqv3fW0C6ztcVn
 1NJfqTW9k+OaVZm8FW7Yl/HtbxtKB8JMp7mV4K0MPIdGGJA8DtEY2Iv6bxc4nY0=
X-Gm-Gg: ASbGncuAv0zurG3cPDm3KOmcb+1bzppUemyRcOlZ+r2k+o12XceQ6+sR7+QEUVgXWjp
 YTyW0T9i4SSwM3XqgLLLradhU4RIJb3xgSJ2f28SxMfo2iTa5XjGtdWbEjd4PGk9dNPKi7kiKmo
 LcqD68qIN7RHZYZkpv+tFPSWHgX7T7pJxbRZP1hR81qkPkdeatIvKIb6A7IYeQNQd0A5gU1de6e
 SCndKBCxU6U9vBV96it6OM7UqP8LALndhJhc6GAThlaR+mF2EWg8+mVjzHrZWSIU3Z1ex8i/QYo
 S6t895VXAr+b/5lOK+5zNUTT
X-Received: by 2002:a05:6a00:1c84:b0:72a:9e3c:920d with SMTP id
 d2e1a72fcca58-72dafbe6a98mr38959112b3a.22.1737738388867; 
 Fri, 24 Jan 2025 09:06:28 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6d22e4sm2126729b3a.83.2025.01.24.09.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:06:28 -0800 (PST)
Message-ID: <b20f4f2c-7b2c-40b0-b4b4-07ac96ba237f@linaro.org>
Date: Fri, 24 Jan 2025 09:06:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/28] target/arm: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9agbZUJvyNlo

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
