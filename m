Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110042dlb;
        Wed, 28 Feb 2024 01:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgKCQtyCwD7oHc+g3O0olmfyhT+lvBmNcM6RN6gueLbieGSG7BCGHVQOt9Da0sU2uDkRM26pIWY6fyQm6l76ZyMC+k5EWH
X-Google-Smtp-Source: AGHT+IE8gG1xH62q4e1uaOTVO876AAtFS+rvl0LuACFhum2QBbQMILVePkAMKz6WNe3B/mskoX2P
X-Received: by 2002:a05:6214:3217:b0:690:2139:b50e with SMTP id qj23-20020a056214321700b006902139b50emr2097914qvb.18.1709112779091;
        Wed, 28 Feb 2024 01:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112779; cv=none;
        d=google.com; s=arc-20160816;
        b=sNsNOf/YWupme2xQf2mCfkjf/s+53QafbmZkEKbDZcA3sGhQNjYEM5PlYTiRUueuVb
         x7TEFAx73VKqhaXrau8lPfhZnSAS/dNZDC7/zQJsvzFLeYYtrOM8ZyFQxOlOoGzdRMKX
         HuiTra/swXWtYtpIIr5oLE2m0JUGQHcBHXJOYADPipxxlah612o9whjMuUAMBa+1UyLT
         pFXTtl5SKIbSSrXQUYDGIk3l87Xi6EdPtGz8+6UglYuTplM9pmqKJ4B4PmfSOyMh3yea
         I2SYRkvbFP0IPtgmwAWwqtJ1f18mbtaI6wEInvhXO81nQ2KKV/MPstSubTJnFBHWN2+2
         pHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=mdNU9YFFw5Llfho2iM3bX9hNk6RZRKQsUB8WmjzU7N4=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=Dv4GEjne6FmXTEhWJGB5ePAzIg4WSihicOGAPUMRJm1IwU40WAxYkuUIvDE/Yq/iwv
         /6FhvySuF8i18T8ZeXE8E3TN1CuabTF9QidFXr4euf2uRcSRQTwDLxD5ouTjwuAbnSAO
         3UnNDc90uVujcELCkF/M/z8uGaQ1mWd/w3GNOZAiOWm/tHTZ8FE9wYrGHOMsON53KT5k
         krA+BOrv/GrSnZelHxI98+5ksop/PsC/P0ddFgj+AeWhFiKsyvM36g3b92LGkOCODpjy
         XUzgIUDJ1PvFBVkiClRNivZqe/zU6c9PBapbvhp/AUtAZGu4gE3Jrn0GStBOOFXE3RBP
         Ip3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy4-20020a0562140f6400b0068f5506c3c1si9872637qvb.171.2024.02.28.01.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHa-0001Bb-4a; Wed, 28 Feb 2024 04:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHO-00012f-AA; Wed, 28 Feb 2024 04:31:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHK-0001Sb-5R; Wed, 28 Feb 2024 04:31:08 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DP66zPz2Bdv9;
 Wed, 28 Feb 2024 17:28:37 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C97D61A016C;
 Wed, 28 Feb 2024 17:30:52 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:52 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 03/22] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Wed, 28 Feb 2024 09:29:27 +0000
Message-ID: <20240228092946.1768728-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
X-TUID: vYvoTnLutBW0

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
index 50bff44549..fee65caba5 100644
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

