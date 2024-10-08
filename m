Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289091njb;
        Mon, 7 Oct 2024 18:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW19aNQqOMEGwrl7XPYrZgHjNo3ArJSE6abEXvJIHbNRpxbe3sLuxsfdj94/rOiq+83h2ZXQrqEKkd4yw==@linaro.org
X-Google-Smtp-Source: AGHT+IE2mG8Hjneikf50mgjoP7u5wzdCfP482mv2uubOR1SHpUildI4GDPHfQ26NDY/wjPyuYGx6
X-Received: by 2002:a05:6214:390a:b0:6cb:8267:e288 with SMTP id 6a1803df08f44-6cb9a02860cmr199807626d6.0.1728350499428;
        Mon, 07 Oct 2024 18:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350499; cv=none;
        d=google.com; s=arc-20240605;
        b=W5/PVQOjCuGAmFbL81VcMb8i1ySRq46FPHjSXAheJYAoOgt39yhO9WMZzf+1McmONm
         2yzVjQ+brBesE27/smVHNkFNxcf7hEYeGM3Ew69ZrFU4DusmJKsowhBjcVByMV6uiyhQ
         v1b5NPIeleUOznTUZtuc1/I1BzZZUg0Bl9xqzwrO1NGIYsqAfD57GbkhXRAmoXjAqJx7
         K+26H4zVT0JWXTSIqix3/r2F/OpCw5iRnCXnd0nTzhwKLenN/PkpH6m4z0osrBjcLds6
         u6Ao/Ao86Jpr7h/0HzVqnGZkK0ld6c0FMZRr9wm/B4FeEh6TqbrFsWBP/rQSctqlHtb7
         i3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=mYb8OnCeZQrVX3cX0gw+0rgqxbLbcVi8KOrSlVTkt1w=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=jMrrHtD4xs/vaa7qaMf2mp6AY3nNcKlKESS9YixsDBjr8BvBQwN6/l6wLfoB4xDgA6
         kAIxRGv0mgcu+wVHOSKGE/UdcKLaytQqH6SREbxBIdthDY8yyNU1STcWh2y4OTiW4hmD
         L4oZ50jcXvYnsD4TmJPre3lJdrdvc61O/8HWc5knjoTqI8/+tWBNwouhg8KZh2ifuR0g
         Lnp2LPGA93o4jMg0ftXSq1qP/bEiqZkdSqB+gnXFwqYrHB8Uj0gTSJpgL2iJkbEaj8Pw
         ORfyK3fSvDwnN8cHjB25GrwBlIb0oEsSiysfGNVof4L6MmCJhi8gpSP6pXHg+9hKdgzO
         Du3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=R+dbq+lY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba46e8ca9si75083296d6.164.2024.10.07.18.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=R+dbq+lY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxytG-0001nW-A0; Mon, 07 Oct 2024 21:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iIgEZwUKCOkeLgTaRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--tavip.bounces.google.com>)
 id 1sxysW-0007le-9I
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:13 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iIgEZwUKCOkeLgTaRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--tavip.bounces.google.com>)
 id 1sxysU-00008Q-KU
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:08 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-71e0217c5fdso2315799b3a.3
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350345; x=1728955145; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mYb8OnCeZQrVX3cX0gw+0rgqxbLbcVi8KOrSlVTkt1w=;
 b=R+dbq+lYPKBxoShJVGaECVHtrXWjZzyeL7InCQCZ+Qj0EgFmQTkodR+QRqOUAowVa8
 ZbH9shwsQ4mThB9EgjYZrslSSBTb+ZlCdlJdCuSB9I3DizhOELaSwNaTGkSZ1L40cDGi
 S63PVlsC3lgMjRypOkldSc8DqSvKFpMDdkmIbXHAl9yoTPbj9almi8UE/cxV5LxdBiO0
 /Wy/HsA3EhJV8YFaNXLwrYqnjE5CMuAjeIOIkTnY//xeRfuTV5YrEl2pQGl13LmZjlxc
 u8nel40foteYKxO7WdJN7JDd3MFtUfPux72NbhYSZaIIW3dZU1KMB7wdb9C6FRpkGLgi
 H58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350345; x=1728955145;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mYb8OnCeZQrVX3cX0gw+0rgqxbLbcVi8KOrSlVTkt1w=;
 b=SYcMdzF+aKjSjKTHFanW+OXQAmc4nVhTMNKp/Zc11h0G7sniLlkH/Npi6P3AgE0vnK
 bzeho4AXUgyTaKjt6cmViVMY7eRJvuQCSiHbaaih99z18I+VPltmN8SCBHOouMEWts4b
 9hY79LpDP4LLI6bu+K2tnjNQfD1Awkz9WcmRImyGTGNp70XNqPvHI9jAKr2LuAaV+F4L
 9Mj9dDXaLMWp11HkYaySQcuYVJI4fZyOARfq++ABM066sR6O80wgvFM/ZTuztv51o1q+
 bsbHc2JIcHF0lawUrfDtxYtYcB98JkKKxEjyyclfY9BsKI7WvReR7g9xvA5w6yM93pns
 TBzQ==
X-Gm-Message-State: AOJu0Yw/uhtLORUznuSfDHImzysoLb0HsUNH8EGlARX5gzc0o/srfdO9
 YOtQklL5mJY9iKBCnMqvo65j86GOVR/poGdESa+YoFf8E8nBaA0SzHXEENmXGdQAZKLYiWemsA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a62:ae17:0:b0:71d:ef29:82b2 with
 SMTP id
 d2e1a72fcca58-71def2984ddmr23497b3a.0.1728350344733; Mon, 07 Oct 2024
 18:19:04 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:32 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-7-tavip@google.com>
Subject: [PATCH v2 06/25] hw/misc/flexcomm.c: add common fifo functionality
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3iIgEZwUKCOkeLgTaRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: rH6WE2wrS/1w

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
2.47.0.rc0.187.ge670bccf7e-goog

