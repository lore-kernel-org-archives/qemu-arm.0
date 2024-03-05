Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp111970ejc;
        Mon, 4 Mar 2024 23:06:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3rANuc155Wpi16KLHzWDpVdT9f1sFWpOrGYsdAavEQrViaA7rnKhiBzBzJ3+dpD0C0o4e6eUmqDPA4qe8PRM1nAj6Zu17
X-Google-Smtp-Source: AGHT+IFf2yEr8fR57ZOpW6vFcm+okUSEA6BFtDgS5EYdBEdFeoMPenjya6BLcViXT52WjGz93tQ0
X-Received: by 2002:a05:6214:5293:b0:68f:e6ca:634c with SMTP id kj19-20020a056214529300b0068fe6ca634cmr1740104qvb.8.1709622381532;
        Mon, 04 Mar 2024 23:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622381; cv=none;
        d=google.com; s=arc-20160816;
        b=iNK4rHR8/YIRHtQ4gzOq/7fyNxSDZrMLQAxknQuSGATxJxjkP7yI7Zl4tGXFeIn7QB
         xiadcpobTQ0ClqYYkra/yTIVCxcdkZXjWCd5GGMyVVpeaksobYQZmQsF4tiZv3FoMj0H
         ULqTWQDGaXhl+Ib+9aUjglfa8Z313UhiZgk6ZSOzIlUigDnlSBj0nc7CNAPczEQeJjj4
         /sdrokChMgdNQe+gKpjjqs7BEdoa4ERwsP0Io1rpel7JrIrmYGOU0/8YCYgafgv+lkfR
         J+e9Usb8/ph3NUUh6o0S8tU73m/RhH35+PRUX4VI5vXH0mhwUq8xw2xqZpVkhn6B3hSu
         UWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=oXHvZSSa9h+8Mz8DyfJrbjvNrGe/5sl/5TlgD5fXzlo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=Po1bD51iik//trU1g9s0e9h88Jd0I35zx0pOsrt9x2GYbAHa6SzxnNUF1ORzr9J4J+
         ZyXMljZgEA83fWrwX4s+YD0TcG/PCsCiWO8C/oEjSaUXnxpDeHJL4sIQYSObEC8Nf/xn
         4ns5g4gnzQBzyIRljhKjVGhitP2pkB9YWh1QA/bFvEtTJtahkR8M97DNwRO5M36fX/fx
         bJAxszwMLvOsWaiNdbd2qZssS6640QCkAmWER7Ke92h1iQQeTKxNaVjjffZ7NBtfIyoD
         Qqcbm3fIpcSkCEvCuldVrk68RKRRFU/2PV3BY6thjoWW0Y471zYs09AZuErkWbdVpaqm
         Ld9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im14-20020a056214246e00b0068f92006e6fsi11678079qvb.486.2024.03.04.23.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOsB-0004kI-R9; Tue, 05 Mar 2024 02:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOqz-00047U-CC; Tue, 05 Mar 2024 02:04:47 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOqu-0008QK-53; Tue, 05 Mar 2024 02:04:43 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tpmhm4mkVz2Bdk3;
 Tue,  5 Mar 2024 15:02:16 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C2A7914040F;
 Tue,  5 Mar 2024 15:04:36 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:36 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Tue, 5 Mar 2024 07:03:11 +0000
Message-ID: <20240305070331.2151131-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
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
X-TUID: kqVtYKf4BmSc

Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
ARMv8.8-A and ARM v9.3-A.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
- Adjust to before the MSR patches.
---
 target/arm/internals.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 860bcc0c66..980af3c1c1 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1078,6 +1078,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
+    if (isar_feature_aa64_nmi(id)) {
+        valid |= PSTATE_ALLINT;
+    }
 
     return valid;
 }
-- 
2.34.1

