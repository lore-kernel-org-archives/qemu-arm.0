Received: by 10.25.21.96 with SMTP id l93csp1925771lfi;
        Tue, 21 Jun 2016 05:41:52 -0700 (PDT)
X-Received: by 10.233.237.13 with SMTP id c13mr6264836qkg.126.1466512912429;
        Tue, 21 Jun 2016 05:41:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id d26si51034461qtb.58.2016.06.21.05.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 05:41:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFL03-0003L6-Sh
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 08:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bFL00-0003Kj-1c
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 08:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bFKzv-00039R-4p
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 08:41:47 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:31827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1bFKzu-00039M-RQ; Tue, 21 Jun 2016 08:41:43 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 00B32A30451CE;
	Tue, 21 Jun 2016 13:41:35 +0100 (IST)
Received: from BADAG04.ba.imgtec.org (10.20.40.112) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 21 Jun 2016 13:41:37 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG04.ba.imgtec.org ([fe80::b930:4082:95b0:e446%15]) with mapi id
	14.03.0266.001; Tue, 21 Jun 2016 05:41:33 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "Maciej
	Rozycki" <Maciej.Rozycki@imgtec.com>,
	"proljc@gmail.com" <proljc@gmail.com>, 
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>, "blauwirbel@gmail.com"
	<blauwirbel@gmail.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "edgar.iglesias@gmail.com"
	<edgar.iglesias@gmail.com>, "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"rth@twiddle.net" <rth@twiddle.net>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "aurelien@aurel32.net" <aurelien@aurel32.net>, 
	Leon Alrae <Leon.Alrae@imgtec.com>, Petar Jovanovic
	<Petar.Jovanovic@imgtec.com>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>
Thread-Topic: [PATCH v9 00/10] IEEE 754-2008 support for Mips
Thread-Index: AQHRwv6cs/10H8rQfEaXaaw6F3e/ZJ/z7mc5
Date: Tue, 21 Jun 2016 12:41:33 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85E3E997D3@BADAG02.ba.imgtec.org>
References: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v9 00/10] IEEE 754-2008 support for Mips
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
X-TUID: tctbufJy9bI/

ping

________________________________________
From: Aleksandar Markovic [aleksandar.markovic@rt-rk.com]
Sent: Friday, June 10, 2016 2:57 AM
To: qemu-devel@nongnu.org; qemu-arm@nongnu.org; qemu-ppc@nongnu.org; Maciej=
 Rozycki; proljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.cave-aylan=
d@ilande.co.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gmail.com; pb=
onzini@redhat.com; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; rth@twidd=
le.net; peter.maydell@linaro.org; aurelien@aurel32.net; Leon Alrae; Petar J=
ovanovic; Miodrag Dinic; Aleksandar Markovic
Subject: [PATCH v9 00/10] IEEE 754-2008 support for Mips

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

v8 -> v9:
   - patches 1 and 2 slightly reorganized to separate real changes from
     cleanup changes more clearly
   - unnecessary changes removed from patches 5 and 9
   - changes related to FS bit moved to a separate patch (patch 10)
   - mail recipients for individual patches slightly adjusted

v7 -> v8:
   - fixed mail recipients
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00896.ht=
ml)

v6 -> v7:
   - preprocesor constants for FCR31 bits removed
   - cleanup items in CFC1 and CTC1 handling removed
   - initialization of snan_bit_is_one for main FP unit moved
     from patch 6 to patch 9
   - an instance of "!" corrected to "~" (logical vs. bitwise negation)
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00886.ht=
ml)

v5 -> v6:
   - code for hanlding MSA FCLASS instructions slightly simplified
   - handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> corrected for
     nan2008 case
   - R/W bitmask for FCR31 introduced, and related functionalities
     implemented
   - cleanup items for SoftFloat library are now in a separate patch
   - minor errors corrected
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-05/msg02513.ht=
ml)

v4 -> v5:
   - platform initialization code revisited one more time;
   - handling of CLASS.<S|D> and their MSA counterparts revisited;
   - better orgranization of patches (squashing, splitting);
   - corrected handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>;
   - code cleanup item in genfarith() - order of cases;
   - scripts/checkpatch.pl executed and errors addressed.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg02774.ht=
