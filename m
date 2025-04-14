Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1905118njc;
        Mon, 14 Apr 2025 03:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKv3gq6xFrZ4CcWBj4gc1AteRTbfA11l5OeSuqLTe/LjXfsPfCotihGev2PXvLPvUvQPW4KCnxeiMnTw==@linaro.org
X-Google-Smtp-Source: AGHT+IEDtLMup35Fcw4dMeRSsN2Hb70zihW2Lr8IFOIfrJVpmEU2l812AI/81tnRY1Q1d2VxS0Wh
X-Received: by 2002:a05:6214:19eb:b0:6e4:2c6e:7cdc with SMTP id 6a1803df08f44-6f230d93d63mr198834196d6.25.1744627436402;
        Mon, 14 Apr 2025 03:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744627436; cv=none;
        d=google.com; s=arc-20240605;
        b=S/tKCps7liwk7JRtLsb/DiZRx19NgO+dAIFBoXWM3eWoffFdAqW1DwF9Ccu3hIpygR
         4e/7DHs6Zh1HbUgsOVYcf100BBcm03NRGAkejnGBvHS9JWXa4JFqkXZIg+XSs+lKSBg5
         1KK7bFGTvsAAsSyt6yIoDTnZBCQFBaAOgtsgFmDl4GAl7rhGqc+0lvokdQ7uMQR73UDf
         WJwFtOsWL7521O/yv9FZcchP1dmmi15mO0ZOJsSa5SlBLzzY/i7deAzbKniV4vI0WaZa
         c07CW/5Kb+3ZVV19TuhR3rF4qHSept+9wVHAoqdr8EVDSIOY09KfoiKh3hI+qqacycCt
         MIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1MZ0v41VasWztOjswGKD3Mq1UKw/Yh0NDdJUxmOEsWA=;
        fh=AK8jqPp7dDiEag2y/oHNk8OEqdygcUhyNkzW0+Fz5aI=;
        b=lhUk7wJP2hjR0w/UgusP2+8zKt7Lr5CFplB6wSuONoizLHTpxobTIlWYjHOAP588kS
         zZT5PQxaVPzKgRRfYfkuEjEXz/+gEGSJvxC5X7VQzeEWwnDDK2c1eJC6IKLu/KbLWyfJ
         hDB+MTq/dZQKS2JrI+PR5PRN2CO9Cr+JfBrDdYp1F4V8qODhNJug7J1+a/wL6H5g0E1U
         96rcscjWyn64AHNQBuk1XD4e9jcVCl1HJ8B+ukrhuGDw2pHUpel0ojN9iH9EL5Mt6qdS
         XrR7cKHCOBMyRcgeZMxj9U95ezp7mixYmKcQb+HUsUYvDjOCQvETvZ5j1pOvZFfJZsWt
         8vZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwxFdu7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0dea0a715si101579386d6.406.2025.04.14.03.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 03:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwxFdu7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4HI0-0000aO-CW; Mon, 14 Apr 2025 06:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4HHz-0000a6-HN
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 06:43:43 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4HHx-0006yF-Eq
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 06:43:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso47608675e9.3
 for <qemu-arm@nongnu.org>; Mon, 14 Apr 2025 03:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744627419; x=1745232219; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1MZ0v41VasWztOjswGKD3Mq1UKw/Yh0NDdJUxmOEsWA=;
 b=EwxFdu7IJVLeqcNpsk95wwhT/JEbQLgNwSxZGRhyvk7GVhiRvrCzb4lziMBF39/qj2
 dEfeyAwI6CObTnVwiNOol9X5c0bzpJn1xFhQImzkA+EFge978jbcsTa2y+WCRNkz40dy
 nl5gZyPJcWNEfW+UaQ1cuxJrzlxKIXY8vqhgbJKrgV64qhe59PVSeFK6yhRp+e16mpvI
 srKOVXFXh1vi37/MJABQmiDnznX6GkK8SMnkgKMz0iUl8ocilEURTJfJ99C8fj9TVBLv
 slDjISQ9U5etYnFMZ8v2GU/CviaUP9IYtg++Bn0PRcGgakgL4ybAYErz2mZ5wox4zr8b
 4XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744627419; x=1745232219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1MZ0v41VasWztOjswGKD3Mq1UKw/Yh0NDdJUxmOEsWA=;
 b=Aw2JzgKMnkDccTBgDwcycbM4hiFd3b5WoVrM938BVG7uKEh6Umu6cIK77tmdDmkwC6
 Vn9AXTjJt1EWYdMhttd2oNLsONMfi1FDm14uA5qNuNwdqMnWxaZOuK46ee+aKsPVAsO6
 KJiWbSK9CeO2QPPcvhOcnXbR32KZKbWjJH4WEqkN51L8YkAriN085wVWI5e8bcNaTNGT
 +mASBNszrQKPfgr2xZ5KXBKMv6j0vEq0QS/FLCVKbwywiKijJxtNzoydf3qsPOU2aXQx
 O4/Md8cV8LqBRAJ+9V0AwqI0DYQBPxSychK2Tq7xNoYhCA8xmiRyV5dxMTV8IFa+JP2G
 lflA==
