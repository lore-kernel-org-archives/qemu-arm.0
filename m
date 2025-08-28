Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F5BCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOgg-0003Es-Pe; Sat, 30 Aug 2025 12:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkJL-0005MB-JV
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:37:35 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkJJ-0001hc-NL
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:37:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so4119555e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 14:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756417051; x=1757021851; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8j9TGNf5VgZqyxibF9SLEh5Avat5cxNOqr7xWgK7H+s=;
 b=eHEnKmtfXNLVt0TjtNFm1pyg45IUfDVWj2qzzoedyUXaTtrZ2qtSEKyOLNYSiXdxZi
 E8dcdvfvpyqmGgLkFygewJRlZMyx6c7PWRyFBqULsoEz87JniNcfquL9UMDV7vyoBre9
 9zwgFocg59374lwAOnecSJY0nMKE90VxjcGvoPhOySiBlqjESLDks7aDMV1z5UBbxNjj
 bO6AQwAykxHchQrwOb29+9wvIiaz6XHRy/wDcsQV81qLYINC+7im7OYev21r7cPjRA/R
 zD8PI1l6t03bdZxDXKmESfId+8xFXFwc974ZEC7pfIcr0+jtRAT37fdJkFfv9/WlH5U5
 CleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756417051; x=1757021851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8j9TGNf5VgZqyxibF9SLEh5Avat5cxNOqr7xWgK7H+s=;
 b=dIw8Lqv+jZnzWmCEnAcRbohIMaUv2GiUeKKApkh349OnmM877AKXSOABOXnRB2xtsJ
 S6uW10DV62H7ShGs50iTas2Qa5/Wz5QffdMG6Q2KQocAdbC4VsS9lMvppZVRnzlXcuZh
 Fz4LlERUNWONJtnmDX0j5dHerCCUiM/BZ+B9h94+Mu3JuDSLqPtblq/Bb+wxoaJ+SsQ4
 AgUF2jmr2CXb5cMimNMixeLud9bjVJ92TqMkSE9OctUEL7/MUOg4eCRLl9FB72fxPYyl
 1RGqCVPthCN6upYsKr6j0u/mmNC4E8EBbUax3ZFsv/1Im3xPNezB9R4V55NHhGtBgZJj
 TN+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3KEkz4GZxqcwgeBSInDLofot+T1pGMgLcrcMl0yPFUbpcVfHn7Jasz32cTBEnq9p3qADwhhAEKw==@nongnu.org
X-Gm-Message-State: AOJu0YwEf4lmPMiP5RAgOiXyOAjdLuoe1RofBk5wTf1exQ8QR7DQNmGx
 zF5EYjhpw9ZiPqIZxdxnHaVK6QLiHf5VN4EGIFUZGbwLeZzx1hORTDZtqN3Wuem/hTk=
X-Gm-Gg: ASbGncsnMJPZ9Irg738PTFYDfhCNT+JDieGXXAAzTo1cvmtApsmVA4l86GN3K+PjcOV
 PCbFJ6mxUyajwgXHGdt9xy/iKCO2AHylbBWMVspR1eDwHSyGpeGaFvJE5ivUr1++dDlTOHSxPDE
 lbTIourXZufqwVGMH38hQJBFoww6jY2V95Wi/aRsiMhWkwWG5H5FZN4lB7oDo7p0FYwXyE6VTGR
 lbCsaHRCa3MoIwpxuxUkS/FF8GDJhtxldzB4d7CcAvgKcB9w3g6Gf7bN39qXPYZ+z80s47NKK3z
 AMTPgl7RpLHLatzCYDbRweHkCogzViPAwYwMhWJr4RAi66I/84V3d+fPU9hrcgkUKbQQV442I+j
 agDV5/4y0knEXrrlWWJeb1bPbqLdmBsyj/x93w05b/tXAdKkCHQSl+T5/CMmTpAwpu3rNiIxLAR
 yh
X-Google-Smtp-Source: AGHT+IFhjqMOxqdsrAxp3E0RFCvY4jlsjRXiRpVPzYWcc79dWIS6dCHnj/YVsCZZcv5zVjl6hEsNIg==
X-Received: by 2002:a05:600c:4446:b0:45b:7a9e:c4ea with SMTP id
 5b1f17b1804b1-45b7aae0996mr31736015e9.27.1756417051229; 
 Thu, 28 Aug 2025 14:37:31 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33add838sm711587f8f.39.2025.08.28.14.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:37:30 -0700 (PDT)
Message-ID: <515be40b-33fb-40de-8322-a800b941a056@linaro.org>
Date: Thu, 28 Aug 2025 23:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] target/arm: Remove XScale and iWMMXt translate.c code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828140422.3271703-1-peter.maydell@linaro.org>
 <20250828140422.3271703-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828140422.3271703-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/8/25 16:04, Peter Maydell wrote:
> Remove all the translator code that is accessible only via
> ARM_FEATURE_XSCALE or ARM_FEATURE_IWMMXT.  This includes the
> xscale-only cp15_cpar TB flags and cpu_{V0,V1,M0} TCG temps.
> 
> The no-longer-used helper functions will be removed in a separate
> commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |    7 -
>   target/arm/tcg/translate.h |    2 -
>   target/arm/tcg/hflags.c    |   13 +-
>   target/arm/tcg/translate.c | 1324 +-----------------------------------
>   4 files changed, 7 insertions(+), 1339 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


