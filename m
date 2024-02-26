Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203442ejf;
        Mon, 26 Feb 2024 09:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8DsdInrhDdvG/6q1RiC68QaoWzv7+T/QvtClF70gD8Zrp/XFAik7ox+649CbVwM75L9eI+6PcD0G8nyzIXhRA5tw/EsTh
X-Google-Smtp-Source: AGHT+IGBg1PK2OdWCditZzHbsEYRHr3DQHrb/AbKaK5LVopz+ZetbXamHuKl0PtsDG5090ZaQzna
X-Received: by 2002:a05:620a:31a0:b0:787:c780:a78c with SMTP id bi32-20020a05620a31a000b00787c780a78cmr9838282qkb.52.1708969134080;
        Mon, 26 Feb 2024 09:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969134; cv=none;
        d=google.com; s=arc-20160816;
        b=T7iJQRK/HQ0kgvJtAkanlIxiT/ytaTH6YfkXPzG69Ecp4CWGDyUH1AMk53TOKit5rs
         uNihfN8Z4ykUgidtTCYKYnbeg81cS0xDX7WPD+IB62spOZ2WHt+dNb82pRSS1rFewZi9
         sUnnUJZdVh4ioVDJRvLU38wsgY8xUH8zJM4h4JYIOYdep+FRiW1dt0VnRDu68bYa0atL
         hTxsiuPAqCNEUUW6Ot/1eB8hy/8n+ZTSkeQtNWZGllFC7EEFoA4CjbG6xiE149+NSDJ3
         RRWEIVrLI4f57hedWpQQRYNKXYlU6eEvUfqaplMLxrYqFKat3+Drh4/LbvnQMWXKVm1H
         o/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PgxgQMnqYvptEpW+MzXMom2BVnIVN63/TeZ44omQsrM=;
        fh=hXBz7qm8Kf5b78SvQ683p6CidcN0HSYS2W160lsNAR0=;
        b=dDKUaVM9hh4HN6FIEes9e2sFt/LPT4V+eM3HyJ9fPaYZqsvW9Q5eMoxMH8n0/Zz+4y
         O6zgiLmXfK/lbLAM5uyw6Pzyd7pvDWyep6gfJy464xf0uxHjCHVwroXTmtTMinMUcl2k
         fUNsJqEwVhid9yarRlMlpTqGAVuy26/0YxL+gyfJtEAXUzAYQLE23UT5tXx2W3qmJzc7
         BZRUylHPu0+qZXXCZmLZD1GYba4YhCAm4xbMmiIfO17sKi2uAeq0QAnAFf8YxlVc4ocI
         70f0ZhHGDXfF+FPF/lAQqNJ+cbZ1Nn3u7YJkMsAWitqnoypZH8hj3onLS9plZTcaAkvL
         n5uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7T4VvPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo20-20020a05620a531400b00787b070ce5esi5296485qkn.631.2024.02.26.09.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:38:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7T4VvPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reew7-0004VB-Pc; Mon, 26 Feb 2024 12:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevx-000481-MO
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevv-00078O-2Y
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412a5b63c11so7416655e9.2
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969109; x=1709573909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgxgQMnqYvptEpW+MzXMom2BVnIVN63/TeZ44omQsrM=;
 b=O7T4VvPJm7D5pdsxd+xAaXnu6CMYKatBtyMOfgwEaps97pB2eoaHlSSDEWbR7qHUIc
 9q4s+8g+CJqqn3ahFSw/YWn71PaYQH1OQGfv4yz8+wAX6hVCjCzl1NwLQxxlsWKBLaQ7
 T62fLpWARkx9sDqSGACqAYom+jVMHV52syJ7yp6Odqlg/T1SbymEE1G1KQlH1Xoih/EI
 S25+f0SZIHs4U9TKYGm4eLyvjOwAqgyb9kChXKWOR1uG4bZJ8XbUqtvZg72zlv8EUouE
 37UrmiSrM19em/caAV9J72TKr1WDlQvPtsA+iS2++2KmlyT8yvgamU6wmwP1OpGRAO0Q
 rFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969109; x=1709573909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgxgQMnqYvptEpW+MzXMom2BVnIVN63/TeZ44omQsrM=;
 b=eU25eEXO6EilN5i+u9Tu7J5VixGe6u0rZogIvZrbHsCxGP3I8Omm0N3nf/+sWTmnEG
 a1t0ci13Ik9hsb9X5ErRaUdnIJwC7rklmusDYbsWr+NkHjbVAKCngUSpWsdFuGDBhFRE
 reXI/E+fmk05wus0nig5EqC6OXFAMqLCtE6R5Ck8fEgxnTrhItj5sIQQ5s1Zdz3N9m0L
 i9T9PlOg5G1MvSQxHbjr2n73xqLNidOmp1rh6U8YrffMD3iqhLZaNoMEaqfZSo9wkOP6
 W2XhabHq68nV8Dz4dyeB715tYEIhvY+/7sIP89SWZjnOJs+rvVCQtz2mewf5A3IG92iw
 LuWw==
