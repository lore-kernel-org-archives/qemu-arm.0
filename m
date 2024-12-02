Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2859429njk;
        Mon, 2 Dec 2024 06:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4nOvgr0yAjGO9uDfu6RilkDeadYYSFPsCs6plV9BPzynAvKXXrM5ZLX8IKCchwaW8vvg93tis11VaAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHEkvhQM27Kq2/WyJ/Khq1GPcDYDjzTApoYc9FhA9UgXK6SsnmdeGBRcXUjfVzhz3P1i508
X-Received: by 2002:a05:6214:1251:b0:6d4:2646:109c with SMTP id 6a1803df08f44-6d864d061d3mr341334746d6.3.1733148796013;
        Mon, 02 Dec 2024 06:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733148796; cv=none;
        d=google.com; s=arc-20240605;
        b=kAv5CuNvuS5szAFzp9upcRB7rSSTCz2hOa0AIYmJf8zrAP5YwwiqimtxmIgijCeqTf
         WCPdyFL8hajFJ6MoIm6+cTCa4HT2MZrVPJvwZOtaL0OuSGrX8WrbxLQgWQrhSlHZEqDP
         4Rwy1vGIn2PvVdscslR6nRcRTp6vuQYZilXODDFiQqFDWQ3C7vA3S/iLTHDEGPZHUfxs
         KbbGBHXOIwe6bE2Zok029s1aAFyolBZFLr5l4eVJF984pXtoU4nXg81HIA6VqIPc3kGH
         u9Z1xmGwXtu7LF6HGh8wzni5ePzC4PuSaJHLaT2TX4qcS6db3PRThz3YaJ3hESUkYg8v
         OpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IvdTaGkelmY0IEVR7fsxRrmAClGwINqYQ/rxeg7ayYU=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=ISu66SWSMVX8lLsFHxB/mMbYRSPyvlpIQzgQEgPSPpCo9MlIiO0STN0q7WESB+fzB3
         F/pMHGkRp3HfZZ8v6grOmWZwJksiaRtdD8Y0D6sdiZr2xayyVAQCATO70uZmQ24+gRVK
         OLO/V1mXrLLPpRjoxk4RBVInb9BkqRCOhxCZqYktCrhJByIRLx9jDReEhdq2ctz1tmIE
         BCYTd96+2wy7BmjIPne6l4DrmIqE9RtfCHlqbC5URS70AtVVquvPY33hWRz8Kb93rgsP
         k+0BXqr0JHqoNGaQNFdeDyhAm/+8pPdWwLanKINyrycfsaN6AvDHn+NB9XP7RSnqeSFq
         ea5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u6OjmIzY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d896adb296si66863536d6.57.2024.12.02.06.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:13:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u6OjmIzY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI7AV-0007Qf-MD; Mon, 02 Dec 2024 09:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI7AS-0007Q7-CV
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:12:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI7AP-00062o-Ry
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:12:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-382610c7116so2871583f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733148768; x=1733753568; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IvdTaGkelmY0IEVR7fsxRrmAClGwINqYQ/rxeg7ayYU=;
 b=u6OjmIzYL2lY5oWJRnd42OUS815IxrPpQ0LTlaLa7DgVTfm+EENjYaGDC04rP/hah9
 SNoYiWTVYgLQfDU4W7TVa1TODlxlxYCISbjmM34suqvHYa3COoqcCK+PHgdf/OlwqG3A
 X+5U1fLYX2W4dyLsOM/S1m74MceNmxQdPg/R2IhdHRWelAgqhxKdsdQrN1MK4kWRePti
 XGDsNOXbHqiGou/l/fOkoHZ8O6Y2zZU3m/3MKGX+wUSRtIsijZJTzN0PU6QyGsTCjFQY
 +es139z841U6Da1wtTkgI5QnJftuSWr6GR5X5rEOt6cxGi9xlJbQGY2RpTp2pMxdNEZK
 TDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733148768; x=1733753568;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvdTaGkelmY0IEVR7fsxRrmAClGwINqYQ/rxeg7ayYU=;
 b=gQAiuL0tIlCCSMwgM7Zp9tUB7mE2wRKRGhgd5uQ+XkFfbfN2OQBFweeIG5t0c0fYEi
 7jihEqAb9sGOsKPs2Nq9J7wMSvlkN2AtNA7Rjym6duKYvfMvVVepU7MF/Dde6pZQeRWp
 7EnGDopEI+5K1vCmnyOAKOZH/KaxMTjreZYywnnNCGRnQwAlg9A2FatVlwrzS8Nc5rpb
 VMIApzR3xlNJyA+md9QzADB+6TUp9FN6jzp5Wgocwo0CkGZcnCzpo/kkCMVkm0iXLRmf
 j7GJuvdKm9lJP6u2wPI3av8Iw5QoMawUxE+xhyS9DZbsyMH/0pa59BLRzE3AcoLndUOg
 4gCA==
