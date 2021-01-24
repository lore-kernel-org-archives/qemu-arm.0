Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2104899lfb;
        Sat, 23 Jan 2021 18:57:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYn05NTQ+A4+q0WrtogQYC3O8DmvJbdws/6P40j9gZoEKmGFxsk0ojYj7UXfI+lBlyvmm8
X-Received: by 2002:a25:1287:: with SMTP id 129mr12307170ybs.27.1611457045357;
        Sat, 23 Jan 2021 18:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611457045; cv=none;
        d=google.com; s=arc-20160816;
        b=dte6mQKIS5A/snxUajMK6hiHLaLn2zo3pKLdzggABregAE+dS70q/5QDpVkclAnth4
         Z1PyYZvMApEWOwX6JGocGyWE2eggJ/tPOI/SktkbGVgP6W7HFz+cfwsXAnvOCn1IXFy0
         DCWgKd6HngK3eefPFcSP/b9Z7bOFfnvwZJ+RHd/5QApJZBvKilR8En7M5dr0WT5BKMBR
         Pqt1II+Z5yJyisBlBpzIeMBu5+z584k+3fiuggELBIUmHTcFWoe40L2DvojqQ8okk6rF
         Sp/8F+IHzrrzXLHf/TPLdomtO1+mph8wa8iHjDO8WjNo4OkZS4WdH9riCDBJAETeHBlG
         k9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vCib2bK8ZRs2GnL3ZDKcV/vqIXCDzjV3kKl0ikqzRig=;
        b=iAWjhj95H/1MgLeeLdVZ/wHjboJkqtiQlP9ZA8gJ+mF2+pUIHL84Adx6FiKyn89sHt
         fsYhrq6qjiWuGychqf13BbvEWzG3cbvU2BGkMD43LqlL46sQP11AotnCgMnEHJCGD/LJ
         VgkGhOTw4rEw7/4Bt5dBxRki1A/BY+f1G9z7C/FpkWBswCjdU+1EaHC6ZM8NMrw1Alsz
         TsWpNIIOb5BQMuT4ncRNPCvkOjHzilCTlKSGtK0TVwyRdPGAfLWPxKzDX8D30l9nf9UP
         6AlTysm+lmLqAjfF32QYKJqM6GV6/bSE4y5/9En8mYxrfw0gJkdAkYIQYKdx2WdD1iwz
         8qpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=LLMgbORQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x125si13825391ybc.137.2021.01.23.18.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 18:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=LLMgbORQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3Vae-0002kv-Oe
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 21:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWe-0006oA-9T
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWZ-00039d-RF
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id p15so2174100wrq.8
 for <qemu-arm@nongnu.org>; Sat, 23 Jan 2021 18:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCib2bK8ZRs2GnL3ZDKcV/vqIXCDzjV3kKl0ikqzRig=;
 b=LLMgbORQec2Dr4WSi01vJWcBOvpgSpJQ2j3cj/NkQnSiXBP9kzw6HoB+MtzPw6zqVO
 gvftycDy3K+tD1XWM8vIR0Q/3NiggDJOnzpk1LOW8n6SlI8sDuqS/9kheDr335tPxOki
 BoCFY12rRUPOP9Jer+05qAkJpEWYxD0pj/trXJYNfTpuNygLws1vP65r7emrWeANfio4
 TqU4lwf3NgjjuULU6miWOBI3GgzJ/aJXL4Zr/QmT7NNzTKxGnVn54I6NN26jwd5QSBdW
 6WFDUc8UBk2cW89q7B6jAx7e/X+Qj8hNDbwJssNXVB5z8IkAbnGj+cJhItpLCXr1DeZd
 kV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCib2bK8ZRs2GnL3ZDKcV/vqIXCDzjV3kKl0ikqzRig=;
 b=RhG3v2y3qdmik2t4DaHPKEWsXY029hke6lqusEWihtL9ynbxAkvM/SyCZ5rVInBV+/
 TrGvw/57yuobGTaD+s6yzwWuvQIPdI1/IyJDDAFA1RD3pbknJUkGb1tQeWs5UoRC1IDy
 ybmPsvEF7HG99r6WlkU6Uj5b57cjTJxRq3I0Md7oZm/FjA8FWruuvj11kIvb+Go104kM
 c1i8zPBP1WG7cu9Y/oIeBC1WUwku8J1bB1KrarEVoLjye1WaMnwhguTCh7pmvat6EPnx
 BJn7WMSzqsI8+GLvm+PAh36vDxIKRlyZ7ao6QkOsPQbkpjTzfeBbMH/1fkM3WuKi+WSV
 MdvA==
