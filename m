Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp698920njb;
        Fri, 6 Dec 2024 00:41:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQWqJvHnoQZQcsm0KVAoczbuhvKgl2dG0fCFQbKNGZeqDmRXVcgIFyjcBxtC9JVzjGo4/zwCUiEt6FUw==@linaro.org
X-Google-Smtp-Source: AGHT+IHSwh+Fm4mDipbSyRAJxYdcpSFWFNQd5+9cliZmP+MHOZ2yWU2KGpdksZCIGqBbJSj0Crln
X-Received: by 2002:a05:620a:640d:b0:7b6:6ef0:17f0 with SMTP id af79cd13be357-7b6b41eaefdmr1011096985a.21.1733474483554;
        Fri, 06 Dec 2024 00:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474483; cv=none;
        d=google.com; s=arc-20240605;
        b=lf434s1lN8+z1ksVa/QITMjEx0sdnhFK0CqnRqdxaaZd0QM+cfIz7Rc4HK6N7OncNx
         PwdVthjRlUH3gFsAbSMUR0TW5PcKm+KzzZed3Chy3nIhkS/yIpm0PlM3XoA6n/q94CKO
         MenjaH22PAj1jnJH21SDtFSE6oWCBfIOgkpNEYGKWwSxe/wjp/eMBaO6gNOhaCtTKCy0
         r3UdfUwXQNUfmGFcOljq+3nPOiT/JxqfYqA1cAvv6dCtWUFEFDjZgeg2RDh51ikspIOR
         8pGrOFXZXYbbYAut39ZXZOvn+hz0jm2UnPv/uwVFToewF4d4iq6kJ/N7FEsvHVdmyVuB
         rZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L8lj204z9qcw8GDPqhFp8iGreEjATERZeqQPdzoIcbA=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=GJ2LZwVmFAUPRIFMGsGdQYQ3OkODW9enTizF0TSXbrgKMVZwM5RrniqgLqlnJg1Q7N
         JyM4MQX0G8Tx/h1Ry03m9nPaG8tk+Ckr38MwdU4tjWmkkmFPqd2uAI1wzeFwY+4z2S/F
         i6e90R5G9qlSsnOlHnKVeY/2T4kRwgifJPwBtd31VZUcWGkDnJTrsQJ+Nl9C+na1YGOe
         lQJ2qBNXYwu6E+6zl+8sFgFWbMUKVJ/Fb6dtoE3OZ1vj3YReCDNElqFjBrDN0jvbaI2w
         pbycJ6h+HryY/m8LaZrlkz3FdyKXlNd7fciJxmepxuxppJIkABm421g0UAYyM0ztyJX7
         GycA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBrEHFsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e6d228a9si15355836d6.484.2024.12.06.00.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBrEHFsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTtW-0006Uq-Uq; Fri, 06 Dec 2024 03:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTtT-0006Tl-Eb
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:40:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTtQ-0001HZ-Ag
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:40:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a14d6bf4so18464485e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474454; x=1734079254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L8lj204z9qcw8GDPqhFp8iGreEjATERZeqQPdzoIcbA=;
 b=LBrEHFsTD+nG9CDfmb5FysL/FPgVlxkCgbe4jFTwk/IelwCLAQ0WE1cCgHPXu0d971
 oVxEuUqztOT9nPwT9LlLkkmgI6R/AnG5WKVFxwnaoPgEIf6uE/eQT5fOO/Q3rPfDqMaD
 0z27ncQDP+EI6J7uyDmUs924QY0I7XJes7n41koFvSK7s6KuZhZVXmxcqNi9YLfHtR8W
 WZWKPEzvi6VhUk3YjZHzwqbpvr5KJdmfcpE3OMd1H6DbBpF3so3mCdu51U8xttfymxm8
 CvpnLYGWkMBlSSjj89JluGPPsKtC20aMlTL/tHA6kxFc6muD3dbidajZDnhTen6n9hnJ
 anjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474454; x=1734079254;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L8lj204z9qcw8GDPqhFp8iGreEjATERZeqQPdzoIcbA=;
 b=Oj8ycGg2BvnvlzMGu7/Qtkl4BFDHo1uULMTXcTewaXztnmTs8RqEuuoUTsSLoGJ9q0
 BeQsRNloCIPoMKnsaBsTH8JTP7kHXWENZUVakXB43m7uBXApxj1LRrB+HNgXz5p+DyPA
 f1Us04UywqT4LA87JP7mddugzzzaVW/pZFEsesk33she3nfL2n9QmmQ68AOjcMJQvYjy
 HBtbGLJr2kdZZIawfM3NAW0/oqna1T+OAGEP97qk8P6/bknuWcRQU19a+Q3Aww48XQFY
 r9Gm524dnC8ZbUqSK5z8D81zAXRFT0kxIfT6o1GfBG4pQ44yo2WjcnVnQ3O6CDzO3A2w
 0ccQ==
X-Gm-Message-State: AOJu0YyK8ljCpCCdxQAAtU4jgDg1tYxaa4HJxV/pHsw3DJyRsMkeTci0
 u4p1i52oVd1POazf7OWi8Z/ivvYUcgGIEwutRv1p/mxCqPiAFdWvtDGFjHoqj1JEFgV3+3IFySb
 j
X-Gm-Gg: ASbGncuH17FtQDIES9b9/bI6UOOgJs560N3eYfuvOFhCibaH7nuBYIuKSCPbPzPjm3H
 pz7UFg5DioLB1w8+WFJBxgExoeIZNYLerh4OqZ8sppIv1BhM2jbc6H+JWagjren08nRIl+0xI5y
 kHIMav1G3W4zD4F3FvfzhJugpXXYTbrIDRhmhUy3f0YYiGpDi4NzeiKlZgsbY7vMo8b88/Tf7xE
 KWHdcRSFYQzZr8GNXO3Et6jnSHNdfT/VIDi2twu0NMk7o3jXYek1EulgwKH5e9KPmxqWYVu/oei
 8U1VIqMpkGMNedzthA==
X-Received: by 2002:a05:600c:45cf:b0:431:1868:417f with SMTP id
 5b1f17b1804b1-434ddeadb1amr21125965e9.17.1733474454647; 
 Fri, 06 Dec 2024 00:40:54 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf4119sm4001407f8f.14.2024.12.06.00.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:40:54 -0800 (PST)
Message-ID: <d28cbf6e-eeda-4751-8226-0433975eb9e9@linaro.org>
Date: Fri, 6 Dec 2024 09:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] target/arm: Convert neon_helper.c to use env alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-10-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kPho1QSe/KWz

On 6/12/24 04:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h          | 56 ++++++++++++++++++------------------
>   target/arm/tcg/neon_helper.c |  6 ++--
>   2 files changed, 30 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

