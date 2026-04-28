Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F645FF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:07:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbbD-0008IA-BP; Tue, 28 Apr 2026 02:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbbB-0008CD-1M
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:07:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbb8-0007Bw-KS
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:07:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso74794455e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356425; x=1777961225; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=pVeSEQTQRjKLzk7F0LvWB3JXynzhDiRRIpfiSSO5eecJqrKu54fuU3f0ZwA7Tpjgtq
 q3Zp9FTgt5yzoHmuvvfY1G+0pEqPEGGvzGCBdWwSRYfN0rR/TURa7ZLqV00PtO0Y7Jir
 sfYOcyeFrqwFpSmN69AwW+WNu+GaLz6tocL6ZZWMT2uW8Ip3yj20aAK7Xw8Oi5Mf1kry
 2YNqPhCOc/iPfDVfnUJQTPNWOX7wt17n57r4PsjU4ETm3o6s+yAusSAj4yxKkIfBWsth
 fLCSHI0rB+HQ7eoQe9Zyq1HBbUyFyfP0RkkXBGx1ImO++S2RLvGGikACG+d6oyZ9M5Ph
 TYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356425; x=1777961225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=YowcYuWtgHh7fq8z9ETtCJ5WkILYJJeGGMk9EWvPBMvIBIser6/WnOEa7dQyIFHX+V
 NM0Kil2kF9KFcliez98VsiQZeM+hkdTb0yfL6CH7CHDsGWeXqHbENrtZ62IQ21lWdcUj
 FV2AZi9rW3OYCVski9aefN2RbPUEJaXNnOvhIRidREQQkMe8ppb8mJBLtZr0/mz86N2e
 DjxIMuPiwjgaMPtTKyZGf9FiERT6EG5pWmqCGm4I8f5aRboqgsz7BAWBbC867m09waN+
 utmUK1OwHv9QPZKMZg+L284iA7BfJlXKlwT65ZXemvm8BiqhqczHoaedU0V2uL+fOutH
 t0jw==
X-Gm-Message-State: AOJu0YwjCbukI3mqI7UhTv6gnw193oFKx0oSpEpAuVtDJKaaYPQ8ElxF
 4FEmikir2cC9CVp9Wt5O5V4mS0GpP3birB0EprG84oUKlCkeGZ923vf1fwDyQuMgKxs=
X-Gm-Gg: AeBDievZFDY9G9UAMRrqP2+KKfs8sbBFVTH+yTW4xffvu0QRwkgYmNIlDSMtLRDVwj1
 Cop/BKhR4x/uHrm0HlS0MpcENcTdDDtvC29gi0Bn+wIXVoDKYSXU40yCSrX/l5CZQFjXY2rE+Xf
 2EYyx7IP1/NJ+nu05ttnXVw3kHUQBNOuttbrotmsuug1dztAk00CsklebIYBrNGZznHvb56JYC7
 vT4Xb7+sVogpTD0rQYPv0rrniPNoAAVkNluksNE/ZIDachj6kSk68LcVkz/XOwCaI357xe526Kc
 vaQhevhxpYRFirhsFPersgI+fA1jl093wrU4WpOrjED1x+r9NS5Sx1Pe1yRlZEqG77ite6TUIS8
 XkL0i1DI/vX7kkiKFCS6fJfU/+WQWzXKH32CuKQPPExtTHHxb1CitvvhbH28nBMdulRyYO6OBrb
 UPFUCj/gKh4kn9P5Y8QJMKAjZky2HtkMqsyrl9gwUPtvTcKovfW2Dmp33zw7vJCbUUm1Lzw3bCH
 IGrOOTKf3Pd0PA=
X-Received: by 2002:a05:600c:1e8b:b0:48a:592c:e63d with SMTP id
 5b1f17b1804b1-48a77b176e4mr21508475e9.14.1777356424825; 
 Mon, 27 Apr 2026 23:07:04 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a773aeb6dsm40978915e9.5.2026.04.27.23.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:07:04 -0700 (PDT)
Message-ID: <ae3a4452-3d0a-4961-ab01-fae2460354e1@linaro.org>
Date: Tue, 28 Apr 2026 08:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 39/84] fpu: Inline bfloat16_unpack_raw into callers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-40-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

