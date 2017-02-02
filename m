Received: by 10.25.77.65 with SMTP id a62csp303178lfb;
        Thu, 2 Feb 2017 12:02:29 -0800 (PST)
X-Received: by 10.28.181.145 with SMTP id e139mr27938771wmf.127.1486065749373;
        Thu, 02 Feb 2017 12:02:29 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p5si29808362wrd.242.2017.02.02.12.02.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 12:02:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZNaO-0001x1-Rn; Thu, 02 Feb 2017 20:02:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 9/9] armv7m: VECTCLRACTIVE and VECTRESET are UNPREDICTABLE
Date: Thu,  2 Feb 2017 20:02:22 +0000
Message-Id: <1486065742-28639-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Ldan9L07JSeH

From: Michael Davidsaver <mdavidsaver@gmail.com>

The VECTCLRACTIVE and VECTRESET bits in the AIRCR are both
documented as UNPREDICTABLE if you write a 1 to them when
the processor is not halted in Debug state (ie stopped
and under the control of an external JTAG debugger).
Since we don't implement Debug state or emulated JTAG
these bits are always UNPREDICTABLE for us. Instead of
logging them as unimplemented we can simply log writes
as guest errors and ignore them.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: change extracted from another patch; commit message
 constructed from scratch]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 7b61fe6..18c0e60 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -698,10 +698,14 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
                 qemu_irq_pulse(s->sysresetreq);
             }
             if (value & 2) {
-                qemu_log_mask(LOG_UNIMP, "VECTCLRACTIVE unimplemented\n");
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Setting VECTCLRACTIVE when not in DEBUG mode "
+                              "is UNPREDICTABLE\n");
             }
             if (value & 1) {
-                qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Setting VECTRESET when not in DEBUG mode "
+                              "is UNPREDICTABLE\n");
             }
             s->prigroup = extract32(value, 8, 3);
             nvic_irq_update(s);
-- 
2.7.4
