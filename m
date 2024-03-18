Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp520778ejb;
        Mon, 18 Mar 2024 02:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWu3O0a8F8tcNCKNEB3p5IFsFLANpy7FBYplP7UN5JoaKjXsnUAXOtZVJdJqyleAjhpOBm6lBkA0A3+j+it4Q9fIMZuIQyd
X-Google-Smtp-Source: AGHT+IHQz5Xj0rUpCCIelOyCvXoZdr9FUmqEhqTEtUfM05TAYQZ+/qhOb/4po8Qu0mrJc03RHkZx
X-Received: by 2002:a0c:eda6:0:b0:696:20b8:cfc5 with SMTP id h6-20020a0ceda6000000b0069620b8cfc5mr1313102qvr.6.1710754670146;
        Mon, 18 Mar 2024 02:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754670; cv=none;
        d=google.com; s=arc-20160816;
        b=DUqctxZdpIHQVCdk0H66qJV2E0zj6P8ic4cQa1UNKds8vGPaSPad7cbEbcN+Z991x4
         U7rv7lGPeg8Hmt77XZjbY+YBnqbsnGfmjDc24Cs1U5KryAqcd1PwgeJF0jUoAyYJlD6g
         4jGWUVc724rQwF0yVyphw5/6JEqodF9w+beCDH5/H83dnvUUQDRTRPNVg8rYUzEW8aXY
         KsgWLhQoe/ng9CH6zOlq6+TStTOla4VJe6N/A06mpL2IQEq9MattWZFHq/cXKvw68DGH
         Yb1BhE470yJF/eSN5Sob+uVS9lhh7FiyR4KaTdyEwnNtdmtSpS96NDTfrBvqYM9QVt21
         JcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7+CkH2sAC8NKkG7RpWbt4+5J0vqIU16z5lht9wCK9q8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=WXBqRrVilJr02KH0zpQDdbtV65MC5QloitnqvlIdE8JPszey+Cd+qpDUe72uDe7Y3I
         9IErdMGQ5rfQ+yfKk64VNMQ4r8wJqSFy29BWhnq9SOGBAKJLc6V2bAn/k8Lgq06tNhQ0
         qAPr2bXUn7SN4QO75Es+r3vSyXA8s2KRCGK4lEz7nMPu9yUFNiTQIrsSqA2SqXiGVcrF
         iUPuxs+IktvWkbHCP5jIyWsu7BHW48xlD4488EkuMKSRsBH0Y6j2wLSI9pwLQa4wwlc8
         8Pl/GQGzkeLicfAgeFdAyl9TzRAqteeGCz2SMM26eXDVYbOQzf1Vp9E3BE4diR9XFd1b
         ONkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo9-20020ad45f09000000b0068fe59b0e56si8609080qvb.62.2024.03.18.02.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9Qv-0003wl-OS; Mon, 18 Mar 2024 05:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qq-0003ut-Qt; Mon, 18 Mar 2024 05:37:24 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qh-0000u2-5X; Mon, 18 Mar 2024 05:37:24 -0400
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TyqVw2dCvz1FMry;
 Mon, 18 Mar 2024 17:36:40 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 67BC4140414;
 Mon, 18 Mar 2024 17:37:01 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:00 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Mon, 18 Mar 2024 09:35:25 +0000
Message-ID: <20240318093546.2786144-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: wWjwPebuxngO

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
index dd3da211a3..516e0584bf 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1229,6 +1229,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
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

