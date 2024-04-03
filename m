Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4483812ejv;
        Wed, 3 Apr 2024 03:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHzXEzzz5nYflgp9rmKEGqZgaz5opbMmEa7dVZ+2C0LxH08kgm9vNGRv8skZFNLlgzE6HpAzPbbUe3DBYvuGNpWinZ3QvS
X-Google-Smtp-Source: AGHT+IHXG06fjZI6xM95zbs1cs40esF+/+/wiyaALluIIp1GmcLj7FlNXRJKSWmObUGMXhAkcpTI
X-Received: by 2002:ad4:402b:0:b0:699:616:9853 with SMTP id q11-20020ad4402b000000b0069906169853mr7221492qvp.25.1712139484436;
        Wed, 03 Apr 2024 03:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139484; cv=none;
        d=google.com; s=arc-20160816;
        b=c6j7Cgqvde6ZSzXuFy1GdJ1r8m9SKRvanyEeCRePJRcIaLlkYlwWWyUv8kozmDKkfa
         mOBp6tV0cNmkyKEx5nDi7djkQvTWICPX+a4kIX9H5pAWw/N6rQDX8tGNrjWXsGO9Ftp4
         AnlHgCFhGU+GaBqE5dicql2h7PcHzMNDF14Cjm/NSAllEAbZV7SY24C58cuJl+tQqRUH
         url9hbMWDimnDnRB1RyeOlPpw6xiNUaTCEaytufPp4XEMcPxPGyGODTofKGCAiO6bW0s
         wOsZorBW3fk9Kr3/qxIZgapK/2z2ikwkkfd31m+gqR142Gakjm2AoPTS+DDCQYRBd2wc
         JfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=73X+GC9TTraUjuGz5SGGA/MvY+Hx6lUa6NeqLqGWws0=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=tdX3Kwj4lREonO7yZaqmKfPUP9T0O96m76kTF4j02iRabfQqgTvbWFN/773DzAYXZz
         1ZslmtibZKiJ71dMn4qDoErBMuqbPp66mBW/HOAFUG/+0XzHPrzLAUmzIw+Yrhr0MdBd
         m4CLzXqiSezdZWl1gHqAVnCK9mqJNOoduJAyM4SYLjJ7tewhovcBj1hVpDV8VQERaX5O
         +0q1DP1i6tFVpdpb5HI9kEWM7LYah8CjNFgaRdjnSrQOMi1xztw7eJqYRrVFEc6Ps2Rt
         Q8v37XSALSZStoYdcsUnRRmlFtmvHQBL1rgY+nbd3NfASOwKehdhdKgN/jVCtlBWWNdC
         ggoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a0c8b02000000b0069697d41ae5si13377444qva.371.2024.04.03.03.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxgn-0000k1-8A; Wed, 03 Apr 2024 06:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgm-0000j0-Gv; Wed, 03 Apr 2024 06:17:52 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgk-0006ca-2H; Wed, 03 Apr 2024 06:17:52 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4V8gbz4G8rz1Q9mN;
 Wed,  3 Apr 2024 18:15:11 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B81CC140F81;
 Wed,  3 Apr 2024 18:17:45 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:45 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Wed, 3 Apr 2024 10:15:55 +0000
Message-ID: <20240403101611.3204086-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WqTc+FvrTys0

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
index b82792f251..d9814433e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10759,6 +10759,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     hcr_el2 = arm_hcr_el2_eff(env);
     switch (excp_idx) {
     case EXCP_IRQ:
+    case EXCP_NMI:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
         hcr = hcr_el2 & HCR_IMO;
         break;
-- 
2.34.1

