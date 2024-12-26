Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5884667njk;
        Thu, 26 Dec 2024 09:37:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVihvLIOtXH9Ud93IkbiJo8pseXIMIiuY9lhg/Sbw3uaE5dgjKLg2KoJxZRAmrtvXQUXcfJzgpb+SJU7g==@linaro.org
X-Google-Smtp-Source: AGHT+IELejL5LEcXUlM8qhOPuQM/fYyL6rLBGnyBZDEDjSy2Y7g7186yprfKg7BNpweo8bewonEx
X-Received: by 2002:a05:6214:248a:b0:6d8:8da9:e418 with SMTP id 6a1803df08f44-6dd233aedd7mr375556546d6.40.1735234644552;
        Thu, 26 Dec 2024 09:37:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735234644; cv=none;
        d=google.com; s=arc-20240605;
        b=HJS6F3WLSAotUvCI41VaoUWnUjS3woASTpijd/SLtuaPhIvuPlfcN/MzhKKwRPuKqz
         1qO2yHpDlCwCnjCB5x6wT+qznoORXEJFhNYJugdGDWRcDnz84kW/njBBvs6WijqX3Tgq
         jRdX5p+UdgDVHJ1ud/pQDU8kt5yWCl7Y/ZsX5fXlRvgz+2OzVSZArlChRhvgGnGX1iMv
         4d426rZk4L0pF3/1T8VeSoZD3/3zvy2eYujq9uBahoUeLopF0nr5enrZAq2DzV45ENLH
         BZfI9ZHwpcbDmeZ7unmCbGcYoi2OUOhkvFAo+S+NqD4wMW3LQKDvkpiie7hMLd+y0bDx
         nHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6jDuuLJjvLq3B5zgsKAAfTUjIgVl2eSiRr5t3Z0qcEI=;
        fh=zBwVYIiaoQaRqid66lpvUJ+7F9V5MV+hiYHxXqtg510=;
        b=Ozhw/feDuK8Av6TbpooMVIM8MByGwFnBF92hVjQyUMOavRpgpsjt85uN8Z54pSX8o7
         /cwgtxrJioM2Qg/EEVyboCSLJolvcTiwFhAJspYV4EqtD9oJCYORKPp7iCJ9VBMl03ZI
         3tAGe7AIB3755U2YI0gOoSr7gfarzwubXshV/zMi+ISnxDTcBB1rO67MV7pO5/lcFm/H
         1Dqx3NOFhHt28cqeM5laSE2Y234lrWgUADDWQNCSiKMG4faXrRe+0cuHuaNFkXccNLdU
         clbhbmKXBc/XgfYU5sCyeoCLxUWe3zlAdGlsd/h4yt1CZgX6jnk8/olOrsoAzE+Bw/YB
         uaYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zL5xl931;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18137897si199137456d6.160.2024.12.26.09.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 09:37:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zL5xl931;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQrn7-0003ad-4U; Thu, 26 Dec 2024 12:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQrn5-0003a6-Jl
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 12:36:55 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQrn4-0004Gs-3P
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 12:36:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so70627665e9.0
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735234612; x=1735839412; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6jDuuLJjvLq3B5zgsKAAfTUjIgVl2eSiRr5t3Z0qcEI=;
 b=zL5xl9313HipSBedIuXR5FkKkBH/WGqCPF5DrFndWzq8OCjqtzFKNoZzKpKGU5nI8H
 ivJFKaCYMm6beGGPcOg5ar4z1BRMKgLp8XlUFpTyWrKB+JvD9BEL/17PLlJW2g1mh058
 dCmQEGtn8MaG/j/QsMwKVAugmMUsJ4D8d0CKTknEbq0pHAz+0MBb9IblEx0hx5GKzlxm
 SDpBs1ijUYm9/Xzpzv/6jyLxJ1O3XG+CHPXtY5DkPc1Ocs2bP+8b2xD/CFzQ3eJsYxiv
 oyGq7flA0BOfcsN2B47rvZV9Zi10AAGUNIQzuRPfIH5qbeHlwdpA2BwWW6OfsWmkzILR
 xFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735234612; x=1735839412;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jDuuLJjvLq3B5zgsKAAfTUjIgVl2eSiRr5t3Z0qcEI=;
 b=Mi0Ufd919wyfYYCgyQMe+ny5UAiMv5D/Pu6VgOL1qCPsE5S6E/KusIvPSevnVCIF3q
 nt3762UiMeaFxsP3JO1z2Gc72WcT7Dz5r5cHuA2M5jMm3nosMtTTS1IGiXcGpPl8c/ox
 zogfPWsOawgVp2xy4mmtdbsB2ZeVb73yPX86rAAfUdACRFpDp+6MPkjTAsx3SPLMHATd
 xjtu/xF3ZZ5FO96AiiBHQcMdLnkmIwUjhsmd6FgHHNbb8ydHC8HcMWLSKfBXzSPeV8Xv
 5f0dLrZJ9t04TMkT5Gg/76bbf/yn5ye8hXLgT0XH0Q/tMCUIr6H/6mlIxBWFPddPVMBg
 eYxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbAMhCkBeB1P3zepa7vfPkUZD3j53aqINN9qZwpT5b8Dzd+9xrSrQFOpeYIJ8FW3akvoMubp5m2w==@nongnu.org
