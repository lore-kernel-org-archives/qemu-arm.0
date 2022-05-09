Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp3891313lfj;
        Mon, 9 May 2022 13:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtEUnTx3o1YPzhs2fnwYBKcAcojG8JVe5XBpl6RBTG/Bqj2/NWX8qu86WqQQrAPLOoo/VK
X-Received: by 2002:a05:622a:100b:b0:2f3:c5db:cb86 with SMTP id d11-20020a05622a100b00b002f3c5dbcb86mr16985831qte.178.1652127664941;
        Mon, 09 May 2022 13:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652127664; cv=none;
        d=google.com; s=arc-20160816;
        b=De509cSrICMHiecP0ihPDLIper0f3RXn1+T3BsgVNbQKH40M1AUQkEeiHSbC/hX9kO
         flzSwR3VfI15PnatddLXTf9DJBMtlgQdUQZYUK7iWyJTgw6Vix1hprSWOJfjDJy1Wvp7
         UMEjaoeM4o9rW9FsWdGpcJ6ncnnyyFOCkjC5RxvwEPyyC+9dsFPTRvMGxGNNzREG3uN0
         t5Np7tEG+JvZjnslFkulo6o2UNQ8EwI17Sw8SsNmQHlJzMcOmU7SPIkhqwbzfy78ggA2
         P5Eb7evBeaAse3F9v1/3GzYXNqjIvTqVagXGA2KW+g4lyNbGKGZQt+j37j44lOO2fqvQ
         Bi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=kcvql3wXVAMOWdcWNPkxojqFp5MRkSepFQ1so1DkkYI=;
        b=jjLgOSoN595IzSz/c2t82O4Kiz7f+xArfyNzM/IqpmrtNZDHns+HYNpHh2hXXqIAw6
         Enxkpgd1YSWb28Tn6WBuhjVbPxYopmOIr3EIQEmKCd1kl/OcJjl+Qt5WJr7J3n3NNbta
         SGrnvTq0P3pwyRibBPSZaRCbrtFLw8iZHxdxzkY6esACjROSCGPQwkDzsK2e/Stu+2Qt
         9+KZ96COHLasK79OPzpiRt26WK1bz2N9gKBphQQAoWDxoh5GJBwl9es/Tbx62RHSu1bh
         g20nVJQ0Qvx6wRsBmBNuzVL2GwfSN0CDVCMW0Sj+37s+8YsiK/JVtG4u/HUpfbnPkqS+
         c67A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=IHGpw5Ld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05622a118100b002f3dcc84312si1990137qtk.40.2022.05.09.13.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 May 2022 13:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=IHGpw5Ld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1no9sO-0000rG-Fm
	for alex.bennee@linaro.org; Mon, 09 May 2022 16:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no9s3-0000pw-Gg; Mon, 09 May 2022 16:20:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no9s1-0008KT-SB; Mon, 09 May 2022 16:20:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id j15so21012617wrb.2;
 Mon, 09 May 2022 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kcvql3wXVAMOWdcWNPkxojqFp5MRkSepFQ1so1DkkYI=;
 b=IHGpw5LdRePYtSDdv+078f3i/QIkTIsWA9cgC2IytFAIyyI9BbSkNxIeRTt05k7liC
 bTNjg4s4wAWhWQ6qwz6ha9OfZpXGWkol5XdXhrZqOJ/Ys1BEZ/HAthoARRavHM2i43K/
 uLphlSzHgpj4EhzsSAojDTdyMOsZC+Ee2D8izyhH9AGKwLNfFiYOfl7kctY0WCzo06bb
 a1/scilpZh9y3ZClb4E5NNravoP5zaVfg6AtPStmA2hMT3IZFRSAuQeWiNV11sb3DJtK
 RBSZ5Xt7/ij3N+so6NabUR6NEiG0ve7NJLkmjmO+It6JKB+YE7IjqLsiaxTO0WCgLMQo
 IagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kcvql3wXVAMOWdcWNPkxojqFp5MRkSepFQ1so1DkkYI=;
 b=qoe49jRye0acvGrT4vZYgBR44GBkyrhJvbKrF7B3H5HT7nh+60iq7fGrfufa/MdjMa
 wp1cxr6Wc+WbbWj9Fmr9crAsbklZiA3HhlktF7zxX5rLYsgRoHBbpSIwjBKg+lmaTNiQ
 pWCLNV5a6DFv0aT2rWlJGZxgYDF/2BlNgklrIcApPvJ9AuiYDBcoQ50DR+HuSkXqAtaN
 Xcrb4sqqLshNu+95Y2bFr9ntMQ8X2RNabZ9lG7C8V5KpLC5o/HSNY6KT9e5Q6Kevl0Id
 d6cOEOoF7WdnVOiQXPkEKGu823ypLc0cWJHNSLUadxaoRMucL8wA3TIBlPMpKjb12NDK
 fGYA==
X-Gm-Message-State: AOAM533xkNgmczG2wYvEOUYnwqlCOrjNS1b+1NdiOBBC3ja+j8Ur32gn
 bAfPHnbj3EwnNI/H9yf/umlprc0olDk=
X-Received: by 2002:adf:e5cd:0:b0:20a:f3d9:3376 with SMTP id
 a13-20020adfe5cd000000b0020af3d93376mr15518822wrn.228.1652127637984; 
 Mon, 09 May 2022 13:20:37 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a05600c220f00b00394538d039esm311094wml.6.2022.05.09.13.20.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 May 2022 13:20:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/adc/zynq-xadc: Use qemu_irq typedef
Date: Mon,  9 May 2022 22:20:35 +0200
Message-Id: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3vgp8zDhxRX9

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Except hw/core/irq.c which implements the forward-declared opaque
qemu_irq structure, hw/adc/zynq-xadc.{c,h} are the only files not
using the typedef. Fix this single exception.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/adc/zynq-xadc.c         | 4 ++--
 include/hw/adc/zynq-xadc.h | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/adc/zynq-xadc.c b/hw/adc/zynq-xadc.c
index cfc7bab065..032e19cbd0 100644
--- a/hw/adc/zynq-xadc.c
+++ b/hw/adc/zynq-xadc.c
@@ -86,7 +86,7 @@ static void zynq_xadc_update_ints(ZynqXADCState *s)
         s->regs[INT_STS] |= INT_DFIFO_GTH;
     }
 
-    qemu_set_irq(s->qemu_irq, !!(s->regs[INT_STS] & ~s->regs[INT_MASK]));
+    qemu_set_irq(s->irq, !!(s->regs[INT_STS] & ~s->regs[INT_MASK]));
 }
 
 static void zynq_xadc_reset(DeviceState *d)
@@ -262,7 +262,7 @@ static void zynq_xadc_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &xadc_ops, s, "zynq-xadc",
                           ZYNQ_XADC_MMIO_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->qemu_irq);
+    sysbus_init_irq(sbd, &s->irq);
 }
 
 static const VMStateDescription vmstate_zynq_xadc = {
diff --git a/include/hw/adc/zynq-xadc.h b/include/hw/adc/zynq-xadc.h
index 2017b7a803..c10cc4c379 100644
--- a/include/hw/adc/zynq-xadc.h
+++ b/include/hw/adc/zynq-xadc.h
@@ -39,8 +39,7 @@ struct ZynqXADCState {
     uint16_t xadc_dfifo[ZYNQ_XADC_FIFO_DEPTH];
     uint16_t xadc_dfifo_entries;
 
-    struct IRQState *qemu_irq;
-
+    qemu_irq irq;
 };
 
 #endif /* ZYNQ_XADC_H */
-- 
2.35.1

