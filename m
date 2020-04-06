Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4241485lfi;
        Mon, 6 Apr 2020 10:54:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLVlBT0cEbFm3dGOMlJ9bUUYZyVVI/9G9DUOEFTXhLhHCD7BuZASMSfl16lUzkacuq1+t49
X-Received: by 2002:aed:30c1:: with SMTP id 59mr705966qtf.106.1586195640319;
        Mon, 06 Apr 2020 10:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195640; cv=none;
        d=google.com; s=arc-20160816;
        b=OvFKiaxD7geyymL6un/I3xKwaQrN8hIB1YvcH+SxCH3f8pS1vtsf/zTcNIIHvIjKh/
         Dk9wTo0hTNF1fiG497UV1NGvZlLf6/IywbmGZu2aBOEXFFIg4vySHHEjzlqPRbyZm4MQ
         XkNdxpRPoYTpwHQy8rtDbkmdbyfqAxOcHxlgMzVWroL0c5+5BNHVLby8P/D7UO/y9419
         ZhgqxgsafKNFZyF/I8nLWM5giS318ZsRjMfk7vwC7kI4NNHMDV71NYr+x7MI9wbhaNkc
         XNj8K8uCeZBW7YH9mBSakARpw18lVVWBE6dEToedVwaCvv9gksstmaSFNhQUgjrWowE+
         ACwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XkypjbVuB+1GCium+eRMS4VtjczYNZWFQPGZz1SIZd4=;
        b=hHVfkWxexeu6bbMiOwtWgVHjAPdbPiVFRwZs+CASoihD06LU0fXH0dGcTMhKGm7g9J
         CzpdLPN2E9GFkfDeG3vGg46UrgV+Vdy7hRb6sEeXHHbTwMFdhkCmE8I0K76pexlah44K
         2whPMAHfn3W+d1gaq1C6WvIetFPnetgwwWJfDBJOJZcOtGAS/VHlEI67B4FEjjOMjiCw
         Y+1sYPgwitOk2QfIaHdKAfEYOFi51n23fDB1EASQf8KFL39FCjETvvwW74Z2GaGmVSdd
         xlE6LkiHngOfpFIexyYyZdtvxuXhB1So5EhjsI4uSNBJc7HZA6MsjnRns3HseVmaN3Ce
         5I0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Rgt/+zlW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v55si191468qtc.309.2020.04.06.10.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Rgt/+zlW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVwd-0003cg-NK
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqn-0001VQ-Hq
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVql-0001ZH-3y
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:47:57 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqk-0001VW-U1; Mon, 06 Apr 2020 13:47:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id i19so333801wmb.0;
 Mon, 06 Apr 2020 10:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkypjbVuB+1GCium+eRMS4VtjczYNZWFQPGZz1SIZd4=;
 b=Rgt/+zlWav1fyZIwcpx/1XZAIgQvCyKpgG8RA8eLsgvCmxGZ4bpM9GUKvK5VhcF0wN
 YdK6g5C1OrSX7bKaq+wCLqzvxk5oByiBI9fEnzVniTNQIOB+ZjFQbihP9tAmvfPqT2gu
 nxwSxFqjDPLQavDyrVNgyQlONHVksTDvuIkfplsTzD7/jrvYfcw0/hlc71jyxz98akyf
 Blmp5mwgbBhO69bB/NAQcc+f2l1QO/IdVYzS1Nea+vLX8M5mXfTM7WlXxvlW+P5xkvkw
 B9QrXpRek1oOfMvvCZOLFBQaJL01cZpJOaOqx0RqmCnrtli9X2hs+xu80n8kLvczg+et
 CrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XkypjbVuB+1GCium+eRMS4VtjczYNZWFQPGZz1SIZd4=;
 b=SDeogOgzY+6T1E4Cb2vx1gpXtTNbqaBcB/Kz8NBt8wseLG9ggusjrGuPKD+N1TTdVh
 T7OU9Im5WI40RtyPMSj7gXNzX6YApjTVMqj0MHj35uHIskQ4dBu8B+O024QfkQeXPIq/
 lF5Pxx4oA7QgSXT6fV7GwTiWLD70DrpCJc7MCCg9rbQZDP9SkXCWx2+Rr31/5MJsxVfn
 8hNhAayC96j86vAQv6YT0AZJ2YOgANT57f9ZTLGgHEasOXtozKGGo1/v2q0/zbxy4O/O
 YS0jQ2yA6Iq6JTWBzIxl2GwJcfVqcbHlbjYZEZGQ+aZat4OhmeeZpA2EsKYlyVbok5ek
 qv7Q==