X-Gm-Message-State: AOJu0Yw1s4KQGt6duYqb9AzTTnFZ+YcHL20QQCRrYuRPuK62uruIFqlI
 a7gB3sWaP8PBhOUGIIaeOsciWy9TjzaFJ+6XzP1+x1TIq1kTgusMAcQBYZnw26c=
X-Gm-Gg: ASbGncuH6O5QI78xE0rYMorenre90Lh8o5h8cuUZylx8ng3gzGXU3Bb0mm7hT7x46EU
 8qjJ9exJHbN7Bya80cKhgnXEefvnq4UaMl8Kos+KRd1MB8l56FxnmhRlnfwi8/exuLgKTWZhHW3
 eBC/SrpcPZLweyK+KaiRylzjK7FOh1FtgZmTx2F3eV9iT84XwvBp8hhqUM2Wan1/gKtXfraFDUg
 niMaHBBcdbHH4KXe6+pnInCzNFl7yb0MW9eL9P7dZXE6aIH5E2nt0Nl0JfdTsZR8dsUrv4zZ9Xn
 rdvOYQRe0hjCV6WKTJ7Q/mDhIrVOeb47I69XYxlipuYlBRnkp/4qGP6BKGA4sMdZhppExWQr58R
 +akpa+wy6byk7qZuiT+c=
X-Received: by 2002:a05:600c:1da0:b0:43c:f81d:f with SMTP id
 5b1f17b1804b1-43f3a93f338mr93956935e9.8.1744627419312; 
 Mon, 14 Apr 2025 03:43:39 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979615sm10901367f8f.54.2025.04.14.03.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:43:38 -0700 (PDT)
Message-ID: <834ad4b1-9dac-4559-b4da-bec6e6d4a945@linaro.org>
Date: Mon, 14 Apr 2025 12:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Attach PSPI module to NPCM8XX SoC
To: Tim Lee <timlee660101@gmail.com>, peter.maydell@linaro.org,
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250414020629.1867106-1-timlee660101@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250414020629.1867106-1-timlee660101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: ShVK3onc9x5p

On 14/4/25 04:06, Tim Lee wrote:
> Nuvoton's PSPI is a general purpose SPI module which enables
> connections to SPI-based peripheral devices. Attach it to the NPCM8XX.
> 
> Tested:
> NPCM8XX PSPI driver probed successfully from dmesg log.
> 
> Signed-off-by: Tim Lee <timlee660101@gmail.com>
> ---
>   hw/arm/npcm8xx.c         | 11 ++++++++++-
>   include/hw/arm/npcm8xx.h |  2 ++
>   2 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

