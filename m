Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68478C83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctJj-0003j8-Qn; Fri, 18 Jul 2025 18:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsn0-0006DS-Bs
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:38:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsmy-00062X-RV
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:38:46 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-74af4af04fdso2559473b3a.1
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752874723; x=1753479523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NRfWVhKnyB1HSmXC6npdGvPwbFR81eqtzCrl0rkYyHg=;
 b=zXmiixc6JoD494ZpyBb2JMsEWMuMIiZjuZlc+AWnML6nmHqVQy7YXUxivsUTL/Cpis
 xOavvaNY9bNA48IG9v3jP05t07epOhERm3K4B4qAwURYVAnY0LBMuUkRiaA3BzBUPh18
 LLtky+yCls/Nm2bh8h6xAekbfcRMTZIR6IY+YAmn0MbfuIU6DfZ/UHkgLuMq3ciLnSLs
 FUaFR2p3iI8I9/TZwcuHy5rfcwQElkXMtn2jG+VZfrqzAwqNNEO/D8bQlTJYNFR/iJvk
 wxGwB2lJE2tZSEPFf8PiVrcmKnBnYzDU3jR2ivQH5qh0ftXyZNxIuJz9VsX9AF6d0rF8
 pFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874723; x=1753479523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRfWVhKnyB1HSmXC6npdGvPwbFR81eqtzCrl0rkYyHg=;
 b=Epvw09t9zlWm6UjJH3ySILb4YCryyoESt/hcmZzU7ToDnDHJxd0wS2/3cX7dP3vTzD
 O+6a0Yoir2xYL/0S7ma9fojWAzcBZbFnIk0os4hlUStrH7WxTHb7/Ifd7i7q3mL8erbT
 SvUtZEFBV5rXdMjuajk1DtwMjZD/GJVeQHSsz1BFQI2ZA2JOW0ou66OSkdt7sliU1drP
 uBr0DJycfctDE62+7KImf/ZwRYQWKXO91Qy6o9R1m+wF4WtxCuOEZdphEkmQZYHU97w5
 iVZhVEAe3wLZkw+bTw4w/bVzOVSBbV8L54TduCQ3piYbdyWrvASYQQmTqXqhd4mIGAl8
 AhuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE6ErrEIf5s+4FfVIXB+wCmZq06FljuOAzKLzMq7MjGydjwCsxCj8WspCoQfUBCHU6JNvuFzGluQ==@nongnu.org
X-Gm-Message-State: AOJu0YyYHjmdv5m8MRBIcnsku7vrcg7KHUtIEi8+dYzt+xxiu7c8vQk9
 EVyB+4OkN/n4QJmO640XrX8sbns81BfyShtg/+9QuEmWUcDL0NMFEOSZrrqtztu9TSA=
X-Gm-Gg: ASbGnctTpHjBkRMHEJEMwRISufghuKLQuAm2ymRGiX/zbc1dTFBkOXuLIUDos8S/SXr
 DZBsPS+cNfyVVq26Ni5E7ZbzPpDup3lEGHi+FFt3Zk55vpT/dVEx9VX2XntWI865vvWL7ICXTfD
 WadADRC702sVB8RZWZdYPKqwEhX2qBX5vKTE+MMzN6k51fK9uVP7UQ2eJse80JjOtJ1Ia/rH3cU
 ubbJ01OCNsQpKl43cKM7AyWAMuhSYZ3Gg/oGxQ5A+nBN/EJdozDPNU9sqJ01t+dM3G0Rs2Btaf7
 VK4xJdkBrHZoGaKx610edeSqweQp5XgitQ20WFtt6sp3RxE5A6y6WVSU8hPu8K69Xe0YH17DITk
 bqbMadtoohKtBLJ25LA8+cWyvcIvqvYfQdB67QpJcbA==
X-Google-Smtp-Source: AGHT+IEueRLFbC+ERyhOPVI+MGq4YykPSHcuJTvZd4m6X1Nz3fK0d/wkK5Wca7Qdt9Yn6fD6u3xSAQ==
X-Received: by 2002:a05:6a20:9186:b0:1f3:20be:c18a with SMTP id
 adf61e73a8af0-2390c79a037mr13437569637.10.1752874723079; 
 Fri, 18 Jul 2025 14:38:43 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e2175sm1738216b3a.1.2025.07.18.14.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:38:42 -0700 (PDT)
Message-ID: <c7398952-a030-49c9-9455-5602cbdd2e21@linaro.org>
Date: Fri, 18 Jul 2025 14:38:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 04/10] target/arm: Add BFMUL (indexed)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-5-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/18/25 10:30, Peter Maydell wrote:
> FEAT_SVE_B16B16 adds a bfloat16 version of the FMUL insn in the
> floating-point multiply (indexed) instruction group. The encoding
> is slightly bespoke; in our implementation we use MO_8 to indicate
> bfloat16, as with the other B16B16 insns.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper.h        | 2 ++
>   target/arm/tcg/sve.decode      | 1 +
>   target/arm/tcg/translate-sve.c | 2 +-
>   target/arm/tcg/vec_helper.c    | 1 +
>   4 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

