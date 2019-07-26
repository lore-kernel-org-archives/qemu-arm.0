Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207495wrv;
        Fri, 26 Jul 2019 10:51:27 -0700 (PDT)
X-Received: by 2002:a63:2148:: with SMTP id s8mr90456583pgm.336.1564163487406;
        Fri, 26 Jul 2019 10:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163487; cv=none;
        d=google.com; s=arc-20160816;
        b=ncxi459g/YinP+AWBtS7YfISWimtNEtu3+TYlrmqRT+rD4fCfQXfPzSQm4A//2tgis
         EUq8U04QDET7VhgOt5xM3SD6wAzTeuBGBMzcPHdzF2ytSqrnRza+6zOgmNVn8Ie+tleH
         N4YOaj7oXW7mBdEjTqykvNsVza1lkreen5wmh7XmS3CxzD1tdVpfj5oHdP4JxB+tMNtf
         XV3hcGBbnhJeBKUTvniHp1nFpmvDKgD09kV5tQ47NNE6UnUYui8GmqWErlsYzcXqX0e6
         Dl3AUs1dh01uoM3i+Ctom5fdA9bJ2e7HZwWWfb1eld8tPD4NYRoZ0xRSGASLOPnYWFkz
         mkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=BeJ+pb6ctnzLHVd1R33fd022stp222LK5CW6SHtredI=;
        b=AJE/Exhj8+59+mQl8130dC7FkTtb4z53enRcGYLlRRJvI/exjrCBlNJ6Aghw3CaF5i
         aPIOyhhEoaxkyy24ITll95p7UczlIOjsdwYA3jvYKXg5DLWSOL5GpxnwaIGoiZepJTCE
         zrd68fz1kpAUrIXeavahp7iCfiznOC1RX+SFEfYH68QNer4VidErvN+uKd34zLy8++e0
         8Os0TedyBiYjc7SQfrmX8S4n6SIum8zktA0J7QFCo6FYY3njvXNBq5RssDkjcKO5Pqj3
         U10u0nUREyzmtRlCyesBcgRAcCFB8nesS2JGwBZDsrOufr7Jmha42to3aHPRiaPYknFB
         HgRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZqwVVtH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l98sor64364598pje.13.2019.07.26.10.51.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZqwVVtH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BeJ+pb6ctnzLHVd1R33fd022stp222LK5CW6SHtredI=;
        b=pZqwVVtHLxWhL94AkDYYgYTXk1sGL8fnfLESWlIPloluyfnCXCrXrlQok3gH3Hod8O
         2DN/m31BMtPDGnBdhJnjasfsVoc1IaApeEhwh1gauPzgOg1nOlUkhOAb5YQ6cMKc/uuI
         xTXO7w0KqHU9ePwl25vFJ9t3j7lZhhIm7LfaLB8VS09mSmvVza6OBAZSlvZVjEfNO3YV
         WXcJJWCrCyq9Qgp0PpBCC62jmn4n3hhYfoJdDWrERwKza+p4pLDjfCeSPRmNW11iy9o9
         5FqdDPpou1NF9S7wRRJGkdWOIZVsgWB6ygCM6m1oF75PJucJWmwWIY3scZSG3DpS5Wkg
         NReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BeJ+pb6ctnzLHVd1R33fd022stp222LK5CW6SHtredI=;
        b=gpUVxnJtBdrYtDVosEvgqr2v5tFSNKe2g3ZqzHFNF5Tg+PzI8PFVKFGmg6gdk/4+se
         qgu+vRkhoxID5Ew09MlaLSscivKRaIPem0Kw8NPhzVj5WIJIdHl9irbI2WuwuC1eTccr
         3QbFFO904F/f0AEAHIAmesqF04P6Da+uGppwAh/cnP6mpdhY/TdeJ+kle8x2Tk00Zvdc
         XhAijAiGcbPJCb98g2h+7C6pzNuGo8CGQS8zDF1h6N28QW5Y3wc6G4LkCcY+k5Nkn0Iu
         kTJqN0byHABXvG8JXvN/qumnLy4mh7FGa3K/XXy8Iu1m5wPkmUZ09TKVfKBUkY8wfbnN
         ONNg==
X-Gm-Message-State: APjAAAVlVzy8nLNVJAAhU7ijUpZAgUPl3JEfYYnNja1flU3OVaochRMg
	YLlCAZMJYuFqqTueFBnh+fwtcZJ7yzUNRQ==
X-Google-Smtp-Source: APXvYqyyL/u9LNINsiyDFyavW78h1Dk6i2x2dIqu+MObX9ZfP0f3qjYsFRteY92tHudJA9VVOSK1Aw==
X-Received: by 2002:a17:90a:d814:: with SMTP id a20mr99531064pjv.48.1564163486971;
        Fri, 26 Jul 2019 10:51:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 43/67] target/arm: Add skeleton for T16 decodetree
Date: Fri, 26 Jul 2019 10:50:08 -0700
Message-Id: <20190726175032.6769-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: LYsOdVfh0Wue

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c   |  6 ++++++
 target/arm/Makefile.objs |  6 ++++++
 target/arm/t16.decode    | 20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 target/arm/t16.decode

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 65a74a963b..db93b12608 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7608,6 +7608,7 @@ static int t32_branch24(DisasContext *s, int x)
 #include "decode-a32.inc.c"
 #include "decode-a32-uncond.inc.c"
 #include "decode-t32.inc.c"
+#include "decode-t16.inc.c"
 
 #ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 # pragma GCC diagnostic pop
@@ -10559,6 +10560,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     TCGv_i32 tmp2;
     TCGv_i32 addr;
 
+    if (disas_t16(s, insn)) {
+        return;
+    }
+    /* fall back to legacy decoder */
+
     switch (insn >> 12) {
     case 0: case 1:
 
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 7806b4dac0..cf26c16f5f 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -43,12 +43,18 @@ target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm/t32.decode $(DECODETREE)
 	  $(PYTHON) $(DECODETREE) --static-decode disas_t32 -o $@ $<,\
 	  "GEN", $(TARGET_DIR)$@)
 
+target/arm/decode-t16.inc.c: $(SRC_PATH)/target/arm/t16.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) -w 16 --static-decode disas_t16 -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 target/arm/translate.o: target/arm/decode-a32.inc.c
 target/arm/translate.o: target/arm/decode-a32-uncond.inc.c
 target/arm/translate.o: target/arm/decode-t32.inc.c
+target/arm/translate.o: target/arm/decode-t16.inc.c
 
 obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
new file mode 100644
index 0000000000..e954f61fe4
--- /dev/null
+++ b/target/arm/t16.decode
@@ -0,0 +1,20 @@
+# Thumb1 instructions
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
