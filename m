Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp2097232qvb;
        Mon, 12 Apr 2021 06:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypNBaNGGe9ziSVIujihX9HJyqy8t1bro6Ufp5HKWk/wM+H3fCZHLATus4+YEdAcoxbOcTK
X-Received: by 2002:a05:6e02:1488:: with SMTP id n8mr9241923ilk.158.1618235102888;
        Mon, 12 Apr 2021 06:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618235102; cv=none;
        d=google.com; s=arc-20160816;
        b=y6IQYkVk/OMcpqj6hl9UKGXFhiP5X7W9QNvTBUOIg2o+iF6Ovg0W1sM5ZVc1YwjX8f
         YshK7oeWcdIblDebh31cmQ9ozWlzmO/DHkj7iQCCVt2SMecFX/Gpbd+Ppc4fNML7JywL
         DaUspZ0u+1m5i48CfgJw84Ft8Fj3qfkmTTib6XFswY4XlD5x/1+AcA86M4bXAluGK1tk
         vXSldqc6ropTUJoBRQPkvfO5z3m+bMG/rrcLxSAncJAADRiKKj0Nxm5/SebHqFbQ2PjP
         3EB5ucrsQvT9zJfKwhP99eCv2iruaiJ/QMWEDUmRy2wF49dmm3oaSTgt660Tw3qRQvGa
         0SrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wq0OT0PY2a3GAqSAuPZbj6T1qul6+1IC1OKz3Ec1t68=;
        b=PXK8w1gIjsbzNYghMzRs9tIotY7SewZX9dDCHZ5VnxLLO+++IxvjA4fuzQ1XavjiTF
         B+Y+ITQB11AvfpY0PcRlzO/RODecpzuxu588HPvdLL74v0fv7s6xDg5MOQX21Mu8+1h6
         aSvUeCxk0YD2BEsYG8NJlYDq8mrgMHRB3H/MHtWq1NAa1y9rb95C7sRpvDrlywlH4dZq
         ieb/9rzMxKAoXrUfpt2kQkniCLMB/neUeWE2pfimQpgz2PaUIw8+vJxTn31fIdS4czfz
         DqOQuJLWNuyKAg9/+PD/QfaQUai9Dj7rMW/tyR0ueVRhs1qX34GdZSdqNIs2aNhVaMtc
         KpWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FdvJnUOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si12048157ill.119.2021.04.12.06.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 06:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FdvJnUOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVwsA-0006tR-8Q
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 09:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqc-0004MQ-8m
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 09:43:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqY-0003Np-S4
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 09:43:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id 12so13007494wrz.7
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wq0OT0PY2a3GAqSAuPZbj6T1qul6+1IC1OKz3Ec1t68=;
 b=FdvJnUOt41BmJASNa0XdL8SJcOdHPJwf0l96LYc/Y4/LP0w49SW+lSffJl2eyFIN+A
 DtmS/gx4DV3/Sl3u6qaBnmE6KQ/FsLUt5fSk1U68fFLPx6li8o+D8wPhDNT0XAjDav7b
 Gy5a8X2RURDh/ezoNBazYqyy+iWrO9wzmsvdI2ilqvulpXnJ+NUMjvQXXUdzKbptbFw7
 d4HDAT3nBQYdtO6WCWH6yLTIzMYBWADZhhP3aW80h14MFrIpAFVJ9HQ0dUTX43bJGNoF
 grZ5hRWNUjcW6vB3Uy4Eshq2sb7++iJfpZ6xHgNqhN3ShGGQ/nJ8656X+8JilneqGAOm
 U48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wq0OT0PY2a3GAqSAuPZbj6T1qul6+1IC1OKz3Ec1t68=;
 b=Y0WUnTRtElpm/Cn3lKcIokdmUruC0bPwZ+r9OEWJ9t4r6zLLmAbd0LE/qMdq3RM1KE
 8bq8kc60QC6hu1ULdrWtPWyJabA8fQve0ie+gqu/K4rRO9tRISln4PHco5Gp18sCS7oU
 bZlZkAjYl5qfDPJ6MldcWddlIAI49aNiqOgT7DKdfetSRNewrKNdZNI98XsX/NYHnsqB
 2Y3hdMsesC6v+qoUJ9gGXfUtXTywEro1KoMzoAlA452CoWUlJXpz/DP/e66jUkrr2hs/
 qtTF2kox4B7CrNjT8R05GrLXCQz30l86LM5sww14AKQdMJXzTJcJoCyRo5oAqBgcofkt
 h+BA==
X-Gm-Message-State: AOAM531GKMbBsIcvmaZXBCO21LL0V5Sy4HxyAses6E7qGxGMY9Xs8rzN
 3N5iY6bmPKn40tyK/uVjW+RCL4KCflJRNACj
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr31054900wry.232.1618235001546; 
 Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm19574680wrt.54.2021.04.12.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
Date: Mon, 12 Apr 2021 14:43:16 +0100
Message-Id: <20210412134317.12501-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
References: <20210412134317.12501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aj7Af9F1HG2s

On some boards, SCC config register CFG0 bit 0 controls whether
parts of the board memory map are remapped. Support this with:
 * a device property scc-cfg0 so the board can specify the
   initial value of the CFG0 register
 * an outbound GPIO line which tracks bit 0 and which the board
   can wire up to provide the remapping

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

