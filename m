Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp839018ejs;
        Wed, 16 Aug 2023 22:31:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1821:b0:63a:ea82:b7b7 with SMTP id y33-20020a056a00182100b0063aea82b7b7mr5323174pfa.28.1692250264452;
        Wed, 16 Aug 2023 22:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692250264; cv=none;
        d=google.com; s=arc-20160816;
        b=Efdk+96EdblcrIZSpVnNzQpzMumX+F8e16WyS+ogAdeqKqpYh2PObI2pvJrWrGsRjX
         +VRP01mgi0uw5GBmwTaJ/51Cxy9p3WYssTKpkfefLGU4BqzoLclv/iyBfdlfSHYzApCF
         sHC8xm3/AHV+nqJJyUCgNhUyg0GdnVtIWh8ABwC6LFXM+wkyZCSxTjmN0YFhCsObJzID
         t6yl54TX5dKU2O/Zcf//vYpvRbXoV9xbdE+V9V3F7jzU3nvpfLRCfXDvgGfNnErlUcYr
         EVohEHIHeTNVwvdZZBb1vwKLb0MH6ByuONVdAuJ8+V/BbyEwzvsjrdIVKI4ihr2cgF2e
         2bZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3YJsyqXQrs0zcYRn0vpvlIS4/nJLrndNcBYxxc7MqeI=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=FTXVeBhtA9IT6tGlLvyyrTUcUndYEaJ0qSkEW/QwNHbOHmTP+Fbiqjc/QuBspMQFeX
         RPqMjvKgxxi6e6Tp/6wbRN6KIRb3zt/62yoIfOMxTiJJT/hRYActzX2NLmZ2jSVlin8K
         FpWdCEkfRFjJ+hQ8UXM+SY+bMcXUQyIbdfHBItxDoEwBPt1hw3cwTiCQvWwmge/zZUZj
         7NaSh+j/3uxvjUof1CtMrSPXjKnhVEvHhp/MXo8LX7PQ7Dn/lI298J2NUDIkzrxWfvDh
         nQlrJ1HFeXmgM8eru5TLQP+/N1f6ZuVXCcqM01TP4pjXp4LR6YKe20P/t2bHoR3ytWgp
         Xqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="Yq0K/vqD";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3-20020a656a83000000b00553ced07d25sor8892720pgu.1.2023.08.16.22.31.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 22:31:04 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="Yq0K/vqD";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692250264; x=1692855064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YJsyqXQrs0zcYRn0vpvlIS4/nJLrndNcBYxxc7MqeI=;
        b=Yq0K/vqD/1EHdOabHNcv6m6dA45CUMETlhSNhyjN8b1stZVcotyxb47NJjHDbGUC+P
         VApeRnwx94K8WM2yJ7r8L1R3PVC5W5/JeJX12sI97LwCOK2AUG6iVv4Yn+RgiqTlH55t
         EmoUqo8Z6Z/DYAxguojkTiO/PJNsyIeHznciSyzx+pilpdqLcqFN9BqmQEYA7lNmqno1
         3id6/bCRfWq3FgdtjUVxpzIBr5xsZTdQPKw+J0YYF04GWTURexzc4vX63WYeDnG8Uqff
         k+7AmBFT+17aUIMXunbvv6wLFf3L8Ca9v2t3Pw1hkZ/ABNsGmUSuFueE/rjEa9FDdTHl
         BQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692250264; x=1692855064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YJsyqXQrs0zcYRn0vpvlIS4/nJLrndNcBYxxc7MqeI=;
        b=DEe19mLgzjw9NgBn/JFYmxcbCQdyevBXwtfVIABHyEfW7XUdFX4Z+3mGarZh/RsklB
         BLqnz71COZrIFAB5120xCOo/lCGG60lFydKDOO6qHvYSZybJ3s1/3d57wDhYUdbpyo7n
         2K78LAT7ptL6KF/Ge43g1pR4pAuZGZPVRdf1oIg1pOkS4Qrbk0/Ke4F0lUecleuWkjXd
         nDtvyDmNi7zkBwZb9SPB5q0OqWAVUquW01M5N8p+lqxI8KX7egU5vQnQQcyMaNeQf/wR
         us7oR8NlciAm1FhKnjlm1FTovvyDniFK7yAzKhGS2iK08YWr3ILbnKivtxX53NbXPxfp
         ntEQ==
