Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1522758lfm;
        Thu, 9 Jul 2020 08:23:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOIsggXlea6QJvVgOLp+ipZ+5m65m7bU1UuD/qMot7+boFwZVrVaKdn44JCWXsaCH3A1Jk
X-Received: by 2002:a25:b4e:: with SMTP id 75mr96700361ybl.198.1594308235609;
        Thu, 09 Jul 2020 08:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594308235; cv=none;
        d=google.com; s=arc-20160816;
        b=q6XAASEm67mhMuRY6U56AKzSEfwNEC7SI6LURd9rVs0q5gBm7/4rSMrQxd5CBqVX+y
         hGO4eN71qUfMURxj9N6MbgzgVMtD0dQHVGBSkvzZ8fnE0YGaOzhW2mw49whhHA+UTunr
         AtchavJ9ZcQceQtYvp99pj6tPXArM4sUbIgWvurh1eRViSSjxiDR/u5TCV1Y+K5tJznG
         PEjIdI3EYzda7czEDglk4rZ9OCwzBrnTQ/tsqkMe06AT5weDa2drKmiiV/pPnXH0HPwO
         VlwldU7uFNV2Yr9QlnXBLyBl7y4yjF/ghJXhozRO+ktPybL+D3x1RGuDXC4N3WPz+rla
         mztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LuF+C5cF6VHL6bfWO5MRQe0ZzHmgVYS8GhF2dPRIe7U=;
        b=NAs1Scxg5teCRyCXQe05v6W4LF72ZSZsConBXx+BdsPoToRkfKJRRNV58GSrbAKMjM
         Zq7r1L7bKL7I/6f8jcLaLZNUIWOHxTdvPcKQXtOQf3Q4/Eol+3DyeIZaKDG5d4qgioP/
         Q+imMv0/TjDAXzlYPJVphIiAAAH0KeVHQgZQqjk79YQzMpsmXGNcybm25lyyVHocmxpe
         6iV7MLmqz48bMpZUBXjOgdcA28n2Xu7biaVztXau2Gnt+8McO9SWlJhNpk8KqtFtrONg
         3F74vUW5N4xRjYq2mvKpfEV+v4dAZGHWWdGWId1TfR7LxiFhUfTnzleUNz0clNZlF/cu
         ugAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IFqJzO0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k128si2995190ybk.28.2020.07.09.08.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 08:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IFqJzO0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtYOx-0005YP-1m
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 11:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtYOo-0005Xx-0D; Thu, 09 Jul 2020 11:23:46 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtYOk-0001lj-EW; Thu, 09 Jul 2020 11:23:45 -0400
Received: by mail-wm1-x344.google.com with SMTP id j18so2282316wmi.3;
 Thu, 09 Jul 2020 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuF+C5cF6VHL6bfWO5MRQe0ZzHmgVYS8GhF2dPRIe7U=;
 b=IFqJzO0HnKTV+DVqaOT0KJfYC3VhRP1cbAcAnD8ZqLnKPcLgX98N0s8gmNroI2Kd19
 hc1fkgGHqjedDb9+XCGZcxR+7PRN1u+BJYGY1CMED2uoswIdKFB6Yk1U7XBhoHyRnEhG
 UTcRe7cyvgwdCrqVLNEmTnrClzXOBvgND4s5K4qxqY/ykYEBDA42kOWYhjT6WjAU2h2F
 OfP/modk818kP5yW5novwbbe9bXSE/pzX6E8H4OvWYgA9f0c/gN7RJuiYzCyLh3CABg3
 1o4OYtk8u3380nh//LaqsABLrgNunDBisyw9+6ttA+DDTihHZdJ7VRQYidrL4vHuqTGo
 QDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LuF+C5cF6VHL6bfWO5MRQe0ZzHmgVYS8GhF2dPRIe7U=;
 b=aUrOvYKKIRiUUf3KFDfX6Wg1yZrIfzLK7cobeaZO79DVtGL+7EEUSbVp7/4eDmulHS
 p+SJi2PNyfG9TQ1SsE9UAdYbRSLUXlnwwC/k2WKr2bdmuTuf9TIbbHP8aUcIBZAGDrNw
 Ftb+v2oQs5hQHuzJXAVIoEHxlvofDe8wY9CBMsbPX3iM0w9zhasKFIV9Bix5hkvfONO0
 OTbCNSpeWM9/DzAsLZgd4XVuBwxeD+RzZtrGnPFM9RFS75EIfsxeDggcjdoRz8q48Wgm
 P1qf3mSr43EwnLwazIWpDr0oZXeelAZ6XEcHnlYM5y/DnrDmtT/dt4wjeAmTJWAjBMt8
 F7CA==
X-Gm-Message-State: AOAM532mUC6WE1g4lBtjMXRwlA3RAD4sTmAt9HhI8U+vL/WvbuVjZw2g
 to/WeDw4h/rhe6iQF1i6e6mwYdNeXDo=
X-Received: by 2002:a1c:5646:: with SMTP id k67mr549252wmb.61.1594308219580;
 Thu, 09 Jul 2020 08:23:39 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 1sm4916107wmf.0.2020.07.09.08.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 08:23:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/cpu/a9mpcore: Verify the machine use Cortex-A9 cores
Date: Thu,  9 Jul 2020 17:23:37 +0200
Message-Id: <20200709152337.15533-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Randy Yates <yates@ieee.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jLLqfWXzbkey

The 'Cortex-A9MPCore internal peripheral' block can only be
used with Cortex A5 and A9 cores. As we don't model the A5
yet, simply check the machine cpu core is a Cortex A9. If
not return an error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/cpu/a9mpcore.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 642363d2f4..1724baf17c 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -15,6 +15,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
+#include "cpu.h"
 
 #define A9_GIC_NUM_PRIORITY_BITS    5
 
@@ -53,8 +54,18 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     int i;
     bool has_el3;
+    CPUState *cpu0;
     Object *cpuobj;
 
+    cpu0 = qemu_get_cpu(0);
+    cpuobj = OBJECT(cpu0);
+    if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
+        /* We might allow Cortex-A5 once we model it */
+        error_setg(errp,
+                   "Cortex-A9MPCore peripheral can only use Cortex-A9 CPU");
+        return;
+    }
+
     scudev = DEVICE(&s->scu);
     qdev_prop_set_uint32(scudev, "num-cpu", s->num_cpu);
     sysbus_realize(SYS_BUS_DEVICE(&s->scu), &err);
@@ -73,7 +84,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     /* Make the GIC's TZ support match the CPUs. We assume that
      * either all the CPUs have TZ, or none do.
      */
-    cpuobj = OBJECT(qemu_get_cpu(0));
     has_el3 = object_property_find(cpuobj, "has_el3", NULL) &&
         object_property_get_bool(cpuobj, "has_el3", &error_abort);
     qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
-- 
2.21.3

