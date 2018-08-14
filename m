Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4349027wru;
        Tue, 14 Aug 2018 10:53:11 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzJywe0RiDtruoSYTy8ELz3legt09xJpE4R5csy3jjkqr05hMeYgp5Dv7Ih0e5xYK5u6QMo
X-Received: by 2002:a37:5347:: with SMTP id h68-v6mr20261194qkb.21.1534269191829;
        Tue, 14 Aug 2018 10:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534269191; cv=none;
        d=google.com; s=arc-20160816;
        b=IdOd/NFfcTC7bMtWAJ6sgc0EnXtLB1shEyT1AQjKOlpmFkW8NOn2v9ReFsUWmNcFlc
         T510XCCHS+ZYR48c/UL4Ty/HnvUSur6gcwdk1GVxtDNa4CvjpQfpgJQtuJS2NE6ORlPB
         9nTi/tDOtdTykunYS9lF2fX/BI/aHjbMiwAHz88xu2g3CtlwqY1InDXHmIAtBDMRRb3d
         HkkmAFPtboaSJJj8dtfWAYDFrPFeCUkTxiOJuhBf20LIaFYt9IY3t+Y/gjm+Z1ZvGXUZ
         N4OnZpaJBAi9pgUHmIqQzVik8uGMyGfsit8Bzqd58Y289QwAMSoUy+QOtzplX0VZ4ql1
         nekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=NFfl3KCNK67+e+0Yh4ZhoJtE/cwRv02OA4hXjUoBIs4=;
        b=rncUbytLKvaA+Rod7dfDuwjn+F2xXleph//tC2jzTFYuzntXV+61xB7cP/Kjz5nJAT
         dKvFuWws0xuQNuDqc6OyZoqyVS7XtZZdQOdLfJJmUFgxckAdrq0J0EsD9D40Au0UzfmK
         UI2fckz5hugw2MUQMyqnvZHBDQxW9U2Z9eRYlb+/r7iG9m+CvUmWKVIur86icrO3/6w7
         kcKRopU9h6myl5a2Gn1NGHABU76XV+pvyzbYQdNabKeF6KLf6kKd5MR0/9uzDjIH0pD5
         FtiFLc929Xl3dleAlAxGLYtuwKdF+RceRUasYd6Q0tX58vO4R+oVWRqaB8tDGplUGPvu
         X/wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v72-v6si4592012qka.308.2018.08.14.10.53.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdVH-0004vv-7v
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:53:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdO4-0005iO-66
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 13:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdNp-0001Y8-44
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 13:45:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36786 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpdNo-0001Nj-Qh; Tue, 14 Aug 2018 13:45:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 272EDB5C5;
	Tue, 14 Aug 2018 16:29:49 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6897A2156712;
	Tue, 14 Aug 2018 16:29:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 14 Aug 2018 17:27:33 +0100
Message-Id: <20180814162739.11814-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 14 Aug 2018 16:29:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 14 Aug 2018 16:29:49 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v6 0/6] arm: add Cortex M0 CPU model and hex file
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
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hElrJwUr2uTr

v6:
 * Added comment to hexloader-test.c explaining contents of test.hex file
   [Phil]
v5:
 * Implemented Phil's hex loader suggestions
 * Replaced Su Hang's test hex file with a simple memory test pattern,
   eliminating the need to distribute source [Phil]
v4:
 * Drop ARMv7MState to ARMMProfileState rename because it causes a lot of=
 code
   churn and is incomplete.  Other parts of QEMU (like NVIC emulation) st=
ill
   refer to "v7m" although they apply to other architecture versions too.
   [Peter]
 * Use the generic loader device (-device loader,file=3Dprogram.hex,cpu-n=
um=3D1)
   instead of -kernel.  -kernel is a legacy command-line option that is k=
ept as
   a convenience, but it's not as flexible or predictable as the generic =
loader
   device.  New image formats should be added to the generic loader devic=
e.
   [Peter]
 * Use hex/ASCII literals instead of decimal literals in hexloader-test.c=
.
   This makes the test case slightly easier to understand. [Philippe]
v3:
 * Rename ARMv7MState to ARMMProfileState so a single class can cater for
   ARMv6-M, ARMv7-M, and ARMv8-M [Peter]
 * Make bitbanding optional via a qdev property [Peter]
 * Add hex file loader patches to reduce dependencies in upcoming patch s=
eries
 * Implement rollback if hex file loader fails partway through [Peter]
 * Update hex file loader test case to use an ARMv7-M board since hex fil=
e
   loading is only done for ARM M Profile boards

This series contains the prerequistes for the "microbit" machine type tha=
t Joel
Stanley has written.  I have combined the Cortex M0 CPU model and hex loa=
der
work into one series to reduce the dependencies in upcoming patch series =
from
Joel, Julia, and Steffen.

This patch series:
 * Makes bitbanding optional on ARMv7MState.
 * Adds a "cortex-m0" cpu type which can be used with ARMMProfileState.  =
This
   works thanks to Julia's Cortex M0 emulation patches, which are now all
   merged.
 * Adds Su Hang's Intel HEX file format loader so that micro:bit and othe=
r
   microcontroller firmware images can be run using -kernel.  The micro:b=
it
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
 hw/core/loader.c                     | 302 ++++++++++++++++++++++++++-
 target/arm/cpu.c                     |  11 +
 tests/hexloader-test.c               |  45 ++++
 tests/hex-loader-check-data/test.hex |  18 ++
 15 files changed, 440 insertions(+), 26 deletions(-)
 create mode 100644 tests/hexloader-test.c
 create mode 100644 tests/hex-loader-check-data/test.hex

--=20
2.17.1

