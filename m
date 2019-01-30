Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5341823wrt;
        Tue, 29 Jan 2019 23:21:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN63xbMpz1GUzMh3Epr/ml8e7Zz6K38MZPX+cw+Ujk+PUn3w4pa1W7pjvUJUBaomuyUGWpkO
X-Received: by 2002:a25:f603:: with SMTP id t3mr20564175ybd.291.1548832914732;
        Tue, 29 Jan 2019 23:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548832914; cv=none;
        d=google.com; s=arc-20160816;
        b=VCbnLR88Azre/cTV3Pgrjg3odyPIH9LjtnDNbzPhR/VYttQtx6efUb3MbpPYKq87JV
         fQHIbRSyxALZ1dEg/9cJQ/x1/I+TWgySe+FveAnIBcMt1Bngu/ZUrAVx3tzz9qxGRotF
         HNjSLdSQcGSKLdJiLS4uLWyKzaHOFwFWns/WTJWShrA1JJWDFAg88Zri0SJi8iKitdvr
         KhUnNibxlyKDP5cDhXLnF77lCFtoANvBpwlI/zzU2QOJeCNKYNcoL9mJG5HPq1QlaEhk
         5AKyhfyBwBaqp62UUs99AgGsrKddBLKWHcBY3840vJH6Cx3eG8XmaiMLVMhZ1vWEHjaf
         QdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=CvwWNi0C8RY6Zoi0WFSCEswtgMvxO39OQn1C+xFiYEA=;
        b=VzY0GXvyZvAmzxRgaG+CfbXl6xrrWtHZw4TNX94ftPpl0deTN7OvM3nL0DQvJXQz1L
         1iu4vgOKRMnSb3+0woD+4kWQCHP7RxnqvIxIfdHRThp6CidUY+EYuA26VTqXyWTjm6si
         fWBvcrSike7jy6mQT5DW0Of4AM29v83mzMpN3qMcKAUle+Xi4vgBujwyhhVuDs2OMlxf
         sKkOZsR1Lz/QvKsUAH514/q+MHEV4vgrLlyY/UYTJuKmG78ffye6KkwXIf5d+zNcif22
         bZBSudRJzP49UIQVq0JsmtsSpFI+zE/FevKtS5pfUALy7gSaao32ETInISsGolNlJnZ+
         3dlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j197si381491ybj.302.2019.01.29.23.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 23:21:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gokC0-0000qq-FY
	for alex.bennee@linaro.org; Wed, 30 Jan 2019 02:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gokBt-0000qd-Ip
	for qemu-arm@nongnu.org; Wed, 30 Jan 2019 02:21:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gokBr-0002G7-KD
	for qemu-arm@nongnu.org; Wed, 30 Jan 2019 02:21:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gokBo-0002F1-4B; Wed, 30 Jan 2019 02:21:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4738581F0E;
	Wed, 30 Jan 2019 07:21:38 +0000 (UTC)
Received: from localhost (unknown [10.64.242.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8111560C6E;
	Wed, 30 Jan 2019 07:21:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 30 Jan 2019 15:21:28 +0800
Message-Id: <20190130072131.13247-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 30 Jan 2019 07:21:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/3] arm: microbit Non-Volatile Memory
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
X-TUID: LAstWdJt960o

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

