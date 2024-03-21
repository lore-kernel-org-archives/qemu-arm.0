Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp490667ejv;
        Thu, 21 Mar 2024 06:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkK6hwKy4uFJ2//uUiwucxnkoiVedRcOE1KvCD0PyhGBmYtNBKa/XWCqXdRw7MM+mK6HnhUkGTsJbYp1w5XbFvoV8ylVQh
X-Google-Smtp-Source: AGHT+IFjrW/mBrMEXaHocBEMhSaZe2yCiMMsOBkab5JXj7dpf42wFJZVyzqq8wLrhoqPBNH+WRBh
X-Received: by 2002:a05:6214:ac4:b0:690:d9b8:9596 with SMTP id g4-20020a0562140ac400b00690d9b89596mr2206723qvi.62.1711026778499;
        Thu, 21 Mar 2024 06:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026778; cv=none;
        d=google.com; s=arc-20160816;
        b=eXjiEIMGtqkvqfYUgV6wUzFFye+2DhMIL2ZIMVrA/nXj/yy90sjfnq2ZGHTTugvRj1
         dRoxkahvf9D3czpnqE/ttpDLLZybObAWoAJDdzavdWzkW0zHR3TRl9R8lmWCoMWkggL8
         QNiX4KgezXQAixMyMWHBvfIojF4rzXmbScJD4wW+YjEe30Jc+zWePp3D5njCdjL4OrTp
         kD8V0m4gp7BGmbKaFWUJHcu5A+O+7MQgpynq1PC7O2TiyYMRv5MML3s4hEpG5kJxYJ4u
         khssKIcKwzV5U7GGcSwXFBsBSwhWdL6b+xcST64lHfoUq6LAzFv49RS6kU0R22r6U/mN
         DG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sjTBjROnrHgw0Da/ogYSEdNj0V5fm8jSfy87Ch9m28A=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=e6oDIaZ3hW5lBzNxTWJ0UmDHDsjToNXOrmt/IKGHwVx1qw/WdSojT098ugLmc2s6Ww
         op16nBOgshVIhr1fHQe0WiFlJyrL4+jAutI9Qwra5DtOrLtuljz+EcaXg3KTrrJj8Mdl
         4KBSREQIC/igdQgefb0uVdOWFAmGp7sxmsFjRo1hv+WnzJozx8lvblFXVnofzbmHk2XO
         6AfNOE6BqzZqhcTICh6e+EFsh3qJwScuntwS2Xuu0sPO6tm6ymbgdTrOPjCFisWBHlyT
         0I1GOxl9BWm7vAoViKgawXLYG5rpIfadsBRA8FyR/MFAA16zbFiwjjKW6t60+zc+9Rvh
         35VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020ad45aa2000000b00690aba6076asi15465855qvg.472.2024.03.21.06.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIAs-00079e-Pz; Thu, 21 Mar 2024 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAp-00076w-A6; Thu, 21 Mar 2024 09:09:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAn-0002ox-6u; Thu, 21 Mar 2024 09:09:35 -0400
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V0m2v3YZqz1xsGt;
 Thu, 21 Mar 2024 21:07:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 8600A140153;
 Thu, 21 Mar 2024 21:09:29 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:28 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 07/23] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Thu, 21 Mar 2024 13:07:56 +0000
Message-ID: <20240321130812.2983113-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9284oM8pgjVp

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

