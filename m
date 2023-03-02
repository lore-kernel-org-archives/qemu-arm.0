Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ip21-20020a05600ca69500b003eb596cbc54sm450210wmb.0.2023.03.02.11.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:14:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E698E1FFC6;
	Thu,  2 Mar 2023 19:08:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Laurent Vivier <laurent@vivier.eu>,
	nicolas.eder@lauterbach.com,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	qemu-s390x@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Marek Vasut <marex@denx.de>,
	Greg Kurz <groug@kaod.org>,
	Song Gao <gaosong@loongson.cn>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	mads@ynddal.dk,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 17/26] gdbstub: specialise stub_can_reverse
Date: Thu,  2 Mar 2023 19:08:37 +0000
Message-Id: <20230302190846.2593720-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: c/hKwf74uI8O

Currently we only support replay for softmmu mode so it is a constant
false for user-mode.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rename gdb_stub_can_revers -> gdb_can_reverse
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 13 ++-----------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 26a6468a69..be0eef4850 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -130,6 +130,7 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 unsigned int gdb_get_max_cpus(void); /* both */
+bool gdb_can_reverse(void); /* softmmu, stub for user */
 
 void gdb_create_default_process(GDBState *s);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1b783100c2..7301466ff5 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -113,15 +113,6 @@ int use_gdb_syscalls(void)
     return gdb_syscall_mode == GDB_SYS_ENABLED;
 }
 
-static bool stub_can_reverse(void)
-{
-#ifdef CONFIG_USER_ONLY
-    return false;
-#else
-    return replay_mode == REPLAY_MODE_PLAY;
-#endif
-}
-
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
@@ -1308,7 +1299,7 @@ static void handle_step(GArray *params, void *user_ctx)
 
 static void handle_backward(GArray *params, void *user_ctx)
 {
-    if (!stub_can_reverse()) {
+    if (!gdb_can_reverse()) {
         gdb_put_packet("E22");
     }
     if (params->len == 1) {
@@ -1559,7 +1550,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
-    if (stub_can_reverse()) {
+    if (gdb_can_reverse()) {
         g_string_append(gdbserver_state.str_buf,
             ";ReverseStep+;ReverseContinue+");
     }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 3a5587d387..d2863d0663 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -450,6 +450,11 @@ unsigned int gdb_get_max_cpus(void)
     return ms->smp.max_cpus;
 }
 
+bool gdb_can_reverse(void)
+{
+    return replay_mode == REPLAY_MODE_PLAY;
+}
+
 /*
  * Softmmu specific command helpers
  */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index e10988a62b..3f6183e66a 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -409,6 +409,11 @@ unsigned int gdb_get_max_cpus(void)
     return max_cpus;
 }
 
+/* replay not supported for user-mode */
+bool gdb_can_reverse(void)
+{
+    return false;
+}
 
 /*
  * Break/Watch point helpers
-- 
2.39.2
