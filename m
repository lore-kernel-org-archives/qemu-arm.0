Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1595894njf;
        Tue, 3 Sep 2024 14:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn/4rgwbD/SNEoIL3O80oqfPUOgGw8M2BhQMIXwTg3X8l2lQqBBgytzFIAJuknbzMPV1g8uHm7HeN2OA==@linaro.org
X-Google-Smtp-Source: AGHT+IHr1uRrWmR0L5gt3zn5xk7Axfa88xToT20WlHCBITkcEVuPjp1S3PUgIjzs4PWnpZcFcx+v
X-Received: by 2002:a05:6870:63a4:b0:268:880c:9de3 with SMTP id 586e51a60fabf-278002dfebemr7151882fac.14.1725399250718;
        Tue, 03 Sep 2024 14:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725399250; cv=none;
        d=google.com; s=arc-20160816;
        b=CKF6tJC0Xi/4kR+9xIV+6KbuWvO7iQShQFOMGhA0ESljroIOuCfe0vYSd52UWVgCjA
         ErDrOQdiwzcWlunp4kNPytwghw9EVWQI1qxXLQNjZPJN5D9bwHlgoMTQ25Ael6C9b/dU
         0JLYr2Ctgs87dFub7XSpjsP36xTek68nejWSsnMPkyRNH0eBS9n76eA8jcXoYXNG2F3r
         xK8gudAParpO6j/vZJYOIubscbWwak7djQNYtG3jMSY0KKJLO5/3um8RgIpdTfCaIArC
         mt7eXiNO9FTxkhqITAS+nAsHcHmAv2BM7Nn42nf83qbdq5r9qrDMqLhemHUcxZxluVPG
         UfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=f0Ib4U8lZ3ZsJLZzUUh/vOe+ENblshKaDKWawyFfb4c=;
        fh=NYexIxxpAhY3nLXHGeYGwf3mfp+QVeSnLQ+K5HCfIzM=;
        b=OZ0iIDCtdJvpWvjkU/foVbiJ65imUHuljq9QcGVjOFkJ8qB/j6L+vjb0LE3lv10CeX
         p0EMdXRIVN7EgfHFKwF+cNOLxMy2ntkez9ciVUkxgU/Nk0dIo/0Sv9Vtj1MQX517xO16
         k7//yNBdGpNK54oqojQqghq2ieMIQhaG7Ln1KmGIP8QQAyYvnzEXpZGjAqGk56uuSCDZ
         p+6qGRMStgJIahPrEX+rZ+LM79FAtootWc6nSTDAU3trbgRlkJJBGAFhDeAlDlbwkWSp
         8Pb2fLFtfhvVlBgbJN4/gY3sMrZDlywy25pbizlgIeoYMGZ0HsD4FDDdOBf5ZETAzRmO
         snQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1hHQ8sB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c46a9asi1379837385a.210.2024.09.03.14.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 14:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1hHQ8sB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slbA0-0002T9-3N; Tue, 03 Sep 2024 17:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb9y-0002SA-Nj
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:33:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb9x-0007yS-8a
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:33:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so48221345e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 14:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725399235; x=1726004035; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f0Ib4U8lZ3ZsJLZzUUh/vOe+ENblshKaDKWawyFfb4c=;
 b=M1hHQ8sBl+hRwYu7olJvbHVxDXPLTflQZZh/i8B8+xnsZDDz0dEPaNECx+yjUm5KP8
 U71On7hBocUyBktD1Mw7dT2k6mmRUpXzz6LcP674DEuAi+B/2JWg34nTKyAm2FKHGo+O
 6pb4noQq5B34t6pREfCD4gK3pXDv++IAKLJRgcnxI269fzNsUfmmsHDZJAaheEDc1tmT
 b3vwfGRnJ73m0zmWm/kH32CnG4RzB9u7vfktlJvY57yo5RCKhq+mNJn0EfTjcbAkohtW
 0ueXqpG+njGF6vUREHFU7sWqbd97x91c5aFCxwVVBEbOhQJmRTqQeqGeaZyA/gl5HdAw
 ENFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725399235; x=1726004035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0Ib4U8lZ3ZsJLZzUUh/vOe+ENblshKaDKWawyFfb4c=;
 b=r7J6qCU73N/KmReJhWTdO695LnTMN2v3C6loabO2N8pZpBMKPe1xC3QFLRHtHSROXF
 fijCZlGg/FJt0jZTN7opDMCsh9y3obx8iRWolnUkjl1m3pURcffnnmrw18bxco3ijKR6
 7XcNEvVCFCuHoCGW7l6vy5QjR3wsrTJkf96ie2nbTjr/FeNdeGow0gqvla7n63GZxewu
 qF0jJyG6b8z6diKsOIHPeeaOaa2m4q1q+JCRtTQ6uzSXJN6SqXi0uEAz5ZPFMFhGM09u
 pT4TV1TGoxjF6+jqrRgoUvdifyWuYwnmfCFee1b/xlwnEvHOtELXCINWsobjkTAUhhUv
 0PXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5gTEe309k/dyi0CbWB4kZwgPiSYAXBYY+CUZ0Tc+nt331YWWUqPTYDmsc9qmWBo0Y9RiIBLTTjg==@nongnu.org
X-Gm-Message-State: AOJu0Yy8jrLeixqWWOGx+qg+a18prq0uuojkqV9jzm8E9eTAGFDiuWp4
 pO2fe8J7wAd5Xcotx+iP2IoNaQ2fqlcOVhRaq1Igk/RMz7jTBM1wa/EMBdOlDx0=
X-Received: by 2002:a05:600c:3547:b0:426:5dd0:a1ea with SMTP id
 5b1f17b1804b1-42c7b5d8f34mr75757385e9.28.1725399235259; 
 Tue, 03 Sep 2024 14:33:55 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df7c5bsm182687405e9.23.2024.09.03.14.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:33:54 -0700 (PDT)
Message-ID: <d3c901c2-0ba0-4c13-82a4-24dd3750753c@linaro.org>
Date: Tue, 3 Sep 2024 23:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 19/53] hw/dma: Remove pxa2xx_dma
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-20-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: sOEUoDzw3FRi

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the pxa2xx-specific pxa2xx_dma device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/pxa.h |   4 -
>   hw/dma/pxa2xx_dma.c  | 591 -------------------------------------------
>   hw/dma/meson.build   |   1 -
>   3 files changed, 596 deletions(-)
>   delete mode 100644 hw/dma/pxa2xx_dma.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

