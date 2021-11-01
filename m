Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2388943lfv;
        Mon, 1 Nov 2021 11:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF6IwAfu9/QEIY6Hn7bFIztbQ1vVD68LjGeO7dxt0HG+75hHTKmZmtLHMTztL2a2fa3EWn
X-Received: by 2002:a05:6808:b16:: with SMTP id s22mr559587oij.9.1635791283149;
        Mon, 01 Nov 2021 11:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635791283; cv=none;
        d=google.com; s=arc-20160816;
        b=FaZPspUPbiP8Q7wncR2rrQi6jqMI9A2k1dXh3VqFGWorOxp+e86hxyvmEE7CTqpjof
         1vF7YdKyqB4rQVec6eNOkkGvRePFGVP89+2JuLRf7abRoLMI8tGDrBY+3cAAXQjMeiiU
         2YquGwQ/naUYy39UqBOHAjhT00dshCkOqINzip5nu+olBRd3L906ErOtNUpqaNemxkeW
         cTB4vJ0XCO82IL2LaW4sShBMFnWr1C6b3gmrXSkewjALJN8bAcRDJDwhWIc3D5hngscc
         +DxoRjDTN6rF0S1gh9Z+kMkKAgpqfN2Eb/zK3hqB4n/bQBI+rp2IN98VIcAA+GCZQCCC
         RAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mNOnMb6zRoGFHmrcwv7GaRkCv9qiP7ZEe4AjNcesU1g=;
        b=GGI9Rdaxp615EM4sUXx+FvRft1xFFK99KLNH6UdBhndiETF/IMqwe7q7RhRt/DUkn1
         8C/AN/H09Lbz+5BBA99Xw1GEndY4n0ElHxPRUroWFQggYJhHBNWfhuM73DXmOUlypVL9
         jI6JA1o87miUR38YX1dHcgBqoaiN2fFfmL7nNqaD9VRicpPnoTSue/EiM2VA6aPVAHa8
         K5LtSbPPi/GsMrBByEF9cEWKLn1SyrDEgZ6BOkXKOlfIIY5wXAMaF2y3BSvgLSewcFqB
         1ibaAMjykAZS3ilUj3oIPQGI3rBTyLHtjFgR/w9F6LCbrv9xE7PPdiCn0e+qzg7psPbj
         jwCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fnbdV+PI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h64si13711757oia.94.2021.11.01.11.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fnbdV+PI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhc2M-00048u-BB
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbBt-0006AR-Im
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:49 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbBr-0002fe-7H
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:49 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id s186so22277831yba.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mNOnMb6zRoGFHmrcwv7GaRkCv9qiP7ZEe4AjNcesU1g=;
 b=fnbdV+PI0nh+rnDJkb+lJ0BK5OPJA25BzqW8kVHC9+nIJFwejoQhy/DfRhfNetfMSh
 C+CAN3qZMhJQW3pLacYABW7Kof0xB9A3XKXIS/0qzMlJHrbHVw2slzcAxz8vBo5206Wt
 5mo2ToqOXo+gZEGBecXyAkVJgo13094B0C5H40af5FXyNROLUCU9LSiMWUBNwq0QYvMI
 RLOS6R93dr2O8ZkYE/IzWPOjVHIk5SOHNiWtmR9QZa9TWIMGJ3J8sTB2ktu18eeHm6hQ
 2djpzpzEq292ymSzQAzhHpO1tXIc16uY4pMP3VDbaBlSM46GhXq1jFLtuxKesO2kRI6A
 WZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNOnMb6zRoGFHmrcwv7GaRkCv9qiP7ZEe4AjNcesU1g=;
 b=0la28Ey2cSLXInAlvc2dECPzgE0oRmFImXhT0949XOap09eMt3HsyELZEAtgEY9GUZ
 +jYq80YKhCkorzr+BN84Ypb09uIL30Eako2vdYGXCFiUgzFrwGQd3s9PENvlXv9XMA9p
 BBiN4psQlwV5p8BX6tSy0zbDdffIQW0sHS1R2igdZL3JuNkgMFxRgOLt9Vb0XAv5b0La
 Yjxohf4BjxidKHoC9/kZm/YVANsno//Ek3M0bXkX1tPm17WrX/f9Yhxdemr7IJGwp9KT
 OXMmuhBmp0tz9OTgOF7R1OaZODvgD9odsNGoeR7ukiPdjv3WvN/KHD0nyMHPIfWUUD5O
 7wEw==
X-Gm-Message-State: AOAM533Q/IGSmfV2WvN8ix8gl3vNqY/zyv9mlDUeE3rC4fp3DE+eZYKQ
 eO6MEuUp142IHtpmk3aM+fvSPPJK3mRQ8LGT1FlaZg==
X-Received: by 2002:a25:2391:: with SMTP id
 j139mr29318342ybj.382.1635788026157; 
 Mon, 01 Nov 2021 10:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Mon, 1 Nov 2021 13:33:34 -0400
Message-ID: <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Cjqxyxrv6J/

On Thu, 11 Mar 2021 at 13:11, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
> device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
> the RPM of PWM fans.
>
> To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
> We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
> into the MFT module.
>
> The connection of PWM modules and fan modules are derived from their specific
> Linux device trees and coded in hw/arm/npcm7xx_boards.c.
>
> We amend the QTest for the PWM module to include verifying the reading from
> the Tachometer is correct.
>
> Changes since v1:
> - Split implementation of device and addition to board file to separate patches
> - Adapt to new Clock API and address conflicts
> - Use the new clock_ns_to_ticks API to calculate tachometer counts
>
> Hao Wu (5):
>   hw/misc: Add GPIOs for duty in NPCM7xx PWM
>   hw/misc: Add NPCM7XX MFT Module
>   hw/arm: Add MFT device to NPCM7xx Soc
>   hw/arm: Connect PWM fans in NPCM7XX boards
>   tests/qtest: Test PWM fan RPM using MFT in PWM test
>
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/arm/npcm7xx.c               |  45 ++-
>  hw/arm/npcm7xx_boards.c        |  99 ++++++
>  hw/misc/meson.build            |   1 +
>  hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
>  hw/misc/npcm7xx_pwm.c          |   4 +
>  hw/misc/trace-events           |   8 +
>  include/hw/arm/npcm7xx.h       |  13 +-
>  include/hw/misc/npcm7xx_mft.h  |  70 +++++
>  include/hw/misc/npcm7xx_pwm.h  |   4 +-
>  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
>  11 files changed, 974 insertions(+), 17 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_mft.c
>  create mode 100644 include/hw/misc/npcm7xx_mft.h

Thanks, queued to target-arm.next.

r~
