Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564660ejj;
        Mon, 25 Mar 2024 01:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjAzi6ihAja7r+n+EPt7P9eyhGWc+o5ipYR2AVPE4GcyItisDdvgnCTcB9vHVeLkjWahEiSE9GLK9PYWXXorHEED3VB9GT
X-Google-Smtp-Source: AGHT+IGPH+NLVQHDqd+xjs/195AqXCB7Vv9qFT/T/MkvBXkCsqLxxkt1vwdrwB2/HuhsTPMJbem5
X-Received: by 2002:a0d:e2c4:0:b0:60a:3487:6f74 with SMTP id l187-20020a0de2c4000000b0060a34876f74mr5446334ywe.7.1711356888705;
        Mon, 25 Mar 2024 01:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356888; cv=none;
        d=google.com; s=arc-20160816;
        b=c6aatB/Edbftgl/RaNCocQr1PBFbqnXzcNH31YP0bzRYcO+Mn8PGWSbF5NtXvAwZ3k
         6C0/ZJDlT/1i39dWsbMk2gNUxSEXcBjo+X4W5EvU8vZt7p/uVcOdxG4fpaWYVaulLBKU
         nkh7D8woiEr1s0yAhQtRTjqKh4yig0B1LLzg72HDniB+mysByGy6orE1bGffOOqcSeE5
         fIWlUP/4sJMicfcX9K+iw1oRijf12ip5NC0cetH9NbMl63bxIG1bVFHA+97nN/u9J5y2
         tlx6HAhixUMYToZ+YVz5ulm+WPKdyA5u5sYkvknpU3uN8GKpdYIS1WntJ9yJg1pjy87D
         T0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sjTBjROnrHgw0Da/ogYSEdNj0V5fm8jSfy87Ch9m28A=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=ZtYK7gaSYAEtO/62Ioujaf6mAqtXtHRtXobJq2slLbiDjSfHAQ6lChCFCt5OJPyAU5
         BiI+Tz1SQwnnJmsSpxjPQOwfjurwrGpfVskfIz2B469ZTy67WkFqauFj74HNCdoQsV+l
         IaN9boMuJ7ICKedqTofYxqF6D54keSXTUxKpvk6+OjPfG0ZfBHHyZ8gp5udf+xibUHTD
         VsSaZlOrCyxJfM+FiQIaRaiKDx/OM9XR0GZtJQ0LqB8T/eJpvAkXcsfGkm2GdUpf61SS
         lOcDo/cBoStLp9ui2RFwgXA4IR80XLA5M1p+iG3FbHZ/3a3YyqjTWJg19pdZVRRfA2MG
         e6sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a05622a175300b0043135d5d8f0si5105747qtk.68.2024.03.25.01.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rog4I-0003CX-AZ; Mon, 25 Mar 2024 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3w-00031D-6W; Mon, 25 Mar 2024 04:52:13 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3j-0007OY-Iy; Mon, 25 Mar 2024 04:52:09 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4V367K25jSz1Q8lf;
 Mon, 25 Mar 2024 16:49:33 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A94031402C7;
 Mon, 25 Mar 2024 16:51:55 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:55 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Mon, 25 Mar 2024 08:48:38 +0000
Message-ID: <20240325084854.3010562-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8aUW/WLU/cXn

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
index 1868235499..077c9a6923 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10760,6 +10760,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     hcr_el2 = arm_hcr_el2_eff(env);
     switch (excp_idx) {
     case EXCP_IRQ:
+    case EXCP_NMI:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
         hcr = hcr_el2 & HCR_IMO;
         break;
-- 
2.34.1