X-Gm-Message-State: AOJu0Yxz60/J4/DehmoIP2AfAo5gOZ3C/WdsqSBOmcastUYtUgWm4Rz1
	dlIX+5vQ8U4okmXeRDIuz7edCw==
X-Google-Smtp-Source: AGHT+IGohJ4arQgjWPKQ6Y0C0neDY+rTALpZMMlksc4jEekITq5ermMN4i8ZMA+XFlwopvPV9Hm3Tg==
X-Received: by 2002:a05:6a21:7888:b0:140:f6c4:aa71 with SMTP id bf8-20020a056a21788800b00140f6c4aa71mr5969283pzc.8.1692250263857;
        Wed, 16 Aug 2023 22:31:03 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j18-20020aa783d2000000b00662610cf7a8sm12339407pfn.172.2023.08.16.22.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 22:31:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 02/26] gdbstub: Introduce GDBFeature structure
Date: Thu, 17 Aug 2023 14:29:49 +0900
Message-ID: <20230817053017.24207-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817053017.24207-1-akihiko.odaki@daynix.com>
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cI7JpGnxYkE+

Before this change, the information from a XML file was stored in an
array that is not descriptive. Introduce a dedicated structure type to
make it easier to understand and to extend with more fields.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS             |  2 +-
 meson.build             |  2 +-
 include/exec/gdbstub.h  |  9 ++++--
 gdbstub/gdbstub.c       |  4 +--
 stubs/gdbstub.c         |  6 ++--
 scripts/feature_to_c.py | 48 ++++++++++++++++++++++++++++
 scripts/feature_to_c.sh | 69 -----------------------------------------
 7 files changed, 62 insertions(+), 78 deletions(-)
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 12e59b6b27..514ac74101 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2826,7 +2826,7 @@ F: include/exec/gdbstub.h
 F: include/gdbstub/*
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
-F: scripts/feature_to_c.sh
+F: scripts/feature_to_c.py
 F: scripts/probe-gdb-support.py
 
 Memory API
diff --git a/meson.build b/meson.build
index 98e68ef0b1..5c633f7e01 100644
--- a/meson.build
+++ b/meson.build
@@ -3683,7 +3683,7 @@ common_all = static_library('common',
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
 
-feature_to_c = find_program('scripts/feature_to_c.sh')
+feature_to_c = find_program('scripts/feature_to_c.py')
 
 if targetos == 'darwin'
   entitlement = find_program('scripts/entitlement.sh')
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 7d743fe1e9..3f08093321 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -10,6 +10,11 @@
 #define GDB_WATCHPOINT_READ      3
 #define GDB_WATCHPOINT_ACCESS    4
 
+typedef struct GDBFeature {
+    const char *xmlname;
+    const char *xml;
+} GDBFeature;
+
 
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
@@ -38,7 +43,7 @@ void gdb_set_stop_cpu(CPUState *cpu);
  */
 extern bool gdb_has_xml;
 
-/* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
-extern const char *const xml_builtin[][2];
+/* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
+extern const GDBFeature gdb_static_features[];
 
 #endif
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 6911b73c07..2772f07bbe 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -407,11 +407,11 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
     }
     for (i = 0; ; i++) {
-        name = xml_builtin[i][0];
+        name = gdb_static_features[i].xmlname;
         if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
             break;
     }
-    return name ? xml_builtin[i][1] : NULL;
+    return name ? gdb_static_features[i].xml : NULL;
 }
 
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
diff --git a/stubs/gdbstub.c b/stubs/gdbstub.c
index 2b7aee50d3..580e20702b 100644
--- a/stubs/gdbstub.c
+++ b/stubs/gdbstub.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"       /* xml_builtin */
+#include "exec/gdbstub.h"       /* gdb_static_features */
 
