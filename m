Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp49083ejx;
        Sat, 24 Jun 2023 03:41:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Bs8I4jjJLF7PURS54KB0PRSZOeuMImStTXm2C+D7ToIIGWM/ZZN8J7fZER3JKZEVkufPb
X-Received: by 2002:a05:620a:2614:b0:75b:23a1:406 with SMTP id z20-20020a05620a261400b0075b23a10406mr22172512qko.28.1687603293545;
        Sat, 24 Jun 2023 03:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687603293; cv=none;
        d=google.com; s=arc-20160816;
        b=aYPAV+oEGmwVNBhvf10jBCo2uIrOZjhFxH5olqEFDMvAJtKWL6L/GqMVwvnu0xvmXo
         CuoDOpCq4OO6hQPV3UtYpdq9qT+xktiakSfvODFBtQle2PXvIjlQF4fDW4IpO/gNNl0+
         ymHQmb+RazgtTJLmzKttEwiGSAt+HjBzgdGVlZnF+/DS7OWf/3hSCvpZlhCPzsKb9umA
         cjq4Nl+BHgiuZ+GHfHtba/f1VZvl/5qw9hS16qX5Hr2LRjcWuCIC5Q0oAbcI4nJEI7Ug
         v+zRuPj0ZLEJQbDVNZxMEo7ak4GBd55NuVqEIik4fUwf43ACHeDml8J8yK3boXoLtJTB
         45ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jZEIAMNBiMn3g9tw5GHYioaVxbMWGakucfs09cO0ZZI=;
        fh=BMZlj2K1ikaGwDgAbi+m69EyYlmmpMBQhTr+YPdc058=;
        b=GHpJg3wfNwwyYHy5LPvjwYLiCBpFQ+Ku0BhHteisYjwVGO3VCwWaAofb1p1RKjuqo1
         X4hEKEV6sZ2WziVUvuADfItFq/3fLZCzaZAzxDq+ZC1ie9DWbvaoLfZVLOmPQxI0EkZ/
         M7LCoDnpqwaw8HC5XOzf0Nixhk1aZW85mfwLnG21V4MIWjUYEPXHnkxznAAwQoYG8Hql
         AaeP8iKfyLh4WyXQrJ4VAG2BF4M7b4QAjKeadpQDWWUyeQf3nwOaWa+dV6rPtWQnJqdX
         /GYhLyos7MK7jGs5GjjWYkBlD1htyg0bjqnIURPXT5jGEcid4WwlCV4DZyFUZGSThzbC
         kgXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tY43Wg/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qd2-20020a05620a658200b00763bc090a94si420240qkn.736.2023.06.24.03.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Jun 2023 03:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tY43Wg/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qD0hd-0002Sd-IV; Sat, 24 Jun 2023 06:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qD0hb-0002S8-5k
 for qemu-arm@nongnu.org; Sat, 24 Jun 2023 06:41:11 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qD0hW-0001Ea-VY
 for qemu-arm@nongnu.org; Sat, 24 Jun 2023 06:41:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so1622435a12.0
 for <qemu-arm@nongnu.org>; Sat, 24 Jun 2023 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687603264; x=1690195264;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jZEIAMNBiMn3g9tw5GHYioaVxbMWGakucfs09cO0ZZI=;
 b=tY43Wg/fLDAqVFp3jcZf9k55hHU/ZEy+r3vzEzj8fsLARdpSwwgaAmfFFI4CFaQWnj
 x+HFy6yq0n8cjHDY1ttxRlUvr2xpjII/x975+NqcFRWoFByxPSbHIl7UsjCrREckg9v8
 am09mp9DWn+ebi6uPl05hsqQLzleTQ7+nwQrGX+IyEsok5iGSvWK0XKTvlIMLFCvswET
 XR2xCGcj/PMCeow31be9b5wHouypHrhoyZPFNy3Rqj+hQ9gb0KrJRo+jo4faXDjT+RUu
 /XiRppkjeoyPhoIPU4Ol2VwMS2sZIo+nR4/rAxqpOaYuxcTUBmL0BDeRR/klZByOtQKT
 7Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687603264; x=1690195264;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZEIAMNBiMn3g9tw5GHYioaVxbMWGakucfs09cO0ZZI=;
 b=i3LXOf94JYX7haUBZ5nIieLQ5Jv/2XG232piQMKWmlG7z10hwO1xrJ1q2Ekof275uh
 +FPk/+ZY8qgBknuG5XurkB1vK5iaYWPMrZMH6dP+xIVCZxQ0sXYe005fcoBztehIHQhr
 j6xtO2maSNoYdofCbVFQF8h3oyeruFJNEiqg4mb5pvbssfDDBJ6oikRtW1vgyWeKUMy4
 jAary0CmcRzn7pgAJJCmPzo5QoWHor7iRRTUblQGAWET4yd2wsr0Vns7PETIUs6QorCZ
 hoMKvlXB2twQHrYNrHTAzEmjSFPIMfzeEXG/uS0BuhdATR0sf3tGKOdyyxWNlB9CDl+v
 GRjA==
