Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2292747ejc;
        Mon, 9 Jan 2023 06:21:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMUAiyUFJFLhZfH3kil9KanI2bNu6Q76QopiBU1LQUtd3ParSCi1qUV066fTff9ob9l8Vk
X-Received: by 2002:a05:622a:1884:b0:3ab:ec48:d54f with SMTP id v4-20020a05622a188400b003abec48d54fmr13713484qtc.25.1673274102889;
        Mon, 09 Jan 2023 06:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673274102; cv=none;
        d=google.com; s=arc-20160816;
        b=0jHa7sFMIiMef+iMFas5zkUBpiS10fTFNFXt1DBmh8CWfXe8RvbJAij5LM64Iq6SQP
         T2FC4ATqirr+NSAoCbQrl4Mn+AFxhq2O4G5JFbDu83+1Sjp2CciOkPKLB8yrzGeX3z4s
         c/UFw/raBoiVPcHbBnYM4nuo4hTXsZjhk0TExEOBHrTaoYQvN453C4RR//kGTb5wxRD5
         RhlR6zRI6yT1bzxA1mabr+OEyOl4zknmvPHsDIxgcPv7zxOIPHyvTu9YxEb7IGPcHUCV
         HF3rToMdKGCWBQm4pUXDx04YjDNALpcwv1kCs+lOtN1xpQyfN3TORFTU0omN4jE4zEfA
         iZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2gvdf7MKgAqOkpgoECI87U6UIVZrGkUaGXJayKsJqzE=;
        b=p+ZxLJUCy4yS3W8kD4JARSAnai8BDU4Fenvj5Fnv0+sh2LCV/ugRFaHWgvt+fVzVih
         hwybpCkkXXPTcf2WA/FxMT9aGj0jUWOH2LgocIujdxI50TT8zs32C3wSDVY0DmbP05US
         tLRf0wkHyhI2E3KAG98cFAMeLBpE+lvRbp4iPh/HZzCZ49tLrSczKNE039EJOCm9aRhn
         8PlkzuyBohoxkDVfvIpT17lMq+K2puBYtTmIayxHc7dUPbFDQ3ISrEOzNEyU8xIqELcK
         z/FhVyt2K9Vi2T7U0cL1Vcy/IoyEqYkjThfaHsBXYCDA6F1YIvH7vfC0RTbUNQP0F0Pl
         V0Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvoG6pZO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac81014000000b003a7e162f83bsi4488342qti.349.2023.01.09.06.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:21:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvoG6pZO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEslQ-0001z2-EH; Mon, 09 Jan 2023 09:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsl6-0001rP-GI
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:04:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsl4-0007Df-Mi
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:04:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so6851756wms.2
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gvdf7MKgAqOkpgoECI87U6UIVZrGkUaGXJayKsJqzE=;
 b=xvoG6pZO1tl/N0GOiWKJDNz4VIn0BW/rIN6xl/jJwGwJPmX4hkRbbG1FojLhjg4ziQ
 WA0JWvl3Bcwp8gctRtDvitDN4B+WQVPGMTC+lgEqpVU/yn6CSJ/hUGf4qdES22U5UdNF
 Pgcuy+9VtHs5v5l2PooPedXvagnOXcBw8eyPPrtUmYCvBs6hdSY5XrjjeKrBUHnpPPhG
 A6Fzif7Xk64vwrjbq9WXgsLjPpcv/uwtEXhGMlVBAU8cv+OAQDJWUO3f/xvWDTEWYG0I
 grgVeMu6IZosom+gC0uDJ5N1RMulZku2SZNlBkfhrJEIoYnxwnbrFOJKxVHdHnaT+9FZ
 mDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2gvdf7MKgAqOkpgoECI87U6UIVZrGkUaGXJayKsJqzE=;
 b=iJrFLkyJnc/pjPYElu3qG0ACAikFyOfEo8sYpa8w3SshDdlWp7VQ4uibaLbdSgwPiv
 uj+tI3ryV5Qv4leZXE4/xVi51p3VE31lE+O3J3EESg82ujJn3CzKMX1XOSsocCfXEY9b
 U3XD1onmA8IEuCEQxWyUJAaIxE1odwt7CcLCpPiPuqxez7dns9w9/CFydeCkPB7DW1GC
 pzAPrmKGuoyAPwKUr1C9iEih7Mz5J353oc0q6yuAmFwTBhbUsgjUTSSo3lrg14ZNf4qY
 pYcbNsSIDV/NhMubGOi5bVJIaCfMsXd8JzZHoeUAAed+Nof3zrgkPa7iGY5tg0QvCiRU
 WJJQ==
