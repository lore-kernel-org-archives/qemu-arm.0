Received: by 10.25.0.147 with SMTP id 141csp139813lfa;
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
X-Received: by 10.25.25.133 with SMTP id 127mr6221339lfz.153.1487616075621;
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id j28si6769638lfk.185.2017.02.20.10.41.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 10:41:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfste-0005qA-9a; Mon, 20 Feb 2017 18:41:14 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 1/4] arm: HVC and SMC encodings don't exist for M profile
Date: Mon, 20 Feb 2017 18:41:09 +0000
Message-Id: <1487616072-9226-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
X-TUID: LnDdqlqcak+5

M profile doesn't have the HVC or SMC encodings, so make them always
UNDEF rather than generating calls to helper functions that assume
A/R profile.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9fded03..895b399 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10365,6 +10365,9 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     goto illegal_op;
 
                 if (insn & (1 << 26)) {
+                    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+                        goto illegal_op;
+                    }
                     if (!(insn & (1 << 20))) {
                         /* Hypervisor call (v7) */
                         int imm16 = extract32(insn, 16, 4) << 12
-- 
2.7.4
