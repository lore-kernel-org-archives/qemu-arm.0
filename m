Received: by 10.25.27.66 with SMTP id b63csp397764lfb;
        Fri, 3 Jun 2016 11:43:47 -0700 (PDT)
X-Received: by 10.55.130.1 with SMTP id e1mr4896477qkd.204.1464979427246;
        Fri, 03 Jun 2016 11:43:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si3157903qkc.230.2016.06.03.11.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 11:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8u4P-0001C9-RH
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 14:43:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b8u4L-0001Bo-Td
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b8u4G-0007Fa-ID
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:43:40 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:39699 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b8u4G-0007FU-7K; Fri, 03 Jun 2016 14:43:36 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 35C5E1A462E;
	Fri,  3 Jun 2016 20:43:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 0E24E1A207C;
	Fri,  3 Jun 2016 20:43:32 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	maciej.rozycki@imgtec.com, proljc@gmail.com,
	kbastian@mail.uni-paderborn.de, mark.cave-ayland@ilande.co.uk,
	agraf@suse.de, blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	pbonzini@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
	aurelien@aurel32.net, rth@twiddle.net, peter.maydell@linaro.org,
	leon.alrae@imgtec.com, petar.jovanovic@imgtec.com,
	miodrag.dinic@imgtec.com, aleksandar.markovic@imgtec.com
Date: Fri,  3 Jun 2016 20:43:06 +0200
Message-Id: <1464979398-16838-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v8 0/9] IEEE 754-2008 support for Mips
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pf3wVDaRlwqx

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

v8 - fixed mail recipients

v7 - preprocesor constants for FCR31 bits removed
   - cleanup items in CFC1 and CTC1 handling removed
   - initialization of snan_bit_is_one for main FP unit moved
     from patch 6 to patch 9
   - an instance of "!" corrected to "~" (logical vs. bitwise negation)
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00886.html)

v6 - code for hanlding MSA FCLASS instructions slightly simplified
   - handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> corrected for
     nan2008 case
   - R/W bitmask for FCR31 introduced, and related functionalities
     implemented
   - cleanup items for SoftFloat library are now in a separate patch
   - minor errors corrected
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-05/msg02513.html)

v5 - platform initialization code revisited one more time;
   - handling of CLASS.<S|D> and their MSA counterparts revisited;
   - better orgranization of patches (squashing, splitting);
   - corrected handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>;
   - code cleanup item in genfarith() - order of cases;
   - scripts/checkpatch.pl executed and errors addressed.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg02774.html)

v4 - Added code cleanup items:
       a. Capitalization of hex constants in softfloat-specialize.h;
       b. White spaces in softfloat-specialize.h;
       c. Order of Mips helpers for CVT.<L|W>.<S|D>.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01962.html)

v3 - Patch series reorganized into 6 patches instead of 2.
   - Commit messages improved.
   - Except commit messages, net result of applying v3 and v2 is the same.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01870.html)

v2 - Relevant CPU initialization code changes revisited for all platforms.
   - In connection with <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> and
     <ABS|NEG>.<S|D> Mips instructions handling, decision on whether
     pre-nan2008/pre-abs2008 or nan2008/abs2008 handling will apply
     moved from run-time to translate-time.
   - For Mips only, in nan2008 cases only, default NaN values fixed.
   - For Mips only, in nan2008 cases only, order in pickNaNMulAdd() fixed.
   - Code cleanup issues:
       a. Constants <floatx80|float128>_default_nan_<low|high> removed;
       b. Suffix <l|w>_<s|d> replaced with _<l|w>_<s|d> for some Mips helpers;
       c. In vicinity of changes, fixed not-beautiful code formatting.
   - Commit messages improved.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01232.html)

v1 - Initial version
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg06082.html)

Mips platform represents the most complex case among QEMU-supported
platforms in reference to certain aspects of floating-point arithmetics.
This is mostly a consequence of the fact that Mips platform, for many
reasons, evolved considerably over time related to floating-point
arithmetics standards (significantly more than other platforms).
It has been difficult for emulators like QEMU to support such variety
of configurations.

This patch series provides number of IEEE 754-2008-related features to
Mips platform. It addresses the most sensitive changes that require
modification of SoftFloat library, also used by most other platforms.

In order to make develpoment, testing, and integration easier, the patch
is split into two distinct parts:

   1. Part 1 (patches 1/9, 2/9, 3/9, 4/9, 5/9) that does not change any
      calculation or behavior on any platform (and, for that matter, even on
      Mips platform). Its sole purpose is to address platform independant
      issues in a non-invasive manner, and to make Part 2 possible.

   2. Part 2 (patches 6/9, 7/9, 8/9, 9/9) that sets some Mips processors to
      use provisions from Part 1, and additionally implements number of
      IEEE 754-2008-relates features for Mips, while, at the same time,
      dealing with files located in directory target-mips only.

This patch series is based on the original set of patches proposed by Maciej W.
Rozycki: http://lists.nongnu.org/archive/html/qemu-devel/2014-12/msg00968.html

Aleksandar Markovic (9):
  softfloat: Implement run-time-configurable meaning of signaling NaN bit
  softfloat: Clean code format in fpu/softfloat-specialize.h
  softfloat: For Mips only, correct default NaN values
  softfloat: For Mips only, correct order in pickNaNMulAdd()
  linux-user: Update preprocessor constants for Mips-specific e_flags bits
  target-mips: Activate IEEE 754-2008 signaling NaN bit meaning for MSA
  target-mips: Add abs2008 flavor of <ABS|NEG>.<S|D>
  target-mips: Add nan2008 flavor of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
  target-mips: Implement FCR31's R/W bitmask and related functionalities

 fpu/softfloat-specialize.h    | 664 +++++++++++++++++++++---------------------
 fpu/softfloat.c               | 172 +++++------
 include/elf.h                 |  18 +-
 include/fpu/softfloat.h       |  45 +--
 linux-user/main.c             |  14 +
 target-arm/helper-a64.c       |  14 +-
 target-arm/helper.c           |  40 +--
 target-m68k/helper.c          |   6 +-
 target-microblaze/op_helper.c |   6 +-
 target-mips/cpu.h             |  20 +-
 target-mips/gdbstub.c         |   8 +-
 target-mips/helper.h          |  22 +-
 target-mips/msa_helper.c      |  88 +++---
 target-mips/op_helper.c       | 405 +++++++++++++++++++++++---
 target-mips/translate.c       | 156 ++++++++--
 target-mips/translate_init.c  |  29 ++
 target-ppc/fpu_helper.c       | 120 ++++----
 target-s390x/fpu_helper.c     |  28 +-
 target-s390x/helper.h         |   6 +-
 target-s390x/translate.c      |   6 +-
 target-sh4/cpu.c              |   1 +
 target-unicore32/cpu.c        |   2 +
 22 files changed, 1186 insertions(+), 684 deletions(-)

-- 
1.9.1

