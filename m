Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025174ejb;
        Mon, 31 Jul 2023 01:44:32 -0700 (PDT)
X-Received: by 2002:a0c:c304:0:b0:63c:fe27:79ac with SMTP id f4-20020a0cc304000000b0063cfe2779acmr8388201qvi.1.1690793072561;
        Mon, 31 Jul 2023 01:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793072; cv=none;
        d=google.com; s=arc-20160816;
        b=FSeHYoId0YwqFPfQr/EjMG/zlVxrrzKCbh2pqmbl/TqGY+d2xc0AIpOQhnkygPjNPj
         vjr9negGkrWGccFMmiUwz9xwFvq4UQX4JbuZpxJIzLvIweJh22u9WK+mtL2iqH2OSmHD
         OHN00C0umNthntqMLvKlkffRFBJ6MXSEQtGLQJ5W/0RP14SteXetAi0wuL78Th1S8fbV
         dQbFDZjuFLqCqQs6YkWHpXeMj3qlmu7R4gBYSIwJVQ8bR3pKbrxMBSQbOSR2Bo8HYqNF
         YerPtwjxybklE1wQ6R2V3s+yLqzqW1AuqSn675ag2YTfh1nJ23neC6b2wt9MeqpeyGpK
         mr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VkgSGwMXDjUkTeTAm5YYf6l6h2mj4NduaQleFrB8R9Y=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=hLKf6FgfAXIU5UBOCgkNFKNvwgo5lnfTR7ivvxkXQaLFoRsSJKfWbYeyU5shidUkH8
         C0b9HJecIzNZu1eziztl0HyU4hmOehXJIMVIa1WGCB+xcT9G/vyj49J/XCer6ayRhcCx
         cd8O2iL1DvI2ITafbDYs4urvy6v5rHqfXbyPEOBdpAQwOKEPs3IVR57TNgrpFqxZzRxc
         NJgE+s8TrJyaE66q0TRsObJRJe2xiLO/MRruQp7TjupXLyict3aiU2q9wZVvCSWaZaAH
         ClAb3CBXVx+4H/D6mkRS3NpFwsJop1MxsDGGgLv0XZXSnwSzb0bJClEUXSZJh9HvxPUc
         W64A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="5UK9/A8r";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9-20020a05620a090900b007683d77c07asor882162qkv.18.2023.07.31.01.44.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:44:32 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="5UK9/A8r";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793072; x=1691397872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkgSGwMXDjUkTeTAm5YYf6l6h2mj4NduaQleFrB8R9Y=;
        b=5UK9/A8rpMnrGdvfjZ2TBJxwVehxPdYe6V3yj5b/vvub3fGAUPjMSWRWHjJaTzkR82
         Qn0zGsVmjkmb5Gu/NyfW+l5BEYyzHkXi3lm1fySYmydMDWFjsCsuAUS+7GkewYtBJ2Nn
         Va/WXLsJCvfA+/adL7WYzwfzYFB5WhKCI1i3qjPycKZUbhuUcePFHqGhJ4LcjMby2tdX
         zS1bu6S51Yxov4aVhKDVqFjl2MHB/PqSAt8LfVGJNXJNIAQwUINoHBE4yERuZRpwV4en
         6nAaQt4qbyPPr99xEKRcWnRP4IhQpO/KWMxadT1xNlcVIlQxeK2IXmkHXZ7YhmBgLCnv
         Qe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793072; x=1691397872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkgSGwMXDjUkTeTAm5YYf6l6h2mj4NduaQleFrB8R9Y=;
        b=ZPknAj4HSG3s8fM9+mhqjrz9cOwaINor+gKeB09x1GyCdzNoeAwnrH8g0u6ZrfNmwW
         BdNb3zzSIfH3WMWl1kRmM5f8x9MtCcQyfMPuG5Z8SJCWUKej7yTtwDb5CxeHsLoMgvzH
         4gSX4FAizpQxY/ykdaY5YPPuPl/vP6CaWcyIABwBv2sH23sbivINPwhkDM2cpf8KuKgP
         6DJswJS+X/D32uzmK0W9mwstnkm079ZwTa6cKg8UYY8ILWiwZlwR8+vnzuaxPmkXiFeH
         iYQOysZf7yB8wwF6KzcTrKcXShLp3CviE5Ebk9SRcjj2gzEPRieBDOcfSuj+ESEoFfwU
         IXKA==
X-Gm-Message-State: ABy/qLZUp0MY8KQtIXePX728G3LJ8TuqLs2VQeZ0SKBOZBBu98yx9pOV
	+vtBhMOcZMySICAhSVwnG1dhNw==
X-Google-Smtp-Source: APBJJlEgu1SZVKwLEqrb59FQIA4gzFwmerM2s4pqVp9VU5zP6SrViNqlNYqqR9MUvwu5RMdrIeoJww==
X-Received: by 2002:a05:620a:454b:b0:76c:a564:c8b5 with SMTP id u11-20020a05620a454b00b0076ca564c8b5mr5029111qkp.7.1690793072114;
        Mon, 31 Jul 2023 01:44:32 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:44:31 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 02/24] gdbstub: Introduce GDBFeature structure
Date: Mon, 31 Jul 2023 17:43:29 +0900
Message-ID: <20230731084354.115015-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jNw7YA/x7C1J

Before this change, the information from a XML file was stored in an
array that is not descriptive. Introduce a dedicated structure type to
make it easier to understand and to extend with more fields.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS             |  2 +-
 meson.build             |  2 +-
 include/exec/gdbstub.h  |  9 ++++--
 gdbstub/gdbstub.c       |  4 +--
 stubs/gdbstub.c         |  6 ++--
 scripts/feature_to_c.py | 44 ++++++++++++++++++++++++++
 scripts/feature_to_c.sh | 69 -----------------------------------------
 7 files changed, 58 insertions(+), 78 deletions(-)
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
index 7d743fe1e9..bd5bc91dda 100644
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
+extern const GDBFeature gdb_features[];
 
 #endif
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 6911b73c07..fad70200d8 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -407,11 +407,11 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
     }
     for (i = 0; ; i++) {
-        name = xml_builtin[i][0];
+        name = gdb_features[i].xmlname;
         if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
             break;
     }
-    return name ? xml_builtin[i][1] : NULL;
+    return name ? gdb_features[i].xml : NULL;
 }
 
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
diff --git a/stubs/gdbstub.c b/stubs/gdbstub.c
index 2b7aee50d3..324d17f045 100644
--- a/stubs/gdbstub.c
+++ b/stubs/gdbstub.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"       /* xml_builtin */
+#include "exec/gdbstub.h"       /* gdb_features */
 
-const char *const xml_builtin[][2] = {
-  { NULL, NULL }
+const GDBFeature gdb_features[] = {
+  { NULL }
 };
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
new file mode 100755
index 0000000000..5a5b49367b
--- /dev/null
+++ b/scripts/feature_to_c.py
@@ -0,0 +1,44 @@
+#!/usr/bin/env python3
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
+sys.stdout.write('#include "qemu/osdep.h"\n#include "exec/gdbstub.h"\n\nconst GDBFeature gdb_features[] = {\n')
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
