Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2208480lfe;
        Sat, 21 Mar 2020 07:41:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtb+iSMPBKHMJELa/1xiRuFg3Wbv6Ij+dAmPoYEcecpcn+4/NPf7O8Kc3FsR1Xjg6W/LrNV
X-Received: by 2002:ac8:1198:: with SMTP id d24mr13539776qtj.105.1584801703913;
        Sat, 21 Mar 2020 07:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801703; cv=none;
        d=google.com; s=arc-20160816;
        b=hpn33P30NHWNwziyLRVmLfHza011/+vXJ9uWM4yM3AK5Zqhoz1KV0KueAtUgQMWtDV
         DzxcsZpq7dyVY4n5QKZTt6qSQNwvCErs8j4IsgjaA9T3JIfvZws+kqZ3lifLhSXVgHyw
         aog0hGj0yflaQ1VxkM0ZqEsVmHrZlN2WerWnOA+m1Z1UMnJLaXuSjO1xeJx8fGWlEvq9
         tiwb26NRuIzecs0XrDgwfoF7CG7VbYwTQa3MpgqOzHthbblsZEK2oOv1BLttD7zsfrHR
         2vlItq7YBuVyoa049L6xtsgWkOBYuwUl0YjbG9NZc1ESK6v4iVxYeIVmPR/fmoRqaG7g
         MdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=XjYHy8EAEyVWWAj6PcQzbMtUCcBiHqB3U8PD6B93nsg=;
        b=Ln35rakl/yjcsSdpoiWtxMirybE4r0M4nONoqdRY7zEGWP6zG1EejZXLrS4o+Aiifw
         tg4rL54kwIcJbh33MQNdyraqgb2Esj47NDqDRFXTboZhY8AR7ZueR3he6NmefGb4doko
         oXVSvhePrEUI0tddEbheCI5xQ9jksYQRrv4uEn8F9Gv4k5AkqG+vLn7BESDQQ5jzZ6ae
         eGldO6XmBp7N9lVdCN4KhE422j/Dh9nmBzJEkyK9/AJnIdNVrGK5uxIUt8Lw+rmJiL6U
         B0rAkT91TQUM18FvdzhfaYluGTbf9h+wbjzW/4r/it2FzBK/xJByzSk8gFikPl0VVLOY
         7K6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ht6oJzxn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22si5532838qto.284.2020.03.21.07.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ht6oJzxn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfJn-0004k0-8J
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJQ-0004Mo-Tq
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJQ-00079j-07
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:20101)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJP-000794-Rv
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XjYHy8EAEyVWWAj6PcQzbMtUCcBiHqB3U8PD6B93nsg=;
 b=ht6oJzxnbO6vMBXePrRNQ0+z8xRRsr9mST6gEMwbH5CXnIE/vQLXI7MUkNoVCvInohfFZt
 tZa4n205S4U15AayTuBP+CthUoNFfqyudgduOsrlU/us4UL2eGH4r2RzMLs6BzwK8u8lM3
 0J0qrZHnqoHWg0YV4mg+PQK4WPENVZY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-nkaOqY40MRyFlQ_330QRxw-1; Sat, 21 Mar 2020 10:41:15 -0400
X-MC-Unique: nkaOqY40MRyFlQ_330QRxw-1
Received: by mail-wr1-f70.google.com with SMTP id d17so4369067wrw.19
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXdFqIF/MgdCDNguoL8cH2BaYWlik8rbXVsmqvrTHJE=;
 b=FDv9NuOx7Eduu1cWTBKIfBX8iij/FdwLdb+mxufwz9EqhSq/9I9bNUNrU7qltBPnDm
 OltauLixtROR8yg1JSZQAmuNnGuYgOVnKhPuZ1yBLFNrSlzc+boXSEJEi9EjdkYeamat
 Cq3yNcs/ez8TGTUPgCZBGZ7xnmJjP85eV7No3Iizcl4Nwg2zFWKxq+jrOQfsMtH1J5/t
 A6sObRo/Bi+zlWV6UvSJEGTL2ghkuKRPLQNGzBPZ9pIrnWieRmZqjR1P9Yj6BIwk1dZp
 waMgapnCl1nJKUgM83jQA1AJIFDG4dKznmhxqGfIQlu+aa8J8Q6zGIBu58+e3ou6glSX
 eH1w==
X-Gm-Message-State: ANhLgQ0j5VIQkDeDuX5uC3sZeWkec3l2D2zDRWjloUsgQd+YdIMoDdPA
 9NIKnQ3wMyZc6WMllNwBXXn4dN9FON0CfIScWQeXzfwkhE3SrSkUiU9Tg/nG0TuaYVQPfKCUUKE
 Q1wIU7RMxqsCH
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr17311420wmh.106.1584801674417; 
 Sat, 21 Mar 2020 07:41:14 -0700 (PDT)
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr17311376wmh.106.1584801674111; 
 Sat, 21 Mar 2020 07:41:14 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id n2sm13181619wrr.62.2020.03.21.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
Date: Sat, 21 Mar 2020 15:40:59 +0100
Message-Id: <20200321144110.5010-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3hTi33OMM8o4

Fix trivial warnings reported by the Clang static code analyzer.

Since v1:
- Addressed Markus/Zoltan/Aleksandar review comments

Philippe Mathieu-Daud=C3=A9 (11):
  block: Avoid dead assignment
  blockdev: Remove dead assignment
  hw/i2c/pm_smbus: Remove dead assignment
  hw/input/adb-kbd: Remove dead assignment
  hw/ide/sii3112: Remove dead assignment
  hw/isa/i82378: Remove dead assignment
  hw/gpio/aspeed_gpio: Remove dead assignment
  hw/timer/exynos4210_mct: Remove dead assignments
  hw/timer/stm32f2xx_timer: Remove dead assignment
  hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
  hw/scsi/esp-pci: Remove dead assignment

 block.c                    | 2 +-
 blockdev.c                 | 2 +-
 hw/gpio/aspeed_gpio.c      | 2 +-
 hw/i2c/pm_smbus.c          | 1 -
 hw/ide/sii3112.c           | 5 +++--
 hw/input/adb-kbd.c         | 6 +-----
 hw/isa/i82378.c            | 8 ++++----
 hw/scsi/esp-pci.c          | 1 -
 hw/timer/exynos4210_mct.c  | 3 ---
 hw/timer/pxa2xx_timer.c    | 1 +
 hw/timer/stm32f2xx_timer.c | 1 -
 11 files changed, 12 insertions(+), 20 deletions(-)

--=20
2.21.1

