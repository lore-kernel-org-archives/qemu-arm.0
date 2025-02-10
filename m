Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1987548njb;
        Mon, 10 Feb 2025 06:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPXXKT9WfnSVzfrmyxyIKus5SrpzPY1W7Y0CujGHI8ZxScg6HwndM4+I7MzNmRCLf5VFz/NHzXAr45bg==@linaro.org
X-Google-Smtp-Source: AGHT+IGZ4gAjNO+qfwXgKC6L7/XpdkINO5Ykz98viVJQdvPxjeki26AX86OCm7O3aYW/yP0DmRoW
X-Received: by 2002:a05:622a:1a1c:b0:471:9fac:5a2d with SMTP id d75a77b69052e-4719fac5c3bmr3636601cf.24.1739198947160;
        Mon, 10 Feb 2025 06:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739198947; cv=none;
        d=google.com; s=arc-20240605;
        b=ACZJ7731RbgzBvsGe7JbGQuVhY5+N7RgyvICJRY6ALFhWV6hW7aVZacxei54aR7fC5
         k4Yp6HBTPbmkVBNnVg/SQ08tx2MFauiyQqxvz2GqEbiJYYGaMoVzVa8r2samoGy4uXqW
         tbzuFvKrTSlsEa2lz6MwMmUsjkIhgpVzeDMrxsjA/s5zgJrmtskg5EDspHoFUrISNVnz
         lgF9p2dZbNZK+JFYD4SGj8a/iqaVk37GFeXl3jFc+PDPimibrYXIm6hUDaPZSgRJTtQE
         +rLMGpj3xK80Xb4p+OKcPXY/x3Ag4VekCF6YnBt/gTgbcfzPA5yMUCq3GZ2rpDjqlCj4
         p6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aQQSm8l49PTTpp46FLlhIZ97JYHJRgRAdgT0775ecbo=;
        fh=x03RV1Ej0T1wB3m81Rst3lNRLA+4GyNB42CwYQgKzu4=;
        b=Obgu269gyC5SnGbX0reyflCMduy2gh+5zRNWU08NE6SLtIATmNDF63ryZhvSyt0EGf
         gGQoww5LIfRU5e5LZYv2Pp4GHrW4WiGRW0Uybu7dcp65fz3h0UzKyjxYqj16myfWJxpa
         SwDaT8oVXD4BT2uZ2DHBvIYOuR/HnL9NZntesVPEXKJAQCp/6lu9LjxM884FP8lflYSq
         qn356orLUUzY8ygLOMdsM7IJNHCMNiZIsaG5RhlJk+/JGnBZzUk8bQbUuA7GwZjzMa0N
         Kc42vi2HGGZGrvIS8hDkAuNQ4Zctd0DGwVuBjVwurwWSJFY5iMh8R2D9WB8/GsdWqKvY
         4ubg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygMw5MrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4714927c8f6si96139001cf.25.2025.02.10.06.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:49:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygMw5MrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thV5e-0005Dz-Rq; Mon, 10 Feb 2025 09:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thV5a-0005BV-9M
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:48:46 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thV5Y-0002dO-JS
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:48:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43934d6b155so11223235e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739198922; x=1739803722; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aQQSm8l49PTTpp46FLlhIZ97JYHJRgRAdgT0775ecbo=;
 b=ygMw5MrUZzYizvhnqh06tpeTPEHpt6ecDXd4FqCs+Z4c7SdGbVLkmjJ7T776NMbDX2
 S0Mw+hyCPXYt7jMtoxWYF53IOY7InqeWvut9nU9iX3pnxrlIdFy0jM+V1hoI5PJbHz0K
 2fAE/zSO6q7lpsDcIHuqnZsNot5Im3SZcP7Cq0++3vFrTeLVpj1Fl1qobcgQWTWAYpp7
 0Xr3q5sqyWFJZncpTKz2fPPOeYFTjlIwhhK1z4kRnHWOfeU85wE7CgzLTs6p+yeI30Ng
 nABy+qqh1FJ8rBw6FPWCvQ8eGf1umhQZ2KQfadzteIniUEXi4NFgHa8ad4qjjd+vfMb2
 ZZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739198922; x=1739803722;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQQSm8l49PTTpp46FLlhIZ97JYHJRgRAdgT0775ecbo=;
 b=Nt5ZJNb7y25cL6KZDQJ9pi8JtkPNJ/bLzEtw6nxLvnz+rlevwZFGCvRZ6A20XlCFFq
 oAHhJbKolmeqOdDEwfA6Fm0qE/6pQuES137EnyPQrrRwjleFrr4UNJXdSzrr8pgrHETW
 Xvhv765e92sbBP5RepVJdI5UdZz2VJG95KsAi7V/omku9LYHxlDIeuF9tEzcA8Q2tRA0
 0rMmr9063Cb1HKW74ZLBvZKl2L3E+aEgiEE+OgGKXd/UP9yRW8aoU7MxCxK3mPx+8sS/
 EvDarb8IlP98UKhuh7QPfQIOdiKXoPo0WpZr7V7RNW+QLLHWPGDchKAG2+D9htkj5rPI
 c9/g==
