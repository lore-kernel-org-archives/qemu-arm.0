Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A0710F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:04:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYCO-0001Nu-LC; Wed, 08 Apr 2026 15:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAYCK-0001Mh-4Z
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:04:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAYCI-0004wl-Ln
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:04:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso667975e9.2
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775675056; x=1776279856; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r+BrqfgbLfS1Poydu13/Hqzvzo3fWuGUN2RByU8Q5Tc=;
 b=P2rpjLMTJkHcZEfo5CCN7A41UAWBtJapI2HfchHBW3w7UEvwffdGaqB2ydV3ijtf2K
 1ZBfTf0wvVxVaxbEhiBMPzqzNXJ7A0ui6eOpXtnUq7ToveL326SeX3oWDg3YNAXpJS8s
 Sx91LN67GiiFTYEfA2CvRsMVWAswbA7QOaKviVXYSDPeQIm35EwXJqFeK7JEzV4wQpHc
 vXzrReWiTdW04RIRSlPETil7w12+mo0Ngodz0mJRRHpOE2jyzj8HFrBW1OHYeQ7zIo49
 UIRWJONDnCC4vzzl75LeaTMN3AJYnyq0NIUySgwFlhymv371cIhuiV0AQLZV/Tdn1MS4
 tcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775675056; x=1776279856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r+BrqfgbLfS1Poydu13/Hqzvzo3fWuGUN2RByU8Q5Tc=;
 b=NXSFRyLxGxVxSzvGrKhuG2rtlL9YhJ34vFTmy9qlxlzEomoyVdWOc4q+hWnuP/PFcW
 d4E627rJzPVbeubVJigBK9w+xc2pF5eAh+mplMyLbXrt1meR4tFGu9/KKyaI53bKUDJz
 pXT0yHSUWNVZh3MrR0//4cBYWxUqcCQjWoefxk/J+l+Jf1kM4Fi2xeFrNpDBiLmII8Ch
 ApXXnlCYeqVfWLB1bMHmcTaPLscGuKiQdhy/NU5c7uPjs0d5yjll91OHd2E7DW42ckAH
 B454fMKQcFUxuKv+cKLhaM9QM2St9eaGZS5gdlonkCwOYExuyt5MmwCFPA7Id6RG3gtA
 CNsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRtdTkGiGYDhSPKVazltPZYgjQiZMd64NoIQT3mFMTKCDcABordNU7IwNUdK4YKnG3PodPzf117A==@nongnu.org
X-Gm-Message-State: AOJu0Yy8Bm3zUzBVbPro0IuBx8FTbQG1eUB3e0blLFSKmSU0gwE7XVuK
 VzYOJfWp354cN2PtOAUOdLUFF+WZqqAwrgQnLyUlKWuCuCnXzAqER0B57TAwALBTSsQ=
X-Gm-Gg: AeBDieugE4DTF8O1lwWmzh9uFnLtxoMc25yd/5nqSFchDNeuzObvLuHcl+teyrFzvTp
 7bQGXGrqlaPI9kn2Bp5uHNXSqRclkDlXJaOFW6/lW58361ApGsVYG2jXGQyBNI9ckefT7Y/ORH7
 qmxbHeEJNsn/VhRFXnbzlbs06ED9xeqmsMxmXGguA06piCZTyBB+Y8nyMyY384aAb2lLDOBx5zZ
 CYsFwluKJ/XR6wKxSTuf4gy1x+z/V4l3MJaO/3NqlfNWDSAz3dvdOvUb6oQ6N2O/rNsMouTkwUj
 RDZt6D6L58XUmAWjWY9aU2hEwssxkTdxd/ocZWXnyV6DW4OCANDQDXTvcMXWQ95gw/TZW0Ly05B
 xZIwRYLJDtDsn5xF0pE49CDf1U0GHcnit72JRwpUV/jX/Y+amdFAPbRnEi+svRFrXPnIZl6PxkL
 QDui0J/LmO9oVmb8Tmv5Abg4XY+99NVgquh0i7NDWaZeC+uuyhYkwXRAjN8CfHpg/bYA==
X-Received: by 2002:a05:600c:c4a2:b0:485:3f1c:d8a1 with SMTP id
 5b1f17b1804b1-488ccf63b9emr12134635e9.9.1775675056013; 
 Wed, 08 Apr 2026 12:04:16 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd17a6d7sm7250805e9.3.2026.04.08.12.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 12:04:15 -0700 (PDT)
Message-ID: <ea7ad87e-0054-4765-b522-03daafc853b6@linaro.org>
Date: Wed, 8 Apr 2026 21:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Remove bswap_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pierrick.bouvier@linaro.org, qemu-arm@nongnu.org
References: <20260408013309.56122-1-richard.henderson@linaro.org>
 <20260408013309.56122-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260408013309.56122-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 8/4/26 03:33, Richard Henderson wrote:
> This function is no loner used.

\o/

(Typo "longer")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 16 ----------------
>   1 file changed, 16 deletions(-)

