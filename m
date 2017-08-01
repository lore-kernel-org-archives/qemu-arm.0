Received: by 10.25.44.15 with SMTP id s15csp4248611lfs;
        Mon, 31 Jul 2017 18:05:16 -0700 (PDT)
X-Received: by 10.55.31.76 with SMTP id f73mr23437187qkf.85.1501549516252;
        Mon, 31 Jul 2017 18:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501549516; cv=none;
        d=google.com; s=arc-20160816;
        b=lJIFGE3tip1BQXffJueX2JUsjDvRtt/psSpPa5yIbQTeEfb2L+ALBspslCrR1/6lNw
         5WUFGJKcl2CpXf+s+s3hX3BP5sF0cJmn8eyua4l6qvlH5nUD4VKH5nby8LA3qrLqXifr
         Cg+2NcdW8B5ExxUTZqgiPx8uNjroATxqpyhMtL3UHiIUB5XGnntIW61Lmw4MvaHNbOTP
         pBE/gHozDfXP3RIWOcSTVKbPOzsho1GfSnMJzSJGO8mTR9UZktJR09/cLG/tcZwx+J/k
         f0IqJIguzZ321eL10sRlR/XWCv3Zi49UCZjhhQ+FyqbuqVcoIgueN6zyuzSm/wI+dkCG
         bHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=I1691WBr92xTPpnV9ROVgEHnl2VH5epIO4BQtBbcP70=;
        b=NJk1rCHyGRm+JPbloNit8iiLRshkGEmZfE9g+oV3Tr+jatbVTShEHuRoLWbQnyETk4
         GM5sVXy06aSqbWfDJ66IW4295VeRQ+W5Fu74V5cEFoDcOPA0AFqmrdF8QadXD/Z/xBl2
         9Ps2px5AAPkS0synjRBd0e471ojCn2eozUFbMc6oV36TorQXLTxVQ9kdhefUpjPRToCr
         v/7lbv0Zic7MjglN7E0GUIP4XohQYK8dMjYD3NjXrhqaogDOfHhmsVmMBmwlH5i6Hnrs
         TewGibJpUFEkLIDjNIhPZrwWTqXRLlBJuVCfs2cG5+B+fWvrt410WJ6hxENQh2btL8gk
         qM9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=NGbswFBk;
       dkim=fail header.i=@messagingengine.com header.b=KOdZRttc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si12564931qkf.90.2017.07.31.18.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 18:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=NGbswFBk;
       dkim=fail header.i=@messagingengine.com header.b=KOdZRttc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcLcX-0005Oj-KF
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 21:05:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dcLcQ-0005N7-52
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 21:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dcLcL-0008SD-7C
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 21:05:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59981)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dcLcK-0008Qn-Oz; Mon, 31 Jul 2017 21:05:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EE88820774;
	Mon, 31 Jul 2017 21:04:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Mon, 31 Jul 2017 21:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=fm1; bh=I1691WBr92xTPpnV9ROVgEHnl2VH5e
	pIO4BQtBbcP70=; b=NGbswFBkj4ktUx3msNwJAOb2SHNWiIIhPzF7026H1lQ1wx
	3TnaoN7+iEQ7431sNjF1UPZpjV3ds5ZtClNxkdn2AlheE5uekZsYuySllJLMfIgy
	NK1RCZUPB9TfV7s98RsorJcGQFQwOEwUqZsslXlKC+ojQ++UZHl6GVmjhnDq/dL0
	EcDbsazIyWLdIdCiQMemXP0g29PSv7bLsp4RYIWAKXwbZ5O5AWqQZvGVX0Zt/z61
	hfAiYQkUHzfvLtED29B2G59rwFOnqfAiMhcFwqhwUxbrDl2+TJ9jnlk1m8q9RN+f
	6LRyp1P3FgJlLs1dvuWLB4LWWBudCAg34tShD6cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=I1691W
	Br92xTPpnV9ROVgEHnl2VH5epIO4BQtBbcP70=; b=KOdZRttcgVuLi++CnMTJt4
	J5VjZL6l74kwKrFwadivTSGhZHPoGO8N1ut5lHrTGJLBG2WTZQAO4NsU22u5WxU7
	bfkY4zeUqbfzcSrpPCteOtZKtc5fdg078Mw9FwQLa/XM722TkRxCzE60zBFaRlsE
	Kel/5Hgd5P2QWBKDtFTQhR8GKQ3mUcMso3Nrs2DUj3WjX85xvZUJZW6iDBJ7BcbV
	Efltp2fwTPLy05yCv6OnwSCWnDkgrdgrMbCoYTh75MDh3r/hhhbg80X/3STWsJxK
	PieDekpdjr91MXWpM7GcesegsjGA2kSpLpBvnNLX/madboG3Cit0DpIHuo7vG82A
	==
