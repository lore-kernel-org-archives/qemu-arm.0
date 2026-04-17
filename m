Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8E7F8E4AB
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:33:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDcle-00059F-Pc; Fri, 17 Apr 2026 02:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDckb-0004Yl-K0
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:32:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcka-0007kI-91
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:32:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so1774695e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407543; x=1777012343; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sx91WCaH4gOMMZe6B9WCAXQOhfJ82aEdbwpuUzMbY/w=;
 b=ssuZl5cgaX35ob5sIXt6fFeSsEmBBQX5r5ridoN4Wl9VPb1T5KhHCLrQ7q7rCX1NsU
 ahEf0+5ifdciYXG/Avv36k8NJyIIm8pyW40UxQ3jNuc7VGpUOI/QLea5jwWhTL2fq5CU
 2rWUen7YdP6NJ/I/MTfcPyYDIW97V2dfkbVbM++ywmLgFm/gkXhkpxcfp5xlxYqCYiNu
 0ReiJx0teHtpPPG1pSGkgMT2Yux61QTMvgstqhdfgCLVd4nAswY1IlMPT9DwDnPwBN7a
 yzG0Mb+ebR5o2XoX1D4fVj9bC7VpVFF3lYrmZEW9wtECN0V5+vWqLSNo8Dfp1MRtHia7
 TZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407543; x=1777012343;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sx91WCaH4gOMMZe6B9WCAXQOhfJ82aEdbwpuUzMbY/w=;
 b=O724Jgge49Dh7WWhPQoPOZSI92j0vlTuRPM/JbJg6TyuKKv3wqfg6/N+/RQT4tY2to
 K1bKjDJ/h8kpJ3KTzqQfyfeyWrFsTO2Q1hMpqUIfqXcUTs8CgaPWbFTf5qqLwgiDnWiU
 LQ4gvRVo39m9RoAGCzaKSHsOTpk4mGUipErn08siDdsQKhzBk+J3GQBFVwso9i5A1+8F
 FLQhYv6TcAmmaJlx3Sb5cVaHqqJ324rNEQZcMpXpBqL7OwjUrZ33No4xm2UhJDq5EKAx
 /Q16Hjb06u83Dc7XCxdbhuFLoPi85aK9klQIoIIaoC4c/re0ISLOT9TgvQzepZaprdct
 HnSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/V9Tl7N6XdX3VaO3nIrH962Xy5af9BHWBTuFqBKuZ/AwH6xwwRczcBSqLMu6J0RUuFZYLt1q/xTg==@nongnu.org
X-Gm-Message-State: AOJu0YyS/D+nUdKskIP36+71jDrJX+722rUH0he0XsniQklM3lDkv5AC
 tX90HRfx8Mb7YwDX7PwcjgSG3orYqYEoiaMiEuBAqC/MR2/jHjQtQjGtI3UeM0Poe0o=
X-Gm-Gg: AeBDievz5dNow3awLdntBVIRrTC9NBCsDu2t/1dM0AV3GFLP5UNDUckJcAjtsovz/vs
 u6vSpuu2uR1rEcxAVEErYKMWccmKItkx9hgMAk/+4abmmaHCJSHb8SopfIAlP/7HikH7l8CuIX6
 UM206RLgtEejmVWADL2YfK+Oriz10/2TwIxH+W0gG7dT6+Zrctkdm+yREOZuJL/L4cGl4pFT1jt
 Zjp3Fifc25LuNorkZ+qwle8CDx2tBa/PzT5pvDG5ddnNWCuRHz2AiAH6t8KXM5KJdnU/rfQmHCk
 pTXB39GPcJ2SNsceDWuk/x2ewJiX+lXWy7BYrCtIV6sjkUu40z95M5TqNJc7xhvuNJfEx/0BE5c
 NYxu2/HSjKj4/pMtyka016GdfSMWYyLUZ3eGqOYvn52GgxX6rvTVavx7iVDsl1DNfWJCRLitOm9
 slx3OfiybnIz8dB2385Qi8GQo7Xqz7IeO5xCd9jU7vHA7HkFzsiyjsHgDgN1nxUkYYomEc7khTp
 r1O
X-Received: by 2002:a05:600c:a105:b0:486:fb69:4960 with SMTP id
 5b1f17b1804b1-488fb7786e4mr12956055e9.19.1776407542718; 
 Thu, 16 Apr 2026 23:32:22 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7c0eacsm9411185e9.35.2026.04.16.23.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:32:22 -0700 (PDT)
Message-ID: <3721aac8-3e0e-41dc-b20a-2c5d28a0847a@linaro.org>
Date: Fri, 17 Apr 2026 08:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/17] hw/usb/hcd-ehci.h: Fix coding style issues
 reported by checkpatch
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-3-jamin_lin@aspeedtech.com>
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

On 16/4/26 03:49, Jamin Lin wrote:
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/usb/hcd-ehci.h | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

