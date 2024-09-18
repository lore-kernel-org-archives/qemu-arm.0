Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp978014njg;
        Wed, 18 Sep 2024 12:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUttiEpj3yuZKSmVP3n3hYCndTVz9Q/Ic9PmB4VDjSiGVIVTG09h6GMzpUmN6Owca9Lite8GdoxYCYk6g==@linaro.org
X-Google-Smtp-Source: AGHT+IEhAcfitiBu1bQDLHKGFjYr4g/V8/0VGCzn1vx/gJFbNRum2Blo4Ztnx/T/Wja8Ks1fV9OK
X-Received: by 2002:a0c:fd43:0:b0:6c5:ba8f:a964 with SMTP id 6a1803df08f44-6c5ba8fb226mr49395306d6.10.1726687431853;
        Wed, 18 Sep 2024 12:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687431; cv=none;
        d=google.com; s=arc-20240605;
        b=fKSRO7FAxrw2FR47xOl9U7DF8FvtURqHxS1+dSTGn/kPId4LRCDtnVTfbxKfakZ8Sb
         bcfK+Nyu+t21gCMFwSSC1BEevcpSKExQjEZJVKaBxUtgiWGsMNJsr1gjbDZeXGAvqv4z
         fn3Y2GJtJh1eQ2ZKqvaI3HHPIx1VhVaotE6eEjHrpHrlqlFJWAPK9s9VuH7pHOQNza3K
         zPoi+FBG4tRIbrJqqHb1nN05xwH53NMpvWGFORwysBRfv5EMeTbo4svZAIP1Xe7MbVmx
         GnXP6oqa35QV9yvFzG5xvZMKPq5XFKCNoJsKBkBdDUtmw+USggc9bCxoXnoJP3y7GIgv
         USMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=N0mLLGE0rv2nvuRlLPnX33wbjS5E+YrP6ov3cBLBWZc=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Rlp9atn+X6u91e+uaaQ2FAL2UO+VoZO1rkOdJDOSaBdDynluyxW64fcEgsngwec3eu
         ieQeFxpFKdkmk5fxD9nBCUxHynV2RibrgjkChmDh6s/HpV271IqFVqjjwOKj+vU2oHLT
         gm7ixVY8K20Ui1mWOnG36PklY7nf2HBRLwxQukmkwyv6vEkkqcp91qoYPFnc2qxrOlSW
         UoL0iyde7IrO/Gg++Siy/nLdVAgT1WQQzIYOQYG0R9Orz5Ts5A8q29SLyRMopCapc0q1
         2Pk6nlWW7g2ppW2WvR674zWJ8vb3HYmSOQn7H9EtUg36IRacnZtPtQ0w8KEoABhjX1Wa
         QrPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0m+g1g3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e56184csi982206d6.229.2024.09.18.12.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0m+g1g3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gp-0004vg-IM; Wed, 18 Sep 2024 15:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3myjrZgUKCNYL2NAH8GG8D6.4GEI6EM-2JEFGF8FM.GJ8@flex--tavip.bounces.google.com>)
 id 1sr0Gd-0004WU-N6
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:13 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3myjrZgUKCNYL2NAH8GG8D6.4GEI6EM-2JEFGF8FM.GJ8@flex--tavip.bounces.google.com>)
 id 1sr0Gb-0007Jg-A3
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:10 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6dbbeee08f0so19447187b3.0
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687387; x=1727292187; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=N0mLLGE0rv2nvuRlLPnX33wbjS5E+YrP6ov3cBLBWZc=;
 b=0m+g1g3jS+XnaulJIfhooxcEi94bm0jRNye9SD9g3hETthWoMs3Xmb+TVliqNgO1VE
 awH76I4FRzZSCRsIhMgiUwXZImCAAJ9OobDk1fejXygKdkl88P20KydInRR84KNuLV6y
 Jrqerd0+4DIyAAvAbATQx2O0xu3UwE4z1hacaNq4Tw44FcRUHcx7VDDCzmmSTX/zKgrI
 LZGk4DlSjfVicRyYkMUWtru0K5swlvxl7nWX5JdPYZ26c1EZY+FKjpHc4FEEGQ/COQYS
 4VTS3Ktb0WcptV6IlT6nBAEvEjpN7+3ba9JpxQxAyePyglKjzFae6Xg/ha5dcmvfJEOq
 xibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687387; x=1727292187;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0mLLGE0rv2nvuRlLPnX33wbjS5E+YrP6ov3cBLBWZc=;
 b=BAfen+jzVc3IsSFiyoil2kuplfZrP6Qc0oM7JjHZIk47xGgUpgQFavPT0Qa/BisljA
 A3l+mPuZm7IQjPTauKxcGnYJnzetRfvbuY+Msg8n+H6vuPsAXwvY7Jhu9DxJgStUzKaR
 hBlAzf4ljSwiK5sFRnbvYo0FLebgOg81Q4JbAu9dlf4qvNwAGC7eNIDenER5QrbBHqUO
 19W0q4OFTd09KMGrO1AjDzwDGSkObUTzCSI4W7cfWVv2xNddi0WoycrBQn1Kothax5Bf
 fVt15tJBlJVX2J+uH30St5Jwu28VtQFpFTj1ml4B1I6dNj0/ww1Lc9L8D3Z6KbcldU8S
 xqTQ==
