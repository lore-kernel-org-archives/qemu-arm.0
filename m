Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2003267njc;
        Mon, 4 Nov 2024 02:18:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXenjh8RaWLosgNbZRQM8lWDT1EI0lecdzZLXYM5v7KyGRbaJsl3e5SL86T+4j47nRrJ3OAo7Z0yEFkNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGBXYsGkTGmNU7Ia2j5jhmOTaPITBNThvolgyR2GmKKdEKLN7vMvIm3tqsnryYjGhlaApO0
X-Received: by 2002:a05:6214:3388:b0:6cb:e3ec:18c1 with SMTP id 6a1803df08f44-6d345fc9928mr233219116d6.15.1730715537112;
        Mon, 04 Nov 2024 02:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715537; cv=none;
        d=google.com; s=arc-20240605;
        b=dbaWREkQWBBXDFyyC4PsEQGGenhWOzwKtw14zCRF6YJbAJ4V2q7THmXdNPQV/mxMqd
         zblQzstYbBsuLuJ5gEkI96E7HsdDpJguDnqcLptZgl4sz/Nczyb8qWwbqHeS9xhmBrA7
         xto56ksxjXLUhJ5xpo5o5vphCe9vSzfPRrDBKrhz2ygm13g5rkBExkMrTxPbFt+G8i9M
         GaQBYhwHBhfahCWo7wxvSi0c+0tObFqBKmFJd/MlMRxsxTK5uRQ8v3X/9pikQqTyJypL
         2H85m1x1I0I2dCuEHRtiJrri1ctnu4sPfRug1ktuK/u8XvA83Td3tiEuMahciWuzcUX+
         ubOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iGv//PzjHkQ7LKwoyx7XOEi7VsKrmG3iVK86N7xLLpw=;
        fh=UOrI6dkfX1BQ7oakhToPb0wKVbDtgT6U5Ga+fpm2lb0=;
        b=DdJqotwjYUGELw0uUfHSkwdRf1gBHhm4bilQArGbK+FGQ18bn6DLSNBy5hHfZEpCHp
         nOPhy51uSS7gvY4KAxetdPzkEiX+lLZYyaQLLKmbsBzft1iGKFH3+ThhzBtQjjZSy+jz
         jgctwEJInNW9VGmAAPTQuIoUkrgt3y+6jUwMe9gu214V42ThRHdB0mrDiStpZTEWgIiV
         KUymwBDuBLFi124jmnqWv+bZK+t9vh2MGlQAkQTb/zxB8T1m/BLGYAfrrW6iJOLs8ZA6
         fZYQAerBud2CMVOOR/M0ok/uOWHeIZQPPKqQK/rzwZR6tZXN7dX7PbyaiHR4S+BRlhSW
         ULMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUOumPw8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a093ebsi1047976785a.221.2024.11.04.02.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:18:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUOumPw8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7uAX-0008Kl-Tt; Mon, 04 Nov 2024 05:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uAT-0008GM-NK
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:18:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uAR-0007Dx-NZ
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:18:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so49249185e9.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730715518; x=1731320318; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iGv//PzjHkQ7LKwoyx7XOEi7VsKrmG3iVK86N7xLLpw=;
 b=zUOumPw8Vm/8mxoZ7kB4QqMUT3dr5e0rGqWgcBwf64AwsYykM1PJjetWcvG7+OLfoq
 YE7RUpxCOL3toq8qvuKF1zWU7THPxKnn5h/szb8bEIwZH2C0vwIdlK1pH+OmTYHS3lrL
 JwJfqjf5eMeSbMpQ4FnRvxwxSDG9qXaYQyeDrlDfDoEnAozItsaTPqLJv/2XtL7yIeV3
 nd+IJZCPtHB1L4Xv4jmwOVd2Ej9VdX6/de0mF41zkeJWa7OjO1eubZTjY9BJ3Zg1bxU9
 pZsDMPP83bY1kdFaUbnX8VIc66V4WVHB/MoKrtbSdGM69JFCMvizkEwadSxf8TQf+Dky
 yoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730715518; x=1731320318;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iGv//PzjHkQ7LKwoyx7XOEi7VsKrmG3iVK86N7xLLpw=;
 b=sm4vt85HDVGWbfDqLbDFW75OdXqrXljWAb1zatF9dn7ev3J2+/eKcLGzKERxJz+9bt
 LWpgbToh9yQp6kGshjSEuBZmZ1LlOhkKdbAXdyho2/PGpM+xDxuE9NYENjLWv8M50deD
 //5yllua50WShVkl5VPb1pU1im285VgteG6MFYSOEqam/kNwreRlM/OCy/yZ9fX28ke2
 AHZAwbyosHQ4zsjYrEWanVgPRXuCh1FIxicb3Ct9brTwA4ezsg3GGRHpD/4yvIgCrMSG
 vdd/UuzQhRETXdz8tEKZ5HpNPYmhoM7D5gk1Vay8WzP/TIgohsWyIPfRvHNiLkuINKiJ
 lWdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjnBT5l0myTwSsumpx87XDozeR85AsVNIKjb7auN1p+3yXLK2ks5JHRdhKnlZUoKjXehKLobflng==@nongnu.org