X-Gm-Message-State: AGi0PubTkxhTlz2troxs47LmO+3i/Ki5IbHp3beenyF3doA3QbPZ+qHM
 IbhyFgwJDsyY+yZt+Sn81xcVaiXBFFo=
X-Received: by 2002:a05:600c:2f90:: with SMTP id
 t16mr206684wmn.66.1586195273564; 
 Mon, 06 Apr 2020 10:47:53 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:47:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 05/54] hw/arm/aspeed_ast2600: Move some code from
 realize() to init()
Date: Mon,  6 Apr 2020 19:46:54 +0200
Message-Id: <20200406174743.16956-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1AU7z2do/dwZ

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/aspeed_ast2600.c
  >>> possible moves from aspeed_soc_ast2600_init() to aspeed_soc_ast2600_realize() in ./hw/arm/aspeed_ast2600.c:243

Move the calls using &error_fatal which don't depend of input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_ast2600.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index b08359f3ef..c8e0171824 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -114,6 +114,16 @@ static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
     return qdev_get_gpio_in(DEVICE(&s->a7mpcore), sc->irqmap[ctrl]);
 }
 
+/*
+ * ASPEED ast2600 has 0xf as cluster ID
+ *
+ * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0388e/CIHEBGFG.html
+ */
+static uint64_t aspeed_calc_affinity(int cpu)
+{
+    return (0xf << ARM_AFF1_SHIFT) | cpu;
+}
+
 static void aspeed_soc_ast2600_init(Object *obj)
 {
     AspeedSoCState *s = ASPEED_SOC(obj);
@@ -130,6 +140,13 @@ static void aspeed_soc_ast2600_init(Object *obj)
         object_initialize_child(obj, "cpu[*]", OBJECT(&s->cpu[i]),
                                 sizeof(s->cpu[i]), sc->cpu_type,
                                 &error_abort, NULL);
+        object_property_set_int(OBJECT(&s->cpu[i]), QEMU_PSCI_CONDUIT_SMC,
+                                "psci-conduit", &error_abort);
+        object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affinity(i),
+                                "mp-affinity", &error_abort);
+
+        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfrq",
+                                &error_abort);
     }
 
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
@@ -146,6 +163,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     sysbus_init_child_obj(obj, "a7mpcore", &s->a7mpcore,
                           sizeof(s->a7mpcore), TYPE_A15MPCORE_PRIV);
+    object_property_set_int(OBJECT(&s->a7mpcore),
+                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
+                            "num-irq", &error_abort);
 
     sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
                           TYPE_ASPEED_RTC);
@@ -230,16 +250,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
                           TYPE_SYSBUS_SDHCI);
 }
 
-/*
- * ASPEED ast2600 has 0xf as cluster ID
- *
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0388e/CIHEBGFG.html
- */
-static uint64_t aspeed_calc_affinity(int cpu)
-{
-    return (0xf << ARM_AFF1_SHIFT) | cpu;
-}
-
 static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 {
     int i;
@@ -264,19 +274,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     for (i = 0; i < s->num_cpus; i++) {
-        object_property_set_int(OBJECT(&s->cpu[i]), QEMU_PSCI_CONDUIT_SMC,
-                                "psci-conduit", &error_abort);
         if (s->num_cpus > 1) {
             object_property_set_int(OBJECT(&s->cpu[i]),
                                     ASPEED_A7MPCORE_ADDR,
                                     "reset-cbar", &error_abort);
         }
-        object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affinity(i),
-                                "mp-affinity", &error_abort);
-
-        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfrq",
-                                &error_abort);
-
         /*
          * TODO: the secondary CPUs are started and a boot helper
          * is needed when using -kernel
@@ -292,9 +294,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     /* A7MPCORE */
     object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cpu",
                             &error_abort);
-    object_property_set_int(OBJECT(&s->a7mpcore),
-                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
-                            "num-irq", &error_abort);
 
     object_property_set_bool(OBJECT(&s->a7mpcore), true, "realized",
                              &error_abort);
-- 
2.21.1

