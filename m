Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564393ejj;
        Mon, 25 Mar 2024 01:53:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKHbjIqtVwFEU+XbmC5eRzlCQF0bhjX/DV+3IZd/ielVBJ1ocfcsRbQYFCfkV+UWLzJpon91Qa9y/RynLyUTwRKs0dSysw
X-Google-Smtp-Source: AGHT+IH1cdYvrjhhiW3kr3l6Sk5bTmQ2siM6s8gv/qkR83a6XZT9RUlsjJDLEuChJoMu/zozaQ2a
X-Received: by 2002:a05:620a:c0a:b0:789:c645:4e0 with SMTP id l10-20020a05620a0c0a00b00789c64504e0mr5988636qki.45.1711356839075;
        Mon, 25 Mar 2024 01:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356839; cv=none;
        d=google.com; s=arc-20160816;
        b=hCT6QGZ2Ia669E9JQOeGifHwKAFrNzoloyu2NQ0PWxDFewWdQGK5S2TN5DHbQBnki1
         4ZgSYDdfs979BM2WGTCS1EMp15U5tDWxCC5zkWLNgRm5gcdwW1nkwqU/HbqA39olJm5S
         OtqQlOvYNjZZgADi6DnQLhDolln/tL9cwfn4lGVGhw8VU9vm9hT3jBjP/W4a6Ac+TicJ
         R7gVgyv13K7NfIeuxQHU3hBQ0DWnZ4t69GmGKEoz3Jw9al3Wr6zF3Dek5Icl2HVmXgrF
         yrkfYB63MFYvwK60SOMMdEIZ+hFbHaD7P8e0FKnobTLF/tq/ahtj3pAEHKMZNfoSS+1/
         UNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CTvWwrCpTKOZ+gV3mXvT4nYl3pZnnP+ALq3LUnld7/4=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=a6+EEHALvyph0iA+swuAqL5e5ULntiiDg1tRNuZJw1ZrsPEg/6c1Fq3El+QsrXT0rM
         3uMzQ1M2cZa/oD/u7vHHhHEX4CzHdCtexE1aIhWe0Zmj1AIAtj0uKk0tlP00DsFAObBO
         h7d1lwB/azL8dvowyQCv0op7l+xPXBGk9s3IdKq+XxbLj5amsSfzPNXM1I3WM7MNDwGP
         1M891l9w1yN+G/tQK8qGOwkF2JRDMFrokjVo/+3b+FK9AL2KUKqHD5LVUfqBroLYnbPu
         e9xHdAp5+Un9a/zese3W07qaqD1AvZcVIBOVGKbrLSJIQOpG7ds3L6FevqYd98bYXsUu
         fUeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05620a136d00b0078a51689753si2645147qkl.192.2024.03.25.01.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rog4g-0003bH-31; Mon, 25 Mar 2024 04:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog41-00034w-JD; Mon, 25 Mar 2024 04:52:19 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3w-0007RP-4Y; Mon, 25 Mar 2024 04:52:17 -0400
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V367H0fKWzwQ9Q;
 Mon, 25 Mar 2024 16:49:31 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 175BC18007C;
 Mon, 25 Mar 2024 16:52:09 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:52:08 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 22/23] target/arm: Add FEAT_NMI to max
Date: Mon, 25 Mar 2024 08:48:53 +0000
Message-ID: <20240325084854.3010562-23-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zC1m0x3naG0A

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
index 2a7bbb82dc..a9ae7ede9f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -64,6 +64,7 @@ the following architecture extensions:
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
+- FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
 - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 9f7a9f3d2c..62c4663512 100644
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