X-Gm-Message-State: AOJu0YzjZGOEYTGGY1MAoPIEzruJ5uzilwdItoGxFlwOOK0jM7xs/4K6
 Lvy3WmIRslGuLqB1NB6XhwgyRXSZBHh+WNhMjC0mBpqUEHYkYKUgiUbNNoDBbsU=
X-Received: by 2002:a05:600c:1d1e:b0:431:604d:b22 with SMTP id
 5b1f17b1804b1-43283255922mr120989675e9.16.1730715517752; 
 Mon, 04 Nov 2024 02:18:37 -0800 (PST)
Received: from [192.168.69.126] ([176.176.145.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9479ebsm176876595e9.23.2024.11.04.02.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:18:37 -0800 (PST)
Message-ID: <396b6a26-0127-479f-af5a-00feb4103a26@linaro.org>
Date: Mon, 4 Nov 2024 11:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aspeed: Don't set always boot properties of the emmc
 device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Jan Luebbe <jlu@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>
References: <20241103210829.2307729-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241103210829.2307729-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: yEfT/rFtCuZu

On 3/11/24 18:08, Cédric Le Goater wrote:
> Commit e554e45b4478 ("aspeed: Tune eMMC device properties to reflect
> HW strapping") added support to boot from an eMMC device by setting
> the boot properties of the eMMC device. This change made the
> assumption that the device always has boot areas.
> 
> However, if the machine boots from the flash device (or -kernel) and
> uses an eMMC device without boot areas, support would be broken. This
> impacts the ast2600-evb machine which can choose to boot from flash or
> eMMC using the "boot-emmc" machine option.
> 
> To provide some flexibility for Aspeed machine users to use different
> flavors of eMMC devices (with or without boot areas), do not set the
> eMMC device boot properties when the machine is not configured to boot
> from eMMC. However, this approach makes another assumption about eMMC
> devices, namely that eMMC devices from which the machine does not boot
> do not have boot areas.
> 
> A preferable alternative would be to add support for user creatable
> eMMC devices and define the device boot properties on the QEMU command
> line :
> 
>    -blockdev node-name=emmc0,driver=file,filename=mmc-ast2600-evb.raw \
>    -device emmc,bus=sdhci-bus.2,drive=emmc0,boot-partition-size=1048576,boot-config=8
> 
> This is a global change requiring more thinking. Nevertheless, in the
> case of the ast2600-evb machine booting from an eMMC device and when
> default devices are created, the proposed change still makes sense
> since the device is required to have boot areas.
> 
> Cc: Jan Luebbe <jlu@pengutronix.de>
> Fixes: e554e45b4478 ("aspeed: Tune eMMC device properties to reflect
> HW strapping")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> ---
> 
>   Changes in v2:
> 
>   - Simplified "boot-config setting
> 
>   hw/arm/aspeed.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

