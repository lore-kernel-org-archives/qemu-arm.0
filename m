Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp452505wrs;
        Sat, 17 Aug 2019 03:20:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrKcQ8uhhq9vr4LBI9KF1iyByTkCClYAe84x0p5a6/ct9IzIUh+p3cqdyQJlTjY1sVn+3X
X-Received: by 2002:ac8:670a:: with SMTP id e10mr12526415qtp.244.1566037202189;
        Sat, 17 Aug 2019 03:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037202; cv=none;
        d=google.com; s=arc-20160816;
        b=HCeG7DXgesqvNbEdNDdov6GMT7CO3gZ6agRzkbj/VoevOmc/sa9ROiSv7UNFudzXcW
         WesXcOH/fc/w1ZVFJP07dgzErQLggzLiuG8vVo4wIeykJxqcHufKRfjTtUOleom1S6er
         dWeVRntApSdJ4x2mDmGGT69+q16ql8jNEX9XKSnpvL5sz7UIis9pY1ml2LRCulURhPt7
         TlcY9uu9l98UKkDE/DFtxUysPFQgXtXitZT2MrEF0pSgaU+Wo7Wwfi44Fjx/qXRn/QeA
         ZQSuHObvfy2XVGRSGTZLP/4tKMXfIGZmZbkxbycCOzwivJVKezhhl3nlenQOxiKx/EUT
         XWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=5yEc4f/TPy8ZjAunALaJiaxKMpU9PIHFhIpPowlUo74=;
        b=bMvALAgUzSGMq4w9AQm+e8J61Kc4DBeda1lsvCQMjf9W2O1fGQie7NKNxnvPeql4Gf
         enc5blcdHnxmRRqlWkcdW6Z9a9m2w8nbvdubu7t2hOtTKEdfRkGfh1e0cr4L1xnWoRe6
         GiOIwrMnTMwV5CNp+4Of3rYSi1iUQ77BPwjrQoSiE3jgiH90MthbJbZPLmhZtCHd/KPm
         BePC6A61aBF8ef0p0xE8BAgjJ+V4Vt01RlEqEk0P2HotO6J7ol7U5AljL4x9n9SznRv7
         pO/y+IR+q+P1X7CyAI8cBnOCd4CzLKRSI8ou4G3Rl8xkDU5pj9lX0C7abhwcgDbT6oGK
         jXbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h67si5035263qke.108.2019.08.17.03.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvoW-0000hb-Pg
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoF-0000h6-Ib
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoD-0004Ld-VV
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoD-0004KN-QO; Sat, 17 Aug 2019 06:19:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D3EA308FF30;
 Sat, 17 Aug 2019 10:19:40 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B2883BA3;
 Sat, 17 Aug 2019 10:19:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:23 +0200
Message-Id: <20190817101931.28386-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Sat, 17 Aug 2019 10:19:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/8] Kconfig switches
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0N1lUmRSezOF

Here are some more Kconfig patches that clean up the switches of
existing devices and introduce proper config switches for some
other devices that were always enabled before.

v3:
 - Added Philippe's Reviewed-bys
 - The MUSCA and MPS2 switches now also select the "unimplemented" device

v2:
 - Included Philippe's patches to avoid a conflict with XLNX_ZYNQMP
 - Don't rely on indirect dependencies, always "select XYZ" if it is
   adequate
 - Added patch for the generic loader device

Philippe Mathieu-Daud=C3=A9 (3):
  hw/Kconfig: Move the generic XLNX_ZYNQMP to the root hw/Kconfig
  hw/intc: Only build the xlnx-iomod-intc device for the MicroBlaze PMU
  hw/dma: Do not build the xlnx_dpdma device for the MicroBlaze machines

Thomas Huth (5):
  hw/core: Add a config switch for the "register" device
  hw/core: Add a config switch for the "or-irq" device
  hw/core: Add a config switch for the "split-irq" device
  hw/misc: Add a config switch for the "unimplemented" device
  hw/core: Add a config switch for the generic loader device

 hw/Kconfig            |  4 ++++
 hw/arm/Kconfig        | 17 +++++++++++++++++
 hw/core/Kconfig       | 13 +++++++++++++
 hw/core/Makefile.objs |  8 ++++----
 hw/dma/Kconfig        |  1 +
 hw/dma/Makefile.objs  |  1 -
 hw/intc/Makefile.objs |  2 +-
 hw/microblaze/Kconfig |  1 +
 hw/misc/Kconfig       |  3 +++
 hw/misc/Makefile.objs |  2 +-
 hw/pci-host/Kconfig   |  3 ++-
 hw/sparc64/Kconfig    |  1 +
 hw/timer/Kconfig      |  3 ---
 13 files changed, 48 insertions(+), 11 deletions(-)

--=20
2.18.1

