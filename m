Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1991672ejb;
        Wed, 21 Feb 2024 07:31:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0KhFWiCzR6SZqygY4sIcglhxx9ifanJxPwk6LOQpeNJM8FSGYomPP24MT4m+rHRhGA00YtYdZpu896Povi4HshpwTEwsI
X-Google-Smtp-Source: AGHT+IHeTIlG+w4uuzQVs1QCZLvwGoE8bg400ZwguiPHLK3S+qLLS6afQeVbmEyw/gAscdYF3QM7
X-Received: by 2002:a05:620a:a14:b0:787:351d:558e with SMTP id i20-20020a05620a0a1400b00787351d558emr18953887qka.36.1708529517734;
        Wed, 21 Feb 2024 07:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529517; cv=none;
        d=google.com; s=arc-20160816;
        b=WFo3mCFtZaTJR9tc62YIT8ecIK/aBnfUNF609Gn/cXWH0WTKHn9q8W+jfiRtnoqXZ8
         MuAnfgh9HERQHZeI/UPOfIwBljXm4Q0YWNnjgpcgn+ZC5ep/uIbIjM0J63bUfPSLcbgK
         sm6jvY8JRDgG3xSEbBOQDriNIgr0/P3wMmueLk1tO63GO7UpfDP6HSWcGSenysePlUMc
         JVWU+pYfUNuSLqHI/6n2hpGHFNpBvwiKOHVkBEZsDJY0QppAJHcCYTdv4kLW4HzFXkHo
         b2X3lIRBOe6rpccOU95EEHegkv8gzDOUd418EXSi+N5j8vzfpfNpek0jJUmVW0mwSqbp
         dGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vW+YWp/j+S7t+t3fwD/aFDzdyrvz5uXZn7e1LcwEVQc=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=yx0GbT7sKI/bptGuwzl4mkMoHazjY/eZKmTyaiuBh91xyYc6j8pL/X+paGT6/jm/rY
         QC11hFAliFUZkxZbIdYzO4gHPw8E9+Aa72ENFZjqOIrFg6dHj4I5g/VfF1aqHqP2wkLB
         b5clhskzp0x3BGOsWPc5nPNEiqjf0j5D93wH1FojvVzfHk6yQWpl0iDdfUrBIVtYXZro
         N5dUTlEdnKEqeLZOgO33o+BF/3WVPpij3r01luIvEws2qiR1pzl/+rtBPSrYOETzjEEE
         zw5MjzYF/FqcMhoX5bZOOG4SWBo7AFGbnoNug7MEOBBRMQm0fBMWSTmrb91qJ+yEQZxV
         uCqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe19-20020a05620a851300b007877e1802b0si2982155qkn.722.2024.02.21.07.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:31:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoTE-0006Qy-KH; Wed, 21 Feb 2024 10:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoMr-0003Wj-3w; Wed, 21 Feb 2024 10:18:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmM4-0004v1-66; Wed, 21 Feb 2024 08:09:45 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TfxS249H1z1vtyr;
 Wed, 21 Feb 2024 21:09:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C1CB41400CF;
 Wed, 21 Feb 2024 21:09:40 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:40 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 22/22] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Wed, 21 Feb 2024 13:08:23 +0000
Message-ID: <20240221130823.677762-23-ruanjinjie@huawei.com>
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
X-TUID: +IrIPedCPw/v

In CPU Interface, if the IRQ or FIQ has the superpriority property, report
NMI to the corresponding PE and record the NMI interrupt type.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/intc/arm_gicv3_cpuif.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index f5bf8df32b..87bde1f897 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -931,6 +931,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -967,7 +968,10 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
             g_assert_not_reached();
         }
 
-        if (isfiq) {
+        if (cs->hppi.superprio) {
+            nmilevel = 1;
+            env->nmi_is_irq = !isfiq;
+        } else if (isfiq) {
             fiqlevel = 1;
         } else {
             irqlevel = 1;
@@ -978,6 +982,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

