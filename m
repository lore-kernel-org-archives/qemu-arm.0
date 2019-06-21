Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp304881wrg;
        Fri, 21 Jun 2019 00:02:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxP2L893Pv+xDRX7qSSzCbdQiKS5OCIeFAknr5TkJSEiVkBM8BjWMx5W+heorDzf9nG5yMp
X-Received: by 2002:aa7:c619:: with SMTP id h25mr82342659edq.295.1561100522894;
        Fri, 21 Jun 2019 00:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561100522; cv=none;
        d=google.com; s=arc-20160816;
        b=zuZZrnzOtRtKvDtw0fvklgeETjmSnF9z3Rs5jOsNLiawPEIgCetcR2J6Bc1DioccNH
         mXh/ERghBYP6ZFBsg13Kn7VBAFo9sa5hiX4CXquz0VJYUUhhhqgwm/V9WBeiY+Ln5vY9
         4TILsfis17KYPX1MYXvG8h83OY6vyyyHGf3l4d4P5uSIZQi+zxx3DGQGmlt79EhdmCJw
         x4dmKVFdExxohAr6ZoJpdaq5dT7cVvNhx9XVZ50lcT8MbKwm1gbnICXLY9fEBHmfjKWK
         AJYW/kN3Rn2iNW7V+sDmryIy93NdbHAbCPU/RMULCGhCyVFN79r6oIBzviddKo8Y+7NK
         cukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=QrPb1I4hGgIdnSQDxicKRNj7Vi+MgOZceJ5iUqGk3p8=;
        b=Ly8l4p/M9QeDscvDBcfq+En31IPEignbaTPKRDUEB6oL+yyUlXFYDFZViiMnVlX/9B
         fzfcFwaMDNPH64e4Nf0v83e1vpGI681BxBalJ24LUyDIk438EpCTJFPbEPWkSsMwr3eD
         XYZIczI6LrZBtBKSsoYtyh/lrfEArrGR+OM9yUFxTHtaGLsa9ZnF/wH+XDL3i5u3OYZb
         LVu9XeglHMu61z/z5B87I7qs0DF7nJBR50iA4Rd0w7RyLjTw2eJ7y/uKEowL/hrOxqHt
         m4zsF27h1WNglH+HWCuo5NcA87m/0C95CY08KMoj6cTo4XRxovr7d9z3XlDqc9Gy1Rle
         PrSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t9MEcABT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si1866624edb.421.2019.06.21.00.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 00:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t9MEcABT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1heDYf-0001Sg-NQ
	for alex.bennee@linaro.org; Fri, 21 Jun 2019 03:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1heDPz-0004lq-0y
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 02:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1heDPx-000080-0g
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 02:53:02 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1heDPr-0008T2-4L; Fri, 21 Jun 2019 02:52:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id f25so2872727pgv.10;
 Thu, 20 Jun 2019 23:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QrPb1I4hGgIdnSQDxicKRNj7Vi+MgOZceJ5iUqGk3p8=;
 b=t9MEcABTrVvPUw9UNLxvsfUsdMWlb/UtFwiat6FbeB+dYpuHLBwxy6AcI79w3NzdoZ
 Gr5/uV3k4hCNkG1szSwqGRi+2gMCii0O9HNuBHiZ1gZZzM7CHuKj4g6Pmni3CRcHGwsC
 YFAYSawf/C2DcIDzN65JXzAVjvj80Ghl63X9std2Eze5h/ftCN0KXxaRaF925VJAgHjJ
 OzMhJiGK6wypRtnn1XwSMcc/WSiwQXJvXZSEwNFV1KDEHQBN4tyTLSQ7QgeQD/PMWPyv
 bHCNKIPB1Lc7ClLloZl7QxVNmQYoxHPMq9UJQFg15epwtS8T5jyRmzua30nSo0ZHI0wM
 pFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QrPb1I4hGgIdnSQDxicKRNj7Vi+MgOZceJ5iUqGk3p8=;
 b=GJmPjYNaL/mKCdtEDVtImOYUjJAR+JKJBSZuOzaZHbp09M3wPmNfvklO+JuaQoBgGQ
 5seyOpQy4tr7ax8BEd5AFtauUju3IE3B3mO9y0eNtG69r50UgHeeUTClNoIiTCCZtUhx
 P3N27+k2PPjYDnPWr/GtsQOlbT4inpsP3Ip7OL8Nrw75Lwx7QHzkxQ4B2JAt81T9EhL5
 6yYGmr6uy/QwgNUmvSwICtHGbNy8LMrBs+HoHDyAfgZf+DDPEYs/O7xchHM/CRD/Q4hn
 F7RDndgqOwMZ0hnuLOzoYxWxM7o0ykkrZNuz1dW206/e2jeeTa4Epjpe3nyv0kf5PB26
 wneg==
X-Gm-Message-State: APjAAAXm+uAXyKZDQBSDszvlApTvGEGUSZbnkqkU7c/AzVpRFAjj5++/
 A2E3Dknes3z0vW9XxUmUhZA=
X-Received: by 2002:a63:1d5:: with SMTP id 204mr17261028pgb.207.1561099972851; 
 Thu, 20 Jun 2019 23:52:52 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m19sm2833108pff.153.2019.06.20.23.52.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 23:52:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2019 16:22:42 +0930
Message-Id: <20190621065242.32535-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v2] aspeed: Link SCU to the watchdog
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lICTT6pv3UO2

The ast2500 uses the watchdog to reset the SDRAM controller. This
operation is usually performed by u-boot's memory training procedure,
and it is enabled by setting a bit in the SCU and then causing the
watchdog to expire. Therefore, we need the watchdog to be able to
access the SCU's register space.

This causes the watchdog to not perform a system reset when the bit is
set. In the future it could perform a reset of the SDMC model.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
v2: rebase on upstream, rework commit message
---
 hw/arm/aspeed_soc.c              |  2 ++
 hw/watchdog/wdt_aspeed.c         | 20 ++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a2ea8c748449..ddd5dfacd7d6 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -155,6 +155,8 @@ static void aspeed_soc_init(Object *obj)
                               sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
         qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
                                     sc->info->silicon_rev);
+        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
+                                       OBJECT(&s->scu), &error_abort);
     }
 
     sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 4a8409f0daf5..57fe24ae6b1f 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -44,6 +44,9 @@
 
 #define WDT_RESTART_MAGIC               0x4755
 
+#define SCU_RESET_CONTROL1              (0x04 / 4)
+#define    SCU_RESET_SDRAM              BIT(0)
+
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
@@ -222,6 +225,13 @@ static void aspeed_wdt_timer_expired(void *dev)
 {
     AspeedWDTState *s = ASPEED_WDT(dev);
 
+    /* Do not reset on SDRAM controller reset */
+    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
+        timer_del(s->timer);
+        s->regs[WDT_CTRL] = 0;
+        return;
+    }
+
     qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
     watchdog_perform_action();
     timer_del(s->timer);
@@ -233,6 +243,16 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
+    Error *err = NULL;
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_propagate(errp, err);
+        error_prepend(errp, "required link 'scu' not found: ");
+        return;
+    }
+    s->scu = ASPEED_SCU(obj);
 
     if (!is_supported_silicon_rev(s->silicon_rev)) {
         error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 88d8be4f78d6..daef0c0e230b 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -27,6 +27,7 @@ typedef struct AspeedWDTState {
     MemoryRegion iomem;
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
+    AspeedSCUState *scu;
     uint32_t pclk_freq;
     uint32_t silicon_rev;
     uint32_t ext_pulse_width_mask;
-- 
2.20.1

