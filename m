Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272375ejb;
        Tue, 5 Mar 2024 19:59:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZrzmlknm8RoTbWiFkD6uOPW32YlrWmyxczZGmZdZalPjTnn15a0sNYSOC8tIzdSIaP1xRQKyGSH1DGB4bCTvlSKmMEuD+
X-Google-Smtp-Source: AGHT+IFFrknB3Scm8DCGUUpvzHDUm2y7VhLNWLelPtVguM8tzI2hNZDvtAbpNFl9P+SNhN0stgBy
X-Received: by 2002:a05:622a:2cc:b0:42e:c4d6:8861 with SMTP id a12-20020a05622a02cc00b0042ec4d68861mr4552245qtx.54.1709697560207;
        Tue, 05 Mar 2024 19:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697560; cv=none;
        d=google.com; s=arc-20160816;
        b=NHsnPJZguCNrFWo9huZzCX8HZEbwrkldoh5/4wIVBUfbmWFQaJEr3mcJugaOrFmcRl
         f/xEQHD/9FZ7s2gAPiEmkFpoj572FLa5RIi0FYfR4EObT6vUlGfg0XOJUNHZQRR3OCak
         o2MXae0/Q1YcdK7irM2tIgnB3Ue65QLVI09hfK38ejwAafLkbhKRYwugC4SUMnuaTtZX
         dhTFJyFsfvUIbEdK4/oGnC7FmWAlU1UNPVZlIdlJ6E0IRjV6bNmllAmI3Op/2I4Guq/4
         VwcZL7pkrJT/HUI+iYydY99uENlt7LImwIMvyU5lF6OGqAwHSPWLbvn3qq9NQKr2ehxn
         sRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=M2Uy5i5qvzpAhvD2FgxT9EaUlBDilD6t9YUoZwRT2Xw=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=DPZ7/4/JDtMKu4N/XrWzszDOiLRi2qCtbjCEyJx4NPKLWhs7nahSIflsVmqHkhobaS
         N+0iLXYAkLoYisawSv50SXV39Hib20b9u4kUtVCyQBtjSuo31xxyDDFVHZAY0J+bJFhX
         33KDFhiFUavSyq6pV1+nDrEXMRWdWLEXhq5VU+3BKlFJLYIL1+xBkUytO5XIbvYE5pke
         x92amJpIs7BqNC95acT3qI3DA3ihi1xbT8K0Ml2prh1WIb4U5HrvZWPFJM7ADdd+w37W
         qtFd29Ivl94LxpLtUeQQ7VEnjYmuyGazWgUXw3FTnb6hfHPdyUaP03EwYYQ6SrveEePT
         Oujw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020a05622a03c600b0042f0601156fsi2364679qtx.397.2024.03.05.19.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQS-0000tl-SW; Tue, 05 Mar 2024 22:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQP-0000oA-Ja; Tue, 05 Mar 2024 22:58:37 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQN-0006kp-Ir; Tue, 05 Mar 2024 22:58:37 -0500
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TqJX33gkxzsWq8;
 Wed,  6 Mar 2024 11:56:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 03A1A14040F;
 Wed,  6 Mar 2024 11:58:33 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:32 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Wed, 6 Mar 2024 03:57:05 +0000
Message-ID: <20240306035721.2333531-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: St7aPcbq6uIM

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

