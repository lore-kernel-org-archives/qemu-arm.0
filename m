Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp271645ejn;
        Fri, 23 Jun 2023 10:45:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5YA7iROlGgUhHmBZaWs/l9eNXhCSBHChArmEKzyrBfTrFtyWujuDFlAIXMESFo2B/9rA/G
X-Received: by 2002:a05:6214:1bce:b0:630:7a8:f602 with SMTP id m14-20020a0562141bce00b0063007a8f602mr25923218qvc.7.1687542309724;
        Fri, 23 Jun 2023 10:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687542309; cv=none;
        d=google.com; s=arc-20160816;
        b=WrY8ZsSao4ICv++QbqvA5jmWKMW60Tff4mD/NLrzeP4X7sjljzOYLeEYyM63G+3ANj
         vgo8aCHKviH4S+xdUl71wJs96CzIBmVEh6X9lWzf1e7jEaMKDBpk7iRkr8OdmYTFxPZO
         Ed/mYgW6P55/yRP05q+f6nAHeA3CO2nowTQAxQBFxvOudjIQSC8O11vmuudyHqHb847r
         xYVmgXR+gnBj5eVlPS0fu4cmteTihQYTJbvCTlNhC+fuXvBQGp1B1SAw16VqcMVC52zU
         WjL9F1/5OKqfKH9w6YWnK3J7GlJ0+A9SWPQfPW0Npb3cRdNMtJFJHsYQPLuglK5BjJck
         WWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sNg3QTruwYDJKg3OChiofa5YfqK0hbteIfBLi6n2lJQ=;
        fh=BMZlj2K1ikaGwDgAbi+m69EyYlmmpMBQhTr+YPdc058=;
        b=EeoLsqcgN/tK+IU3TBw5994v5y/wdBD0aYzBGLxivrhmWilJGHHtoQq0yHVlXcLq/f
         RDYUaLgx0yRDb2ioAPFhPcuJ/2jN1/OrOee5UW0Wf5+hpA71gJYo8IDNBR6CzJ12L5Lr
         b/u1p46FPmc6+iLR6nwch9wZ5pzuX7RvB26knVgVgW5qpJqX+xV9yqrG8/uB0Uzsceym
         8Nzw8HmbzQmiqQMw2Wor5izxm7JxHEi1sCqOnVHKnoPLnQ+iZauf2nTM0Ia3e0rhYBdq
         /+9QCtCHoyu2riooyRM9CFdmBG9UYVuLBW+WE2xHD4CJmN0zfm1cH8WmyxXBR/VAUNdV
         0FDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNZjuuZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl8-20020a056214518800b0062deb8c3a1asi12885qvb.179.2023.06.23.10.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 10:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNZjuuZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCkq4-0005YY-9b; Fri, 23 Jun 2023 13:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCkq2-0005YA-Se
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 13:44:51 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCkq0-0004sj-86
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 13:44:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51be5db4e35so936087a12.1
 for <qemu-arm@nongnu.org>; Fri, 23 Jun 2023 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687542286; x=1690134286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sNg3QTruwYDJKg3OChiofa5YfqK0hbteIfBLi6n2lJQ=;
 b=jNZjuuZj68dIy38frWrGzJ8Obicf0+BmlTSWOxRvIFoSSiDlRtfUYu95U4uG1/dUMU
 jsNODzsyAHZv5LmKwJcxsjijBYwafwYgFnBI7upDpa47vXklL6708+FB1hrvPiQ4nMuy
 zCF076t7NV/qS8ktR2Xei5AZhu8x5v4dVEDK/WL6p5O8NkdB2fQdTbJWPwTf0g426aac
 wBtc4SH8mQHPAYivvr9dvYyX3XUG6ihoY41zn8oFuxpH4dhW60qZUmydf/ZFCRCjGXH4
 tMRls7uaHPUuKZJMV+7ycmUmElc9oO9Za6d7iTUdaKt18fOv50MmJkvuMY0lvNaJ7wFL
 zqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687542286; x=1690134286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sNg3QTruwYDJKg3OChiofa5YfqK0hbteIfBLi6n2lJQ=;
 b=SpSTUDPDgHPj+3AxDbMocCRYP1tM6qOsr+QsBVukwMSCYsTq9a7k0eM2R3/u1sjpBu
 4kww0fRoIzRFMVqMSDIN76PFhzDrVRU1bAq6MtnVbaWlfcuRBzjmdo/Eto59OjTYja5c
 wyChB+qxCMoxqiy7EUjyeCYOlUYnGXfRjr/LjijQXJGp+7Gf/krNuhPx+3JN0T+PciPB
 jWcpIonDWZhZcVSqyGKpOIXCaG5laXJNebF4JR7dBOSGv9drJg3guNjGvXBirrHpyY5w
 C8Zl/38kPJ99Pkrp60wO3YLcVGrHZq/j96HT4K5ETGbksmeba1hNdeGnnujR/u8tOoMU
 4VFA==
X-Gm-Message-State: AC+VfDx+Oq7G91ovl1K3XipnD/5tKVt7mAfbi/hSPTj8WmDWNX2+HyzR
 VJjaIRgOsXKaO0u7+iSbmhe1wYBryCUJRfkZl3HnNg==
X-Received: by 2002:a05:6402:5141:b0:51b:e943:d192 with SMTP id
 n1-20020a056402514100b0051be943d192mr4262828edd.19.1687542286336; Fri, 23 Jun
 2023 10:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <20230523100508.32564-2-qianfanguijin@163.com>
 <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
In-Reply-To: <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2023 18:44:35 +0100
Message-ID: <CAFEAcA8aEQWAap36CtHMrEkFQUPnDCH7=-X5+TE2GJ-qzm3Y9w@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] hw: arm: Add bananapi M2-Ultra and allwinner-r40
 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vcUD72tDYJ3t

On Sat, 17 Jun 2023 at 17:29, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Tue, May 23, 2023 at 06:04:58PM +0800, qianfanguijin@163.com wrote:
> > From: qianfan Zhao <qianfanguijin@163.com>
> >
> > Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,
> > and a Mali400 MP2 GPU from ARM. It's also known as the Allwinner T3
> > for In-Car Entertainment usage, A40i and A40pro are variants that
> > differ in applicable temperatures range (industrial and military).
> >
> > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
> I tried this in mainline linux with the following command.
>
> qemu-system-arm -M bpim2u \
>         -kernel arch/arm/boot/zImage -no-reboot \
>         -snapshot -drive file=rootfs-armv7a.ext2,format=raw,if=sd \
>         -nic user \
>         --append "root=/dev/mmcblk0 rootwait console=ttyS0,115200" \
>         -dtb arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb \
>         -nographic -monitor null -serial stdio
>
> Main problem is that the SD card gets instantiated randomly to
> mmc0, mmc1, or mmc2, making it all but impossible to specify a
> root file system device. The non-instantiated cards are always
> reported as non-removable, including mmc0. Example:
>
> mmc0: Failed to initialize a non-removable card

Do you mean that QEMU randomly connects the SD card to
a different MMC controller each time, or that Linux is
randomly assigning mmc0 to a different MMC controller each
time ?

thanks
-- PMM