X-Gm-Message-State: AFqh2kozoefpBlx4S3YR0Fcyc5hDcMH7UdV500Lmun3TIARy/WlbI675
 0Jp7JR5iD4oD+0QD6UOxPd6YHovYMwrpuVto
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a424 with SMTP id
 hg26-20020a05600c539a00b003d9efe8a424mr2516127wmb.34.1673273053181; 
 Mon, 09 Jan 2023 06:04:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm18134541wmb.29.2023.01.09.06.04.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 13/14] hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of
 'struct xlx_pic'
Date: Mon,  9 Jan 2023 15:03:05 +0100
Message-Id: <20230109140306.23161-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H2ntGCTj3uIQ

This remove a use of 'struct' in the DECLARE_INSTANCE_CHECKER()
macro call, to avoid after a QOM refactor:

  hw/intc/xilinx_intc.c:45:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/xilinx_intc.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 4c4397b3d2..6e5012e66e 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -42,10 +42,10 @@
 #define R_MAX       8
 
 #define TYPE_XILINX_INTC "xlnx.xps-intc"
-DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
-                         TYPE_XILINX_INTC)
+typedef struct XpsIntc XpsIntc;
+DECLARE_INSTANCE_CHECKER(XpsIntc, XILINX_INTC, TYPE_XILINX_INTC)
 
-struct xlx_pic
+struct XpsIntc
 {
     SysBusDevice parent_obj;
 
@@ -62,7 +62,7 @@ struct xlx_pic
     uint32_t irq_pin_state;
 };
 
-static void update_irq(struct xlx_pic *p)
+static void update_irq(XpsIntc *p)
 {
     uint32_t i;
 
@@ -87,10 +87,9 @@ static void update_irq(struct xlx_pic *p)
     qemu_set_irq(p->parent_irq, (p->regs[R_MER] & 1) && p->regs[R_IPR]);
 }
 
-static uint64_t
-pic_read(void *opaque, hwaddr addr, unsigned int size)
+static uint64_t pic_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    struct xlx_pic *p = opaque;
+    XpsIntc *p = opaque;
     uint32_t r = 0;
 
     addr >>= 2;
@@ -106,11 +105,10 @@ pic_read(void *opaque, hwaddr addr, unsigned int size)
     return r;
 }
 
-static void
-pic_write(void *opaque, hwaddr addr,
-          uint64_t val64, unsigned int size)
+static void pic_write(void *opaque, hwaddr addr,
+                      uint64_t val64, unsigned int size)
 {
-    struct xlx_pic *p = opaque;
+    XpsIntc *p = opaque;
     uint32_t value = val64;
 
     addr >>= 2;
@@ -154,7 +152,7 @@ static const MemoryRegionOps pic_ops = {
 
 static void irq_handler(void *opaque, int irq, int level)
 {
-    struct xlx_pic *p = opaque;
+    XpsIntc *p = opaque;
 
     /* edge triggered interrupt */
     if (p->c_kind_of_intr & (1 << irq) && p->regs[R_MER] & 2) {
@@ -168,7 +166,7 @@ static void irq_handler(void *opaque, int irq, int level)
 
 static void xilinx_intc_init(Object *obj)
 {
-    struct xlx_pic *p = XILINX_INTC(obj);
+    XpsIntc *p = XILINX_INTC(obj);
 
     qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
@@ -179,7 +177,7 @@ static void xilinx_intc_init(Object *obj)
 }
 
 static Property xilinx_intc_properties[] = {
-    DEFINE_PROP_UINT32("kind-of-intr", struct xlx_pic, c_kind_of_intr, 0),
+    DEFINE_PROP_UINT32("kind-of-intr", XpsIntc, c_kind_of_intr, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -193,7 +191,7 @@ static void xilinx_intc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo xilinx_intc_info = {
     .name          = TYPE_XILINX_INTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct xlx_pic),
+    .instance_size = sizeof(XpsIntc),
     .instance_init = xilinx_intc_init,
     .class_init    = xilinx_intc_class_init,
 };
-- 
2.38.1

