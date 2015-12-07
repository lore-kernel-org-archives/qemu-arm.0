Received: by 10.182.158.201 with SMTP id ww9csp2607572obb;
        Mon, 7 Dec 2015 14:53:37 -0800 (PST)
X-Received: by 10.140.105.182 with SMTP id c51mr360762qgf.15.1449528816775;
        Mon, 07 Dec 2015 14:53:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si310782qgf.101.2015.12.07.14.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Dec 2015 14:53:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a64f2-0001C5-Fv
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 17:53:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64ez-00018v-Rr
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 17:53:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64ey-0004zB-Di
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 17:53:33 -0500
Received: from zose-mta02.web4all.fr ([185.49.20.43]:52362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a64ey-0004yu-4L; Mon, 07 Dec 2015 17:53:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id 631B745605;
	Mon,  7 Dec 2015 23:53:31 +0100 (CET)
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 6JZVPvuZlAl6; Mon,  7 Dec 2015 23:53:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id C80F045606;
	Mon,  7 Dec 2015 23:53:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-02.w4a.fr
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id ARTihqIoink9; Mon,  7 Dec 2015 23:53:30 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta02.web4all.fr (Postfix) with ESMTPSA id 74C2F45605;
	Mon,  7 Dec 2015 23:53:30 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Mon,  7 Dec 2015 23:53:29 +0100
Message-Id: <53c4d9b9611988a5f56f178f285e04490747925e.1449528242.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449528242.git.jcd@tribudubois.net>
References: <cover.1449528242.git.jcd@tribudubois.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.43
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-arm] [PATCH v6 2/5] i.MX: rename i.MX CCM get_clock()
	function and CLK ID enum names
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GI9FRUX59MRu

This is to prepare for CCM code refactoring.

This is just a bit of function and enum values renaming.

We also remove some useless intermediate variables.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

Changes since v1:
 * Not present 
  
Changes since v2:
 * Not present 
 
Changes since v3:
 * None 
 
Changes since v4:
 * None 

Changes since v5:
 * None 

 hw/misc/imx_ccm.c         |  8 ++++----
 hw/timer/imx_epit.c       | 20 +++++++++-----------
 hw/timer/imx_gpt.c        | 16 ++++++++--------
 include/hw/misc/imx_ccm.h |  8 ++++----
 4 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 500dda5..1ac697a 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -49,18 +49,18 @@ static const VMStateDescription vmstate_imx_ccm = {
     .post_load = imx_ccm_post_load,
 };
 
-uint32_t imx_clock_frequency(DeviceState *dev, IMXClk clock)
+uint32_t imx_ccm_get_clock_frequency(DeviceState *dev, IMXClk clock)
 {
     IMXCCMState *s = IMX_CCM(dev);
 
     switch (clock) {
     case NOCLK:
         return 0;
-    case MCU:
+    case CLK_MCU:
         return s->mcu_clk_freq;
-    case HSP:
+    case CLK_HSP:
         return s->hsp_clk_freq;
-    case IPG:
+    case CLK_IPG:
         return s->ipg_clk_freq;
     case CLK_32k:
         return CKIL_FREQ;
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 967be4a..50bf83c 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -51,9 +51,9 @@ static char const *imx_epit_reg_name(uint32_t reg)
  * These are typical.
  */
 static const IMXClk imx_epit_clocks[] =  {
-    0,        /* 00 disabled */
-    IPG,      /* 01 ipg_clk, ~532MHz */
-    IPG,      /* 10 ipg_clk_highfreq */
+    NOCLK,    /* 00 disabled */
+    CLK_IPG,  /* 01 ipg_clk, ~532MHz */
+    CLK_IPG,  /* 10 ipg_clk_highfreq */
     CLK_32k,  /* 11 ipg_clk_32k -- ~32kHz */
 };
 
@@ -73,20 +73,18 @@ static void imx_epit_set_freq(IMXEPITState *s)
 {
     uint32_t clksrc;
     uint32_t prescaler;
-    uint32_t freq;
 
     clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
     prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
 
-    freq = imx_clock_frequency(s->ccm, imx_epit_clocks[clksrc]) / prescaler;
+    s->freq = imx_ccm_get_clock_frequency(s->ccm,
+                                imx_epit_clocks[clksrc]) / prescaler;
 
-    s->freq = freq;
+    DPRINTF("Setting ptimer frequency to %u\n", s->freq);
 
-    DPRINTF("Setting ptimer frequency to %u\n", freq);
-
-    if (freq) {
-        ptimer_set_freq(s->timer_reload, freq);
-        ptimer_set_freq(s->timer_cmp, freq);
+    if (s->freq) {
+        ptimer_set_freq(s->timer_reload, s->freq);
+        ptimer_set_freq(s->timer_cmp, s->freq);
     }
 }
 
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 7257f42..b1893b8 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -81,8 +81,8 @@ static const VMStateDescription vmstate_imx_timer_gpt = {
 
 static const IMXClk imx_gpt_clocks[] = {
     NOCLK,    /* 000 No clock source */
-    IPG,      /* 001 ipg_clk, 532MHz*/
-    IPG,      /* 010 ipg_clk_highfreq */
+    CLK_IPG,  /* 001 ipg_clk, 532MHz*/
+    CLK_IPG,  /* 010 ipg_clk_highfreq */
     NOCLK,    /* 011 not defined */
     CLK_32k,  /* 100 ipg_clk_32k */
     NOCLK,    /* 101 not defined */
@@ -93,14 +93,14 @@ static const IMXClk imx_gpt_clocks[] = {
 static void imx_gpt_set_freq(IMXGPTState *s)
 {
     uint32_t clksrc = extract32(s->cr, GPT_CR_CLKSRC_SHIFT, 3);
-    uint32_t freq = imx_clock_frequency(s->ccm, imx_gpt_clocks[clksrc])
-                    / (1 + s->pr);
-    s->freq = freq;
 
-    DPRINTF("Setting clksrc %d to frequency %d\n", clksrc, freq);
+    s->freq = imx_ccm_get_clock_frequency(s->ccm,
+                                imx_gpt_clocks[clksrc]) / (1 + s->pr);
 
-    if (freq) {
-        ptimer_set_freq(s->timer, freq);
+    DPRINTF("Setting clksrc %d to frequency %d\n", clksrc, s->freq);
+
+    if (s->freq) {
+        ptimer_set_freq(s->timer, s->freq);
     }
 }
 
diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
index 0f2e469..09f6248 100644
--- a/include/hw/misc/imx_ccm.h
+++ b/include/hw/misc/imx_ccm.h
@@ -80,12 +80,12 @@ typedef struct IMXCCMState {
 
 typedef enum  {
     NOCLK,
-    MCU,
-    HSP,
-    IPG,
+    CLK_MCU,
+    CLK_HSP,
+    CLK_IPG,
     CLK_32k
 } IMXClk;
 
-uint32_t imx_clock_frequency(DeviceState *s, IMXClk clock);
+uint32_t imx_ccm_get_clock_frequency(DeviceState *s, IMXClk clock);
 
 #endif /* IMX_CCM_H */
-- 
2.5.0

