Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2788703ejc;
        Thu, 28 Sep 2023 12:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdVko81d5pWrthvCPC4bmmFCEH1XM9bqWkffENcOJFdMCfkhyxULvboLXK/+4hCGZ+fYX3
X-Received: by 2002:a05:622a:6a44:b0:419:714d:d0c7 with SMTP id ig4-20020a05622a6a4400b00419714dd0c7mr1584679qtb.1.1695930493559;
        Thu, 28 Sep 2023 12:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695930493; cv=none;
        d=google.com; s=arc-20160816;
        b=COnsoXi73faf/1cHFkyJDT4d01Mqx2ENYVr2zE+qgTATati/VMISKuJargiV+T9ITV
         ndwgZQp66S+GOsU3d8x7Zcubc8G3KXyn9MzrU5+Y9XhMalhLUHr+eXgOX6WF9ddqbjJb
         EpNLH5cpBaFqzXUGI2qiIRLlwbvFCVVVzf3mi1R7QvPGOoYA3BIHD8EvOLwmGbixRXqc
         G0oobEdlhBDxerra8iP9s65k/kQsbBFPSfxFk6rHju/7jMk4Aifr7fxaLikdO8UX6jDF
         YXEEvUdqFYYyZfc1pq6CQvWkqdHNitl5VZFhS1FQytWUwq4urf42lrr7WH1YF304luUV
         zEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=I3w6cuFLTNl6joPKz+cVZkzDDXpL5yF4RLSKyX3k2fY=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Vu+hRi00mawXN8A0N2q6fyRyG/sQyxk0ooe5srIl0foOWYkhTCMjK3wQclvw+ndrDd
         F3FURsO25VaDENzW3lclObMY30zN0YBrjRJZUjkZUOv1LUZpYd/Df8vbYkHJ0RUjRh5E
         GWmJhnblymYL6WyNiauVdrxYd2c6+4fsRGH5ROGCyQhvjbZjHcNuj4HVRP2kAuGpL2VF
         8j7nnBLIrkTQ70zTeTfgC3ouYKIQE29ZUTAaTcjax2Ax1CyNO1Zp8E2qpzfiOv2IScIe
         XwOcn4KMMsNs06FXgi1a2Sr7osdvHBF6f5pFE0T4d29yhS2BGyV8tnt8G70EqQbpQlDQ
         DbaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=syX7btWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05622a189300b00407dd1bbbf5si9176928qtc.368.2023.09.28.12.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 12:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=syX7btWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlwzX-0004R4-7c; Thu, 28 Sep 2023 15:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlwzU-0004PJ-NB
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 15:48:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlwzS-00013X-8g
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 15:48:04 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-692779f583fso9854747b3a.0
 for <qemu-arm@nongnu.org>; Thu, 28 Sep 2023 12:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695930480; x=1696535280; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3w6cuFLTNl6joPKz+cVZkzDDXpL5yF4RLSKyX3k2fY=;
 b=syX7btWsYei/y4egUygEwTPEe+EDYQVc/AyXcaLlG9fGAkHbN9gaqArzsDiXdVXW2w
 NaBMrl/6LqRb/276iPTrg/NDPu3adT9N3U51/XQH2/X+i2cPxvs8wjAJLGe45NEyDeWr
 kn7ureVCkk08A68ogJAke2o4y8vShKmE2683AS4o6wsI1PizIQnMsTnEmvyWs7bEq8rn
 DScSTr2cklnS8hWfoYnx2ZHCFlgIR7oz1I22MZYM7v3B9R9BZPPc1auMRY5StJQWPL/W
 FlkLEdOM62KdIjdOCT42Jw98SPKKxw2X/kCnGgMNiHMIshZA698g5U2o28h0QUHwVkbA
 rnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695930480; x=1696535280;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3w6cuFLTNl6joPKz+cVZkzDDXpL5yF4RLSKyX3k2fY=;
 b=Lk86uIn6L0fzcUZk3mIW7TZkr0PYuavjfo0y2gW2GBC6QEb6zuqs93O8R0Plzi4dT8
 vafifzIZmcsQN60i/uI/TrPeEDHAefMd3Cme06ngxDaKf2zL18ZcfV/kUCA/mpMFiQNL
 sHPOegmSmVrfDks5GiX8qzQPFGGBJyy3h7XZRBWpfnbioMtlrvMYqQvCRNr9BAstBR9N
 HW30VilMrFs7bp0uGFavjvjHdK45hIqSIDtIKPgOL+kfk3Psn3i3nW5GsvJx6tk5el9V
 fXDPptGkybTD0yUhDXq7FC7EtgQ2VLc7TtEdLlz9HxMou5X1bLXQR7UpZ1Teg5s3jMkn
 vlQg==
X-Gm-Message-State: AOJu0YwIFZosD0KaeB1EWMVEs0Tydt/5Atpx6FmQ626hHHnxKc7maN0V
 cqyiyVxs9Y4K/0Eo9BQZklYh8ZEfh5LcSDDm1Uo=
X-Received: by 2002:a05:6a00:1748:b0:68e:3eb6:d45 with SMTP id
 j8-20020a056a00174800b0068e3eb60d45mr2180815pfc.30.1695930480490; 
 Thu, 28 Sep 2023 12:48:00 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 o28-20020a637e5c000000b0057cb5a780ebsm11518178pgn.76.2023.09.28.12.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 12:48:00 -0700 (PDT)
Message-ID: <8557943c-05e6-aa34-f479-e4a1ab12f69d@linaro.org>
Date: Thu, 28 Sep 2023 12:47:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] target/arm/common-semi-target.h: Remove unnecessary
 boot.h include
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230925112219.3919261-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230925112219.3919261-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: Dl0EUXkOT+2u

On 9/25/23 07:22, Peter Maydell wrote:
> The hw/arm/boot.h include in common-semi-target.h is not actually
> needed, and it's a bit odd because it pulls a hw/arm header into a
> target/arm file.
> 
> This include was originally needed because the semihosting code used
> the arm_boot_info struct to get the base address of the RAM in system
> emulation, to use in a (bad) heuristic for the return values for the
> SYS_HEAPINFO semihosting call.  We've since overhauled how we
> calculate the HEAPINFO values in system emulation, and the code no
> longer uses the arm_boot_info struct.
> 
> Remove the now-redundant include line, and instead directly include
> the cpu-qom.h header that we were previously getting via boot.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/common-semi-target.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