X-Gm-Message-State: AOJu0Yz87uKMXWJcBdMkxbSEEELXoUv7jaPUajFIonvCGnYSQCuV/ZIN
 DMpRGBsUnPmCzCyfAHaNAD51ZOdL5LBwBxGmUBGiokGuV7HEfMClmceO3QBeksrJ1tC+x0KopA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:b0a:b0:e1a:a30e:3393
 with SMTP id
 3f1490d57ef6-e202732b68fmr4158276.0.1726687387063; Wed, 18 Sep 2024 12:23:07
 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:34 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-7-tavip@google.com>
Subject: [PATCH 06/25] hw/misc/flexcomm.c: add common fifo functionality
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3myjrZgUKCNYL2NAH8GG8D6.4GEI6EM-2JEFGF8FM.GJ8@flex--tavip.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: XwmqK5fEorvz

FLEXCOMM SPI and USART share FIFO functionality. Add common helper
functions to avoid code duplication.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/misc/flexcomm.h          |  2 +
 include/hw/misc/flexcomm_function.h |  8 +++
 hw/misc/flexcomm.c                  | 83 +++++++++++++++++++++++++++++
 hw/misc/trace-events                |  1 +
 4 files changed, 94 insertions(+)

diff --git a/include/hw/misc/flexcomm.h b/include/hw/misc/flexcomm.h
index ea0fe77f26..832d4cd29d 100644
--- a/include/hw/misc/flexcomm.h
+++ b/include/hw/misc/flexcomm.h
@@ -44,6 +44,8 @@ struct FlexcommState {
     uint32_t functions;
     qemu_irq irq;
     bool irq_state;
+    Fifo32 rx_fifo;
+    Fifo32 tx_fifo;
 };
 
 #endif /* HW_FLEXCOMM_H */
diff --git a/include/hw/misc/flexcomm_function.h b/include/hw/misc/flexcomm_function.h
index e498976927..3ff1677ff6 100644
--- a/include/hw/misc/flexcomm_function.h
+++ b/include/hw/misc/flexcomm_function.h
@@ -23,6 +23,8 @@ struct FlexcommFunction {
 
     MemoryRegion mmio;
     uint32_t *regs;
+    Fifo32 *tx_fifo;
+    Fifo32 *rx_fifo;
 };
 
 typedef void (*FlexcommFunctionSelect)(FlexcommFunction *f, bool selected);
@@ -32,6 +34,7 @@ struct FlexcommFunctionClass {
 
     const MemoryRegionOps *mmio_ops;
     const char *name;
+    bool has_fifos;
     FlexcommFunctionSelect select;
 };
 
@@ -43,5 +46,10 @@ static inline void flexcomm_select(FlexcommFunction *obj, bool selected)
 }
 
 void flexcomm_set_irq(FlexcommFunction *f, bool irq);
+void flexcomm_update_fifostat(FlexcommFunction *f);
+void flexcomm_clear_fifostat(FlexcommFunction *f, uint64_t value);
+void flexcomm_init_fifos(FlexcommFunction *f, unsigned num);
+void flexcomm_cleanup_fifos(FlexcommFunction *f);
+void flexcomm_reset_fifos(FlexcommFunction *f);
 
 #endif /* HW_FLEXCOMM_FUNCTION_H */
diff --git a/hw/misc/flexcomm.c b/hw/misc/flexcomm.c
index 2337fb814c..a98d8845aa 100644
--- a/hw/misc/flexcomm.c
+++ b/hw/misc/flexcomm.c
@@ -22,6 +22,7 @@
 #include "trace.h"
 #include "migration/vmstate.h"
 #include "hw/misc/flexcomm.h"
+#include "hw/arm/svd/flexcomm_usart.h"
 
 #define REG(s, reg) (s->regs[R_FLEXCOMM_##reg])
 #define RF_WR(s, reg, field, val) \
@@ -219,12 +220,22 @@ static void flexcomm_init(Object *obj)
     sysbus_init_irq(sbd, &s->irq);
 }
 
+static void flexcomm_finalize(Object *obj)
+{
+    FlexcommState *s = FLEXCOMM(obj);
+
+    /* release resources allocated by the function select (e.g. fifos) */
+    flexcomm_func_select(s, false);
+}
+
 static void flexcomm_func_realize_and_unref(FlexcommFunction *f, Error **errp)
 {
     FlexcommState *s = FLEXCOMM(OBJECT(f)->parent);
     FlexcommFunctionClass *fc = FLEXCOMM_FUNCTION_GET_CLASS(f);
 
     f->regs = s->regs;
+    f->tx_fifo = &s->tx_fifo;
+    f->rx_fifo = &s->rx_fifo;
     memory_region_add_subregion_overlap(&s->container, 0, &f->mmio, 0);
     DEVICE(f)->id = g_strdup_printf("%s-%s", DEVICE(s)->id, fc->name);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(f), errp);
