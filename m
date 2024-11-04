Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2031113njc;
        Mon, 4 Nov 2024 03:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvVyHCcwURbOUO9BgxdcP0dvwEKOGCVFnKek0gZFyn7VzLktbGUwbO+ArfEl4sMNgIHi8tq7fzCEn/Ow==@linaro.org
X-Google-Smtp-Source: AGHT+IFHTwNsH51ltYd3yEDW1/M2YSV6VKSuF2Tyk4MjYOzmOsZfqK0G0DKd6oH2iCp04cl9/9jU
X-Received: by 2002:a05:620a:240a:b0:7b1:45be:2e98 with SMTP id af79cd13be357-7b2f3cfa7c4mr2369694985a.10.1730719265358;
        Mon, 04 Nov 2024 03:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730719265; cv=none;
        d=google.com; s=arc-20240605;
        b=VY0p5HrbVneTaVVIJIkH9k6YbPT4o8+B6WYGxSNuAr/I7uv3pc7qxHZA6JsvWZBZnE
         EyXNgk+rRw1xqIVJw87nohPtQGN79QINY6Dk3E64j95UP7Y1epgcfPudOsYzcwrEa4yS
         9thp9kRPfNTb8wZzxEz+gBdz1OxKXK+epxG6h7NpzHUkcOZF7bfAY4U5/ZSyPIMuAG0o
         5dArDJgHkAKc7sdmJBtZWe8wf703k5tq5EDEoLlJ5OKexC3biWYIAnpnnZwkBP9BKtAf
         csQDg4qwf3L9Nh6dp1ggZiZ2Bt+HCccxjf2k6f3yc4XSv9Auf9FrcInpOVQv0A79MJeJ
         0VLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K/4xij/BSc0rJ6+hR412YXm76FFQgcd6TU/8derDxSA=;
        fh=1jJnliLAx4umMLQyMJmUwwB/u6HwhXmI3JQ8ZT4Rifs=;
        b=eyV2vl3gwfx9jFztEmBOdgV2wkWKOZ1kWfSQfDjKXcCN1EdapW+Z++HRQBrJYGuH2x
         2qreS4ORWxQsklJp+zGcNIrbSrEkS9gYZz0vZG3f4y1s+9HMcMUHRCdzN7KVzqvWxEDS
         eYpL+tU2g5By1CpetAMW5Oq8n/CnKUavwtch/LOP5S1iB60bEsBNhdnbBE+pHQAskgOv
         tMnE3YV6rSIEbFhKk48O26N69ngdlWHEk87KVsalDNDQs8K6Gg/3E46IQPNn95sXxv6m
         AESuPSDJuUOVDNRqIoxoGxl5TwWxt4PUkUzJJOJm/ucgcpJc7NJh8nDd2wYOYfRW4wtc
         sIsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wxcH+BJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ad0f8asi1065899085a.703.2024.11.04.03.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 03:21:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wxcH+BJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7v8T-0001u1-QP; Mon, 04 Nov 2024 06:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7v8I-0001t7-FI
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 06:20:33 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7v89-000731-Uz
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 06:20:28 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so6198796e87.2
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730719209; x=1731324009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K/4xij/BSc0rJ6+hR412YXm76FFQgcd6TU/8derDxSA=;
 b=wxcH+BJOoe54Sq7JGj6dIAAO7Y9ZBevULgN4Mf3fKbW+AJxvzLZVmG5M8jqX7yn3K1
 RNrqBLEW2gQVLeFxJ46EON4IVZhqYDayo7wXQT1jkg6rIOv3D8UF/j/MSf0JZ7WOOOlS
 6YurJ6BvOi4j4UV/lRkJTf031wQ6BnGSUJw1OJ6uXoLGIttERqwc/uJ/0s5NdbWf4MFw
 25UavReUt0+iAoewT47T4pcAA2I9vZJfIHior8GudieIGCb/4AqRFyII79ePFQugOC9J
 ZEKpIDS5ezUvcGVbpziqAth0dQDTYf1VtFgIUgJ6IrOXHlfCP4Yjsr5+VBuTQsW0F5cZ
 TH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730719209; x=1731324009;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/4xij/BSc0rJ6+hR412YXm76FFQgcd6TU/8derDxSA=;
 b=aNVEB6WuiigohmRRcFpQZr6TgzhNSkByD9iXpZaQgpYYIfNYJIwnWvVAEsortdu+HU
 +2IT6dPToxmZ8+yecFYJ/aLt2fauXBLMeB/HLirDpNAimCOfXq2t4IqcssLUrM5m99qZ
 9MmJLkjhV+laSS1ag3/KDp1wlwXqzPobJoVToexSHgapChQWbzXGmPmou6ezw9UaqrbF
 YLheiZ/55HkGa5g1+PHdYK9kOvd8+b8Y2gOL+YXBRJoT/SdZfijgNsbwuYGpkfRTHsPN
 RV+w3h+sNUO9d4Qs4YoAmXAEq1dDwISagO7xiaKrDpBB3qDjk7h9Vh/bTdM95RQInK1b
 X3HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS+YC6sHQH39PfHuResGu8HLuywv90WlHpoxm0BamhEA5OKY2zBKPQRdBMn9UGTf6zngeZ0MaFvg==@nongnu.org
X-Gm-Message-State: AOJu0YzbxHvRvHDRaXbfrj+cgyToIkBa6HdEZcdQg1bAtJ5XudH3zC38
 wSiODXs7mgd97NWaV5ZiDpXCeZwxiYjt/ZeH29gk6SAkhiK6Yg8HXdTBwQwjIiQ=
X-Received: by 2002:a05:6512:3d05:b0:53b:154c:f75d with SMTP id
 2adb3069b0e04-53d65df2783mr6929224e87.31.1730719207654; 
 Mon, 04 Nov 2024 03:20:07 -0800 (PST)
Received: from [192.168.21.227] ([91.223.100.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c5348sm538074566b.49.2024.11.04.03.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 03:20:06 -0800 (PST)
Message-ID: <3aa616f2-8a77-49db-91be-adb4e261b44e@linaro.org>
Date: Mon, 4 Nov 2024 11:20:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/watchdog/wdt_imx2: Remove redundant assignment
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Guenter Roeck <linux@roeck-us.net>
References: <20241103143330.123596-1-shentey@gmail.com>
 <20241103143330.123596-4-shentey@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241103143330.123596-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x134.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GM3VxeboUY0x

On 11/3/24 14:33, Bernhard Beschow wrote:
> The same statement is executed unconditionally right before the if statement.
> 
> Cc: Guenter Roeck<linux@roeck-us.net>
> Reviewed-by: Guenter Roeck<linux@roeck-us.net>
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> ---
>   hw/watchdog/wdt_imx2.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
