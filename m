Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1887775lfb;
        Thu, 21 May 2020 12:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw++acCrfPyGzxynS1Qhf1TMd4MYb09ox+z77Yt5qtuL+Eq+frtKldGiZMZ6f3MCAoj6mZY
X-Received: by 2002:a25:4455:: with SMTP id r82mr18781699yba.213.1590091164682;
        Thu, 21 May 2020 12:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091164; cv=none;
        d=google.com; s=arc-20160816;
        b=XSYnKlCOldIJt/ljupfKFVLmyUhxggBKRHOlRRRLhgz+CCNyWLW8YbXCcCkzgNeBuT
         Ioz4myb4/aQ4mvLCE5NdlHFmXZdrqYD/e1EKEEfObYQVi4xJ6MxCANIF06vW/bNvsPEq
         8iYioPBWqqNTlc9ktGEl5VoSYOxAO6Q+P9kP8IH3ndmR6hi+/rrQPQQGUuCTjnuJwUSv
         5YVKiXsANI0YwGenxnehn7QxZpJQ1emmHxbKhA8JQ4XCZIjxBS5JSqioyXcojGFAws8v
         ZCzKJN/RrRXQVAL1xS+De4hDTS5+SctRZJLqliB/V8zpPanQZGRhXBZIbOm3xO+8AkRo
         d7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=guRcykgqBUf/uuxJ52t2kwsJO8KdY5hMp8f0NDASSU0=;
        b=jy56xI3j8vLk/sYp8TKYxEM/D1h7jq1q2tuZC4Nm/RjXI41/UVYzz/W7GacENJAVZw
         h4dHFPqTB7G7K0PTSEnWTc5hper9hPTYHXh4kisfI44LD4jxUGCFryVEJ4yaAEf/jP+t
         UdBOOUooZ11UabXr5+0EWNRlwaiAPJMlDk12GsIg/IpPTe+06GpHPg5uwm0D69ANQ1DF
         ZjShAfegT1BQAAyJ24g0eP7WzFg8KLMgC4B9m8FgtZOSwha/tE4Qr4+Hq0mDtvebCUSs
         dcJsa/WO9B446EvV8mwNm0yTFraLHoI5zmqQSeXegueonjRx+jGBWS0bb6gpRvUtyx4o
         vubA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QtdiZID7;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id j142si1980133ybj.36.2020.05.21.12.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QtdiZID7;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=guRcykgqBUf/uuxJ52t2kwsJO8KdY5hMp8f0NDASSU0=;
	b=QtdiZID7766kibU6lUOXH9rhJs/d2RbJkY1h7nTIv33r5UrG8b8I6L7Ztrh6XUHXq4t/5M
	X9X8JfGeQRHdN6UKeX5LC5i0D3yEpX3HlAqm+hw2huCh8lztfisnmbntR7JXr2sSVrjGPW
	iSA5p0Zec9+LGbw1DG0nwsR/0ROdNOQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-cLZvCdOjOrK2bqh0sLCOsQ-1; Thu, 21 May 2020 15:59:16 -0400
X-MC-Unique: cLZvCdOjOrK2bqh0sLCOsQ-1
Received: by mail-wm1-f71.google.com with SMTP id j132so1528146wma.8
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=guRcykgqBUf/uuxJ52t2kwsJO8KdY5hMp8f0NDASSU0=;
        b=QE++DDiqFsok7KMZL4rnyBAELxt6H7eJbJyudpq5wjudRkIFvys3rcWe3smIFGDZFU
         td7tVUesta4hVL5wmQtRwcoGo5CRjHvdlX3Oreh4CGEb22g656mrUVeTNHEiMSsiHCY6
         omnYBcvemFc7XH/K4mW4p6cu3B5WrvsB7n39hcFXe20YB6Y/djZvfGjzXYpzj4qzTDJj
         9dbkvt9qJyhKjx+GowHwfDFGWuBlKRggmj0KXaGB8AXRWyqeSX1oDhztflPyc8+wZF8p
         b4YENGR2mN1C2/4DNH7PP1z3yhkNuPixVBMjR6cq9uTgc4WanMUddjWjWpykIO+aNa5K
         AGHw==
X-Gm-Message-State: AOAM531VX0iEpndewtFOWytAbdXY1TCqxyxgdzEX8ekYJh0ObSC2ebin
	R/omsm4Dwv421OcfErifC/dSjj2MMJn9PAXP9wlh2KFKkENSqlCrfAKVZUUF/8fuqhqRyS5nBEq
	ILQ1TB2p+40cNmqEW
