Received: by 10.25.159.19 with SMTP id i19csp1948989lfe;
        Thu, 14 Jan 2016 10:34:36 -0800 (PST)
X-Received: by 10.50.138.76 with SMTP id qo12mr24517135igb.85.1452796457607;
        Thu, 14 Jan 2016 10:34:17 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id m23si14400255iod.46.2016.01.14.10.34.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000mV-JE; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 8/8] target-arm: ignore ELR_ELx[1] for exception return to 32-bit ARM mode
Date: Thu, 14 Jan 2016 18:34:11 +0000
Message-Id: <1452796451-2946-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: d3uhNgcmN52S

The architecture requires that for an exception return to AArch32 the
low bits of ELR_ELx are ignored when the PC is set from them:
 * if returning to Thumb mode, ignore ELR_ELx[0]
 * if returning to ARM mode, ignore ELR_ELx[1:0]

We were only squashing bit 0; also squash bit 1 if the SPSR T bit
indicates this is a return to ARM code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/op_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 5789ccb..171d6b8 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -738,7 +738,11 @@ void HELPER(exception_return)(CPUARMState *env)
         }
         aarch64_sync_64_to_32(env);
 
-        env->regs[15] = env->elr_el[cur_el] & ~0x1;
+        if (spsr & CPSR_T) {
+            env->regs[15] = env->elr_el[cur_el] & ~0x1;
+        } else {
+            env->regs[15] = env->elr_el[cur_el] & ~0x3;
+        }
     } else {
         env->aarch64 = 1;
         pstate_write(env, spsr);
-- 
1.9.1
