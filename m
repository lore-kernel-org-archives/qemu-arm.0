Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp397508wrq;
        Wed, 13 Jun 2018 01:42:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJHcikVVBX9NnjX8pBD501g5aPepvBXFCcHwM9xHIyqNoZJOT7Y1uWS/WyKk32omUhPtIC6
X-Received: by 2002:aed:2448:: with SMTP id s8-v6mr3680734qtc.336.1528879324060;
        Wed, 13 Jun 2018 01:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879324; cv=none;
        d=google.com; s=arc-20160816;
        b=l43Aj+zl28xlI7egVl3+9aIyUWoX/a5Uzp/zspBSepPtPm+G3wboGNtGfBum91W4Sp
         EBe7yZ5/gWnymlstMoIkBGK3qRe7NmYKeFe1sn4u4p0EiofT/KOZUTLFE3+7TvOxNJ42
         EDzBwSfLjNNNmlb+mE0fayV5Q/M0oWpVt1MO2zQZrlm1V3r/ATfTikwufrZD3MtGSz9z
         oDdTEBhZw7a4lS8y8oUwa2lBM7eQ7oxM1yU9DuGOtJ2h97nYKFE5MafFQsx1yIWxHQfd
         +HqOv3GVJA/vFKTxRZ4MQiwfPDjDi74fc/Q0Qr/6A1pgKUMc0ey1fIXoWcub5/uhQB3W
         GpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=/SnrIl+XFMKCC/FXFMCbiY2n5q2hfgqxyDz6uX6MRNo=;
        b=KTU0xzKye+RN9AXrzGsoUkeGmDPMdG25oGjiuE/MSDRogizwVSct2wcMuLPOpftLa/
         ZVVO/iUA7s1z65raCaM/HcGP+CXJcGVekHixGkL/iC2ox4SHV2IpLORThAqDqdtMTMob
         Ewu4tAackXfSFvyQXv71mZ3GZt+LxN1rzcEBduSD5v7tXXLp5JFQZwYISWKqww/BZt1W
         XzSHMC5mYoKCZ55KiC4xYrA2fUB/g8ayCGhhx1vXS+3OS9zavD+1lwfXCudZkp6r0RUT
         R9nS2cJDLRySJn0+6zXHAcCvRoieF8GnZxTAZuoyT3G4xoJLbuG/557mH5xhIDyBKdN6
         t86Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x25-v6si516541qtm.155.2018.06.13.01.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Lv-0005gl-Hh
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:42:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT1Lm-0005gX-I9
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT1Lj-000163-F9
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:41:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46398 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fT1Lj-00015n-A1; Wed, 13 Jun 2018 04:41:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F9A6818BAF3;
	Wed, 13 Jun 2018 08:41:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6A0420244E0;
	Wed, 13 Jun 2018 08:41:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1AC5011AB8; Wed, 13 Jun 2018 10:41:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 10:41:46 +0200
Message-Id: <20180613084149.14523-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 08:41:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 08:41:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 0/3] ramfb: simple boot framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XdFK98WtGINf

  Hi,

So, the first ramfb bits should be ready for merge.  This series
includes the ramfb core support bits, the ramfb standalone device
and vfio-pci-ramfb device for vgpu boot display support.

If you want play with it I recommend getting the bits from

	https://www.kraxel.org/cgit/qemu/log/?h=sirius/ramfb

because they come with an updated seabios and a new vgabios rom and an
experimental OVMF build.  Firmware patches are here:

	https://www.kraxe.org/cgit/seabios/log/?h=ramfb
	https://github.com/kraxel/edk2/commits/ramfb

They should land upstream soon.

cheers,
  Gerd

Gerd Hoffmann (3):
  hw/display: add ramfb, a simple boot framebuffer living in guest ram
  hw/display: add standalone ramfb device
  hw/vfio/display: add ramfb support

 include/hw/display/ramfb.h    | 12 ++++++
 include/hw/vfio/vfio-common.h |  2 +
 hw/arm/sysbus-fdt.c           |  7 ++++
 hw/arm/virt.c                 |  2 +
 hw/display/ramfb-standalone.c | 62 ++++++++++++++++++++++++++++
 hw/display/ramfb.c            | 95 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c             |  2 +
 hw/i386/pc_q35.c              |  2 +
 hw/vfio/display.c             | 10 +++++
 hw/vfio/pci.c                 | 15 +++++++
 hw/display/Makefile.objs      |  3 ++
 11 files changed, 212 insertions(+)
 create mode 100644 include/hw/display/ramfb.h
 create mode 100644 hw/display/ramfb-standalone.c
 create mode 100644 hw/display/ramfb.c

-- 
2.9.3

