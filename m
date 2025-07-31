Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5FBC87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 23:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhccy-0003AP-6G; Thu, 31 Jul 2025 19:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhccp-000360-NQ
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:23:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhccn-0008T7-Uj
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:23:51 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-748e63d4b05so181723b3a.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 16:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754004228; x=1754609028; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IOUFVW0Mt2hN6k7UYKA+Jg/uSapVQRARuDkpfsHoiME=;
 b=VXMhmK5KmDLz2CmsgqVKbhbo2LtTSHEY+iPaYGjP7J/nTpBFSqbuRgZIiFXfMez7b0
 PRs5YYVdg6WYh8qDYRrEmc4NanfLqSZklE4324nlh6lRgCMr+9D/dnjL0g5ZGa1ivlDF
 A8Z3Dhuoc9gFb3u79oFSb8BJjFDLbAJ0FxpDmwFT4rz1Yib1LunPKl2hXKJhOXKZsIq2
 WgnIlwAH76nFoSq+OQ03sHpaDNpmuJfWURJrjve9D7iI3w0Lrf0kTQkSbu7Vd2m+eKqw
 PG83Oz5GRI6BqybgpQ1IggB3ufGqnenVKkbvxC+u4PTSsOlpHmU3Lr3RM2xdJN/yQAQl
 73uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754004228; x=1754609028;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IOUFVW0Mt2hN6k7UYKA+Jg/uSapVQRARuDkpfsHoiME=;
 b=Lea1dTul8FBQggfK0vPqgMZ+yBltCLYt6sNBmjl9or8BKjZb9TAq9XXcdKFB8KvCzV
 nqH7vdANDpRSSMWc2C/F9QJVTiHvWkx5yOjrRvFK9xOzrg6kW2zb6vaCxBF40MkqSKNc
 Zk9wjB/9lGS8bkEO8o1pr+z+GqQWXW3bG8gw0drGPHFr4OG40AqBnNMVo32kO1wgboTA
 R9S6fD6Ccm6LxEifUqsph8NZJEN8GhA7zh77d7DHl3NqdEbHd/QnSjsb6YwfdSQcuA2q
 lYns7At/mlWS95ACBkDD7+cPBexcSZZdC6sf/wIbTwnROiB/HArl7Slhvqme62Py2JFa
 BFXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv21LiO1wfTPJ/qX5dD+gqv7psFjJXwZOOJgti15HRshdzgfBldBNw58G1y6/3uBPS8R6IWUYO+A==@nongnu.org
X-Gm-Message-State: AOJu0YyFHd/bbSqzBm8+bEmBwv1FYVwZZphLRKePjHr0qWtM50k5ybOW
 /5NUVLq3YoHoIg1EJGM1Be9V9qPrma5z/7QOGZjH/URYr/y8SyuRaQ5AeUTYmatV1do=
X-Gm-Gg: ASbGncusgVfUAR4z2nCfYkdU8/rtKAY1xbDPIMeUdobwDdceJJjxLaRECxHxQZs4vMO
 KNcPPFP6Vbeyk3Kb2D4KRzfWDP7ypL3v5Yj0PWZq4MGoypOzv8CRvFtYRBh9BX/J72NLB1Jry1G
 nP4KR3mVAvaPgcj5FJkTgzUjPllH++gCW40XYKn4qak69EWPt1ymgFrmrorBVA+CRdMBPnpvUtm
 DSpB6rvWDO6Kr4VfbHQM+tSRN1xUa0CUKuLkcP+d1i9JJQsK2eNOnSd6Id3iRYw9GbwyuoVnnyS
 rFg7uCPORds21SU59oQAANEOhq2B0WAv5z/K4MxaHCYduXf0qbnThTFgJ672QgHG/A/eAsr9CSI
 9MYHOqfbnzvk8IVaspqYdtoLxTLWsav3pXRBjf27k
X-Google-Smtp-Source: AGHT+IF9JR0Dx+MVKegSbjD7dfxBP32qQb/zF0vijOj2VXBMtsiBygQzHZiGymoH3+XSJkpTG+D2SQ==
X-Received: by 2002:a05:6a00:139d:b0:76b:ce90:f6cd with SMTP id
 d2e1a72fcca58-76bce90fd72mr4611177b3a.6.1754004227941; 
 Thu, 31 Jul 2025 16:23:47 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbce15sm2592678b3a.64.2025.07.31.16.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:23:47 -0700 (PDT)
Message-ID: <18591023-453d-45f1-9b06-f1e5cdc3113b@linaro.org>
Date: Fri, 1 Aug 2025 09:23:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/{arm,riscv}/common-semi-target: eradicate
 target_ulong
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/31/25 08:06, Pierrick Bouvier wrote:
> We replace mechanically with uint64_t.
> There is no semantic change, and allows us to extract a proper API from
> this set of functions.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/common-semi-target.h   | 6 +++---
>   target/riscv/common-semi-target.h | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

