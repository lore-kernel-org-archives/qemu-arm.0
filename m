Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp649172ejb;
        Sun, 21 May 2023 05:33:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4d0Su2Bn67PIYpIiCu4NpuYX89G3rt1UqmruIbTFk4gdIFToyiFNgi8j0jv6q5RqfHza9V
X-Received: by 2002:ad4:5d4e:0:b0:621:83d:3a47 with SMTP id jk14-20020ad45d4e000000b00621083d3a47mr15125065qvb.39.1684672386556;
        Sun, 21 May 2023 05:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684672386; cv=none;
        d=google.com; s=arc-20160816;
        b=t3hAKqbYkse+OTjh9ceJPslXlSG8rY8nqwXChMPVcdWgSfiVpFUVgFL3T4JCa2LXn/
         lC5sWHfuN60U9K0BE142yaq5aAT5o7HKi1vyeXlfWPxLdKPWUk+9scc2T1QmMNFadXWK
         kDEzuFyqGw77/Nitqrpd7KHEpfSRSX+g3SVXtgp3FN+EiAQfX3kpapUjOspIydMr0SlB
         w+/vAvJZWiZhy+bMEUI4PDZliYfjGkQo97qvI33H01xDWE7vBNaR/lVWqYjzVQSLjO6n
         vHsyEYJfTJwE26d3rv6vjOBtKOtinq3f6Waui5vKHKcBvi+r2l5T+JQHZxtrawG7Tc8m
         g99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aCbv0UcSqF4ar26VgNDIWvOon/JFFKQ9y3nbL6W/zoY=;
        b=Mky6jbJ07UNxGr+/SJer/Gu4oMHPILL8gqXVghNSyAsW36oDS5IpCvJ5EBsB/4dmDo
         RKeh7Z5aSrmb3KqDRXY/uq6vWmlMZTOsSsC5QROiL9HhnUpZ8QUrVXTxtRP8EFHyVxAN
         oSRoAPBdrPSTVMCgNDqSq4Xpj5yt8XvS7FqwttChowlEMDQ7SbcR/4fvNXK/YYxgwTA0
         7Tcl+yDMCdbQipT1LqDSiYg6k64F1vPFV62csECRUacYW8gSb4CuKKcDqrIQfWRA43oI
         CIEtKrBF5kI79ZQWog4NSJ+905OYhbDxIHtWKY1Be4MLpFVWR9kJxPOfSFspJv2C2lcD
         TIVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=h9iVW4UM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020a0562141d2f00b006192eaa74cdsi2207571qvd.470.2023.05.21.05.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 05:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=h9iVW4UM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0iDS-00022B-5b; Sun, 21 May 2023 08:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q0iDP-0001ww-3j; Sun, 21 May 2023 08:31:11 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q0iDJ-0001l6-Dp; Sun, 21 May 2023 08:31:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso945924266b.0; 
 Sun, 21 May 2023 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684672262; x=1687264262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCbv0UcSqF4ar26VgNDIWvOon/JFFKQ9y3nbL6W/zoY=;
 b=h9iVW4UMjUWmN7BNg9jx1lZ4f8mkdovsMysXv3X3HhCgSNgFHiJ3Ek8SLUjugVVnDP
 1/0BT2xucjJhheaggwcgUzcTJNLB+yPOCTpXxaXC53eN4ePcfrcoC017YTjq/U5qh6/V
 tvyNysz9Wb1K3khVHdfE9hpFdptZrDmHW1lBUHpzOlUTJUFEuC6YDKhnjKHmD+o3zyWM
 0HiEvioXJ0EuUJ4a12jTZvMrkD8w7N4DCd4Yk+irWfGv0n3O9ydhRJ3sRfOIvYt1jm5t
 tzbhLcwEnMadvVAlrocbRx8EY/0hC23yodWDAVSKCBLyKOOdZIN8NJDrzdUC3Hco16B9
 FoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684672262; x=1687264262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCbv0UcSqF4ar26VgNDIWvOon/JFFKQ9y3nbL6W/zoY=;
 b=f/AwImU7qzn8N42dCSdWzTXCXHbBgt4xeU7qFRkvuPFBqqzoLTOMpQNvOGQ0Ogm1zJ
 H5NiJdPe661UvzYPA4gF8y3o/XgHg/bXTRrkRPDy8vJxZeI2tbNs63wh8RSUpKmXNIrd
 iBgb6vsNq1vj5et9apambAXddlYqrwMbQaM9Nwo0rjQ/v0kkMnAdfi8jVj2TIHcHXj2x
 IBfCh+gEvjhQBtubKWBoSPBeucAE/BioJi0Plzo8D1yNUusSAYaMuJgFycJ2YC6aDZkb
 /1L5m9ATPuXpykK6e6BJxIuc0GLEf7KR3prxsCPfm/nd3YAMnFHTt3Zt5ViVOUbe05Ix
 QC0Q==
X-Gm-Message-State: AC+VfDyT5gKMjKG0HNur8x5Jew1noRVolWE9xu+7f2F09Q6/rOwPRpkQ
 /J5T01mj8b4IFB/Q/xzcVQAlF69yHSM=
