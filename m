Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110274dlb;
        Wed, 28 Feb 2024 01:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9o4JkmPZevJFWbqFUabus3Z8T0CCNa1rJ1xYi/85lzo8+xyzfu8siBN5LW1IvByYL1xsJ9eKCVBcSXWhuzl7IbW79xLss
X-Google-Smtp-Source: AGHT+IEtacPGFbEKYPeTAdxn66S3qPda8OsOF+po+pkspRRu/sibMhGSRFa6tNX6MtME8lbAF9CJ
X-Received: by 2002:a05:620a:2987:b0:787:f452:4d2 with SMTP id r7-20020a05620a298700b00787f45204d2mr672044qkp.3.1709112803005;
        Wed, 28 Feb 2024 01:33:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112802; cv=none;
        d=google.com; s=arc-20160816;
        b=IFbEZjVt7TmUsEgMvfGL1EOUEZSCITtWfkTJoFICXcOTVCbrdb4kwi4147keR3leLz
         gESBonMo6g/0XwLm5MYqOfRrt8Hu0ru7MRCWd+yu5T4FORNiS8+/PQoEgoEKtFSLL2IX
         s8n7iOO96Lcqma2Is3yw9Tce5gClT4A/umIemFILKMxcenDbg35b7+QfoUKigo5dVEQd
         Jm/YL0rQxsV5ZSFe9CgW73nBAERBa71Z1IJpR0cXE2cgD2D869ttK5Q1U0H7R7WLQgu+
         Zd2dU39/WoIE+ilwOW4lN4hC4b8JUJ3fhKtLz88TB/wtiAXFAJHqkvLTLWqEBpWRXmoI
         kjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6JhAjWd+J/YRt9FWIidU3nnhB67XeiHZvMW5v6FTevo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=OsPqdiTUTadPIE4Je+qXglqLX3///c1kI9Oy7uryc77d52LbiK6W7hAxtHB0ztSEcU
         ZmRcCvX+K2TyAixJYGGHyPilI0JqrgejckNegckJSVxuYSDVyKsKZVm6MslyWPX5eMJ3
         zCemr3DGk9nSJJYnv9TYBG+2SGoj55JigBTP5Lm1D1FpJ+BVTSaRmbFSYRuM5SenvFL5
         8Zj5YfiL1q5S1oLFCAUNNcxyNLgLMUu+P0CYu9sOKMDMChhfV8sWm1OcBpep32w8OsfJ
         uDLLFPdTiVFSfhTyPhVLaSk0VtZYc2EOmxNfGy8gzLqyoRfx67XXbxzBKBBKMgPTK+be
         LL6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ae9e204000000b00787236a4b92si9147283qkc.461.2024.02.28.01.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHb-0001F3-Jg; Wed, 28 Feb 2024 04:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHS-00015X-TJ; Wed, 28 Feb 2024 04:31:17 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHQ-0001sZ-5y; Wed, 28 Feb 2024 04:31:14 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Tl8Dh57cSz1Q9Nm;
 Wed, 28 Feb 2024 17:28:52 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 0443D1A016D;
 Wed, 28 Feb 2024 17:31:08 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:31:07 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 21/22] target/arm: Add FEAT_NMI to max
Date: Wed, 28 Feb 2024 09:29:45 +0000
Message-ID: <20240228092946.1768728-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
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
X-TUID: x+a6dxuTl+Th

Enable FEAT_NMI on the 'max' CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
- Sorted to last.
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f67aea2d83..91baf7ad69 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -63,6 +63,7 @@ the following architecture extensions:
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
+- FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
 - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5fba2c0f04..60f0dcd799 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1175,6 +1175,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-- 
2.34.1

