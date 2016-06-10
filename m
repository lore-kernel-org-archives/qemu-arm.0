Received: by 10.25.85.209 with SMTP id j200csp71019lfb;
        Fri, 10 Jun 2016 09:27:40 -0700 (PDT)
X-Received: by 10.55.101.68 with SMTP id z65mr2907347qkb.80.1465576059965;
        Fri, 10 Jun 2016 09:27:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d57si6728744qtd.3.2016.06.10.09.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:27:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:43288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPHX-0006fs-Cm
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:27:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPHQ-0006cr-4J
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPHL-0007gN-0L
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:27:31 -0400
Received: from forward15m.cmail.yandex.net ([5.255.216.146]:55139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bBPHJ-0007g8-Lb; Fri, 10 Jun 2016 12:27:26 -0400
Received: from smtp3m.mail.yandex.net (smtp3m.mail.yandex.net
	[IPv6:2a02:6b8:0:2519::125])
	by forward15m.cmail.yandex.net (Yandex) with ESMTP id 8B76F20E3D;
	Fri, 10 Jun 2016 19:27:05 +0300 (MSK)
Received: from smtp3m.mail.yandex.net (localhost [127.0.0.1])
	by smtp3m.mail.yandex.net (Yandex) with ESMTP id 1597E27A08E9;
	Fri, 10 Jun 2016 19:27:01 +0300 (MSK)
Received: by smtp3m.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	700tofVhlY-R16WhMOm; Fri, 10 Jun 2016 19:27:01 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465576021; bh=lGHy1rEZkZN/KTLeBVnuFY03J3DVPL6pGCzq77Ztmro=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=wDjyeVQOLj8Aqusx6nYJ+jUZr1pn57JuAThX0aD9bmUZs1ItoaGLVx7ul4YSbVSf6
	SKA6+IGr7rrzCVooV+TPeK6cv1NKkxW9VhHrKzBKffZxq1Y63eP9AbPHt99Whac5Kb
	jhOl5i5QrepFUgB4vO82NIzOSxFJ15QJNcdLsm7Q=
Authentication-Results: smtp3m.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Fri, 10 Jun 2016 19:26:37 +0300
Message-Id: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.146
Subject: [Qemu-arm] [PATCH 0/2] Fix confusing argument names in some common
 functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Sergey Sorokin <afarallax@yandex.ru>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +UjJG3Ygik6l

There are functions tlb_fill(), cpu_unaligned_access() and
do_unaligned_access() that are called with access type and mmu index
arguments. But these arguments are named 'is_write' and 'is_user' in their
declarations. The patches fix the names to avoid a confusion.

Sergey Sorokin (2):
  Fix confusing argument names of do_unaligned_access() functions
  Fix a confusing argument name in tlb_fill() function

 include/exec/exec-all.h       |  2 +-
 include/qom/cpu.h             |  8 ++++----
 target-alpha/cpu.h            |  4 ++--
 target-alpha/mem_helper.c     |  8 ++++----
 target-arm/internals.h        |  4 ++--
 target-arm/op_helper.c        | 27 +++++++++++++++------------
 target-cris/op_helper.c       |  4 ++--
 target-i386/mem_helper.c      |  4 ++--
 target-lm32/op_helper.c       |  4 ++--
 target-m68k/op_helper.c       |  4 ++--
 target-microblaze/op_helper.c |  4 ++--
 target-mips/cpu.h             |  4 ++--
 target-mips/op_helper.c       |  6 +++---
 target-moxie/helper.c         |  4 ++--
 target-openrisc/mmu_helper.c  |  4 ++--
 target-ppc/mmu_helper.c       |  6 +++---
 target-s390x/mem_helper.c     |  4 ++--
 target-sh4/op_helper.c        |  4 ++--
 target-sparc/cpu.h            |  5 +++--
 target-sparc/ldst_helper.c    |  9 +++++----
 target-tricore/op_helper.c    |  4 ++--
 target-unicore32/op_helper.c  |  4 ++--
 target-xtensa/cpu.h           |  4 ++--
 target-xtensa/op_helper.c     | 10 ++++++----
 24 files changed, 74 insertions(+), 67 deletions(-)

-- 
1.9.3

