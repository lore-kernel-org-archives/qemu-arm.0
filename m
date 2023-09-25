Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d424d000000b0031753073abcsm12017142wrr.36.2023.09.25.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:58:45 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7CEA01FFBE;
	Mon, 25 Sep 2023 15:48:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 20/31] gdbstub: Replace gdb_regs with an array
Date: Mon, 25 Sep 2023 15:48:43 +0100
Message-Id: <20230925144854.1872513-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8r0DMxuK4EZe

From: Akihiko Odaki <akihiko.odaki@daynix.com>

An array is a more appropriate data structure than a list for gdb_regs
since it is initialized only with append operation and read-only after
initialization.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-13-akihiko.odaki@daynix.com>
[AJB: fixed a checkpatch violation]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h |  2 +-
 gdbstub/gdbstub.c     | 35 +++++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5ae479a961..0338640e3d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -364,7 +364,7 @@ struct CPUState {
 
     CPUJumpCache *tb_jmp_cache;
 
-    struct GDBRegisterState *gdb_regs;
+    GArray *gdb_regs;
     int gdb_num_regs;
     int gdb_num_g_regs;
     QTAILQ_ENTRY(CPUState) node;
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 177dce9ba2..a041b1c0aa 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -51,7 +51,6 @@ typedef struct GDBRegisterState {
     gdb_get_reg_cb get_reg;
     gdb_set_reg_cb set_reg;
     const char *xml;
-    struct GDBRegisterState *next;
 } GDBRegisterState;
 
 GDBState gdbserver_state;
@@ -386,7 +385,8 @@ static const char *get_feature_xml(const char *p, const char **newp,
                 xml,
                 g_markup_printf_escaped("<xi:include href=\"%s\"/>",
                                         cc->gdb_core_xml_file));
-            for (r = cpu->gdb_regs; r; r = r->next) {
+            for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+                r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
                 g_ptr_array_add(
                     xml,
                     g_markup_printf_escaped("<xi:include href=\"%s\"/>",
@@ -430,7 +430,8 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
         return cc->gdb_read_register(cpu, buf, reg);
     }
 
-    for (r = cpu->gdb_regs; r; r = r->next) {
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
         if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
             return r->get_reg(env, buf, reg - r->base_reg);
         }
@@ -448,7 +449,8 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
         return cc->gdb_write_register(cpu, mem_buf, reg);
     }
 
-    for (r = cpu->gdb_regs; r; r = r->next) {
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
         if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
@@ -461,17 +463,23 @@ void gdb_register_coprocessor(CPUState *cpu,
                               int num_regs, const char *xml, int g_pos)
 {
     GDBRegisterState *s;
-    GDBRegisterState **p;
-
-    p = &cpu->gdb_regs;
-    while (*p) {
-        /* Check for duplicates.  */
-        if (strcmp((*p)->xml, xml) == 0)
-            return;
-        p = &(*p)->next;
+    guint i;
+
+    if (cpu->gdb_regs) {
+        for (i = 0; i < cpu->gdb_regs->len; i++) {
+            /* Check for duplicates.  */
+            s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+            if (strcmp(s->xml, xml) == 0) {
+                return;
+            }
+        }
+    } else {
+        cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
+        i = 0;
     }
 
-    s = g_new0(GDBRegisterState, 1);
+    g_array_set_size(cpu->gdb_regs, i + 1);
+    s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
     s->base_reg = cpu->gdb_num_regs;
     s->num_regs = num_regs;
     s->get_reg = get_reg;
@@ -480,7 +488,6 @@ void gdb_register_coprocessor(CPUState *cpu,
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += num_regs;
-    *p = s;
     if (g_pos) {
         if (g_pos != s->base_reg) {
             error_report("Error: Bad gdb register numbering for '%s', "
-- 
2.39.2
