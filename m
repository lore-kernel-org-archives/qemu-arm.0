Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b004097881d7a8sm385873wmg.0.2023.11.03.12.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:00:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6EDA865747;
	Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 08/29] gdbstub: Add num_regs member to GDBFeature
Date: Fri,  3 Nov 2023 19:59:35 +0000
Message-Id: <20231103195956.1998255-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zHAVbsjHJJPj

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Currently the number of registers exposed to GDB is written as magic
numbers in code. Derive the number of registers GDB actually see from
XML files to replace the magic numbers in code later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231025093128.33116-2-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h  |  1 +
 scripts/feature_to_c.py | 46 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 1a01c35f8e..a43aa34dad 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -13,6 +13,7 @@
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
+    int num_regs;
 } GDBFeature;
 
 
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index bcbcb83beb..e04d6b2df7 100644
--- a/scripts/feature_to_c.py
+++ b/scripts/feature_to_c.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os, sys
+import os, sys, xml.etree.ElementTree
 
 def writeliteral(indent, bytes):
     sys.stdout.write(' ' * indent)
@@ -39,10 +39,52 @@ def writeliteral(indent, bytes):
     with open(input, 'rb') as file:
         read = file.read()
 
+    parser = xml.etree.ElementTree.XMLPullParser(['start', 'end'])
+    parser.feed(read)
+    events = parser.read_events()
+    event, element = next(events)
+    if event != 'start':
+        sys.stderr.write(f'unexpected event: {event}\n')
+        exit(1)
+    if element.tag != 'feature':
+        sys.stderr.write(f'unexpected start tag: {element.tag}\n')
+        exit(1)
+
+    regnum = 0
+    regnums = []
+    tags = ['feature']
+    for event, element in events:
+        if event == 'end':
+            if element.tag != tags[len(tags) - 1]:
+                sys.stderr.write(f'unexpected end tag: {element.tag}\n')
+                exit(1)
+
+            tags.pop()
+            if element.tag == 'feature':
+                break
+        elif event == 'start':
+            if len(tags) < 2 and element.tag == 'reg':
+                if 'regnum' in element.attrib:
+                    regnum = int(element.attrib['regnum'])
+
+                regnums.append(regnum)
+                regnum += 1
+
+            tags.append(element.tag)
+        else:
+            raise Exception(f'unexpected event: {event}\n')
+
+    if len(tags):
+        sys.stderr.write('unterminated feature tag\n')
+        exit(1)
+
+    base_reg = min(regnums)
+    num_regs = max(regnums) - base_reg + 1 if len(regnums) else 0
+
     sys.stdout.write('    {\n')
     writeliteral(8, bytes(os.path.basename(input), 'utf-8'))
     sys.stdout.write(',\n')
     writeliteral(8, read)
-    sys.stdout.write('\n    },\n')
+    sys.stdout.write(f',\n        {num_regs},\n    }},\n')
 
 sys.stdout.write('    { NULL }\n};\n')
-- 
2.39.2
