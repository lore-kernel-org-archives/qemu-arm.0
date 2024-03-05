Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp111834ejc;
        Mon, 4 Mar 2024 23:06:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXKXTdFHFHoRyPJ6RI3QQf7QwOkS5MF9NSB9e1gRLkxUD5VbHCJ21vm2vxxwPJ0i0RKnIuxEL21KFW6yhtboTl7W7D5emWn
X-Google-Smtp-Source: AGHT+IGBcIcua4cIXe00ehbyMX4/XVFXr5kEobKupxnsRB1egs60N3JeblsPnEzgELjqysHQYoeZ
X-Received: by 2002:a05:622a:2d4:b0:42e:f766:cc55 with SMTP id a20-20020a05622a02d400b0042ef766cc55mr1214223qtx.0.1709622360585;
        Mon, 04 Mar 2024 23:06:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622360; cv=none;
        d=google.com; s=arc-20160816;
        b=LF3kemG5lKX3Kn/zSpJ9qvvRWIz+zC8GNjDk/qHI428Uc2TR+UuZAeCNI+HVyCEYvC
         TN3rt30yK4iOllwoHM1UnnjGJNXkexiLMgoXnw99JCbcZrS2AuQyh3vZyuV1pvPqriaT
         kELSmq8fiHF6BWZZa6DpRysiBxJQC5cPDuBJmJd/oXxnmtBMx2UbygywEnEhvuqXejip
         eSEWLyG2gge1oP8ecFqFmJK9wL0xcDMsuHsoh6ds900s4mPOt9N2jXN7URkx2fwubgOT
         /rLpdwl+RCOzq0U/NuGJUHeoOwOkmB84O5ylwrRkj7vxiMkFFnD3sNIiX4he8jCsTbbR
         m9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=M2Uy5i5qvzpAhvD2FgxT9EaUlBDilD6t9YUoZwRT2Xw=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=tIf3pzGebA2v2WHil+YjZ0aQJ7gyeKirlDFNa8eAuw8FLYkurS736AtUpR9SyCkitg
         PWFf+Gvnxb0HcfY5kCj+EYwxGL/7J5RYrdbaeqSjYMV7HZ1nN0pTyDx0/IvbOZv3H7dc
         HDdtwXB+AMRklqq43orXk+qvnwT/m76/1ljAeYNwaKQKdXWRQTFgPckhjtxl+Au9vpAT
         MJ32G5Egn9AbOi086/yqKoNVRIUwdzkQgnbSGgrCZ89z4U5C1V6SgByOltpMGRCJXIyF
         I7Xgddq0Yjx5OtTI3hZAEWS7rmb08FGloOfHDcfZtVLyqOSOrkTEji+4cZ6Q4YxET8Gq
         I3Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a05622a170600b0042edebcf34fsi7014345qtk.762.2024.03.04.23.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:06:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOrw-0004ZC-NJ; Tue, 05 Mar 2024 02:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOr3-00049j-AU; Tue, 05 Mar 2024 02:04:51 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOqz-0008Qt-EW; Tue, 05 Mar 2024 02:04:48 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Tpmkm4DXgz1vw4H;
 Tue,  5 Mar 2024 15:04:00 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4BEF91402CE;
 Tue,  5 Mar 2024 15:04:40 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:39 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Tue, 5 Mar 2024 07:03:15 +0000
Message-ID: <20240305070331.2151131-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
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
X-TUID: Lp+DpdExX4ET

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so handle NMI same as IRQ in
arm_phys_excp_target_el().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Add Reviewed-by.
v3:
- Remove nmi_is_irq flag in CPUARMState.
- Handle NMI same as IRQ in arm_phys_excp_target_el().
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4b4c8e279d..7cdc90e9e3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10570,6 +10570,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     hcr_el2 = arm_hcr_el2_eff(env);
     switch (excp_idx) {
     case EXCP_IRQ:
+    case EXCP_NMI:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
         hcr = hcr_el2 & HCR_IMO;
         break;
-- 
2.34.1

