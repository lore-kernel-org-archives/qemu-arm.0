Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206873wrv;
        Fri, 26 Jul 2019 10:50:47 -0700 (PDT)
X-Received: by 2002:a17:90a:d983:: with SMTP id d3mr97885350pjv.88.1564163447757;
        Fri, 26 Jul 2019 10:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163447; cv=none;
        d=google.com; s=arc-20160816;
        b=tFFQEokr3pFtt+SOhUP60z6MxERc2ZzlzFAhxdAcd6wCC99Laszeo9+jJydeDCtECg
         7PqI/sapwln89310Cd5lXFVmlssIjOy8WHESoZEY+ewUpH/uFn3vqxE7wyY45L/881PS
         MaJj2EKSyB5nute7lHwWcUEvHsyerp72ZzNhO1wV5hAnP5fgOyDZ1afqILygpPxf6hyZ
         dxdXz5wcDM2cORABMgggUnHUJHls5fN4VlYAH+PUX2/Fb9/T+qPQ0RMq4ju/G+6Sf5nr
         7ENaFO239bCnMMORVGvpcCkMaEABIXPEcaRbpD9RU6FGHfKrEsBzkFcOb1dWw7tlY6uR
         zlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=sBwbqU4X+hNE91dFDdhNVeb0wgaIhMrDk27NuEJee50=;
        b=q62lIH3vQ9Pzr8k9qARSlzNvgiDbaBoyUqKH2oIkf7YhHPRb2APxaTelkMyHq/Ekjz
         Br1sArdPNnBMW9lfJItqS4IOHEubSVRw2vHS0IbuxTt7SshwqiOhofUw9DQ0LOuFM0dc
         jWzcMuSoaLlo9v0wL6S33IKxjzGTDoz7bxWxq6mcf7vuQaowGy/Ay5A8kSkfIaJZ00N7
         a9xvhZ4b7fyQxOphogAEVQ9Ql1kPtSxF1DT749O+Aq1FMdoEQ4nNprbb25A9Yzts8anD
         sI4LXKEaWydlAtaG6DFkLlJZOk1tWrsc08ujqlC1emjThkoCb1KOD2gztSLvlycwNyLL
         kQ7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KKS7nzsL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q39sor64934286pjb.7.2019.07.26.10.50.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KKS7nzsL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sBwbqU4X+hNE91dFDdhNVeb0wgaIhMrDk27NuEJee50=;
        b=KKS7nzsLDVSNc1VvbWRcglwTfyMTZEEnYUte/KDEWGqNeypXRZCXi1Dtie8xRm3mZF
         qh/mWdgvddeWWyGwhkf3086WYUK0u23Tb5sb3tyAxdZLnUB310agADpJVgVq/Fgsiflp
         niYozs+Qo6EGdY4n9T3uk82z2B2K01L3LjGYUqwVt+CCk0tgYJ+Kp9lFGnVh1vO/g920
         JYKsXJ0KbM6lDHmR1zICJrVUejvqArz/dEDBp8HLokInn3uxP0BspjK8pPkirhkXy7fu
         Vnz467al7dYqUppYkJGdH1ofy2YeDDIX764PRJA7X8mm/uhXbFcTTQZzq/y3hvcz4KFc
         WMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sBwbqU4X+hNE91dFDdhNVeb0wgaIhMrDk27NuEJee50=;
        b=OCVE8jHOKOk/FkoSeC5FHX61y0g0XD0LLBL/kB4HmrNsPz2txqZhE4Vh/Lt5tXlc/z
         HTGehbRUWGW0h5QOxABxts0RGeZf9B907yJPyzKCcSJa4GdSNSLq29Dw0114KlYeCkMl
         YpLxVjO3UpeYID8oUPbxjKZJ7oNpl664ZIcxILou0L4gZox1PZFxrytO3351uuKnYMNe
         Ef8alzwBFQ/mcVEf7VwVXiF5sFdr5y0N8P2bAS1hVoLar7NptIJ1ziq9ztJ8hAQ6QAkt
         wE1/vkF8Z+JFwdTzbx5YTGOHS7Hdz/y5qPmOQhy/N1BhF3yo5ZcQHO19iI/I3mPdH2Hg
         KoqQ==
X-Gm-Message-State: APjAAAU4oKePDU+zjy1F6ON6mxanYLf6A2xGskKGDaQiqbf+2ILXHhB5
	XFPwdEPl3puGOyTIXgix+KTnFm0b
