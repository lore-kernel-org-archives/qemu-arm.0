Received: by 10.25.208.211 with SMTP id h202csp205972lfg;
        Fri, 25 Mar 2016 07:14:46 -0700 (PDT)
X-Received: by 10.55.221.18 with SMTP id n18mr17490298qki.50.1458915285987;
        Fri, 25 Mar 2016 07:14:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63si4190350qkl.123.2016.03.25.07.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Mar 2016 07:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ajSVh-0005aB-Ef
	for alex.bennee@linaro.org; Fri, 25 Mar 2016 10:14:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1ajRCZ-0000rm-SP
	for qemu-arm@nongnu.org; Fri, 25 Mar 2016 08:50:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1ajRCU-0006cf-TY
	for qemu-arm@nongnu.org; Fri, 25 Mar 2016 08:50:55 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52303 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1ajRCU-0006aK-NI; Fri, 25 Mar 2016 08:50:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 3F41B1A23FE;
	Fri, 25 Mar 2016 13:50:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 0C4F61A23CB;
	Fri, 25 Mar 2016 13:50:25 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 25 Mar 2016 13:50:12 +0100
Message-Id: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
X-Mailman-Approved-At: Fri, 25 Mar 2016 10:14:43 -0400
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, proljc@gmail.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	kbastian@mail.uni-paderborn.de, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	miodrag.dinic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com, gxt@mprc.pku.edu.cn,
	leon.alrae@imgtec.com, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH 0/2] target-mips: Fix IEEE 754-2008-related issues
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 92TEfDLxg90A

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Mips platform represents the most complex case among QEMU-supported
platforms in reference to certain aspects of floating-point arithmetics.
This is mostly a consequence of the fact that Mips platform, for many
reasons, evolved considerably over time related to floating-point
arithmetics standards (significantly more than other platforms).
It has been difficult for emulators like QEMU to support such variety
of configurations.

This patch set provides solution to this problem, and furnishes
accurate emulation of floating-point arithmetics for all Mips cases.

Aleksandar Markovic (2):
  softfloat: Enable run-time-configurable meaning of signaling NaN bit
  target-mips: Implement IEEE 754-2008 functionality for R6 and MSA
    instructions

 fpu/softfloat-specialize.h    | 546 +++++++++++++++++++++---------------=
------
 fpu/softfloat.c               | 170 +++++++------
 include/fpu/softfloat.h       |  49 ++--
 target-alpha/cpu.c            |   2 +
 target-arm/cpu.c              |   2 +
 target-arm/helper-a64.c       |  14 +-
 target-arm/helper.c           |  40 ++--
 target-i386/cpu.c             |   4 +
 target-m68k/cpu.c             |   2 +
 target-m68k/helper.c          |   6 +-
 target-microblaze/cpu.c       |   2 +
 target-microblaze/op_helper.c |   6 +-
 target-mips/helper.h          |  14 +-
 target-mips/msa_helper.c      | 144 +++++++----
 target-mips/op_helper.c       | 527 +++++++++++++++++++++++++++++++++---=
----
 target-mips/translate.c       |  20 +-
 target-mips/translate_init.c  |  24 +-
 target-openrisc/cpu.c         |   2 +
 target-ppc/fpu_helper.c       | 120 +++++-----
 target-ppc/translate_init.c   |   2 +
 target-s390x/cpu.c            |   1 +
 target-s390x/fpu_helper.c     |  28 ++-
 target-s390x/helper.h         |   6 +-
 target-s390x/translate.c      |   6 +-
 target-sh4/cpu.c              |   1 +
 target-sparc/cpu.c            |   1 +
 target-tricore/helper.c       |   1 +
 target-unicore32/cpu.c        |   1 +
 target-xtensa/cpu.c           |   3 +
 29 files changed, 1119 insertions(+), 625 deletions(-)

--=20
1.9.1

