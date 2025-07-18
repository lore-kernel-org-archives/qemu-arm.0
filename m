Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A97C83F17
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:16:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctMN-0007eH-CS; Fri, 18 Jul 2025 18:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsol-0000QE-CH
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:40:35 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsoj-0006dH-Ba
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:40:34 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-23526264386so23151605ad.2
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752874831; x=1753479631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kpWEL+oIBRkXXREO5H7+6ZRqM0yIeGKJXKkplL+mXBw=;
 b=KU1d10b9hx4s3ul0TdRq+RWO7fyPBKYt5AjIK4qchpZbkmsjv3+2rkLZ7BKo2nw4kz
 ixyZ+2Wf4secnl0EgvuoOZv73qOnqPtpESmbayHVmsuMgeuPJkdOwf+CorR0Av1X+oMx
 iJfj9zKiAD6vtk1w+hng9vTAgjNqA17foZP2iXI1ipRRscNXX9vmtclw496fjHFHLYTx
 lxao9+INj95wVvKHLCol1myWkTtnnl68nnMQz03U+5ry73Z5090dRL6Ws4F84tIaRL05
 DpOnP/oNBXy7qZCy3SUO2JZnVS9+R2+2ohukrofXHMOk1pqB9UBJBxf0qKkjBitidjSC
 iCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874831; x=1753479631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kpWEL+oIBRkXXREO5H7+6ZRqM0yIeGKJXKkplL+mXBw=;
 b=bedZJy2D/HeQpltspx0UiPGkeWozcOSZcfOeSQjLOkLASAqk22zGaxA7uRSfwcuuC7
 XNEBwQSj8QR3Lcz30UXIieq7Y0asVrrnD5/qeTPLbrI3mHRFEKx/7Js2PtyV0tEgS2NY
 I//pbKNkXvazB/G6523ZZSb+bmaYU5JKPOQH2j3BPuFRAu+CdS+H3xzxwx+LOJryjsCp
 bFZRX5+1wGstsgK1STXuPgAYbuHAtDmyOZGsEYK3pacBgty7Yltsgl9Qj1Y26yCCaEXw
 KgbzB5juKKwIzRWDl+v/OZkwDEfNQMc8VKvQUABldAyzYW19Hg9WxcaTsTXLOhXlI8JT
 jC2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFLaBn1eYYeFpi/IwOeTaEu1ANan/QYDOnC46+dpjUAjTliLIwxLkhpQo982iqkbNBN+kghbRqEw==@nongnu.org
X-Gm-Message-State: AOJu0YzNCjk23ivVpaWjjufbn+XmzojZpAANcrWpp8pfumI/s4INu3ob
 eayT9D0J61o9F4QFa1QbNMc/5DK03cXB7eHsruCB0ss7GT6H2qr5L6JRmcMa6EEoLzA=
X-Gm-Gg: ASbGncu5kf3XBCNSo4L/Mm1yOUah8V2yt1c9pFzvey1QkCmJqwIjQit1TVMvo5bPTSi
 2t0JjRlmMUS9lbJ6ElSF18meaey7FhYdFdxjpjHZJxVAHKfux33ptZlgSv6HQ7VCMrW14FezDlz
 Dsvay8jwYQewlIk+iqQRPv5UW1+58iE2LR1HYorfuFILRN2pJTZSWsGf2j1uBwxmckfAzNSw1vA
 8I8h8jxqycMNnpHk/NWtGhYyqdS/BF6IF0dHJR7Wu9nZRtjW2XFnAQFfiJaNedc9OYPvLOb9Ufy
 gh2YR3jVP7g9Yrnzpne1cdC2mLzN3VaEpZGy5NGrSx4t5nlx4McCfofwCBoISEfPccLAKeO62cB
 vF0O00oMST8WmPTgiQ5DNfOdRd9cIfSWdWpTlhMt2Mg==
X-Google-Smtp-Source: AGHT+IEdC971+ajMyBjhbgy6pVg/Le9rgWTDmQIXcjuukdCGhvt3o1sVh6mJOhEie9hy43CHJ7BY5w==
X-Received: by 2002:a17:902:ce8b:b0:235:ea0d:ae10 with SMTP id
 d9443c01a7336-23e256b5636mr195701845ad.12.1752874831449; 
 Fri, 18 Jul 2025 14:40:31 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe8f4fdsm1690764a12.27.2025.07.18.14.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:40:30 -0700 (PDT)
Message-ID: <c07b0e3a-2bcf-4be6-a6f2-f328718eda1b@linaro.org>
Date: Fri, 18 Jul 2025 14:40:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 05/10] target/arm: Add BFMLA, BFMLS (vectors)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-6-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
> FEAT_SVE_B16B16 adds bfloat16 versions of the FMLA and FMLS insns in
> the "SVE floating-point multiply-accumulate writing addend" group,
> encoded as sz=0b00.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper-sve.h    | 14 +++++++
>   target/arm/tcg/sve_helper.c    | 69 ++++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-sve.c | 21 ++++++++---
>   3 files changed, 98 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

