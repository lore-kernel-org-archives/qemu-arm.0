Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp363882ejs;
        Wed, 16 Aug 2023 06:40:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:248e:b0:66f:578c:59fb with SMTP id c14-20020a056a00248e00b0066f578c59fbmr2074553pfv.10.1692193228665;
        Wed, 16 Aug 2023 06:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193228; cv=none;
        d=google.com; s=arc-20160816;
        b=DKBm3ckq7+WfZKKx6+X8VNggXiT79vQCkhANB6EjV5pxCO/4PZa8/cBtDH2i1JSXvR
         3Zqb+Ej3m3kj+Xr22PiUM3kdImmkhdIpTyxVEd7dBp9nUTWnV07veK3MfWyApbdxpmDO
         vGT0v6nOrlpgVVJ132CC3Z4duwZPnrfAnwvITNrBEqzosDtneXl/J4FJRrx4FxNpDqFW
         I0rrcTY8CIZ7jvewzOOLWL0JmoufGVDpnxcQ64sM9gG4iWH1iDOravvhQIFiVAA3qspC
         92wTTjk+duWAkaw9bqDEt9HaGuvALAi8T+rF9qH42EPIvg7OBocadV7YNxUaf7WIQj/C
         0Q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vSruWoyKlAWxyFcMWhzZ8sPLB2mqbg+J6UjZbva0yr8=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=nxpdSvfjH2cLOIqFW30XvW8MD09917/KnUasfgQ/iCTGO7MfqqSZPn2P2bCul04MuG
         y0zdzayR2/etxJAENV5m8F/ruIEuy7J4KJNCncx78qCCgBf8AXJ6l805CoDH5GpgP6II
         rM+U7sfCPVxJSEzz0o0QerycxP6h/rUPhlOqAkq2fpuP3GS+7aM2kE4q0wUN++U/vnq2
         q579DXOQlfo5PmXi4mW+R0x2L7DC7eXlvl078Sr9u99piF9A+QISjkn3+gIeaG8qdxGy
         sHRlfhdpWHdztbNPPP/7oq8uX/6oTBlmOuRMf0ZBARwOxm4wRr55JiThn/kcFjNzP+jC
         0iTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=lWcfeNWS;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d19-20020aa797b3000000b0067a50509b56sor8617256pfq.1.2023.08.16.06.40.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:40:28 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=lWcfeNWS;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193228; x=1692798028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSruWoyKlAWxyFcMWhzZ8sPLB2mqbg+J6UjZbva0yr8=;
        b=lWcfeNWSrilioV4K6gVit7/JTo4Khtsb5o+k6wAWxbYrbpaMosJuNUmrvyqzDwcEI5
         VgqCHcafMzAb/A5VzYfAvshcflKOdfp/EDj9Ye/HdX90mPQ23vO3Zxa/iIM08Gi2n0e6
         /OQYvKwkSAE9zz0Wx6mU+iG+NOB6DtXM/K7bOKZwQMthViV4uceTHZKUsJ9RulnkiOcq
         n4gMOs6l9HtfevCwPCEIesSbg614X0nkv4TlQIUGlZr82KdESdvKYD1aK5EO6sqBG5Xo
         gHxFztB9AhDjnbxHkVfW7j6hK/1Zp3bTKe123XSzJ9BUP5Opxkqf45o5jO0xkSChLgvL
         pOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193228; x=1692798028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSruWoyKlAWxyFcMWhzZ8sPLB2mqbg+J6UjZbva0yr8=;
        b=hgE9oT2zY+cPuQs8Kb+TdoCRRnUYu+YdLMZlJLo3BYyLWdMmjffiFi+NqT7wxOwiHE
         ddfe4Xzw7pQNP1dnEX9Hkl5hYzsmQHo0/wpm5DwEkfiB1xXLrpftv+YnePexl3epCGll
         nmGAI5NwCOeNaaLSrraoXLPEDYLNrswSNuVsVmHmSM88jnqKnPoms86A3JNcy/DgFOwp
         FS8K7jwqHpWVC/iN8rBGvJZH86AqOldT6m96RGHzDq4cnOTosOjU93SiSAWn6/KDTZn8
         s5MnmRGzxv5ZN3s75rgFC01zn6seH2JoF4UzShosU5FCeUF7jq/MMNndD4OmXu3g2pD+
         CozA==
X-Gm-Message-State: AOJu0YwbMeKk9/xA4coQCcTe3E2f5hRE2CzVttQMKOh3xaQMDWyx0IyW
	1lHyfEx3se13XsJ8hih+JT4qdA==
X-Google-Smtp-Source: AGHT+IHAxYSdSjQWaGmfG9c0nFiZZfUmg2yI3S0ZsR/2ei02wINQceyfl6kmnA3FV7lgzOHG9mRCkA==
X-Received: by 2002:a05:6a00:17a2:b0:667:85e6:4e9 with SMTP id s34-20020a056a0017a200b0066785e604e9mr2033162pfg.24.1692193228050;
        Wed, 16 Aug 2023 06:40:28 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:40:27 -0700 (PDT)
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
Subject: [PATCH v3 02/25] gdbstub: Introduce GDBFeature structure
Date: Wed, 16 Aug 2023 22:39:12 +0900
Message-ID: <20230816133938.18310-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w4GkRUB7N7Po

Before this change, the information from a XML file was stored in an
array that is not descriptive. Introduce a dedicated structure type to
make it easier to understand and to extend with more fields.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
