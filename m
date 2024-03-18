Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521172ejb;
        Mon, 18 Mar 2024 02:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9RzVzi7jAhZkEVY1dSg07XUlGXbzsKdI9lDCAZVxFICp/hQN8D6RiyELVXTtkc/A8tFDkop7UNoHGf2Q4EZPYcGKCWR0j
X-Google-Smtp-Source: AGHT+IEcYY1SmNqqv9Ou+yiaak0EwLWZjfEJUNq/BpP8pPj7qQreXSHGVR4LJoej4QtYKpRLxdnp
X-Received: by 2002:a05:620a:1359:b0:788:7299:e79a with SMTP id c25-20020a05620a135900b007887299e79amr13006725qkl.28.1710754732037;
        Mon, 18 Mar 2024 02:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754732; cv=none;
        d=google.com; s=arc-20160816;
        b=M9J53aV1eQ27iQ1YFNaonq7DEpauKDsBf0NpaJ3P1lG+SSw17mK8zP2ydVio69F3Am
         Xr4Tve1pYPsFc4Ev6dDRNQEn1V/RuEbiNOvjHr6GxheUT1NBUFeQmTbctB+V3Z5nQif6
         v2h3UHmqNk1wHRKZy/b4TbJR0tfNpSqGm/OItWAaZcQ5c3KGpPOI0LgFpz1sSKUsWkYH
         8siQyhvetKAKIMMRjeIbmmDcab/hZoAfDtEcD6JCyDDnTx6KlscBViWytXn1GlGxwO+v
         B2FvAg89a5M4vM6uiPplmsizk/VP2IlzdyuVHOjpRWxAEeWf3W8YT4ovP/egnNwaum6/
         s4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fsOP6OuwoabMeTy3B8XOgHFR00kOYVH15cTWGDqplwU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=BHuEGTaaqryFmRUa/Yte5evyRskLGpMZ2OroV+fC/0NtskZqDvvy6OXU+Sg6hDOkN/
         11Q0MZLX5QzK2a6Po7Vw/DvACrKEi/00ijz34vLs/IIdjVWiEGzRX+2LOwIkrpzZWluX
         THSeKxhNs4hCihVp1YK7w34iYDkD4rOe+wHyRqDYeJ4KlBO2njzvIZa1NUbXcnrE1ZSn
         duVdLUo3IaL6KB7Dr7OCaZKrubtzp3dafs+iIsytmEI5I65tBjnHDevEpQdsqDbSSeNS
         EhrJmJlcXUXBg6oY67fFY2H2PSWziVa+D7nhaoYr/zmx7AdcTy+KNGZMxfVZygOBS0Wc
         wm1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020a05620a166e00b00789f797768fsi2747080qko.639.2024.03.18.02.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rm9R6-00042N-07; Mon, 18 Mar 2024 05:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qw-0003x9-QJ; Mon, 18 Mar 2024 05:37:31 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Ql-0000vY-5j; Mon, 18 Mar 2024 05:37:30 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TyqVc00rSz1vx6n;
 Mon, 18 Mar 2024 17:36:23 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 5DBA61A016F;
 Mon, 18 Mar 2024 17:37:09 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:08 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Mon, 18 Mar 2024 09:35:34 +0000
Message-ID: <20240318093546.2786144-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wx/tqeKJnW+z

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
behave like IRQ. And VNMI(vIRQ with Superpriority) can be raised from the
GIC or come from the hcrx_el2.HCRX_VINMI bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v7:
- Add Reviewed-by.
v6:
- Not combine VFNMI with CPU_INTERRUPT_VNMI.
v4:
- Also handle VNMI in arm_cpu_do_interrupt_aarch64().
v3:
- Remove the FIQ NMI handle.
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 81f4a8f194..e279b26e9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11625,6 +11625,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         break;
     case EXCP_IRQ:
     case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VNMI:
         addr += 0x80;
         break;
     case EXCP_FIQ:
-- 
2.34.1

