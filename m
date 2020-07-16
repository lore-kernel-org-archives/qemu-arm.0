Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1082661lfm;
        Wed, 15 Jul 2020 20:00:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOAT+CPe/xP0R8YWQA+261iuU3V/KHI4QXtfUhjjjpRyeMxuWgi5iPJzieLoLQCcKwFWk3
X-Received: by 2002:a25:bcca:: with SMTP id l10mr3149861ybm.298.1594868421976;
        Wed, 15 Jul 2020 20:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594868421; cv=none;
        d=google.com; s=arc-20160816;
        b=maggL9C9tkMICgBSFFYkfZd2ZA2CBkpul7ll5AXpFn0GIprlfKRZLLr75GP5WxS2Fi
         76l3kYFI7omHrJCXibRP5fyH/tRCToMobUV8ii3TPmTWZ4NJAYv+D6EWNvaojm9j4A8Z
         uMVakzH0sUvPHbJZDI5iBjtpdRCZl5Ol2yGK1vwfBH5jZQ8tqRLNO3n8yXiRNUzivRoA
         0ZNQaLPq0OokwVRBODuMLIM3DLgmEb5FXmX+89jmqHPnyfoleGlNnnQII0QJo+uqLSBB
         5ruk/u35toVkO4qsDI80aEoCYPcRjm0znTq5CxxctGwveZFkvTgeO477TFFBj6VizAFs
         WPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Kcv9F9yInqThuGi9ooZUXwSu/hdJyhJpWeASQpL33I0=;
        b=jMB1we8Ov0Fm6vRXpC21V7AeGPcfU4mXVHvU6vUKrxkPIgKFbq8rpJjBBygbz5ksrI
         sOtBLBm4zg5PNtuAyeGS1fASRHXVdX5ESllHP4AqfwqrzUWpCZpQtuT/tQTNLCbQNe2o
         rWFscAGpCJVElOZHb/eWm+3a4uT5E29zy5Y0PEbMuohKtbud9cGRSOBIQDut+7bZYisg
         oSA8x+iTOZ0ogodnjNx12+HjM2EThYyvTCucCLqtrS/O3dv7zal2yq4RUeQ2FTQf9f8k
         im0KLow1fgE4j0tpvT8nwTjBvApbEnJeJv9GK2JJiUGCNMAcSOVpySepp7zIDNclCKew
         E8pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UyHpaA7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si4608589ybj.331.2020.07.15.20.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 20:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UyHpaA7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvu8D-0005Om-BI
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 23:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jvu82-0005Ny-LQ; Wed, 15 Jul 2020 23:00:10 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:39039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jvu80-000453-R8; Wed, 15 Jul 2020 23:00:10 -0400
Received: by mail-il1-x144.google.com with SMTP id k6so3825672ili.6;
 Wed, 15 Jul 2020 20:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kcv9F9yInqThuGi9ooZUXwSu/hdJyhJpWeASQpL33I0=;
 b=UyHpaA7brQcecUCqgqsffOSnPA4yCLOgdj9IgLU+k7BHdOm0pXFYFP6KxDHBzRi6t6
 cO2np075Txv8ddUGHeC1/2s2B9MBlAzAxH+aL7EW+vskKL12EbzkHwAQSkuweXpCqNle
 DC2QCHh8YNVgKTEi2b6ErnxfxOIKouZBuKEwjDGKRGvtEbqRP9BaenR7Z4GrF5SM4XOm
 OCdhaE1SrZZ+EnQfygro3RtUMP8YlKrOsIFq1v5YmevuV3tyJNziSk0gdDAsGWdSC7ry
 deupzxjpIVKGEKSw/O97MykGZnCvCftb6WkLD7+Tn9tpJiAhfgjkHsRrS850mrysyKXm
 keWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kcv9F9yInqThuGi9ooZUXwSu/hdJyhJpWeASQpL33I0=;
 b=aeZrBoCFNssa0Uj6o7XVC0cym/dcld4YPTdOJ/5hpcXe5InNgSTl1w3adK6u9zTvqo
 olK3+WLqbtxs+KHZSZ/EVpHiyOCD6M5TvltYQOh9BgEB5zoRapAaSM9YdQDH7NaszrcX
 Sus0xTtQ7R1PAI7Lb7bLVLBtygsq+1QMVoliPQ6P4LQ0/RabxiEsb6eScfFAs4wmIDIF
 zXI1/Vu2xLg4T2OAwaDbq/WDeRNljmjLg4j0nQ63Gone7+oG9e+8ZQBM2qG52vgcYmq6
 UAtBIQrZVcKylMHV+voqLUtEFs/Qi9swNClrUH8wRXVmvzrR+dXz5ma+Krda4QnDaz7m
 MUVQ==
X-Gm-Message-State: AOAM531+Hk1TYw6pSyD0c5x7SWH4LZYro77CN2F+6YrJNIZ6ShZ2VXUJ
 Cce5sAGQZIzpdTM142Kah28eg9+EPoP/NB0g1Uc=
X-Received: by 2002:a92:c0c4:: with SMTP id t4mr2491585ilf.211.1594868406315; 
 Wed, 15 Jul 2020 20:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-2-armbru@redhat.com>
 <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org>
 <87wo34u9fv.fsf@dusky.pond.sub.org>
In-Reply-To: <87wo34u9fv.fsf@dusky.pond.sub.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 16 Jul 2020 08:29:55 +0530
Message-ID: <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
Subject: Re: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for
 "msf-soc"
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=sundeep.lkml@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, nieklinnenbank@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GK3Ujsb5H3X+

On Wed, Jul 15, 2020 at 8:12 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > On 7/15/20 4:04 PM, Markus Armbruster wrote:
> >> Watch this:
> >>
> >>     $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
> >>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}=
, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
> >>     {"execute": "qmp_capabilities"}
> >>     {"return": {}}
> >>     {"execute": "device-list-properties", "arguments": {"typename": "m=
sf2-soc"}}
> >>     Unsupported NIC model: ftgmac100
> >>     armbru@dusky:~/work/images$ echo $?
> >>     1
> >>
> >> This is what breaks "make check SPEED=3Dslow".
> >>
> >> Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
> >> qemu_check_nic_model().  That's wrong.
> >>
> >> We fixed the exact same bug for device "allwinner-a10" in commit
> >> 8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
> >> function".  Fix this instance the same way: move the offending code to
> >> m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.
> >
> > That addresses this other thread, right?
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html
>
> Correct!  I wasn't aware of it, thanks for making the connection.
>

Thanks Markus for the fix.
Sundeep
