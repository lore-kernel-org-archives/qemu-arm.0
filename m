Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2606437lff;
        Thu, 19 Dec 2019 10:53:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqk8Z+0zgBWz5kgC4Kf6bnG+/M4GvJ7ZdSsRi8mkHT+C0vMIUR+G+q3YJi05FQc+ye9CDC
X-Received: by 2002:a05:6830:18e3:: with SMTP id d3mr4281676otf.190.1576781633109;
        Thu, 19 Dec 2019 10:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576781633; cv=none;
        d=google.com; s=arc-20160816;
        b=HIoP/TOOqdUg4lMmiYGF48KCe24lpkgLwaUfFL7n3UhdFLG18sAtAoQoi64YvqGwx3
         PwcUmic0Rm18A7VaTfNLO7XOrx4AezFHaxoV+hVAhD33JKut1gleL6GoMUpOOSN5u6Ta
         saOe8fEoqSSnsPEgyDmkNjguaAFybhk/bTR0fixuyP0yyjQ4pwrDNngGgNegUl5Et0TF
         HAv5b4J2qHLmwvKsuOW4SkZ+2VeLDloFhJRwpwdvfPgtwHvOfdpFwbqesqae08xGUI+U
         sL4E3U8hHKdhoSE+GirRi4yX48WbikzEtXGPCg+2f4S8FPiUmCu1rLmsc/kWVrTQicHp
         uvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EUHgqN5LBpAPTBRZ9G6aJDxWyEcBGmSlmJWyOyX8iGE=;
        b=JlhwS0+5Ft6JQBhfwDA0rZe33QYs925mgrGTSbMAobUDocsp5jreeseVovocPAxOTk
         0BKDMVA0e6KDoc8TA/AgijZ0/im1X/MKdJFG5Oq0BDvbRBv7ii5MxL0EbV+jaZEnIvgu
         w2nSKXqPYmtGdMT7ORz5rKo7zfGgrFT1LzBr0VJ0r+RpFJqsvZExVOweKRAdemwDKSOV
         aR7NTxbQQ6q9iiF9lwlWF2AI5nfPZnLlgMZbwt1pI47p0xsRoJRKQpiLE5CfgG37vFBA
         f20gkkuIPPHwDruF4xpJeXZdKqskNYF0NV0x3WtH9kI5xGMEUemfx1k3+EQWeYNHVWVI
         JxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C9XvGLU3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si2865806otj.32.2019.12.19.10.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 10:53:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C9XvGLU3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii0vn-0000Zl-T5
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 13:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tl-0007FQ-Uy
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tk-0008Q5-He
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:45 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tk-0008Kp-9k; Thu, 19 Dec 2019 13:51:44 -0500
Received: by mail-wr1-x444.google.com with SMTP id w15so7076584wru.4;
 Thu, 19 Dec 2019 10:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUHgqN5LBpAPTBRZ9G6aJDxWyEcBGmSlmJWyOyX8iGE=;
 b=C9XvGLU36y3C2NHjYPgZZvJRY0Di1d6uhh+ByZM9sPVnpIcRWurK+nc1NkWG6KhhYl
 AqIdsKBSp0rFLyU8qOWy/T/g3t44mS3GBcrDC4nf29+qfPRtCqswddeUWkJoqLABniBf
 A74RXxUFN8S9HG5aEJI+mVdFGq5js5Li5FQXeGKHovaxbNkDUlWQQ7NSsdHqQUe+qPsO
 f9p9kgkZSm4lk1Oyi8qbfdYMdGS1l3vyA4KzKnfD+uFmFvF78lEfPODm7xzRMju7DCg7
 X5tvQ8yLGzcZ9vV7cEBDpuBdQVWoUTCcLl3EGlHjcQ8wkbTl3xoj3+0IM6rQlAfZX+qa
 hAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EUHgqN5LBpAPTBRZ9G6aJDxWyEcBGmSlmJWyOyX8iGE=;
 b=IcvhRptTPccKFt4HXN6yfzLDy1DEmPS7DjYkO8yUG5skF4rkJ6yCMYdjw79wH4J3Yl
 X86RA2qE/r7sREmtM6Ocsf7sUaD0sPKrbL9NmmXCOxUtAvf1xsVAm3mIHCC3/ydwa845
 UeAUIQpO+IeOCdDXVqbUFlNPpYzQXPn36fCiATgy+IRVrnqihoNwoXS9gLQ/rYi7ENj3
 eKIcHh2KZp+fXABvA2duKi6w1UFQ2eA5H9XL+WBmft0jhRrKXylY4gLRhPI1NeItBOFu
 xxscc3z05KZNM4nUx5EBEBWiyDGk3almBsmYEMkdGxbNxdK3/FpFLdYHQwc+0R+6ei5F
 q6Yg==
X-Gm-Message-State: APjAAAUKrh/rBIALRcsPGEKh9r5ux5o7Q/sBS0AXIMbLm7jcUWFUnlm+
 U0g78dhjsmgd1B2Pkz6cXxHJlUno
