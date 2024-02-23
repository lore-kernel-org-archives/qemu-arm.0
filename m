Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475107ejf;
        Fri, 23 Feb 2024 02:34:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlZmfh6ZSkLSX8AOFfpQPzxHdeGxEbgoNtbteEewUAVSKsgq7nS2wrZSM6wLBuqY/57Vs46Pg5TWuj5tjYYjCb5VHVZRyb
X-Google-Smtp-Source: AGHT+IH9HPCsD0FXTF6T8BoPjfxG2D8H00gieK0JJrkV/r3J63Rb00G7xEcFDv94PCCYvw/zmXe6
X-Received: by 2002:a05:620a:5648:b0:785:4442:c28b with SMTP id vw8-20020a05620a564800b007854442c28bmr1486996qkn.11.1708684469924;
        Fri, 23 Feb 2024 02:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684469; cv=none;
        d=google.com; s=arc-20160816;
        b=I5CUs819fhw3rhD12c+bXWds1WVp67NB16OV467i02LWLPVpY1cJW4Hm04ofq/lZmy
         hbtLZQtXtVvVMK5JN9WYovDPNlT0/3YwYj8BaL8yzR/nE5GxcmJXnQy/yKRucKyT96Jb
         +au4hnorH8/8wAgqU6rLCp5DfQw+lC0H9lHDHbvHHCyGoCvd8jAcaQxs0ptugoBDG0Fu
         DWDol1vlwh5D5DdTyg2/IYreN5H4EhzLUYjJc9B8TI9Gk9psxUM9fehfcElOINfLYngV
         ksEE6n4cz2uUe884blPi+axTPWS3VjO+K3imNAjxV65gMxuwO/PHBukbdosKn/JCZAPi
         IPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=E6ktQDTOoYEtkrZP4dGOuNoEPDujxhfnlgzAlJ76WVc=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=vvOCuX9HdaGzbBUXJ6HlEcde3Jp13mUCEeFMlZmd/FgLAFCeJur4NiOF1uwZfLidj/
         aKaWrkm5ObfqyPaJm+PAfGGoebbeTqSr+O0CTeI3p2A0liH4bs1xYz0T0Z154wwn+3eu
         yV9/5+yCjncH8jXWo3HkVX0TwkrV90V7EI6wGQw1YRxcpz+hjqI4PAiiFswW6KZiQ2Pi
         +6K6307cthB3yuQ8ZSLqI/HKNpz9YaBgpqfOuWJWbinIZ9/8N+8HYPWTEQRTn6fbPIMq
         qTrw8tEXfUIqtSu2CbQK9pCKEUGgwOjED0lbQiwWzyTu2+mFf+jav+xAqtqQ8GtUTmEw
         MYVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05620a240f00b0078538825194si16333203qkn.421.2024.02.23.02.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:34:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSsd-0003hO-73; Fri, 23 Feb 2024 05:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsQ-0003b9-UU; Fri, 23 Feb 2024 05:34:00 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsF-0001te-IJ; Fri, 23 Feb 2024 05:33:58 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Th5sF70v4zvVtK;
 Fri, 23 Feb 2024 18:31:29 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 866911400FD;
 Fri, 23 Feb 2024 18:33:34 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:33 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 01/21] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Fri, 23 Feb 2024 10:32:01 +0000
Message-ID: <20240223103221.1142518-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
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
X-TUID: p2EcZ6cjdZxc

FEAT_NMI defines another thress new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
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
index 90c4fb72ce..b7e4c7ddbc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6056,6 +6056,11 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
         valid_mask |= HCRX_MSCEN | HCRX_MCE2;
     }
 
+    /* FEAT_NMI adds TALLINT */
+    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+        valid_mask |= HCRX_TALLINT | HCRX_VINMI | HCRX_VFNMI;
+    }
+
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
 }
-- 
2.34.1