ml)

v3 -> v4:
   - Added code cleanup items:
       a. Capitalization of hex constants in softfloat-specialize.h;
       b. White spaces in softfloat-specialize.h;
       c. Order of Mips helpers for CVT.<L|W>.<S|D>.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01962.ht=
ml)

v2 -> v3:
   - Patch series reorganized into 6 patches instead of 2.
   - Commit messages improved.
   - Except commit messages, net result of applying v3 and v2 is the same.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01870.ht=
ml)

v1 -> v2:
   - Relevant CPU initialization code changes revisited for all platforms.
   - In connection with <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> and
     <ABS|NEG>.<S|D> Mips instructions handling, decision on whether
     pre-nan2008/pre-abs2008 or nan2008/abs2008 handling will apply
     moved from run-time to translate-time.
   - For Mips only, in nan2008 cases only, default NaN values fixed.
   - For Mips only, in nan2008 cases only, order in pickNaNMulAdd() fixed.
   - Code cleanup issues:
       a. Constants <floatx80|float128>_default_nan_<low|high> removed;
       b. Suffix <l|w>_<s|d> replaced with _<l|w>_<s|d> for some Mips helpe=
rs;
       c. In vicinity of changes, fixed not-beautiful code formatting.
   - Commit messages improved.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01232.ht=
ml)

v1 - Initial version
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg06082.ht=
ml)

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

   1. Part 1 (patches 1/10, 2/10, 3/10, 4/10, 5/10) that does not change an=
y
      calculation or behavior on any platform (and, for that matter, even o=
n
      Mips platform). Its sole purpose is to address platform independant
      issues in a non-invasive manner, and to make Part 2 possible.

   2. Part 2 (patches 6/10, 7/10, 8/10, 9/10, 10/10) that sets some Mips
      processors to use provisions from Part 1, and additionally implements
      number of IEEE 754-2008-related features for Mips, while, at the same
      time, mainly dealing with files located in directory target-mips only=
.

This patch series is based on the original set of patches proposed by Macie=
j W.
Rozycki: http://lists.nongnu.org/archive/html/qemu-devel/2014-12/msg00968.h=
tml

Aleksandar Markovic (10):
  softfloat: Implement run-time-configurable meaning of signaling NaN bit
  softfloat: Clean code format in fpu/softfloat-specialize.h
  softfloat: For Mips only, correct default NaN values
  softfloat: For Mips only, correct order in pickNaNMulAdd()
  linux-user: Update preprocessor constants for Mips-specific e_flags bits
  target-mips: Activate IEEE 754-2008 signaling NaN bit meaning for MSA
  target-mips: Add abs2008 flavor of <ABS|NEG>.<S|D>
  target-mips: Add nan2008 flavor of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|=
D>
  target-mips: Implement FCR31's R/W bitmask and related functionalities
  target-mips: Add FCR31's FS bit definition

 fpu/softfloat-specialize.h    | 659 +++++++++++++++++++++-----------------=
----
 fpu/softfloat.c               | 172 +++++------
 include/elf.h                 |   2 +
 include/fpu/softfloat.h       |  45 +--
 linux-user/main.c             |  14 +
 target-arm/helper-a64.c       |  14 +-
 target-arm/helper.c           |  40 +--
 target-m68k/helper.c          |   6 +-
 target-microblaze/op_helper.c |   6 +-
 target-mips/cpu.h             |  16 +-
 target-mips/gdbstub.c         |   8 +-
 target-mips/helper.h          |  22 +-
 target-mips/msa_helper.c      |  88 +++---
 target-mips/op_helper.c       | 400 ++++++++++++++++++++++---
 target-mips/translate.c       | 156 ++++++++--
 target-mips/translate_init.c  |  29 ++
 target-ppc/fpu_helper.c       | 120 ++++----
 target-s390x/fpu_helper.c     |  28 +-
 target-s390x/helper.h         |   6 +-
 target-s390x/translate.c      |   6 +-
 target-sh4/cpu.c              |   1 +
 target-unicore32/cpu.c        |   2 +
 22 files changed, 1167 insertions(+), 673 deletions(-)

--
1.9.1

