Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp1486347njd;
        Sun, 30 Mar 2025 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQ05qfYKZT0PjGcxm+85kw1q9A0r+b4wNu2XAv+Y5LkL+RtS6qW+q2fgblK1ZL+/oNVW86lBOHv8kcOg==@linaro.org
X-Google-Smtp-Source: AGHT+IH+lfMx5aF9fClLyR1FGuYSWlLQ1wyT+wH90N2Av+qGq+gmBmsHIaGU1A9fAEznKZveEvMv
X-Received: by 2002:ac8:7fc2:0:b0:477:6e6a:7cfe with SMTP id d75a77b69052e-477e4b3e9f9mr75750611cf.0.1743324958352;
        Sun, 30 Mar 2025 01:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743324958; cv=none;
        d=google.com; s=arc-20240605;
        b=WJ5uGtBaG8yeBgLrCxA8K+A+zinL0BIlMwqR9eMs3Y2VIgCKPuXMt/11PAflY6MCIb
         wn8HkHRfbnxmro/dO+JMI2zmybeEFXe5geah434OE41RFkShnSvs7Yt9wiymyUb/sLmH
         U2n/f/3v/D97TPc2kC1rDy0VdkLQmmnzFVn+XvCxd3mp9EZsRjcSnNBUXm12g+hYnMMd
         NomezDj+LAf+xYT3uNYfsPyHTMXgwkZ9dcQ50sGhs51SePrN8i2M97yj15sAZX4l9LNr
         j6wGv1AQ5o2T1S0zk69np5Dx+wGG3XS3LuI6AEkphV1Y4cjJlcPa4OBRdFuu+y3P7sR0
         e9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9/nxt1LrBVyfREPr1sg3Dt3QD+ktmROgEeHZ5OrCeQg=;
        fh=Pu/UB5m9UKNRQ3T2S2tW4oAxo8Ooogt424icEDifPNU=;
        b=XTgRQm0+DQ/pQxx4k9xrs4RsMuSZr20pVwt1kOV4Y/9tsmKVXGaAGGlYVds7VzPeQs
         Rnu7ejkHgvcsWryROKj+IDFRdFFVQGD4+ML9KSVswxvPKbeejfx+pGhwHEDFVoDNKCc4
         vAUJ5lMOMml9U7UwtcIibpIUXZQFvWcwhV8jEAUStJNT0KdhdDTGXpzg17RVrOC3APNW
         EonRKf85gr+ZNCU5teNWtXh+/9WwUrFMp2zsqPViAh+U5hABl2koNSfHR3U7wkOeD20f
         s1buRAwNLAFg4n6Q4A3ptJnM+1mtwP/HuvxrqEyaFguKz2vihIFN7RrlXzOnyedDQTEq
         KjmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sXNneDhz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47816271e8asi26954211cf.351.2025.03.30.01.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Mar 2025 01:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sXNneDhz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tyoS7-00006f-ER; Sun, 30 Mar 2025 04:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tyoS5-00006F-8K
 for qemu-arm@nongnu.org; Sun, 30 Mar 2025 04:55:33 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tyoRz-0007H3-KV
 for qemu-arm@nongnu.org; Sun, 30 Mar 2025 04:55:29 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso1193146f8f.2
 for <qemu-arm@nongnu.org>; Sun, 30 Mar 2025 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743324926; x=1743929726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9/nxt1LrBVyfREPr1sg3Dt3QD+ktmROgEeHZ5OrCeQg=;
 b=sXNneDhzQwtWodEKQgMem247WZjwyST958HjeGOXPwrTpNi091CnK5Buv7ImMJ8JnH
 sTdkCUAWTk8fF//G04vii15+c+ubcjJtxI1Ra36Cn12BPoXg2aKhUJomdDBAmS3Dl9uI
 NGQhsgBhjQwuVm9/aOBVnN8oGb46Q7uvM8gxDV650HCvOEkAu4j6g+TCoBeeGHVlk7g4
 jUYZFSR/mTs+jsnNfgqAZb2JcJzZFqp5w6B+wPgOyOeMi/XBDYK05+hGijAnDhHNGFDt
 Z8gb8J2CkImeJTgA+/5DBrW52XTeZLZGagcYjviOxtCMSBj3cDuQHL0CwSlsi87h49RD
 tlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743324926; x=1743929726;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/nxt1LrBVyfREPr1sg3Dt3QD+ktmROgEeHZ5OrCeQg=;
 b=DCBPUzGqEfoi4tM/XMGSMdg2MNfM5TFzDUxKra18Cx2E2atSkGqkwMhiDzr2d/Tzc0
 DIvbZHnij880dpXDQkSVAx6HB+KmUJJgyPFgzaIFvBGO7pt1KaKyBCIDz/TKHAUD+7cB
 EdVLNa4n/7c67VTE3cbpEEBx4ZZKmCeMIFW4ZDf+uRgC8Tlfy2vmTiI5uftSLbmsQiMw
 zL3+f4r9cpcCZOxUvjOHORaesVHVbDkp9quSjyg4i+yNfBTBjKeg9yn0P0X5gl2okmO/
 V5japn3yNa0R08txaId+rAgQQ7lLzDf94YO7YMvfD9HGCOVil+CoSumEzJP6EfZ+gHBv
 sIzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIsm89kMoS+3/fH7bDvW2pzYVr9nn+rk/SB0/v4ZIjlYBVyVQlqGnnzzs1zNsfGmSBG9tS+PdiAw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/0MUYLGtqYRBGD5+C6Aer0lYsb3XveMNqq5gtp+9sdXI/g319
 ddXG5J/lKAN/Mqo5icXpk59Yxcga7jVMifg56AkOJ2S/054VNUYe/l2KrRYwvaE=