X-Gm-Message-State: AOJu0Yy80A5xB6pIixZ8Mc+0s7HAEo/jB9qGt+ot5fEOk0noeQ6szkyT
 DR066cyZZYjzNlIPgFyt8aJ3Yx5LyCVX8izMkWs3kIAh/OG1I13nNZG81oyWL+M=
X-Gm-Gg: ASbGncsyKLQnmuvVQCOZqhAvjq2sk02BYD24u9GykkcU4olI7ruXnffaui8kAaPkKXB
 kiIcd5T2abgfBzDV8BML78QplrekX5gEK89IYX2it04TzFjMLsWTniCQNtg60/5ONaJ5hr/Mtiw
 uoFWztK4pjd3wLjiZIIMz8TeD0frPffK4AGwQdFG8xxW2WG/zBLyqvuAtxm52d4GysbAzG8ohRm
 9W+bUvRzhZDq1yum//g4OmABrZbQTLy3+SY4BQb73+dOzFdK3tMos8a4NgNyEkh52dlFmykak5F
 9RHE/vSXnFDKX6GhIUvOIZj+cXOXmGGNbclm8ATM7Ie0DYXD/n/9G3OE+g4=
X-Received: by 2002:a05:600c:1d8b:b0:439:3e90:c54b with SMTP id
 5b1f17b1804b1-4393e90c744mr45830415e9.0.1739198922615; 
 Mon, 10 Feb 2025 06:48:42 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394328fcb8sm38499215e9.32.2025.02.10.06.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 06:48:42 -0800 (PST)
Message-ID: <b47baac7-8ece-4ae9-80b3-84b7c9059da6@linaro.org>
Date: Mon, 10 Feb 2025 15:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] hw/misc: Support 8-bytes memop in NPCM GCR module
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com,
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me
References: <20250206221203.4187217-1-wuhaotsh@google.com>
 <20250206221203.4187217-10-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206221203.4187217-10-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: +t0EPdQOjtpT

On 6/2/25 23:11, Hao Wu wrote:
> The NPCM8xx GCR device can be accessed with 64-bit memory operations.
> This patch supports that.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/misc/npcm_gcr.c   | 94 +++++++++++++++++++++++++++++++++-----------
>   hw/misc/trace-events |  4 +-
>   2 files changed, 74 insertions(+), 24 deletions(-)


>   static const struct MemoryRegionOps npcm_gcr_ops = {
> @@ -261,7 +310,8 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid      = {
>           .min_access_size        = 4,
> -        .max_access_size        = 4,
> +        .max_access_size        = 8,
> +        .accepts                = npcm_gcr_check_mem_op,

Good idea to implement the accepts() handler!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>           .unaligned              = false,
>       },
>   };

