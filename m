Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3554074lfg;
        Tue, 4 May 2021 05:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEeHIukdXFJXNXNWicUyE5BzKc9WtIRA1zwUgJ1+DAJF8heQQX6A6WqxpIB7D0SDxonnhR
X-Received: by 2002:aa7:d507:: with SMTP id y7mr17743040edq.198.1620130388572;
        Tue, 04 May 2021 05:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620130388; cv=none;
        d=google.com; s=arc-20160816;
        b=m2HNM2glYBbT9ARWf7kEPR48OGE5W4oilmakEP6L9k2miyh61Ffj8Vvms7b9p6O779
         tWj5F/2JqOpCXHRuOSfKjzpygkwH23vqDIzLGtMuRKtjw9UPGBCbxIMFAyeHdDncYDeX
         efiivVrxd9aaXXXYLqvFPDPMBUOmUzws/oynkgb+RzLsvzn8N3EyEfb7NI4iDAmnVt5M
         CZUkktt1zvsFIfxJFUdLEJ+/xbvKQH0H75R8bWLcC8YxwBo+CbCKqeG6JP0+q/JuLwiU
         3Ri/zN9RK+ovDpQd3LYS5MATw+fb6RYr29lp+RraFQrah1lU77klLG9NDic8g8ZI6OG7
         6azA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KuiIpEF0YJllksN7WscZeUdPX+/jT9Kso4l8u6ZSxUM=;
        b=c8aVDoKNC01CJjtuszmpwAN1krD+4o8XWhcexZzIx1V2bd9rSaQOsLKTbbzux1eUXC
         YMamhPtAA38k0HCivm+R+2o5ypK+oucYo1C+dT5gmshjnhMmnP4Zv7P1brRVxJpVBJBt
         BzIUo2kSxtGAWxNoTjawB1UflV4lIEuGYRXraMnqmN9p+f4VBju1l7j/10J6zi60fJI4
         t/gz/7MxAUbB+jwW20spAiuNIXu9GK7omYNo69pXCM0vBRTtyLV5Eo+y6f0IXTRW6ugY
         dYjYag7v6tADYOwYqYp7nxPvATtVvIFyZImhXO53cit3KjRiMa79rpvY+w7WFUkDfIQN
         +4fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s3hoVzHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24si12827656edx.325.2021.05.04.05.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 05:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s3hoVzHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldtvH-00071X-Ip
	for alex.bennee@linaro.org; Tue, 04 May 2021 08:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtrd-0005g8-PR
 for qemu-arm@nongnu.org; Tue, 04 May 2021 08:09:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtra-0007aR-W7
 for qemu-arm@nongnu.org; Tue, 04 May 2021 08:09:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so9134468wrw.10
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuiIpEF0YJllksN7WscZeUdPX+/jT9Kso4l8u6ZSxUM=;
 b=s3hoVzHddgKpKV+oQPoR/xnIkJ2iFugm/Wnd4yaoEiaWvpu0ug9Yz9/zGpPmG8h576
 /gOYhKvzR+bID2qduYICF8NjUN5mA6KCn+KZJtC7s0UaRIMEnZamg4Ww+cFJLV95eDbl
 IpyNghBuawtVeLcWmuEbH61rD8yDJDZFPBJTkpeEd3QPQB70IEdoqB4AN/v9bU/yzftU
 JJpq71bAt1PXcyzw686AE8AlWuw+tSADLJb11YtnU4o7y1W9i1HeWsbkzt+tuUgOPXmP
 oLJtjsdJ/a7DXwMybctH+yXgvJ+T5Mw1ZRfDqcLZKyWAio9S65humGK0iBbhZdNCWqsQ
 y/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuiIpEF0YJllksN7WscZeUdPX+/jT9Kso4l8u6ZSxUM=;
 b=hd7LBT1ODi7nvsVzIpk8nkPNKZ/7TMB+8H2qvl6IWswcNYrds4Ksn4rOJ3C8rVuRRo
 ir47NFFHiJSFZDTESFQO1XcriVOzu+FgYAA1BibaJVQW5DiUD0FyT9uzyPlRo4bA2w9I
 62IRp1glJ7NnXzy/8G8ezpVLoVoKlmsotOclZTXlz4qafDFfITauoW2n11OGzg+zNcfQ
 q3D6rsduqj8ZG7ndfsFMnL2yVtcB72jdlMhQ1gLQUcMyrYuS8TEsusl3OOOHgM8gjthR
 hTWbqZUGBCI3+vWevTsR0OKBx9E4G7Ecj6YikQvp/EoCjryfYP9ie+eSvuUEMXwy4AfQ
 aJtw==
