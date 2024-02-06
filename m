Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1926150ejb;
        Tue, 6 Feb 2024 08:48:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFgS6oMBvYCB/fjMf28kIR7b/c/pYMvGkyQ4Rgf55jpQRbmiPZ2cJ/lLydSP1mKS05V8mG
X-Received: by 2002:a05:6214:2621:b0:68c:5cd7:a7b4 with SMTP id gv1-20020a056214262100b0068c5cd7a7b4mr3364856qvb.14.1707238095607;
        Tue, 06 Feb 2024 08:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707238095; cv=none;
        d=google.com; s=arc-20160816;
        b=iM2mnfletesHHwqTErhsR+LP4hdR/DdUjHYTVOfLWGOYhKS9mrRlYd18faFdUH0vqy
         zqrpTJN+sh1DDpRkRZ35Tg4rx+Udy0MLwxc2BXnAS+M4aqe189n0F41FbDOQeL+OWn8a
         vvC0+sG2bDuDmgs00pEBFXfQbkp7mSRVrjRSyfoDQpvWgVKRjqbvVYreZ5KGiEybN+LG
         Vg4qhWXIXEYTvv21/9Ng5yejjSW7a/rtbO0IeatN6+OxZqEWgnSqnRvWsJ/xQ0viJ8uq
         honHjbJzstYlL0Hh604oaF6DRwwfNH8ALxu0P1QXhWGvVF3xO1YW2c2lf9h+hJZkm3Fm
         uMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uAJ961dJtrxbbJA4zkQDOv8vFdNh6a8Iooz5/cijkzQ=;
        fh=46scpY6gYC/ecYAxrYBmfEOzha2p8DsKx0yd/kL3CHA=;
        b=ibbwW8GEXmb8Yy7Xwb0heNAGkFOmdFhGvQ7uenTRKvfzSmXjS7P4URTPtU+7/tu1/P
         wHdS/ZDOMsjXBuNKVVqYCw98U1Hh/EI0WoFfJ9TejAWeHFNKotUh11mWbCDj5Eu1AlcH
         8WntvXyfozIyKtt1TcaQRWSCbki5iSjoYiYrmEdUriuULQnZJdRYEvqFLeV9HPkkvCmH
         cgGxM/s2xZTnqho8PZNXnGg34462btzEsFUOhfHT5ALBE/UEHzQ5H1KV1FZtXvNfE4gb
         XHFN4lQctVMzb66KNH4qfrg9ckGc3Idrpdu4diHJVSVPgGKZYmYs1lVemZFaaush9edC
         XvGg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHNiB+eQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWJA7M8I1sTs6Yb06LXg0gjD922AsHqHAJaXityTkBGfdSQpLZ0QvxtDTa1gdQLj3V0D2MirZvFakk3qT4/ukk3OywGVrv7
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee17-20020a0562140a5100b0068c93a35fb7si2508422qvb.578.2024.02.06.08.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHNiB+eQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXObs-0004uJ-F3; Tue, 06 Feb 2024 11:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXObX-0004T9-TX
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:47:29 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXObV-0006VT-7k
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:47:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ff28388a6so3825955e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707238043; x=1707842843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uAJ961dJtrxbbJA4zkQDOv8vFdNh6a8Iooz5/cijkzQ=;
 b=uHNiB+eQYCTtFTPoZFR2TaX5G+N/h3f0UwRr/Oth+IDyOeFjMuf696LBfKMDIeH03K
 5LN5bdi7CHqgjRUCgo1ctgHApi7d1fW0l7IE3hJLLnF7MOVxDIiDG5PAt4glepnEdYQ0
 PzbCnvfPyBsUnuQSGbfv4Tj9HVo+pUUhaijVoHIAuwDjC1sDXCpN4cpLWVgvYNFtiRzv
 HEa0oBjpb618Nr7s2tFdDvRtXx0s23qr7USdF17l/P5S0VZe8VZ7TovO7BFoO/oSrIkf
 E97biRYVkoJCDwOdrq7qBHWZtkMzayBgg3T2jUOKOuclEAh9tklq8azS8tNVfxmw113q
 VQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707238043; x=1707842843;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uAJ961dJtrxbbJA4zkQDOv8vFdNh6a8Iooz5/cijkzQ=;
 b=Q43cApqQQVXNMQ5LfZWMBuoGD76+VytCXRD8q9lciB17H+jKTCAFuaxv7v1SL22/up
 +Cd49HTzoHhHQdNpe8hSoLaoTVOc2wW3heKd6rBiXwSuyYDjqezu1FtGH26gZzO1TLI1
 b04z3IAVzLldGvRRz31zECqf1ImnNXOG86AgpPI7SHe0Ls1IZbJUfbPhWm5lUWF25/0F
 h2LfiMoO5mW7a9BI+TPEqKpI5t4bLJ/yRVkCT/60BfONTCT5aii40BAcRUZGAhaJl+8C
 tz7OS0sgD0vTJS8lRIqGrXaMgack4A9CpW04t83ekLkDZRKdmbV8/t23tBhbcWWj7+HC
 MTxQ==
X-Gm-Message-State: AOJu0YzDj6/orv6l6d6mpNv2fxsu7MmY4HWhTpd9DZTJZE+t/VCIUsSs
 eKwxP0vv4LA7IsWVis3GtNSG3aUV6Vjz3lvkYiHhUJHTAWevakraOWUMtIhDx0xyGPOWsoAzhaT
 x
X-Received: by 2002:a7b:c055:0:b0:40f:ddc8:f283 with SMTP id
 u21-20020a7bc055000000b0040fddc8f283mr2969231wmc.38.1707238043687; 
 Tue, 06 Feb 2024 08:47:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfYfox8QWuy3UbaNr3FtLatFOIIgKUQQwwFHr6b2Dg9lTv+0tePV61urHq5hxCY6hGl6qGWsbWeQa6S6BTi/lWkpKWEgRi1rYVqM9YkjnkFWMDoSp86qpZosk=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c501000b0040ffdfac914sm72436wmr.10.2024.02.06.08.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:47:23 -0800 (PST)
Message-ID: <c8da546d-a5d1-46db-a66d-9a18bb993a18@linaro.org>
Date: Tue, 6 Feb 2024 17:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] hw/arm/mps3r: Add GPIO, watchdog, dual-timer, I2C
 devices
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: kJYocVX8DGuo

On 6/2/24 14:29, Peter Maydell wrote:
> Add the GPIO, watchdog, dual-timer and I2C devices to the mps3-an536
> board.  These are all simple devices that just need to be created and
> wired up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/mps3r.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)


> +    for (int i = 0; i < ARRAY_SIZE(mms->i2c); i++) {

> +        if (i != 2 && i != 3) {

Maybe easier to read as:

           if (i < 2 || i > 3) {

> +            /*
> +             * internal-only bus: mark it full to avoid user-created
> +             * i2c devices being plugged into it.
> +             */
> +            qbus_mark_full(qdev_get_child_bus(DEVICE(&mms->i2c[i]), "i2c"));

TIL qbus_mark_full! Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        }
> +    }
