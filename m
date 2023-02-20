Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2198124ejb;
        Mon, 20 Feb 2023 03:52:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ul2HQOA5dwc8ygO1LlCa5Jz9xRcGsdbzR3V/+V55cdilMqV/NQYr95BJXbXtIrVzz1Y3y
X-Received: by 2002:a05:622a:592:b0:3bd:7a6:67b9 with SMTP id c18-20020a05622a059200b003bd07a667b9mr991732qtb.29.1676893937002;
        Mon, 20 Feb 2023 03:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676893936; cv=none;
        d=google.com; s=arc-20160816;
        b=Oaqy4UHI6+6lHVMiimyP2FfVYt/iGi7n3dklvS/E7hRWV+OqmnXueyuuROyg9sNUzu
         bQgAVFZ4sPUhhOXvmUxXqpYuQkOAG4D6sfX3VUE/eF/n34xcNgwLAaEomjXJuuD1Oc5/
         3v0KeL5tAElbaWByib6CfytmvbQ9hkwQfZ6mScDwLOh91grMD1eiC4jk1PuLBu+kQUE7
         uE5E5VN6vZYN403M6P1AsbKvQQdmHEhK77GGo5RwuRb4bG5fta4nnMO5t7z6xsDM7xu0
         RerX1XiltlB7FaEP0sLkclj/HBY6pagBeNkWbz2tMgQKb6amAWmXOXETipQDBJkXj7qg
         SDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6NhaLGNCVQPhv/J8sWGZUAAWnfpTLonyUi96ru8QtrA=;
        b=o0hpwa1w7yDZAh/4toC+JJuKlNe5WI6GyYIYPMCfNT+9/YGZ36WmvxVjm8/QHq9ycJ
         NqgCxwuocK1fberpiJj4j6LLyl7aKPYz+oxgxVBIK24NB2fgdECFpGVHPtuIbVqoFtq/
         WqxxEzsqSqyp0xq6UEhB5dJ9QU/Ced0mpJl1i9LwpDj2JszwD66bH7NPPxcUguKtXCjP
         iDlSgJjDeoXRBf9z4B7t9KTAoRSQj6/dCH7ToKyYiJqg97sV0nLXWuwlda1/pN+bVieO
         KGAVw2MpDeaLujXwZUsK/zqwb4zYj0gwBSGpSINmBPVrEyet2e91sx154AO2VuXjAFB4
         ujaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVPi6Wx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85948000000b003ba1a343c31si876287qtz.95.2023.02.20.03.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 03:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVPi6Wx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU4hg-0001gj-SD; Mon, 20 Feb 2023 06:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hd-0001fn-UI
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hc-00055y-AV
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id o4so868400wrs.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 03:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NhaLGNCVQPhv/J8sWGZUAAWnfpTLonyUi96ru8QtrA=;
 b=AVPi6Wx60NvkshlJ17yAiwwDjq5+mjehWJFkHA+HyJ6PS9IgNocQMHNfphzPx+wA6L
 yT284zu9GpMltWIhe9fB3r4uD39QYXCmkNZ3EU61n3KsfxHhkuXCtaEq3VKkXWDwOEK3
 b93EeLDrKLSTCKIPzm5NCy8LJMNsPWCWd6vT+hZ0Nt19xW5P4cTYUWw1DJyAhAnDyhz3
 rjjDlb+7Zgqs0VAk2bom6HZv836OrxzEq0xQt8UmOr+zROPx1YhhUg9bmunSU35VMPRS
 G7FCOFCAXsIxbUOvN58uYqfLJYKmdBhc7RIt5jUVNQdlC3lzV10EDApXnRcsmYlOz2J1
 0IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6NhaLGNCVQPhv/J8sWGZUAAWnfpTLonyUi96ru8QtrA=;
 b=ICYv/Eq1ZvmmSYZCKg+f01CZlt4yfWbt1C7UshYPfQPJZ5EkZJQaOZabJiGyigmemC
 lbGLHhMRpa65RE0zW9c/s16DSLl3D2K8vs/Unnj3CGw37oy9DuUOq1sgJEzHH9WSKZHy
 ct+mN/NX03TXFDhzFTtdyPs4EG6S2JFibu/4+9cgDfdUj3vTQbbvc9BtpoSIfEvYP01G
 BGbHsDUCmQtcCcDeRJiA8Y0TMgEQ6yTswlguYMxOK4JcR/7b/XB67G504HDI7SOjObqw
 JaLfNar48N0FBf/ht5gaUfQAwNKUiyCwkxb9PWk2YtDsC0BtE1KNX9grbvgy34Usl83G
 Bunw==
X-Gm-Message-State: AO0yUKXMXwOzpv2xJjPMA8lDCMVnvctGcI9mVkiemNJkIEEXH0sJq4jn
 3NrU47nyFwMEExA6bSe+YiDQwQ==
X-Received: by 2002:a05:6000:18b:b0:2c5:4f35:1b2b with SMTP id
 p11-20020a056000018b00b002c54f351b2bmr639360wrx.28.1676893886786; 
 Mon, 20 Feb 2023 03:51:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a5d595c000000b002c54a2037d1sm2407842wri.75.2023.02.20.03.51.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] hw/char/pl011: Un-inline pl011_create()
Date: Mon, 20 Feb 2023 12:51:08 +0100
Message-Id: <20230220115114.25237-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wd7doiUxf+ML

pl011_create() is only used in DeviceRealize handlers,
not a hot-path. Inlining is not justified.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c         | 17 +++++++++++++++++
 include/hw/char/pl011.h | 19 +------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c15cb7af20..77bbc2a982 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -19,10 +19,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/char/pl011.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
 #include "chardev/char-fe.h"
@@ -31,6 +33,21 @@
 #include "qemu/module.h"
 #include "trace.h"
 
+DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_new("pl011");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, addr);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
+
 #define PL011_INT_TX 0x20
 #define PL011_INT_RX 0x10
 
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 926322e242..d82870c006 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -15,10 +15,8 @@
 #ifndef HW_PL011_H
 #define HW_PL011_H
 
-#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
-#include "qapi/error.h"
 #include "qom/object.h"
 
 #define TYPE_PL011 "pl011"
@@ -57,22 +55,7 @@ struct PL011State {
     const unsigned char *id;
 };
 
-static inline DeviceState *pl011_create(hwaddr addr,
-                                        qemu_irq irq,
-                                        Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new("pl011");
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
+DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
 
 static inline DeviceState *pl011_luminary_create(hwaddr addr,
                                                  qemu_irq irq,
-- 
2.38.1

