Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C12FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 16:32:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHOsk-0002E3-RY; Mon, 27 Apr 2026 12:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOs4-0001yO-DP
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:31:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOrx-0006Om-3J
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:31:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so177694955e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777307494; x=1777912294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IZp1pSiwMH+5WuRXaoS+cnIfuOxZup82xhWZSv3nOAI=;
 b=M046ZNrxDPsGdMCylbZ2/L8pV0FpsCziTm2m+SSFMpIocFKmJTDnhrHSobc6vSlUUl
 1c+oNmQl6zqrLjcLG5I046ZLOiz1ZbJdM1U0If2bvCOfbkWtZcLtmK6PdejrJaZ7tO5m
 n5plw68gQtOut+YgwvdMrPr2GyA4UY4a+YpMlgE8RmsU/vkLaddeY8/ybxdkZC7o//IG
 Z7nVXsvJ3n5PeGmGm95MytCGaYOFle2q/xDJBfh362IEDdeH62nIQtn8gjBD+mANCAAV
 4Ph8YyORygHSooXzoQrumNKeDQd8m3XXC0n9jASXPU9EZVm3TvI43J8Nccm6zUYv7mDI
 dDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777307494; x=1777912294;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZp1pSiwMH+5WuRXaoS+cnIfuOxZup82xhWZSv3nOAI=;
 b=kSMjl4/KeUgGlGYeK91TraRMbYQvQ8vUjpUtapVolsOQT9PIGu0tHuFeZ9AmP/A+qs
 8aZRGucLxJUKyFkwqh9hPcxOXguPSXw0luWG90DyhgS7sGc0oRRzAhWgjQycuWSLTq+c
 5oEeqCrRZLavzRf7KLayD6/QxdEwkohvEPUmAQNO9AMx7KD86JsUJNDHOT+ZyiNv7Czj
 uHY02Fe3n1zyZaSs6wKwqF5L9vrP+cxYYXXRXai3T/A37v+eZRorwdbrrmxI4vXhby5g
 mfrENWvwg4Iwf2PXiCuaP2Db74zJiEezb8yUwjnJkP+n7OXwLIqNt/uuI3wipAvHqbDp
 hX8Q==
X-Gm-Message-State: AOJu0YxTA9ZxveaMxK3gjC0EdeQcMYBTy1OG8DZmuy56Xogg5bFKvavv
 oSFpsvb1qK4p4aRsAVYUQ9PtrgjscoTWZv2T/fi4qyHPQ+uytlNpbTw+LGkQSSaS2Ts=
X-Gm-Gg: AeBDiet0Ht081LltLIO32vnX4+mEjMIMkc3QzbduNykHIiWMDLT940iQzE2SJp0lu05
 R2RxJ+np7FEHNGvEBImJPTbjLKod6xvHE8wvYMTeKHuMU8YFms3SIy6zOfbWzVfQMs9Xv0sVfrb
 2ab5l+lI86nnH3qj85xj5c+yvDQS/U2PzQxrduw8g8vgaYWd9+OaROLUYj6VXYh27zb4ZHVTSw1
 tNPPn+oESZHnBDzbGwcBKFqMmWWk3otkmq4UZWAqmiOfJvQ8OBeO5iTWRGX/0swb/eLec58aNAY
 eqHNZqdG5WokTH9MLBpQMSEibwJqriPldX2mz3812nsujw/X/M5Z13b5Ue5lNyymXygmem+r/TU
 09g8YVZBMjIja1oo1cJE3epff8EFHaOtyrXUj2Kh3mZ1+otbBqpmXedcExVBE3HLygnCqbx7jRM
 tw2xexMcSZ3fSbs4YM4SFAWMQrUEVmW4kmqcWSCWYIic7h9lrunDCOM4tDK7F8UUANnaL3aCEKP
 v2KJuHOA+19qPU=
X-Received: by 2002:a05:600d:10:b0:488:b14f:b8ed with SMTP id
 5b1f17b1804b1-48a76e01657mr1821905e9.0.1777307494421; 
 Mon, 27 Apr 2026 09:31:34 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a773af544sm188205e9.6.2026.04.27.09.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 09:31:33 -0700 (PDT)
Message-ID: <b25addc9-d0f3-4ab6-9abe-6398503bc8e0@linaro.org>
Date: Mon, 27 Apr 2026 18:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/84] fpu: Drop parts_default_nan
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_default_nan at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 23 +++++++++++------------
>   fpu/softfloat-parts.c.inc | 24 ++++++++++++------------
>   2 files changed, 23 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

