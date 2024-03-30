Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2319663ejv;
        Sat, 30 Mar 2024 03:33:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5LA3XrED20VN6d+IurgSHpAXKC1NOBrgBbizZ3ZKeRu6DIFgwplTUOOxq4xFqlrJ1XTjJA2+6+1phYn63KOM1+WQ5Ma73
X-Google-Smtp-Source: AGHT+IHvLHaXC48Nzscrat+GiRO59xI8FO6PcuRhTHWFuaURGe/tOnkY/1OG4FX/dIFoowI/2KUc
X-Received: by 2002:a05:620a:811b:b0:78a:303f:700 with SMTP id os27-20020a05620a811b00b0078a303f0700mr5054555qkn.23.1711794791533;
        Sat, 30 Mar 2024 03:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794791; cv=none;
        d=google.com; s=arc-20160816;
        b=RiTMWMHX6xZ+4fxyLduh9KGa5/7e4IOG6jHRZjq3tx6WMGWuyeKWWToLyk1xRu+fnZ
         A87IDwx+zmZpTb3HDUFg3PooEfq6FJAlcASaxeG/KJ/FyNe9l+qiguq4OF0Ut25aYvfL
         E9FJC+bWxydXqmhgvRvyrpgPBItvVgq/OzojmZQeiiBHkEc94mND4aVFKgWjh22DZ6t0
         xmHNtLGk15Vzgpsulicfqtbw9KqLlkTv7g0mSVHFMziTczpfAOLQV6JcuTb1s5b7sPD+
         p39lhC472MWjtQJUmLlDtPXdAGvdIEFEkXOYY7UJItTdIk2uG71MRRmfl3BnI1qcuNyi
         NVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sjTBjROnrHgw0Da/ogYSEdNj0V5fm8jSfy87Ch9m28A=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=RgYtsJodN0lv0jCaTGu6N2eWpKezuJHeDTDhtVCZrye+ShZe2U8wEMTlwKOUyCxB2/
         iZ0rESVh6BgZmMyCR64Q4w41Z7kQSPqC3y6yR5GDTfrwaz7eMKU6wSrqO+qtwX/HYY2H
         D9BK3anxXseRhh+UjFyVEbHTQi7fU1s0OkDRfIEVey+CTLYtMk7FDl75BVr2D5bNRguy
         jp56mbVFavWzldgGi1MKSfCR8lcgJyuw7twc1goMiKREGzT/MYJZanhUSRij30FokPjx
         KqapzZRKapgAHTM3/q3g2Knor2SQ726kyajQmRJL1EM56wUs4A9CjokdZPOeb36853I1
         W6Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xx18-20020a05620a5d9200b00789e8a07d19si5503088qkn.653.2024.03.30.03.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqW1G-0000Dn-6P; Sat, 30 Mar 2024 06:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1F-0000CX-Bg; Sat, 30 Mar 2024 06:33:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1C-0000kR-Jc; Sat, 30 Mar 2024 06:33:01 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V6D9d63s2z1GDs5;
 Sat, 30 Mar 2024 18:32:21 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id EC03E1A0172;
 Sat, 30 Mar 2024 18:32:55 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:55 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Sat, 30 Mar 2024 10:31:12 +0000
Message-ID: <20240330103128.3185962-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
X-TUID: +wawMKF3Lagn

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

