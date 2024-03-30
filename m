Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320800ejv;
        Sat, 30 Mar 2024 03:35:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUxId8izCE8q/31A5u0/7L2yqhzL5TXgILnuQj/FUx+9sgpndPHxEdTf28DLnk+g9JGNcgwfH105Mg45rTHzMs1EY7z4pb
X-Google-Smtp-Source: AGHT+IGFfNuGGdJIbat59gtgId67wwU/gQ7HHwVCH12fXUlN1lpOJO1uCcbjbEtXErPA6fUu+43S
X-Received: by 2002:a05:6102:3bf8:b0:478:5d59:74cb with SMTP id be24-20020a0561023bf800b004785d5974cbmr2333472vsb.18.1711794953178;
        Sat, 30 Mar 2024 03:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794953; cv=none;
        d=google.com; s=arc-20160816;
        b=nieAHH4JRljR/enA2/Fi7CaTuGhj6HJd7zCs/7OcGvtvBxx2qcz2hit1AqgS/4zp/h
         Xhpev08keBAjp/9slMotjigbhrG4OlBMvqWxBpIRVqcui8NKkrtgOEJFPW/aQkIbbvQh
         1R8jwLHnd3ZrnHgB0cFUdElhCO1Up+Wi2ihronpths22yib7p3ZRwLvZJfMquAhJUlfG
         3iDud1/4rfyXbgvr9vfeIVUY4CTxZ/zd777m3x/LpatbXcx7/LC3BkcIlHeuwKBteuIV
         5jURuAA7OnhZG0zGepgH6qgYWf1QmhekNwElYvI1eK4JI2hQUq2M5L8KRVxA6aOaNsLb
         Kmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=KtbXuNedkCN7U67B0FyLribJLBzUSX2+OFB41iNAPt0=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=fcZh54U6ZRL5NAiaWEU5t4hpO/3v+aJod1mnupOOcsDyOOJnxSrX6AszIeflKtEq6i
         7Eek/FwaCD64TZMkuTMyks0glVu9HazK9EJqGTwIQCa6zOZ3DJLlJhp6IpptqK/rb8oh
         1ivQKVknp4HEWxIEWCurtXLrbiZlZkbktbVmDjQAkdgp+42f4XGyz/jh3VDu57k4pFaN
         BAH3jtANnUNygfPp2EXKM6A0IP1X7PQCb2O+nU6O4p/XXQi5G8NI9tluRv+Lay0QJgbL
         HHW/O5Yi9L13vx2kDoJA2jw0koD4dmhJK7IWU/L3eW2T4Z9JupLy54r8Bsa1yevs4xv1
         siJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ad44048000000b00696d63b92fcsi5569010qvp.384.2024.03.30.03.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1T-0000Oy-1O; Sat, 30 Mar 2024 06:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1O-0000Mf-CQ; Sat, 30 Mar 2024 06:33:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1M-0000qW-61; Sat, 30 Mar 2024 06:33:10 -0400
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V6D7L5J3Lz29lVh;
 Sat, 30 Mar 2024 18:30:22 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 026911400D3;
 Sat, 30 Mar 2024 18:33:04 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:33:02 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 16/23] hw/intc/arm_gicv3: Implement GICD_INMIR
Date: Sat, 30 Mar 2024 10:31:21 +0000
Message-ID: <20240330103128.3185962-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: omyXt11jvioJ

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