X-Gm-Message-State: AOJu0YwmQ09I4avfM9bt2IunQn+F9VvWjllFufx0KE8wrfRgRYx8R8D0
 6J3PitzxvJ462nQfUMR0FhYQR6SvRy4eJ/Y+zd4JEpQD56JX3ITvgyoTGzfBUJw=
X-Received: by 2002:a05:600c:35cc:b0:412:a72c:9d9c with SMTP id
 r12-20020a05600c35cc00b00412a72c9d9cmr1611244wmq.17.1708969109772; 
 Mon, 26 Feb 2024 09:38:29 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c234b00b00412704a0e4asm12527590wmq.2.2024.02.26.09.38.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/6] hw/display/exynos4210_fimd: Pass frame buffer memory
 region as link
Date: Mon, 26 Feb 2024 18:38:02 +0100
Message-ID: <20240226173805.289-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
References: <20240226173805.289-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SivXuMK0uaDX

Add the Exynos4210fimdState::'framebuffer-memory' property. Have
the board set it. We don't need to call sysbus_address_space()
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/exynos4210.c          |  2 ++
 hw/display/exynos4210_fimd.c | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ab18836943..e3f1de2631 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -770,6 +770,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /*** Display controller (FIMD) ***/
     dev = qdev_new("exynos4210.fimd");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(system_mem), &error_fatal);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_FIMD0_BASE_ADDR);
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 84687527d5..5712558e13 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
@@ -32,6 +33,7 @@
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "qom/object.h"
 
 /* Debug messages configuration */
@@ -302,6 +304,7 @@ struct Exynos4210fimdState {
     MemoryRegion iomem;
     QemuConsole *console;
     qemu_irq irq[3];
+    MemoryRegion *fbmem;
 
     uint32_t vidcon[4];     /* Video main control registers 0-3 */
     uint32_t vidtcon[4];    /* Video time control registers 0-3 */
@@ -1119,7 +1122,6 @@ static void exynos4210_fimd_invalidate(void *opaque)
  * VIDOSDA, VIDOSDB, VIDWADDx and SHADOWCON registers */
 static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
 {
-    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
     Exynos4210fimdWindow *w = &s->window[win];
     hwaddr fb_start_addr, fb_mapped_len;
 
@@ -1147,8 +1149,7 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
         memory_region_unref(w->mem_section.mr);
     }
 
-    w->mem_section = memory_region_find(sysbus_address_space(sbd),
-                                        fb_start_addr, w->fb_len);
+    w->mem_section = memory_region_find(s->fbmem, fb_start_addr, w->fb_len);
     assert(w->mem_section.mr);
     assert(w->mem_section.offset_within_address_space == fb_start_addr);
     DPRINT_TRACE("Window %u framebuffer changed: address=0x%08x, len=0x%x\n",
@@ -1924,6 +1925,12 @@ static const GraphicHwOps exynos4210_fimd_ops = {
     .gfx_update  = exynos4210_fimd_update,
 };
 
+static Property exynos4210_fimd_properties[] = {
+    DEFINE_PROP_LINK("framebuffer-memory", Exynos4210fimdState, fbmem,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void exynos4210_fimd_init(Object *obj)
 {
     Exynos4210fimdState *s = EXYNOS4210_FIMD(obj);
@@ -1944,6 +1951,11 @@ static void exynos4210_fimd_realize(DeviceState *dev, Error **errp)
 {
     Exynos4210fimdState *s = EXYNOS4210_FIMD(dev);
 
+    if (!s->fbmem) {
+        error_setg(errp, "'framebuffer-memory' property was not set");
+        return;
+    }
+
     s->console = graphic_console_init(dev, 0, &exynos4210_fimd_ops, s);
 }
 
@@ -1954,6 +1966,7 @@ static void exynos4210_fimd_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &exynos4210_fimd_vmstate;
     dc->reset = exynos4210_fimd_reset;
     dc->realize = exynos4210_fimd_realize;
+    device_class_set_props(dc, exynos4210_fimd_properties);
 }
 
 static const TypeInfo exynos4210_fimd_info = {
-- 
2.41.0

