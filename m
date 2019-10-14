Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4600219wrm;
        Mon, 14 Oct 2019 08:50:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwS5G0j7JC4ajPFwM/I/0reMwXAmk3y/vQ+VeWq4TXYVwx5IoOCFcr27/SnR41ZWMpW+2U
X-Received: by 2002:a0c:e648:: with SMTP id c8mr14985828qvn.143.1571068247736;
        Mon, 14 Oct 2019 08:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571068247; cv=none;
        d=google.com; s=arc-20160816;
        b=xLVEsgKyDdaRmgVJdN24B28JHAAjHa+AUVpGCLAJyJ+0UybKwEuHNdS71eltUXq5wh
         zTyUQWnp9J9E8Qg3au8elPbi20R358Ml9hwersLGMxJn/UOD8NlJzNLUR57bF6XKqa9z
         aGLjzDLqYtQsEfQdUNquk73g4SPoHAxfecUciYr5ngiXPpjKydkcNBBHgg3ZVwbTlphB
         7F7BUR/s1sjj0RBrovQnRusy2BPCEgVK4ZzZX2qEterbBSBBlkSLXqo0TTinZ0ZXYOt7
         EjgpyIUeXeZSl/bHk5E81Pv2qfN1B9nAvZSHIXlel1S8xVVENgKhraO3qyLK4eRyIX9A
         pykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ttVrenm4QLLTwpCCco+SKk5k4NpVsUUsicg6JQ4hx4k=;
        b=seCTRAeASqVo23wGqwJVoSmhMEYlB93zfqSQCv6OadK4/krJgGXE82M9dNcxQupTnn
         nNm5wIaCqYOWgr8Icuj0t7yL06V1URx23LL52+9rjhcLVpNLdztbnwUXQBDBpbSjEGxg
         m1UtQ45HyFzcTDrn2VBxE0yktjjaShDBtziebeOkMpjdPjNN0ou3ClcUgJJHa2RIWLBe
         XwWobwfUIowcvqA8TsqwMlyGHirEmrvpsRTorfwDtWcYSTmzrWiK9gKaM1sfMTwY71nd
         HDiPEWjEUZr9TbvSL4z6aBTqfiPA5kYPbBbHEzroYKLs/flLj/wfDL9cA26L1QwAoTej
         hJIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGeVmdBo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f57si17255612qvd.121.2019.10.14.08.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 08:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGeVmdBo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK2cQ-0008UZ-Rq
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 11:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2Y3-0004nD-Pi
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2Y0-0007iC-Nn
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:14 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2Y0-0007hW-Ht
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:12 -0400
Received: by mail-oi1-x243.google.com with SMTP id a15so14153497oic.0
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ttVrenm4QLLTwpCCco+SKk5k4NpVsUUsicg6JQ4hx4k=;
 b=kGeVmdBoRJLq2eR2LuzVocnQwajwVXUOWfTqOTM3DycwX3S+18gpWMZPVeb9Hsinhs
 jVjQBcfnoX0/0+YLy8M3AXLFO2QBXIaHBQ6KTYc5MtXKJU4X/lkR1M05QG/PbgQtWo1A
 BOTNbndHuhq90cOkIBxCFFxCutohXsIXmJ25Vkxl5Wlnz9ceGEj+N7oV+4o5k2rcDvxz
 +hH01jZWf6CasriDgb8DZWBh0o3CkRM7aQ+E5B2TNVBmS+y1ggGo83onFl8wgdhCBQo5
 kUbpweADb6Ph2raDqchCq6KkyhN2702YicSyQj0eLpR8pn9MEAQgb8Xu+VgkE9ztZmYw
 qVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ttVrenm4QLLTwpCCco+SKk5k4NpVsUUsicg6JQ4hx4k=;
 b=ZXg66G1WjtP3U3/9U0Q7Hk0ToljiNk3x0Y3OJ/ejX9fddiSsgKGAu0Dj//bLYFyXTA
 W7WVYA6Utyqt866xa4YJqgc7cFZNwet1eupajcfzbzX2D0wW+yJle2tIVfkGXc8XJGv+
 7lhJbe1gqKNbIibjpOUROx1IOFN/yMaHOw6riXrh93odr+wmBvMJ1um5aYZ54I2MKBXI
 HUYzG4YnN32tpK/jCfHtIOWpPRLC/ypehEgWpPK8cTzwNrReqcHgqnEzLNXnCUKQoxzt
 cBI6YKd8OijQTA2qKCJXd873dlxodh5cL+0xt9qr/rt6aYPSQ7vNABtQ9zc5J/PUZFkP
 C1WQ==
X-Gm-Message-State: APjAAAX5naz/YhqrCBCllftacTfyRpb++ezWIRpOKhvfSk3aKEfPNuTp
 Qn6JcLbhDIqLPXUe6ojGzi9ctwVKtQpQvMJDvorQgg==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr23728332oia.48.1571067971007; 
 Mon, 14 Oct 2019 08:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 16:45:59 +0100
Message-ID: <CAFEAcA-2ovf5Y4uaCteRB7Ytt2bcOS1BgfQNRr8G6z5_VobKZw@mail.gmail.com>
Subject: Re: [PATCH 00/19] hw/arm/raspi: Improve Raspberry Pi 2/3 reliability
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oi6pCdj6N6uD

On Thu, 26 Sep 2019 at 18:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi,
>
> I previously posted a RFC for the Raspberry Pi 4:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg642241.html
> and got it almost working (boots Linux kernel to userland, sadly
> I'm still having timeout issues with the eMMC block).
> However since it is quite usable, I started to clean up to post
> the series and realized it is way too big for Peter Maydell, so
> I'm following his rule of thumb by splitting in 3 sets of ~20
> functional patches.

> Philippe Mathieu-Daud=C3=A9 (19):
>   hw/arm/raspi: Use the IEC binary prefix definitions
>   hw/arm/bcm2835_peripherals: Improve logging
>   hw/arm/bcm2835_peripherals: Name various address spaces
>   hw/arm/bcm2835: Rename some definitions
>   hw/arm/bcm2835: Add various unimplemented peripherals
>   hw/char/bcm2835_aux: Add trace events
>   hw/misc/bcm2835_mbox: Add trace events
>   hw/misc/bcm2835_thermal: Add a dummy BCM2835 thermal sensor
>   hw/arm/bcm2835_peripherals: Use the thermal sensor block
>   hw/timer/bcm2835: Add the BCM2835 SYS_timer
>   hw/arm/bcm2835_peripherals: Use the SYS_timer
>   hw/arm/bcm2835_peripherals: Add Clock/Power/Reset Manager blocks
>   hw/arm/raspi: Define various blocks base addresses
>   python/qemu/machine: Allow to use other serial consoles than default
>   tests/boot_linux_console: Extract the gunzip() helper
>   tests/boot_linux_console: Add a test for the Raspberry Pi 2
>   tests/boot_linux_console: Test the raspi2 UART1 (16550 based)
>   tests/boot_linux_console: Boot Linux and run few commands on raspi3
>   tests/boot_linux_console: Test SDHCI and termal sensor on raspi3

From this patchset, I'm going to apply patches 1-5 and 7
to target-arm.next, since they're good cleanups that have
been reviewed. I've given a few review comments on
some of the others but mostly it seems to have been reviewed
by others already (so thanks to those reviewers).

-- PMM
