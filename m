Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp3882728wrt;
        Tue, 19 Mar 2019 12:19:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRQRWkqER0YsUgMuFuYmi2jaKnUMhr70H8XtKl1wnJD0Side8WLy21eZj07ENohIsE9OhB
X-Received: by 2002:a7b:cb48:: with SMTP id v8mr4841871wmj.138.1553023175352;
        Tue, 19 Mar 2019 12:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553023175; cv=none;
        d=google.com; s=arc-20160816;
        b=tdvk3JU5hShpwQE9S84nRdlh7vycle2pSEIaXoELBB5rFBdbTrqAm+wcHtyTECHkoJ
         AW6CStuap29SraHi8GcuntJDFRwudtI1JucEZarQe9pFDmsW6Q44dkVytNmjf6U6mpdW
         fjqCXw1Bxt+DCXUwJ7x5nIxPGESQYglf5upi4V6pFz8kdvcKrz8byErrkS6NrH7LHcF8
         +JHKZRO2tkrLYUVIegyXaX2rOhShIewzEnFgf4eC/WkzPaSsMIO6ALikyKV//7x5e8Td
         yzKK6v9tOXg1j7p5pP7mzQyFTzWrUwzhIFDt1k8W3u21PS0hH389xGYOy7KeEGG3VjTH
         2J2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgMGJMOr/vlSzFSe/rvPCtmbZxqxH849C5Q8o10dZnI=;
        b=bO+lpA4xru1wQhnfVoh7aVje4vdwbIPO9ihAEhC3J8No9UA+j/KcP2sK+Q86u8CYR1
         GRsdgoeH2lQMWyRMFO7AA+FiLeoWAxVPzZCLtvmxuxwLrDP38hUsuAPT36rZIQjPCUfn
         tF81lRlN7Zq8FhAujBdFssrbQz+OomDTrB+VY2v099nPel7UolSiWKV2u4dEjoxRieuC
         JTINXYzh/c3Vlduy4/x8RHb0bVh5MBMyjKTHrKrRNYrIoNY4NYbf1dYVo+bXNNXZor/7
         kHFLzjdntFiyhBGqndh7FHpJ+S50Wv+Z7+1ACzfgbeChyi0EoXpPlg91S8c4S2RZ6ceH
         wpmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D077TAP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si2529301wrm.320.2019.03.19.12.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Mar 2019 12:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D077TAP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6KGs-0003ev-CW
	for alex.bennee@linaro.org; Tue, 19 Mar 2019 15:19:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6KGh-0003ef-Nt
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 15:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6KFc-0006Yj-KM
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 15:18:18 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h6KFc-0006Uy-5q
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 15:18:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id x8so18777184otg.7
	for <qemu-arm@nongnu.org>; Tue, 19 Mar 2019 12:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OgMGJMOr/vlSzFSe/rvPCtmbZxqxH849C5Q8o10dZnI=;
	b=D077TAP5DEoIIaAXNFWW9pW1Byr0u9Jr85tm083ToPXs2PYOAaNZnt2JLnQi63uEQm
	8h5+E2g+U5laLKvWraM/FCdGUt0xCOWFlQM6YN28A395kIckH0afeRLtJxQAtbTazXIQ
	+1+bZRpyNvcTXiLp7X89pW1l++gwsVgcXW5sPU7hO6Czsk+61ehsAf9sxxsCDanHhIES
	OescxKVxOwTojRtnxgm/Jhm1RpyKTi/00gcQkuboSVDI2FgZT3GAZipgTUw+I+TKankY
	yJ5FX/mLrglWdRdubklUmOooioaPE59AvBxCfmDNmGj+f/UmGR0A5sFZjLrazu7trqvH
	WuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OgMGJMOr/vlSzFSe/rvPCtmbZxqxH849C5Q8o10dZnI=;
	b=fvTi/LkpC3/yueL2hg038/h3DVG5omDwnaaoqGSytTkHA+x5tfeYWtSIn9GHU1KIMb
	EBlBy8oZU+WPoFYcRVStIbJ/5BipFHyjH/pZlRkqaVqIEvQvtxuvA7aHdbnEimDbhzDC
	R/fLhEU4mtkJ/AGG6BOaiD9DIbcJyH82IqH/fApFZZjS1dtRC9JLOS5+5z5qM02F5/cY
	vTPYpfY0AF9aGH7mgltH10rdqkvFfbMf2brIBqPW04kx5Ae1Vvv46Yc2X0YCwm51rF6m
	tXP2IHWvJG+IKTopmpVE8Gu6TbUqtV/o2TrctifpJt1qBfCXI17IBoCPOvcY/ZFTYLos
	v9ow==
