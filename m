Received: by 10.25.0.147 with SMTP id 141csp139839lfa;
        Mon, 20 Feb 2017 10:41:19 -0800 (PST)
X-Received: by 10.84.162.204 with SMTP id o12mr33793630plg.132.1487616079663;
        Mon, 20 Feb 2017 10:41:19 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id n9si7942950pgd.155.2017.02.20.10.41.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 10:41:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfste-0005qQ-TT; Mon, 20 Feb 2017 18:41:14 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 2/4] arm: Don't decode MRS(banked) or MSR(banked) for M profile
Date: Mon, 20 Feb 2017 18:41:10 +0000
Message-Id: <1487616072-9226-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 0VjUg32QGBDv

M profile doesn't have the MSR(banked) and MRS(banked) instructions
and uses the encodings for different kinds of M-profile MRS/MSR.
Guard the relevant bits of the decode logic to make sure we don't
accidentally fall into them by accident on M-profile.

(The bit being checked for this (bit 5) is part of the SYSm field on
M-profile, but since no currently allocated system registers have
encodings with bit 5 of SYSm set, this hasn't been a problem in
practice.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 895b399..0f8548f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10488,7 +10488,8 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         gen_exception_return(s, tmp);
                         break;
                     case 6: /* MRS */
-                        if (extract32(insn, 5, 1)) {
+                        if (extract32(insn, 5, 1) &&
+                            !arm_dc_feature(s, ARM_FEATURE_M)) {
                             /* MRS (banked) */
                             int sysm = extract32(insn, 16, 4) |
                                 (extract32(insn, 4, 1) << 4);
@@ -10509,7 +10510,8 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         store_reg(s, rd, tmp);
                         break;
                     case 7: /* MRS */
-                        if (extract32(insn, 5, 1)) {
+                        if (extract32(insn, 5, 1) &&
+                            !arm_dc_feature(s, ARM_FEATURE_M)) {
                             /* MRS (banked) */
                             int sysm = extract32(insn, 16, 4) |
                                 (extract32(insn, 4, 1) << 4);
-- 
2.7.4