-const char *const xml_builtin[][2] = {
-  { NULL, NULL }
+const GDBFeature gdb_static_features[] = {
+  { NULL }
 };
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
new file mode 100755
index 0000000000..bcbcb83beb
--- /dev/null
+++ b/scripts/feature_to_c.py
@@ -0,0 +1,48 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os, sys
+
+def writeliteral(indent, bytes):
+    sys.stdout.write(' ' * indent)
+    sys.stdout.write('"')
+    quoted = True
+
+    for c in bytes:
+        if not quoted:
+            sys.stdout.write('\n')
+            sys.stdout.write(' ' * indent)
+            sys.stdout.write('"')
+            quoted = True
+
+        if c == b'"'[0]:
+            sys.stdout.write('\\"')
+        elif c == b'\\'[0]:
+            sys.stdout.write('\\\\')
+        elif c == b'\n'[0]:
+            sys.stdout.write('\\n"')
+            quoted = False
+        elif c >= 32 and c < 127:
+            sys.stdout.write(c.to_bytes(1, 'big').decode())
+        else:
+            sys.stdout.write(f'\{c:03o}')
+
+    if quoted:
+        sys.stdout.write('"')
+
+sys.stdout.write('#include "qemu/osdep.h"\n' \
+                 '#include "exec/gdbstub.h"\n' \
+                 '\n'
+                 'const GDBFeature gdb_static_features[] = {\n')
+
+for input in sys.argv[1:]:
+    with open(input, 'rb') as file:
+        read = file.read()
+
+    sys.stdout.write('    {\n')
+    writeliteral(8, bytes(os.path.basename(input), 'utf-8'))
+    sys.stdout.write(',\n')
+    writeliteral(8, read)
+    sys.stdout.write('\n    },\n')
+
+sys.stdout.write('    { NULL }\n};\n')
diff --git a/scripts/feature_to_c.sh b/scripts/feature_to_c.sh
deleted file mode 100644
index c1f67c8f6a..0000000000
--- a/scripts/feature_to_c.sh
+++ /dev/null
@@ -1,69 +0,0 @@
-#!/bin/sh
-
-# Convert text files to compilable C arrays.
-#
-# Copyright (C) 2007 Free Software Foundation, Inc.
-#
-# This file is part of GDB.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, see <http://www.gnu.org/licenses/>.
-
-if test -z "$1"; then
-  echo "Usage: $0 INPUTFILE..."
-  exit 1
-fi
-
-for input; do
-  arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
-
-  ${AWK:-awk} 'BEGIN { n = 0
-      printf "#include \"qemu/osdep.h\"\n"
-      print "static const char '$arrayname'[] = {"
-      for (i = 0; i < 255; i++)
-        _ord_[sprintf("%c", i)] = i
-    } {
-      split($0, line, "");
-      printf "  "
-      for (i = 1; i <= length($0); i++) {
-        c = line[i]
-        if (c == "'\''") {
-          printf "'\''\\'\'''\'', "
-        } else if (c == "\\") {
-          printf "'\''\\\\'\'', "
-        } else if (_ord_[c] >= 32 && _ord_[c] < 127) {
-	  printf "'\''%s'\'', ", c
-        } else {
-          printf "'\''\\%03o'\'', ", _ord_[c]
-        }
-        if (i % 10 == 0)
-          printf "\n   "
-      }
-      printf "'\''\\n'\'', \n"
-    } END {
-      print "  0 };"
-    }' < $input
-done
-
-echo
-echo '#include "exec/gdbstub.h"'
-echo "const char *const xml_builtin[][2] = {"
-
-for input; do
-  basename=$(echo $input | sed 's,.*/,,')
-  arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
-  echo "  { \"$basename\", $arrayname },"
-done
-
-echo "  { (char *)0, (char *)0 }"
-echo "};"
-- 
2.41.0
