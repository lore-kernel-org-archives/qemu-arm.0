Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp506479ejc;
        Tue, 11 Apr 2023 06:33:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350aCNjxr07jVCgmPYNcyZxS5fSQ/FUKZRXtOwxTt0+3XSDF9P+qaoZQBJrHXn9gm4nVkU6D7
X-Received: by 2002:ac8:578b:0:b0:3e6:970e:a3d5 with SMTP id v11-20020ac8578b000000b003e6970ea3d5mr4371434qta.2.1681219993419;
        Tue, 11 Apr 2023 06:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681219993; cv=none;
        d=google.com; s=arc-20160816;
        b=c5WIUW/uud8/RSokPeDflTmGbI7vTdOJ1nTXJM+L+zclN94kIuHhi5YcnTsLAB0o+/
         NNwX/YnqjV9ekQflm5NvVORPVSgreXl7vvky628oYPcZjDeYIKc6V7QqTRKvw4suTaHO
         SCNioA9AtyjktBK8rOjghngQB3sqyZk+p/R0VqnF4n8SMzEDRSxhuyae+u750wUk13/6
         twLRkx6zpBLgoQgsFhE2HNRn/7OhVrVjJfz8G+3c8+4FP3FW5fIkh5L5K/27thceGtgz
         RuSN2QdrgKoB6KUUjOsNvuV/hAOoIEoWm4KPMKkw/+YqmjUJe0View36JtwHaXlykiDE
         fpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uhSx4ypEnRFX8817NJIShLVenbVkWq02gTOQ7+utnf4=;
        b=TMZgpLiIOE8cu8HQkpeWAx3S6mSQ1DPIJFOQLY55vVeW6Q7LQfRPnJyNjINp/miIp4
         0MQ2Rphx2W3kFg5I5lMUcgIgS/9lBvlK/OG6DGybaNjT4JFpYgNSXWy8UM9bPhbcKCrs
         VppRnSFNVKAh3Vfh9Bl7KBwAlmrzoqeIrudzALfQPWxvEoVxCZVremfK9R2DsfYH0ZIO
         800IAO7X5T4e2781DEynDO4rnkol+rzSPS53Cl3XDOeMZJYO3WPKh1eB2rYym2uEC/ky
         wulCXxXjLiUBEsvAbk/ZuagUJxnFjyUgn1pjBR8f5NnW3b/yDgSh4M6GxDLoPyI2YzYg
         9Fbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k5qHXgZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020ac8590b000000b003e210050c5asi8826667qty.3.2023.04.11.06.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 06:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k5qHXgZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmE77-00040g-7i; Tue, 11 Apr 2023 09:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE76-0003zu-1m
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 09:32:48 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE74-0007LB-Bx
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 09:32:47 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a39f6e8caso196016566b.0
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681219965; x=1683811965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uhSx4ypEnRFX8817NJIShLVenbVkWq02gTOQ7+utnf4=;
 b=k5qHXgZf3H6iKyxhHTNF6Z1f1AOXnsWB2EyUQljJXnNLzxfQoanrGoYKDmthspQADm
 KtUhRuB6crtCLD+jp8wfbV9qzP8O5gmAtIoV+hhVGABaHt5wXQ1i9wlzykY+MzNgNULL
 uHqVC4To9j/vi7BvVB/dK6UNE9DPiuy9DQ8hDTPYCSQZuJW09kTguCVO4xWSj6lhIFLF
 gDxWc5sCP5JiTXAr+LWsrVO39QvCT7deOYb8fw5A3B1b+05mrrMk6TMt8SgMu5LTZZHE
 tzgRiWDpy7S+anSZrWwU7fagkUb2yWMyg1+PvEn+/NEp2u8F24NUzA9WA/KWxdLdCHIy
 tZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681219965; x=1683811965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uhSx4ypEnRFX8817NJIShLVenbVkWq02gTOQ7+utnf4=;
 b=CkdIv7dE7b9498aVbVz9p25a6x2eJhUOIXVEIb40N5FFz8vo8MKJ2vwkJCnk+kUdTl
 TWYWr3R3ae+Sgwpsza5mQpkXxwRLB/+g1VOaqclQgX7lgF4HsZX69ci//Ru7bwq20slT
 JZujilhQPMGK4PQJKr1QbN6v8uSfKSZexQX3cZ+h8Mo31R0+3h8n3n1ZWzsPVizyjpMH
 JSVmLWVx19aJju547W1WnIdvONrmvUoAciXSe9jTxi+lxwZ9d2bjsXjS3E8bS3gEne3u
 FJXbePrwPZw9okVy13VxuPq9TfAnF2QbAgcN8pcT+pCPOUwrOuo4U/JI0vrAj3+OTjMl
 LotQ==
X-Gm-Message-State: AAQBX9fYJrVt5630/OclIUPdjPtgLxoXYh7bjrBqVOsF4y4Jje5F5JPD
 FnxtpXBkRLL0RKihhLbRtkHXphc8brCF3Ko6rD9a+g==
X-Received: by 2002:a50:d71e:0:b0:504:9c1f:1c65 with SMTP id
 t30-20020a50d71e000000b005049c1f1c65mr3714285edi.6.1681219964721; Tue, 11 Apr
 2023 06:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <168070611775.20412.2883242077302841473-0@git.sr.ht>
In-Reply-To: <168070611775.20412.2883242077302841473-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:32:33 +0100
Message-ID: <CAFEAcA96YkH=nQk_NYPUG3mgpt_B+yajn2ynihUBjkd7EyO3HQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/2] hw/timer/imx_epit: fix reported issues
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 37sl+TsPAWP9

On Wed, 5 Apr 2023 at 15:48, ~axelheider <axelheider@git.sr.ht> wrote:
>
> This patchset fixes the following issues:
> - variable shadowing reported by Coverity
> - fix check, see https://gitlab.com/qemu-project/qemu/-/issues/1491
>
> Axel Heider (2):
>   hw/timer/imx_epit: don't shadow variable
>   hw/timer/imx_epit: fix limit check
>
>  hw/timer/imx_epit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next for 8.1, thanks.

-- PMM