X-Gm-Message-State: AC+VfDzlbxG5Ep9xaCUfW3GWX9lyDNr+g6Q1vT6fU5igl8MYEA+DjK7F
 8srXHfRFpCuWoBMPOIna1BMHB6vKwQTKUyUMlGdSmw==
X-Received: by 2002:aa7:c40b:0:b0:51b:fa48:a3f3 with SMTP id
 j11-20020aa7c40b000000b0051bfa48a3f3mr2422687edq.18.1687603264300; Sat, 24
 Jun 2023 03:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <20230523100508.32564-2-qianfanguijin@163.com>
 <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
 <CAFEAcA8aEQWAap36CtHMrEkFQUPnDCH7=-X5+TE2GJ-qzm3Y9w@mail.gmail.com>
 <2044dc69-93de-d855-fe44-ee6f3ab3576b@roeck-us.net>
In-Reply-To: <2044dc69-93de-d855-fe44-ee6f3ab3576b@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Jun 2023 11:40:53 +0100
Message-ID: <CAFEAcA8vtJNwbxBreDMFB6q-Z=G5FiOcWzAAz+F69A4-Er_4EA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] hw: arm: Add bananapi M2-Ultra and allwinner-r40
 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: gAtswCjme/mN

On Fri, 23 Jun 2023 at 20:33, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/23/23 10:44, Peter Maydell wrote:
> > On Sat, 17 Jun 2023 at 17:29, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> Hi,
> >>
> >> On Tue, May 23, 2023 at 06:04:58PM +0800, qianfanguijin@163.com wrote:
> >>> From: qianfan Zhao <qianfanguijin@163.com>
> >>>
> >>> Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,
> >>> and a Mali400 MP2 GPU from ARM. It's also known as the Allwinner T3
> >>> for In-Car Entertainment usage, A40i and A40pro are variants that
> >>> differ in applicable temperatures range (industrial and military).
> >>>
> >>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> >>> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >>
> >> I tried this in mainline linux with the following command.
> >>
> >> qemu-system-arm -M bpim2u \
> >>          -kernel arch/arm/boot/zImage -no-reboot \
> >>          -snapshot -drive file=rootfs-armv7a.ext2,format=raw,if=sd \
> >>          -nic user \
> >>          --append "root=/dev/mmcblk0 rootwait console=ttyS0,115200" \
> >>          -dtb arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb \
> >>          -nographic -monitor null -serial stdio
> >>
> >> Main problem is that the SD card gets instantiated randomly to
> >> mmc0, mmc1, or mmc2, making it all but impossible to specify a
> >> root file system device. The non-instantiated cards are always
> >> reported as non-removable, including mmc0. Example:
> >>
> >> mmc0: Failed to initialize a non-removable card
> >
> > Do you mean that QEMU randomly connects the SD card to
> > a different MMC controller each time, or that Linux is
> > randomly assigning mmc0 to a different MMC controller each
> > time ?
> >
>
> Good question. Given the workaround (fix ?) I suggested is
> in the devicetree file, I would assume it is the latter. I suspect
> that Linux assigns drive names based on hardware detection order,
> and that this is not deterministic for some reason. It is odd
> because I have never experienced that with any other emulation.

Yeah, I don't really understand why it would be non-deterministic.
But it does make it sound like the right thing is for the
device tree file to explicitly say which MMC controller is
which -- presumably you might get unlucky with the timing
on real hardware too.

> A secondary problem may be that Linux thinks that the first
> drive is not removable, even though it is a SD drive. I  think
> that is a problem with qemu, but I don't understand the qemu
> code well enough to understand why. It seems that the mmc
> capability register always has bit 8 set, even for the first
> drive, but I don't know where/how that is set and how to
> change it. SDHCI has the capareg property, but that isn't
> used here (or I don't know how to use/set it).

Yeah, this seems likely to be something we're getting wrong.
I assume on other QEMU boards the SD card appears as
removeable ?

thanks
-- PMM