X-Gm-Message-State: AOJu0YxoWJCezUyeipOLscR8RRsyWN67Of4HxKUuVg35Dv2EHhINn97L
 74PUV+e4W77jD3XM2/hC8+mQxKUmmXX9kL/SGJaWMhUtx1n0eFIJTVXweJg82lY=
X-Gm-Gg: ASbGncssh7B/PLOiguNQ04PI2mT+GZqinuD8km6+rfXBF/oiseXAhRNIVW5sBqx5aVI
 cFCq7XmnG5E1mfhPqIqzbQRzyRynAkBATOBYSx4y0dVlzJOwhE5IBntTUDyRwDGrqGuPv1rdDB5
 +Xq4pv/VKioP4En1hnsds2h1BEyukeiWv/N+1Y5vL+cCGrJY0N7Qy56MBsQNXpDEnsONesk43d9
 V7qlz5q3k0HWQTUjcjWCHRlzvC3pykW1NO0LFhrK4A020FLXySfuqcJLBqhtJWHBqeaxY1vjPdj
 JZKt56wsT622gaXhb2aB3cc9Bjq5Ng==
X-Received: by 2002:a5d:6d86:0:b0:385:f69a:7e5f with SMTP id
 ffacd0b85a97d-385f69a81c2mr2240001f8f.38.1733148766652; 
 Mon, 02 Dec 2024 06:12:46 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dc169d79sm10717623f8f.92.2024.12.02.06.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 06:12:45 -0800 (PST)
Message-ID: <c808724c-8024-4c65-9c15-0f6a733a4319@linaro.org>
Date: Mon, 2 Dec 2024 15:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/67] target/arm: Use ### to separate 3rd-level sections
 in a64.decode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 4CP9lWNeKyh0

On 1/12/24 16:05, Richard Henderson wrote:
> We already use ### for 4.1.92 Data Processing (immediate),
> but not the two following two third-level sections:
> 4.1.93 Branches, and 4.1.94 Loads and stores.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/a64.decode | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 331a8e180c..197437ba8e 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -161,7 +161,7 @@ UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
>   EXTR            1 00 100111 1 0 rm:5 imm:6 rn:5 rd:5     &extract sf=1
>   EXTR            0 00 100111 0 0 rm:5 0 imm:5 rn:5 rd:5   &extract sf=0
>   
> -# Branches
> +### Branches
>   
>   %imm26   0:s26 !function=times_4
>   @branch         . ..... .......................... &i imm=%imm26
> @@ -291,7 +291,7 @@ HLT             1101 0100 010 ................ 000 00 @i16
>   # DCPS2         1101 0100 101 ................ 000 10 @i16
>   # DCPS3         1101 0100 101 ................ 000 11 @i16
>   
> -# Loads and stores
> +### Loads and stores
>   
>   &stxr           rn rt rt2 rs sz lasr
>   &stlr           rn rt sz lasr

I'd include in this patch (from next one):

+### Data Processing (register)
+
+# Data Processing (2-source)
+# Data Processing (1-source)
+# Logical (shifted reg)
+# Add/subtract (shifted reg)
+# Add/subtract (extended reg)
+# Add/subtract (carry)
+# Rotate right into flags
+# Evaluate into flags
+# Conditional compare (regster)
+# Conditional compare (immediate)
+# Conditional select
+# Data Processing (3-source)

Because it looks (to me) out of context in in the next one.
Anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

