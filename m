Received: by 10.25.159.131 with SMTP id i125csp1771651lfe;
        Mon, 5 Dec 2016 13:47:00 -0800 (PST)
X-Received: by 10.55.47.69 with SMTP id v66mr49920886qkh.209.1480974420465;
        Mon, 05 Dec 2016 13:47:00 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h94si9910778qtd.16.2016.12.05.13.47.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7301AC054910;
	Mon,  5 Dec 2016 21:46:59 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKU019596;
	Mon, 5 Dec 2016 16:46:55 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 00/15] arm/arm64: add ITS framework
Date: Mon,  5 Dec 2016 22:46:31 +0100
Message-Id: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 05 Dec 2016 21:46:59 +0000 (UTC)
X-TUID: RvHSXtcIij7U

This series proposes a framework to test the virtual ITS.
This is based on Drew's v7 series [1]. The last patch tests
several ITS commands (collection/device mapping, interrupt
translation service entry creation and LPI trigger through INT
command). At this point we don't use any external PCIe device
to write into the GITS_TRANSLATER register.

The bulk of the code derives from the ITS driver code so all
the credit is due to Marc.

Many other ITS commands could be tested. Also existing MMIO
accesses could be enhanced into standalone tests. Current focus
was to make it functional.

The code deserves more cleanup with respect to cacheability
attributes in general.

Tested on Cavium ThunderX [2].

Best Regards

Eric

[1] [kvm-unit-tests PATCH v7 00/11] arm/arm64: add gic framework

[2] sample command line:

$QEMU -machine virt,accel=kvm -cpu host \
 -device virtio-serial-device \
 -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
 -display none -serial stdio \
 -kernel arm/gic.flat \
 -smp 8 -machine gic-version=3 -append 'its'

Eric Auger (15):
  libcflat: Add other size defines
  arm/arm64: gicv3: Add some re-distributor defines
  arm/arm64: ITS skeleton
  arm/arm64: ITS: BASER parsing and setup
  arm/arm64: GICv3: add cpu count
  arm/arm64: ITS: Set the LPI config and pending tables
  arm/arm64: ITS: Init the command queue
  arm/arm64: ITS: enable LPIs at re-distributor level
  arm/arm64: ITS: Parse the typer register
  arm/arm64: ITS: its_enable_defaults
  arm/arm64: ITS: create device
  arm/arm64: ITS: create collection
  arm/arm64: ITS: commands
  arm/arm64: gic: Generalize ipi_enable()
  arm/arm64: ITS test

 arm/Makefile.common        |   1 +
 arm/gic.c                  | 101 +++++++++++-
 lib/arm/asm/gic-v3-its.h   | 238 +++++++++++++++++++++++++++
 lib/arm/asm/gic-v3.h       |  84 ++++++++++
 lib/arm/asm/gic.h          |   1 +
 lib/arm/gic-v3-its-cmd.c   | 399 +++++++++++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c       | 305 ++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3.c           |   2 +
 lib/arm/gic.c              |  30 +++-
 lib/arm64/asm/gic-v3-its.h |   1 +
 lib/libcflat.h             |   3 +
 11 files changed, 1154 insertions(+), 11 deletions(-)
 create mode 100644 lib/arm/asm/gic-v3-its.h
 create mode 100644 lib/arm/gic-v3-its-cmd.c
 create mode 100644 lib/arm/gic-v3-its.c
 create mode 100644 lib/arm64/asm/gic-v3-its.h

-- 
2.5.5
