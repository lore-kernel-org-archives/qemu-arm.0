Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2324327ejc;
        Mon, 9 Jan 2023 07:06:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMh0GQ5THmPcFOvx/InqHg3bL9LcN1pn9ttv+UFvgVWv/YCLN0J7eqOGhRIMVj+9ZPv2jB
X-Received: by 2002:a05:622a:802e:b0:3ad:c789:bace with SMTP id jr46-20020a05622a802e00b003adc789bacemr3271301qtb.15.1673276765014;
        Mon, 09 Jan 2023 07:06:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673276764; cv=none;
        d=google.com; s=arc-20160816;
        b=L0y2AYvWDxdz4JwdewMJXspqsLzUvzrysA0sw1cT4UzwNfGVJrOUjBQmMP9BCHX5AF
         5Svf7HY/J37cVx9upl1LoXyRvNBoD81MQT+dnzqOeEVbE/7jFnE5vkBA84vRHLjGpbeH
         rDoguFI5OeT9vhQ93N7S4BjBxVTSYkilgS1hMR5uicOTsbyYnBb4Eced8w9UO8urawE1
         Q1Lch5f+dNXxN1aynDK+fVuAV8FlH+d4h6OPp0Geg3TORByAxBVEAgEEU8RwXqVEgHck
         oUK2wcIntT1ZqS/04BZ7fgTNR8YGXDlo7Q9iYsV7SrXETZ5dSZu3UD5hTtRPB5liQsRp
         C5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WrR1GDMObTllDPwJtD3Of+jW/9BkqqN5WyyEeN1uJKY=;
        b=pdRpKNslAUJBX9cyy+LGKCXWMeDTRcT7HBuVB7sDb984R9jJD9I8l+77w4f3tRl9df
         V6a/jVjS7g1mNknBIqUhOv8tJadCSJtVXjDYNrtjTDcMWXtwKTQb82d8ziI63bh/kfOA
         SWAjt0BEtPXAZZq8zlFhv2rJuscG6gwJ6YOQqHUE8bDTqbzUPoulv3RePQgJzDISezGE
         SEMQB57mS96i64i5FrhWobC3+Mmgg+ZqJw5HpWxCiyNryk1Z4gYjF+sdOFgtNvsgAKAs
         WeM6FBYmq9osWR3xs0A4LPpmO3ru6mdrmIxfGSliQGU/OS7Oc6XMaxXC3lMdqT2677/t
         yinA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOZ+uxN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020ac8670c000000b003a7e9f35822si4389170qtp.722.2023.01.09.07.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 07:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOZ+uxN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEslQ-0001z1-87; Mon, 09 Jan 2023 09:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEslC-0001sT-GQ
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:04:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEslA-0007Ft-MF
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:04:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso3886896wmq.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrR1GDMObTllDPwJtD3Of+jW/9BkqqN5WyyEeN1uJKY=;
 b=iOZ+uxN5jCKG7I/DUWcF6QaCuPpV14kq9LNDH7pB/h2nPr8ZNwh5h9M9a2USyhvQiI
 q+nGXUiUKan1D7a/RatyCvAlAPp4zH8fuhUt3g9R1vVGC+cWCIIG363Ja6YFd9fzBzgJ
 xJJN3Ef5A6K45/R79amUCbOkD4wlWUrFd/tjz2+iLAkdxccpNsHWVjL1oWCH/b1WaYxH
 6ZCYlxq6bftJvSO8TV5fCnVMRczNcueSoZM+MauthPn5d7siI0Fe+grXiXf9bfrUEW9J
 wsXvi8NsTdpPyTrGOYhdp/HqBXtyD05EycNT6gX+lITCzXC4ejnLUSOhciazLYEbvqNo
 iKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrR1GDMObTllDPwJtD3Of+jW/9BkqqN5WyyEeN1uJKY=;
 b=Hn8fk2Kje7MALiGvje9HricJTgv4iOCe07Sh97qDsB+4W8e1IJQur/R+R6ygGwoV3o
 rX7iB2NNiwtstRDbC0A6LKhCh+IU7y7XFzTVlLbuy5LDwywrChKalhISRXYzLAvuwnaJ
 vVIqERPD3BeIEd8oFLXdu6rmw9leT1t9BquEDs/vwfZ9eOWkz/rCEIAP0XaYSZrO8DZO
 rCWDmYnK1E0r1TovKcDjz+OC4mz+ikKcWqUVeQoD+FVZ1271Jscv4wP84CIJy9mePIhV
 mVMKZxlBGWeW/AJCRa1qq2aMImD47ToS9cxCr0r9ZX9UH+XoQ4mTe1nn8hqa0x0KVGpj
 lbAg==
