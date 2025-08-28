Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4ECA0FF2
	for <qemu-arm@archiver.kernel.org>; Thu, 28 Aug 2025 08:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1urYKj-0000Fg-2n; Thu, 28 Aug 2025 04:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urYKh-0000DV-Cm
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 04:50:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urYKe-0001WN-9n
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 04:50:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b55ed86b9so3343595e9.0
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756371007; x=1756975807; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1hQtmOQGBZa1yuAFviVcjQiqSOgaYsu7/vEEkbZH2k=;
 b=fYLiiUBQ1aHy0TvWi8w0d+P/imUn2uy0pVXtsG8GhmaQRTp/m2ORrpp0uBkduNacIw
 Rizu8MCpLnNyRXgdxkR9cBpVl3u09tVuTNVuJwgGOMQK6bqzq7pJ601q/4x1EexWUCN8
 YZPi+N/+ge168RyNYRfYqQkFVETD/u6TQI4PmivjJaXn2U+1xK1wCln187fePLmVnHCz
 NJ9k1N2ChDOvQ6347KGIftRH/8hLIj1ArAky5iVY098IUPO92meNJTlB/grk9nHxLDxF
 8J6TKD61Y3TweQcMn3T953+EoPoIPZM5q+ymfhIw47kj2z0VNFB2bEtjbJ7kAaeUC6d8
 PbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756371007; x=1756975807;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1hQtmOQGBZa1yuAFviVcjQiqSOgaYsu7/vEEkbZH2k=;
 b=pjw4nlcBRrzKudDdRpJ7obwjENGHME6gceIncgIDN39kcvk1B6gzBNNNqk6bhNEUEY
 CflAevxKN9MTrjboqoQjSufN+zdsKhPctigcUpaYgQpnEXospvmXIsyGY/J0oFbEhAkc
 uSpCmv5vqkvvT5GJa6AO4IJ+8QO/r8AKjSXOpKiPgm50UdoWfIUDQdfi2g6S+OSQLyf/
 nA903mu+K1HIllKQodKm86KlxNslT/990vQzwN2ESXjTDO2I0Hqi3N2Huf/iHANCvjkN
 jGwzWZj2GJWr35o42MyiRthnsmzJ6WzvLE8PbqOizxD/rHcD6p30/+ESXVwwFSc3YVal
 4RnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjWcwKtCvaJ0HKf2kFkWa0SBYkRTyXlST1GS5UeXeqhY8hMXLX2tc840nelYX6RNfv+ESV+j6iCA==@nongnu.org
X-Gm-Message-State: AOJu0Yxy4flACwkWKjht5wdIU5w1PIGyFpu968XKBrqM6WoY+meDmnAT
 7wrOux6ZxSxULlRLb6rcVJW6ZgfkFQIK7mwwwr0+63m+Bb46lgl5T2+J6VwJCgxdONCtFBaY40d
 8pjwewX0=
X-Gm-Gg: ASbGncsQSw1/9qXOOzN24Er4x7fyjUjjxAd2/8yTcUV91ngQ/uFnY/Fx7TvKLOdahJ/
 UEKFUXx9cG00IKCfL1FWrDNPW+Z1LxeaVFHaA5Tds3QWBrs8Miw+RxbkvV2S7gRg0c7OIKxpiIX
 /wIQzQge7PX+uTec0+4dqVsljfjuiOfpUHAT36jrUMnW6xsNG3UEitacMU6TBsJTEXYaeYb7Z8l
 FNadnXWc6ZLjT2pnHpt6wvr6axBdxZqWqyCPJslgwUypBKukWzcj8RqeYCG4ift/iQHh1lUM8Ih
 VTkZsDRH2sAFf54SiY0T073RpztYC+sSRddNO5gyXA6xeQ7RwHOi4WudxlH6MTpxSmhKUG5GIfI
 EOa0tp4sLHt0Sjbtkwz0TX6A5iAYObFMl2CFzyNqXR75EUA+FkvJjZLsgy7HKZA0Y5RpH4sz57L
 Ic
X-Google-Smtp-Source: AGHT+IHfH9Vy1EIeCDmH748Ql82W2J+bWkms8kOrnkfTzAvNG56PSJPP32e8z3Ks5QSMcOCPGH/f5g==
X-Received: by 2002:a05:600c:5254:b0:45b:7bba:c7a6 with SMTP id
 5b1f17b1804b1-45b7bbacb8emr7896025e9.32.1756371006625; 
 Thu, 28 Aug 2025 01:50:06 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cad431ea49sm12643214f8f.42.2025.08.28.01.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 01:50:06 -0700 (PDT)
Message-ID: <c2274ce1-65ee-4238-81f8-7bd6be5491d8@linaro.org>
Date: Thu, 28 Aug 2025 10:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/max78000_uart: Destroy FIFO on deinit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jackson Donaldson <jcksn@duck.com>
References: <20250821154358.2417744-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250821154358.2417744-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 21/8/25 17:43, Peter Maydell wrote:
> In the max78000_uart we create a FIFO in the instance_init function,
> but we don't destroy it on deinit, so ASAN reports a leak in the
> device-introspect-test:
> 
>      #0 0x561cc92d5de3 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-arm+0x21f1de3) (BuildId: 98fdf9fc85c3beaeca8eda0be8412f1e11b9c6ad)
>      #1 0x70cbf2afab09 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x62b09) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>      #2 0x561ccc4c884d in fifo8_create /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../util/fifo8.c:27:18
>      #3 0x561cc9744ec9 in max78000_uart_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/char/max78000_uart.c:241:5
> 
> Add an instance_finalize method to destroy the FIFO.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: d447e4b70295 ("MAX78000: UART Implementation")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/max78000_uart.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Patch queued, thanks.