X-Google-Smtp-Source: APXvYqwfAj7jNE7A1tUSHlSV+Fl/GcN3L2pLyWFK6+Idq2kWBgm74ODlPlrZyUiqUyFKdB1Q57AxHw==
X-Received: by 2002:a17:90a:c68c:: with SMTP id n12mr99655403pjt.33.1564163447257;
        Fri, 26 Jul 2019 10:50:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 11/67] target/arm: Add stubs for aa32 decodetree
Date: Fri, 26 Jul 2019 10:49:36 -0700
Message-Id: <20190726175032.6769-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: ARe+H4DHSXQl

Add the infrastructure that will become the new decoder.
No instructions adjusted so far.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 45 +++++++++++++++++++++++++++++++++++-
 target/arm/Makefile.objs     | 18 +++++++++++++++
 target/arm/a32-uncond.decode | 23 ++++++++++++++++++
 target/arm/a32.decode        | 23 ++++++++++++++++++
 target/arm/t32.decode        | 20 ++++++++++++++++
 5 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/a32-uncond.decode
 create mode 100644 target/arm/a32.decode
 create mode 100644 target/arm/t32.decode

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 36419025db..4738b91957 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7715,6 +7715,33 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
     }
 }
 
+/*
+ * Include the generated decoders.
+ * Note that the T32 decoder reuses some of the trans_* functions
+ * initially declared by the A32 decoder, which results in duplicate
+ * declaration warnings.  Suppress them.
+ */
+
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
+# pragma GCC diagnostic push
+# pragma GCC diagnostic ignored "-Wredundant-decls"
+# ifdef __clang__
+#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
+# endif
+#endif
+
+#include "decode-a32.inc.c"
+#include "decode-a32-uncond.inc.c"
+#include "decode-t32.inc.c"
+
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
+# pragma GCC diagnostic pop
+#endif
+
+/*
+ * Legacy decoder.
+ */
+
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
     unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
@@ -7733,7 +7760,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
     cond = insn >> 28;
-    if (cond == 0xf){
+
+    if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
          * for miscellaneous unconditional instructions.
@@ -7741,6 +7769,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         ARCH(5);
 
         /* Unconditional instructions.  */
+        if (disas_a32_uncond(s, insn)) {
+            return;
+        }
+        /* fall back to legacy decoder */
+
         if (((insn >> 25) & 7) == 1) {
             /* NEON Data processing.  */
             if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
@@ -7953,6 +7986,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
 
     arm_skip_unless(s, cond);
 
+    if (disas_a32(s, insn)) {
+        return;
+    }
+    /* fall back to legacy decoder */
+
     if ((insn & 0x0f900000) == 0x03000000) {
         if ((insn & (1 << 21)) == 0) {
             ARCH(6T2);
@@ -9440,6 +9478,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         ARCH(6T2);
     }
 
+    if (disas_t32(s, insn)) {
+        return;
+    }
+    /* fall back to legacy decoder */
+
     rn = (insn >> 16) & 0xf;
     rs = (insn >> 12) & 0xf;
     rd = (insn >> 8) & 0xf;
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 5cafc1eb6c..7806b4dac0 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -28,9 +28,27 @@ target/arm/decode-vfp-uncond.inc.c: $(SRC_PATH)/target/arm/vfp-uncond.decode $(D
 	  $(PYTHON) $(DECODETREE) --static-decode disas_vfp_uncond -o $@ $<,\
 	  "GEN", $(TARGET_DIR)$@)
 
+target/arm/decode-a32.inc.c: $(SRC_PATH)/target/arm/a32.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_a32 -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/decode-a32-uncond.inc.c: $(SRC_PATH)/target/arm/a32-uncond.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_a32_uncond -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm/t32.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_t32 -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
+target/arm/translate.o: target/arm/decode-a32.inc.c
+target/arm/translate.o: target/arm/decode-a32-uncond.inc.c
+target/arm/translate.o: target/arm/decode-t32.inc.c
 
 obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
new file mode 100644
index 0000000000..8dee26d3b6
--- /dev/null
+++ b/target/arm/a32-uncond.decode
@@ -0,0 +1,23 @@
+# A32 unconditional instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
+# All insns that have 0xf in insn[31:28] are decoded here.
+# All of those that have a COND field in insn[31:28] are in a32.decode
+#
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
new file mode 100644
index 0000000000..2d84a02861
--- /dev/null
+++ b/target/arm/a32.decode
@@ -0,0 +1,23 @@
+# A32 conditional instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
+# All of the insn that have a COND field in insn[31:28] are here.
+# All insns that have 0xf in insn[31:28] are in a32u.decode.
+#
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
new file mode 100644
index 0000000000..ac01fb6958
--- /dev/null
+++ b/target/arm/t32.decode
@@ -0,0 +1,20 @@
+# Thumb2 instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
-- 
2.17.1