X-Gm-Message-State: AFqh2ko5XMK99fiW85Vtf1zg9ap2B0UxE+cY+VzOnGtHSH0R2t5sRTgl
 KE+2YLY2yFTOxH7hNERxv/xwAw==
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id
 a11-20020a05600c348b00b003d22a722577mr45551835wmq.27.1673273058111; 
 Mon, 09 Jan 2023 06:04:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c339300b003cff309807esm15064539wmp.23.2023.01.09.06.04.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 14/14] hw/timer/xilinx_timer: Use XpsTimerState instead of
 'struct timerblock'
Date: Mon,  9 Jan 2023 15:03:06 +0100
Message-Id: <20230109140306.23161-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: jxBBZCJwuQP9

This remove a use of 'struct' in the DECLARE_INSTANCE_CHECKER()
macro call, to avoid after a QOM refactor:

  hw/timer/xilinx_timer.c:65:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/xilinx_timer.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index c7f17cd646..32a9df69e0 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -62,10 +62,10 @@ struct xlx_timer
 };
 
 #define TYPE_XILINX_TIMER "xlnx.xps-timer"
-DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
-                         TYPE_XILINX_TIMER)
+typedef struct XpsTimerState XpsTimerState;
+DECLARE_INSTANCE_CHECKER(XpsTimerState, XILINX_TIMER, TYPE_XILINX_TIMER)
 
-struct timerblock
+struct XpsTimerState
 {
     SysBusDevice parent_obj;
 
@@ -76,7 +76,7 @@ struct timerblock
     struct xlx_timer *timers;
 };
 
-static inline unsigned int num_timers(struct timerblock *t)
+static inline unsigned int num_timers(XpsTimerState *t)
 {
     return 2 - t->one_timer_only;
 }
@@ -87,7 +87,7 @@ static inline unsigned int timer_from_addr(hwaddr addr)
     return addr >> 2;
 }
 
-static void timer_update_irq(struct timerblock *t)
+static void timer_update_irq(XpsTimerState *t)
 {
     unsigned int i, irq = 0;
     uint32_t csr;
@@ -104,7 +104,7 @@ static void timer_update_irq(struct timerblock *t)
 static uint64_t
 timer_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    struct timerblock *t = opaque;
+    XpsTimerState *t = opaque;
     struct xlx_timer *xt;
     uint32_t r = 0;
     unsigned int timer;
@@ -155,7 +155,7 @@ static void
 timer_write(void *opaque, hwaddr addr,
             uint64_t val64, unsigned int size)
 {
-    struct timerblock *t = opaque;
+    XpsTimerState *t = opaque;
     struct xlx_timer *xt;
     unsigned int timer;
     uint32_t value = val64;
@@ -202,7 +202,7 @@ static const MemoryRegionOps timer_ops = {
 static void timer_hit(void *opaque)
 {
     struct xlx_timer *xt = opaque;
-    struct timerblock *t = xt->parent;
+    XpsTimerState *t = xt->parent;
     D(fprintf(stderr, "%s %d\n", __func__, xt->nr));
     xt->regs[R_TCSR] |= TCSR_TINT;
 
@@ -213,7 +213,7 @@ static void timer_hit(void *opaque)
 
 static void xilinx_timer_realize(DeviceState *dev, Error **errp)
 {
-    struct timerblock *t = XILINX_TIMER(dev);
+    XpsTimerState *t = XILINX_TIMER(dev);
     unsigned int i;
 
     /* Init all the ptimers.  */
@@ -236,16 +236,15 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
 
 static void xilinx_timer_init(Object *obj)
 {
-    struct timerblock *t = XILINX_TIMER(obj);
+    XpsTimerState *t = XILINX_TIMER(obj);
 
     /* All timers share a single irq line.  */
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &t->irq);
 }
 
 static Property xilinx_timer_properties[] = {
-    DEFINE_PROP_UINT32("clock-frequency", struct timerblock, freq_hz,
-                                                                62 * 1000000),
-    DEFINE_PROP_UINT8("one-timer-only", struct timerblock, one_timer_only, 0),
+    DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
+    DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -260,7 +259,7 @@ static void xilinx_timer_class_init(ObjectClass *klass, void *data)
 static const TypeInfo xilinx_timer_info = {
     .name          = TYPE_XILINX_TIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct timerblock),
+    .instance_size = sizeof(XpsTimerState),
     .instance_init = xilinx_timer_init,
     .class_init    = xilinx_timer_class_init,
 };
-- 
2.38.1

