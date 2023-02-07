Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5138408ejb;
        Tue, 7 Feb 2023 01:18:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+Hka+SDSHKGuP8l6Zp7kBjnE3UkGK5Ja2I3oB5TfRRoe7FpaNtkDBRDXfwklS4oBB4hcNt
X-Received: by 2002:ac8:5bc3:0:b0:3b6:36a0:adbe with SMTP id b3-20020ac85bc3000000b003b636a0adbemr4039641qtb.6.1675761505401;
        Tue, 07 Feb 2023 01:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675761505; cv=none;
        d=google.com; s=arc-20160816;
        b=z5uSeGr7ErBaL4ttdNXThBs8XeUEs0LkXiYG8bvF2MpVmisTx1r/5FWGwNIEfebjwU
         gGtw6vonoD6pDYLb1nYhKIDUsDBbFjBmYrB2ocPWv5PfsuuuIrz4BOLAIOklIj8Amhca
         MgHi3HMvhAFlLRfvpqex/ZPIlcheBpv6+cwLFHMx8GC6WI3pD+drPKk2jDjkW8KBZrmi
         xm8xATFWY0eqC13jL32F3k0Oaq/aQ16SKXkWl0kJ/LZqynkg4EI6QyvEe02dBQDuUy5S
         MTmJlOBA6uXk+HMstnPDst6hokkhmhdnG5/zd4PBlSt8P/sNTXjUXb562AP0m5Wt4d3I
         rMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3PnTxwqNIfVtraojykkcjTM5MN5ZOZ1HhhlrmFp/Kso=;
        b=KnbFq49NOeYf3LH7Q1KfoQeVXGTzQiOz4cHt2AB6fFiJxqE4Hj1ZOf7FOBde7uEccw
         8u65QBJa2/7Xf+vk16E4JKdgZTIlWheIFoHtvDbWkv1udzSarksgt2NaPgRhcXAiAoNW
         yEaXAYTawYJ2Hk5FXn7BKT7xz+112u4TyxP7kO2wQbnz3uWvG6Qngze/S4Rk8NnuRULL
         tkprMLk5E0onAPyzyR1p3KknVQkoGNwKUZxRGKzUewhIaGLcwzXgvMP+31AJn323DPfl
         gwuVU+tfm+FpM53KU8DAmErZMgAzK20VZaNxQDtrTqeo1NqpKiEDAyhgG/46H3IEpKWp
         /2RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UD/qUS0s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l63-20020a378942000000b0071d7f09151esi10077564qkd.94.2023.02.07.01.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 01:18:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UD/qUS0s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPK6z-0000Ej-Da; Tue, 07 Feb 2023 04:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPK6x-0000Dm-PJ
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 04:17:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPK6v-0001q8-3s
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 04:17:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m14so12814361wrg.13
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 01:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3PnTxwqNIfVtraojykkcjTM5MN5ZOZ1HhhlrmFp/Kso=;
 b=UD/qUS0sJQWb60dtE9S72NfBxLklH3oyBqYIiSXwO7Fy5RmuK0U06up6mooz8gcVLq
 SVdpsjT/jMBhiEWhAT02k+HbCVYV0Rg/Jo7TfS/ShCqZAVbwCrGaPmSoNMXh8VNZTGcK
 lWX4ZzH2jakDFG1MywozkJPFTunk21GeQLl4NY0aC+MKkLKrbZexkjBx20KfInsY2CxF
 TIYp/QtXXYLFP/u68oxg/ClQv9ZKVzJPymNBZiD2tAnlceJwIsNR0i1APCSMjTo/VToL
 0FIFXFn82gX4PJiC130BNIWe7D00XbceHQL9X1s8SjxfMivJXfarMCvnB/4wtfgwG+o2
 cGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3PnTxwqNIfVtraojykkcjTM5MN5ZOZ1HhhlrmFp/Kso=;
 b=QQwCARMfwo6rbGyxNiF6gRxUgDKO22r3li4vfExtcqsYSQ4q+yZuMw0pxpkp/JPLcW
 9OFs4X+GvFPGGdufUYCZ63a0TNktYWq8MkDEc4PhmlHL6p+9SY1hc1jqPuWFMevmwdZ/
 hsO2mfkQEBe6wjTXnmyi8oLDj2x4WrEq4Yn4Z4mFKmvzgrE6a51VYrpMWK6VAcWHYIqR
 lwVJmpQyiyXsxAgTCRuBISVM9cY3GenqRoYWeoQRUSw7D2ThQGmt14wWELcsQ9lhwIa6
 ruXhX9MN4ma01SvQ45R98TzYhQ8LR2MG77UVSou+UYlS9Beqr5mJ37TclE5yplMsH7r+
 bwtA==
X-Gm-Message-State: AO0yUKVlmZuXBmRp8vZizo+ixUJPJHrLjR/Sd8e1Ojjhn0TGLf0OIjDX
 MK3bits/L/Q5m0nuWhZEhADdIg==
X-Received: by 2002:adf:ec0d:0:b0:2bf:9474:b6b3 with SMTP id
 x13-20020adfec0d000000b002bf9474b6b3mr2114228wrn.14.1675761455564; 
 Tue, 07 Feb 2023 01:17:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f17-20020a5d4dd1000000b002bfad438811sm10733436wru.74.2023.02.07.01.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:17:34 -0800 (PST)
Message-ID: <f8a83363-ce88-e424-4db5-2fead70e4ec4@linaro.org>
Date: Tue, 7 Feb 2023 10:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>
References: <20230113200138.52869-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: WlQBNFRNZGkj

Hi Peter,

On 13/1/23 21:01, Philippe Mathieu-Daudé wrote:
> - remove unused code
> - use recent QOM macros
> - use CamelCase typedef
> 
> Philippe Mathieu-Daudé (4):
>    iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
>    hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>    hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>    hw: Replace qemu_or_irq typedef by OrIRQState
> 
>   hw/arm/exynos4210.c                  |  4 ++--
>   hw/arm/mps2-tz.c                     |  2 +-
>   hw/core/irq.c                        |  9 ++++-----
>   hw/core/or-irq.c                     | 18 +++++++++---------
>   hw/pci-host/raven.c                  |  2 +-
>   include/hw/arm/armsse.h              |  6 +++---
>   include/hw/arm/bcm2835_peripherals.h |  2 +-
>   include/hw/arm/exynos4210.h          |  4 ++--
>   include/hw/arm/stm32f205_soc.h       |  2 +-
>   include/hw/arm/stm32f405_soc.h       |  2 +-
>   include/hw/arm/xlnx-versal.h         |  6 +++---
>   include/hw/arm/xlnx-zynqmp.h         |  2 +-
>   include/hw/or-irq.h                  |  5 +----
>   iothread.c                           |  4 ----
>   14 files changed, 30 insertions(+), 38 deletions(-)

Since most changes concern ARM machines, can this (reviewed)
series go via your tree?

Thanks,

Phil.

