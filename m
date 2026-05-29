Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E197CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 16:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT00D-00030h-9D; Fri, 29 May 2026 12:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT00B-00030L-2E
 for qemu-arm@nongnu.org; Fri, 29 May 2026 12:24:03 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT009-0001PD-KI
 for qemu-arm@nongnu.org; Fri, 29 May 2026 12:24:02 -0400
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so68795475e9.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780071839; x=1780676639; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XkTA+tyNA//kTw8ZV2L55UB9CF3UBX/3Rah1pnrUAIg=;
 b=s8yR9S97toiuFTvyKF6SYNKJvDB4CU/NI5go09XgzIh0fczEANa5Dl7agNp16g1l1+
 BWEaf0pC5iwLV+U9fmkAjlqrFfGVbn8gpis5OTQwsBvq3vXVvbNGfqfEiMtBbP9m9wBt
 DtnqLOpUp05Qo44lDnKStdkHt9gzSI4sOypfamVKPX7MsELfhFY2VNI95JOY8Mijc1t4
 hs6EE9I9X6CT/Oe5PGln5RCDdcWf1QDeC5uRTLCkG9hfdJY+0bQgnc4i+lKyfqcdgldd
 XhEC5YTV74wat0ILWV6/Z1ugb7F0x+0dQis6A/mIJWyizkp7WfjgfRxWFZn8s+DoWaDY
 XbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071839; x=1780676639;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XkTA+tyNA//kTw8ZV2L55UB9CF3UBX/3Rah1pnrUAIg=;
 b=glKQpM/9yY+3AUbi573NoMMEWyVTKz6XfT2vt8kuj1LRzZZn0kHAPz9B8kL0OjdXhN
 dGXnYy+bnnJsNs7+lVE3mC26UUpkmh+4L+HIdXRpe+Rr2VhEWx2KPC5Sif5dxCICN4IO
 GgW1uc556Dgwo8eTYBMfRxf81hVpiWKIS6jVx+uBG9/7SQmf1v+w1vN+NWz2qTakB21K
 bIwz76dkKpNYbSSqtjUxMVq6AH5GPGQcmfnuNWFyDvQmskj5EDgkdCjPFy0TRwx59P8k
 hpaAuh2SEKUf3QtbuOCJQV3VT3uiWJSL7Dw1b1svHPAR7eRgPrO/zC5dFXz34nXp1VwT
 n7rw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2EF0//I2f5MPnHRfFqKkQQMM4Uh1jaOhpca282P/1j8KBgwxoj9KQ/oO62yY11FzFf0Xh3w8dQA==@nongnu.org
X-Gm-Message-State: AOJu0Ywd8yYDLeGRYsMiTIlAc8mSBUCSva5ZUQqBkqzfvLR5QOr48gYi
 V2GQubM9Gt3WtjyQKjTXIJSTsNLjMz/G2ofEfDsXALxnyGOnH2igCATJivW49823wK0=
X-Gm-Gg: Acq92OHH8QsMrHseJ6wPejUZ7SXaAHbLAXLYNGR+ZI9lGKpWlRlDGJun/rwnkE1sg/m
 2SuMuBBV9DtsurmgoW4ucOO/jO3qRzVC1DGBjkz5HwgfVbU821nwQg9Z5vxy3T/LjXAzh7wV3Dr
 Qs1YqFDgGdT2KoZ+8+toIgi1ftzCpRHKtkLwD20ycQvGnRwD5goc1/QPBbbBUzhs3VBvlWTxypw
 scTzY2uLyV65ZgtgdrOeEpKrKNmXfVs3XKJ8fNpfpZeHFoaCoMCfKg+17kjTfLwUXJg34HP2DBu
 rQ38m1SAwXVcbB5WeevyQQ+1geM3JS1060tosZDzyvGJPmmRILMjUEG2D02jP01DD5qqqpbv65Q
 z520rfNjOaVRUDqBTmEG/b8zk3RbaMRAMzGtIFgAJ1hKwpWDgLg0Zizk55g+5OJwIyky6Y0V6Pe
 Y9bffiBivs8bJqYx75YFOhMTvJZa18fq7B4BH8KMI9TRavJA==
X-Received: by 2002:a05:600c:8b12:b0:490:2238:4021 with SMTP id
 5b1f17b1804b1-490a29079a0mr6842805e9.8.1780071838612; 
 Fri, 29 May 2026 09:23:58 -0700 (PDT)
Received: from [192.168.69.207] ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm5255630f8f.16.2026.05.29.09.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 09:23:57 -0700 (PDT)
Message-ID: <c8a7a19c-7018-40d0-add0-b4749196fa35@linaro.org>
Date: Fri, 29 May 2026 18:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/intc/exynos4210_combiner: Avoid hw_error for guest
 errors
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260529143624.158935-1-peter.maydell@linaro.org>
 <20260529143624.158935-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260529143624.158935-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
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

On 29/5/26 16:36, Peter Maydell wrote:
> In the exynos4210_combiner device, several cases of bad register
> offsets passed by the guest are handled by calling hw_error().  This
> causes QEMU to abort with a guest register dump.  These days we
> prefer to handle "guest does something wrong" by logging it and
> continuing.
> 
> Update the hw_error() calls to qemu_log_mask(LOG_GUEST_ERROR).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3396
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/exynos4210_combiner.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

