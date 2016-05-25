Received: by 10.25.30.65 with SMTP id e62csp1309013lfe;
        Wed, 25 May 2016 06:20:37 -0700 (PDT)
X-Received: by 10.237.32.226 with SMTP id 89mr3505514qtb.83.1464182437346;
        Wed, 25 May 2016 06:20:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si7904158qtp.98.2016.05.25.06.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 06:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Yjk-0001MX-Ml
	for alex.bennee@linaro.org; Wed, 25 May 2016 09:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1b5YMZ-0008Bt-Mw
	for qemu-devel@nongnu.org; Wed, 25 May 2016 08:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1b5YMV-00087Z-3f
	for qemu-devel@nongnu.org; Wed, 25 May 2016 08:56:39 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:53167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1b5YMG-00083s-IC; Wed, 25 May 2016 08:56:20 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email with ESMTPS id 1313DAE610F4F;
	Wed, 25 May 2016 13:56:09 +0100 (IST)
Received: from BADAG03.ba.imgtec.org (10.20.40.115) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 25 May 2016 13:56:12 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	badag03.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Wed, 25 May 2016 05:56:08 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v6 0/9] IEEE 754-2008 support for Mips
Thread-Index: AQHRr30ZjedoCK1sQUayHEYNSqr2MJ/Jqm2R
Date: Wed, 25 May 2016 12:56:04 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85916ADC21@BADAG02.ba.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Subject: Re: [Qemu-devel] [PATCH v6 0/9] IEEE 754-2008 support for Mips
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A5tvai6e0tIi

ping
________________________________________
From: Aleksandar Markovic [aleksandar.markovic@rt-rk.com]
Sent: Monday, May 16, 2016 7:12 AM
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org; proljc@gmail.com; kbastian@mail.uni-paderborn=
.de; mark.cave-ayland@ilande.co.uk; agraf@suse.de; blauwirbel@gmail.com; jc=
mvbkbc@gmail.com; Aleksandar Markovic; qemu-arm@nongnu.org; qemu-ppc@nongnu=
.org; Petar Jovanovic; pbonzini@redhat.com; Miodrag Dinic; edgar.iglesias@g=
mail.com; gxt@mprc.pku.edu.cn; Leon Alrae; afaerber@suse.de; aurelien@aurel=
32.net; rth@twiddle.net; Maciej Rozycki
Subject: [PATCH v6 0/9] IEEE 754-2008 support for Mips

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

v6 - code for hanlding MSA FCLASS instructions slightly simplified.
   - handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> corrected for
     nan2008 case.
   - R/W bitmask for FCR31 introduced, and related functionalities
     implemented.
   - cleanup items for SoftFloat library are now in a separate patch.
   - minor errors corrected.

v5 - platform initialization code revisited one more time.
   - handling of CLASS.<S|D> and their MSA counterparts revisited.
   - better orgranization of patches (squashing, splitting).
   - corrected handling of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>.
   - code cleanup item in genfarith() - order of cases.
   - scripts/checkpatch.pl executed and errors addressed.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg02774.ht=
ml)

v4 - Added code cleanup items:
       a. Capitalization of hex constants in softfloat-specialize.h;
       b. White spaces in softfloat-specialize.h;
       c. Order of Mips helpers for CVT.<L|W>.<S|D>.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01962.ht=
ml)

v3 - Patch series reorganized into 6 patches instead of 2.
   - Commit messages improved.
   - Except commit messages, net result of applying v3 and v2 is the same.
(link: https://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01870.ht=
ml)

v2 - Relevant CPU initialization code changes revisited for all platforms.
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

   1. Part 1 (patches 1/9, 2/9, 3/9, 4/9, 5/9) that does not change any
      calculation or behavior on any platform (and, for that matter, even o=
n
      Mips platform). Its sole purpose is to address platform independant
      issues in a non-invasive manner, and to make Part 2 possible.

   2. Part 2 (patches 6/9, 7/9, 8/9, 9/9) that sets some Mips processors to
      use provisions from Part 1, and additionally implements number of
      IEEE 754-2008-related features for Mips, while, at the same time,
      dealing with files located in directory target-mips only.

This patch series is based on the original set of patches proposed by Macie=
j W.
Rozycki: http://lists.nongnu.org/archive/html/qemu-devel/2014-12/msg00968.h=
tml

Aleksandar Markovic (9):
  softfloat: Implement run-time-configurable meaning of signaling NaN bit
  softfloat: Clean code format in fpu/softfloat-specialize.h
  softfloat: For Mips only, correct default NaN values
  softfloat: For Mips only, correct order in pickNaNMulAdd()
  linux-user: Update preprocessor constants for Mips-specific e_flags bits
  target-mips: Activate IEEE 754-2008 signaling NaN bit meaning
  target-mips: Add abs2008 flavor of <ABS|NEG>.<S|D>
  target-mips: Add nan2008 flavor of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|=
D>
  target-mips: Implement FCR31's R/W bitmask and related functionalities

 fpu/softfloat-specialize.h    | 664 +++++++++++++++++++++-----------------=
----
 fpu/softfloat.c               | 172 +++++------
 include/elf.h                 |  18 +-
 include/fpu/softfloat.h       |  45 +--
 linux-user/main.c             |  14 +
 target-arm/helper-a64.c       |  14 +-
 target-arm/helper.c           |  40 +--
 target-m68k/helper.c          |   6 +-
 target-microblaze/op_helper.c |   6 +-
 target-mips/cpu.h             |  80 ++++-
 target-mips/gdbstub.c         |   8 +-
 target-mips/helper.h          |  22 +-
 target-mips/msa_helper.c      |  88 +++---
 target-mips/op_helper.c       | 463 ++++++++++++++++++++++++++---
 target-mips/translate.c       | 156 ++++++++--
 target-mips/translate_init.c  |  57 ++++
 target-ppc/fpu_helper.c       | 120 ++++----
 target-s390x/fpu_helper.c     |  28 +-
 target-s390x/helper.h         |   6 +-
 target-s390x/translate.c      |   6 +-
 target-sh4/cpu.c              |   1 +
 target-unicore32/cpu.c        |   2 +
 22 files changed, 1322 insertions(+), 694 deletions(-)

--
1.9.1

