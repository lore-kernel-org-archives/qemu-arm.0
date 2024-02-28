Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp109265dlb;
        Wed, 28 Feb 2024 01:31:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/KfrqS3T00dIPurW+4Ka+R/54BuRb+vSh8uKk6e3J0fQ1bASNaYE+R0sWAuQTO/VrNjhjI9wOljrHs+O3ICWBz4ZbfkxK
X-Google-Smtp-Source: AGHT+IERJMOhdlx19XIbKCHYV5s1ED2o25M86t02yb7SpRa0TqYSdgqPDMdLknL/8NZVMV8rvPCf
X-Received: by 2002:ac8:594b:0:b0:42e:78b9:869a with SMTP id 11-20020ac8594b000000b0042e78b9869amr12554904qtz.41.1709112682812;
        Wed, 28 Feb 2024 01:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112682; cv=none;
        d=google.com; s=arc-20160816;
        b=jNCOa0wVg4A1UuElj3uicEBTJMONmUxx5tyGb4gSL5sI5bRrR9Sae/uZG9aznBuuJD
         Jz7OIj30r+4GtYBwLzqDlMzHj0H5kiE0J23gxQ/O5/qc2v/DZVcBQQrhzFpEPCvzgo67
         61pkX4zOv6KmFQG8eauhKYNrX0EP8oKT8EMfJxoSYb26nXFpWfuCS2bxp+VcotMq6e8T
         +Na/3XTTMS0Ethe06vEcm6xPqeLSaKYPAI992kG0JZg7VSu4ou0TD5kbuC9Nxg3Af8WJ
         fYlel4gxXJW8DbYxO0rocCMh64h3Uit9B07EWuZ07e4oZBi6M7sBE7i1vJR8JIoe2bK4
         +xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=8TFonrZeeb9Z5oiTebD7Ywi/vJ/Y18Mgf+7PSNgiT1o=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=t2dMZNxgZPYpWF9pflg4JK4YVfvPQP/+Kck+U7tCinRnx9cfLdRnL55WP0LD2qYSPc
         RQk8vu+65M+Xh0DDqjDEnqE4nUythgeOcuVsYXRQL9w7+wdyzDST9TtEWwpFmfSTOnTe
         uxO5T5Y5omHUGXKgDQ0C7eOytTTJhtExdnQzblYevGrvK7+sWwlGDDVENNsU+ypPUj6u
         /At6uDksr9r5brCLUw44ylAxZrd5JA9YURwQnY9CNaEbLd27Y5C8Y9GNJeZnR531K1WF
         dr67PIsOqEVucVZTvdtAZXpPOpwVLNuvWmB/AQd6tQPncfK39TE/33huaWZYoqTU+pnt
         1d8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85516000000b0042e6f7e9996si9095405qtq.659.2024.02.28.01.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHO-00012c-34; Wed, 28 Feb 2024 04:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHJ-00010w-Fk; Wed, 28 Feb 2024 04:31:07 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHF-0001P1-WF; Wed, 28 Feb 2024 04:31:04 -0500
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DT1hMjzvVyH;
 Wed, 28 Feb 2024 17:28:41 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 1E97718006C;
 Wed, 28 Feb 2024 17:30:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 01/22] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Wed, 28 Feb 2024 09:29:25 +0000
Message-ID: <20240228092946.1768728-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
X-TUID: 51+jAz4XkP9U

FEAT_NMI defines another three new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Update the comment for FEAT_NMI in hcrx_write().
- Update the commit message, s/thress/three/g.
v3:
- Add Reviewed-by.
- Add HCRX_VINMI and HCRX_VFNMI support in HCRX_EL2.
- Upate the commit messsage.
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/helper.c       | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7567854db6..2ad1179be7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -681,6 +681,11 @@ static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
 }
 
+static inline bool isar_feature_aa64_nmi(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, NMI) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 90c4fb72ce..affa493141 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6056,6 +6056,11 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
         valid_mask |= HCRX_MSCEN | HCRX_MCE2;
     }
 
+    /* FEAT_NMI adds TALLINT, VINMI and VFNMI */
+    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+        valid_mask |= HCRX_TALLINT | HCRX_VINMI | HCRX_VFNMI;
+    }
+
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
 }
-- 
2.34.1

