Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8310218ejb;
        Wed, 4 Jan 2023 14:08:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2K46CrtiH6Zp2sb4BHzDUFy9ZfopH4Wrf1F/k09PZY+3A40T1xnkSS2dwVe8BXdjJtoP8
X-Received: by 2002:a67:ed83:0:b0:3c8:9c1:f486 with SMTP id d3-20020a67ed83000000b003c809c1f486mr15062370vsp.13.1672870115905;
        Wed, 04 Jan 2023 14:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672870115; cv=none;
        d=google.com; s=arc-20160816;
        b=FJpkVLaPYANI0Ue1hKjnVWKJ7K32jNc7OgcnF0ncPGQFrUNSs1rEA/BVy4QSMAfJfR
         +vm+ukXJrPhHtd3ghYhDSJKsHrcWPQnAwrQBDIPhMIl7O75j+zd933EqJ4xm+YCDGuEh
         h6Wus5RYEaocartU0f4Op7e6DnB5g8j/jZPTAw0/SRpFnN8AlZ63AknvHLby5dO6HM/g
         c8OfAyq1K1jHNcRZADYTjIeXUzLaB0FgnQG6vMVcP97MVENx5uxD91CqXjaasAZ541sl
         WEDxQ9IMLNCjq6fOZf2CD8Cn88ObGoVWarMpETnIIInrg27NGZq9Vf0oH3E/alA4JTtN
         1FRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4Yfck/dkEQ1qiQRqZ2doov1ZobzOuy108Vmk2yEOlvU=;
        b=fbBKRfGK0zGbvFoFNQv/dsfXgMM8y8bK29rst+zNi8vMqR1reqkVs2jmy+4j9LcJip
         FJ+ywvGo3JDFKSvFHW8IoL/ihajUSXE/ErNttmJsOo6bzCpxOqj9fbO7Uy8AmfytvOF7
         Ice7lvvjYJztrAGOqsIEJXxPeHp2V3bvBjaPbNdB1UzCny2x5RbyONuYh5eEQZXi+Clv
         RwRTPrFU30qEYGQaqjS+fzt0GPDKtDP28WbgDkQaDb5txcAMVd4Q2UhFSZLlaYTA+naH
         oyIe+kQNkHG3xcbXWTqyjHf/UPNDbUlWO4+xvnK8fzJaDz5OVnFX0a+5sN+SFB9HmPmK
         59Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2p5k6oB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26-20020a05620a041a00b006fed77c3d17si17701046qkp.381.2023.01.04.14.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:08:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2p5k6oB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDBtE-0000Mk-GO; Wed, 04 Jan 2023 17:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtC-0000Hg-N8
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:05:38 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtA-0004zc-Mg
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:05:38 -0500
Received: by mail-ej1-x632.google.com with SMTP id qk9so85778602ejc.3
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Yfck/dkEQ1qiQRqZ2doov1ZobzOuy108Vmk2yEOlvU=;
 b=a2p5k6oBfHIIcb9Uw1m2zAqimXZm+gdGar5jbK8cQ26Amd7fVl7cxi0GM0EIfzCWnd
 2AGsY7wwodH2MSr4W0+FfmwTZmKjU3yfjK6bcczpgCG3Pyp99DRqAT7xiZKIy6wsdhNJ
 nQ23jF+yj00wW66C/4odJ9g8tq8mySZ/lY0Hxxb+vNkz21NA7pCuwoYFqWfygeyRrpec
 WDCntx851w9pjiA1kKdSmZZFd6M/1VXeUafv7g6C7sTQAePzQ4jbukY5tAOy9Ptdadz7
 S6xvuwTIosDwQp9hdJip2cOj4nGKOKLZqCDH0xsW/QiDCxvWJeNvU+svZhCVs2gXZUeb
 y9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Yfck/dkEQ1qiQRqZ2doov1ZobzOuy108Vmk2yEOlvU=;
 b=BeXMLoCJQOiKW7UPG0XSUGzy4fnO2rlTCEnkiGWGISnBqCT0ZNay3Rj9uaNYhy/Pn6
 PA+DzEkLqdOcTEgxg6k3r8XD6HXPieCsGFvGbgdLzvfSCc6dyRXaBvU+sqAQ92xnVPDF
 efiNKc//4uTCZ09xiB5I9YGmlJW8sz3uNS7VOBNW64HhzV7Aj7qziQXpEpL8bdQ/xts8
 HCiAtGlf0WtPBWyo/bkh2sYicBiARaPquguonb57QO+wCUVY9UIFLyG7pPRWuJGePhPv
 /Scc5L9pKZBKs70XflQ+lBUl6aS+8nxYa2BS8mZiNzTmxIYfMJ6qA6FpQHMkqE5lImhu
 fTpA==
X-Gm-Message-State: AFqh2kpEaiddes9sLqli2GEtUQFdsN552J68lGgUVvyVqIGe05D3yyf3
 QOumGrBNrtD3REUQLg/ZsPseTA==
X-Received: by 2002:a17:907:76cc:b0:842:cd68:4943 with SMTP id
 kf12-20020a17090776cc00b00842cd684943mr43315948ejc.11.1672869935936; 
 Wed, 04 Jan 2023 14:05:35 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ue3-20020a170907c68300b0084c7f96d023sm9207905ejc.147.2023.01.04.14.05.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 05/20] hw/loongarch: Use generic DeviceState instead of
 PFlashCFI01
Date: Wed,  4 Jan 2023 23:04:34 +0100
Message-Id: <20230104220449.41337-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: Mi8bfSPnoUat

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/loongarch/virt.c         | 9 ++++-----
 include/hw/loongarch/virt.h | 3 +--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index c8a495ea30..cd5aa26f49 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -45,7 +45,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/block/flash.h"
 
-static void virt_flash_create(LoongArchMachineState *lams)
+static DeviceState *virt_flash_create(LoongArchMachineState *lams)
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
 
@@ -62,14 +62,13 @@ static void virt_flash_create(LoongArchMachineState *lams)
     object_property_add_alias(OBJECT(lams), "pflash",
                               OBJECT(dev), "drive");
 
-    lams->flash = PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void virt_flash_map(LoongArchMachineState *lams,
                            MemoryRegion *sysmem)
 {
-    PFlashCFI01 *flash = lams->flash;
-    DeviceState *dev = DEVICE(flash);
+    DeviceState *dev = lams->flash;
     hwaddr base = VIRT_FLASH_BASE;
     hwaddr size = VIRT_FLASH_SIZE;
 
@@ -899,7 +898,7 @@ static void loongarch_machine_initfn(Object *obj)
     lams->acpi = ON_OFF_AUTO_AUTO;
     lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
-    virt_flash_create(lams);
+    lams->flash = virt_flash_create(lams);
 }
 
 static bool memhp_type_supported(DeviceState *dev)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index f5f818894e..519b25c722 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,7 +12,6 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
-#include "hw/block/flash.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -52,7 +51,7 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
-    PFlashCFI01  *flash;
+    DeviceState  *flash;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.38.1

