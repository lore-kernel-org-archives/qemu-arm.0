Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3701936lff;
        Fri, 20 Dec 2019 06:47:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxWHYjW3ipgdc6Ja9NPj0FNeYDnx9QBTqEwXtO8yAX1jl+cEIHRrdY2P+NfO9FeeuPfWkGF
X-Received: by 2002:a05:6830:3c3:: with SMTP id p3mr532326otc.146.1576853221474;
        Fri, 20 Dec 2019 06:47:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w131si5034006oif.240.2019.12.20.06.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 06:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Mz9ExDYF;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiJYS-0006ll-9c
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 09:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiJXx-0006cm-DR
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiJXv-0007xi-Un
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:46:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:52538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iiJXv-0007wL-18; Fri, 20 Dec 2019 09:46:27 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id D0BA996EF0;
 Fri, 20 Dec 2019 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576853185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UeyalBXBvVZ3C0vBcE1FLzrTdcmMSL8XKpGFDkbsK7s=;
 b=Mz9ExDYFMGYz+PeNHRzPLCYksUn7MOsvWoJtyiZjAqVgo+C3Sa1PpJSqLceW1fEI+xQJCi
 qFmaMTII1wdzynDzBE6ATJrVfzKQndTOcrD4qsEw8pcLTwG5x4MWm2Cdcr8imcmGGxF/iF
 wd/4Yb58z0a03zeXY1fd+KePhhgR4QQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Raspi sd-bus cleanup and multiphase reset
Date: Fri, 20 Dec 2019 15:46:13 +0100
Message-Id: <20191220144616.911466-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576853185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UeyalBXBvVZ3C0vBcE1FLzrTdcmMSL8XKpGFDkbsK7s=;
 b=5a2nOH7WTm9TEMUOH3NWeCEAUJaaEmRMS0hO4H1ulFUsMJ/E1Wwi63QhH9Z00QJNXSi40Z
 R8SJ44oMFUg1DQnH1MMu12TDwQd+MfOBsYtD95h3vCEBUJRsM5pR7B0bVlYRRAKQzHpy4N
 ruenPZtLD2dNggqk3KrANOma1I2S/ss=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576853185; a=rsa-sha256; cv=none;
 b=sYUV/YeUGgYWhFcvqWKWCvOkFbgaJ77/29kbXOMLsUZkC1yGO7q337fBDA9kViR+O8RB/l
 mFNLEcBvURob2x0DIeE1mysXu5ybLXiRaM9lT1WHiC1FdFXDfA6vdSvrmDbc2NIxEq8bEs
 t3IdI59a4tu48btmtAncpOLnrI9NimI=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, philmd@redhat.com, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mBSKXvBhbe0l

Hi All,

This series is a follow-up of my reset series,
https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04664.html

I've extracted the raspberry-pi related patches. As suggested by Peter
in the previous version of the reset serie, these patches do a cleanup
of the raspberry-pi sd-bus then does the multiphase reset switch of the
gpio soc part.

Patch 1 remove the bcm2835_gpio sd-bus which is only used to host the
sd-card before the machine initial reset. As the soc exhibits the "defaul=
t"
sd-bus to the machine using an alias, we can simply exhibit the sdhci ins=
tead.
Patch 2 prepare the multiphase reset switch by isolating the sd-card pare=
nt
change. Patch 3 finally does the multiphase transition of the bcm2835_gpi=
o.

Thanks for your feedback,
Damien

Based-on: <20191220115035.709876-1-damien.hedde@greensocs.com>

Damien Hedde (3):
  hw/arm/bcm2835: remove gpio/sd-bus
  hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
  hw/gpio/bcm2835_gpio: Update to resettable

 include/hw/gpio/bcm2835_gpio.h |  1 -
 hw/arm/bcm2835_peripherals.c   |  2 +-
 hw/gpio/bcm2835_gpio.c         | 35 +++++++++++++++++++++++-----------
 3 files changed, 25 insertions(+), 13 deletions(-)

--=20
2.24.0