X-Gm-Message-State: AOJu0YwytJeV7d3SBORr6T8NSQ62cUDR7oJ4HL3fYq63MgAGm5nFshXr
 EDtdWIXJ2asSodiw8243Idxeqnb4OoCDSiC4ezX/dc3neOU5yBmQPi+mISQ7a4Y=
X-Gm-Gg: ASbGncucwgCMv6l82rPzCQVRM94NWF/knERYXcxytR1TezcePMyZXxznCQPTnTMd1Qw
 NF3XTsPuGadBVWnP7tLdAU780hxnYTLYQUGdI3Jipc28C6vg7bStDZMvzEJL5dsJadlAW4nb3qu
 wQdTzOAhzKMKkwtqFhKzOEM8WQtb56LaG+zWrjBPUVCXf7f+1A+aOfNxetC14loxub8QVb4EDcl
 cov+/dlLzO8BkVjZ0wk+NsaTLGWTkB/Mptd97QRw4M40n9JizDffZvOPRonuUECOxUnJ2u2rYI9
 juEmFMFg0H7Lgx6XZ9UnUfNYgStqeRmuKyeM
X-Received: by 2002:a5d:6c64:0:b0:385:f6f4:f8e with SMTP id
 ffacd0b85a97d-38a223ff1cemr16935449f8f.50.1735234611869; 
 Thu, 26 Dec 2024 09:36:51 -0800 (PST)
Received: from [10.217.61.213] (180.red-95-127-33.staticip.rima-tde.net.
 [95.127.33.180]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6ca5sm20440819f8f.86.2024.12.26.09.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Dec 2024 09:36:51 -0800 (PST)
Message-ID: <f16425be-46a1-4989-a7a2-9d7bb005d257@linaro.org>
Date: Thu, 26 Dec 2024 18:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: cast 1 to 1ULL
To: Tigran Sogomonian <tsogomonian@astralinux.ru>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
References: <20241226095815.15377-1-tsogomonian@astralinux.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241226095815.15377-1-tsogomonian@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: YADPcgX9YuXo

On 26/12/24 10:58, Tigran Sogomonian wrote:
> To prevent integer overflow it is worth casting 1 to 1ULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
> ---
>   hw/misc/mps2-fpgaio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index d07568248d..297cb1b602 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -198,7 +198,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
>   
>               s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
>               for (i = 0; i < s->num_leds; i++) {
> -                led_set_state(s->led[i], value & (1 << i));
> +                led_set_state(s->led[i], value & (1ULL << i));

Let's use extract64() and call it a day?

>               }
>           }
>           break;

