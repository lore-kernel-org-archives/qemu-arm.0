Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659504ejh;
        Sun, 7 Apr 2024 01:22:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVpaAI9sFc//Exx9et9DMIRVQs5qsDirXwOkIfo93goJZADU9baUyblCZM+k4HiP7SGzD4nZPc1ZZm/k31vMG8uFYnIdOg
X-Google-Smtp-Source: AGHT+IEC2K/4U8rLikTiOFvzvGCXh5iUkh2zi7kNpxNOTXzon4bSchvxTeow2rCWmSj91zWoO2CW
X-Received: by 2002:a05:622a:2c1:b0:434:714e:ed44 with SMTP id a1-20020a05622a02c100b00434714eed44mr4701376qtx.50.1712478123350;
        Sun, 07 Apr 2024 01:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478123; cv=none;
        d=google.com; s=arc-20160816;
        b=l8mp6DbQIif7eAqaiOTTSKYYZIHieYWxXkEOIJ91bFI1mV8C4QSK+NGcju/XCjzxSB
         uKLFhdrj8cT1lEW/dViFxJjMWeLlrBilENrxIPTKGHwgpzP7DwT+Xx8A3LUUhCjiutwo
         oFJtqfVS5XZ2vFw/iIBpzkAODEYoOE69OJ/KEaP/YCoupAFhbubRVqlZ+4meKnFaUuBH
         PzpMQZnl3uSWYj1F0B/vmcciJhVdWGovgl3CLwRtPzEGn8jaAgmlgC+mY4vDTjgOLCa2
         yn+HxSSJSPdB+VwxkUqm86TSO9UvlwpbzQXWjGr7cq73/uMvfJQR4CRjfGbuGrTZzz6g
         31Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=NgOWQtGdk5wqkRCmtzHbdtl3s3K4oH3bp5vMXkRgukI=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=r1LB1s1ijzMdyTyfrKAvuEv3xB89DCS1zTa+3TFEcRC25FKXDXcivBSg8yVpqNizcB
         9okAtucD06bd8aFKGfWzbViWGu3GJagF3S8PfqyAWfmEM/r23Zp3gro5Iin4WNlnjoGE
         o9SAtlKz5WkWoiWfvvroEg1U0rWsyNphdPaTN87+H9lH6f/DUSpp5ogb+XHQzXCzr/1B
         we8BJig8sc79kgE59oviHMTZhdu8JhHfZG+LGyWHdmzVZcF6AYypltBylldnAOm2lrst
         XcDkcRBnEmFNs7+cXiZTHLe1RJa/vH7R2gK9YLWs25YAjkpOjZ+J7kJPKf+PWL2FS3bz
         4S6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac85941000000b00434686da9d0si4109208qtz.627.2024.04.07.01.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtNlJ-0004Su-4m; Sun, 07 Apr 2024 04:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl2-0004IJ-Nz; Sun, 07 Apr 2024 04:20:09 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl0-0002Fl-A5; Sun, 07 Apr 2024 04:20:08 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VC4rB6hzNzbfPW;
 Sun,  7 Apr 2024 16:19:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id AC9F9140154;
 Sun,  7 Apr 2024 16:20:03 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:03 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 16/24] hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
Date: Sun, 7 Apr 2024 08:17:25 +0000
Message-ID: <20240407081733.3231820-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dOxOkKbLHFsx

Add GICR_INMIR0 register and support access GICR_INMIR0.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v11:
- Add new Reviewed-by.
v10:
- gicr_isuperprio -> gicr_inmir0.
v6:
- Add Reviewed-by.
v4:
- Make the GICR_INMIR0 implementation more clearer.
---
 hw/intc/arm_gicv3_redist.c | 19 +++++++++++++++++++
 hw/intc/gicv3_internal.h   |  1 +
 2 files changed, 20 insertions(+)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8153525849..ed1f9d1e44 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -35,6 +35,15 @@ static int gicr_ns_access(GICv3CPUState *cs, int irq)
     return extract32(cs->gicr_nsacr, irq * 2, 2);
 }
 
+static void gicr_write_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
+                                  uint32_t *reg, uint32_t val)
+{
+    /* Helper routine to implement writing to a "set" register */
+    val &= mask_group(cs, attrs);
+    *reg = val;
+    gicv3_redist_update(cs);
+}
+
 static void gicr_write_set_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
                                       uint32_t *reg, uint32_t val)
 {
@@ -406,6 +415,10 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         *data = value;
         return MEMTX_OK;
     }
+    case GICR_INMIR0:
+        *data = cs->gic->nmi_support ?
+                gicr_read_bitmap_reg(cs, attrs, cs->gicr_inmir0) : 0;
+        return MEMTX_OK;
     case GICR_ICFGR0:
     case GICR_ICFGR1:
     {
@@ -555,6 +568,12 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         gicv3_redist_update(cs);
         return MEMTX_OK;
     }
+    case GICR_INMIR0:
+        if (cs->gic->nmi_support) {
+            gicr_write_bitmap_reg(cs, attrs, &cs->gicr_inmir0, value);
+        }
+        return MEMTX_OK;
+
     case GICR_ICFGR0:
         /* Register is all RAZ/WI or RAO/WI bits */
         return MEMTX_OK;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8f4ebed2f4..21697ecf39 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -110,6 +110,7 @@
 #define GICR_ICFGR1           (GICR_SGI_OFFSET + 0x0C04)
 #define GICR_IGRPMODR0        (GICR_SGI_OFFSET + 0x0D00)
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
+#define GICR_INMIR0           (GICR_SGI_OFFSET + 0x0F80)
 
 /* VLPI redistributor registers, offsets from VLPI_base */
 #define GICR_VPROPBASER       (GICR_VLPI_OFFSET + 0x70)
-- 
2.34.1

