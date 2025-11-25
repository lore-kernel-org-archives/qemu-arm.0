Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AFED0E6FE
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Nov 2025 15:38:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNv7Q-0001d5-9e; Tue, 25 Nov 2025 10:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNv7H-0001Wu-IW
 for qemu-arm@nongnu.org; Tue, 25 Nov 2025 10:38:08 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNv7F-0007Rz-UT
 for qemu-arm@nongnu.org; Tue, 25 Nov 2025 10:38:07 -0500
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-43376624a8fso26167545ab.0
 for <qemu-arm@nongnu.org>; Tue, 25 Nov 2025 07:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764085084; x=1764689884; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/yzyG8jDa9ctxdkRcU3ry+un7DmCNbAaafVnZlDLrXI=;
 b=DiZR6B3UlS77e7RzaFCIH7SrJ0BzqAjJorAHufGRHa5BKg4SDzStamrP6DCc3o4rTR
 gfZEQV8NMZyBR9/+LISFiozrF9952aJJimIPavkTYeNW44WUBFNcC723jricUprCkAMS
 0l5S8nwh9rJvrEcfrAN2GS0ZEEyKmE/iZ9r1MQrrhpIy9njhKruCZMEI61UuHXYTjsC3
 ogDA/aivsRAGkHsqdXExqhyQJdfzmYtA+sw+w3MhBKykpu5Z41crb/P5XnTYyNPjRmTM
 HmFfVEcUUMmtMkI1RwF85S7Zu6Xxj9dzRIP22/AaaeKiDnau7NzDEW7W6Af3hriX8/Wu
 9WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764085084; x=1764689884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/yzyG8jDa9ctxdkRcU3ry+un7DmCNbAaafVnZlDLrXI=;
 b=Fi1jQ1vVlq9PEMkTNo5lxhcpBGmx7hWKq7JFrUIB7J3H19EEPbFO2jAE2HOWCy+Yu9
 Jb87laTs3n0UOuRNg2TnGAm+KYi8kuHkBgVZVA+IYSvbshZ0cvjRQ38+kq7tTigbDwc3
 hJjSNkBzncdEH0cTST2Zs1VvZ5DJTNEPjzSbxo3boP8+gyW2aFpeFTbz4bUBznGJAJnN
 0tTzkFqrfJhbXq9IQ52PwIFpnfQSWOee+3hGPcaK8ju5HsgTP77GgOZ2yX73pYzBPCVR
 kM1ekQlIVSr3v5XPxFSnngWJfM7k+v0OMTEjHnBe7wfXtbaEw649nEt025E0YBxjc2SE
 XlfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW31/KCs0gigRF14kdKUmqNOmRCh4wu6IwTxQxI+wIP5LOXZuTmfWTnuD68Z9s825BDt5fPAm7r1A==@nongnu.org
X-Gm-Message-State: AOJu0YxgY/Us5THfZUdwS8gSakFXHlNfYa4ZW10odmV/fx2+hgTnRxDg
 nJzsBSBLYjjB+2iAszJhl/oFC6dktofKZTwV6YxDv0pbN0iWsBX+aOU/1KNdLF1KYEs=
X-Gm-Gg: ASbGncsAjg4c9t2Bv085cqn2Et6+x57g1Fs9DValcX2MtbnOn8ZyRIkxHnU/I93tovb
 Hry72jwjaSwx9TWW8pYTa7cz8mS7/reKsrp8SmlO5QtaniH0dt69WM2rwWNi80bSvn4MtkbP6jQ
 DyadAHzje0V1WBTqXCzf64XEZN9hL6G7aScuRBNnA4WaKZRrP9ND1k7E9PC7B6/6KCcSGnFYhW9
 gfcNj9bzcx6hDNp3fYiIomsCxzcIoAB+vZ680wJOZ2tbOM6dC80YOjFtE5FRVKvFAgTfRvGO6J2
 5UTsr80T1NKTWSzgSI3pZFMQCOp/5poWsdezaxDzktcDyZkxD/j1l/goYpdUNxIsDuRntdn5RRP
 GHRWbo17t+slNFktSfsn+ZG2VL6iThs1EeX7E5tiAZDYoCuuyD6igefs1CYJr5/if8vAa6crTQA
 G364V1OPX0CPsEqdqdzwWDrlrERixaPJH2HHUqwd0=
X-Google-Smtp-Source: AGHT+IE5O69+miotbfLE4oOW4TqtNHjppV61qUApX1ozQJr1p3Y9J0H3YNNdxBivgdnrj+PhvVK3rA==
X-Received: by 2002:a05:6e02:b47:b0:433:80d9:708a with SMTP id
 e9e14a558f8ab-435dd06591cmr23946125ab.17.1764085084520; 
 Tue, 25 Nov 2025 07:38:04 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b954b48cb9sm6884263173.42.2025.11.25.07.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:38:04 -0800 (PST)
Message-ID: <8caeba48-95be-4944-8c0b-5fbfe5b13774@linaro.org>
Date: Tue, 25 Nov 2025 16:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed/{xdma,rtc,sdhci}: Fix endianness to
 DEVICE_LITTLE_ENDIAN
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20251125142631.676689-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251125142631.676689-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-il1-x130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 25/11/25 15:26, Cédric Le Goater wrote:
> When the XDMA, RTC and SDHCI device models of the Aspeed SoCs were
> first introduced, their MMIO regions inherited of a DEVICE_NATIVE_ENDIAN
> endianness. It should be DEVICE_LITTLE_ENDIAN. Fix that.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/misc/aspeed_xdma.c | 2 +-
>   hw/rtc/aspeed_rtc.c   | 2 +-
>   hw/sd/aspeed_sdhci.c  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

\o/

Thanks for the help :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


