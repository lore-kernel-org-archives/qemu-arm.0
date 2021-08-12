Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp314671lff;
        Thu, 12 Aug 2021 05:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZVhQPlWZZtuBVH828jkLCboem2hz+zIXmaLfj1mAytDyI84EQMYz+fKphJWM0UizWLzDx
X-Received: by 2002:a05:6638:412a:: with SMTP id ay42mr3554947jab.59.1628771300460;
        Thu, 12 Aug 2021 05:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628771300; cv=none;
        d=google.com; s=arc-20160816;
        b=OZBYOhOGy3dcy1AloCYMIt0Ea9szunRQeCaghZcvJH62nNzt+QDt9Dd/7CsXRyXEnH
         dPnz9ivQ62FxvRzg11IzBjIbYMm1p3J8Cr0wx87BfLw5Hiat5jyW9V5L8vh6JO7fl58G
         JHPLiSBkw/R6+zo5e8NTW5JifhWkSgEu8LiDS6DbukuqbnN5KkLWJg07oZMhzoVC9PFA
         mPinHN0c5/D8NRLbC3Pc/y3gMwuvhPM9UCe0jzx2YJSxQemflh7xOCI3sbGtdcZpBIcF
         oVlkNiZdPU1enjhW1yHigqTmF31+CaglAk4n76fmWzPstEOWVi4k0XS63Xzz5WLf47hl
         Bmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/kJrcZs7jmV6yVYAo+PNIHT3K8AcywMMaiAHPAqpC8=;
        b=Ht9JwNuWEEoPCXtU2/NB+3bCyXFnsTSuEvoCFveHLjmma1Ht2zHqC3SBSWiDLTyPal
         72guhYeqItQHy2T+PueFcYM7Z2ZqElV+WWycv6jjRaQVSscOZgEv/ZGtWqhWsauilSLD
         e1G+WNQQxWB75lnzX83jf4BAjl9E/Ay0rlduZcvO9wx+AKluRjGwLkjs11aghc8YtH3W
         lfPvw87LqblkqM3mgm4hiysc0ajKU6NiQRLRyqg1thCJ4QoJC5T0D9Rz1OJzfubFBJKc
         E8b/CVuvq8xOqH2NajSAHIfPNzgXZG6a21nFviNbITgBYf/sPINa81fKagRjfqAZffTB
         nAwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qdny8TmW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si2772672ilz.158.2021.08.12.05.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 05:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qdny8TmW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE9op-0003ZV-Nc
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 08:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9of-0003XL-NF
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 08:28:09 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9od-0008MW-HR
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 08:28:09 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hs10so11319526ejc.0
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/kJrcZs7jmV6yVYAo+PNIHT3K8AcywMMaiAHPAqpC8=;
 b=Qdny8TmWTa5orkrXSgN90LbpC9POzMSDkYtAE2zSFX3u4KF/d68WwexEvUx0bB9LHD
 PMndETQKoSa724j8Zckv5rrXVPpPoIpSFSdpSsU0AQCvnVF8+4mrLDgiAvKQ55M0bzWl
 za+3O0osv7595763G8wWeDZXUOfYLgQH7wZ8qoGizr8PIhggAb09N3NVzJMzWF1Im1Ka
 /DxkoaLF7NA+oyxLJKHbcI0hRO1PsNCObSraXJMIfM/6dNfs+eB7v5nbh5LAJ1Xcz2t3
 +9i/dofd0aHy0IFxRcCwJ+v2u9jbTN4XmBIABFkyBWz/++Iywr1TFSMc2lQtc4lmxaJC
 Fvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/kJrcZs7jmV6yVYAo+PNIHT3K8AcywMMaiAHPAqpC8=;
 b=TTwtODtwBq2Ud/7XFdNUnY39Wg/s5ZHLKThSWyZUmChcszMTih3P5i+o8+qYs27TSJ
 q1lLcblSp4emzHe9Z7J/Ae5n+i17Vc2EY+Th122ZFiOj3X6N2Jz0WU203AtPvRIWycR+
 JnBX8dABto0D3PPE1lVixV6GXp7V9UNv2+jOAYwO9tFC3yekKbcVBJG6cgK36Q8o6g5f
 TgjScFiZ7IZJ4Rwe9V8ikSdi5hLgUE6mn89xL2NvFt3VEs2q11hSjCJU2TAcXKz6ontQ
 1woNf5aglUCPmR/2gAt/69DxMSQnGHO9BGWdLptcPlNomG3j93SUmTAmDKjpBarpuPxX
 uUtw==
X-Gm-Message-State: AOAM531Z+9IfdPkJbcEqbPV3WxBoH2KShLNEaxar+oXC1cVD7wYDXGIR
 0pMQPv0vaKdqCm+uvS2IMYWi1sGfWgWcOvmVnLsyBg==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3357736ejy.407.1628771285564; 
 Thu, 12 Aug 2021 05:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
 <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
In-Reply-To: <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 13:27:20 +0100
Message-ID: <CAFEAcA9PWpMpPxsETpSM75ZjDrDsUaNFUgQC6cPJC10JM9aq6g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: becqdHc4DKyN

On Thu, 12 Aug 2021 at 13:13, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > In the realize methods of the stm32f100 and stm32f205 SoC objects, we
> > call g_new() to create new MemoryRegion objjects for the sram, flash,
> > and flash_alias.  This is unnecessary (and leaves open the
> > possibility of leaking the allocations if we exit from realize with
> > an error).  Make these MemoryRegions member fields of the device
> > state struct instead, as stm32f405 already does.
>
> There is a typo in "objjects".
>
> This is something I had issue understanding as I was seeing both
> patterns in the codebase, thank you for making this clear.

Basically if there's a struct that the MemoryRegion can live
in  then that's the best place for it. For some board-level code
where we haven't needed to subclass MachineState there is no
convenient struct, so we just g_new(). In a few places like this
one the board-code pattern has been copied into an SoC object.

-- PMM
