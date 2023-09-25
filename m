Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a3-20020a5d4d43000000b003177074f830sm12214244wru.59.2023.09.25.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 078DE1FFC8;
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
Subject: [PATCH 16/31] gdbstub: Use g_markup_printf_escaped()
Date: Mon, 25 Sep 2023 15:48:39 +0100
Message-Id: <20230925144854.1872513-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9uJnZdAo0ImM

From: Akihiko Odaki <akihiko.odaki@daynix.com>

g_markup_printf_escaped() is a safer alternative to simple printf() as
it automatically escapes values.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-9-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 9db4af41c1..a4f2bf3723 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -373,28 +373,34 @@ static const char *get_feature_xml(const char *p, const char **newp,
     if (strncmp(p, "target.xml", len) == 0) {
         if (!process->target_xml) {
             GDBRegisterState *r;
-            GString *xml = g_string_new("<?xml version=\"1.0\"?>");
+            g_autoptr(GPtrArray) xml = g_ptr_array_new_with_free_func(g_free);
 
-            g_string_append(xml,
-                            "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
-                            "<target>");
+            g_ptr_array_add(
+                xml,
+                g_strdup("<?xml version=\"1.0\"?>"
+                         "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+                         "<target>"));
 
             if (cc->gdb_arch_name) {
-                g_string_append_printf(xml,
-                                       "<architecture>%s</architecture>",
-                                       cc->gdb_arch_name(cpu));
+                g_ptr_array_add(
+                    xml,
+                    g_markup_printf_escaped("<architecture>%s</architecture>",
+                                            cc->gdb_arch_name(cpu)));
             }
-            g_string_append(xml, "<xi:include href=\"");
-            g_string_append(xml, cc->gdb_core_xml_file);
-            g_string_append(xml, "\"/>");
+            g_ptr_array_add(
+                xml,
+                g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                        cc->gdb_core_xml_file));
             for (r = cpu->gdb_regs; r; r = r->next) {
-                g_string_append(xml, "<xi:include href=\"");
-                g_string_append(xml, r->xml);
-                g_string_append(xml, "\"/>");
+                g_ptr_array_add(
+                    xml,
+                    g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                            r->xml));
             }
-            g_string_append(xml, "</target>");
+            g_ptr_array_add(xml, g_strdup("</target>"));
+            g_ptr_array_add(xml, NULL);
 
-            process->target_xml = g_string_free(xml, false);
+            process->target_xml = g_strjoinv(NULL, (void *)xml->pdata);
         }
         return process->target_xml;
     }
-- 
2.39.2
