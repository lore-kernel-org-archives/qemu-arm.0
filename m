Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475775ejf;
        Fri, 23 Feb 2024 02:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVpq/i9Qludqujxj3wvbEK/MyT44YJ2oB2VVse13fLGFAJYUQMkYWfyugCR3rmtumub5gIIFkC7OMRPiEfGuRHKnx0/04KZ
X-Google-Smtp-Source: AGHT+IHz7kn1loR+tMIq7h+C0v5Rq9BP2rhp2sJMae7vkdkDyMIwCTrV6+uzg6QHYZ4JkOFqTWyX
X-Received: by 2002:ae9:c00d:0:b0:787:54a5:9047 with SMTP id u13-20020ae9c00d000000b0078754a59047mr1568324qkk.34.1708684576628;
        Fri, 23 Feb 2024 02:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684576; cv=none;
        d=google.com; s=arc-20160816;
        b=0WwPyGnqrcwbsYFxW7bfALDlzc3Bxvo/uQH77iuIoHPtgyXqSCxQnBXzW/GbE4gTjk
         EhpJ4ZlL0RqPjIxniXGsUaiceHASpq7uorkuqtaWjONlERgsc8nsc4lixrH67c3b/HXj
         I/tO7Q69cnvr2ERVPTbqPF++CaBj8KhydXE8nIEVEW79xPl+HuhJs9TTIN2NNHucBUO+
         Pr4fnERDp8l6Jk8x7dhAZ9u+RWjeZ1XdklzMHbftAbfkf6PtVtPiVD/qYAHBBk6VVcGi
         2DQxnTKL++sz6WE/GGG7kR1PKzhbpezeag7PVIN0Gu21Y53XYgm4SAWZrTj5TjVBOM0x
         PIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=AP0vRndxyzavblfdljz8Ch5ekNLwcxhz21EI1N0rnLo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=t3AslrSmAD2qYJ0mkutveKSZ4XV7MOcyy/L04UhAFbF3+Rwhz9syboKFAlZr1AYPZG
         NCZLLyszASmRgBXTU41wFyWNM1RYoQBb5ptwY6Dp4eiAilHBkMVBxjgVRcGWDf2j5JMv
         rketXstaKuKTLKzWVdrKunqKwYA34VETQM4C+idu5k1UBCOxzmVxsQXDfGLUJoJDIJrn
         Ag2iTmnk1jJ5C5sUW9hsxpsTVNKYxV+5Qx0/BV6g0meyv9USvjIkZW5jGynxFIIQzSng
         zFlTWv9HxpMzTVrWeQrdLs40OssUInboo1MK4/E6scZdPd16BxYJek3Z1lPxPFFyOLkr
         kpjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a05620a13e600b007875c8bb93csi12545273qkl.554.2024.02.23.02.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:36:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdStB-0004CY-2z; Fri, 23 Feb 2024 05:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsV-0003c9-Ua; Fri, 23 Feb 2024 05:34:05 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001wr-PM; Fri, 23 Feb 2024 05:34:02 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Th5pF1gF8z1FLGr;
 Fri, 23 Feb 2024 18:28:53 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 1A8851400CC;
 Fri, 23 Feb 2024 18:33:47 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:46 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 14/21] hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
Date: Fri, 23 Feb 2024 10:32:14 +0000
Message-ID: <20240223103221.1142518-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: igQqfgFKLvBv

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

