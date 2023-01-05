Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c1d8700b003d973d4fb28sm3071619wms.4.2023.01.05.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:43:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B7CBF1FFCB;
	Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Greg Kurz <groug@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 21/21] gdbstub: only compile gdbstub twice for whole build
Date: Thu,  5 Jan 2023 16:43:20 +0000
Message-Id: <20230105164320.2164095-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7PRtaD9mxHzF

Now we have removed any target specific bits from the core gdbstub
code we only need to build it twice. We have to jump a few meson hoops
to manually define the CONFIG_USER_ONLY symbol but it seems to work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c     |  3 +--
 gdbstub/user-target.c |  2 +-
 gdbstub/meson.build   | 32 ++++++++++++++++++++++++++++----
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 57bbda3505..0dbb9f5338 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -39,7 +39,6 @@
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
 #include "sysemu/replay.h"
@@ -1611,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     {
         .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
index 83e04e1c23..46f5729999 100644
--- a/gdbstub/user-target.c
+++ b/gdbstub/user-target.c
@@ -235,7 +235,7 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
 }
 
 
-#if defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_LINUX)
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx)
 {
     TaskState *ts;
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index 56c40c25ef..193c20203d 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -4,13 +4,37 @@
 # types such as hwaddr.
 #
 
-specific_ss.add(files('gdbstub.c'))
+# We need to build the core gdb code via a library to be able to tweak
+# cflags so:
 
-# These have to built to the target ABI
-specific_ss.add(files('syscalls.c'))
+gdb_user_ss = ss.source_set()
+gdb_softmmu_ss = ss.source_set()
 
-softmmu_ss.add(files('softmmu.c'))
+# We build two versions of gdbstub, one for each mode
+gdb_user_ss.add(files('gdbstub.c'))
+gdb_softmmu_ss.add(files('gdbstub.c'))
+
+gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
+gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
+
+libgdb_user = static_library('gdb_user', gdb_user_ss.sources(),
+                             name_suffix: 'fa',
+                             c_args: '-DCONFIG_USER_ONLY')
+
+libgdb_softmmu = static_library('gdb_softmmu', gdb_softmmu_ss.sources(),
+                                name_suffix: 'fa')
+
+gdb_user = declare_dependency(link_whole: libgdb_user)
+user_ss.add(gdb_user)
+gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
+softmmu_ss.add(gdb_softmmu)
+
+# The rest of the mode specific code can be added directly
 user_ss.add(files('user.c'))
+softmmu_ss.add(files('softmmu.c'))
+
+# These have to built to the target ABI
+specific_ss.add(files('syscalls.c'))
 
 # and BSD?
 specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))
-- 
2.34.1
