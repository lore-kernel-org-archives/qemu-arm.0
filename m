Received: by 10.182.158.201 with SMTP id ww9csp1737506obb;
        Mon, 14 Dec 2015 05:04:47 -0800 (PST)
X-Received: by 10.140.175.196 with SMTP id v187mr12486547qhv.75.1450098287565;
        Mon, 14 Dec 2015 05:04:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w135si34842033qka.87.2015.12.14.05.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Dec 2015 05:04:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8So2-0000oL-Pp
	for alex.bennee@linaro.org; Mon, 14 Dec 2015 08:04:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a8Snu-0000dS-A3
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 08:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a8Sno-0003zQ-6o
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 08:04:38 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a8Snk-0003ww-M1; Mon, 14 Dec 2015 08:04:28 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a8Snb-0002BR-I4; Mon, 14 Dec 2015 13:04:19 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Dec 2015 13:04:19 +0000
Message-Id: <1450098259-8368-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>, patches@linaro.org
Subject: [Qemu-arm] [PATCH] disas/libvixl: Update to upstream VIXL 1.12
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
X-TUID: X3iRvBS2daMv

Update our copy of libvixl to upstream's 1.12 release.
The major benefit from QEMU's point of view is that some instructions
previously disassembled as "unimplemented (System)" are now displayed
as something more useful. It also fixes some warnings about format
strings that newer w64-mingw32 compilers were emitting.

We didn't have any local changes to libvixl so nothing needed
to be forward-ported.

Although this is a large commit (partly due to upstream renaming most
of the files), only a few of the files changed in this commit
are not just straight copies of upstream libvixl files:
 disas/arm-a64.cc
 disas/libvixl/Makefile.objs
 disas/libvixl/README

Note that this commit introduces some signed-unsigned comparison
warnings on the old mingw compilers. Those compilers have broken
TLS support anyway so have only ever been much use for compile tests;
anybody still using them should add -Wno-sign-compare to their
--extra-cflags.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I have used git's "--find-renames=3" for this patchmail as it
produces the smallest patch. The rename-detection does mis-identify
one file, but since there is no point reviewing the upstream code
I feel it doesn't matter and the reduced patchsize is more helpful.

The interesting files to review are those listed above as not
being simple copies of upstream libvixl files. Conveniently they
are the first three files in the patch.

Unfortunately the entire patch is 343K, which is rather larger than
qemu-devel's maximum email size limit. I have therefore truncated
this email to let it get through. You can find the full patch for
testing in my git repo:

web view:
https://git.linaro.org/people/peter.maydell/qemu-arm.git/shortlog/refs/heads/vixl-1.12
git url:
https://git.linaro.org/people/peter.maydell/qemu-arm.git vixl-1.12

I've truncated after the three files which are vaguely worth
reviewing. Let me know if there's a better way of handling this...


 disas/arm-a64.cc                                   |    2 +-
 disas/libvixl/Makefile.objs                        |    9 +-
 disas/libvixl/README                               |    3 +-
 disas/libvixl/{ => vixl}/a64/assembler-a64.h       | 2765 ++++++++++++++++++--
 disas/libvixl/{ => vixl}/a64/constants-a64.h       |  967 ++++++-
 disas/libvixl/{ => vixl}/a64/cpu-a64.h             |    6 +-
 disas/libvixl/{ => vixl}/a64/decoder-a64.cc        |  210 +-
 disas/libvixl/{ => vixl}/a64/decoder-a64.h         |   58 +-
 disas/libvixl/{ => vixl}/a64/disasm-a64.cc         | 1733 +++++++++++-
 disas/libvixl/{ => vixl}/a64/disasm-a64.h          |   17 +-
 disas/libvixl/{ => vixl}/a64/instructions-a64.cc   |  360 ++-
 disas/libvixl/{ => vixl}/a64/instructions-a64.h    |  423 ++-
 disas/libvixl/{ => vixl}/code-buffer.h             |    2 +-
 .../{utils.cc => vixl/compiler-intrinsics.cc}      |  137 +-
 disas/libvixl/vixl/compiler-intrinsics.h           |  155 ++
 disas/libvixl/{ => vixl}/globals.h                 |   82 +-
 disas/libvixl/vixl/invalset.h                      |  775 ++++++
 disas/libvixl/{ => vixl}/platform.h                |    2 +-
 disas/libvixl/vixl/utils.cc                        |  142 +
 disas/libvixl/{ => vixl}/utils.h                   |  115 +-
 20 files changed, 7382 insertions(+), 581 deletions(-)
 rename disas/libvixl/{ => vixl}/a64/assembler-a64.h (44%)
 rename disas/libvixl/{ => vixl}/a64/constants-a64.h (51%)
 rename disas/libvixl/{ => vixl}/a64/cpu-a64.h (96%)
 rename disas/libvixl/{ => vixl}/a64/decoder-a64.cc (81%)
 rename disas/libvixl/{ => vixl}/a64/decoder-a64.h (82%)
 rename disas/libvixl/{ => vixl}/a64/disasm-a64.cc (46%)
 rename disas/libvixl/{ => vixl}/a64/disasm-a64.h (94%)
 rename disas/libvixl/{ => vixl}/a64/instructions-a64.cc (49%)
 rename disas/libvixl/{ => vixl}/a64/instructions-a64.h (45%)
 rename disas/libvixl/{ => vixl}/code-buffer.h (99%)
 rename disas/libvixl/{utils.cc => vixl/compiler-intrinsics.cc} (60%)
 create mode 100644 disas/libvixl/vixl/compiler-intrinsics.h
 rename disas/libvixl/{ => vixl}/globals.h (52%)
 create mode 100644 disas/libvixl/vixl/invalset.h
 rename disas/libvixl/{ => vixl}/platform.h (98%)
 create mode 100644 disas/libvixl/vixl/utils.cc
 rename disas/libvixl/{ => vixl}/utils.h (68%)

diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index b57256b..d4d46d5 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -17,7 +17,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "a64/disasm-a64.h"
+#include "vixl/a64/disasm-a64.h"
 
 extern "C" {
 #include "disas/bfd.h"
diff --git a/disas/libvixl/Makefile.objs b/disas/libvixl/Makefile.objs
index 17e6565..e373cf0 100644
--- a/disas/libvixl/Makefile.objs
+++ b/disas/libvixl/Makefile.objs
@@ -1,7 +1,8 @@
-libvixl_OBJS = utils.o \
-               a64/instructions-a64.o \
-               a64/decoder-a64.o \
-               a64/disasm-a64.o
+libvixl_OBJS = vixl/utils.o \
+               vixl/compiler-intrinsics.o \
+               vixl/a64/instructions-a64.o \
+               vixl/a64/decoder-a64.o \
+               vixl/a64/disasm-a64.o
 
 $(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl $(QEMU_CFLAGS)
 
diff --git a/disas/libvixl/README b/disas/libvixl/README
index 58db41c..932a41a 100644
--- a/disas/libvixl/README
+++ b/disas/libvixl/README
@@ -2,11 +2,10 @@
 The code in this directory is a subset of libvixl:
  https://github.com/armvixl/vixl
 (specifically, it is the set of files needed for disassembly only,
-taken from libvixl 1.7).
+taken from libvixl 1.12).
 Bugfixes should preferably be sent upstream initially.
 
 The disassembler does not currently support the entire A64 instruction
 set. Notably:
- * No Advanced SIMD support.
  * Limited support for system instructions.
  * A few miscellaneous integer and floating point instructions are missing.


------------------------
EMAIL TRUNCATED HERE -- for other changes see the git repo.


thanks
-- PMM