@@ -274,11 +285,82 @@ void flexcomm_set_irq(FlexcommFunction *f, bool irq)
     }
 }
 
+/* FIFO is shared between USART and SPI, provide common functions here */
+#define FIFO_REG(s, reg) (s->regs[R_FLEXCOMM_USART_FIFO##reg])
+#define FIFO_WR(s, reg, field, val) \
+    ARRAY_FIELD_DP32(s->regs, FLEXCOMM_USART_FIFO##reg, field, val)
+#define FIFO_RD(s, reg, field) \
+    ARRAY_FIELD_EX32(s->regs, FLEXCOMM_USART_FIFO##reg, field)
+
+void flexcomm_update_fifostat(FlexcommFunction *f)
+{
+    int rxlvl = fifo32_num_used(f->rx_fifo);
+    int txlvl = fifo32_num_used(f->tx_fifo);
+
+    FIFO_WR(f, STAT, RXLVL, rxlvl);
+    FIFO_WR(f, STAT, TXLVL, txlvl);
+    FIFO_WR(f, STAT, RXFULL, fifo32_is_full(f->rx_fifo) ? 1 : 0);
+    FIFO_WR(f, STAT, RXNOTEMPTY, !fifo32_is_empty(f->rx_fifo) ? 1 : 0);
+    FIFO_WR(f, STAT, TXNOTFULL, !fifo32_is_full(f->tx_fifo) ? 1 : 0);
+    FIFO_WR(f, STAT, TXEMPTY, fifo32_is_empty(f->tx_fifo) ? 1 : 0);
+
+    if (FIFO_RD(f, TRIG, RXLVLENA) && (rxlvl > FIFO_RD(f, TRIG, RXLVL))) {
+        FIFO_WR(f, INTSTAT, RXLVL, 1);
+    } else {
+        FIFO_WR(f, INTSTAT, RXLVL, 0);
+    }
+
+    if (FIFO_RD(f, TRIG, TXLVLENA) && (txlvl <= FIFO_RD(f, TRIG, TXLVL))) {
+        FIFO_WR(f, INTSTAT, TXLVL, 1);
+    } else {
+        FIFO_WR(f, INTSTAT, TXLVL, 0);
+    }
+
+    trace_flexcomm_fifostat(DEVICE(f)->id, FIFO_REG(f, STAT),
+                            FIFO_REG(f, INTSTAT));
+}
+
+void flexcomm_reset_fifos(FlexcommFunction *f)
+{
+    if (FIFO_RD(f, CFG, EMPTYRX)) {
+        FIFO_WR(f, CFG, EMPTYRX, 0);
+        fifo32_reset(f->rx_fifo);
+    }
+    if (FIFO_RD(f, CFG, EMPTYTX)) {
+        FIFO_WR(f, CFG, EMPTYTX, 0);
+        fifo32_reset(f->tx_fifo);
+    }
+}
+
+void flexcomm_clear_fifostat(FlexcommFunction *f, uint64_t value)
+{
+    bool rxerr = FIELD_EX32(value, FLEXCOMM_USART_FIFOSTAT, RXERR);
+    bool txerr = FIELD_EX32(value, FLEXCOMM_USART_FIFOSTAT, TXERR);
+
+    if (rxerr) {
+        FIFO_WR(f, STAT, RXERR, 0);
+    }
+    if (txerr) {
+        FIFO_WR(f, STAT, TXERR, 0);
+    }
+}
+
 static void flexcomm_function_select(FlexcommFunction *f, bool selected)
 {
     FlexcommFunctionClass *fc = FLEXCOMM_FUNCTION_GET_CLASS(f);
 
     memory_region_set_enabled(&f->mmio, selected);
+    if (fc->has_fifos) {
+        if (selected) {
+            unsigned num = FIFO_RD(f, SIZE, FIFOSIZE);
+
+            fifo32_create(f->tx_fifo, num);
+            fifo32_create(f->rx_fifo, num);
+        } else {
+            fifo32_destroy(f->tx_fifo);
+            fifo32_destroy(f->rx_fifo);
+        }
+    }
 }
 
 static void flexcomm_function_init(Object *obj)
@@ -303,6 +385,7 @@ static const TypeInfo flexcomm_types[] = {
         .parent        = TYPE_SYS_BUS_DEVICE,
         .instance_size = sizeof(FlexcommState),
         .instance_init = flexcomm_init,
+        .instance_finalize = flexcomm_finalize,
         .class_init    = flexcomm_class_init,
     },
     {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 419879fd65..dc245905dc 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -367,3 +367,4 @@ flexcomm_reset(void) ""
 flexcomm_irq(const char *id, uint8_t irq) "%s %d"
 flexcomm_reg_read(const char *devname, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] -> 0x%08x"
 flexcomm_reg_write(const char *dename, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
+flexcomm_fifostat(const char *id, uint32_t fifostat, uint32_t fifoinstat) "%s: %08x %08x"
-- 
2.46.0.662.g92d0881bb0-goog

