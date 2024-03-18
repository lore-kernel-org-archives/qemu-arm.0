Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521032ejb;
        Mon, 18 Mar 2024 02:38:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7a9/Dha2iI3Q/bTFmKW4HTi58uz9Px+7S32vUyS01jx+6ni4MokSljMJY9p3mwWxeQjDitQH9gVqyhVSVBt/NpYlIuD8U
X-Google-Smtp-Source: AGHT+IF2JJE9ONfL5pJYRKUcnXZWpBmvAIkyxDLlUfNQ65D0HEqIyhp48UnWVXKr6sL9rIKXO2yM
X-Received: by 2002:a0c:f0d4:0:b0:691:629d:d26b with SMTP id d20-20020a0cf0d4000000b00691629dd26bmr10583609qvl.35.1710754710470;
        Mon, 18 Mar 2024 02:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754710; cv=none;
        d=google.com; s=arc-20160816;
        b=wfdv/6hCWGtz0sxn0zfTpnBXjE/WpZ1Hg7LmPilZ2aOnmFP/mxML4kNjTNbfPs1dZ9
         p2zCp6V1Ki01cLpNcwRjt+TmA8kwFaRWKB2EDCB7wz9WLPi/jFVTDhJGtHOAjL+K1dVG
         dlcCpRBhm5KbtbeQRyFcgz4YpZE4Gl9mbJpvUhc75wK/hgl4a4u9xblE0a/fNn9/N6t3
         Tq78/wn/nz09vikPhZ6iEZSoRc7Tc2nnhHvyiporj64f6AYsIgYuMfQAQ6iS/qulBiss
         7nyPVKrNrGvd9fSnXPP1dExFV6r5WrUJzBAQ08cDTHFtfTSlyll16HzwkjqUbFWio7pr
         kUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ZqY8n+yDwMLvum7gzrj2w7BTgDdmnUMdCAI4hI7MEPM=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=AshVU8jaSm2Kf6al19WQlGJf0n/tWWAa9f9v1jNKmNUxDrsjLxL6Z0+h4aDp4wJdqb
         sr41M2zbfjDHVclk1j28O3JBB9QFEA7SYSsJbXFDpXWX4/d03gh3g9yAN3EXGa9Pob48
         um0NlFjaFGJjnZyEELJp+GrDRBl327tfcPjigsZL9ChVDHp23xkfDZsO4R5vYn0s+fAT
         79HhMKFACobHGhj3FjHL7eDml64VtSNzhnxAg+vXqQyb7emvNhC6GtJWIiIqlUf/KVX2
         JILyW32bEtoVZSC7auVddWIAEZCMt3sXvs7YIPq1l/zj9BW66V1YaqtvK3kAhH/uNNIn
         Gb2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk14-20020ad45d4e000000b00690ba75f8a4si8076103qvb.534.2024.03.18.02.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9R2-00040u-TL; Mon, 18 Mar 2024 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qt-0003w1-0o; Mon, 18 Mar 2024 05:37:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qk-0000yN-QP; Mon, 18 Mar 2024 05:37:26 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TyqSh5K1Vz1h2jW;
 Mon, 18 Mar 2024 17:34:44 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 2AD031A0188;
 Mon, 18 Mar 2024 17:37:16 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:15 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Mon, 18 Mar 2024 09:35:42 +0000
Message-ID: <20240318093546.2786144-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: HK49uChikQZ9

In CPU Interface, if the IRQ has the superpriority property, report
NMI to the corresponding PE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v6:
- Add Reviewed-by.
v4:
- Swap the ordering of the IFs.
v3:
- Remove handling nmi_is_irq flag.
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d67d62359b..29142fcf8d 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -969,6 +969,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -1007,6 +1008,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
         if (isfiq) {
             fiqlevel = 1;
+        } else if (cs->hppi.superprio) {
+            nmilevel = 1;
         } else {
             irqlevel = 1;
         }
@@ -1016,6 +1019,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

