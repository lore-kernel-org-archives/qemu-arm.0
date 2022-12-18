Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3037365ejb;
        Sun, 18 Dec 2022 14:17:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvX+/lqboe99Dk04biWAe6or3mAToEDxlg4YJ/Sc7Kn9ctjnune3k6Y/He/UZfkgojKrwZ0
X-Received: by 2002:ad4:5223:0:b0:4c6:2229:1c9c with SMTP id r3-20020ad45223000000b004c622291c9cmr7845011qvq.25.1671401845413;
        Sun, 18 Dec 2022 14:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671401845; cv=none;
        d=google.com; s=arc-20160816;
        b=P2LHm3LIrhjVxdopUZQQ1Tsr95BOTkPji/fvuK5ozqz/mTnxKyY3y6tIV1Hg04Ae8o
         9rDh5YCB1hKFCHJxYjy2IOpPsrcvg5VnIb77VTy9PTR+HaP/APG16E/GUYc+R6HUUhAS
         NS+Ngp7emS5SwPl8Bt7QL/82Qjf0RsvLHar5vuNWMgV4E+YiCrxmeUlbII0tjiyJZTLE
         JEob18oVKvSWLa+6aq5FH4b5pOROBjdcqe0Ca10X9FS6u81bjejitlVrwbmZHcBbyUTY
         G6SogT/XH6qyf0fKrIIHR+uH9tgJ9/9cd9TNzZNEyCbIjayX8X600Rka5FmeNxtnqe9m
         udSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yXC/bojD9LagN/eSMC9Tc3MJNDDf499kG/6ZuuneINY=;
        b=hmSJxeIuSQuGnU0Gp+WPEj4EcsqsLJu19xghXIjMGEzoiEJ8PcQ1VGJPNHUAJRDpkU
         t2vacE4l4zf1T2UiW7BSTaL9QNfKy5SKSSsnQe6VcIP9xEGJKue508mAgz6g6pNtoCPU
         HzeW0aoRaFP7PZo7CrjNR4PFCEXxbYcO9f05OvpRA0Zw2xTzYK3BMs03WhS+RrqCDSku
         p36ELz32riWPIlK6vLhPGs43FdYI5A7rAJoxXQNl7jPf+2Ogszv7GkzjRAIq3/geeIME
         2Sg/DfFdvG2Hz9vHJMzDfr97pTPTq14eUZiXoT00ZrAhyBrv/RdBOdKLy3JX7ptON/cd
         LArg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSkX4RlB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a37ea0b000000b006fed8cfac9bsi3261635qkj.452.2022.12.18.14.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 14:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSkX4RlB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p71yB-0001Mt-DX; Sun, 18 Dec 2022 17:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71y9-0001Ky-TA
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 17:17:18 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71y8-0005Xi-BI
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 17:17:17 -0500
Received: by mail-ed1-x532.google.com with SMTP id m21so114520edc.3
 for <qemu-arm@nongnu.org>; Sun, 18 Dec 2022 14:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXC/bojD9LagN/eSMC9Tc3MJNDDf499kG/6ZuuneINY=;
 b=BSkX4RlBzXWqSzL8Pxr/oiqte6yHl29wqeGVF85FxyxASsQu8gq9LBdv9xNTw8fsm3
 iWDJTgtN6xUNXfHz5sSUErMpdr6Xh4ZDCkmkxFTMgZrnCQ59qI6aKs6eVlYspAfIYtEW
 nUeUQjSoW5tq4pFv2bT9w0klm+CZOUA2J4a/oVuzplRKE+Ldo7hj8ek3THEeJTkTQpvK
 PnzC7LEimNbFL2RpjAOMjSOU3lY3OhKda3unD8Z2hVG0OHed8hvjjvF4GWhDZ1QZUQkr
 GmhEr76rLMMN60KGgiDc3P/uzfdyTewxYEjzACqd8lbkL3YwCb5y50FrOZ35bx/ofbnN
 GTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXC/bojD9LagN/eSMC9Tc3MJNDDf499kG/6ZuuneINY=;
 b=CoLtOWiSOP4T10mDqijSh//JfGPgJF/ZkxcDEwKXwW+SFBo6IJAZ76Nfz1OgcC8qBF
 n80KhdH1+6+nmUDWofF3RxYEe2qpM13zd2/W1WHjUVDBedkiFVcrW2fAxeBB8FHfiWl3
 0uyeySaE/anrgtNy0XCWvEko/Po0nVk+yO9NAS0RIk5Arr+fA+bXS0ojaSfvXahW4WZM
 XDv9awCkWUYpOEqI4ZDEuCNUL+aEzKco1/4tqUy1uKmszrRNs0QRrO3SvsLR+9SOjble
 IG41HC6b/QzY9R5ikt41rNO0v8RtBNB+x91NqY9LUWjwJjIFBqbOtP8fOAZC040AtG0N
 VIKg==
X-Gm-Message-State: ANoB5pkbK/U61JoV7zMNN9hOcNUKkR0n4BADaZwoKQ7S17OxvDKufVlV
 KmLqGlpSqHM+e8E3cxFTk3DD3g==
X-Received: by 2002:a05:6402:289c:b0:461:bf47:ba43 with SMTP id
 eg28-20020a056402289c00b00461bf47ba43mr47567922edb.28.1671401832961; 
 Sun, 18 Dec 2022 14:17:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020aa7db8a000000b0046bc2f432dasm3571862edt.22.2022.12.18.14.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:17:12 -0800 (PST)
Message-ID: <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
Date: Sun, 18 Dec 2022 23:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: ZmzjTsx2JlLo

On 18/12/22 22:19, Strahinja Jankovic wrote:
> This patch series adds missing Allwinner A10 modules needed for
> successful SPL boot:
> - Clock controller module
> - DRAM controller
> - I2C0 controller (added also for Allwinner H3 since it is the same)
> - AXP-209 connected to I2C0 bus
> 
> It also updates Allwinner A10 emulation so SPL is copied from attached
> SD card if `-kernel` parameter is not passed when starting QEMU
> (approach adapted from Allwinner H3 implementation).
> 
> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
> Yocto image built for Cubieboard.
> Example usage for Armbian image:
> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img

As a follow-up, could you add a test similar to
test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.py?

This test could be refactored as do_test_arm_allwinner_armbian(), called
for orangepi and cubieboard with the corresponding url / hash.
