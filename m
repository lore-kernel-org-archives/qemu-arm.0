Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp114455ejc;
        Mon, 4 Mar 2024 23:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUS2nlLe6od8Sh+CvJm2s1ZpRqxNbhBbeI2FClUuF8zdcmjgPhMJnE0vUOAUBJ1U7sB55BsymE/q7DTMQcf83IOKvAbWHVg
X-Google-Smtp-Source: AGHT+IFRZqU6q25OiBzqUQ526fEFD+KMWZYnIgXwhom8yd9nyY1cpzhZrMly/umknFjejdfi4vOJ
X-Received: by 2002:a67:ea1a:0:b0:472:94bd:9d71 with SMTP id g26-20020a67ea1a000000b0047294bd9d71mr850334vso.15.1709622776483;
        Mon, 04 Mar 2024 23:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622776; cv=none;
        d=google.com; s=arc-20160816;
        b=lVfD4u0Uk7kU0JmF7G36Y+B4nmnmzFQqUmACP1evzF42T+qXWcqmK8vcQ8qLPrb8cw
         oc7yd7IlwIeFN8AXKU6UC3Yb/XpL5P/KHGWaCDCx/PNxzdaWHnUqKqmJXkDriKPIl4Zp
         M4RyIYbw8jD/GstX1VhHbpdwJg0KBxcN41nM0Kh0frX6KOWOh/ICvOGris4uYKddpHhj
         6hnQV7VpZz81nCxUo2wP5VEPy5wIfHMUI0vD5eD6fsO2stKR+w1KUf6L1eDuFgrS/oh4
         uu1l36lqO/bEXlfkNMWxw2jSfKjWQEXfzkX3W0E9/qNB49eVKH9+W52/249HZEsO1nj2
         HMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6JhAjWd+J/YRt9FWIidU3nnhB67XeiHZvMW5v6FTevo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ZIgXsMkFtvrfu/i2EVZtYnyLHiWk40+XNpBi2WsWiab2kv5itFtjiXUoDE84oROSUg
         NL7Os62MODcmZ19i29xtGFouuyvKtI42TGwOXYiW3qY4qVlUAeum3Lhd7PL5LHDOsy4n
         30fdxrZ4rlzsYnY644hGP6yPaSMcNW10hri/+1w9AOgj8izS2WMhCn577SGx+WDoYuvt
         VAgAXT5+M1R2PATEBVMTLdEam+PfrDriLPlAhPSYHIK1xCyTNdKt3o9Q7LOc069A7eZ2
         abtpbzTMOmzbTulJp1ucdje5eZmEA/brvS7nkP5vYsPT9VIr8JYZMlbKWIR9DzvAfbZr
         9Q8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020ac85f8c000000b0042edfc2a9fasi6604985qta.30.2024.03.04.23.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOsm-0005qp-GP; Tue, 05 Mar 2024 02:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrM-0004LV-0x; Tue, 05 Mar 2024 02:05:17 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrH-0008VK-VM; Tue, 05 Mar 2024 02:05:05 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TpmjX5GmPzsX7B;
 Tue,  5 Mar 2024 15:02:56 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 18D2C14037C;
 Tue,  5 Mar 2024 15:04:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:52 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 22/23] target/arm: Add FEAT_NMI to max
Date: Tue, 5 Mar 2024 07:03:30 +0000
Message-ID: <20240305070331.2151131-23-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
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
X-TUID: XVWLL8mkL5Ie

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

