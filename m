Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp923450ejq;
        Wed, 17 May 2023 01:13:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6CXl9GCbkvH4WNKiZdLWb9zF1cGFJ7oRpqKCkjHkTNxzb8lPu+DzDdwIqquyc/CRyD8JMj
X-Received: by 2002:a05:622a:64c:b0:3ef:4100:cd0c with SMTP id a12-20020a05622a064c00b003ef4100cd0cmr64055868qtb.63.1684311197515;
        Wed, 17 May 2023 01:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684311197; cv=none;
        d=google.com; s=arc-20160816;
        b=AdafrALqk4T77Io7CtfmITPfAO3BnZXu2Js2Z6fb48axZ6+jIM+LMKSMa6KrS0kLsw
         OYZJrKd2iKC2lVVFWtn6Eq5DbfOYT+jxflgC39nllJTmSEG49LFolzA08H4C4uZQAZx0
         HlBcLDM6CEqBd9wg6P+E7EQghSroeSb/a7oeHj2VQVEBJ0gho/8NWvjDacu1sG9JNzIu
         uSVcXClSEOYrZ67+wW1EujRBQHxs6cD9uscR3abPZA9yHlIgyLJBZqZg7FPfH9v3td9Z
         Ek5CTPHEb3lruA5QrPnwrxN13gk+oLak1g8JXiPctqqtsIFddmxrYKPAKnEna4lwm6i3
         QblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FME8dFCXHhrLjbPwofbxFf6dtGoZ1sG2sL76yiqsucE=;
        b=QuZ/fIanRVQGuNbTXrBw5sge0k09/DYwo9kAalfX8XGspskRaA9BwLT38PZsFMlkx2
         CR+ZBeTUq66TJ5LNfSb4pt6Vgr4/1AdlwVhS+AOh4g6DQpkQV0878l/WDQeb19fTpzQb
         CTWvsXHRFq5blQRyoWYo2gGdHJMozaQfSVca83Bfv9hCtZgPfNJcxfNgisGay2plOs8C
         cr6H2xwY3q9AARpALlsxPsyzvLmKyCmVdOd9ZAkkgXUW7Yax0/ZgxgBgtWkO0StBxE3B
         zx45j4luhIMKkCs474/SZs5DUuWq58EfYS7/RNzTb3k9+3nQVjK3VmnHZWNPDKqDJ8Yg
         1r+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="Y4/nwImE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020ae9f44d000000b0075889d01caasi1022127qkl.302.2023.05.17.01.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 May 2023 01:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="Y4/nwImE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pzCGp-0005qQ-4I; Wed, 17 May 2023 04:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.elsayed4420@gmail.com>)
 id 1pzCGm-0005nJ-Fu; Wed, 17 May 2023 04:12:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <m.elsayed4420@gmail.com>)
 id 1pzCGf-0003JO-2e; Wed, 17 May 2023 04:12:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f50020e0f8so53369115e9.0; 
 Wed, 17 May 2023 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684311133; x=1686903133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FME8dFCXHhrLjbPwofbxFf6dtGoZ1sG2sL76yiqsucE=;
 b=Y4/nwImEoziYQiSRkwrwumNpSRBWNGb4WP+2oJYT0YBxfkEneU3CLTx8sNgCNbID/q
 ZAmdpkVXmrj21AEgpJz3qc2cMf85um6Ogrmb6y8jNSfVUB/NW2paxlrW7gKdAP7DCO6G
 fKorcWu6jF2AukagEedLTuj14R6kPNva7BJ5aA515KvLIu70gpV0BUb1N++4zd6/jdDQ
 Yh060r5HLaQZT8VMTzP8Rto44IIHKolpr9Bap0ADwEf81Lz4Y7XZmdktegXRO9PAOtus
 Z5P9JgdsfZ7JSRPIHQZtWE5wdMKvawFKT6VigObq7pCQrIExePmvFXDqzW4hGJ5+ctkH
 B2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684311133; x=1686903133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FME8dFCXHhrLjbPwofbxFf6dtGoZ1sG2sL76yiqsucE=;
 b=Y4Oip3l74h07tiUdkjly41PfwiOQAamKSEm+Yk+5mrlpruKUnBqa1Aknom5BChSNJA
 UyBxU1ZTAVoGa72tavX2ql5qFzHgPAPxToLpfU15uWLxz646lmtHm3x0dnFYKq0vsCd3
 7mfPbb4PVafjatTqwgrZxq7+w6VpqZfQ6ms31EpomyaDBYLuom0JepYKQNFlaCD5tgGM
 zMrmNz+G188DtrkmlbDeBHAs3VUOeYYLCt4GLEoX+UYwFlGyHWFfGuzqsSmj7zvGJqJR
 0WtRzpdqW6Yx2GQWMpbWFY8rfzOqqEfFsxRuiiJjuWSpaw7gwAIi+JdQM+eLTb8LhmjQ
 Y63g==