X-Received: by 2002:a17:907:9348:b0:94f:3980:bf91 with SMTP id
 bv8-20020a170907934800b0094f3980bf91mr7917315ejc.19.1684672262502; 
 Sun, 21 May 2023 05:31:02 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-145-122.77.191.pool.telefonica.de. [77.191.145.122])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170906729300b00965ec1faf27sm1882678ejl.74.2023.05.21.05.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 05:31:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 4/6] hw/char/parallel: Export ParallelState
Date: Sun, 21 May 2023 14:30:47 +0200
Message-Id: <20230521123049.312349-5-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230521123049.312349-1-shentey@gmail.com>
References: <20230521123049.312349-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: V3+pcd6PORvN

Exporting ParallelState is a precondition for exporing TYPE_ISA_PARALLEL.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/char/parallel.h | 44 ++++++++++++++++++++++++++++++++++++++
 hw/char/parallel.c         | 42 ------------------------------------
 2 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/include/hw/char/parallel.h b/include/hw/char/parallel.h
index 0a23c0f57e..2d4907c1fe 100644
--- a/include/hw/char/parallel.h
+++ b/include/hw/char/parallel.h
@@ -1,9 +1,53 @@
 #ifndef HW_PARALLEL_H
 #define HW_PARALLEL_H
 
+#include "exec/ioport.h"
+#include "exec/memory.h"
 #include "hw/isa/isa.h"
+#include "hw/irq.h"
+#include "chardev/char-fe.h"
 #include "chardev/char.h"
 
+/*
+ * These are the definitions for the Printer Status Register
+ */
+#define PARA_STS_BUSY   0x80    /* Busy complement */
+#define PARA_STS_ACK    0x40    /* Acknowledge */
+#define PARA_STS_PAPER  0x20    /* Out of paper */
+#define PARA_STS_ONLINE 0x10    /* Online */
+#define PARA_STS_ERROR  0x08    /* Error complement */
+#define PARA_STS_TMOUT  0x01    /* EPP timeout */
+
+/*
+ * These are the definitions for the Printer Control Register
+ */
+#define PARA_CTR_DIR    0x20    /* Direction (1=read, 0=write) */
+#define PARA_CTR_INTEN  0x10    /* IRQ Enable */
+#define PARA_CTR_SELECT 0x08    /* Select In complement */
+#define PARA_CTR_INIT   0x04    /* Initialize Printer complement */
+#define PARA_CTR_AUTOLF 0x02    /* Auto linefeed complement */
+#define PARA_CTR_STROBE 0x01    /* Strobe complement */
+
+#define PARA_CTR_SIGNAL (PARA_CTR_SELECT | PARA_CTR_INIT | PARA_CTR_AUTOLF \
+                         | PARA_CTR_STROBE)
+
+typedef struct ParallelState {
+    MemoryRegion iomem;
+    uint8_t dataw;
+    uint8_t datar;
+    uint8_t status;
+    uint8_t control;
+    qemu_irq irq;
+    int irq_pending;
+    CharBackend chr;
+    int hw_driver;
+    int epp_timeout;
+    uint32_t last_read_offset; /* For debugging */
+    /* Memory-mapped interface */
+    int it_shift;
+    PortioList portio_list;
+} ParallelState;
+
 void parallel_hds_isa_init(ISABus *bus, int n);
 
 bool parallel_mm_init(MemoryRegion *address_space,
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index af551e7864..522301f43a 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -27,10 +27,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "chardev/char-parallel.h"
-#include "chardev/char-fe.h"
 #include "hw/acpi/acpi_aml_interface.h"
-#include "hw/irq.h"
-#include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
@@ -54,45 +51,6 @@
 #define PARA_REG_EPP_ADDR 3
 #define PARA_REG_EPP_DATA 4
 
-/*
- * These are the definitions for the Printer Status Register
- */
-#define PARA_STS_BUSY   0x80    /* Busy complement */
-#define PARA_STS_ACK    0x40    /* Acknowledge */
-#define PARA_STS_PAPER  0x20    /* Out of paper */
-#define PARA_STS_ONLINE 0x10    /* Online */
-#define PARA_STS_ERROR  0x08    /* Error complement */
-#define PARA_STS_TMOUT  0x01    /* EPP timeout */
-
-/*
- * These are the definitions for the Printer Control Register
- */
-#define PARA_CTR_DIR    0x20    /* Direction (1=read, 0=write) */
-#define PARA_CTR_INTEN  0x10    /* IRQ Enable */
-#define PARA_CTR_SELECT 0x08    /* Select In complement */
-#define PARA_CTR_INIT   0x04    /* Initialize Printer complement */
-#define PARA_CTR_AUTOLF 0x02    /* Auto linefeed complement */
-#define PARA_CTR_STROBE 0x01    /* Strobe complement */
-
-#define PARA_CTR_SIGNAL (PARA_CTR_SELECT|PARA_CTR_INIT|PARA_CTR_AUTOLF|PARA_CTR_STROBE)
-
-typedef struct ParallelState {
-    MemoryRegion iomem;
-    uint8_t dataw;
-    uint8_t datar;
-    uint8_t status;
-    uint8_t control;
-    qemu_irq irq;
-    int irq_pending;
-    CharBackend chr;
-    int hw_driver;
-    int epp_timeout;
-    uint32_t last_read_offset; /* For debugging */
-    /* Memory-mapped interface */
-    int it_shift;
-    PortioList portio_list;
-} ParallelState;
-
 #define TYPE_ISA_PARALLEL "isa-parallel"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAParallelState, ISA_PARALLEL)
 
-- 
2.40.1

