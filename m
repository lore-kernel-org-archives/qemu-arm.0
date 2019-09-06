Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp526514wrp;
        Fri, 6 Sep 2019 03:36:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrY3FtEz9KOvA2SZODN8WbAVqGMZ4Y/YpHxWJl0rZey7PK5yazYs93TX044aeHnIOej+2g
X-Received: by 2002:a0c:eb8b:: with SMTP id x11mr4832453qvo.184.1567766188438;
        Fri, 06 Sep 2019 03:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567766188; cv=none;
        d=google.com; s=arc-20160816;
        b=cglt9s9L8OliRyVHDor4uOM4JlISAd9BeargSsgoqVSQd9TMBlZl9LVMI7QLB+ouw4
         INLor5z6efMExK1Wif/VSvDop727HJVVdsrWfPEcM3n6EjUTqv7K/e5zOsHUtSSynmW6
         O9EUEidospRon3OIQbIVRnrb2dzugQ1OIXqBQ9YOe59x3TLI+AEdRZe7xd9p4zzn1Knu
         k5H6J9s3tMapk3Ef3eQO9JeR/LauGe7OnMxImtfws5emsGV73h5Apqlmg9czqw5lQ2UZ
         yFAb2eCP2Stggf9ELca3fSmC/e/P7Y1jqMNceulAyRxWjVz+Qh+lr+SCfsUHivuZA+0M
         upPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4q0ZsE8JB9tBhkMnXJiBoiVAJqTnzerVQBKDgZkbqI8=;
        b=dPWzwwJBelHdSR6mx5plu0vgPeAfBjL9D4lC5baxaM4ghXkRIxCoFjpTgp2CZNCHRu
         mJtPYmxKgtsfUcMAA2MdrEj57mmOfMRlr383HORXJ+MXIkRp6Vc+yUbq2NAs8K46+iFd
         hFV25gbFLUFPSOIfUJb98ZasxU08Bok67Zr4k11ZqIgAMsCpZSlU0WxQDPypdAuOmbLo
         hXg9tsKY/6tjZNckowbmTlg1pHibb4ecwZGJqDk3cVaUJUPZR0m3i2ni7oqE35SFuYPx
         hBDooiUfxcd38gLCm1EUZ31+9vPLKGCWesLzaubzYKzbDKmOa/+hvoa4Zwal+jLKT4wS
         roeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BRAAjWQU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n46si3572101qtn.366.2019.09.06.03.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 03:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BRAAjWQU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i6BbP-0004e6-Jm
	for alex.bennee@linaro.org; Fri, 06 Sep 2019 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BbD-0004bH-9g
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BbB-0004qA-OO
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:36:14 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34817)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i6BbB-0004ph-H2
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:36:13 -0400
Received: by mail-oi1-x244.google.com with SMTP id a127so4544893oii.2
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2019 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4q0ZsE8JB9tBhkMnXJiBoiVAJqTnzerVQBKDgZkbqI8=;
 b=BRAAjWQUSOET0RGETYjKRx8DJXBxfBzk6RFcjVs2ErQI70YRfAv2l2ejVjpVPyETnC
 xHO1U5pzne5aLuMf9LdaCvLAfCqkt2Sg325kDSSq9wiFyNjbs+/EonDGCOs30XVgpLX5
 cZsE4u8kHaodwSb913xzbN1hISzm/uxlu6UXuIzP8SEWXRrU+uCGsJlyp+olkV4X8+cT
 evITaQPa3vTnADvcl+lRHIU5FC+q/sFVwwHh4vRx9dYbPG7hib/ljLjYBjn4UUkF45Xk
 UktRxmW9qCrORyeWxifUnpHTcnRTs/FPag9MM9vShbWHppCOigyU0vrSMGJpjMer2C91
 DhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4q0ZsE8JB9tBhkMnXJiBoiVAJqTnzerVQBKDgZkbqI8=;
 b=FJsBmG8W4NT7tbyupxq3X6aMW7GH/jdRpnjbdQwwXn659FzZ6PnljPE7fy7TLhWaky
 +vHcdqknfVVFFoK4gCEP12sjIkHza43EGTOfzQ4esBYDyATw7yqy3JiwKrfqA59v0eFk
 080tk715C1ztVxJPMOjT3jbhkuMbm+N/YyhfydXMNXBfDDCdHbalISIokIPnCVGZkPiH
 Z4IcHsD7719Xf4fWD8HpEgj25Xy61iya5x8hMv0q7sFjyBi2s8CxvDDIVAxFxCICj4Qt
 a5Wx88unl4BQnZTs/fZgel1/buhdvBg4jUI6LKN9umQ2TvJAe/JkqQio6nLGcXjyStXW
 uPVw==
X-Gm-Message-State: APjAAAVK6rlhLaUMOq3W8WRtz1uuxG4H4dWR0lkz8hjVqQpfJ5W8YQmv
 uToYHNWt48w7cyUYqkUhZ9m6QUSXIepnzfhOJbSTag==
X-Received: by 2002:aca:53d4:: with SMTP id h203mr6088251oib.146.1567766172441; 
 Fri, 06 Sep 2019 03:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190904162247.24095-1-damien.hedde@greensocs.com>
In-Reply-To: <20190904162247.24095-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 11:36:01 +0100
Message-ID: <CAFEAcA89q8mwNyhivbrCcTP7c208dbwmVBjF2mmOT5s+dyQ4sQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/raspi: avoid reparenting the sd card
 during qbus tree reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: omThgau4Dt5B

On Wed, 4 Sep 2019 at 17:23, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> In the raspi machine, the sd card can be on several sd bus (in reality
> there is one bus but several controllers). It is initially created in
> the "sd-bus" child in the gpio peripheral. Then is moved (parent bus
> changes) during machine reset in the "sdhci-bus". It can be moved again
> by software between the "sdhci-bus" and another bus ("bcm2835-sdhost-bus").
> Here's the corresponding qbus tree of the raspi machine:
>  + sysbus
>    * bcm2835_gpio
>      + sd-bus
>        * sd-card
>    * bcm2835-sdhost
>      + bcm2835-sdhost-bus
>    * generic-sdhci
>      + sdhci-bus
>
> During the initial machine reset, the sd card is moved. Since reset is
> based on qbus tree, moving the card during the reset seems odd (it changes
> the qbus tree). In this case, because of the order the qbus tree is
> walked, the sd card ends up being reset twice; the effective reset order call
> follows:
>  1 sd-card
>  2 sd-bus
>  3 bcm2835_gpio        -> move the sd-card to sdhci_bus
>  4 bcm2835-sdhost-bus
>  5 bcm2835-sdhost
>  6 sd-card             (again)
>  7 sdhci-bus
>  8 generic-sdhci
>
> This patch adds a raspi machine reset method which moves the sd card
> to the sdhci-bus before doing the whole reset (which will try to do the
> move too). By anticipating the move we avoid changing the qdev tree while
> resetting it.
>
> In consequence the step 1 is skipped in the previous list: when reset starts
> the sd-card is already not a child of bcm2835_gpio.

The solution proposed in this patch pushes something that should
really be the business just of the SoC model out to the machine
model level; it would be nice to be able to avoid that.

thanks
-- PMM