X-Gm-Message-State: AOAM533+sljza3L2l83pD3qS2ESEuBxIZDJEmYl0vZ0wvoM7bszM+78O
 4g3PHda9IzfvYyabxPxreCv1v/VJgYXNXg==
X-Received: by 2002:adf:ec4a:: with SMTP id w10mr598958wrn.388.1620130156450; 
 Tue, 04 May 2021 05:09:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g12sm2331937wmh.24.2021.05.04.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:09:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/misc/mps2-scc: Support using CFG0 bit 0 for
 remapping
Date: Tue,  4 May 2021 13:09:11 +0100
Message-Id: <20210504120912.23094-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504120912.23094-1-peter.maydell@linaro.org>
References: <20210504120912.23094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IOfcbvvl6z5R

On some boards, SCC config register CFG0 bit 0 controls whether
parts of the board memory map are remapped. Support this with:
 * a device property scc-cfg0 so the board can specify the
   initial value of the CFG0 register
 * an outbound GPIO line which tracks bit 0 and which the board
   can wire up to provide the remapping

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/mps2-scc.h |  9 +++++++++
 hw/misc/mps2-scc.c         | 13 ++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index ea261ea30d6..3b2d13ac9c3 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -18,8 +18,14 @@
  *  + QOM property "scc-cfg4": value of the read-only CFG4 register
  *  + QOM property "scc-aid": value of the read-only SCC_AID register
  *  + QOM property "scc-id": value of the read-only SCC_ID register
+ *  + QOM property "scc-cfg0": reset value of the CFG0 register
  *  + QOM property array "oscclk": reset values of the OSCCLK registers
  *    (which are accessed via the SYS_CFG channel provided by this device)
+ *  + named GPIO output "remap": this tracks the value of CFG0 register
+ *    bit 0. Boards where this bit controls memory remapping should
+ *    connect this GPIO line to a function performing that mapping.
+ *    Boards where bit 0 has no special function should leave the GPIO
+ *    output disconnected.
  */
 #ifndef MPS2_SCC_H
 #define MPS2_SCC_H
@@ -55,6 +61,9 @@ struct MPS2SCC {
     uint32_t num_oscclk;
     uint32_t *oscclk;
     uint32_t *oscclk_reset;
+    uint32_t cfg0_reset;
+
+    qemu_irq remap;
 };
 
 #endif
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index c56aca86ad5..b3b42a792cd 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -23,6 +23,7 @@
 #include "qemu/bitops.h"
 #include "trace.h"
 #include "hw/sysbus.h"
+#include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "hw/registerfields.h"
 #include "hw/misc/mps2-scc.h"
@@ -186,10 +187,13 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
     switch (offset) {
     case A_CFG0:
         /*
-         * TODO on some boards bit 0 controls RAM remapping;
-         * on others bit 1 is CPU_WAIT.
+         * On some boards bit 0 controls board-specific remapping;
+         * we always reflect bit 0 in the 'remap' GPIO output line,
+         * and let the board wire it up or not as it chooses.
+         * TODO on some boards bit 1 is CPU_WAIT.
          */
         s->cfg0 = value;
+        qemu_set_irq(s->remap, s->cfg0 & 1);
         break;
     case A_CFG1:
         s->cfg1 = value;
@@ -283,7 +287,7 @@ static void mps2_scc_reset(DeviceState *dev)
     int i;
 
     trace_mps2_scc_reset();
-    s->cfg0 = 0;
+    s->cfg0 = s->cfg0_reset;
     s->cfg1 = 0;
     s->cfg2 = 0;
     s->cfg5 = 0;
@@ -308,6 +312,7 @@ static void mps2_scc_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &mps2_scc_ops, s, "mps2-scc", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->remap, "remap", 1);
 }
 
 static void mps2_scc_realize(DeviceState *dev, Error **errp)
@@ -353,6 +358,8 @@ static Property mps2_scc_properties[] = {
     DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, cfg4, 0),
     DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
     DEFINE_PROP_UINT32("scc-id", MPS2SCC, id, 0),
+    /* Reset value for CFG0 register */
+    DEFINE_PROP_UINT32("scc-cfg0", MPS2SCC, cfg0_reset, 0),
     /*
      * These are the initial settings for the source clocks on the board.
      * In hardware they can be configured via a config file read by the
-- 
2.20.1

