Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp520865ejb;
        Mon, 18 Mar 2024 02:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNdDhG3o53UiiwVAt2Bsw+V6CbGeq0VPJKqHqHpnKrZkEApC+CtRMXAdDBk93ViotLcT4muYqcFZApvY9JOmvehZ6AMa2Z
X-Google-Smtp-Source: AGHT+IHQv333pdecWJgdtcs1SwR1R9RV2wNcr9CRuknE1I9zaUGrHfrVE696w4FcJiXthRYlwNSm
X-Received: by 2002:a05:6122:1a82:b0:4d4:20fa:eb0c with SMTP id dy2-20020a0561221a8200b004d420faeb0cmr6071741vkb.5.1710754685058;
        Mon, 18 Mar 2024 02:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754685; cv=none;
        d=google.com; s=arc-20160816;
        b=eUDwJfIgmyD3vdeUGgITEBNFtBdrSvKTrnXi8p0qL1hOG9vf4X8wWvmYO3365n1J4r
         3OjY6eCKar0v/0oi7fVaJpmtpslqx3U0u1+jD9EzueBT4f9y0e9SS9uvFhi4DrbuQV7t
         hZETbxzhY0KssEBgMof9Aw1DBa0XIoSq/3AAgMjpqkWrBwO0fsBnuzq2F0Tn3sqOKs1J
         3p872ZDFjFumtsS9D3l1O6rfWLzRtI2KNl9DRZfgA2Y1nIRByxGFs6i1S11nJXhvTIUF
         ATXYbFzQKUdztEOE2INhuiLg+v5NDtjG1amlXmYkKH16iLZhAwtVlbJCorhRxK1OWl39
         Dg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hB7gdXvPI2ignjsLOtBg9yiJTF4UPHKB5mLi26icxdI=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=t9UVm9A69gid4UERWScxfmEGwqxtLqfWW+rnPqTL8StYHiS/ROJRRpFPcLVVkqv1Be
         VCnKORLWnt4pSqzU58WFVKT/wWYme3ANywK2WxU0+MvY95dVrSMzmU31vOQRvb1PwAC3
         B1wjD1d0dXVDlmqrym8w1D95DaNN/Mj+Qbf25z2uh/1TkUZ9Fb3LKAEDpc8fZpaW00Bp
         a0gM3YNHwcUI2YQgk7jmRO08rq9cIQmdOsLCOS2TTjBuzxisM/s6+TtMTajcw/2kAh10
         ayf8b6CHhhmQSWOsAhyY1rwBh7aq7opcwS94gqk7dlB6zN7CIbiA35+aaCJaAKwuPrd4
         b0kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05621419e600b00691837e4fc2si5743041qvc.257.2024.03.18.02.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9R2-00040R-KA; Mon, 18 Mar 2024 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qp-0003ug-7q; Mon, 18 Mar 2024 05:37:24 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qh-0000uk-KK; Mon, 18 Mar 2024 05:37:22 -0400
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TyqSq3nGzz1Q9qC;
 Mon, 18 Mar 2024 17:34:51 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id D7E0D18001D;
 Mon, 18 Mar 2024 17:37:04 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:04 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Mon, 18 Mar 2024 09:35:29 +0000
Message-ID: <20240318093546.2786144-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
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
X-TUID: 3x5JLsPXcKtr

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
index 875a7fa8da..5c637f3413 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10735,6 +10735,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     hcr_el2 = arm_hcr_el2_eff(env);
     switch (excp_idx) {
     case EXCP_IRQ:
+    case EXCP_NMI:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
         hcr = hcr_el2 & HCR_IMO;
         break;
-- 
2.34.1

