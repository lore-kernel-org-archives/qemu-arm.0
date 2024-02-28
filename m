Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110240dlb;
        Wed, 28 Feb 2024 01:33:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDezNjI1rxhvR4Pi1gb7qlPRz2qROVz+n0RhNoR5ALZpZnzjZq86DuaFRMly95Lou5AfqeKlzW5K+wWZF+1O/vJp7X7exu
X-Google-Smtp-Source: AGHT+IGNQdywMVwWY/MSx/vjtwiO+fHe3R40TUaW8hIvZx0YyoIRzPejCC89FWNUVHkWmBNkzHl1
X-Received: by 2002:a25:aae4:0:b0:dc6:f055:c16d with SMTP id t91-20020a25aae4000000b00dc6f055c16dmr2123797ybi.36.1709112800846;
        Wed, 28 Feb 2024 01:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112800; cv=none;
        d=google.com; s=arc-20160816;
        b=R7H+1PhO5QwfbMZD8YQd0HUEc4dOgJrZFNelOPB+M4ZwGePHr3upO/xHIc8tlhTz5y
         TkTJrQ+wJPbWC90tlSNvS9IPPv3/jcraFP6NaWchtg3lSLqGDpFfysdX4pvJAuBCiXHL
         zbGCQvTICROiydsoras8dXcFCA6U39CWNVrHagKaDBN6ZWqNCvxihMQjqe9uKhcQL3UI
         W+oRVgTMcgn+aVGVCVe4WtLRFqQc8SijTBjnxlQ2GCv8BRGAtzrvnHBIXcuFy7TQrRzC
         wb1BK3DzKXYy1anGWcqlEkDRl0CI6ct0i6wTg4CKS7woM2GQokc6LHs1Ck2gf3LHMfzV
         ElNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=M2Uy5i5qvzpAhvD2FgxT9EaUlBDilD6t9YUoZwRT2Xw=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=SksJn+92Jbp6k0baozMfs3MqALVLy18tn3s91Oy4OphaC4ZlewwfiDXL9JPcWCdsEx
         cHBhyFaZ2eVGFmunIoc5Ldr/01o7PnuvJoHUTxhVXoUbhLEcryFjc2g4gvOKZCV9Gx3n
         cXlG2uYP4R/Gkxv5Eh0djkc5dPKHgYqhT4ryk2Qqc+cdBiKERGcH8pGtuBocc6epS9gR
         OXyGS++mNzcvXUS82MZawgI5sOdhkfYQu7Oh8TT1p3RamzP5RTxg8FCAOk0eNjVtoegp
         weODKx6mMcjIKccY5tmbvcRpnqfvLqJ68rPORo/EZfE/oV+6dmkX1kvQdg4MJco7EyXa
         63GA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27-20020a05622a1a1b00b0042e7ece3bbasi7830742qtb.801.2024.02.28.01.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:33:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHW-00018H-6l; Wed, 28 Feb 2024 04:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHN-00011e-BM; Wed, 28 Feb 2024 04:31:09 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHK-0001WH-7t; Wed, 28 Feb 2024 04:31:08 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Tl8FK5T05zNlnx;
 Wed, 28 Feb 2024 17:29:25 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 48DF4140414;
 Wed, 28 Feb 2024 17:30:56 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:55 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 07/22] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Wed, 28 Feb 2024 09:29:31 +0000
Message-ID: <20240228092946.1768728-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8ZAlUCjTYgsU

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

