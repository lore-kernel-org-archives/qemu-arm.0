Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF970CCFA1E
	for <qemu-arm@archiver.kernel.org>; Sun,  9 Nov 2025 10:38:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vI2nv-0002n2-IA; Sun, 09 Nov 2025 05:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI2ns-0002lR-Q1
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 05:37:48 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI2nr-0006qA-BX
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 05:37:48 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b710601e659so334845166b.1
 for <qemu-arm@nongnu.org>; Sun, 09 Nov 2025 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762684665; x=1763289465; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6NzZ3BuJVpXC8eyjQfuMUstoZOeqlMms2pN0F9K+4M=;
 b=ao24f0/xgQIMYUvf/CAeDp/Xf7j63/cz8xJTnzdjeKQDell40HmlgsrutkSvImh9gC
 7h6OL03/5kgCK8kIInKeNzmraQQ6ZxO7iWOgtta4EH+LmvhARZ9hFOXtp9h6fZJui2l7
 RNi2elh+7QhvP3IQmxWRLnbIeTv6WM7T0M5jq0JGTAM2G5qk0h7MFRX7fCL+jSlHhl6o
 6nv/3hD0lzefTYx2vbT0cePKRs7Ux6SwgD0T2S7EokI9D7fs/snkkqowlS+vAJ+j+19s
 HaFpyttto00Pf3KHo47UwF1cuGuegY3X2GBgbn8DTT9cfegz92mIEA+t+OITRhZzq4yw
 96GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762684665; x=1763289465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B6NzZ3BuJVpXC8eyjQfuMUstoZOeqlMms2pN0F9K+4M=;
 b=UXWrM5bX9n1datSzuCn+dKnWqHlKZ4nYFHb6juG2yQp/K3RUPRlJG2PeAoxBIpQmp7
 UyjNtsagtGSgvnZ3Xw8rWej1zJs8xIepsr/hh3bN6HspAZ3z6On4uTaG7XzJjUxqeFTL
 CSe0caKGxWVxhMpSrbsGXjGospFKpm4dB6UZYTewQRT5TL0ppGabLlIxOUxiNBGuJ8mg
 mwaff4ksEnVtMQYUP3DQT8RczjXWtrOLlEzKB+1LKO4HtdfMAlUrTY7NZjtpgqq1aPz1
 hJN3Y4R34VdDpNj4fpHtC70WLVc78VNr6VkrJhT5FCqlliQBYUHWOag2rzE7f4FptwdI
 3vMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfssiY7F03aBwVKgNzSvC72uc97fNdF5J41j9B/9NmOq5rX8HF0TblcokodVTD74NYaVhTTZrI4A==@nongnu.org
X-Gm-Message-State: AOJu0YzyF+rgDRQi3wanZvBviqRqOV37V9M6ZVlnrbhUJl2UnNcoJDrW
 Q3TfMPAF8ozr78huLs2aJo4SD8N298w1WaCioh1Hwv7qrJvNiZhE4VtSDFmaPuZedi06KiH3eLo
 3DVd4
X-Gm-Gg: ASbGncvIdwuRtKPlKX/RGVhRI9j+1cN1vFLMkSfaFFejr2LWYFFCkFFaUbpy6tkgWuD
 fw+nOQV0fy+WyblHPF/FH2n0QH/RczhxTTCyFkZaa1KCuyEkCyg1n/IVCiqrE43/iJHBQRjwMYA
 FuC01p0dPCMkEooKKUdPVTulioP6o9MCYeNfIdti7p+Yxw5zqA+Gh+IsUyH4cDNSYJ6CckVegED
 wtERPep4zuh0F2C0OtAyGg0AA2GcyjcyMDV8oY4Eb9Hm9CnhdrGXx13GesZ2ndslW8BytSIOl15
 /scsVyjjATSclBRpUKw4RufKXoSuvRMp+M1l9dDY6DeD/4o13AUbXHJff5mjys1GDFHSjQqs5tY
 RPJxUkXUHmcAInfeT/XJ2yBAKWpxlyW9NTfKa2AnTArid80vCCvKPrfPX5kIACU5Ir3VzDans8U
 M/gqynQwpXPI2Gt6cSD/xFrDhOlm5gJp2kfkZmihkCk1Sexq0yq8v8jzTaxQ==
X-Google-Smtp-Source: AGHT+IEVe1Tahd+5nAHgUS41uHc/zY8r6PoCJerZJcOqHj1UmBhdfiqL15V3Ll4KLgKrdsfD5TWGVg==
X-Received: by 2002:a17:907:841:b0:b49:5103:c0b4 with SMTP id
 a640c23a62f3a-b72e04e4893mr571125266b.56.1762684664561; 
 Sun, 09 Nov 2025 02:37:44 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bcd59sm760049666b.53.2025.11.09.02.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 02:37:44 -0800 (PST)
Message-ID: <71950c1c-f3d4-4395-ab43-4bf1178a8acc@linaro.org>
Date: Sun, 9 Nov 2025 11:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/npcm_clk: Don't divide by zero when calculating
 frequency
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>
References: <20251107150137.1353532-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107150137.1353532-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 7/11/25 16:01, Peter Maydell wrote:
> If the guest misprograms the PLL registers to request a zero
> divisor, we currently fall over with a division by zero:
> 
> ../../hw/misc/npcm_clk.c:221:14: runtime error: division by zero
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../../hw/misc/npcm_clk.c:221:14
> 
> Thread 1 "qemu-system-aar" received signal SIGFPE, Arithmetic exception.
> 0x00005555584d8f6d in npcm7xx_clk_update_pll (opaque=0x7fffed159a20) at ../../hw/misc/npcm_clk.c:221
> 221             freq /= PLLCON_INDV(con) * PLLCON_OTDV1(con) * PLLCON_OTDV2(con);
> 
> Avoid this by treating this invalid setting like a stopped clock
> (setting freq to 0).
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/549
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/npcm_clk.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


