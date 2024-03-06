Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272329ejb;
        Tue, 5 Mar 2024 19:59:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMmUg+UbPMiwY2CitwIZDDVH/8/63FLg/+SDzG/a/mXnMYAUk5WA1SZ742ufmDmWSqbwYiYl0mLKOwqpy7GYTdRonXYyaY
X-Google-Smtp-Source: AGHT+IFPNGn4PF/6RstLFCocD9b8jVpaDQDt+kksYuPB+/LxKaaee0fK2vGgwtiMiFe+SmGwkGyI
X-Received: by 2002:ac8:5bc3:0:b0:42e:cf0d:c9e7 with SMTP id b3-20020ac85bc3000000b0042ecf0dc9e7mr4181404qtb.44.1709697551503;
        Tue, 05 Mar 2024 19:59:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697551; cv=none;
        d=google.com; s=arc-20160816;
        b=fVMJzwW768BpVeJpu+uawHeaUjjlbOy59cSNBatL9byAAUmCVVUHY9GgqftsN3c0uT
         vLCxC5f6qpKK5INZ3PA+dO/t5CCGDlYInJyupzbTRR0PR5wdwKL8JSyCO4kZQpV1cnii
         cK+uM/Hb0tMA7fyWlkOPbhYhsZDcbmhWgX9hA+dQ9lKPuhKKYQz4XB6rAynfzkN18HhI
         adsVSTlm2UPcOXCv0Ltc8Vt/SzrlW1bvFHdk157xzDFgetibjdYNa3PsDjJ/4zjJvTPh
         aPWE3gHwxzD3Aj/X/C08ynpCmoOAs2HzpRbhTv4LGIvOLObGp8HQxxwShDScy3p0c+se
         687g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+4AtoCaXHz7C9QNC+QDbVYn5m06QcNP4iXgMGKn+v2I=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=NeCeO/L5zgRb2Z8o+wLBj1dc0/nDMOqoc17fyZJhUAAG6PdxmSln67UuEn8HsYzAda
         Q+X1Bys0oU6SF+6EcBjwx4lrXjBiS21Mdzq6KdTAKVd3vC/+8DdQgxWpCatBLiUeFdtZ
         QQqZc1OYRcuzXE5f4ZHEPFjA3zX6ffi/x0Qiyi4h/B1jWHw2v5rCbEp6tVDflZChVVL0
         ZfC48jBTkNAlKFU1bsG8iT4IJku9hpGhUz1MACIHTTLxyqzf1TfsGog0jEw4gOV1LrgJ
         KcIIk+66eTT79l4+Mo8Yls+icPG62cwohuQ0yabYN0NaGwPOclxfl0qjP+PbFVNSeb0w
         EsCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020ac85845000000b0042edc2f3accsi9653837qth.345.2024.03.05.19.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQS-0000tg-Pr; Tue, 05 Mar 2024 22:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQR-0000pL-4J; Tue, 05 Mar 2024 22:58:39 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQP-0006lS-EV; Tue, 05 Mar 2024 22:58:38 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TqJYZ54dkz1vw6t;
 Wed,  6 Mar 2024 11:57:54 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C3EAC1A016F;
 Wed,  6 Mar 2024 11:58:34 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:34 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 09/23] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Wed, 6 Mar 2024 03:57:07 +0000
Message-ID: <20240306035721.2333531-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
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
X-TUID: f4eG1h0xYsb9

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
index 15f72fa425..39e76c76ee 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11540,6 +11540,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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

