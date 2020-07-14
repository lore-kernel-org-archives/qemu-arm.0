Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3832687lfm;
        Mon, 13 Jul 2020 19:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMIUJLh1Y60yB08OomYFZpSI2ChJoSd+1lsDuOosG0UE7Mj8q13aXFUjEk7Tzo/vuEQszS
X-Received: by 2002:a25:d297:: with SMTP id j145mr5273869ybg.18.1594695443872;
        Mon, 13 Jul 2020 19:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594695443; cv=none;
        d=google.com; s=arc-20160816;
        b=A2V0fbiUpGMhtrnxfMU+oLcvAUrtutOQeT2qL8h9ybVAhucmftbSe4Scvjt0UX0Puw
         Q2cxF6yovIRc9SQ7TiiCqe9QVT4Q2oPQ5EzxdPy9XqKd3MSRlBUdg0e3RbvmwPRtD9z3
         z2CwBGjxBznvfF7mbgYIwFx0v2PovF3Qg7wJZmk6/g3Rq0aziXJXplRgPkyTVpDuXUnO
         c4VB0HpOZr0cLy3uVm5jOiKZ9aZExrUUCWStpyxXNHBYzW0cFlt//IRdUs2wrKNU/mk0
         4F5yz7lZgaIgQvoV5y5cEKBg3rQpennbbQa5wjAHaVUAwueveCrch8AUUjUQr6E/Ttm5
         sQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mE7dPvO1CgW3ZPUxyh6bx2v0qVFfOnWcTV5dKbi21t8=;
        b=dHLTTFvs7zQFRj62G2xpsbRLYhVy5OBAPhUJwIsaRUcGP18d2NNFQ1LvOXJKO6P3A8
         rHcVXb+oAbMQthneYfY+GUUGyCuwVUfc4zdbOoC7iGfL6iwS5yJo4ELksM5Qnib5e1q1
         1QBZMD4Pmkql7H0Q/mDI8NHTmoL+o75WeCHBR0CJm3i9doTBCbZMDvjQs4w0RDWHRnek
         fraSUu9duomcL0nOr2+teooTdPNEZfxvJZ2Xrgd1+gNmm2adLU016fpLjiqNnySz6VWp
         7tAl6S6PsyXALzTYHhTchQosOKQPWVUIWpFiaDQXLxfFaCKx+yIe1CJTZb1LsmWBSJkI
         LarA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=QGDO7pCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g204si15522730ybg.404.2020.07.13.19.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 19:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=QGDO7pCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvB8F-0003rD-9u
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 22:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvB82-0003qx-QO
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 22:57:10 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvB80-0002q3-AJ
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 22:57:10 -0400
Received: by mail-ua1-x943.google.com with SMTP id q15so5101417uap.4
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 19:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mE7dPvO1CgW3ZPUxyh6bx2v0qVFfOnWcTV5dKbi21t8=;
 b=QGDO7pCGZBcvnfGmerp+DPxdKbaYedYpQaVm87Rn8bV6onLO+rNA0pqQL1RbHJvslo
 diW44N/AvKezUVJYAEBiANUSeqiXLZR6a9vIR+ONRcbh+xfyq/SEukKDMm+XsCdv8s+6
 PmEeUYvFXtaDt9/jvcXRYjihL+QBIZS2N1DR9D/xBz+7wdfsTzFceL51sk8c8o0PO7I4
 8w9TU4qbdQm3fmKJqe8DpRzn7EUpXaqb1BnPBrDam8qDGwdLwNERF4Ki9L97H3aShLql
 SlRM9pknC3k0ONvkaondzQBn6nT/dXNKaE9v5kWAHjfRCOUxMk0+VyfHuton6dM5Z4L+
 p3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mE7dPvO1CgW3ZPUxyh6bx2v0qVFfOnWcTV5dKbi21t8=;
 b=ZrQRI5lNhxDlNppvtQvkSohb1v+5rp3qpnY6fncTOmolht7EbvXhTvoDa/2mMvOKxG
 rybAo5IuK1kUKJzYp0ml0fO65z5KFcMMUuvi4LnWBuRWACRAW17gooWwY5F8sxZCjiLR
 mz28a22jhOj7GyIxwGSjhhCuTERnXRiAlzqRrLiazdjCTtpJLTZ79VmRWBC1QudDxZof
 VDG9JgB+WW+sk41LAhhMs8mhgwZ07CPAKTyDWb5iLKuvJ5VGpDgtG5zpSUd6aal/pY+i
 NgZI7GLpMV4B4V6By7wIuWUKFnZDwfWTlqtyNEH7A0BovjkuVvbXbHskf0Oo6YqAMGxU
 1r3Q==
X-Gm-Message-State: AOAM5318ZV5bOEsf0tmru3IBJ5NrQicBxNs/uefItqRLr1Ty9vuux6Q5
 RKUhAYrFdcZo6NRPDNcbuA4OHpdqwFuywhWjTpY+Ug==
X-Received: by 2002:ab0:6ec6:: with SMTP id c6mr2208310uav.7.1594695426609;
 Mon, 13 Jul 2020 19:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
In-Reply-To: <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Mon, 13 Jul 2020 19:56:55 -0700
Message-ID: <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, CS20 KFTing <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::943;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x943.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGBXGwcNHk2Q

On Mon, Jul 13, 2020 at 7:57 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
> > This allows these NPCM7xx-based boards to boot from a flash image, e.g.
> > one built with OpenBMC. For example like this:
> >
> > IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
> > qemu-system-arm -machine quanta-gsj -nographic \
> >       -bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
> >       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,sna=
pshot=3Don
> >
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>
> May be we don't need to create the flash object if dinfo is NULL.

It's soldered on the board, so you can't really boot the board without
it. But if you think it's better to remove it altogether if we don't
have an image to load into it, I can do that.

>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Nice !
>
> We need a SPI controller model and a network device model now.

Yeah, and i2c, PWM, GPIO, etc., but if you're referring to the kernel
crash, see below.

> npcm7xx_bootrom.bin is a bit of a pain. Could we include it in
> the QEMU roms ?

Yeah, I was planning to include this in v6.

> spi_master spi0: /ahb/fiu@fb000000/spi-nor@0 has no valid 'spi-max-freque=
ncy' property (-22)
> spi_master spi0: Failed to create SPI device for /ahb/fiu@fb000000/spi-no=
r@0

This is a device tree bug:

https://github.com/hskinnemoen/openbmc/commit/99b172f88002f4fac939f85debe11=
87b9c569871

> libphy: Fixed MDIO Bus: probed
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address fffffffe

I believe this is a kernel bug:

https://github.com/hskinnemoen/openbmc/commit/77e9f58ba157eabc976f15fa49892=
128fe2b2382

I needed two additional patches to get all the way to the login prompt:

https://github.com/hskinnemoen/openbmc/commits/20200711-gsj-qemu-0
