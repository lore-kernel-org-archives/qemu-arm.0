Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4293843wrv;
        Mon, 15 Jul 2019 08:22:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxu7OCXWManIASdLrXYRDSyIKvA7kVkkFpE39n0V+TZLiSxBrWcsAuKvHUK4/kWypidNVkg
X-Received: by 2002:a37:490d:: with SMTP id w13mr16131416qka.179.1563204155656;
        Mon, 15 Jul 2019 08:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563204155; cv=none;
        d=google.com; s=arc-20160816;
        b=VU4mrqDcN2/ERxDefsr6C2xwwDWz2SwHla8Ark14z/zd8k5otWdgAEErpDPTqtxl3y
         uVarOzjntBg8stdjxMw686pPvnelr3v6o+nG1DIaG6JETo6AQpEYjC9DXD833+R7ZDAd
         Gz+hz9Op/ahCRAxq72EQwfmncoOfcrFFAAwMNIsWfTXT8dDSpB2miTLf7ma4wZmj5wBf
         wAVWpnNRe8ks/+ekZlXFRx92gBJ5rvJrQKRISqRC30NwJ3Mx3dxRE5buE4neHWW027w/
         s/g9LRhONY2oZ9RW+dL4v3APCd6Nvxfp2z8/r6B+B4Cd/WT9ChOMrd1o3PgiuKm/5Tb4
         0Brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=PjSHW3XbCWe5g3fgCaX/P2uu+QqvoNeQiZFWe71ICv0=;
        b=GuvqAJgMz8sBCv1tN5El4rPpj9LqfO1mOhJzchDYwY7BLjzo7sEXhTVFybDQS0diVR
         KFgLqFujx6DsVxnZ2NkfKkFb8EpjUGupjBGTOLhMIZMeTXsg857Mo9+kmOUTgUFFVDwj
         h+tYELKREYEx9mp1Wc9iYvoD5seVgrjusGxuv2TQ+o+Pt4bHd/HgSUa8ASxOUWfF4VLQ
         s7xRK/V6kFHEEE4AOe1Xfo/G+IPM7asZ8t/2mrtAd6Q9tyAJUHiOdupR7E/T2TWvUnhW
         skYe8uPoyxLbdrNJfjyAkoDsyhZNismNAVUvc5x8apsjVnq7keReKGqWm5RbmoOqhx30
         7HQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y123si10229851qkd.205.2019.07.15.08.22.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96E9F308FE8D;
	Mon, 15 Jul 2019 15:22:34 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEA6A6085B;
	Mon, 15 Jul 2019 15:22:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	James Hogan <jhogan@kernel.org>,
	qemu-arm@nongnu.org,
	James Hogan <james.hogan@mips.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH-for-4.1? v2 0/5] semihosting: Build with CONFIG_SEMIHOSTING disabled
Date: Mon, 15 Jul 2019 17:22:20 +0200
Message-Id: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 15:22:34 +0000 (UTC)
X-TUID: 3fTlFc4NfqGy

Amusingly Miroslav and myself hit this issue at the same time.

Note now that "config-devices.h" exists (commit 6c22ea9d83) I could use
#include "config-devices.h" to implement Alex's suggestion to avoid a stub:
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03607.html

Some know (arch-specific) limitations are:

- MIPS ITU is accessed by coprocessor instr (ISA feature)
- MIPS timer is accessed by coprocessor instr (ISA feature)
- MIPS semihosting (ISA feature?)
- ARM semihosting (ISA feature?)
- ARMv7 NVIC (device)

This series attempt to fix this the most trivial way, adding
stubs for unreachable code.

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg07267.html
- Always enable semihosting on linux-user

$ git backport-diff -u v1
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only (new)
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/5:[down] 'target/arm: Always enable CONFIG_SEMIHOSTING'
002/5:[down] 'target/mips: Always enable CONFIG_SEMIHOSTING'
003/5:[down] 'hw/semihosting: Allow this feature to be disabled'
004/5:[0004] [FC] 'target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled'
005/5:[0005] [FC] 'target/mips: Add stubs to build with CONFIG_SEMIHOSTING disabled'

Philippe Mathieu-Daudé (5):
  target/arm: Always enable CONFIG_SEMIHOSTING
  target/mips: Always enable CONFIG_SEMIHOSTING
  hw/semihosting: Allow this feature to be disabled
  target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled
  target/mips: Add stubs to build with CONFIG_SEMIHOSTING disabled

 default-configs/aarch64-linux-user-common.mak |  4 ++++
 default-configs/aarch64-linux-user.mak        |  2 ++
 default-configs/aarch64_be-linux-user.mak     |  2 ++
 default-configs/arm-linux-user-common.mak     |  4 ++++
 default-configs/arm-linux-user.mak            |  2 ++
 default-configs/arm-softmmu.mak               |  4 +++-
 default-configs/armeb-linux-user.mak          |  2 ++
 default-configs/mips-linux-user-common.mak    |  4 ++++
 default-configs/mips-linux-user.mak           |  2 ++
 default-configs/mips-softmmu-common.mak       |  2 +-
 default-configs/mips64-linux-user.mak         |  2 ++
 default-configs/mips64el-linux-user.mak       |  2 ++
 default-configs/mipsel-linux-user.mak         |  2 ++
 default-configs/mipsn32-linux-user.mak        |  2 ++
 default-configs/mipsn32el-linux-user.mak      |  2 ++
 hw/semihosting/Kconfig                        |  3 ++-
 target/arm/Makefile.objs                      |  3 ++-
 target/arm/arm-semi-stubs.c                   | 21 ++++++++++++++++++
 target/mips/Makefile.objs                     |  3 ++-
 target/mips/mips-semi-stubs.c                 | 22 +++++++++++++++++++
 20 files changed, 85 insertions(+), 5 deletions(-)
 create mode 100644 default-configs/aarch64-linux-user-common.mak
 create mode 100644 default-configs/arm-linux-user-common.mak
 create mode 100644 default-configs/mips-linux-user-common.mak
 create mode 100644 target/arm/arm-semi-stubs.c
 create mode 100644 target/mips/mips-semi-stubs.c

-- 
2.20.1
