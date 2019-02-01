Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7575572wrt;
        Thu, 31 Jan 2019 18:34:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7YI44pCBNlt/d/J/dsWobD9ZogYMFVdtJ9mvBXGQ2frkaVq+qoOMINwtVKo9Gq0IrZLHrP
X-Received: by 2002:a81:7ad0:: with SMTP id v199mr36672134ywc.149.1548988460692;
        Thu, 31 Jan 2019 18:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548988460; cv=none;
        d=google.com; s=arc-20160816;
        b=jY8klK7eb4RYxhl/jR4T0g+JVZWSYxUpYld2gDj2AvQGE9gLbCkFUf5f91bc6tm0FB
         A2yKHFqpSuu+W2IuyxfDZ1Cif7xZBPaj1LdEU+fQrFwpaulczK9RaXWq8TXeeDXEi10W
         Zq1wIDM4GjzMaQ2pUNADP6U3EHecPOPI8p7ZqmsihSH/VspVumJIE78Q2/Z1i6uL0SlN
         T4giaLO2WHu9+/xkutZhlGsszgRQP+6eKlzO73ncNQ0z/quiqaVNONeERF7Auzz24xwf
         oi2Dy54/wQYaleK4Y+BZKg7dpDy8/7FfNe19fH88rsSSAniGVZphCA/cKXWZN3rBj4Rh
         X5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=+JhSZFRZC9TxTbM9wSRxahTFPGcRXiDG75sGfQXtTkE=;
        b=n5ueMXq4X2CunxoUywrrpKy4q4wERjQJ6LMQPX4msaCSNFTNlUFxPhkDZTFyePzJSF
         1vCwdhTjNqSUA0NMxDGo4L7J1K6wxYJDWQFdrbcHV+Lc4s3lnyp4Pak/+4h6M4v8HoIR
         AWHb3W/E66vdhXvgnCPYh0vTGiU4E/7VC59qunCOfuVk4BYy37GLgC6/YFmChVMjCHb0
         0l9w75WhMTPF4XCQ/hR6Pdop3Xp4gUl4OiWtJDP+Wl3nluwgrk7AG/Coi/7/nm3zqaCS
         PTohWylqTgEvCGrqk80nmO341iAFyQoHTGD89+R2OFfA6uTAsW6PkxqIGhn1Ofrt+I24
         4REw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p203si3737231ywg.170.2019.01.31.18.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 18:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpOeq-0007l9-2L
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 21:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gpOeh-0007kt-JP
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 21:34:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gpOef-0002mP-Kl
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 21:34:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gpOeb-0002kW-PV; Thu, 31 Jan 2019 21:34:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C525E7F76D;
	Fri,  1 Feb 2019 02:34:02 +0000 (UTC)
Received: from localhost (unknown [10.64.242.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 865F25C220;
	Fri,  1 Feb 2019 02:33:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 Feb 2019 10:33:54 +0800
Message-Id: <20190201023357.22596-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 01 Feb 2019 02:34:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 0/3] arm: microbit Non-Volatile Memory
 Controller
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7lRvLkvQ+aZE

v4:
 * assert(offset + size <=3D s->flash_size) [Peter]
v3:
 * Fix endianness of s->storage[], tested by Joel Stanley <joel@jms.id.au=
> on
   big-endian ppc [Peter]
 * Fix off-by-one that prevented clearing the last page of flash
 * Add missing memory_region_flush_rom_device() call to flash_write()
v2:
 * Add Patch 2 to call memory_region_flush_rom_device() from pflash devic=
es
   [Peter]

This series adds the Non-Volatile Memory Controller, which controls acces=
s to
the User Information Control Registers (UICR), Factory Information Contro=
l
Registers (FICR), and flash memory.

This is the last piece of microbit work needed to make basic programs lik=
e
Micropython "Hello world" work under QEMU.

Originally sent as part of Steffen's longer microbit device emulation ser=
ies, I
extracted this and deferred it until later because cleanups were necessar=
y:

 * Use memory_region_flush_rom_device() to dirty/invalidate memory [Peter=
]
   ^--- Paolo: I CCed you on this new memory API
 * Fix device-introspect-test segfault due to missing owner when initiali=
zing
   FICR and UICR memory regions [Peter]
 * Fix off-by-one assertion checks [Peter]
 * Fix missing whitespace at end of comment [Peter]
 * Clear UICR on reset - we'd need a block device for true non-volatility
   [Peter]

Steffen G=C3=B6rtz (3):
  hw/nvram/nrf51_nvm: Add nRF51 non-volatile memories
  arm: Instantiate NRF51 special NVM's and NVMC
  tests/microbit-test: Add tests for nRF51 NVMC

 hw/nvram/Makefile.objs       |   1 +
 include/hw/arm/nrf51_soc.h   |   2 +
 include/hw/nvram/nrf51_nvm.h |  64 ++++++
 hw/arm/nrf51_soc.c           |  41 ++--
 hw/nvram/nrf51_nvm.c         | 388 +++++++++++++++++++++++++++++++++++
 tests/microbit-test.c        | 108 ++++++++++
 6 files changed, 592 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/nvram/nrf51_nvm.h
 create mode 100644 hw/nvram/nrf51_nvm.c

--=20
2.20.1

