Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp961362njb;
        Wed, 8 Jan 2025 08:21:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrRqcoRsOCJ5ibR14luJui/XuPq2T5xOV0e1TniKxsBRqVWdjKFlpSlIgTF7kojEbnkCX/w+mJ6PJfgw==@linaro.org
X-Google-Smtp-Source: AGHT+IEHUUWs0ekNTinFHtRepHK3xzlBuXLegEmj7MlxyjG/X2DmtKr4RMRBY9Zlk2Yf4yrusoP6
X-Received: by 2002:a05:6214:2a87:b0:6d8:87cc:73a5 with SMTP id 6a1803df08f44-6df9b28d437mr60472056d6.38.1736353293623;
        Wed, 08 Jan 2025 08:21:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736353293; cv=none;
        d=google.com; s=arc-20240605;
        b=c9TgUjcD5KcKuBEiNJzvaSv6BBb6Y1Sy7vzZOpje9FM+Q8Y9MB7Y8Aa2fG0mJhk3dY
         KORvI6zzTp86lMxbJ4+3NdURm79+67T9g/inV56j3l3akpI5wQDko/2cQQFiwdbA5R8i
         R9Qmud2psV4wo+5eSXhB8cVP96d6O0oVYFwGSybT4vVGCm0trQd9cdvcfu/kzyh42szu
         N4rVJljdB88bRcZ/hGxFaY7aOqW2la3OfHwXf46EcBABUSpIM1NntFJvp1mGHDR6HDu5
         3oLLWpkU82z28np+dl66+ZW63ryVFPzaxg0GHHU8jKqhdYLOfm0SyYBgCkucnlrimTyv
         Y7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zSj9J8PaRrqj5CYg9Lfkjte9vnQLNuRpW9jbou5F1cE=;
        fh=sYo8Pd6sx0EtcMOKetLxUFnmBnTLKEv423Nf2ajeZPI=;
        b=bf2zWUaRIhBALA1N5hiCBkgRLT9Qwf5etvPkPITnhEVGMo8kOeq4+HKukwBFWd+LDd
         26rWPj3wx2J6cwYREkAppQmB+chfPctUG0FEsqZPC/js1TGDz8joN/Toy2mlS/Uo12UC
         /seSIUkdvLADPXS9UkiGnnR0tFDbvr1QUfjRjMKZjyQJ24wbv+l8UU9cu+RsfBc5jo/c
         6pq69fJViTIn6ry+x5TkYRdKar+gZubd9aOPkALiKdklmQFGf8tDAoSAb/395EJZhbrC
         22OkT+so9fsOzpg+6y+CIYuX42+NjImXECgLmYA+mBoRKb+Cef+N2gTzWmtFk4JzWwj6
         Hniw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUYLfPt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd181020c5si478170586d6.65.2025.01.08.08.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 08:21:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUYLfPt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVYo7-0001PC-Q2; Wed, 08 Jan 2025 11:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVYo0-0001Ni-BO
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 11:21:18 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVYnx-00056h-RB
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 11:21:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso123236505e9.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jan 2025 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736353271; x=1736958071; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zSj9J8PaRrqj5CYg9Lfkjte9vnQLNuRpW9jbou5F1cE=;
 b=AUYLfPt468ggbHMdzllT8TGHQSICTv/4isbGULt269ALpVJJ9d6mmlHG+kc3QDXFpR
 AnLaA3wBMav179gw6FXZ51aIkXPoin+RQYE119AaB8w1hFeWkzZ5O5As395ZT3AKx092
 0JnuXbAHvrya+FQcESqgV6PAcePrwMCd7BpqnYItczCkDFypZmuk4jVom1XU7hUKNYqA
 On8N03LGMAioO4KhqSMadaSZHnwms9+oe96Sy97fyzL3vPxEOkYBc92Fzcf9zi0cLzIh
 uXFz9PhBZacOo9+T+/p9O1h8ShC15RWX1kXkwamH0wJpFgHoi1ti4b2Sj/3NYF9mj+Zt
 1QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736353271; x=1736958071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zSj9J8PaRrqj5CYg9Lfkjte9vnQLNuRpW9jbou5F1cE=;
 b=ht/AyTLlWOsEDniyKTDVlGMA8nk9TLveAEx2DL33Uvw22AEv+qc9G7cURe0eOnOfHt
 BcgfM1dv+aVO77x1jM2paicWzMk/E00y2LHUVqk2bfV1lD7+gLEqEBr1VfKfe3lXfIi7
 3qPwpWJpUgA+yNkigm04W8brN3B5dpg3N8x5nCI6UGojXP9o9VPhhUdeQZ1jBTplm//V
 Si6Q59zm+8dlqipCXN+mKsxdYlcxCggItP7WlSkXEN2GENApdKYajvcfQRD2iPGolUFA
 HjVDgXdIuSCkF+KmQCfcOIWud/V+VS4CxMc3a90dO/MntySuuNYHHsF5Q+qQ/EJgssXP
 Fh3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNob8vxg0+rIgoWuFiYfpoVU02OQOiYlFSarepy64StXpnQbru89rg8fQTm6L4mFHILzSx6sNuBA==@nongnu.org
X-Gm-Message-State: AOJu0YwkUkFDF+vg7jumGGCelp2GlRq0SwSfQBkqQY+PgFgtgPNyNKbb
 8XxJWqfGaUHqqnsjx6b7/LxodhM15A9httfpZDVxjitaZksczm0xBs05/6vurqg=
X-Gm-Gg: ASbGncs+wUHNEyVmSCUGPc0wReInLyFLn10HMJbtrAupztb0B0ICzZYr/5hYIoHu6/m
 owZP/ZUWHvfXCfb1HoF5222Rjes3lXF7hAKxg4lwSqEYIgGaQDpc5De5xWziPYgODrnXYcObwb1
 0AusMYgicTWG73YLv4t8xjl5uaBvFdqEKdqeStYNw2ytVB/lOyy0YzHjR0+/Y2mRh3zJ7HJc/3a
 sKVP3rpFxbdmmzO4zAonnYRTsYEiFGazq0F9Tzpopf6nSKlTQ57hBQayoTJrNtGEVwkMbIT+djP
 SrLDHseWUH/JYAtJOxLBDvIR
X-Received: by 2002:a05:600c:3143:b0:434:a929:42bb with SMTP id
 5b1f17b1804b1-436e26b9d45mr27502465e9.18.1736353271340; 
 Wed, 08 Jan 2025 08:21:11 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c84840asm53174908f8f.61.2025.01.08.08.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 08:21:10 -0800 (PST)
Message-ID: <33849af9-4edf-4acd-9611-0de6f88e82aa@linaro.org>
Date: Wed, 8 Jan 2025 17:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] hw/timer/imx_gpt: Remove unused define
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-11-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: ImKh6R/grb9R

On 8/1/25 10:25, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/timer/imx_gpt.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

