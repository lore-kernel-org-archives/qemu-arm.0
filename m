Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp437365lfb;
        Thu, 9 Jun 2022 06:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOoI8tCHAIQcPQbu728X8o2xJ3RbrhCOiCGTF5W1pnd8YdWmcz/qgF35C9Rx94oeiUZtan
X-Received: by 2002:a05:620a:4e1:b0:6a6:98c8:4f76 with SMTP id b1-20020a05620a04e100b006a698c84f76mr23286221qkh.109.1654781192679;
        Thu, 09 Jun 2022 06:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781192; cv=none;
        d=google.com; s=arc-20160816;
        b=RhEodT7LKNXg5fkhsYUe1ZzC+nP3quDF6YBfa6ZryR5SP6yNCnbPf665Kqwye26MH2
         zvY90aTGYLMJLlOMY6YCj2TfcLbJs/5Ugow1lHbAdLMnWm2XhJZh0hoFXR6phVWGcKr7
         OdSZj5+Kp359hC8PbXDq4R/eLhHxY42DbJWTTddTHccEwZOxZssVIPZFEExQSGdlGQdF
         5+f90fnvQN9aetIlTsJgSmytSdmdTCRDiMdIK0uOHFvL9FIQtWZ9P3tc9M24LqOvt7zb
         KdIB71DBYbpW84yIF+NFigd4VGYiSVGhGoBmBo/yu82ydptkbUuCUvTiWm5Yc3c/kYbf
         Ze2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=y4RIo8lMEbYK3e591RWrfwNxeZleLc7RAKGzQTE9Jlc=;
        b=A2oInQUCZLLgPHfRiCdqmXYFgbgTiqkjpDJQ84HMywHpx7GLzSlGrdiYtyxeRXqo9C
         AXb+Lq0+qu0KOYU4yc+ApU0YrFSSp+3JtHT6bbL6KCjulI/P2ug7HqB9F2mIuVtmPZrd
         NhYlIENLBjb2L8EcdtUAJsTacjJaiYSngg64/LHggnBYd11cFzvTTp5tDjKg+79RJJH0
         mK7zULGTYLffp8wZsgijcAmSlCnuUQ1Ub5twMchyV8RL/vogtD1J3rGOtrZY1+HEzkae
         xb3cT9Lb7TSq6IcfwrspMW9a25WLIimTnuF4z4CR6c7sjUSnKDFR+3MyxXh0v+VjqTTD
         BYkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T218kZEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05620a408300b006a6af50de9esi8967796qko.47.2022.06.09.06.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T218kZEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIBE-0007cb-4X
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG2h-0002a0-6V
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:09:38 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:32861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG2d-00019n-1v
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:09:34 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30fa61b1a83so231717227b3.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4RIo8lMEbYK3e591RWrfwNxeZleLc7RAKGzQTE9Jlc=;
 b=T218kZECvPMuSoGpT9GTxuH82rY2oeoCXGn/cHIR52Vt/Qkznnv9wEqh49h1UO5VPk
 S3cv9VBGC2Cb/hv+uhbPTEDiwxLurl+B4Gm9bUona+aAuWHHAFX5gweIixBjdwDjtyT8
 m8PzWTU+jeCCThJ1qdIxVrCK1SMGprRJ1NEHMvrV7+/zl7QdXSZUsd3Z5wpVQP3b7AHZ
 Ev9hsowwNc7I5FMik5PeLgbebNsaSDLLvaeOmoBLnnYGj6V0iqS+vfeBRPrMZexaDLvk
 SGbbb7udhFxPYb0lDL9jHwwhsZaOLu3BZOCSF2Tjsf6ShknU/1+eEPNcykND2WS5Gyq8
 TGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4RIo8lMEbYK3e591RWrfwNxeZleLc7RAKGzQTE9Jlc=;
 b=S73vQz00FHTesiFGrzVirUXcMKp4QY6xhShIY/nVEb7cTjoE4BNpXAg/jNYoabVtdC
 MBt6n6l2LI+R9dq118KchEEbECvVxP01m8w9Fh4O3uO3ydZW1W+B64Ba7ntp/GtU9Mvs
 rrhon+7tr9WSv+QdlM85sKWdP/eVE9jEOoNYtjMp5aHuMSezV/tTAzO7raeYEsl78UMh
 Qkhr4cp1OeguqGV6hATnYPW/fo0qy+WWH865uVhKvYhQcMe7holxbXV+oAh2nNFWUKNA
 lHv3csSvh/QYfcW+99snMpTvdgBqdH/J8Vc0bNlCG8y6fLQgcBQfQ5rL/vFu0rE4/bee
 WNzw==
X-Gm-Message-State: AOAM53315oWbtpOD2HiUFVdIRgQ81bqiFIOgskJQxr7PJ2kY97rs0tzX
 bFSJwpOYQNqVnnsz0iidwcMqgFcjBghngzLHL4DFSw==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr40968081ywa.455.1654772970121; Thu, 09
 Jun 2022 04:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-38-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-38-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:09:19 +0100
Message-ID: <CAFEAcA9rx0iz0FA2C8nefWtHtYKf5-OviyqzuG+_PLGJc-mfzA@mail.gmail.com>
Subject: Re: [PATCH 37/50] lasips2: QOMify LASIPS2State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kD8URLdD3zNc

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Currently lasip2_init() creates a new LASIPS2State directly which is used by the HPPA
> machine. Introduce a new LASIPS2 QOM type that will soon be used to allow the HPPA
> machine to be wired up using standard qdev GPIOs.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