X-Gm-Message-State: AOAM531kSBlzPGlNUuVRz5nLLmKNvFnqwVNVG7HMeMUdPjyLAbLzaSOw
 pSPncJexgC4Ee8MuqfaeWSswhuww13X8Mx/rr/8KOdE7Z2jantOZ9xYMFgGUKCVNrxzN1+Zgm5i
 1qiYvndMF8n80Pb38fYJfrcklN6BFhTOuNaNzPtcE9qXORUkIMMp4TLadb6WyQB8jOgw=
X-Received: by 2002:a5d:6588:: with SMTP id q8mr1091823wru.294.1611456790038; 
 Sat, 23 Jan 2021 18:53:10 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:09 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 2/4] hw/intc: add helper function to determine gicv3
 redistributor size
Date: Sun, 24 Jan 2021 02:53:04 +0000
Message-Id: <20210124025306.3949-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GkLw/swGKZSF

GICv3 sets aside 128K for each redistributor block, whereas GICv4 sets
aside 256K. To enable use of the gicv3 model for gicv4, abstract this
away as the helper function gicv3_redist_size() and replace the current
hardcoded locations with calls to this function.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_common.c         |  2 +-
 hw/intc/arm_gicv3_redist.c         | 13 +++++++++----
 include/hw/intc/arm_gicv3_common.h |  3 +++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7365d24873..a8510b39a1 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -299,7 +299,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
         memory_region_init_io(&s->iomem_redist[i], OBJECT(s),
                               ops ? &ops[1] : NULL, s, name,
-                              s->redist_region_count[i] * GICV3_REDIST_SIZE);
+                              s->redist_region_count[i] * gicv3_redist_size(s));
         sysbus_init_mmio(sbd, &s->iomem_redist[i]);
         g_free(name);
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..544f4d82ff 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -14,6 +14,11 @@
 #include "trace.h"
 #include "gicv3_internal.h"
 
+int gicv3_redist_size(GICv3State *s)
+{
+    return (s->revision == 3 ? GICV3_REDIST_SIZE : GICV4_REDIST_SIZE);
+}
+
 static uint32_t mask_group(GICv3CPUState *cs, MemTxAttrs attrs)
 {
     /* Return a 32-bit mask which should be applied for this set of 32
@@ -429,8 +434,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
      * want to allow splitting of redistributor pages into several
      * blocks so we can support more CPUs.
      */
-    cpuidx = offset / 0x20000;
-    offset %= 0x20000;
+    cpuidx = offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
     assert(cpuidx < s->num_cpu);
 
     cs = &s->cpu[cpuidx];
@@ -486,8 +491,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
      * want to allow splitting of redistributor pages into several
      * blocks so we can support more CPUs.
      */
-    cpuidx = offset / 0x20000;
-    offset %= 0x20000;
+    cpuidx = offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
     assert(cpuidx < s->num_cpu);
 
     cs = &s->cpu[cpuidx];
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..ab88d14867 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -37,6 +37,7 @@
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
 #define GICV3_REDIST_SIZE 0x20000
+#define GICV4_REDIST_SIZE (GICV3_REDIST_SIZE + 0x20000)
 
 /* Number of SGI target-list bits */
 #define GICV3_TARGETLIST_BITS 16
@@ -295,4 +296,6 @@ struct ARMGICv3CommonClass {
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                               const MemoryRegionOps *ops, Error **errp);
 
+int gicv3_redist_size(GICv3State *s);
+
 #endif
-- 
2.20.1

