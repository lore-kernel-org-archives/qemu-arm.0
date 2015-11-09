Received: by 10.182.105.169 with SMTP id gn9csp901325obb;
        Sun, 8 Nov 2015 17:16:16 -0800 (PST)
X-Received: by 10.55.18.40 with SMTP id c40mr25205059qkh.99.1447031775324;
        Sun, 08 Nov 2015 17:16:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d72si9318887qhc.8.2015.11.08.17.16.15
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:16:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb4B-00061M-3n
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:16:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1P-0001L3-Fi
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1N-0007wL-Aa
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:23 -0500
Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f]:36418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1N-0007wF-5l; Sun, 08 Nov 2015 20:13:21 -0500
Received: by qgad10 with SMTP id d10so132319298qga.3;
	Sun, 08 Nov 2015 17:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y4m0LqtVkwjDurF74g7JqipeRCVzpfxy10ptybioMsU=;
	b=FmIjFOiArwSFegj+TljzQjLpwjM2tYrwOaVe4EbfyhLGy2hdrzi/Md3KDVKvGYeaXF
	OVN0JeyX27oaF18Zo9A2a2JiD2N+G04fca40z416kCAG+rmNF6sJjvfPx5cvKUbn3nAT
	qjWHBwL78bRXr/zX29yiSnsdNMZs4OsJyUvbqFrCAOhucBw5qNFtnvPsl6ZV0LmtEYU+
	j7gCJMxTZzAOP6St/WIjOPVXuCPYV3u8PxdgCibKWTKhOw5ND9a12qwj5K8BmJHDbSJC
	xMzbtuP/GeNxxjTIvH0GfV7mpqBv0t16WImIUXuOd5So5ji/PlWw2fSFG/ML0cWGGpKH
	kR6Q==
X-Received: by 10.140.128.16 with SMTP id 16mr27172037qha.54.1447031600764;
	Sun, 08 Nov 2015 17:13:20 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:20 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:35 -0500
Message-Id: <1447031505-12477-9-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 08/18] armv7m: fix RETTOBASE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sGfTB6T9WhAD

The polarity is reversed, and it should include
internal exceptions.

Should be set when # of active exceptions <= 1.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 30e349e..3b10dee 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -432,16 +432,20 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         val = cpu->env.v7m.exception;
         /* VECTPENDING */
         val |= (cpu->env.v7m.pending << 12)&0x1ff;
-        /* ISRPENDING and RETTOBASE */
+        /* ISRPENDING - Set it any externel IRQ pending (vector>=16) */
         for (irq = 16; irq < s->num_irq; irq++) {
             if (s->vectors[irq].pending) {
                 val |= (1 << 22);
                 break;
             }
+        }
+        /* RETTOBASE - Set if no (other) handler is active */
+        for (irq = 1; irq < s->num_irq; irq++) {
             if (irq != cpu->env.v7m.exception && s->vectors[irq].active) {
-                val |= (1 << 11);
+                val |= (1 << 11); /* some other handler is active */
             }
         }
+        val ^= (1<<11); /* invert */
         /* PENDSTSET */
         if (s->vectors[ARMV7M_EXCP_SYSTICK].pending) {
             val |= (1 << 26);
@@ -454,6 +458,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         if (s->vectors[ARMV7M_EXCP_NMI].pending) {
             val |= (1 << 31);
         }
+        /* ISRPREEMPT not implemented */
         return val;
     case 0xd08: /* Vector Table Offset.  */
         return cpu->env.v7m.vecbase;
@@ -588,10 +593,14 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
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
             if (value & 0x700) {
                 unsigned i;
-- 
2.1.4