X-ME-Sender: <xms:utN_WdZoUuCYpZB2tvHDfmrvxUTNxhR_Szn6fSqltD3iYhEJ2WZdUg>
X-Sasl-enc: 1Jk5tillm/lewo4YH0LXbJShF+dYi0nccB97rrsx6Ay5 1501549498
Received: from keelia.au.ibm.com
	(ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 18F4624604;
	Mon, 31 Jul 2017 21:04:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Tue,  1 Aug 2017 10:34:25 +0930
Message-Id: <20170801010425.25778-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH] watchdog: wdt_aspeed: Add support for the reset
 width register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, joel@jms.id.au,
	clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aqOM0bsnucxy

The reset width register controls how the pulse on the SoC's WDTRST{1,2}
pins behaves. A pulse is emitted if the external reset bit is set in
WDT_CTRL. WDT_RESET_WIDTH requires magic bit patterns to configure both
push-pull/open-drain and active-high/active-low behaviours and thus
needs some special handling in the write path.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
I understand that we're in stabilisation mode, but I thought I'd send this out
to provoke any feedback. Happy to resend after the 2.10 release if required.

 hw/watchdog/wdt_aspeed.c | 47 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 8bbe579b6b66..4ef1412e99fc 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -14,10 +14,10 @@
 #include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
 
-#define WDT_STATUS              (0x00 / 4)
-#define WDT_RELOAD_VALUE        (0x04 / 4)
-#define WDT_RESTART             (0x08 / 4)
-#define WDT_CTRL                (0x0C / 4)
+#define WDT_STATUS                      (0x00 / 4)
+#define WDT_RELOAD_VALUE                (0x04 / 4)
+#define WDT_RESTART                     (0x08 / 4)
+#define WDT_CTRL                        (0x0C / 4)
 #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
 #define   WDT_CTRL_1MHZ_CLK             BIT(4)
@@ -25,12 +25,21 @@
 #define   WDT_CTRL_WDT_INTR             BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
 #define   WDT_CTRL_ENABLE               BIT(0)
+#define WDT_RESET_WIDTH                 (0x18 / 4)
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
+#define     WDT_POLARITY_MASK           (0xFF << 24)
+#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
+#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
+#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
+#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
+#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
+#define   WDT_RESET_WIDTH_DURATION      0xFFF;
 
-#define WDT_TIMEOUT_STATUS      (0x10 / 4)
-#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
-#define WDT_RESET_WDITH         (0x18 / 4)
+#define WDT_TIMEOUT_STATUS              (0x10 / 4)
+#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
 
-#define WDT_RESTART_MAGIC       0x4755
+#define WDT_RESTART_MAGIC               0x4755
 
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
@@ -55,9 +64,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     case WDT_CTRL:
         return s->regs[WDT_CTRL];
+    case WDT_RESET_WIDTH:
+        return s->regs[WDT_RESET_WIDTH];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -119,9 +129,25 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
             timer_del(s->timer);
         }
         break;
+    case WDT_RESET_WIDTH:
+    {
+        uint32_t property = data & WDT_POLARITY_MASK;
+
+        if (property == WDT_ACTIVE_HIGH_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property == WDT_ACTIVE_LOW_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property == WDT_PUSH_PULL_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
+        } else if (property == WDT_OPEN_DRAIN_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;
+        }
+        s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_DURATION;
+        s->regs[WDT_RESET_WIDTH] |= data & WDT_RESET_WIDTH_DURATION;
+        break;
+    }
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -167,6 +193,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
     s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_RESET_WIDTH] = 0XFF;
 
     timer_del(s->timer);
 }
-- 
2.11.0

