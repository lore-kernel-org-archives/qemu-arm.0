Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3235606wru;
        Mon, 13 Aug 2018 12:00:09 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx454x0Osif9JrzPv+FkAlXi3+ug9oEX28B/0uz/J+oP0Pra4bkHYnspGUBcyF9Xcw1m5Et
X-Received: by 2002:aed:3e92:: with SMTP id n18-v6mr17642004qtf.236.1534186809811;
        Mon, 13 Aug 2018 12:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534186809; cv=none;
        d=google.com; s=arc-20160816;
        b=AoX2ie8GFjclUw9a1xM1pvaXqFd2J+Q6zDHrlMmGKlGw2C2FjqEx/Zv95T/Pg855DI
         pK1e82kLvEAk3JHBX0VY39lyKqloLg9W1hXFOvgeLrWLCLRVxuveVuiBBq90jBmhciTc
         Il8f9t5gYFU/a/V6ugzqQZ0EVcUxRL9K8cX7AsE/joUGuvtNupDPeU+gJ8svCyQADKcq
         T3IeufVRaOLx7CegDBTZd1EMlpexlaV7ojE1+OqLp7xCeeO8dSL/6BYS7oNIXlqoHUS9
         7QFMXlNZ5XT02v4/L2Gld+7mH9gWrf0Oh3CERf1pMD2CqQ1Ewy7i9a+QOBgty59gFwVo
         U5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=r2TECKc7fMFJF8bedV/C1Wx6VmfhPPHOglIqXDptQdc=;
        b=cj30sR8+K+IS+jRSH1WnI9x6MGJ46waBmfIJzB04FlLaaVFlIhOebOObGVcw55vig9
         HTUVXWksW2EWo2vwDSjZOJAXO5t/s2+eqHcNRLteFT3DMxKZcJqoKdrso6KvSB2nFekc
         eZleDkbzL5Z1H4mAaG3bg8enZ8KSmYPxPsBYk5n+Mc+nvlZEkKjd36dToKYmv/DCC0tl
         LCwECrZ0187Fcji/Q4SJczyu9a6p1AlGf09Q/pZSjwTGxRK3spzTcUE8UfRg9duqdaAz
         SPZBk0j+3aa75CntBMJZaYIIOhKserFOMZwOjRxpbfdDDb2WumPj8tcXHYJUyZi8FjCm
         6wgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n56-v6si1645220qtn.196.2018.08.13.12.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 12:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpI4X-00063F-9s
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 15:00:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHso-0001uI-7j
	for qemu-devel@nongnu.org; Mon, 13 Aug 2018 14:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsn-0003zV-8F
	for qemu-devel@nongnu.org; Mon, 13 Aug 2018 14:48:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37232 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpHsg-0003xQ-MI; Mon, 13 Aug 2018 14:47:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D12738185342;
	Mon, 13 Aug 2018 18:47:53 +0000 (UTC)
Received: from localhost (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 068B71C70F;
	Mon, 13 Aug 2018 18:47:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 13 Aug 2018 19:46:18 +0100
Message-Id: <20180813184624.12071-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 13 Aug 2018 18:47:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 13 Aug 2018 18:47:53 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v5 0/6] arm: add Cortex M0 CPU model and hex
 file loader
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wtoclbqKd5l1

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
 tests/hexloader-test.c               |  41 ++++
 tests/hex-loader-check-data/test.hex |  18 ++
 15 files changed, 436 insertions(+), 26 deletions(-)
 create mode 100644 tests/hexloader-test.c
 create mode 100644 tests/hex-loader-check-data/test.hex

--=20
2.17.1

