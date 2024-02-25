Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1627773ejf;
        Sun, 25 Feb 2024 08:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwskEuqV7eBYuoIfpvd+le+xj7B9hYRNBp70yiDXq0PDKQhWi/g67mWSqLnjzuOtlZlZ5kSmOCvMa07ql8UHdgup1z7N7a
X-Google-Smtp-Source: AGHT+IFInVAdR2NbrnPSiGGytUwPtkkbbxl7Y8JZtFJ2U+jenC/iobshcFlcAvbQ13YnZRJewVls
X-Received: by 2002:a05:620a:1676:b0:787:6c14:e934 with SMTP id d22-20020a05620a167600b007876c14e934mr7630150qko.29.1708879078791;
        Sun, 25 Feb 2024 08:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708879078; cv=none;
        d=google.com; s=arc-20160816;
        b=0yAPihSwVV9eS2cub/tqVtzuprP90Yn08ZtbiUho4Fjp3V9yvpTqW4aJbp3qTSIKOz
         xD+PZpXAeKOUl25m3j8mxgYzyQhd/T4ViOfSDgwHBwZkILX/uHY2nm5Qm0kX2jPHZtJn
         EIA0Fwco9mO2q2+psJTmwmp1XtjhdwGBOF/mMIzslBxG+OWD2JqlF3Uf5kfiMIBi3GrP
         UI80Xx45Edaom6WEKH9zqABaZvAkz5mb9pqF+2I95CVyNaEJWyA8dpg/8BAO+4qOGdXZ
         ULm6m6yWZnwgZ6MoPHz4DPm/McZ6KAKU3YbL78JGRwUbAOnZmKTl0O6zBYS2YTwntu9p
         nqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HH9ZVJjU3ny/yCgfzCsl80z+BCOkPFPDedDjPZ3RTXI=;
        fh=m7Mt66m4TLscePQVpXx2IB7NHSIvSUF/Jv2hm7CkBtc=;
        b=DNHbFlXUwSt5d8W98W5UNvqJOqvncGi8kCr5hWrXVN6v9TMtzd0j0Mk2XZrREPMCii
         DXHDIFgZPD3zmjGGLoKnRWKAb7MO9/rP9JK0prP3RC1bC7tYfTP/+nCqEiqI9llBj5Do
         CQywq0Dz0FxJP2bUw2/uirdXZR0U1ZvFBz29U3VVwbu71zfUyr+B/fsVvDQKcgA2GCfz
         ncpZ3mmEvHhR/W4CZd+bwZ9mWVnrzgIA9zBj8gPn7XbKZOocbN2545RA9FG53LwNbAF6
         AzaLiEXpYzD2VjUEVul4vOkjkTOqTe7Fj7fEl8aahheTchJWYfOLuHwdyMmZ8DL4Wzzd
         QplA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BFT+vMvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020ae9e301000000b00787ca5a1c48si2078553qkf.339.2024.02.25.08.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 08:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BFT+vMvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reHVV-00035g-Sb; Sun, 25 Feb 2024 11:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reHVU-00035W-VF
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 11:37:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reHVT-0003D1-C2
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 11:37:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d61e39912so1296939f8f.3
 for <qemu-arm@nongnu.org>; Sun, 25 Feb 2024 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708879057; x=1709483857; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HH9ZVJjU3ny/yCgfzCsl80z+BCOkPFPDedDjPZ3RTXI=;
 b=BFT+vMvWOvwEBr7yZp8jLfdnYUt05o8dQyv7gXAk/6/rxB4DOXAvJbTBCrGN/CUC8g
 1g7YvKfGLgwGr9oZoKG0vk+MeVnxkz9DBk2xfWRaSyAL7fX2fDeN/VKBeXCIL7iMll81
 /DW7gkbuEgo7/2PNMM00FkqKnk3X3qXoIueT6i9D5OklJp75Ghct5DIdAfCKEjOUzGlP
 1uREB82WAEf+t6VkJgmhUIZE0xbFNzSHfldkOa+vor4P34ki8XDQ2XGgXgYkCc/bfXyN
 tPzSW2CynzFRHANbxWNgSzMSxLIVaCGraJuN97S0jZhJwofULqehjWgc/ws9ZHQZg79t
 r1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708879057; x=1709483857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HH9ZVJjU3ny/yCgfzCsl80z+BCOkPFPDedDjPZ3RTXI=;
 b=E1JolWcWemlKvbY/ZK9BkU2tNCbLTR1b3NjfA9t7x89vatUyMMvoj238S/ak4Fr3l5
 Dk9ELhdzvY8s0LoSBBBjeXYoy6b37S7YvKGh243f75Hzwypdy8im/6qnQdB5nBI4Rr7A
 qqqvGA+1QeplHx/NteCvX40tLKP6gZVGaN2ocWUydFvjezx6IHewB3aZ3ItXZvWkO+DV
 lz02YPPhzL1Nl5G8x0rMOFEJTK+ZBrW/4l2PfDxVWqoHFQmRh6YSmdqtVkBejQGNhYcl
 U5FyttlQiO4WsP4+IALBVGmoh3FLLh8Cx6DHAQ6OjitqSXjlNkX2rNBa82c151ACo7Pj
 lVFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtMmaQsq+fqL9VIW07xM9iIdUT3lEwaTwLIdYLbREnqhXAMT73+/EiaZeRfc+6g9FjUHh/y/euICGOkndnwNKOCnAo
X-Gm-Message-State: AOJu0YwMewkC74VXnUTvs/OIc+byPFglOOgRF8FU5FaEjg5AhG0ayDC/
 rOkTIrpRck8mdy0Mi86sfRjjizAj0IPqczDx3MBWx7l1VJv7Uds7WZCTxZFv8vA=
X-Received: by 2002:adf:e6cf:0:b0:33d:67f5:a3a4 with SMTP id
 y15-20020adfe6cf000000b0033d67f5a3a4mr3739569wrm.67.1708879057367; 
 Sun, 25 Feb 2024 08:37:37 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 v15-20020adfedcf000000b0033ce727e728sm5438196wro.94.2024.02.25.08.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 08:37:36 -0800 (PST)
Message-ID: <1154e495-b1cc-4de0-a107-51fb3627e6d5@linaro.org>
Date: Sun, 25 Feb 2024 17:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1
 and I2C2
Content-Language: en-US
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20240224191038.2409945-1-rayhan.faizel@gmail.com>
 <20240224191038.2409945-3-rayhan.faizel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240224191038.2409945-3-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: x39Gt6citxWT

On 24/2/24 20:10, Rayhan Faizel wrote:
> BCM2835 has three I2C controllers. All of them share the same interrupt line.
> 
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   hw/arm/Kconfig                       |  1 +
>   hw/arm/bcm2835_peripherals.c         | 45 ++++++++++++++++++++++++++--
>   include/hw/arm/bcm2835_peripherals.h |  4 ++-
>   3 files changed, 46 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