X-Gm-Message-State: APjAAAU8IkDyG8vtR9dpyEbnvLFwsXQW/uTg8RbjUZfBmBGsuXlbOoTI
	FYCR9WsipfmjTqCjLhFg2U5SHCzLQfZ/Yg9ujzgpTA==
X-Received: by 2002:a9d:6406:: with SMTP id h6mr2826015otl.238.1553023093847; 
	Tue, 19 Mar 2019 12:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
	<875zsed86y.fsf@dusky.pond.sub.org>
In-Reply-To: <875zsed86y.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2019 19:18:02 +0000
Message-ID: <CAFEAcA9bEpB3jabnZN4tiNf_VtfkYskyPdyEFcx600KHABNGdw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] Maintainers,
 please tell us how to boot your machines!
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Alexander Graf <agraf@suse.de>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Paul Durrant <paul.durrant@citrix.com>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b4soTRie6WsJ

On Tue, 19 Mar 2019 at 18:34, Markus Armbruster <armbru@redhat.com> wrote:

Here are some command lines from my image zoo. Unfortunately
typically the images themselves are random accumulations
from people and I have no idea how to rebuild them (and
they are thus not redistributable, generally).

>     = hw/arm/integratorcp.c =
>     Peter Maydell <peter.maydell@linaro.org> (maintainer:Integrator CP)
>     qemu-arm@nongnu.org (open list:Integrator CP)

${QEMU} \
  -M integratorcp \
  -kernel "${TESTDIR}"/zImage.integrator \
  -initrd "${TESTDIR}"/arm_root.img -serial stdio \
  -append "console=ttyAMA0"

(I think this test image and kernel used to be kicking around
on the QEMU wiki at one point. Provenance unknown, naturally.)

>     = hw/arm/musicpal.c =
>     Jan Kiszka <jan.kiszka@web.de> (odd fixer:Musicpal)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:Musicpal)
>     qemu-arm@nongnu.org (open list:Musicpal)

${QEMU} \
  -machine musicpal \
  -pflash "${TESTDIR}"/musicpal.image -snapshot \
  -kernel "${TESTDIR}"/u-boot.image -serial stdio

I got the test image from Jan ages ago. No idea how to rebuild.

>     = hw/arm/sabrelite.c =
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:SABRELITE / i.MX6)
>     Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX6)
>     qemu-arm@nongnu.org (open list:SABRELITE / i.MX6)

${QEMU} \
  -smp 4 -M sabrelite -m 1024M -display none \
  -no-reboot -kernel "${TESTDIR}"/zImage \
  -initrd "${TESTDIR}"/rootfs.cpio.gz \
  -dtb "${TESTDIR}"/imx6q-sabrelite.dtb \
  -serial null -serial stdio

>
>     = hw/arm/spitz.c =
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
>     qemu-arm@nongnu.org (open list:PXA2XX)

${QEMU} -M spitz \
  -kernel "${TESTDIR}"/zaurus-test/zImage.zaurus \
  -initrd "${TESTDIR}"/zaurus-test/zaurus_root.img -serial stdio \
  -append 'console=ttyS0,115200n8 init=/bin/bash'

>     = hw/arm/z2.c =
>     Andrzej Zaborowski <balrogg@gmail.com> (odd fixer:PXA2XX)
>     Peter Maydell <peter.maydell@linaro.org> (odd fixer:PXA2XX)
>     qemu-arm@nongnu.org (open list:PXA2XX)

${QEMU} \
   -M z2 -pflash "${TESTDIR}"/zipit.flash \
   -sd "${TESTDIR}"/zipit.sd \
   -show-cursor -serial null -serial null -serial null \
   -kernel "${TESTDIR}"/uImage \
   -append "console=tty0 fbcon=rotate:3 root=/dev/mmcblk0 ro rootdelay=3" \
   -rotate 270

>     = hw/lm32/milkymist.c =
>     Michael Walle <michael@walle.cc> (maintainer:milkymist)

${QEMU}  -M milkymist -serial stdio -kernel "${TESTDIR}"/flickernoise

thanks
-- PMM
