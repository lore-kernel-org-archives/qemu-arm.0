Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1996883ejb;
        Wed, 21 Feb 2024 07:40:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgYJrlGE7B7qcOhrJXOL/Umkzxj1Ez5mtqTn8TMOw5HXj7Pl72ry6phuJyoB4AmLPX4xeJxAdnhj3crYb8XQBQOk5DUWiJ
X-Google-Smtp-Source: AGHT+IFnqvpzQhBeuYmZmyCO3txNmEVTgIHfjTjUkN70A3dXH9FIfkAfjxi7cZkucHClnxvSy/nO
X-Received: by 2002:a67:fdc9:0:b0:470:419f:d42e with SMTP id l9-20020a67fdc9000000b00470419fd42emr10238338vsq.10.1708530058952;
        Wed, 21 Feb 2024 07:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708530058; cv=none;
        d=google.com; s=arc-20160816;
        b=vSfyebbOl/Ol77wm+KiQvAsvBVhUsRcXhFTXv73+mVYjFZWO9gGddQdBmtaaJOwjWx
         s625I08ixeoktlQy6OtUiTKfKJd01BGSPvU0HZZhNKF4R0ZUiusm3ckqukEBTiQbvDCG
         WHS/sQC4lpm+7m6NjxrOSi+/rjQWc2EEXlfTfe1JadK6xFZDvKdwhkTZZaaQ5a9J+diw
         bdZrRiTRHevBCCGVfM14wHQCHM82mF6SXKx/UMaxmZVFrb0MZ/t1vvgaAfecTXe8zH35
         y/o6CrovN9jafKoafPAbVs8ow3vA5TR7xNcrS05rp6tIAubzPU7vFgtA3tBzsZ6R1/yS
         WrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=FlMYSWQc8K6l7acbiHQakTK7BNp02Cwi8Al28Uwm1Jo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ywj2M1ucvVsjFZhsxgoYI4tF9Bp8del8a9dSb1/E5bXLVk+p8+uVZDrSsQImh4EWAb
         uLwd/dJ/WJRGyefyGjuAa0g8S/U3xOJOWWPiV9H1fsDoxFHwlZ1LdlA7tGFYQFkU00Fk
         +fBnffJOxfVCOAknZx2BVlI16eKNrv3Z/oHMVJ+jKANfsbKLkRub7HQY3NnPJs4+XRli
         z7ztvEena36+5NA/ZVG/6pYl85+N5IJ1ASFWoCRhsoRHyt312kT6NbJaBZ5n2iV2gK/z
         DhYRCJQvJlUgcmvrK/hD7x8UkJFpRGzs/g4Rw9izJRkt8iYI20kr8aeQUIQXM+bWmCOD
         Thdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020ac85314000000b0042da72aa198si10828705qtn.207.2024.02.21.07.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoZe-00033D-IB; Wed, 21 Feb 2024 10:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoPo-0006cY-TO; Wed, 21 Feb 2024 10:21:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLw-0004p3-Hx; Wed, 21 Feb 2024 08:09:38 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxPv0JVMz2Bd8v;
 Wed, 21 Feb 2024 21:07:15 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 01CB41400CF;
 Wed, 21 Feb 2024 21:09:24 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:23 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 02/22] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Wed, 21 Feb 2024 13:08:03 +0000
Message-ID: <20240221130823.677762-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 07mjji/tDUep

FEAT_NMI defines another new bit in HCRX_EL2: TALLINT. When the
feature is enabled, allow this bit to be written in HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
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
index 90c4fb72ce..a3062cb2ad 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6056,6 +6056,11 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
         valid_mask |= HCRX_MSCEN | HCRX_MCE2;
     }
 
+    /* FEAT_NMI adds TALLINT */
+    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+        valid_mask |= HCRX_TALLINT;
+    }
+
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
 }
-- 
2.34.1

