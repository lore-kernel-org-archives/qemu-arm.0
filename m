Received: by 10.25.77.65 with SMTP id a62csp1918318lfb;
        Tue, 24 Jan 2017 11:16:25 -0800 (PST)
X-Received: by 10.25.22.96 with SMTP id m93mr12158839lfi.101.1485285385595;
        Tue, 24 Jan 2017 11:16:25 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id u68si13134437lfg.319.2017.01.24.11.16.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zs-0000Q3-Qo; Tue, 24 Jan 2017 19:16:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 08/10] armv7m: Honour CCR.USERSETMPEND
Date: Tue, 24 Jan 2017 19:16:18 +0000
Message-Id: <1485285380-10565-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: /WWpMAy54iKg

From: Michael Davidsaver <mdavidsaver@gmail.com>

The CCR.USERSETMPEND bit has to be set to permit unprivileged code to
write to the Software Triggered Interrupt register; honour this bit
rather than letting any code write to the register.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: Tweak commit message, comment, phrasing of condition]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 60e72d7..fe5c303 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -409,7 +409,10 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
                       "NVIC: Aux fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
-        if ((value & 0x1ff) < s->num_irq) {
+        /* user mode can only write to STIR if CCR.USERSETMPEND permits it */
+        if ((value & 0x1ff) < s->num_irq &&
+            (arm_current_el(&cpu->env) ||
+             (cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK))) {
             gic_set_pending_private(&s->gic, 0, value & 0x1ff);
         }
         break;
-- 
2.7.4
