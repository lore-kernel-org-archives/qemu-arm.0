Received: by 10.25.0.147 with SMTP id 141csp210809lfa;
        Fri, 3 Mar 2017 03:59:39 -0800 (PST)
X-Received: by 10.223.171.78 with SMTP id r14mr2117782wrc.113.1488542378952;
        Fri, 03 Mar 2017 03:59:38 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id f12si2673182wmd.44.2017.03.03.03.59.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2017 03:59:38 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cjlrz-000628-Db; Fri, 03 Mar 2017 11:59:35 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>
Subject: [PATCH for-2.9] hw/misc/imx6_src: Don't crash trying to reset missing CPUs
Date: Fri,  3 Mar 2017 11:59:34 +0000
Message-Id: <1488542374-1256-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: Ww2DXWSs7IJQ

Commit 4881658a4b introduced a call to arm_get_cpu_by_id(),
and Coverity noticed that we weren't checking that it didn't
return NULL (CID 1371652).

Normally this won't happen (because all 4 CPUs are expected
to exist), but it's possible the user requested fewer CPUs
on the command line. Handle this possibility by silently
doing nothing, which is the same behaviour as before commit
4881658a4b and also how we handle the other CPU operations
(since we ignore the INVALID_PARAM returns from arm_set_cpu_on()
and friends).

There is a slight behavioural difference to the pre-4881658a4b
situation: the "reset this core" bit will remain set rather
than not being permitted to be set. The imx6 datasheet is
unclear about the behaviour in this odd corner case, so we
opt for the simpler code rather than complicated logic to
maintain identical behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I couldn't actually get this to crash even with -smp 1 with
my test image, but we should fix it anyhow.

 hw/misc/imx6_src.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index edbb756..cfb0871 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -143,13 +143,17 @@ static void imx6_defer_clear_reset_bit(int cpuid,
                                        unsigned long reset_shift)
 {
     struct SRCSCRResetInfo *ri;
+    CPUState *cpu = arm_get_cpu_by_id(cpuid);
+
+    if (!cpu) {
+        return;
+    }
 
     ri = g_malloc(sizeof(struct SRCSCRResetInfo));
     ri->s = s;
     ri->reset_bit = reset_shift;
 
-    async_run_on_cpu(arm_get_cpu_by_id(cpuid), imx6_clear_reset_bit,
-                     RUN_ON_CPU_HOST_PTR(ri));
+    async_run_on_cpu(cpu, imx6_clear_reset_bit, RUN_ON_CPU_HOST_PTR(ri));
 }
 
 
-- 
2.7.4
