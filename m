Received: by 10.25.0.147 with SMTP id 141csp139815lfa;
        Mon, 20 Feb 2017 10:41:16 -0800 (PST)
X-Received: by 10.28.95.87 with SMTP id t84mr19961282wmb.135.1487616075950;
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id r15si24938293wrr.217.2017.02.20.10.41.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfstf-0005qf-CG; Mon, 20 Feb 2017 18:41:15 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 3/4] arm: Enforce should-be-1 bits in MRS decoding
Date: Mon, 20 Feb 2017 18:41:11 +0000
Message-Id: <1487616072-9226-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
X-TUID: bPb2LydD+IDX

The MRS instruction requires that bits [19..16] are all 1s, and for
A/R profile also that bits [7..0] are all 0s.  At this point in the
decode tree we have checked all of the rest of the instruction but
were allowing these to be any value.  If these bits are not set then
the result is architecturally UNPREDICTABLE, but choosing to UNDEF is
more helpful to the user and avoids unexpected odd behaviour if the
encodings are used for some purpose in future architecture versions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0f8548f..9090356 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10498,6 +10498,14 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                             break;
                         }
 
+                        if (extract32(insn, 16, 4) != 0xf) {
+                            goto illegal_op;
+                        }
+                        if (!arm_dc_feature(s, ARM_FEATURE_M) &&
+                            extract32(insn, 0, 8) != 0) {
+                            goto illegal_op;
+                        }
+
                         /* mrs cpsr */
                         tmp = tcg_temp_new_i32();
                         if (arm_dc_feature(s, ARM_FEATURE_M)) {
@@ -10525,6 +10533,12 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
                             goto illegal_op;
                         }
+
+                        if (extract32(insn, 16, 4) != 0xf ||
+                            extract32(insn, 0, 8) != 0) {
+                            goto illegal_op;
+                        }
+
                         tmp = load_cpu_field(spsr);
                         store_reg(s, rd, tmp);
                         break;
-- 
2.7.4
