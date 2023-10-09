Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b004013797efb6sm13936639wme.9.2023.10.09.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E9CD81FFC7;
	Mon,  9 Oct 2023 17:41:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 15/25] gdbstub: Use g_markup_printf_escaped()
Date: Mon,  9 Oct 2023 17:40:54 +0100
Message-Id: <20231009164104.369749-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RuIHIt7xngJE

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
index a20169c27b..3dc847f835 100644
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