X-Gm-Gg: ASbGncv4+wkWBdiUXl4SuKawCvFdvMqz20EpPytQibD1aZRtAqxCYMJCS7fwy0UJgXE
 SEow1d2vVrMvG+k2ynH5CRbv8gZG/30bf5mdc9u83RpoXR+AjV3G0JJWVfq27ZJdIbQOVJ90im+
 j+f7RR9K5ijDzPqdPUyvVbNxZbXer56PwIcqxvHCwjIeW5NceBE5eSZtlyY4LfTp2SRQa9Bsq6Y
 xiqaaacy3836ehCMsQl/C7ujmhYSuir6gHyk96SuGSoDfGyPe1skWedAv1wUpHSfswVTqCBeAhz
 RiFZSbgQAeyLvY7BbhP2Sm+gpTLBhi/HKGvY5fYkIzZLCcBVoWTs658E+3dQUdor+d/IZNqj7Pz
 o0BM=
X-Received: by 2002:a5d:5f91:0:b0:390:f9d0:5e3 with SMTP id
 ffacd0b85a97d-39c120ca76emr4304099f8f.1.1743324925667; 
 Sun, 30 Mar 2025 01:55:25 -0700 (PDT)
Received: from [10.155.70.213] (63.170.88.92.rev.sfr.net. [92.88.170.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658c87sm8110604f8f.9.2025.03.30.01.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 01:55:25 -0700 (PDT)
Message-ID: <e778d53b-7ff8-49cf-a23f-7255cc968672@linaro.org>
Date: Sun, 30 Mar 2025 10:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/bcm2835_aux: Fix incorrect interrupt ID when RX
 disabled
To: Chung-Yi Chen <yeechen0207@gmail.com>, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20250328123725.94176-1-yeechen0207@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250328123725.94176-1-yeechen0207@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5/unBcRyRzNg

On 28/3/25 13:37, Chung-Yi Chen wrote:
> This patch fixes a misconfiguration issue in the read implementation of
> the AUX_MU_IIR_REG register. This issue can lead to a transmit interrupt
> being incorrectly interpreted as a receive interrupt when the receive
> interrupt is disabled and the receive FIFO holds valid bytes.
> 
> The AUX_MU_IIR_REG register (interrupt ID bits [2:1]) indicates the
> status of mini UART interrupts:
> 
>      - 00: No interrupts
>      - 01: Transmit FIFO is empty
>      - 10: Receive FIFO is not empty
>      - 11: <Not possible>
> 
> When the transmit interrupt is enabled and the receive interrupt is
> disabled, the original code incorrectly sets the interrupt ID bits.
> Specifically:
> 
>      1. Transmit FIFO empty, receive FIFO empty
>          - Expected 0b01, returned 0b01 (correct)
>      2. Transmit FIFO empty, receive FIFO not empty
>          - Expected 0b01, returned 0b10 (incorrect)
> 
> In the second case, the code sets the interrupt ID to 0b10 (receive FIFO
> is not empty) even if the receive interrupt is disabled.
> 
> To fix this, the patch adds additional condition for setting the
> interrupt ID bits to also check if the receive interrupt is enabled.
> 
> Reference: BCM2835 ARM Peripherals, page 13. Available on
> https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf
> 
> Signed-off-by: Chung-Yi Chen <yeechen0207@gmail.com>
> ---
>   hw/char/bcm2835_aux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 97398d900ca ("bcm2835_aux: add emulation of BCM2835 AUX (aka 
UART1) block")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

