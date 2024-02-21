Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1990525ejb;
        Wed, 21 Feb 2024 07:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUossMUUfg0BZwC/OFd520YOPjeH1Y7xkCKaOMRI2+sk4bbZ2Xdjuzk1PjoOUQjBfStFIQa1os3bpm/kjIH4gZgDxOEJQoO
X-Google-Smtp-Source: AGHT+IHFR5M79iEwUPJcZv3Ty5v5X6Ze4h3fszxs/Ttr7M7T6BJI78bDOrFKjWLojV28xSTMoJuh
X-Received: by 2002:a0c:cb03:0:b0:68f:52b3:57ad with SMTP id o3-20020a0ccb03000000b0068f52b357admr11602182qvk.46.1708529424211;
        Wed, 21 Feb 2024 07:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529424; cv=none;
        d=google.com; s=arc-20160816;
        b=fTNdg6d7D1wchfp78/rO7NFQ4BA395/8orZePpjlwr5ma07nGsD8SLS83EDckCIGcb
         1cKhb54VNVMMEGSRbLVhHQM3Q2bL7TiRtUd6chf3wSwffSpYOWyrjY8WWNOvN/uaoly5
         M/PLZDDVBjbhwJUWm8WhawFVNlEfVTSimjuVrhc/RFbyVEkWogWkBRJy0vpzYDlO1ddd
         CufXrRYXJmIaun2SdFBCDud+qtHR8PsMGN/rQJwqvhjspRU7xTI5nQhQXW0ypssUkcBU
         OE1/xdJPJZNn3CrAqVld785iBaVk5A5R15YLMcr5AI0GfRKE631NEaglunE0MEqHkTbx
         ve8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=AP0vRndxyzavblfdljz8Ch5ekNLwcxhz21EI1N0rnLo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=iaUpHdkzqmwq+HMSKk91U3Ev+YaEq2N/5oK6bTB9ax8cG3KecPtCIoEP4ii2tqSrX0
         KHHBllZ9bhVbhOF4/rcM56SvxkaPCoC0jSe0g0sAsd5qGQEGzh2M/lOYkJBUTc8MU/b0
         THupauupJnzPd6oHMzu4KYF9HMPSF8r60BY7K97DWI8NI3nzih/z5LVSxqkz5QSSR/sf
         rLCF4qWOC/0/8Z8AWqALFZ1W2iMMGymZGvW8R3Q80wJ3tm/riqHI0i8OGDQu/nkERJJC
         7PP8KPslUxuv08JTWGMqbkLulEFUawCI0UV6UC1OyeUAdGAEKlzq4b4doYiCKnBKv6c9
         ZaGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv4-20020a056214240400b0068f3deec538si11560563qvb.254.2024.02.21.07.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoWm-0007Fb-Dn; Wed, 21 Feb 2024 10:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoNr-00006H-38; Wed, 21 Feb 2024 10:19:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLy-0004rU-EH; Wed, 21 Feb 2024 08:09:39 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxQ54ypPz2BdDj;
 Wed, 21 Feb 2024 21:07:25 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A092E140154;
 Wed, 21 Feb 2024 21:09:34 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:34 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 15/22] hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
Date: Wed, 21 Feb 2024 13:08:16 +0000
Message-ID: <20240221130823.677762-16-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: blwUzX8Ft3f8

Add GICR_INMIR0 register and support access GICR_INMIR0.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++++
 hw/intc/gicv3_internal.h   |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8153525849..87e7823f34 100644
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
@@ -406,6 +415,13 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         *data = value;
         return MEMTX_OK;
     }
+    case GICR_INMIR0:
+        if (!cs->gic->nmi_support) {
+            *data = 0;
+            return MEMTX_OK;
+        }
+        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_isuperprio);
+        return MEMTX_OK;
     case GICR_ICFGR0:
     case GICR_ICFGR1:
     {
@@ -555,6 +571,13 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         gicv3_redist_update(cs);
         return MEMTX_OK;
     }
+    case GICR_INMIR0:
+        if (!cs->gic->nmi_support) {
+            return MEMTX_OK;
+        }
+        gicr_write_bitmap_reg(cs, attrs, &cs->gicr_isuperprio, value);
+        return MEMTX_OK;
+
     case GICR_ICFGR0:
         /* Register is all RAZ/WI or RAO/WI bits */
         return MEMTX_OK;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 29d5cdc1b6..f35b7d2f03 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -109,6 +109,7 @@
 #define GICR_ICFGR1           (GICR_SGI_OFFSET + 0x0C04)
 #define GICR_IGRPMODR0        (GICR_SGI_OFFSET + 0x0D00)
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
+#define GICR_INMIR0           (GICR_SGI_OFFSET + 0x0F80)
 
 /* VLPI redistributor registers, offsets from VLPI_base */
 #define GICR_VPROPBASER       (GICR_VLPI_OFFSET + 0x70)
-- 
2.34.1

