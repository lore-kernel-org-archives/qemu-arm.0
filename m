Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1858050lfp;
        Mon, 20 Sep 2021 01:12:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUprBZ6Cuh5aufaiwDzKfxlO4m1CDpVp6LTYR1l9Q5busx4MZd6hGtoFZ2CJR7rOqWgCkR
X-Received: by 2002:a05:6638:2405:: with SMTP id z5mr18242761jat.124.1632125578950;
        Mon, 20 Sep 2021 01:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125578; cv=none;
        d=google.com; s=arc-20160816;
        b=sluC60GYWFw8k1n2f8WR18QtuOJWXra/jzpaNNNFDaBuurWZlgq7NR71bQlUsbOjZX
         FdC2X9a3wJp4B1qa7XW9xIXDRbIMfcz+IrbMnbQ7LH2tMJa2S1S+VHf+jlCBSvDv5o0m
         0ktYnD9ZMsnV8R75QNk2SF7qxjO/OlF4/m6uxDztJGg0Dc77QTrenhC4miTEd+tgESqL
         OkqwoqqCfUbyOuIYAxv0MI6t0SeWFF0PSD3vuigCnQVDISBrsZkpeMrqd3fsx7WIg4es
         XYkZUUVQu7Xo27oWOlTW7IilJxffYXArzurrPvK1yoqRGUf0e74zVKuf/IijctD4/B6N
         S6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=t7rZDeXDA+qJ1GkN+R5hkcx31iZqfxyeJDf5+H4u/6w=;
        b=wFa3+MA3DFRKUGSz8HHGESYbnkFwWjKqemaskZTACnrmosEm5KGPwAI4zmAzUeGQqk
         RXqUCeT/gkDTzy//e41b4mFWrQ+QWg/uYfZWBN7dT4LtoIDehaJpGL8+9xLlrZIimIXx
         X3bVQVKuKUnz7izV2/TsTf19MgEchQQaDy19eKOMTvUugWIH0F+thkiebMUFzfR7cYO2
         r4bHlubI56qXsCdKJsrzL6du2/v2QlypSGyvtUS7AGUb8Sa6amhkre4AJs5S7e69hg+t
         OssSEE/nQzTj09rolM7WtCwjWKgypnptMPT6PBvgoT/1y1uB9cnumdlJhjQhNXTuIgcX
         Bnpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si12325179ils.47.2021.09.20.01.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEQ6-0001XH-96
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMu-0004OJ-Oy
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:43 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:34995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMp-0003fO-Vx
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BF119206EC;
 Mon, 20 Sep 2021 08:09:31 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00544b3658f-599f-4550-b87e-e2915a1f6c6e,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/14] watchdog: aspeed: Sanitize control register values
Date: Mon, 20 Sep 2021 10:09:17 +0200
Message-ID: <20210920080928.1055567-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7fc9283e-fbc3-4e84-ab92-9239debc3bb5
X-Ovh-Tracer-Id: 4736379436510907174
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fvwITWcKmTe+

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

