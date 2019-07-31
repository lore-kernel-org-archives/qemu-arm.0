Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5721285wrv;
        Wed, 31 Jul 2019 07:22:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHSXyJ2G8+6KUado2NPSv9a6rQ894P9yvjOkhy06Cx0OxLy3ph5f+HcSteHO38j8RvX5/T
X-Received: by 2002:a37:6d85:: with SMTP id i127mr81060097qkc.74.1564582966393;
        Wed, 31 Jul 2019 07:22:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si39239373qke.380.2019.07.31.07.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 07:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Y0clnCzh;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hspV7-00033F-Vm
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 10:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hspTX-0000V0-N1
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 10:21:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hspTW-0007T3-MU
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 10:21:07 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hspTW-0007SM-4g; Wed, 31 Jul 2019 10:21:06 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id F109996F50;
 Wed, 31 Jul 2019 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564582864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CIx9wnDk9ftdXlP6H4HNfr9G4iy0BtPVqZppcCvc0MM=;
 b=Y0clnCzheLnDW+uiXaKZNuswYUqvIC908J1hOp8ryf7/5J9v45yt09MKQJwh5loWuhwah6
 CWILtJ5Nzp4sqUk5+PsQU/TX9QzcUCU1vfDYXkxdOZrherX+EfReMFuYf6qu1auj3k8oiV
 EpuAeRyu6rGUdFmACcHI+mmu6lk5Lj4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <6ea54e80-63cd-5759-337b-1eb1686453f5@greensocs.com>
Date: Wed, 31 Jul 2019 16:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564582864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CIx9wnDk9ftdXlP6H4HNfr9G4iy0BtPVqZppcCvc0MM=;
 b=wJ0grTRADndZKLn8vEEkpRTuqgEcz9oiHc5v7uTVRAZHli41NYYMAmPN1kucZGyBOSa1g6
 UJZ8mVt7Okpi2Vj2zrZZWqgy2f1lDXqKw1HMdJtnWyXaLe+7qLUhMTronLUu/dudZXrSZa
 3g6SDsVQHvat8tJRkR+SfINVa7E/BDQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564582864; a=rsa-sha256; cv=none;
 b=MSvXQ8Qik1H1dtitCw+iFXeGmi49irVrFbnAqYD85AIJGRR4/bToVbM/07SjGBVcKaYqQM
 ef9LKrjSU1xZ11pLtUfO8vPiqQbYc9tAZI0Yj49e3wd6oJ8+CrQESuDRa7Pz1w2KPKn2SI
 R5Ei0RYvzD/8pBpfArLCFY7fz+YxhWo=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] RFC raspberry pi sd-card reset
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 f4bug@amsat.org, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHyypPHT90mD

Hi,

Concerning the reset on the raspi2/3 machine, I ran into an issue with
the sd-card.

Here follows a subset of the qbus/qdev tree of the raspi2&3 machine as
it is initialized:
 + System
   * bcm2835_gpio
     + sd-bus
       * sd-card
   * bcm2835-sdhost
     + bcm2835-sdhost-bus
   * generic-sdhci
     + sdhci-bus

raspi_init does 2 things:
 + it creates the soc
 + then it explicitly creates the sd-card on the bcm2835_gpio's sd-bus

As it happens, the reset moves the sd-card on another bus: the
sdhci-bus. More precisely the bcm2835_gpio reset method does it (the
sd-card can be mapped on bcm2835-sdhost-bus or sdhci-bus depending on
bcm2835_gpio registers, reset configuration corresponds to the sdhci-bus).

Reset call order is the following (it follows children-before-parent order):
 1 sd-card
 2 sd-bus
 3 bcm2835_gpio -> move the sd-card
 4 bcm2835-sdhost-bus
 5 bcm2835-sdhost
 6 sd-card  (again)
 7 sdhci-bus
 8 generic-sdhci

In the end, the sd-card is reset twice, which is no big-deal in itself.
But it only depends on the bcm2835_gpio tree being reset before the
generic-sdhci (probably depends on the machine creation code).

I checked and it seems this is the only platform where such things
happen during master reset.

IMO this is a bit hazardous because reset is based on the qdev/qbus
tree (and with the multi-phase I'm working on, even if it still works,
it's worse).
I'm not sure what we should do to avoid this (and if there's is
something to be done).

The easiest solution would be to initialize the platform with the
sd-card at the right initial place (I do not really understand why it is
created in the bcm2835_gpio in the first place since we move it just
after). But it won't solve the issue if a reset is done afterwards.

Or maybe we could move the sd-card on the proper bus in a machine
reset code so that it's on the right place when we do the sysbus tree
reset just after.

What do you think ?

--
Damien