X-Gm-Message-State: AC+VfDxmP9TuCI3XthDoGSugI0mwPDmRWGjajwNGzUHBJ8H+eXI0ncSP
 vbGZnerSL4xN8TVU/FPpd/q/l8hgvg+RrA==
X-Received: by 2002:a1c:7210:0:b0:3f1:8129:2c53 with SMTP id
 n16-20020a1c7210000000b003f181292c53mr1060531wmc.16.1684311132872; 
 Wed, 17 May 2023 01:12:12 -0700 (PDT)
Received: from i.. ([41.236.82.205]) by smtp.gmail.com with ESMTPSA id
 o24-20020a1c7518000000b003f42158288dsm1414942wmc.20.2023.05.17.01.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 01:12:12 -0700 (PDT)
From: Mohamed ElSayed <m.elsayed4420@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Mohamed ElSayed <m.elsayed4420@gmail.com>
Subject: [PATCH 2/8] tiva c usart module implementation
Date: Wed, 17 May 2023 11:11:58 +0300
Message-Id: <20230517081204.30333-3-m.elsayed4420@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517081204.30333-1-m.elsayed4420@gmail.com>
References: <20230517081204.30333-1-m.elsayed4420@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=m.elsayed4420@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /CdihQwP+6MV

Signed-off-by: Mohamed ElSayed <m.elsayed4420@gmail.com>
---
 hw/char/tm4c123_usart.c         | 381 ++++++++++++++++++++++++++++++++
 hw/char/trace-events            |   4 +
 include/hw/char/tm4c123_usart.h | 124 +++++++++++
 3 files changed, 509 insertions(+)
 create mode 100644 hw/char/tm4c123_usart.c
 create mode 100644 include/hw/char/tm4c123_usart.h

