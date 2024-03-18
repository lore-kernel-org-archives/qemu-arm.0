Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp520974ejb;
        Mon, 18 Mar 2024 02:38:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxls5HX1MomHKP1mVzOxsB9H+htv5a8EPEz6Z2x3FvrbIkTIcA9bsyfYL7CbnSiR1shB2fh7JM2LAPP1qdm50JTea2AiyW
X-Google-Smtp-Source: AGHT+IF8yQ1BXDRz8vKIcPbm5BxkPXgX/fuujVHi7ae2MWsnhvJpzhnzWUT/Jb1HcbRbxHdWk1HW
X-Received: by 2002:a05:620a:22d6:b0:789:e3ee:532c with SMTP id o22-20020a05620a22d600b00789e3ee532cmr8585877qki.26.1710754700998;
        Mon, 18 Mar 2024 02:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754700; cv=none;
        d=google.com; s=arc-20160816;
        b=L4cI7rJi+8MW40iNA4AxkrBAp2cDmsqpToONKQHlKzNsyw7Vz/I13nCc+iYaDVErCT
         qnLcmw3waRxH+Q5VqnisAvz9ixmewSf/5mk/oBurSKAC3xMfOUktTHJGqnRtB++HRwmT
         psxkLER9cEaTfNyA1cj4xUKFvG95PeioybeUX8xN646z7WJJ6+k2iINMyqe1/ILHs7je
         vT+6eEm+pNZGjxQF4n3Ay607NpaEd2vNuoKkYRFbarp3qsjzja7W/rZbaZE3qPsueTxQ
         Sb4r9IS0ODx6EaUxJNyIEWxiaB0UHAwiVbStkAfpv3pRi+OKDGCaomQh1QE0k1wpnVMo
         e+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sGWs0z9h2XQpE5nzNEKg6i/3ykkEQceyDYmXpq/M86s=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=J6/WhmAHA2CrozP3zPTZDSuTADGkAebX35kXdkdPVvpSzTZyRP3EH7ZBR5ObdLHHfl
         IlFgiQTd++lc+KYcdIMqVRArakW1jBe/30zwfPdijI/TgMXQ8FcdaH46+GJnnbeGeXEg
         FU2SZPbpGzqTCidp6SwZq4eBMTaKYqpg/OvK4hnu9nAWwgAoiSnqQGVrLpiRFlnAhbE6
         3YjE3GF5bQQruFoIut714wOLrObsB+IW5seXjkDkGsIieTEgvhBEHCT87qM/Vx+u2r2c
         GCXzCBhU5AXp+8sLh6KcBxDgPpLiz8UbJmwmeqg8dlm7dvdYoQiW/MADq9P7f5qMx1eN
         PbHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05620a205400b00789fb8d83d4si2224966qka.545.2024.03.18.02.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9R2-00040q-SX; Mon, 18 Mar 2024 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qp-0003uh-7u; Mon, 18 Mar 2024 05:37:24 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qi-0000v5-0d; Mon, 18 Mar 2024 05:37:22 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TyqW14DNkz1FMmj;
 Mon, 18 Mar 2024 17:36:45 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9E4FF1A016F;
 Mon, 18 Mar 2024 17:37:06 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:05 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 09/23] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Mon, 18 Mar 2024 09:35:31 +0000
Message-ID: <20240318093546.2786144-10-ruanjinjie@huawei.com>
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
X-TUID: OV9zvlDkAUGG

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4bc63bf7ca..81f4a8f194 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11705,6 +11705,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu) &&
+        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
+        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
+            new_mode |= PSTATE_ALLINT;
+        } else {
+            new_mode &= ~PSTATE_ALLINT;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-- 
2.34.1

