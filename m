Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3733358wrt;
        Mon, 10 Dec 2018 07:28:52 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xm7FrwCVYV4eDfhDAGyvFigJHgQ8Q1VE1gsuEj8DKj/hBN8D/dsEZC/u55qtAGC8dADkXg
X-Received: by 2002:adf:f848:: with SMTP id d8mr11119232wrq.178.1544455732716;
        Mon, 10 Dec 2018 07:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544455732; cv=none;
        d=google.com; s=arc-20160816;
        b=pzSFIvwfJK9/bf/IRWYoHEpe7Fz3B/GlkEZoUWuBz58Wsv1zT1JeOeOzuENoTKM3w5
         FQZ0Nni8J8sPSYYiUHPWNTrD74gLzcT/XdM+Li9JG4zQh3OP/mGkNCwOIF4v32mjExvw
         iqcbs4uSoAoN8RwHAIARdOGALdLsy8td5tchrM9rtWi2XWBjhz3fQ6bZaoyCGrUKMPOR
         kt7WLf1CUgwxx4aFDjMtLvSw7+LD8tAuOiRJckHm80phALq6noTqU4cQu2f3pIoJQA3j
         q5yh/yFGUmEWaa4pOWnnnXw9vkeuOHOBZ8aaPiGowYCR2G45b+5vNeQpiwfuR4IIoxP2
         VRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=ro3nkYlbYtcN/Qzsup18/bjuJTeVmZOQ1xw16hjybt4=;
        b=VyFcrRx+nUXe1R/kR9+cwi6OMeji6sbd2QfkJ6MKqCz5k7f6KQeF8fBY0PKT5huCZ6
         8U4mrXZG2tix1q6LVtentwfkOvuNBPYpKWUtkCFqIhgy/rEkamhmGErIlQzikCUDdIoG
         bSrH+Azzum5lHA6kJMTyLx/cphsuGlIpBiiboNTvo0a0UyY6LhbGv0kHbKSnxLAqrcCp
         tvkxLG2gfWdWHoC9dIrWAz3VK25q6pBfOxr/Zn9KzQR7cVBKg9ZhEit6YIlPIYjvdGXQ
         URCy7MDr0ovGtdIjh8kdi8mh1VA7/BcikUK3Sv2AMgyXhsHFoQcy45b1Te9FWLxMRNqp
         YvmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id a10si8085783wrh.180.2018.12.10.07.28.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Dec 2018 07:28:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gWNUJ-00009o-Kw; Mon, 10 Dec 2018 15:28:51 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Emit barriers for A32/T32 load-acquire/store-release insns
Date: Mon, 10 Dec 2018 15:28:50 +0000
Message-Id: <20181210152850.435-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /DkKRgA+T+9N

Now that MTTCG is here, the comment in the 32-bit Arm decoder that
"Since the emulation does not have barriers, the acquire/release
semantics need no special handling" is no longer true. Emit the
correct barriers for the load-acquire/store-release insns, as
we already do in the A64 decoder.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've not run into this in practice, and there's very little
aarch32 code out there that is built to use the new-in-v8
instructions as far as I'm aware, but since it would be very
painful to track down this bug if we ran into it in the
wild it seems worth fixing...
---
 target/arm/translate.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7c4675ffd8a..e8fd824f3f5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9733,6 +9733,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     rd = (insn >> 12) & 0xf;
                     if (insn & (1 << 23)) {
                         /* load/store exclusive */
+                        bool is_ld = extract32(insn, 20, 1);
+                        bool is_lasr = !extract32(insn, 8, 1);
                         int op2 = (insn >> 8) & 3;
                         op1 = (insn >> 21) & 0x3;
 
@@ -9760,11 +9762,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                         addr = tcg_temp_local_new_i32();
                         load_reg_var(s, addr, rn);
 
-                        /* Since the emulation does not have barriers,
-                           the acquire/release semantics need no special
-                           handling */
+                        if (is_lasr && !is_ld) {
+                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+                        }
+
                         if (op2 == 0) {
-                            if (insn & (1 << 20)) {
+                            if (is_ld) {
                                 tmp = tcg_temp_new_i32();
                                 switch (op1) {
                                 case 0: /* lda */
@@ -9810,7 +9813,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                                 }
                                 tcg_temp_free_i32(tmp);
                             }
-                        } else if (insn & (1 << 20)) {
+                        } else if (is_ld) {
                             switch (op1) {
                             case 0: /* ldrex */
                                 gen_load_exclusive(s, rd, 15, addr, 2);
@@ -9847,6 +9850,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             }
                         }
                         tcg_temp_free_i32(addr);
+
+                        if (is_lasr && is_ld) {
+                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+                        }
                     } else if ((insn & 0x00300f00) == 0) {
                         /* 0bcccc_0001_0x00_xxxx_xxxx_0000_1001_xxxx
                         *  - SWP, SWPB
@@ -10862,6 +10869,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_gen_addi_i32(tmp, tmp, s->pc);
                 store_reg(s, 15, tmp);
             } else {
+                bool is_lasr = false;
+                bool is_ld = extract32(insn, 20, 1);
                 int op2 = (insn >> 6) & 0x3;
                 op = (insn >> 4) & 0x3;
                 switch (op2) {
@@ -10883,12 +10892,18 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 case 3:
                     /* Load-acquire/store-release exclusive */
                     ARCH(8);
+                    is_lasr = true;
                     break;
                 }
+
+                if (is_lasr && !is_ld) {
+                    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+                }
+
                 addr = tcg_temp_local_new_i32();
                 load_reg_var(s, addr, rn);
                 if (!(op2 & 1)) {
-                    if (insn & (1 << 20)) {
+                    if (is_ld) {
                         tmp = tcg_temp_new_i32();
                         switch (op) {
                         case 0: /* ldab */
@@ -10927,12 +10942,16 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         }
                         tcg_temp_free_i32(tmp);
                     }
-                } else if (insn & (1 << 20)) {
+                } else if (is_ld) {
                     gen_load_exclusive(s, rs, rd, addr, op);
                 } else {
                     gen_store_exclusive(s, rm, rs, rd, addr, op);
                 }
                 tcg_temp_free_i32(addr);
+
+                if (is_lasr && is_ld) {
+                    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+                }
             }
         } else {
             /* Load/store multiple, RFE, SRS.  */
-- 
2.19.2
