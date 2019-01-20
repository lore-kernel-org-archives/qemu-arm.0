Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5099536wrt;
        Sun, 20 Jan 2019 06:36:42 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Pbjv36bgmC4ghl36Zh9UlzN+zDrjAOOYf6vnVwuJ/M+7g6LAQpQSXLzTj14SHZBS1YfJ/
X-Received: by 2002:a5d:6808:: with SMTP id w8mr23409470wru.270.1547995002437;
        Sun, 20 Jan 2019 06:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547995002; cv=none;
        d=google.com; s=arc-20160816;
        b=PYtivs9s74kUjeXUSJj3BLCVBJx6nLhBYkpyHoorzqpPuWP60kRQloMmzJnbIc9H/H
         JIoUbz22TTKGvwFeH8LJD2pXjNgzJcCbGvp7fsp8xec8T+P5dDCcSYa4BVN3el0jrqVn
         mmFkXcdBzll7kLIzhRadNRPfSKJKiAo55+jKIlg/Ug+SbC4xQ+x+hKOpzRiHkwYjGCkw
         ZxInbtcRwJCrcUr2EmjGRHm/L4QmIfFhyAKGEyCzfRuYMQY9AZz1rh4Ryl4a+r5kLnyM
         HxMD98d8rOU/bpXsciP/AEGLtxSaJbr0ZnXUg+6AbXdg6KLMz/qz69jR+YyBwMpc+AmJ
         cPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=oqU47g0pzEhw9cTOGJ4gNEYXZ9yg7MaqtFozsOVn62M=;
        b=EZnshfn0fFbMpU/UZctPoEPWuYdR+jXKBhTYIzVRwjmZZsd25V0b2HS7ygVQ8TdMr9
         27occfynYA2mVsBFes/D57d3NKIPK8y+/oo2S8lNrnLhKFpwQ/usch/X/TkhvmxWv1Mv
         PoZoeuyHb6yMg+TlhMbySleV6TfkYRo55NI+09VhwZ8GBsKrvC1XIcpgsxTJZ2gKdvbU
         8A25+c54f7EzAR5xOHeeSJerk4IkEtWTH6ZqXjsxNGhPif1WKknVK6ftLipmlj5TjInd
         ryLAVRdirHg3Q9yOG0qCx+Fmiktfn4EE3he4ZOUxTiVkiQyPpsmzcUtxln++ZiR7nhCh
         zHUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si31478549wmh.33.2019.01.20.06.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Jan 2019 06:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glEDJ-0002pq-GR
	for alex.bennee@linaro.org; Sun, 20 Jan 2019 09:36:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECI-0002pg-78
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECG-0002Tm-9u
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1glECC-0002On-2T
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ABE181F0E;
	Sun, 20 Jan 2019 14:35:26 +0000 (UTC)
Received: from localhost (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8C2A19C7D;
	Sun, 20 Jan 2019 14:35:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 20 Jan 2019 14:34:48 +0000
Message-Id: <20190120143452.21683-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 20 Jan 2019 14:35:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] arm: microbit Non-Volatile Memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QIEAPIT385CV

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

Stefan Hajnoczi (1):
  memory: add memory_region_flush_rom_device()

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
 hw/nvram/nrf51_nvm.c         | 381 +++++++++++++++++++++++++++++++++++
 tests/microbit-test.c        |  97 +++++++++
 8 files changed, 604 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/nvram/nrf51_nvm.h
 create mode 100644 hw/nvram/nrf51_nvm.c

--=20
2.20.1

