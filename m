Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp818391lfp;
        Wed, 5 Feb 2020 17:27:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMLi6y0sn6guUlmxUxQsqUxKi1ITLD13i7Vb1iqxpA/s8B9Z6ZABSJAfQweP7BE9v407pN
X-Received: by 2002:a05:620a:1289:: with SMTP id w9mr502112qki.290.1580952476660;
        Wed, 05 Feb 2020 17:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952476; cv=none;
        d=google.com; s=arc-20160816;
        b=GrZdefqd418kFxieCCaywFEOPTkQ1Og+WO8U2jrQ9Ap7VoWboQcCdOvom7MOaFbrbg
         78JcCZVDeCnQwwvlySAc767aVfxB1VlHu/SjhyqkkZMvBwYeOB8i7Un4OSlrV8qIUTei
         W5kuVHOPJ5V+czHqkj1D1cExFDyIV7wYXVRypnJ+LGG11YfxWP9R8E9jzHnDFdqqwRiJ
         +zhM7MRBY43ax2d1+fh7aMEeTngwdT7bRlVXFAf+5cvOczNRqxpH8V4yY19EE3+yd6PL
         dCCm6HWsCIMqfWe278Y+LAnhKDuGY5PafUIyrhoeFTZgVctKHt0tKbPO09yF6r4xeftU
         X3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i66d8bTofo8A1vTFZIP/v8pdqf575/6M5yHqFaN2D1Y=;
        b=t9ZpwpJrIFavqkZDzVvbXU/69SNYn0uUPeik0mDBLJmmRK9D3tavniAVaYnDwflPJw
         BFGfNow/ouYhMg+hzZ9zFZTOqOX2XbF5zjsZsMRTiRci8DETO5sIgrSudzTkEwE+vJsU
         Nrw7dSbsLGqtQEbGo5HD98FF5PMb+mfDLt6ul39mMKqHRx9Y/lZh2zKqvW5FvjnQYUKj
         ZUnjgrDczo927wQeqnKp12r6R6F1wJz9QGb4mu5WlvD2dx1RB3MfwQT7tHuQTB/kVLDf
         LVWkQQ2MX3VLS/x1YOKJklVYORs/PcYsDspA+SuBgZ4CST015Fs5UC5+UMKupdQOr6Eu
         Bjog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o3C2cGTU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si736815qtp.211.2020.02.05.17.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o3C2cGTU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVxU-0004ke-1k
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoW-0000vY-Cf
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoR-0003TU-8D
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:37 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoR-0003Nb-0z; Wed, 05 Feb 2020 20:18:35 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so5156362wrr.1;
 Wed, 05 Feb 2020 17:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i66d8bTofo8A1vTFZIP/v8pdqf575/6M5yHqFaN2D1Y=;
 b=o3C2cGTU1Kc9KzWq9T8GNuM1518PtaEFDbrys/Dop5pX8DY52dxFn+AtjlyHn8vQJH
 nPanDxZUAq2OFb03WBL3sQyPJcJDAXG3NcUzEN2Jgw158IvX5g3tRHndb7g6tfbqnYA/
 00NCxaoH+x4UntWJxbBVujLBOVAyRvT8vgKgVxt0wKsI9pZOY+El41fL7Q4xIeXf8k6m
 jYiJFMrNRC1RI87hui04tmktyyjqv79fZNJWaaG4cIIfLJqp2xtuKMQ8qOl9DLoEu9Am
 hNWnHuOBefwdP2k/2HtrzkFlFvhpXCmL8o7IfT9DjaRYvewobzzgcJ1+XCX+e+JzKhy8
 971g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i66d8bTofo8A1vTFZIP/v8pdqf575/6M5yHqFaN2D1Y=;
 b=EFwG5FFo26RmfVMv454ZmLa/eESBd7ixqS4j5KZuoAuKYcBcH717ZlUc1tXVoDolsg
 CqrGGoCjyIfg2zOxxsoGV90zsyRiA4V+Tiara9ymt9p7vVYnwBPBenCjLF+oO/QDS3Qv
 PB4fp3YB9vpc6hON3aVjHKH445uiJBp4CYKGeYmqjJQ0DGyVyEBQz5OSBLibv6V0Rp/d
 BybSlNJ/dMW44LlNztFqs9chplTLnGRnXU84Ifq8x4qVbVvy/vxQZLjYX14Vuuf+T9UC
 Z01Dx3SRle93kuEi3rNuxcSUvwp1jvqbmtk/2qsG4CVv0e+NmSsD7q+Lqoo7mRPe3NPA
 nSTw==
X-Gm-Message-State: APjAAAUcaS3rKkCsTlRGrz6ikXxgLI+mZqEx559SlRz+W/DHzCTWgoSi
 Do0nAoav+iC+doPad6tnAjOioxVj
X-Received: by 2002:adf:f10b:: with SMTP id r11mr317923wro.307.1580951913884; 
 Wed, 05 Feb 2020 17:18:33 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/30] hw/arm/bcm2836: Introduce BCM283XClass::core_count
Date: Thu,  6 Feb 2020 02:17:42 +0100
Message-Id: <20200206011756.2413-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pBMlTvAu1ryi

The BCM2835 has only one core. Introduce the core_count field to
be able to use values different than BCM283X_NCPUS (4).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 683d04d6ea..3b95ad11e9 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -21,6 +21,7 @@ typedef struct BCM283XClass {
     DeviceClass parent_class;
     /*< public >*/
     const char *cpu_type;
+    int core_count;
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
@@ -37,7 +38,7 @@ static void bcm2836_init(Object *obj)
     BCM283XClass *bc = BCM283X_GET_CLASS(obj);
     int n;
 
-    for (n = 0; n < BCM283X_NCPUS; n++) {
+    for (n = 0; n < bc->core_count; n++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
                                 sizeof(s->cpu[n].core), bc->cpu_type,
                                 &error_abort, NULL);
@@ -107,7 +108,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
 
-    for (n = 0; n < BCM283X_NCPUS; n++) {
+    for (n = 0; n < bc->core_count; n++) {
         /* TODO: this should be converted to a property of ARM_CPU */
         s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
@@ -173,6 +174,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0xf;
@@ -187,6 +189,7 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0x0;
-- 
2.21.1

