Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4448073lfb;
        Tue, 7 Sep 2021 00:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ4v0dtI3May/HLBoC5ibR0AkZCroVC3DMmM8L/odGqHgfKISkn7lKOfbiHVzzD9qdfIfE
X-Received: by 2002:a67:f24f:: with SMTP id y15mr8090172vsm.60.1630998158018;
        Tue, 07 Sep 2021 00:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630998158; cv=none;
        d=google.com; s=arc-20160816;
        b=zPId8FEvqr/nxZSDaMPEo2Xlau1MoXRqkiuRemeDpYoRs/WEO3pzTV7YIgLuuPuaZB
         JM+7xAVNUpm9NufTE/fCQUewr9vHhjgaQuChwpR98coSbD+HEAL27CxniDVx3wmgvI/q
         37SRRIK9EjgnxQ7bcSFX7Q25iH/GW0+y3S/nxXiNpXcPJoKrdvji4+T/SF/3j3nCRSIx
         PF/7dOKMZ/IHX1aDWaM4NwkVynIPLxK/hVC9E2Qs4bUgoZC36pAIL2kRT6pyCRPb3wf8
         /EJsMJ6BV8q/kMroqOrnlocmbXU76RvWPOND/JEi+G8Ojvt2psgkrPwS64NCgLRc8vgt
         0uQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Xi+4tMxS0JHEv6FmPOs8WeHAfw80QzLNBZ+wUzTqi0Q=;
        b=baHFIJXU7kKnX1Ublcd/Eis4VhWe951cmw+fWpD7wVEtSVVzF/mVuPkCfhCufPEa3i
         uqZ74NV3iOqIrHBkFhouWfnqIqafnu4te4Vc4tM9WCiUB1wrZdUaKoFfWlpkO8gYaPnH
         gxgp+Q/ETGBFz7/j/Xf4Is/pwYcdtlRX52+iYeEP7jTYaK8xuSnJG6N27aScbfX0wDFt
         RZ8qahNjoUVPBwy79lAOu9OuLiZdvksU02PYRrGTodvg24tPyKhCZuhqvbLChRvTDoP5
         sjfPAgFhpss7fqCyKUGOCdujuI4DsW43/4St0Lh0N8w5BYhgFcS2/XcmT/Fah5OILGIz
         R8Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si2735531vsj.52.2021.09.07.00.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNV7t-0007LW-6O
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3x-0001M6-SR
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 02:58:33 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3u-0001LD-IZ
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 02:58:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2588B20E94;
 Tue,  7 Sep 2021 06:58:27 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002fda1d763-2bb2-4648-b6c6-16f97fab407e,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 07/10] aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
Date: Tue, 7 Sep 2021 08:58:19 +0200
Message-ID: <20210907065822.1152443-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 39d7ef52-0a4f-44aa-9430-6ac82436b0e9
X-Ovh-Tracer-Id: 977844070891424617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yviJlIv+oxk5

'cs' is a more appropriate name to index SPI flash devices.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 097bb6aaf5f8..40b6926b3e02 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -33,7 +33,7 @@ struct AspeedSMCState;
 typedef struct AspeedSMCFlash {
     struct AspeedSMCState *controller;
 
-    uint8_t id;
+    uint8_t cs;
 
     MemoryRegion mmio;
 } AspeedSMCFlash;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6d0984cc1d17..a47719946941 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -352,20 +352,20 @@ static inline int aspeed_smc_flash_mode(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
 
-    return s->regs[s->r_ctrl0 + fl->id] & CTRL_CMD_MODE_MASK;
+    return s->regs[s->r_ctrl0 + fl->cs] & CTRL_CMD_MODE_MASK;
 }
 
 static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
 
-    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->cs));
 }
 
 static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
-    int cmd = (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
+    int cmd = (s->regs[s->r_ctrl0 + fl->cs] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
 
     /*
      * In read mode, the default SPI command is READ (0x3). In other
@@ -393,7 +393,7 @@ static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
     if (asc->segments == aspeed_2400_spi1_segments) {
         return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
     } else {
-        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
+        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->cs));
     }
 }
 
@@ -401,9 +401,9 @@ static void aspeed_smc_flash_do_select(AspeedSMCFlash *fl, bool unselect)
 {
     AspeedSMCState *s = fl->controller;
 
-    trace_aspeed_smc_flash_select(fl->id, unselect ? "un" : "");
+    trace_aspeed_smc_flash_select(fl->cs, unselect ? "un" : "");
 
-    qemu_set_irq(s->cs_lines[fl->id], unselect);
+    qemu_set_irq(s->cs_lines[fl->cs], unselect);
 }
 
 static void aspeed_smc_flash_select(AspeedSMCFlash *fl)
@@ -423,11 +423,11 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     AspeedSegments seg;
 
-    asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->id], &seg);
+    asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
     if ((addr % seg.size) != addr) {
         aspeed_smc_error("invalid address 0x%08x for CS%d segment : "
                          "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
-                         addr, fl->id, seg.addr, seg.addr + seg.size);
+                         addr, fl->cs, seg.addr, seg.addr + seg.size);
         addr %= seg.size;
     }
 
@@ -437,7 +437,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
 static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
-    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->id];
+    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->cs];
     uint32_t dummy_high = (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
     uint32_t dummy_low = (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
     uint32_t dummies = ((dummy_high << 2) | dummy_low) * 8;
@@ -506,7 +506,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
         aspeed_smc_error("invalid flash mode %d", aspeed_smc_flash_mode(fl));
     }
 
-    trace_aspeed_smc_flash_read(fl->id, addr, size, ret,
+    trace_aspeed_smc_flash_read(fl->cs, addr, size, ret,
                                 aspeed_smc_flash_mode(fl));
     return ret;
 }
@@ -563,7 +563,7 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
     AspeedSMCState *s = fl->controller;
     uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
 
-    trace_aspeed_smc_do_snoop(fl->id, s->snoop_index, s->snoop_dummies,
+    trace_aspeed_smc_do_snoop(fl->cs, s->snoop_index, s->snoop_dummies,
                               (uint8_t) data & 0xff);
 
     if (s->snoop_index == SNOOP_OFF) {
@@ -616,7 +616,7 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
     AspeedSMCState *s = fl->controller;
     int i;
 
-    trace_aspeed_smc_flash_write(fl->id, addr, size, data,
+    trace_aspeed_smc_flash_write(fl->cs, addr, size, data,
                                  aspeed_smc_flash_mode(fl));
 
     if (!aspeed_smc_is_writable(fl)) {
@@ -668,12 +668,12 @@ static void aspeed_smc_flash_update_ctrl(AspeedSMCFlash *fl, uint32_t value)
     unselect = (value & CTRL_CMD_MODE_MASK) != CTRL_USERMODE;
 
     /* A change of CTRL_CE_STOP_ACTIVE from 0 to 1, unselects the CS */
-    if (!(s->regs[s->r_ctrl0 + fl->id] & CTRL_CE_STOP_ACTIVE) &&
+    if (!(s->regs[s->r_ctrl0 + fl->cs] & CTRL_CE_STOP_ACTIVE) &&
         value & CTRL_CE_STOP_ACTIVE) {
         unselect = true;
     }
 
-    s->regs[s->r_ctrl0 + fl->id] = value;
+    s->regs[s->r_ctrl0 + fl->cs] = value;
 
     s->snoop_index = unselect ? SNOOP_OFF : SNOOP_START;
 
@@ -1184,7 +1184,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
         snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
 
-        fl->id = i;
+        fl->cs = i;
         fl->controller = s;
         memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
                               fl, name, asc->segments[i].size);
-- 
2.31.1

