Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C277BD41D55
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 15:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTiRI-0002jn-3k; Thu, 11 Dec 2025 10:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vTiRF-0002jK-H1
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:18:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vTiRD-0002gp-QJ
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:18:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e2cf93f7dso172331f8f.1
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765466318; x=1766071118; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fhJ8e5w38AnuD06lyPkirTR1wBtOPe7ryXgBk91XOrg=;
 b=EKsuUIjTUY+ywzkGbhJT1CXbd+L635Hkjl5yFPuIyNTJvlLtIRp+9Fky3q2ev5fei0
 Xk127VrJId8ZIN38ighCnATusIqoZSL4r2ZzS9treSnDRlB4qckc9Ipy24OtI1ReqXuR
 54ftgzi6HGvJdHb981ZiX15rrQeqBMj8xeQuQ9pQxNEI3Eqt9GoYICmZDPJ3NpC4zied
 6+7hhwFS/C4jxRyek6Pfe5puBqWBDXHr77kdK6OJ0yf0E6D5sVfhoSiad2IDLe2gUF4h
 U0cHlw9NQhgefAtvGE2wjt3Q0tqOK74c99v/JeZcEWwbdLNZqc+jmCFzQlrfIYdyO18B
 ycYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765466318; x=1766071118;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fhJ8e5w38AnuD06lyPkirTR1wBtOPe7ryXgBk91XOrg=;
 b=dN9ccd9A0HBaTQ4bhaz/zIM1Y+4xTzBeMAeIG7nsj5be8i4GuWHH4s+I12TEKPBcLB
 kwP3WTDIEzVeGjM6Xeq4O4oTaBu3uMRLJWzOSFUOPYsEjd1MQ8Zxenw3v5YA2ufqoH6r
 WNC1qXsJ8PZiZxHk8iCBAKB5ktg7Z6TmGYEFo4ueHKOZ/qJ7fk06weVX8EkBRsQosYyf
 GXEa51NZi2817pUA3zPg8bBAlQxQlwfvK0zqsA5+3fPTnx1Kyn3DcZRyjo0ImlN7Q2h8
 Pu8Fnt8odeWo5SINuuEGTYA/hjNRVNY/ggAnOU+rAAaREeshzDHIU3I+BhpFNDUSVLRx
 hYUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCoqygi4gf1/1y7o/ySRDsXjkGZxih3eepf5MpmV73wXHBTis21ABfW5qwZHrdA8IDCQhpWcgUjQ==@nongnu.org
X-Gm-Message-State: AOJu0YxXGu9OqgxhSSDTlyOI6JiXvOU0i8rzORyo0Dyq4IS+RXU2msts
 QCWrk/7x1XxRJ3byUxV1D5H473clSH2bQjG8cY+EbcY+3MbiuZWv0z0VS5b6cjoiQkU=
X-Gm-Gg: AY/fxX60LWEuS0i9wKemf8XMnaLKAWG3YflP5l+sbjcfjJH11rMXmXwfko3GjLew9gg
 27mBkhpmcdH1TEZYiI0Il/QaHz/kfgVarWhsvZLBt3ww8S6L4ut4Ng6iRPiEkio0R7Uwp9WAf9W
 xOBkIQbFjYLxlQK+8kNsQ/nwf4uUmaKYAVUUh1U4jf35mr5pr1fANnkV+SdQqNjZaqYePHJzVlQ
 H2f728gYMFxHwtwGZHXFOiLZXA44z4Wy+78/Wu/aw/yuqe3Sslnx8fHnjaxy7qU0DSAiVTPMSkS
 TA4ZiTkrzpY9+PQ4DQSzegWJNsTCimUIAFtccdc0UIOyi7OhPfeDs6JBUmYiW6KCNhdLEKlsA/b
 UI4E6+6VehTQJt2DSIwqMTE/7v9oufGG0OIn2Xnz4MZE8xo3e4nH5P7gSoMjcUfZ2ilF+HV6QVD
 vd5GgvajdFjAPaj1/roasV46kfYgj1FJiOoGz0kMJrFYjReUQgNRYCDw==
X-Google-Smtp-Source: AGHT+IFW8yyD50rMHB7LcSjVEW8hc/jNmcurEwCqp36H9qyLibKDc3koEEgE+zhy/rcTSsMTkyquLQ==
X-Received: by 2002:a05:6000:2c02:b0:42b:3a84:1ee1 with SMTP id
 ffacd0b85a97d-42fa39d1d17mr6918326f8f.18.1765466318167; 
 Thu, 11 Dec 2025 07:18:38 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b85feasm6591879f8f.27.2025.12.11.07.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:18:37 -0800 (PST)
Message-ID: <49968449-5363-42d8-b9ca-e77da8c81986@linaro.org>
Date: Thu, 11 Dec 2025 16:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.0 0/7] hw/arm/omap: Remove omap_badwidth_* functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20251210183700.3446237-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251210183700.3446237-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 10/12/25 19:36, Peter Maydell wrote:

> Peter Maydell (7):
>    hw/sd/omap_mmc: Remove omap_badwidth_* calls
>    hw/i2c/omap_i2c: Remove omap_badwidth_* calls
>    hw/gpio/omap_gpio: Remove omap_badwidth_* calls
>    hw/dma/omap_dma: Remove omap_badwidth_* calls
>    hw/arm/omap1: Remove omap_badwidth_read* calls
>    hw/arm/omap1: Remove omap_badwidth_write* calls
>    hw/arm/omap1: Remove omap_badwidth_* implementations
> 
>   include/hw/arm/omap.h |  10 ---
>   hw/arm/omap1.c        | 203 +++++++++++++++++++++---------------------
>   hw/dma/omap_dma.c     |   7 +-
>   hw/gpio/omap_gpio.c   |   7 +-
>   hw/i2c/omap_i2c.c     |   7 +-
>   hw/sd/omap_mmc.c      |   7 +-
>   6 files changed, 122 insertions(+), 119 deletions(-)

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


