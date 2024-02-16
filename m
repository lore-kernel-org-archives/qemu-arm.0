Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1307323ejb;
        Fri, 16 Feb 2024 07:36:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcP/VodxQ7Ff1qzut2UFr+fKdoxx6YQt2amCa2LJTdXcoLk4AaxUMxcFezBQ6CRYMp2wRUYNNPLj9NEGtWp5FHS/zQSQ9E
X-Google-Smtp-Source: AGHT+IFaQaWpXZbK42ustwu6TcQtio2zXkxLle6HppUCJ94cLo/oj8Sbl3ffCoJ2H3viSdnlUHND
X-Received: by 2002:a05:6214:468b:b0:68f:3328:eac5 with SMTP id or11-20020a056214468b00b0068f3328eac5mr2397580qvb.14.1708097765263;
        Fri, 16 Feb 2024 07:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708097765; cv=none;
        d=google.com; s=arc-20160816;
        b=H0B3NUX9Lf0fTwVtbrZkxWQB1IngsnOdrQclHyvdqXgSzclxJ5nmbNyy/ZPjFsimkK
         mGX8EFEnEsKsvMmYC68motwhUEZQx0UQZ10CSjHQZmK2fvauo9qpmOkB6YH1sgUEJrWB
         tczUf/ewUWzu3RNncMxuEcRiYLr/gIZhSVcbl8yM9Uwt6d4SwJC0xgJcR+9ENTC6DrOr
         TbUkpUWgM8u+N++XevMAw+AhlTvImdirsI5HPzppGrm68ywqXQXXz5ApGjO5VSjt5P99
         o7vktGg5d6uPEWJSHWar0zThw3rSXcpTME9xkBIDJXc9W9vB1vpcevBcWdKurUKPicul
         9WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6ztXjxwe8IKbXpGPRKa7UqA3qhxM54O9HdB2Bhpwj8c=;
        fh=KpqsNNw1IFyzYo1rj8DZWf9KfalluSknyevRmk33lSE=;
        b=HoiSrrR+jhjA360yUVa5IsP9KGsGvARApVI5ykPkEnxafzdZTOtzfBMBosDBshjjAu
         ZibDLsLWCa/kZbJEYXy3ocycO7v3ctAuTuTnbEluratmRfKvt2tAJAsyUp0lbgA0JfgN
         9aKiqSlyBlYRfbs6GHbhfJGOewoyDxFd7rKppwZUYDlZdrB3SOjNkYfh5qOLZw980rlt
         k5X7C2VjHTs20yZPErTIcZFBaK+um0Gk8OZn5Vaybt/yoH5ma583A61PCSKaDdVBsloQ
         wkEhs+j/rdIa99gIhNTMy8DN0CZfyief+g8zU6TkTsd2QT88G5voWDo8h7XA7FHKWflv
         0jXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OHbhCNXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020ad45743000000b0068cc0ed1f88si3093269qvx.326.2024.02.16.07.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 07:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OHbhCNXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb0Ft-0004Hv-2F; Fri, 16 Feb 2024 10:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0Fr-0004GW-Mw
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:36:00 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0Fe-0008If-5h
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:59 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso2065638a12.2
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708097745; x=1708702545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ztXjxwe8IKbXpGPRKa7UqA3qhxM54O9HdB2Bhpwj8c=;
 b=OHbhCNXn0vnVsM5RG9SuZuIctabUQbGfbSYJtKURuTuvdJrs+JGCCQqgFNT5r+aZdg
 r1OCYf0/ro7oFmtLQWz8061n4f5qIJs6UKMdVffDoCeN1LM2mCZj/qBhlQjzGHQBz4FM
 bacWMeQvkffmzh5BDVCp7LLzGDaxa55LFp8e13xbN9Bp9Lpp59bhH/vlc2O5lNkUnG2k
 H47gffriNLc1u/GoMNoKMa0VvA+BMKp07abfufSPnZUmo2poQhGyCtG3qwX7AEY5TtZL
 UkFMD6ZMzFoCleJiSR0zRVZMumLjbm5yJeVcxP6SoRxkD2gfJcXAslAWbiMKp/CuGWz0
 DWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708097745; x=1708702545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ztXjxwe8IKbXpGPRKa7UqA3qhxM54O9HdB2Bhpwj8c=;
 b=lM/YzK9FFWxfPJrlO9+6x681xx1kID+6ea6DHx3/44R3s0sMrSnGapcByu6sVChe5y
 re1my8VnSy92xwG9gLD2TjQrTB3JJqC/2YkXm4Ov4YakbiT8zCUfmEJ2YhFvcBSgJyar
 X1m/7r36ORfaADouA1+Lnqwz/j8PnjfNhgTLvMfwmWf+X8IvrQh4bBXFATT3UgNUbqDZ
 53GD8c3o8gtZhRK4E5//yD1Uga7ktnx5tgUICHiRC/1YE5af2CWjROmQXW5BiQK7blWa
 tTfQBpU9LT/ccE4GxNx+zcXc/Ssg+u10p0jmHTnCUeTqdYKmYBKMCBf8FzQ6klHslC/u
 0lAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNu5KkjSuJyFoNb/Q8PD6T8+Bxl33gc7suYFfWgiPl4SndDzNtQVntPNyxWFAuTx91Z88ezJq0HJ2l/+tNyApitpjV
X-Gm-Message-State: AOJu0YyB26iAZjvh46hypq+/pOE1tIQ/bmvOW92Ua/1z/qwuzgObPiA/
 lPxYilKmp0nRjmqGuI2MF9CYqxgiQI43sLQu89Ud9Egh4mbMpdpXyy2XaQHZkXI=
X-Received: by 2002:a05:6402:793:b0:564:1c0:bf4b with SMTP id
 d19-20020a056402079300b0056401c0bf4bmr836119edy.40.1708097744750; 
 Fri, 16 Feb 2024 07:35:44 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 df13-20020a05640230ad00b005621a9b09fbsm83681edb.41.2024.02.16.07.35.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 07:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] hw/display/exynos4210_fimd: Pass frame buffer memory
 region as link
Date: Fri, 16 Feb 2024 16:35:15 +0100
Message-ID: <20240216153517.49422-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216153517.49422-1-philmd@linaro.org>
References: <20240216153517.49422-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ndzmgmS43OSq

Add the Exynos4210fimdState::'framebuffer-memory' property. Have
the board set it. We don't need to call sysbus_address_space()
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/exynos4210_fimd.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

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