X-Received: by 2002:a5d:6349:: with SMTP id b9mr11469419wrw.346.1576781502942; 
 Thu, 19 Dec 2019 10:51:42 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id b67sm7435494wmc.38.2019.12.19.10.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [RFC PATCH 11/13] hw/timer/allwinner: Introduce TYPE_AW_COMMON_PIT
 abstract device
Date: Thu, 19 Dec 2019 19:51:25 +0100
Message-Id: <20191219185127.24388-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219185127.24388-1-f4bug@amsat.org>
References: <20191219185127.24388-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t5sBjUSlc7bs

Extract the common code from the TYPE_AW_A10_PIT device into a new
abstract device: TYPE_AW_COMMON_PIT, then use it as parent, so we
inherit the same functionalities.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
At this point, the only fields we can modify are the timer_count
and the region_size. Not enough to implement the H3 timer, since
we need to move the WDOG register. Still some progress, so Niek
can continue ;)
---
 include/hw/timer/allwinner-a10-pit.h |  1 +
 hw/timer/allwinner-a10-pit.c         | 50 +++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index 9e28c6697a..8453a62706 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -4,6 +4,7 @@
 #include "hw/ptimer.h"
 #include "hw/sysbus.h"
 
+#define TYPE_AW_COMMON_PIT "allwinner-timer-controller"
 #define TYPE_AW_A10_PIT "allwinner-A10-timer"
 
 #define AW_PIT_TIMER_MAX        6
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index f2ac271e80..ad409b96a1 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -54,6 +54,20 @@
 #define AW_A10_PIT(obj) \
     OBJECT_CHECK(AllwinnerTmrCtrlState, (obj), TYPE_AW_A10_PIT)
 
+typedef struct AllwinnerTmrCtrlClass {
+    /*< private >*/
+    SysBusDeviceClass parent_class;
+    /*< public >*/
+
+    size_t timer_count;
+    size_t region_size;
+} AllwinnerTmrCtrlClass;
+
+#define AW_TIMER_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AllwinnerTmrCtrlClass, (klass), TYPE_AW_COMMON_PIT)
+#define AW_TIMER_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AllwinnerTmrCtrlClass, (obj), TYPE_AW_COMMON_PIT)
+
 static void a10_pit_update_irq(AllwinnerTmrCtrlState *s)
 {
     int i;
@@ -303,19 +317,20 @@ static void a10_pit_timer_cb(void *opaque)
     }
 }
 
-static void a10_pit_init(Object *obj)
+static void aw_pit_instance_init(Object *obj)
 {
     AllwinnerTmrCtrlState *s = AW_A10_PIT(obj);
+    AllwinnerTmrCtrlClass *c = AW_TIMER_GET_CLASS(s);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     uint8_t i;
 
-    s->timer_count = AW_A10_PIT_TIMER_NR;
+    s->timer_count = c->timer_count;
 
     for (i = 0; i < s->timer_count; i++) {
         sysbus_init_irq(sbd, &s->timer[i].irq);
     }
     memory_region_init_io(&s->iomem, OBJECT(s), &a10_pit_ops, s,
-                          TYPE_AW_A10_PIT, 0x400);
+                          TYPE_AW_A10_PIT, c->region_size);
     sysbus_init_mmio(sbd, &s->iomem);
 
     for (i = 0; i < s->timer_count; i++) {
@@ -328,26 +343,45 @@ static void a10_pit_init(Object *obj)
     }
 }
 
-static void a10_pit_class_init(ObjectClass *klass, void *data)
+static void aw_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = a10_pit_reset;
     dc->props = a10_pit_properties;
-    dc->desc = "allwinner a10 timer";
+    dc->desc = "Allwinner Timer Controller";
     dc->vmsd = &vmstate_a10_pit;
 }
 
+static const TypeInfo allwinner_pit_info = {
+    .name = TYPE_AW_COMMON_PIT,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_init = aw_pit_instance_init,
+    .instance_size = sizeof(AllwinnerTmrCtrlState),
+    .class_init = aw_timer_class_init,
+    .class_size = sizeof(AllwinnerTmrCtrlClass),
+    .abstract   = true,
+};
+
+static void a10_pit_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AllwinnerTmrCtrlClass *atc = AW_TIMER_CLASS(klass);
+
+    dc->desc = "Allwinner A10 Timer Controller";
+    atc->timer_count = AW_A10_PIT_TIMER_NR;
+    atc->region_size = 0x400;
+}
+
 static const TypeInfo a10_pit_info = {
     .name = TYPE_AW_A10_PIT,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AllwinnerTmrCtrlState),
-    .instance_init = a10_pit_init,
+    .parent = TYPE_AW_COMMON_PIT,
     .class_init = a10_pit_class_init,
 };
 
 static void a10_register_types(void)
 {
+    type_register_static(&allwinner_pit_info);
     type_register_static(&a10_pit_info);
 }
 
-- 
2.21.0

