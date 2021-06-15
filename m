Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2751667lff;
        Tue, 15 Jun 2021 02:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf/rnzLBNhW68QO7KT9yroHAQz0/ZFkt+Ra3CX0JQJXe/CUsxMv/vDhVoK8HGm2R4J6ZD1
X-Received: by 2002:ab0:5fd8:: with SMTP id g24mr16933184uaj.14.1623748105103;
        Tue, 15 Jun 2021 02:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623748105; cv=none;
        d=google.com; s=arc-20160816;
        b=xvErQdTwVfd8ixbah6r6Xv0fZxQ70l1nfrKA0ud10+LObKFam0BvvscCs3Z2Kssd61
         nE1EB6s5ViGQjU76QgDNKze5ZANGK1ltPIORVuwqYFV2NqpQAxbpnF9D/Jm6NE7v3DXC
         l6a6SfNEIV7x7c2aSkUyFJgt52x+oPRX1a25WSOk6vryokCt/PnRvmJ38PRPHb2t5A6W
         m2pyn/1e3UKu1EyLS4XeDgRoMx6XWphPBqUKOxr0q4TQG+tJH21PBaeySitqDYCIyp5i
         QFEg34Emfkb7GYTTMVDrGWlU0cZErNXIe0biAmsyFIkwP44VBSRuii2/WC0wtEURUsRu
         GSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghtabWKaLVE7wk08TGzpI4OvyM7abc7BhaYk2ImRNVE=;
        b=v+9R9XfsENMH3X/NsPwdamrbqfxVLC60d/2tSi9fW7iiGS+BnyDu+MgrL3VOMNVM+9
         JxvfPovkaxog27KLo+uMn8wDOTuA2V62sWlWE1GhIjFL0TehK8bWSPc0ZMLpGtPZ1KgR
         lhwixde/ovYxtEOloQhTVONX36JX3ZAR9vIyii5AO8uN48gs4ZSZKIG0V6KyIyvweRMa
         1lMjkwerywezaiXeaMgGwtsbjTy0cCIsDVFdwVOuXV+7DMlESMU1W5FGwAlG34KaZCFt
         YDXob3XSyMX7emy4L04wnfjgy5qi51CCWNoK+OfKjMhWI7hVPxR/k/QHzB2H7COiY8tC
         hrNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4VsOqmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si8054273uav.170.2021.06.15.02.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 02:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4VsOqmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt53Y-0002Br-Dk
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 05:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt53E-00029l-UW
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 05:08:05 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt53B-0000U7-BD
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 05:08:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id g8so21339776ejx.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghtabWKaLVE7wk08TGzpI4OvyM7abc7BhaYk2ImRNVE=;
 b=c4VsOqmXnXECG165rJWxjMJHZdDcfhsRZSoT5n6tz4zhTRzuIt2TPvsVgL9iPBCike
 cRXCqCAqVCXJ1TNhEJlOTyggqAhaW35DprIvua81EwGzNKTo7y4tZf3eZ1VgfPfJTSJ1
 OQZepC6irrJmJQHOR5hJIErQMxIwfGkkcugiM5EvDBAiop0Vjx0kq8GZjtJCTG+mJEdO
 Wu+yQjpBwQCAjdEdEss2ANNhEPcHaRg2x7xsPg/UgNQEwwz9+Nfuc3R3cX26aNjOfnJV
 EfDeXdYjga+7sGe/LmXNw+mtCh+Z1m+1vhFUEZmQ1pTYxBxiXWBgZiURMEGV47ANGp6K
 Jikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghtabWKaLVE7wk08TGzpI4OvyM7abc7BhaYk2ImRNVE=;
 b=LQ5rVWArKw5LL8x9DFJkXPVyEj2ZKQ2TLsNZh1BVkaDXNbUjcfobiAqgGHKlJ8H4Uu
 nHmxpWs0N0+ITNooP6oOFwldusxOJ7uwg7plJi/rdH6t5Q8tPfEE56ZL0bMs8wE/TbHL
 tO3X+AHI+5GErt2sPmg7+PGGBhcXP6YvDpD5niVszHQlM5RCeIMMz5uz6bjG5nHI0hSD
 /hHvaOtO49sZaOCBwvvuEHTl4CfUmiTrtTZjbuhAPi8WoapvmtQ63GO1ztKN7ob97REg
 AkGCXK0KNnJr8gGW2IY531IPn026Rb+KSGPouob7wKt4anUxtfZV6OplwQW/dneERR62
 YRvQ==
X-Gm-Message-State: AOAM532MLSdi8Bh6eBopV620t0fhAZRoYj4uiIk0C1oXQZCXzl6uVx2P
 4DEzF5kJgtJJbsQg+ixfPj1I+mWa88eOZa51aKF2HQ==
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr19432297ejc.4.1623748079287; 
 Tue, 15 Jun 2021 02:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
 <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
 <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
In-Reply-To: <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:07:24 +0100
Message-ID: <CAFEAcA8rz3XkBzieMGZf7TbMkv-RPdgQG-LD06-f6kTLo-G2WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0l0cu+FIIXHK

On Tue, 15 Jun 2021 at 08:16, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 6/14/21 5:52 PM, Peter Maydell wrote:
> > Could you add some documentation for the new board, please?
> > This lives in docs/system/arm. Commit c9f8511ea8d2b807 gives
> > an example of adding docs for a board.

> Should I rather:
> 1. Add `docs/system/arm/stm32vldiscovery.rst` to document only this new
> machine?
> 2. Add `docs/system/arm/stm32discovery.rst` to document this new machine
> and future STM32 Discovery boards?
> 3. Add `docs/system/arm/stm32.rst` to document all STM32-based boards?
>
> STM32 boards share a lot in common so I believe option 3 is more
> appropriate, what is your opinion?
> If we go with option 3, I can also try to document the Netduino Plus 2
> (maybe in another commit, or another patchset later).

Yes, I think that a shared stm32.rst is probably the best thing.
If you want to document the netduino boards too that would be
great, but I don't insist on it.

thanks
-- PMM
