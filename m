Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp112467ejc;
        Mon, 4 Mar 2024 23:07:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9rgLN9xKzx7TEq9fPDuBcoN5TXTJLoVSJ2AvKwAXBzmE4rEvECESMkiPYo35xPMOhh3NvKh/F6dLBJZmfuxRd7xO871P/
X-Google-Smtp-Source: AGHT+IExDXwVt6j59J2pOwccGQFa+DHDOj1X51G/EFR8uumX+2PJDvgAEc8nIsRgphvV8alVzoxI
X-Received: by 2002:a05:622a:d0:b0:42e:bb8c:6344 with SMTP id p16-20020a05622a00d000b0042ebb8c6344mr1388840qtw.9.1709622460682;
        Mon, 04 Mar 2024 23:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622460; cv=none;
        d=google.com; s=arc-20160816;
        b=TeI81c58qVKbyMf3Hc1fThZzIY8bkbLHizAAnGxagkVMAZQxYwX7eEXgzWDB7LpihH
         UbKNMGXPLXHIJvbKHhn1SrHQ8x4E/wiRK0go6wiltbVINjQwoIEX/ETfDZix2r4sefOt
         1MTt/6ilKpfhfzA73l++CFMw8trspIxnHJvsaCcDQYAfYQLIvOL6yRTTqToB0UiRn01K
         q9b2tzSzpbZebCIiYLTcz58ePCXrGbjA7LkRmSzjT0woKf9LYwA9WUkYDNSqrCjrwBnr
         mYO1FEUwu7kw39EJVYRoSaGH26JvFGEiP1LAQ1BZqchyAPiEURH2MCdC6gFpAyhuzTsk
         RyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=cQD3b1AsvYIP1bf6AxoUiF93dn1KvYfuOJw+RxnR8so=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=dS7X9D/gng2jD9qk40II5cMS5xjni247/2NouPMrbUteDuDk6Z0rYio5HQetITnVOf
         pBIplWxCaFT9n3vJrRaYMJoVigEQVAQTlD2N0CAbxM8DHC5RrW6/XXv+P51Ln0OqGhsZ
         3wyVAvOuC3pub6+/4jSm8BI6KIO3nEtF4Uy7WLnPBZcIVf1ZCINBsEPwLVoBG9ztOIBy
         Gfh6n89MTyNBLB1BX0AkUoB1derl8S3g9Rizys45+OM+WSyidM8rdfWMBYcnGLONBHz0
         lUV763NGtnmrdJ/HlDiKS1lhkRgvUrpShYU7qujMnul5ilNtcaj4c9iXqMnbgFXnRaei
         UG8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020a05622a105300b0042edf7be512si6695073qte.483.2024.03.04.23.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhOsy-0006Ka-5E; Tue, 05 Mar 2024 02:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrA-0004Cl-3m; Tue, 05 Mar 2024 02:04:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOr3-0008SC-9Y; Tue, 05 Mar 2024 02:04:55 -0500
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tpmhy17Pfz2BfJN;
 Tue,  5 Mar 2024 15:02:26 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 457FC140158;
 Tue,  5 Mar 2024 15:04:46 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:45 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 14/23] hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
Date: Tue, 5 Mar 2024 07:03:22 +0000
Message-ID: <20240305070331.2151131-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: y7hkd23CUOpx

Add GICR_INMIR0 register and support access GICR_INMIR0.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v6:
- Add Reviewed-by.
v4:
- Make the GICR_INMIR0 implementation more clearer.
---
 hw/intc/arm_gicv3_redist.c | 19 +++++++++++++++++++
 hw/intc/gicv3_internal.h   |  1 +
 2 files changed, 20 insertions(+)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8153525849..7a16a058b1 100644
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
+                gicr_read_bitmap_reg(cs, attrs, cs->gicr_isuperprio) : 0;
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
+            gicr_write_bitmap_reg(cs, attrs, &cs->gicr_isuperprio, value);
+        }
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