diff --git a/hw/char/tm4c123_usart.c b/hw/char/tm4c123_usart.c
new file mode 100644
index 0000000000..21bfe781b0
--- /dev/null
+++ b/hw/char/tm4c123_usart.c
@@ -0,0 +1,381 @@
+/*
+ * TM4C123 USART
+ *
+ * Copyright (c) 2023 Mohamed ElSayed <m.elsayed4420@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/tm4c123_usart.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+
+#define LOG(mask, fmt, args...) qemu_log_mask(mask, "%s: " fmt, __func__, ## args)
+#define READONLY LOG(LOG_GUEST_ERROR, "0x%"HWADDR_PRIx" is a readonly field\n.", addr)
+
+static bool usart_clock_enabled(TM4C123SysCtlState *s, hwaddr addr)
+{
+    switch (addr) {
+        case USART_0:
+            return s->sysctl_rcgcuart & (1 << 0);
+            break;
+        case USART_1:
+            return s->sysctl_rcgcuart & (1 << 1);
+            break;
+        case USART_2:
+            return s->sysctl_rcgcuart & (1 << 2);
+            break;
+        case USART_3:
+            return s->sysctl_rcgcuart & (1 << 3);
+            break;
+        case USART_4:
+            return s->sysctl_rcgcuart & (1 << 4);
+            break;
+        case USART_5:
+            return s->sysctl_rcgcuart & (1 << 5);
+            break;
+        case USART_6:
+            return s->sysctl_rcgcuart & (1 << 6);
+            break;
+        case USART_7:
+            return s->sysctl_rcgcuart & (1 << 7);
+            break;
+    }
+    return false;
+}
+
+
+static int tm4c123_usart_can_receive(void *opaque)
+{
+    TM4C123USARTState *s = opaque;
+
+    if (!(s->usart_fr & USART_FR_RXFF)) {
+        return 1;
+    }
+    return 0;
+}
+
+static void tm4c123_usart_receive(void *opaque, const uint8_t *buf, int size)
+{
+    TM4C123USARTState *s = opaque;
+
+    if (!(s->usart_ctl & USART_CR_EN && s->usart_ctl & USART_CR_RXE)) {
+        LOG(LOG_GUEST_ERROR, "The module is not enbled\n");
+        return;
+    }
+
+    s->usart_dr = *buf;
+    s->usart_ctl &= ~USART_FR_RXFE;
+
+    if (s->usart_im & USART_IM_RXIM) {
+        qemu_set_irq(s->irq, 1);
+    }
+}
+
+static void tm4c123_usart_reset(DeviceState *dev)
+{
+    TM4C123USARTState *s = TM4C123_USART(dev);
+
+    s->usart_dr = 0x00000000;
+    s->usart_rsr = 0x00000000;
+    s->usart_fr = 0x00000090;
+    s->usart_ilpr = 0x00000000;
+    s->usart_ibrd = 0x00000000;
+    s->usart_fbrd = 0x00000000;
+    s->usart_lcrh = 0x00000000;
+    s->usart_ctl = 0x00000300;
+    s->usart_ifls = 0x00000012;
+    s->usart_im = 0x00000000;
+    s->usart_ris = 0x00000000;
+    s->usart_mis = 0x00000000;
+    s->usart_icr = 0x00000000;
+    s->usart_dma_ctl = 0x00000000;
+    s->usart_9bit_addr = 0x00000000;
+    s->usart_9bit_mask = 0x000000FF;
+    s->usart_pp = 0x00000003;
+    s->usart_cc = 0x00000000;
+    s->usart_per_id4 = 0x00000000;
+    s->usart_per_id5 = 0x00000000;
+    s->usart_per_id6 = 0x00000000;
+    s->usart_per_id7 = 0x00000000;
+    s->usart_per_id0 = 0x00000060;
+    s->usart_per_id1 = 0x00000000;
+    s->usart_per_id2 = 0x00000018;
+    s->usart_per_id3 = 0x00000001;
+    s->usart_pcell_id0 = 0x0000000D;
+    s->usart_pcell_id1 = 0x000000F0;
+    s->usart_pcell_id2 = 0x00000005;
+    s->usart_pcell_id3 = 0x000000B1;
+
+    qemu_set_irq(s->irq, 0);
+}
+
+static uint64_t tm4c123_usart_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    TM4C123USARTState *s = opaque;
+
+    if (!usart_clock_enabled(s->sysctl, s->mmio.addr)) {
+        hw_error("USART module clock is not enabled");
+    }
+
+    trace_tm4c123_usart_read(addr);
+
+    switch (addr) {
+        case USART_DR:
+            return s->usart_dr;
+        case USART_RSR:
+            return s->usart_rsr;
+        case USART_FR:
+            return s->usart_fr;
+        case USART_ILPR:
+            return s->usart_ilpr;
+        case USART_IBRD:
+            return s->usart_ibrd;
+        case USART_FBRD:
+            return s->usart_fbrd;
+        case USART_LCRH:
+            return s->usart_lcrh;
+        case USART_CTL:
+            return s->usart_ctl;
+        case USART_IFLS:
+            return s->usart_ifls;
+        case USART_IM:
+            return s->usart_im;
+        case USART_RIS:
+            return s->usart_ris;
+        case USART_MIS:
+            return s->usart_mis;
+        case USART_ICR:
+            return s->usart_icr;
+        case USART_DMA_CTL:
+            return s->usart_dma_ctl;
+        case USART_9BIT_ADDR:
+            return s->usart_9bit_addr;
+        case USART_9BIT_MASK:
+            return s->usart_9bit_mask;
+        case USART_PP:
+            return s->usart_pp;
+        case USART_CC:
+            return s->usart_cc;
+        case USART_PER_ID4:
+            return s->usart_per_id4;
+        case USART_PER_ID5:
+            return s->usart_per_id5;
+        case USART_PER_ID6:
+            return s->usart_per_id6;
+        case USART_PER_ID7:
+            return s->usart_per_id7;
+        case USART_PER_ID0:
+            return s->usart_per_id0;
+        case USART_PER_ID1:
+            return s->usart_per_id1;
+        case USART_PER_ID2:
+            return s->usart_per_id2;
+        case USART_PER_ID3:
+            return s->usart_per_id3;
+        case USART_PCELL_ID0:
+            return s->usart_pcell_id0;
+        case USART_PCELL_ID1:
+            return s->usart_pcell_id1;
+        case USART_PCELL_ID2:
+            return s->usart_pcell_id2;
+        case USART_PCELL_ID3:
+            return s->usart_pcell_id3;
+        default:
+            LOG(LOG_GUEST_ERROR, "Bad address 0x%"HWADDR_PRIx"\n", addr);
+            return 0;
+    }
+
+    return 0;
+}
+
+static void tm4c123_usart_write(void *opaque, hwaddr addr, uint64_t val64, unsigned int size)
+{
+    TM4C123USARTState *s = opaque;
+    uint32_t val32 = val64;
+    unsigned char ch;
+
+    if (!usart_clock_enabled(s->sysctl, s->mmio.addr)) {
+        hw_error("USART module clock is not enabled");
+    }
+
+    trace_tm4c123_usart_write(addr, val32);
+
+    switch (addr) {
+        case USART_DR:
+            s->usart_dr = val32;
+            if (val32 < 0xF000) {
+                ch = val32;
+                qemu_chr_fe_write_all(&s->chr, &ch, 1);
+            }
+            break;
+        case USART_RSR:
+            s->usart_rsr = val32;
+            break;
+        case USART_FR:
+            READONLY;
+            break;
+        case USART_ILPR:
+            s->usart_ilpr = val32;
+            break;
+        case USART_IBRD:
+            s->usart_ibrd = val32;
+            break;
+        case USART_FBRD:
+            s->usart_fbrd = val32;
+            break;
+        case USART_LCRH:
+            s->usart_lcrh = val32;
+            break;
+        case USART_CTL:
+            s->usart_ctl = val32;
+            break;
+        case USART_IFLS:
+            s->usart_ifls = val32;
+            break;
+        case USART_IM:
+            s->usart_im = val32;
+            break;
+        case USART_RIS:
+            READONLY;
+            break;
+        case USART_MIS:
+            READONLY;
+            break;
+        case USART_ICR:
+            s->usart_icr = val32;
+            break;
+        case USART_DMA_CTL:
+            s->usart_dma_ctl = val32;
+            break;
+        case USART_9BIT_ADDR:
+            s->usart_9bit_addr = val32;
+            break;
+        case USART_9BIT_MASK:
+            s->usart_9bit_mask = val32;
+            break;
+        case USART_PP:
+            READONLY;
+            break;
+        case USART_CC:
+            s->usart_cc = val32;
+            break;
+        case USART_PER_ID4:
+            READONLY;
+            break;
+        case USART_PER_ID5:
+            READONLY;
+            break;
+        case USART_PER_ID6:
+            READONLY;
+            break;
+        case USART_PER_ID7:
+            READONLY;
+            break;
+        case USART_PER_ID0:
+            READONLY;
+            break;
+        case USART_PER_ID1:
+            READONLY;
+            break;
+        case USART_PER_ID2:
+            READONLY;
+            break;
+        case USART_PER_ID3:
+            READONLY;
+            break;
+        case USART_PCELL_ID0:
+            READONLY;
+            break;
+        case USART_PCELL_ID1:
+            READONLY;
+            break;
+        case USART_PCELL_ID2:
+            READONLY;
+            break;
+        case USART_PCELL_ID3:
+            READONLY;
+            break;
+        default:
+            LOG(LOG_GUEST_ERROR, "Bad address 0x%"HWADDR_PRIx"\n", addr);
+            return;
+    }
+
+    return;
+}
+
+static const MemoryRegionOps tm4c123_usart_ops = {
+    .read = tm4c123_usart_read,
+    .write = tm4c123_usart_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static Property tm4c123_usart_properties[] = {
+    DEFINE_PROP_CHR("chardev", TM4C123USARTState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void tm4c123_usart_init(Object *obj)
+{
+    TM4C123USARTState *s = TM4C123_USART(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+
+    memory_region_init_io(&s->mmio, obj, &tm4c123_usart_ops, s,
+            TYPE_TM4C123_USART, 0xFFF);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void tm4c123_usart_realize(DeviceState *dev, Error **errp)
+{
+    TM4C123USARTState *s = TM4C123_USART(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, tm4c123_usart_can_receive,
+            tm4c123_usart_receive, NULL, NULL,
+            s, NULL, true);
+}
+
+static void tm4c123_usart_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = tm4c123_usart_reset;
+    device_class_set_props(dc, tm4c123_usart_properties);
+    dc->realize = tm4c123_usart_realize;
+}
+
+static const TypeInfo tm4c123_usart_info = {
+    .name          = TYPE_TM4C123_USART,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(TM4C123USARTState),
+    .instance_init = tm4c123_usart_init,
+    .class_init    = tm4c123_usart_class_init,
+};
+
+static void tm4c123_usart_register_types(void)
+{
+    type_register_static(&tm4c123_usart_info);
+}
+
+type_init(tm4c123_usart_register_types)
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2ecb36232e..47b7e3b772 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# tm4c123_usart.c
+tm4c123_usart_read(uint64_t offset) " offset: 0x%" PRIu64
+tm4c123_usart_write(uint64_t offset, uint64_t value) " offset: 0x%" PRIu64 " - value: 0x%" PRIu64
+
 # parallel.c
 parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s] addr 0x%02x val 0x%02x"
 parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s] addr 0x%02x val 0x%02x"
diff --git a/include/hw/char/tm4c123_usart.h b/include/hw/char/tm4c123_usart.h
new file mode 100644
index 0000000000..be98eb3948
--- /dev/null
+++ b/include/hw/char/tm4c123_usart.h
@@ -0,0 +1,124 @@
+/*
+ * TM4C123 USART
+ *
+ * Copyright (c) 2023 Mohamed ElSayed <m.elsayed4420@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_ARM_TM4C123_USART_H
+#define HW_ARM_TM4C123_USART_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+#include "chardev/char-fe.h"
+#include "hw/misc/tm4c123_sysctl.h"
+
+#define USART_DR            0x000
+#define USART_RSR           0x004
+#define USART_FR            0x018
+#define USART_ILPR          0x020
+#define USART_IBRD          0x024
+#define USART_FBRD          0x028
+#define USART_LCRH          0x02C
+#define USART_CTL           0x030
+#define USART_IFLS          0x034
+#define USART_IM            0x038
+#define USART_RIS           0x03C
+#define USART_MIS           0x040
+#define USART_ICR           0x044
+#define USART_DMA_CTL       0x048
+#define USART_9BIT_ADDR     0x0A4
+#define USART_9BIT_MASK     0x0A8
+#define USART_PP            0xFC0
+#define USART_CC            0xFC8
+#define USART_PER_ID4       0x0FD0
+#define USART_PER_ID5       0xFD4
+#define USART_PER_ID6       0xFD8
+#define USART_PER_ID7       0xFDC
+#define USART_PER_ID0       0xFE0
+#define USART_PER_ID1       0xFE4
+#define USART_PER_ID2       0xFE8
+#define USART_PER_ID3       0xFEC
+#define USART_PCELL_ID0     0xFF0
+#define USART_PCELL_ID1     0xFF4
+#define USART_PCELL_ID2     0xFF8
+#define USART_PCELL_ID3     0xFFC
+
+#define USART_FR_RXFF (1 << 6)
+#define USART_FR_TXFF (1 << 5)
+#define USART_FR_RXFE (1 << 4)
+#define USART_FR_BUSY (1 << 3)
+#define USART_CR_RXE  (1 << 9)
+#define USART_CR_EN   (1 << 0)
+#define USART_IM_RXIM (1 << 4)
+
+#define USART_0 0x4000C000
+#define USART_1 0x4000D000
+#define USART_2 0x4000E000
+#define USART_3 0x4000F000
+#define USART_4 0x40010000
+#define USART_5 0x40011000
+#define USART_6 0x40012000
+#define USART_7 0x40013000
+#define TYPE_TM4C123_USART "tm4c123-usart"
+
+OBJECT_DECLARE_SIMPLE_TYPE(TM4C123USARTState, TM4C123_USART)
+
+struct TM4C123USARTState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+
+    uint32_t usart_dr;
+    uint32_t usart_rsr;
+    uint32_t usart_fr;
+    uint32_t usart_ilpr;
+    uint32_t usart_ibrd;
+    uint32_t usart_fbrd;
+    uint32_t usart_lcrh;
+    uint32_t usart_ctl;
+    uint32_t usart_ifls;
+    uint32_t usart_im;
+    uint32_t usart_ris;
+    uint32_t usart_mis;
+    uint32_t usart_icr;
+    uint32_t usart_dma_ctl;
+    uint32_t usart_9bit_addr;
+    uint32_t usart_9bit_mask;
+    uint32_t usart_pp;
+    uint32_t usart_cc;
+    uint32_t usart_per_id4;
+    uint32_t usart_per_id5;
+    uint32_t usart_per_id6;
+    uint32_t usart_per_id7;
+    uint32_t usart_per_id0;
+    uint32_t usart_per_id1;
+    uint32_t usart_per_id2;
+    uint32_t usart_per_id3;
+    uint32_t usart_pcell_id0;
+    uint32_t usart_pcell_id1;
+    uint32_t usart_pcell_id2;
+    uint32_t usart_pcell_id3;
+
+    CharBackend chr;
+    qemu_irq irq;
+    TM4C123SysCtlState *sysctl;
+};
+
+#endif
-- 
2.34.1

