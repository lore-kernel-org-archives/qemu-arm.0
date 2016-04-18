Received: by 10.25.208.194 with SMTP id h185csp1434830lfg;
        Mon, 18 Apr 2016 09:04:24 -0700 (PDT)
X-Received: by 10.140.33.229 with SMTP id j92mr43533231qgj.20.1460995461046;
        Mon, 18 Apr 2016 09:04:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r127si20280978qkc.8.2016.04.18.09.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBeu-0005gL-7R
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:04:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBep-0005ZU-Vn
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBel-0005XE-Ey
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:15 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54367 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBel-0005U1-5e; Mon, 18 Apr 2016 12:04:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 291D81A464B;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id E3AFA1A4600;
	Mon, 18 Apr 2016 18:03:45 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:33 +0200
Message-Id: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v5 0/9] target-mips: Initiate IEEE 754-2008
 support for Mips
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BnBITnQsbCg

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

v5 - platform initialization code revisited one more time;
   - handling of CLASS.<S|D> and their MSA counterparts revisited;
   - better orgranization of patches (squashing, splitting);
   - corrected handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>;
   - code cleanup item in genfarith() - order of cases;
   - scripts/checkpatch.pl executed and errors addressed.

v4 - Added code cleanup items:
       a. Capitalization of hex constants in softfloat-specialize.h;
       b. White spaces in softfloat-specialize.h;
       c. Order of Mips helpers for CVT.<L|W>.<S|D>.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01962.=
html)

v3 - Patch series reorganized into 6 patches instead of 2.
   - Commit messages improved.
   - Except commit messages, net result of applying v3 and v2 is the same=
.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01870.=
html)

v2 - Relevant CPU initialization code changes revisited for all platforms=
.
   - In connection with <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> and
     <ABS|NEG>.<S|D> Mips instructions handling, decision on whether
     pre-nan2008/pre-abs2008 or nan2008/abs2008 handling will apply
     moved from run-time to translate-time.
   - For Mips only, in nan2008 cases only, default NaN values fixed.
   - For Mips only, in nan2008 cases only, order in pickNaNMulAdd() fixed=
.
   - Code cleanup issues:
       a. Constants <floatx80|float128>_default_nan_<low|high> removed;
       b. Suffix <l|w>_<s|d> replaced with _<l|w>_<s|d> for some Mips hel=
pers;
       c. In vicinity of changes, fixed not-beautiful code formatting.
   - Commit messages improved.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01232.=
html)

V1 - Initial version
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg06082.=
html)

Mips platform represents the most complex case among QEMU-supported
platforms in reference to certain aspects of floating-point arithmetics.
This is mostly a consequence of the fact that Mips platform, for many
reasons, evolved considerably over time related to floating-point
arithmetics standards (significantly more than other platforms).
It has been difficult for emulators like QEMU to support such variety
of configurations.

This patch series provides number of IEEE 754-2008-related features to
Mips platform. It addresses the most sensitive changes that require
modification of SoftFloat library, that is used by most other platforms.

In order to make develpoment, testing, and integration easier, the patch
is split into two distinct parts:

   1. Part 1 (patches 1/9, 2/9, 3/9) that does not change any calculation
      or behavior on any platform (and, for that matter, even on Mips
      platform). Its sole purpose is to address platform independant
      issues in a non-invasive manner, and to make Part 2 possible.

   2. Part 2 (patches 4/9, 5/9, 6/9, 7/9, 8/9, 9/9) that sets some Mips
      architecures to use provisions from Part 1, and additionally implem=
ents
      some of IEEE 754-2008-relates features for Mips, while, at the same=
 time,
      dealing with files located in directory target-mips only.

A limitation of this patch series is that it does not cover all IEEE 754-=
2008
Mips issues (for example, handling FCR31's FS bit, handling R3 and R5
architectures details, some gdb issues, ELF header nan2008-related change=
s).
However, hopefully all remaining such issues will touch only Mips-specifi=
c
source code files, and thus will be much easier to integrate in QEMU, and=
,
of course, will not be disruptive to orher platforms.

This patch series is based on the original set of patches proposed by Mac=
iej W.
Rozycki: http://lists.nongnu.org/archive/html/qemu-devel/2014-12/msg00968=
.html

Aleksandar Markovic (9):
  softfloat: Implement run-time-configurable meaning of signaling NaN bit
  softfloat: For Mips only, correct default NaN values
  softfloat: For Mips only, correct order in pickNaNMulAdd()
  target-mips: Amend processor definitions in relation to FCR31
  target-mips: Activate IEEE 274-2008 signaling NaN bit meaning
  target-mips: Add abs2008 flavor of <ABS|NEG>.<S|D>
  target-mips: Add nan2008 flavor of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<=
S|D>
  target-mips: Clean up position and order of helpers for CVT.<L|W>.<S|D>
  target-mips: Clean up position of abs2008/nan2008 cases in genfarith()

 fpu/softfloat-specialize.h    | 664 +++++++++++++++++++++---------------=
------
 fpu/softfloat.c               | 172 +++++------
 include/fpu/softfloat.h       |  45 +--
 target-arm/helper-a64.c       |  14 +-
 target-arm/helper.c           |  40 +--
 target-m68k/helper.c          |   6 +-
 target-microblaze/op_helper.c |   6 +-
 target-mips/cpu.h             |   5 +
 target-mips/helper.h          |  22 +-
 target-mips/msa_helper.c      |  98 ++++---
 target-mips/op_helper.c       | 435 +++++++++++++++++++++++----
 target-mips/translate.c       | 251 +++++++++++-----
 target-mips/translate_init.c  |  18 +-
 target-ppc/fpu_helper.c       | 120 ++++----
 target-s390x/fpu_helper.c     |  28 +-
 target-s390x/helper.h         |   6 +-
 target-s390x/translate.c      |   6 +-
 target-sh4/cpu.c              |   1 +
 target-sparc/translate.c      |   2 +-
 target-unicore32/cpu.c        |   2 +
 20 files changed, 1211 insertions(+), 730 deletions(-)

--=20
1.9.1

