Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484944ejv;
        Wed, 3 Apr 2024 03:20:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXok2HnGMZ3fGdt0No7JRIThY30kiw3txNScfCgtdnmMSOjF3swflA+Q8V2K0tIcARYeLS5AWLM+ABPdFWc7nRQIFltYIxD
X-Google-Smtp-Source: AGHT+IExjQ02rrC+p7DISA9ORjZEXcplyjd3gzA2vARPi5UN6LS7d0sl2Tuep9Tw6TpdNVtWlo3Z
X-Received: by 2002:ae9:ea03:0:b0:78b:e6a3:8750 with SMTP id f3-20020ae9ea03000000b0078be6a38750mr2046367qkg.38.1712139628477;
        Wed, 03 Apr 2024 03:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139628; cv=none;
        d=google.com; s=arc-20160816;
        b=XDoweE2WPgKbSWhdwXKKhH3hN2RRpqkPWfTg8zLmLlh9jrbx8lnuCnPGcYdKnSjHdR
         PW2/RxJm0n5PthekgpS95n+MLdiF1U0NIZCOeEi9AOBM9LZo48labLhu1+MAoaPyc4Id
         8zA74Z8IscreSNG02cif0oCGqaCdyhXjm5nPgTp3FlhgJdvKQBiNpZ11g1mC0xX3voEL
         xo8bs0/CYIfTXid3Y6BO81Fs8J471KqYGzVh51EPsO1XR6bYg9YicszHI07LzzmZUQmK
         NhihYCepggJMuqv/+AQgmf/mqBvHYR0BybMczg5VQskprFaO3shYr1I6ndTlyw2bnkZt
         K/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=KtbXuNedkCN7U67B0FyLribJLBzUSX2+OFB41iNAPt0=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=AHZQGDcnSJ9+jKoKF2LvTV6O29jaWz5KTh1/wHVusr1osNTQCS4wPH9HwxlGqOKWs8
         sLdKmuOlki6qQPnvxN3fghhfGHVi0w/M1G4z34ayaeZ2EjDJruwVVwf3RUTYW/vidFTJ
         wNWQ0K38w6B4sc1lKAGbVQEK/lFyY/6FxER8NEbvF4oCeCKEl36JTJy1QFcSZ/lVs591
         NyA6pMRIMUG1/AXQAN+nimF09CndXznL4VY2speJfcmgMU4VENtOepl9v8MNJ/4DRk0j
         VG1ENGxaZGzpKFwh3/b0/KiNf5uZnvuYyZ7Y72p8YzOGW4ylAZFoOzliUqQ4bvCAbwOF
         eF+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a05620a0f1400b0078be9dd4553si5138409qkl.419.2024.04.03.03.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxhP-00016D-2P; Wed, 03 Apr 2024 06:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgz-0000tJ-OJ; Wed, 03 Apr 2024 06:18:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgu-0006g6-2p; Wed, 03 Apr 2024 06:18:04 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gfL4tHfz1GFMG;
 Wed,  3 Apr 2024 18:17:14 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 25D5114010C;
 Wed,  3 Apr 2024 18:17:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:52 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 16/23] hw/intc/arm_gicv3: Implement GICD_INMIR
Date: Wed, 3 Apr 2024 10:16:04 +0000
Message-ID: <20240403101611.3204086-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xi7KYxRgDQD4

Add GICD_INMIR, GICD_INMIRnE register and support access GICD_INMIR0.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v11:
- Add new Reviewed-by.
v10:
- superprio -> nmi.
v4:
- Make the GICD_INMIR implementation more clearer.
- Udpate the commit message.
v3:
- Add Reviewed-by.
---
 hw/intc/arm_gicv3_dist.c | 34 ++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 22ddc0d666..d8207acb22 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -89,6 +89,29 @@ static int gicd_ns_access(GICv3State *s, int irq)
     return extract32(s->gicd_nsacr[irq / 16], (irq % 16) * 2, 2);
 }
 
+static void gicd_write_bitmap_reg(GICv3State *s, MemTxAttrs attrs,
+                                  uint32_t *bmp, maskfn *maskfn,
+                                  int offset, uint32_t val)
+{
+    /*
+     * Helper routine to implement writing to a "set" register
+     * (GICD_INMIR, etc).
+     * Semantics implemented here:
+     * RAZ/WI for SGIs, PPIs, unimplemented IRQs
+     * Bits corresponding to Group 0 or Secure Group 1 interrupts RAZ/WI.
+     * offset should be the offset in bytes of the register from the start
+     * of its group.
+     */
+    int irq = offset * 8;
+
+    if (irq < GIC_INTERNAL || irq >= s->num_irq) {
+        return;
+    }
+    val &= mask_group_and_nsacr(s, attrs, maskfn, irq);
+    *gic_bmp_ptr32(bmp, irq) = val;
+    gicv3_update(s, irq, 32);
+}
+
 static void gicd_write_set_bitmap_reg(GICv3State *s, MemTxAttrs attrs,
                                       uint32_t *bmp,
                                       maskfn *maskfn,
@@ -545,6 +568,11 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         /* RAZ/WI since affinity routing is always enabled */
         *data = 0;
         return true;
+    case GICD_INMIR ... GICD_INMIR + 0x7f:
+        *data = (!s->nmi_support) ? 0 :
+                gicd_read_bitmap_reg(s, attrs, s->nmi, NULL,
+                                     offset - GICD_INMIR);
+        return true;
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
     {
         uint64_t r;
@@ -754,6 +782,12 @@ static bool gicd_writel(GICv3State *s, hwaddr offset,
     case GICD_SPENDSGIR ... GICD_SPENDSGIR + 0xf:
         /* RAZ/WI since affinity routing is always enabled */
         return true;
+    case GICD_INMIR ... GICD_INMIR + 0x7f:
+        if (s->nmi_support) {
+            gicd_write_bitmap_reg(s, attrs, s->nmi, NULL,
+                                  offset - GICD_INMIR, value);
+        }
+        return true;
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
     {
         uint64_t r;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 21697ecf39..8d793243f4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -52,6 +52,8 @@
 #define GICD_SGIR            0x0F00
 #define GICD_CPENDSGIR       0x0F10
 #define GICD_SPENDSGIR       0x0F20
+#define GICD_INMIR           0x0F80
+#define GICD_INMIRnE         0x3B00
 #define GICD_IROUTER         0x6000
 #define GICD_IDREGS          0xFFD0
 
-- 
2.34.1

