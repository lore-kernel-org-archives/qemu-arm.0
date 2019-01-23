Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1172140wrt;
        Wed, 23 Jan 2019 13:28:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6z8512pmnWze9dbP+nQXxD9Qurkqf9loiN/OPNOorvRsLp5V7DKvJmD+oJ9YVZmOZWAb/F
X-Received: by 2002:a1c:9e4a:: with SMTP id h71mr4380674wme.82.1548278907521;
        Wed, 23 Jan 2019 13:28:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548278907; cv=none;
        d=google.com; s=arc-20160816;
        b=HsIdJ/f8+jyoxtMRZED0TQtckALtIsey1U07jeat3uLFJhEHq04RV7I9L37QUJMFsG
         AFvIhAH8wT95t4mBNJY+XNQsuTdAw9ksSSdq8ZQyYia9E0VFl7ButbCWzpqWTfNVrCk/
         tqLZL6qQzwrDlFOMlN5Qgmf0/UwdVLllGkxDTe2Rnt4jlZQh4Zn37wUKkDzAB0+GnoyJ
         hfOktLfh4D0nNF1XKQJpdiL0f3HQMqlfwOxW6jCT6srhKxy9A6+d9MGqMWXQlXpoQjlP
         seIAnQLJO3wfqxuN6C/ZgkEYywYfWu/BM/dNuQBcDei0zA7qLt104/c4s/mDfRSyYMu2
         M+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=u6hyt+OjkykU3/AKnNIdhF90Q9jDmunBYdRBoGrfCd0=;
        b=MsTmHxAOxgbmVNZ8IFexFZGb3JnxJwLyFacjk8OVpPP552AbOvgEbU3lR+0GeAlqlv
         bUnHbJxIjMBYKPU1rDtqzU8hTg+uCHUa1uaQ09Z1pSP9DCJC27tKs91WPiIuBivkAGnW
         ixTPQzI0JTFiLcKR18B1lhcvljZ45lcqTaJ6PfA0KWqfX9JaVdWbaLLVJ6VYiUsj1oxR
         POLfF+qRHoUYPX8Ngb0UxU/jhCvdFq7dKP8Jb0kP2ZXekeqTV3p88GhpA+qo775xOXsL
         N5lavvfaRihJxJZm+EHUm/lj4S/h8aTDyNRkpNZCkBdkeplmnptdJaEc3D6h2o0yRs0Y
         UauQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m185si37747008wmd.125.2019.01.23.13.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:28:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQ4Q-0001e0-J6
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:28:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzS-0006Ew-9E
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:23:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzR-0001pe-IV
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:23:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gmPzH-0001gB-TW; Wed, 23 Jan 2019 16:23:08 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8A1FC0C49CF;
	Wed, 23 Jan 2019 21:23:03 +0000 (UTC)
Received: from localhost (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C5CB60487;
	Wed, 23 Jan 2019 21:22:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Jan 2019 21:22:29 +0000
Message-Id: <20190123212234.32068-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 21:23:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/5] arm: microbit Non-Volatile Memory
 Controller
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pqslr0mnLcLu

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

Stefan Hajnoczi (2):
  memory: add memory_region_flush_rom_device()
  pflash: flush rom device memory region

Steffen G=C3=B6rtz (3):
  hw/nvram/nrf51_nvm: Add nRF51 non-volatile memories
  arm: Instantiate NRF51 special NVM's and NVMC
  tests/microbit-test: Add tests for nRF51 NVMC

 hw/nvram/Makefile.objs       |   1 +
 include/exec/memory.h        |  18 ++
 include/hw/arm/nrf51_soc.h   |   2 +
 include/hw/nvram/nrf51_nvm.h |  64 ++++++
 exec.c                       |  12 ++
 hw/arm/nrf51_soc.c           |  41 ++--
 hw/block/pflash_cfi01.c      |   5 +
 hw/block/pflash_cfi02.c      |   8 +
 hw/nvram/nrf51_nvm.c         | 381 +++++++++++++++++++++++++++++++++++
 tests/microbit-test.c        |  97 +++++++++
 10 files changed, 617 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/nvram/nrf51_nvm.h
 create mode 100644 hw/nvram/nrf51_nvm.c

--=20
2.20.1

