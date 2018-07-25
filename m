Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp464628wru;
        Wed, 25 Jul 2018 02:00:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpexf8lnuDtsH+VqNQssISW5E1VX8sKbVrCvPRTiZN+5CREumwXWIfL8abG21lpd0qEI4iZK
X-Received: by 2002:ac8:7319:: with SMTP id x25-v6mr19617406qto.375.1532509200892;
        Wed, 25 Jul 2018 02:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509200; cv=none;
        d=google.com; s=arc-20160816;
        b=pjHqoYVhq2U3zJiEGRX5fazxUoK/AXANglqMbT8zaSSo3jcoogMVRXGOCWNuu8DSII
         UUHl/DNfR3z8ddEDLr03lrCFw9KctOJrX0htf8g8880u7fLCuhzxx3tvquYthxbqyPAG
         xnLZKTec2EC8sitXxzCXS8EXC5i6gTdOMuOdqWOFu4/aM3ho3m3F82o3nlTzI7Y11S8r
         9s5lcwmRHod6Akqb+7KscTavxQQyT5QazTx4CffsJLf1aFEWnAM24YMGWTaBU6Q3JaJY
         fvXbruXIZijS+RpJOmTIRfVx7SQPP+lQeHMxpfnj3oukmDmrvIPM6mLX/MyC5z8mTNa9
         RXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=ARTWFM4+2nXvae97tfR+OiRlM7LRLHCbLlV2+Z9XiPE=;
        b=IdD5reKTjzH/aBU/esQ/MTb6pQ+i9SVNjDhbtPlL7ecTNxNgfopw0n+kzKD0zKuwp/
         2aldHX3bXaFJGirp4pvCIb7g+Nh67mBI7i8lpOk7pOCQZ7cnkxhajWqjC/3bmKtV1Ssg
         MpJCFMTJfTY1AeJ/tFKmbg8pTUByUjvsbIdRLSYbQjw37Vud/tmrcLe24ZcNe90OwHW/
         hIoJ2B2EpehIuzP0OgWFzJQd5hHjPboFuASwZkF03wyr4Dwyf8LXA4+krEzGjR1FY/LY
         50Mu92BVFqZwSLxLxqR8k+WOEBSNWySvxl/lCekRWJMi7cILWRchoTfvflko6f08F4fR
         8d0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v36-v6si3596536qvc.168.2018.07.25.02.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFeK-00085F-CO
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:00:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeB-0007zn-T7
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 04:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFe8-0001oN-VM
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 04:59:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33678 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fiFe8-0001m3-PU; Wed, 25 Jul 2018 04:59:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 552F2401EF0C;
	Wed, 25 Jul 2018 08:59:47 +0000 (UTC)
Received: from localhost (ovpn-117-157.ams2.redhat.com [10.36.117.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BDED2026D68;
	Wed, 25 Jul 2018 08:59:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2018 09:59:37 +0100
Message-Id: <20180725085944.11856-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 25 Jul 2018 08:59:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 25 Jul 2018 08:59:47 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 0/7] arm: add Cortex M0 CPU model and hex file
 loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3/xrHFcRI8B4

v3:
 * Rename ARMv7MState to ARMMProfileState so a single class can cater for
   ARMv6-M, ARMv7-M, and ARMv8-M [Peter]
 * Make bitbanding optional via a qdev property [Peter]
 * Add hex file loader patches to reduce dependencies in upcoming patch series
 * Implement rollback if hex file loader fails partway through [Peter]
 * Update hex file loader test case to use an ARMv7-M board since hex file
   loading is only done for ARM M Profile boards

This series contains the prerequistes for the "microbit" machine type that Joel
Stanley has written.  I have combined the Cortex M0 CPU model and hex loader
work into one series to reduce the dependencies in upcoming patch series from
Joel, Julia, and Steffen.

This patch series:
 * Renames ARMv7MState to ARMMProfileState since it's already used for ARMv8-M
   and soon ARMv6-M.
 * Adds a "cortex-m0" cpu type which can be used with ARMMProfileState.  This
   works thanks to Julia's Cortex M0 emulation patches, which are now all
   merged.
 * Adds Su Hang's Intel HEX file format loader so that micro:bit and other
   microcontroller firmware images can be run using -kernel.  The micro:bit
   development tools typically only emit .hex files and not ELFs.

Stefan Hajnoczi (5):
  hw/arm: rename armv7m_load_kernel()
  hw/arm: rename TYPE_ARMV7M to TYPE_ARM_M_PROFILE
  hw/arm: make bitbanded IO optional on ARM M Profile
  target/arm: add "cortex-m0" CPU model
  loader: add rom transaction API

Su Hang (2):
  loader: Implement .hex file loader
  Add QTest testcase for the Intel Hexadecimal

 MAINTAINERS                                  |   6 +
 configure                                    |   4 +
 hw/arm/Makefile.objs                         |   2 +-
 tests/Makefile.include                       |   2 +
 include/hw/arm/{armv7m.h => arm-m-profile.h} |  39 ++-
 include/hw/arm/arm.h                         |  11 +-
 include/hw/arm/iotkit.h                      |   4 +-
 include/hw/arm/msf2-soc.h                    |   4 +-
 include/hw/arm/stm32f205_soc.h               |   4 +-
 include/hw/loader.h                          |  31 ++
 hw/arm/{armv7m.c => arm-m-profile.c}         |  99 ++++---
 hw/arm/iotkit.c                              |   2 +-
 hw/arm/mps2-tz.c                             |   4 +-
 hw/arm/mps2.c                                |  11 +-
 hw/arm/msf2-soc.c                            |   3 +-
 hw/arm/msf2-som.c                            |   4 +-
 hw/arm/netduino2.c                           |   4 +-
 hw/arm/stellaris.c                           |   8 +-
 hw/arm/stm32f205_soc.c                       |   3 +-
 hw/core/loader.c                             | 280 +++++++++++++++++++
 target/arm/cpu.c                             |  11 +
 tests/hexloader-test.c                       |  56 ++++
 default-configs/arm-softmmu.mak              |   1 +
 tests/hex-loader-check-data/test.hex         |  12 +
 24 files changed, 522 insertions(+), 83 deletions(-)
 rename include/hw/arm/{armv7m.h => arm-m-profile.h} (64%)
 rename hw/arm/{armv7m.c => arm-m-profile.c} (76%)
 create mode 100644 tests/hexloader-test.c
 create mode 100644 tests/hex-loader-check-data/test.hex

-- 
2.17.1

