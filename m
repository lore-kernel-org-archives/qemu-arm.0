Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp156813wru;
        Fri, 3 Aug 2018 07:47:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdONrWRs4W4r2JvwZFo/qXV213I898enPsaKy3Nu6C9hSXZ1a0EAp6Bqccn2Dpg370ftwVA
X-Received: by 2002:a37:9185:: with SMTP id t127-v6mr3995926qkd.182.1533307670833;
        Fri, 03 Aug 2018 07:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307670; cv=none;
        d=google.com; s=arc-20160816;
        b=RhK0oqm8ivsVWX57Eh3+rlJxwhcyhV7lpy6d9UPF3RtZxfEaYxRJGsE/lL3CZVrP0+
         /a4+0K41eprVJIpLcxWP+0956aykER7RxoY6fad4gTGN3HldS1sObOnDVd6z8B9G4cAP
         JTT6wjAWAC4YgxW4kxvZD7LAJChrEZnkZGYKVW9mmWjCx+GgrabOXla5hHHmVKHBoQfe
         rBI5G2fNSHRABQqZgJz/uJtkKIaQsKb77Cvtaa12Of1d99inkfE0teqsN6/8QsXHCZHS
         dmOTGg+0vIPmpyGsMxgVvLGTd3G1msid1JnZYxEsYrKxZPwcMhQSWV4NLBCnfee7jnNU
         dDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=bhnj24KpadVZGULkrvEkbdU/cyMtIJouJZXoWpozAh4=;
        b=OIHnkK1zTQoVSWW+SIi2zQHB9KqrLMJc/KuDBu0RN1OsJ4zBI9O2gSdRwy2rGxjRCo
         9UfkNZjwVy1b3PH4oQGodvf+ZF3hMe8tuaN5AH9y8773HKHK9A5ElVwmz0xFA3dYUw6+
         5QMVQka8/lDwgvCzSWIoCewLi5WkThSjxcwNf+j4fJ+po2BoEAtuJS3SsUC4ubgfEHtA
         6FUhWFHuegQwvtHIZ0OIbJqrN4owuigxcAPgk0+hF4/1O74Qxc1577sCVcf8ESPxCLqx
         0EkpnhSs8/h6LGirJ9kwP8emvCIytH4WhES/hoom6D/yAUWo8EtwamcQ2J4vy2XIfr2x
         fQDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c30-v6si321570qtb.377.2018.08.03.07.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbMs-0002iI-A1
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:47:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMc-0002hl-MM
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMY-0007bS-OA
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56200 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMY-0007az-Hh; Fri, 03 Aug 2018 10:47:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13DC640216F9;
	Fri,  3 Aug 2018 14:47:29 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E67E57C34;
	Fri,  3 Aug 2018 14:47:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:15 +0100
Message-Id: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 03 Aug 2018 14:47:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 03 Aug 2018 14:47:29 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 0/6] arm: add Cortex M0 CPU model and hex file
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
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8NQL/L8gidHh

v4:
 * Drop ARMv7MState to ARMMProfileState rename because it causes a lot of code
   churn and is incomplete.  Other parts of QEMU (like NVIC emulation) still
   refer to "v7m" although they apply to other architecture versions too.
   [Peter]
 * Use the generic loader device (-device loader,file=program.hex,cpu-num=1)
   instead of -kernel.  -kernel is a legacy command-line option that is kept as
   a convenience, but it's not as flexible or predictable as the generic loader
   device.  New image formats should be added to the generic loader device.
   [Peter]
 * Use hex/ASCII literals instead of decimal literals in hexloader-test.c.
   This makes the test case slightly easier to understand. [Philippe]
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
 * Makes bitbanding optional on ARMv7MState.
 * Adds a "cortex-m0" cpu type which can be used with ARMMProfileState.  This
   works thanks to Julia's Cortex M0 emulation patches, which are now all
   merged.
 * Adds Su Hang's Intel HEX file format loader so that micro:bit and other
   microcontroller firmware images can be run using -kernel.  The micro:bit
   development tools typically only emit .hex files and not ELFs.

Stefan Hajnoczi (4):
  hw/arm: make bitbanded IO optional on ARMv7-M
  target/arm: add "cortex-m0" CPU model
  loader: extract rom_free() function
  loader: add rom transaction API

Su Hang (2):
  loader: Implement .hex file loader
  Add QTest testcase for the Intel Hexadecimal

 MAINTAINERS                          |   6 +
 configure                            |   4 +
 tests/Makefile.include               |   2 +
 include/hw/arm/armv7m.h              |   2 +
 include/hw/loader.h                  |  31 +++
 hw/arm/armv7m.c                      |  37 ++--
 hw/arm/mps2.c                        |   1 +
 hw/arm/msf2-soc.c                    |   1 +
 hw/arm/stellaris.c                   |   1 +
 hw/arm/stm32f205_soc.c               |   1 +
 hw/core/generic-loader.c             |   4 +
 hw/core/loader.c                     | 296 ++++++++++++++++++++++++++-
 target/arm/cpu.c                     |  11 +
 tests/hexloader-test.c               |  60 ++++++
 tests/hex-loader-check-data/test.hex |  12 ++
 15 files changed, 443 insertions(+), 26 deletions(-)
 create mode 100644 tests/hexloader-test.c
 create mode 100644 tests/hex-loader-check-data/test.hex

-- 
2.17.1

