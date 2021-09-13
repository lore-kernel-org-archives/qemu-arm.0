Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3838168lfb;
        Mon, 13 Sep 2021 09:37:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztPz3RDK2reYev0Fubf9hBFQlcaUUMAgV93XAiWqLZaKluieDamJApnIKpgmp0f2mG2A1M
X-Received: by 2002:a67:ea99:: with SMTP id f25mr5841245vso.28.1631551031473;
        Mon, 13 Sep 2021 09:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631551031; cv=none;
        d=google.com; s=arc-20160816;
        b=I8i/W15wjK1C9OHdBcoI9H/U51ktGm6VJ02F8xMp7b1rjrS5R5vvpcrOjrHOc/sFrx
         R7zWgTlGj+UwDfVfxSjGR5D4jTXo/10OACS53Q4K7r3OnXjMNuOgs/o2wPbeDpI/MCjK
         3DBHnHAKbiSlGprXtSSrZLIC59i247BYadwnVNti524L80NdQPUaUrXAXgy71LR1qmpi
         3vjTs4ks9Lf1RtTak3PIQs4U1UxMu+PQma1pVaZnCkjsbXlVdXwnT6YCmsl+Nt4E4Raj
         nlrzNVaD696UOMdgK+k7/6u8PMoxIvQnW+q4+rZSCDgBwRHmIkQaAf5x48DmTsmV9taY
         XVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=t7rZDeXDA+qJ1GkN+R5hkcx31iZqfxyeJDf5+H4u/6w=;
        b=R9lQ+cGxoj5ssCmiVG2kzKAvKYgBeygOc7fycjCZ0KDlWxo0Ue2l4QaQbtISekyHla
         AB5WuufpCSSSYuD5dUCqLr+akfwaGr3AKaOp1AyFoO1z2Of5/Xly4mNZKp2J1l7fHTws
         UJMe7jkp7VZd84payrp7wQgxnFIX8mDOGzFAIlY4OpOYIy1W2k9lmodPNe+d95lrJSxH
         uVCaah+s7kaIShxyCBCGkQzr16Imab1sMrn7gaQI/G1xRKVtsH3FpZDn6GWVRgCjbWWw
         J1u/PZWVn4u9dsCalX610dpxEYH4fCN3GKAYIY21jFIPW6pGNIjZ+Q0iL8ZVIfgXl+Mm
         Kl8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si1761346vsb.462.2021.09.13.09.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 09:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPoxC-0000Av-O3
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 12:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPoaE-0003zd-Jg; Mon, 13 Sep 2021 12:13:27 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:53041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPoa8-0000gp-Jx; Mon, 13 Sep 2021 12:13:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8F2E320FA9;
 Mon, 13 Sep 2021 16:13:11 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a1a0b341-88ee-4eaf-8551-fa354616ec30,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/14] watchdog: aspeed: Sanitize control register values
Date: Mon, 13 Sep 2021 18:12:53 +0200
Message-ID: <20210913161304.3805652-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 806d33f2-17de-4d95-80bd-194e64bc5ae1
X-Ovh-Tracer-Id: 8689414009498929958
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CBf4o1A22YT7

From: Andrew Jeffery <andrew@aj.id.au>

While some of the critical fields remain the same, there is variation in
the definition of the control register across the SoC generations.
Reserved regions are adjusted, while in other cases the mutability or
behaviour of fields change.

Introduce a callback to sanitize the value on writes to ensure model
behaviour reflects the hardware.

Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210709053107.1829304-2-andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 80b03661e303..f945cd6c5833 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -44,6 +44,7 @@ struct AspeedWDTClass {
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
     void (*wdt_reload)(AspeedWDTState *s);
+    uint64_t (*sanitize_ctrl)(uint64_t data);
 };
 
 #endif /* WDT_ASPEED_H */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6352ba1b0e5b..faa3d35fdf21 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -118,13 +118,27 @@ static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
     }
 }
 
+static uint64_t aspeed_2400_sanitize_ctrl(uint64_t data)
+{
+    return data & 0xffff;
+}
+
+static uint64_t aspeed_2500_sanitize_ctrl(uint64_t data)
+{
+    return (data & ~(0xfUL << 8)) | WDT_CTRL_1MHZ_CLK;
+}
+
+static uint64_t aspeed_2600_sanitize_ctrl(uint64_t data)
+{
+    return data & ~(0x7UL << 7);
+}
 
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
     AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
-    bool enable = data & WDT_CTRL_ENABLE;
+    bool enable;
 
     offset >>= 2;
 
@@ -144,6 +158,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         }
         break;
     case WDT_CTRL:
+        data = awc->sanitize_ctrl(data);
+        enable = data & WDT_CTRL_ENABLE;
         if (enable && !aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
             awc->wdt_reload(s);
@@ -207,11 +223,12 @@ static const MemoryRegionOps aspeed_wdt_ops = {
 static void aspeed_wdt_reset(DeviceState *dev)
 {
     AspeedWDTState *s = ASPEED_WDT(dev);
+    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
 
     s->regs[WDT_STATUS] = 0x3EF1480;
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
-    s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_CTRL] = awc->sanitize_ctrl(0);
     s->regs[WDT_RESET_WIDTH] = 0xFF;
 
     timer_del(s->timer);
@@ -293,6 +310,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
+    awc->sanitize_ctrl = aspeed_2400_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2400_wdt_info = {
@@ -328,6 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2500_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2500_wdt_info = {
@@ -348,6 +367,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2600_wdt_info = {
-- 
2.31.1

