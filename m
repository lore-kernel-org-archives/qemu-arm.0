Received: by 10.25.208.211 with SMTP id h202csp588621lfg;
        Thu, 7 Apr 2016 09:03:07 -0700 (PDT)
X-Received: by 10.140.129.22 with SMTP id 22mr5046628qhb.28.1460044986515;
        Thu, 07 Apr 2016 09:03:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s205si6389261qhs.37.2016.04.07.09.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 09:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aoCOg-0006oK-3E
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 12:03:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1aoCOa-0006ey-1c
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 12:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1aoCOU-0004nb-1M
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 12:02:59 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52613 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1aoCOT-0004hJ-Ng; Thu, 07 Apr 2016 12:02:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 2FA4C1A4857;
	Thu,  7 Apr 2016 18:02:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from mcs19.domain.local (mcs19.domain.local [10.10.13.51])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 085AE1A479F;
	Thu,  7 Apr 2016 18:02:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 Apr 2016 18:00:49 +0200
Message-Id: <1460044851-61721-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, rth@twiddle.net,
	petar.jovanovic@imgtec.com, blauwirbel@gmail.com,
	jcmvbkbc@gmail.com, maciej.rozycki@imgtec.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	proljc@gmail.com
Subject: [Qemu-arm] [PATCH 0/2] target-mips: Initiate IEEE 754-2008 support
	for Mips
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
X-TUID: 0XexC1xhjjmX

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

V2 - Relevant CPU initialization code changes revisited for all platforms.

   - In connection with <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> and
     <ABS|NEG>.<S|D> Mips instructions handling, decision on whether
     pre-nan2008 or nan2008 handling will apply moved from run-time to
     translate-time.

   - For Mips only, in nan2008 cases only, default NaN values fixed.

   - For Mips only, in nan2008 cases only, order in pickNaNMulAdd() fixed.

   - Code cleanup issues:
       a. Constants <floatx80|float128>_default_nan_<low|high> removed;
       b. Suffix <l|w>_<s|d> replaced with _<l|w>_<s|d> for some Mips helpers;
       c. In vicinity of changes, fixed not-beautiful code formatting.

   - Commit messages improved.

V1 - Initial version
     (https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg06082.html)

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

    1. Patch 1 that does not change any calculation or behavior for any
       platform (and, for that matter, even for Mips platform). Its sole
       purpose is to address platform independant issues in a non-invasive
       manner, and to make Patch 2 possible.

    2. Patch 2 that sets approprite Mips architecures to use provisions from
       Patch 1, and additionally implements some of IEEE 754-2008-related
       features for Mips, but, at the same time, dealing with files located
       in directory target-mips only.

A limitation of this patch series is that it does not cover all IEEE 754-2008
Mips issues (for example, handling FCR31's FS bit). However, hopefully all
remaining such issues will touch only Mips-specific source code files, and thus
will be much easier to integrate in QEMU, in overall.

This patch series is based on the original set of patches proposed by Maciej
Rozycki: http://lists.nongnu.org/archive/html/qemu-devel/2014-12/msg00968.html
Aleksandar Markovic (2):
  softfloat: Implement run-time-configurable meaning of signaling NaN bit
  target-mips: Activate IEEE 754-2008 support for Mips

 fpu/softfloat-specialize.h    |  587 +++++++++++++++++++++--------------------
 fpu/softfloat.c               |  180 ++++++-------
 include/fpu/softfloat.h       |   49 ++--
 target-alpha/cpu.c            |    2 +
 target-arm/helper-a64.c       |   14 +-
 target-arm/helper.c           |   40 +--
 target-m68k/helper.c          |    6 +-
 target-microblaze/cpu.c       |    2 +
 target-microblaze/op_helper.c |    6 +-
 target-mips/helper.h          |   22 +-
 target-mips/msa_helper.c      |   96 ++++---
 target-mips/op_helper.c       |  350 ++++++++++++++++++++++--
 target-mips/translate.c       |  157 +++++++++--
 target-mips/translate_init.c  |   20 +-
 target-ppc/fpu_helper.c       |  120 ++++-----
 target-ppc/translate_init.c   |    2 +
 target-s390x/cpu.c            |    1 +
 target-s390x/fpu_helper.c     |   28 +-
 target-s390x/helper.h         |    6 +-
 target-s390x/translate.c      |    6 +-
 target-sh4/cpu.c              |    1 +
 target-sparc/cpu.c            |    1 +
 target-tricore/helper.c       |    1 +
 target-unicore32/cpu.c        |    2 +
 target-xtensa/cpu.c           |    3 +
 25 files changed, 1078 insertions(+), 624 deletions(-)

-- 
1.7.9.5

