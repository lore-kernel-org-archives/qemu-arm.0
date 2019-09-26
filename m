Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2269983wrp;
        Thu, 26 Sep 2019 08:18:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoEPM9t/6X0QqhotlTGKmnbv6OhquczNZit0MjuMQiTrCQ0Gj8ir7bk8q8e2lzI//3nln3
X-Received: by 2002:ac8:4612:: with SMTP id p18mr4289699qtn.94.1569511131147;
        Thu, 26 Sep 2019 08:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569511131; cv=none;
        d=google.com; s=arc-20160816;
        b=qXgSY2ZRSMXxd4/B2MO5W+jvo9kyxJ4yzlicg+GbhpcYeJe0V/Eyu2REruk3U7/snv
         0vJMCImnKggnPLUyJJEpCeH5qcDLzU+hg3JYzsJiV+kssDd3cLLP5aj57IawnvDA6qdQ
         c2QmwMenVg/ywZdr31yYr2KYt9Rv8tMXr1v/uCc1MMGKElrf/oUdt9b7rxNlnXAHGUI9
         ICkUDdjlEhQcOvl6D2V9JtpV8UqQyDT1gshFqPja/isqUrC0xKoYIuyd4gbk+Az6uebe
         EEgZjpUb/ulfNmny2CoAeTpu7uLzuoKbs2udsjwWIRLtVYlf54vq/zAenDNOnlxkGeCr
         Yfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=HjHRNK9B1/qLDWd9pyHewSuowOkcyyYh67AtH9w3qZU=;
        b=azUR6WCi0XIjI8/BrX9YlLb4JnEC/9wKhKu6MgaTXPF5FejZ7ohrrYiChr7etKLAOX
         h3dpXzDCm+zy0wZcMFM4hk7EIWF/kvoY9+Wc0DYqepL6TwOBdg142ClSdM6XtFc6ZdTL
         /vsSKFT6HL0lzDCJQnZESuA6ly8ZPSR/C2hGf1L7VrTTAWNZ59+y26HBI7CBCLXFPbvM
         Qq4/9yUg8FlVkMdSsGajvFdBGNbqZJSuRWk2RdakpqE9mmfjB+baYBzca45gSfqNmobG
         kdGeKtx3G6G45AhtI0zPxZ3M/CPJtt3OyhMLDUQD3I7gQWJwqokfmoKbPAheZIzovcIo
         RiFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si2127921qkj.34.2019.09.26.08.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 08:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDVXe-0002yO-Ad
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 11:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDVWt-0002r1-JM
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 11:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDVWn-0004Un-RR
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 11:17:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iDVWm-0004Sb-OM; Thu, 26 Sep 2019 11:17:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 684318E587;
 Thu, 26 Sep 2019 15:17:52 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195F65D6A7;
 Thu, 26 Sep 2019 15:17:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
Date: Thu, 26 Sep 2019 17:17:22 +0200
Message-Id: <20190926151733.25349-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 26 Sep 2019 15:17:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 John Snow <jsnow@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M43y63ORUdts

Hi.

Following the thread discussion between Peter/Markus/Damien about
reset handlers:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
I started to remove qemu_register_reset() calls from few qdevified
devices (the trivial ones).

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (11):
  hw/acpi/piix4: Convert reset handler to DeviceReset
  hw/ide/piix: Convert reset handler to DeviceReset
  hw/isa/piix4: Convert reset handler to DeviceReset
  hw/pci-host/piix: Convert reset handler to DeviceReset
  hw/ide/sii3112: Convert reset handler to DeviceReset
  hw/ide/via82c: Convert reset handler to DeviceReset
  hw/isa/vt82c686: Convert reset handler to DeviceReset
  hw/input/lm832x: Convert reset handler to DeviceReset
  hw/pci-host/bonito: Convert reset handler to DeviceReset
  hw/timer/etraxfs: Convert reset handler to DeviceReset
  hw/misc/vmcoreinfo: Convert reset handler to DeviceReset

 hw/acpi/piix4.c          |  7 +++----
 hw/ide/piix.c            |  8 +++-----
 hw/ide/sii3112.c         |  7 +++----
 hw/ide/via.c             | 10 ++++------
 hw/input/lm832x.c        | 12 +++++-------
 hw/isa/piix4.c           |  7 +++----
 hw/isa/vt82c686.c        | 11 ++++-------
 hw/misc/vmcoreinfo.c     |  5 ++---
 hw/pci-host/bonito.c     |  8 +++-----
 hw/pci-host/piix.c       |  8 +++-----
 hw/timer/etraxfs_timer.c |  7 +++----
 11 files changed, 36 insertions(+), 54 deletions(-)

--=20
2.20.1

