Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1321878lfb;
        Thu, 14 May 2020 05:23:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7i5yx03V2BOypui57zhJoSdT3g+k7jMpV8DCHf3yjEtcox6huYqxhwA30jFqNtczzfM5o
X-Received: by 2002:a37:5fc4:: with SMTP id t187mr4210796qkb.484.1589459038090;
        Thu, 14 May 2020 05:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589459038; cv=none;
        d=google.com; s=arc-20160816;
        b=0NAfe4aVilCEkmpFaNLIDm7B/fvDhf0wnRUz9+88Q6LGERSiTPs/MWbXG36D6LAAX8
         rkl6nOtK1O4V6V97h9++WkDkO/2OVCaVAPPJ0jdr401INqtwwzC/jeGrsQXJtA2y5j5I
         BiRkP1O7q20GK6XCz2APnM4hYm9RLZ7oJHghzDKPfNvSgyKfYkVfC+nke6UWJzuVZlUm
         0Fmrgkzgx3dv9rsc7BVSXdTwBt1tfBibGrxaKIqRAcHhSGWT3araFC1xsri4kRwEGrS+
         DssMFwFraxrXXqnB/h029qNrfnrC9SXFZEKadaAYYu3bPMbR1bOk3UWVftbD56IOXems
         K2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=OSXx1pd9i8Y5I6NQZ91HoamKGyyeKBTre1yI38H3Uos=;
        b=zsVVe1RpviRPvLiBl8EEbzY2ZTCraQZKY1Pm3fR/nuY+ZGh1sEpgFCEwra3CotnbQw
         e4RzPC4looUs0k2pxJj0100kwJPLE+y9UnbibdOea96u1qvjy7yD/5e0k1lmg9T+8r8v
         bBF200/BpYRzcfPhhjNnR4aPRwcBIeRcUd5+MYRYnP0WKb4LHLzZCNTcChKVfoVmkkjE
         IfcWnrW8r6bceJNrYRb6IgoL0bdxJryJB7anXup9glUKOhXiIMsT17RptDhrJ71ZZOlw
         TChtW6F3VAc5meEiRtxQJDwtvWq+Pp6sZfAI29fL1ae7L1VCDMTMBUWhhY1ClCw/MjIX
         WM6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ae9FhKON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a126si1452738qke.136.2020.05.14.05.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ae9FhKON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZCu5-0001e6-Ef
	for alex.bennee@linaro.org; Thu, 14 May 2020 08:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZCtu-0001b4-JM
 for qemu-arm@nongnu.org; Thu, 14 May 2020 08:23:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38078
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZCts-0003YS-87
 for qemu-arm@nongnu.org; Thu, 14 May 2020 08:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589459023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OSXx1pd9i8Y5I6NQZ91HoamKGyyeKBTre1yI38H3Uos=;
 b=Ae9FhKON4NqqWWdFiqy/c30yqXsIdqNrc1CItUQOATdmh/uYIyhip/wCKqkO5nGvMPMtsf
 1mVM9dM6CNcX08T/1it/joGnVt/5+YDTIigTkmjVigRRZua/r+LFCJhzlY4pjPy9NIVCRA
 ZE3tpR+d+JRnyaMsRu8ViF3Ob+Tq9Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-BJNJ-WCyP_ic70yTPueJFw-1; Thu, 14 May 2020 08:23:41 -0400
X-MC-Unique: BJNJ-WCyP_ic70yTPueJFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3127480058A;
 Thu, 14 May 2020 12:23:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4D7E7D928;
 Thu, 14 May 2020 12:23:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9BB1117444; Thu, 14 May 2020 14:23:34 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Usb 20200514 patches
Date: Thu, 14 May 2020 14:23:27 +0200
Message-Id: <20200514122334.25089-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Msex1mPjA6EM

The following changes since commit d5c75ec500d96f1d93447f990cd5a4ef5ba27fae:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2020-05-08-1' into staging (2020-05-12 17:00:10 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/usb-20200514-pull-request

for you to fetch changes up to 8b2b45c506f4d71b831473d8de93b3cedaea4844:

  raspi2 acceptance test: add test for dwc-hsotg (dwc2) USB host (2020-05-13 11:06:37 +0200)

----------------------------------------------------------------
usb: add dwc2 emulation for raspi machines.

----------------------------------------------------------------

Paul Zimmerman (7):
  raspi: add BCM2835 SOC MPHI emulation
  dwc-hsotg (dwc2) USB host controller register definitions
  dwc-hsotg (dwc2) USB host controller state definitions
  dwc-hsotg (dwc2) USB host controller emulation
  usb: add short-packet handling to usb-storage driver
  wire in the dwc-hsotg (dwc2) USB host controller emulation
  raspi2 acceptance test: add test for dwc-hsotg (dwc2) USB host

 tests/acceptance/boot_linux_console.py |    9 +-
 hw/usb/hcd-dwc2.h                      |  173 +++
 include/hw/arm/bcm2835_peripherals.h   |    5 +-
 include/hw/misc/bcm2835_mphi.h         |   44 +
 include/hw/usb/dwc2-regs.h             |  895 ++++++++++++++++
 hw/arm/bcm2835_peripherals.c           |   38 +-
 hw/misc/bcm2835_mphi.c                 |  184 ++++
 hw/usb/dev-storage.c                   |   15 +-
 hw/usb/hcd-dwc2.c                      | 1372 ++++++++++++++++++++++++
 hw/misc/Makefile.objs                  |    1 +
 hw/usb/Kconfig                         |    5 +
 hw/usb/Makefile.objs                   |    1 +
 hw/usb/trace-events                    |   47 +
 13 files changed, 2784 insertions(+), 5 deletions(-)
 create mode 100644 hw/usb/hcd-dwc2.h
 create mode 100644 include/hw/misc/bcm2835_mphi.h
 create mode 100644 include/hw/usb/dwc2-regs.h
 create mode 100644 hw/misc/bcm2835_mphi.c
 create mode 100644 hw/usb/hcd-dwc2.c

-- 
2.18.4

