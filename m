Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1984889ejb;
        Wed, 21 Feb 2024 07:20:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU91cHWYq8XvxtDsm5L/WgHp+vhMZP2HZU6lEFoGtQKj3rZ9nUlWhnnkfLER8FjsLTN5Bku7MTarrPO67MBKliByziuPtEw
X-Google-Smtp-Source: AGHT+IFkuOGx7zb34eJnbcnwfcio/mvGQkQH7UFCqNmsM9/9C8zgEuxf810CH99N+nXR2vnNg7Io
X-Received: by 2002:a05:620a:2a04:b0:787:8eed:6444 with SMTP id o4-20020a05620a2a0400b007878eed6444mr1467631qkp.35.1708528836347;
        Wed, 21 Feb 2024 07:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528836; cv=none;
        d=google.com; s=arc-20160816;
        b=zY6W2a7/4xY72jUklvDio4fq2aoZYLHCT55r/9IElPVfvuKOenpZFzdAiPsvyPq8Fo
         Wi/1KiR0nX6GIYQovlGn4PfEa6boBeOhgQWw89jPy0jzRB4zBPI+wuMOuBW/deFjz9Cg
         vNtqhX22xiqr1PuZhur73HOwk0ebcC0aqpiAUlroWoxC6/fFGWRlgIZYJIulhH45hXnK
         ChO0h6ERaG6wZnneOEAVU00u3cx75aue+VEVeIAXb0EXX9l2CFJOryx3YPiYO8Dl3eoe
         KMzPMmgek8OATnvFIVHyn+STB/C5wc2FR2vx1IYf4yBTfIdtFB7WOC52BAPGn0M+w3Ux
         l5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=IEuKhBU7VBmfeX5iiMrXTTlaD3l8Op9RFLMp6EVXCtc=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=O0TE8SUEhkYhdCI2XxAXvD3O2Ny41jr8gQpv3y4nx/X1AdPfkvLWs4KSEli37Ni6fc
         NxeoS6ey9zM0i+fB4lXmybJAYHqCLUx3B4B+yFufb5g0VJUuxo4gtp56NxD5Y9VzDBek
         l18hyL5pd/Dv+zikhOC7gC36WM73I6s9izeZ4krfRiHZLuEt9xEQpHhmu9iTJQ/m1V6p
         5WXx23pA1sVUHRfYytWf+tXLPUquDu/U2x8HqnSmUgsDer7ZBd3otKqEUvt8V3mdFyJ+
         5f/JjEuNgjpYNmpl/eSlPxSiK688HC46w+4lcxwMPGkmcdm/XenjzxqA44vXAS9tZQ4p
         FAXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24-20020a37ef18000000b007876f9058d5si5668215qkk.336.2024.02.21.07.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoOA-0001Ac-Qu; Wed, 21 Feb 2024 10:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoKR-0000wD-To; Wed, 21 Feb 2024 10:16:15 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004ro-Jt; Wed, 21 Feb 2024 08:09:42 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TfxRx28mPz1vtyV;
 Wed, 21 Feb 2024 21:09:01 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7C80D140154;
 Wed, 21 Feb 2024 21:09:35 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:34 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 16/22] hw/intc/arm_gicv3: Implement GICD_INMIR
Date: Wed, 21 Feb 2024 13:08:17 +0000
Message-ID: <20240221130823.677762-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: DmCS6MeMdtol

Add GICD_INMIR0, GICD_INMIRnE register and support access GICD_INMIR0.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/intc/arm_gicv3_dist.c | 38 ++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 35e850685c..2f7280c524 100644
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
@@ -543,6 +566,14 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         /* RAZ/WI since affinity routing is always enabled */
         *data = 0;
         return true;
+    case GICD_INMIR ... GICD_INMIR + 0x7f:
+        if (!s->nmi_support) {
+            *data = 0;
+            return true;
+        }
+        *data = gicd_read_bitmap_reg(s, attrs, s->superprio, NULL,
+                                     offset - GICD_INMIR);
+        return true;
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
     {
         uint64_t r;
@@ -752,6 +783,13 @@ static bool gicd_writel(GICv3State *s, hwaddr offset,
     case GICD_SPENDSGIR ... GICD_SPENDSGIR + 0xf:
         /* RAZ/WI since affinity routing is always enabled */
         return true;
+    case GICD_INMIR ... GICD_INMIR + 0x7f:
+        if (!s->nmi_support) {
+            return true;
+        }
+        gicd_write_bitmap_reg(s, attrs, s->superprio, NULL,
+                              offset - GICD_INMIR, value);
+        return true;
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
     {
         uint64_t r;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index f35b7d2f03..a1fc34597e 100644
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

