Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3663881ejy;
        Wed, 5 Jul 2023 08:40:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEc7IhuBbY8G9fYV2hpeoJh/VEZbO7VQ4VYqir+coUKVzHP7+5GccCXa31DlEpI/9R3uJst
X-Received: by 2002:ad4:444c:0:b0:626:3a98:95a with SMTP id l12-20020ad4444c000000b006263a98095amr17012303qvt.22.1688571640860;
        Wed, 05 Jul 2023 08:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571640; cv=none;
        d=google.com; s=arc-20160816;
        b=MD07k8Kjnf0sPH758uFiP8odEnduXnRYodrMkqh02wQUhMrqTJjjtCfoZLuSlI2+gG
         XbvlvO3Vf7G8WJD9z7n7ar3cNSJxaFFBqNlK1OTvrrdqE7oq/6bWZP6nVhFM+G+lJnEk
         Xk2DeEAt4ZF47AESL3l1KCoETl9ylmXsLuNgzleBlCJGi0D8v/VHg4ZeDU8y3OnFnleW
         T8u9o8Fzfd828T1oEKM3ugglnb5+CV0e4qmZ6ZLOsJSP5Rzx1FKf28a2ISONvNwwz81m
         remuBnVciBfcSt6lKeFohkGNmdfuXcjRK2JfCvMr80QCmr5zZ8fu9/BUZ9As8UMv0Y6q
         bF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=53KVq7Nq9uCiBVBBdxVtz201TxrVN46PUmnFMXsFHBY=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=KJ38yfGdbKqlT1KUdLNFSt7oJIZTUBg/YBV+rQS2lE82TQEqeaeg94XNMjgVhnJQHB
         9bEHdobpGAFx9I0jPJKhflv5cuDqDXcxtsq9Dm5Z0TBUFYZLiS5jFXiirxIggkrZY70R
         d5dxay7+45jgD5ZRSaUMz3FES693XnG5qeI/YbfbHb6dA7OB/DbxEYx1SywoaMovCN7y
         tGAtLOZrV05ohGLa2ib/R6f1ofTEpKASqYDIUULqnBDoMf9VJzKYni+ymdJCRQXKhRmO
         69gPvUYu8H9fDKs7FtH1IZAp6G0giDUkzd5gTbzFarbIbb8RVNGDRmqXt7IHvz+eAjlU
         4FHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEvx7KNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020ad45c8e000000b006362363505bsi9485512qvh.1.2023.07.05.08.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:40:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEvx7KNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4cO-0008E2-Bv; Wed, 05 Jul 2023 11:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4cK-0008Cl-Ac
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:40:32 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4cI-0000oZ-Es
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:40:32 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b5c2433134so11720381fa.0
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571629; x=1691163629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=53KVq7Nq9uCiBVBBdxVtz201TxrVN46PUmnFMXsFHBY=;
 b=bEvx7KNF4xah8GqIq1T8H8kVAnZsQCZTr+M4sckOA3vVDg89CA8yuqm9OQ1saT32jZ
 TZ+jzo6UtG2Yj7A5Whr9grz6TN+67uwH25/ET2I6ZX+Up3IbhGT4tBqsufR7JW0Wj+N0
 wl5wxsBA26TT5UaaAuyLMTyi7hXGDtUe9bqftcEyqI16tlm0CGvbu6EkO7uibxsCtz31
 1xvfsJNr5X+TDfOKpx3U3BJeR1jzZFYgcUcOIbswG/jeYu1x/Z+877MWF2urXmloRzw1
 xa9ReBcKuiFws7A5SBC2DcD/tHUCdDuKUAUCQNvuZ6nTGHkuQox/pEHyyvu2VKIn67Cw
 e8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571629; x=1691163629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=53KVq7Nq9uCiBVBBdxVtz201TxrVN46PUmnFMXsFHBY=;
 b=iwVpcEix/H/WBvR+okV4v84o8w/ZwJcQMu4NXs6zWK7KwOafT+qopGyUCm5pspISmR
 DwlFNrSjxv25pgYHK3jcGIDmVw90wXpqzgO7EFU1Xabu8H/9MB9AE49Jgc1vcKnCRN53
 zU3EO3weeHGhDtc/q+IA4JjShsldZ3TY0DYkfYNMlf32G5YoGrGvFkS03VWFNo4AeIK6
 d9Fs+yoTyZVMV1tauJH2gFojVOUZbP5yDy/kvIlyihC6YtqZKJuxcZvltCqARmEuAnEQ
 kvfTduNRhqBiWhKE0IL8WYpuMBfZnqbvK3P1FzcDRAi7eZw5sfaZKZj3wVi8Kj2xlzt/
 a7rw==
X-Gm-Message-State: ABy/qLbNd9ZtVW2Qclq4Wgn1HJq4K+Fbv0yf6hm6zGqCk3D/Vjib/d7H
 GdfgJ1cOEYMcjMhBm802KKUQkg==
X-Received: by 2002:a05:651c:339:b0:2b6:9e82:446 with SMTP id
 b25-20020a05651c033900b002b69e820446mr1053715ljp.0.1688571628693; 
 Wed, 05 Jul 2023 08:40:28 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2ea0c8000000b002b6fcce5e5fsm518666ljm.113.2023.07.05.08.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:40:28 -0700 (PDT)
Message-ID: <c7c73add-6f38-56ec-2a25-b4fb2a213f5a@linaro.org>
Date: Wed, 5 Jul 2023 17:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 15/19] hw/timer/arm_timer: Fix misuse of SysBus IRQ in
 IntegratorPIT
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: SGBqS4eYYKCB

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> SysBus IRQ are*output*  IRQs. As some sort of simplification
> to avoid to forward it, IntegratorPIT misuses it as ARM timer
> input IRQ. Fix that by using a simple IRQ forwarder handler.
> 
> Note: sysbus_pass_irq() forwards GPIOs and IRQs from a container
> to an inner device but only work with an entire set of IRQs, so
> we can not use it here where we forward a single IRQ from each
> timer.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