X-Received: by 2002:adf:8041:: with SMTP id 59mr215551wrk.278.1590091155004;
        Thu, 21 May 2020 12:59:15 -0700 (PDT)
X-Received: by 2002:adf:8041:: with SMTP id 59mr215534wrk.278.1590091154541;
        Thu, 21 May 2020 12:59:14 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id e21sm7338181wme.34.2020.05.21.12.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 00/11] accel: Allow targets to use Kconfig, disable semihosting by default
Date: Thu, 21 May 2020 21:59:00 +0200
Message-Id: <20200521195911.19685-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: WF3cVwbJ2eCy

Missing review: patch #9 'rules.mak: Add base-arch rule'
and patch #11 'semihosting: Make the feature depend of TCG'

This series include generic patches I took of the KVM/ARM
specific series which will follow.

- List orphan accelerators in MAINTAINERS
- Add accel/Kconfig
- Allow targets to use their how Kconfig
- Enforce semihosting on architecture where required,
  disable it elsewhere

Since v2:
- Addressed Thomas review comments
- Fixed problem when including TARGET instead of BASE_TARGET

Since v1:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
- Drop HVF MAINTAINERS patch (merged elsewhere)
- Kconfig-select SEMIHOSTING (bonzini)
- Drop user-mode selection patches
- consider m68k/nios2/xtensa/riscv (pm215)
- reword Kconfig SEMIHOSTING description (pm215)
- reset some of rth R-b tags

Previous RFC for semihosting posted earlier:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg631218.html

$ git backport-diff -u v2 -r v3
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/11:[----] [--] 'MAINTAINERS: Fix KVM path expansion glob'
002/11:[0002] [FC] 'MAINTAINERS: Add an 'overall' entry for accelerators'
003/11:[----] [-C] 'MAINTAINERS: Add an entry for the HAX accelerator'
004/11:[----] [--] 'accel/tcg: Add stub for probe_access()'
005/11:[----] [--] 'Makefile: Remove dangerous EOL trailing backslash'
006/11:[----] [--] 'Makefile: Write MINIKCONF variables as one entry per line'
007/11:[----] [--] 'accel/Kconfig: Extract accel selectors into their own config'
008/11:[----] [--] 'accel/Kconfig: Add the TCG selector'
009/11:[down] 'rules.mak: Add base-arch() rule'
010/11:[0002] [FC] 'Makefile: Allow target-specific optional Kconfig'
011/11:[0014] [FC] 'hw/semihosting: Make the feature depend of TCG, and allow to disable it'

Philippe Mathieu-Daudé (11):
  MAINTAINERS: Fix KVM path expansion glob
  MAINTAINERS: Add an 'overall' entry for accelerators
  MAINTAINERS: Add an entry for the HAX accelerator
  accel/tcg: Add stub for probe_access()
  Makefile: Remove dangerous EOL trailing backslash
  Makefile: Write MINIKCONF variables as one entry per line
  accel/Kconfig: Extract accel selectors into their own config
  accel/Kconfig: Add the TCG selector
  rules.mak: Add base-arch() rule
  Makefile: Allow target-specific optional Kconfig
  hw/semihosting: Make the feature depend of TCG, and allow to disable
    it

 Makefile                                | 15 +++++++++++----
 default-configs/arm-softmmu.mak         |  1 -
 default-configs/lm32-softmmu.mak        |  2 --
 default-configs/m68k-softmmu.mak        |  2 --
 default-configs/mips-softmmu-common.mak |  3 ---
 default-configs/nios2-softmmu.mak       |  2 --
 default-configs/xtensa-softmmu.mak      |  2 --
 rules.mak                               | 16 ++++++++++++++++
 accel/stubs/tcg-stub.c                  |  7 +++++++
 Kconfig.host                            |  7 -------
 MAINTAINERS                             | 19 ++++++++++++++++++-
 accel/Kconfig                           |  9 +++++++++
 hw/semihosting/Kconfig                  |  4 +++-
 target/arm/Kconfig                      |  2 ++
 target/lm32/Kconfig                     |  2 ++
 target/m68k/Kconfig                     |  2 ++
 target/mips/Kconfig                     |  2 ++
 target/nios2/Kconfig                    |  2 ++
 target/riscv/Kconfig                    |  2 ++
 target/xtensa/Kconfig                   |  2 ++
 20 files changed, 78 insertions(+), 25 deletions(-)
 create mode 100644 accel/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/xtensa/Kconfig

-- 
2.21.3
