Received: by 10.80.163.71 with SMTP id 65csp152779edn;
        Fri, 9 Sep 2016 06:09:32 -0700 (PDT)
X-Received: by 10.55.178.196 with SMTP id b187mr3958121qkf.121.1473426571411;
        Fri, 09 Sep 2016 06:09:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si1954166qth.150.2016.09.09.06.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 06:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biLYg-0006QJ-7Y
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 09:09:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1biLT9-0002MN-KZ
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 09:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1biLT3-0005Kx-Bb
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 09:03:47 -0400
Received: from roura.ac.upc.es ([147.83.33.10]:37251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1biLSw-0005JS-NQ; Fri, 09 Sep 2016 09:03:35 -0400
Received: from gw-2.ac.upc.es (gw-2.ac.upc.es [147.83.30.8])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u89D3SvM003368;
	Fri, 9 Sep 2016 15:03:28 +0200
Received: from localhost (unknown [84.88.51.85])
	by gw-2.ac.upc.es (Postfix) with ESMTPSA id C9F638C1;
	Fri,  9 Sep 2016 15:03:28 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Date: Fri,  9 Sep 2016 15:03:28 +0200
Message-Id: <147342620852.13303.268926108380192945.stgit@fimbulvetr.bsc.es>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <147342618684.13303.1583142856242164602.stgit@fimbulvetr.bsc.es>
References: <147342618684.13303.1583142856242164602.stgit@fimbulvetr.bsc.es>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	u89D3SvM003368
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Subject: [Qemu-arm] [PATCH v2 4/6] target: [tcg] Redefine DISAS_* onto the
 generic translation framework (DJ_*)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@suse.de>,
	"open list:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: olAqZlYVRf8w

Temporarily redefine DISAS_* values based on DJ_TARGET. They should
disappear as targets get ported to the generic framework.

Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
---
 include/exec/exec-all.h      |   11 +++++++----
 target-arm/translate.h       |   15 ++++++++-------
 target-cris/translate.c      |    3 ++-
 target-m68k/translate.c      |    3 ++-
 target-s390x/translate.c     |    3 ++-
 target-unicore32/translate.c |    3 ++-
 6 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 17659e6..54dc4ad 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -36,10 +36,13 @@ typedef ram_addr_t tb_page_addr_t;
 #endif
=20
 /* is_jmp field values */
-#define DISAS_NEXT    0 /* next instruction can be analyzed */
-#define DISAS_JUMP    1 /* only pc was modified dynamically */
-#define DISAS_UPDATE  2 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP 3 /* only pc was modified statically */
+/* TODO: delete after all targets are transitioned to generic translatio=
n */
+#include "exec/translate-all_template.h"
+#define DISAS_NEXT    DJ_NEXT           /* next instruction can be analy=
zed */
+#define DISAS_JUMP    (DJ_TARGET+0)     /* only pc was modified dynamica=
lly */
+#define DISAS_UPDATE  (DJ_TARGET+1)     /* cpu state was modified dynami=
cally */
+#define DISAS_TB_JUMP (DJ_TARGET+2)     /* only pc was modified statical=
ly */
+#define DISAS_TARGET  (DJ_TARGET+3)     /* base for target-specific valu=
es */
=20
 #include "qemu/log.h"
=20
diff --git a/target-arm/translate.h b/target-arm/translate.h
index dbd7ac8..602763c 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -107,21 +107,22 @@ static inline int default_exception_el(DisasContext=
 *s)
 }
=20
 /* target-specific extra values for is_jmp */
+/* TODO: rename as DJ_* when transitioning this target to generic transl=
ation */
 /* These instructions trap after executing, so the A32/T32 decoder must
  * defer them until after the conditional execution state has been updat=
ed.
  * WFI also needs special handling when single-stepping.
  */
-#define DISAS_WFI 4
-#define DISAS_SWI 5
+#define DISAS_WFI DISAS_TARGET + 0
+#define DISAS_SWI DISAS_TARGET + 1
 /* For instructions which unconditionally cause an exception we can skip
  * emitting unreachable code at the end of the TB in the A64 decoder
  */
-#define DISAS_EXC 6
+#define DISAS_EXC DISAS_TARGET + 2
 /* WFE */
-#define DISAS_WFE 7
-#define DISAS_HVC 8
-#define DISAS_SMC 9
-#define DISAS_YIELD 10
+#define DISAS_WFE DISAS_TARGET + 3
+#define DISAS_HVC DISAS_TARGET + 4
+#define DISAS_SMC DISAS_TARGET + 5
+#define DISAS_YIELD DISAS_TARGET + 6
=20
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target-cris/translate.c b/target-cris/translate.c
index 284543a..ab48679 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -50,7 +50,8 @@
 #define BUG() (gen_BUG(dc, __FILE__, __LINE__))
 #define BUG_ON(x) ({if (x) BUG();})
=20
-#define DISAS_SWI 5
+/* TODO: rename as DJ_* when transitioning this target to generic transl=
ation */
+#define DISAS_SWI DISAS_TARGET + 0
=20
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index f7d131f..75ffcc3 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -141,7 +141,8 @@ typedef struct DisasContext {
     int done_mac;
 } DisasContext;
=20
-#define DISAS_JUMP_NEXT 4
+/* TODO: rename as DJ_* when transitioning this target to generic transl=
ation */
+#define DISAS_JUMP_NEXT DISAS_TARGET + 0
=20
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(s) 1
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 468531a..69ca717 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -74,7 +74,8 @@ typedef struct {
     } u;
 } DisasCompare;
=20
-#define DISAS_EXCP 4
+/* TODO: rename as DJ_* when transitioning this target to generic transl=
ation */
+#define DISAS_EXCP DISAS_TARGET + 0
=20
 #ifdef DEBUG_INLINE_BRANCHES
 static uint64_t inline_branch_hit[CC_OP_MAX];
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 7499748..1cd2dab 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -45,9 +45,10 @@ typedef struct DisasContext {
 #define IS_USER(s)      1
 #endif
=20
+/* TODO: rename as DJ_* when transitioning this target to generic transl=
ation */
 /* These instructions trap after executing, so defer them until after th=
e
    conditional executions state has been updated.  */
-#define DISAS_SYSCALL 5
+#define DISAS_SYSCALL DISAS_TARGET + 0
=20
 static TCGv_env cpu_env;
 static TCGv_i32 cpu_R[32];

