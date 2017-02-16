Received: by 10.25.77.65 with SMTP id a62csp2553126lfb;
        Thu, 16 Feb 2017 08:37:32 -0800 (PST)
X-Received: by 10.28.174.14 with SMTP id x14mr13016272wme.75.1487262970764;
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id u28si1413746wru.47.2017.02.16.08.36.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ceP2Q-00036x-80; Thu, 16 Feb 2017 16:36:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 13/13] armv7m: Allow SHCSR writes to change pending and active bits
Date: Thu, 16 Feb 2017 16:36:03 +0000
Message-Id: <1487262963-11519-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
X-TUID: G0I/rfsbwvBU

Implement the NVIC SHCSR write behaviour which allows pending and
active status of some exceptions to be changed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a8c5a9e..1d34e0d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -755,8 +755,17 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
         cpu->env.v7m.ccr = value;
         break;
     case 0xd24: /* System Handler Control.  */
-        /* TODO: Real hardware allows you to set/clear the active bits
-           under some circumstances.  We don't implement this.  */
+        s->vectors[ARMV7M_EXCP_MEM].active = (value & (1 << 0)) != 0;
+        s->vectors[ARMV7M_EXCP_BUS].active = (value & (1 << 1)) != 0;
+        s->vectors[ARMV7M_EXCP_USAGE].active = (value & (1 << 3)) != 0;
+        s->vectors[ARMV7M_EXCP_SVC].active = (value & (1 << 7)) != 0;
+        s->vectors[ARMV7M_EXCP_DEBUG].active = (value & (1 << 8)) != 0;
+        s->vectors[ARMV7M_EXCP_PENDSV].active = (value & (1 << 10)) != 0;
+        s->vectors[ARMV7M_EXCP_SYSTICK].active = (value & (1 << 11)) != 0;
+        s->vectors[ARMV7M_EXCP_USAGE].pending = (value & (1 << 12)) != 0;
+        s->vectors[ARMV7M_EXCP_MEM].pending = (value & (1 << 13)) != 0;
+        s->vectors[ARMV7M_EXCP_BUS].pending = (value & (1 << 14)) != 0;
+        s->vectors[ARMV7M_EXCP_SVC].pending = (value & (1 << 15)) != 0;
         s->vectors[ARMV7M_EXCP_MEM].enabled = (value & (1 << 16)) != 0;
         s->vectors[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
         s->vectors[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;
-- 
2.7.4
