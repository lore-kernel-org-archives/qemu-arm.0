Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF9CFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 14:26:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wISLi-0005Ta-4l; Thu, 30 Apr 2026 10:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISLZ-0005OL-IE
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:26:34 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISLV-000884-Mt
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:26:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488d2079582so10367445e9.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 07:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777559187; x=1778163987; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9oQrxJFithfa7ZiRsILH+SyS0m+kPPzBVUSj1/8QSdA=;
 b=tRB7Ui+MchOqHK6PuZzfK0LiybtWb37ov/KeznHcj+ffIdtlDMjDoOCAx7HbnUhShQ
 AIl+Nw6KQfWHRci4yAgqje7lZRtpSJZUkh9ZRkYSKpi3xcckhtkdX9f3Njzog7xy3z/q
 E+XLaLTiw2al41eAMlZ4SSAgzsVwXdXeSHx3hmuqMYGKaKOOjXUEIITwSU7yMAtvliL2
 RZ89gnGWbMg0ZSpkdaAfyCPFDstmNWRvtqJVxrE9Fm+gwmesAo2iIoYefy1JMFeDcZub
 c/1uBH1GNBBCEPig2quWn5M0mK1tbbK7huYvsaRfsk6GznTDyTs5cfe2gwBNb+/W/nvF
 a9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777559187; x=1778163987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9oQrxJFithfa7ZiRsILH+SyS0m+kPPzBVUSj1/8QSdA=;
 b=Ikmrchp0dTuKfy/GTHYI0B1y65kJhnp3AkZQ4Zfoj8CCEB8mLz9reu29jOzu39m7N9
 A9sQajhaDKPw9xTvcgtS8Eh7+aAQZAMBu2h3zEeUZBXEr3NCl77fIEq+/gacf9TlErjK
 W1/ypo6piy95G6KPN/nLEhtDTbu1Yvr2VdM87wnRErXvKU0YXu0oQQE3jW/Wm954U+xc
 FTE6MW7zlPzQUvuwxeqk1s4HNBysjzomU6zm3zkqPJPe/lCmBwuCNUqQh7f4pSy4i9Ca
 qpN7SntLKXSTrbduPrhdUv4kIWNyj84b/fAxr4A2gGvtXoHN9K9z20nZPEj4KOb9zeXg
 BHMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Ygf+OsVR+Oy5X+xA6bDeeLFQhvMTz5rzt5Vn8LP0fvH1SX9f+WvREA/hPFRReHpZ4Lux0pNvQnQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx5LqLBrWxdDTiHG2pQ57PKdRzGnxnBJ5Nt9k/kqon/mCibPK8S
 +fvlfnfSpF5xVGl7DpCOEyWPzsFk2+iuTkw67KkCy3NQOHf89+KcXThZr70RQdOhdZM=
X-Gm-Gg: AeBDieuxJmLIfb+4T3kSrk1WaDp18viUqE9J3cwZpl+TyDO3vW5ONPn+3CA3PvSW5+c
 IsA2PASGp26GVsTRIyvru0p1iw/nJKfsuSTFbQb6sOJURNwfLp7zDiqTHAwexG25d44Lc2xOBvR
 8rpapQqL1w9MUps50aUu1/hj3opexYWfCU7YiAZgizdMzURDgfhIxFG+QY3bTkTQczc7zysfrIr
 GDafNLPM8px0KG8CdshZUXIJsrx12BkMUx0cIkJlwo3VPD5h0n1WX8+W7N4xPEAsNw+fECNUYG5
 SDO2MXTt67y+knPSOX6rBsHsb4nQ7wb6KFUHdG9x7DNqvSzS9C2BY4b180uHfP3hiOMethqnVOl
 Lv666dzrzuK46ZtSA+2oeIzDi3sOwEOHL/2jZ+oNwwcD5yNPG/7q6DvKdQzfoMc96T/cjjW1rA6
 f/lwHoYcd+CMe7RArLXGZvZQRxMeucAjk6feNA6DSj6psETvzShit+B7YfQHN+6rafpvgv9WO++
 uPc
X-Received: by 2002:a05:600d:1b:b0:48a:592c:e642 with SMTP id
 5b1f17b1804b1-48a844458d8mr42920925e9.18.1777559187138; 
 Thu, 30 Apr 2026 07:26:27 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7c31f1ddsm41055275e9.29.2026.04.30.07.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 07:26:26 -0700 (PDT)
Message-ID: <25eddf26-8216-4a8e-93fb-7c3f062df7f3@linaro.org>
Date: Thu, 30 Apr 2026 16:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/65] hw/intc/arm_gicv5: Implement CoreSight ID
 registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-33-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-33-peter.maydell@linaro.org>
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

On 27/3/26 12:16, Peter Maydell wrote:
> The GICv5 register blocks all implement the usual Arm CoreSight ID
> registers; implement these for the IRS.  Although we only have one
> callsite at the moment, the ITS config frame uses the same ID
> register values, so we abstract this out into a function we can reuse
> later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)


> +static uint32_t gicv5_idreg(int regoffset)

Maybe rename gicv5_idregl to match config_readl, anyhow:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


