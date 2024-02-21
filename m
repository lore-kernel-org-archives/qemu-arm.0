Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1984584ejb;
        Wed, 21 Feb 2024 07:20:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFOsr2BNXggUjoIMr4q8M7JRAHSVznOt4kelrWTaTappjgl0JUI8/FRY547a+mEZ8GJKzp/vINblefKkPGgoyXacIA3ZSz
X-Google-Smtp-Source: AGHT+IFfl07Ix8RIF24UtnKrrfT1TqS+30PW5QKakMeb15T90rqfvNJ+cGw2kQaVzVXHxhgyh/BI
X-Received: by 2002:a05:6214:246b:b0:68f:2d7f:6697 with SMTP id im11-20020a056214246b00b0068f2d7f6697mr20268227qvb.20.1708528807978;
        Wed, 21 Feb 2024 07:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528807; cv=none;
        d=google.com; s=arc-20160816;
        b=FHI3FIpkyFYBC9VirrLzWALqH3mZij0ASubPzv3i8DfDXia5B5vENtY4KPXXzQZo8X
         0RW/drAgCud7qntVHKJbxIY4fD4P8lcKwoaxZy+vbywymAVbw9a7eZoNl82TxEhj4Iri
         FuZXnxJo4nHZK+c6g5TQaC8HYNGja46xl1Q6UQ0wCO336XdQhAg1X8s3xiO7Q2IJw7Lz
         UM+SD3xkdaV0wh3zT2JGYmCDCD5CunsLzhiMy7BMWBkaxsyK+VaYVDo4RM8PHW1bmUgN
         5J+aCiJXEHM3iglzcxW3isDuQ4KVzmv+i9fboM5fs2LaSX4KWyi8NnotkzIZlW/3bN7Q
         mwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xyU88emFqncOdzEUy+0fG1TCFgNYW8aR6kct5Cr36yI=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=r6U1suU8XyblemMvsoObnzCuaocJGqIVtWBMAjrbjC7/CIrSOO9xdGUOYVfZzsWizp
         57YsmLx1WhnJyezwcz5plgpr+KS5R/1e7zChYXtomtxQLG6ohNiWQenCDFDyjgp+KR+t
         RddzbM+1ImRjGObWZiTgl7yoUmPchKvmHd47jdaE+dY4LVv425SF+PrktXvVGVmGFAJ1
         X+x5+y2DjU2fyCNOHiAn22qwuLjVlT5t0Nrm8Xl42LxBrzkswBbulgKr1hjVztnb5c70
         sHjfElQEpEAPPcfd6Gi/XRFlPzhuB+g+HvrimvDnP1Kd5MIJacidOZtD97tqcYKEP+Jm
         L+Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a056214202500b0068f8b5aaadasi4653194qvf.284.2024.02.21.07.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:20:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoNS-0007EQ-2O; Wed, 21 Feb 2024 10:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoKR-0000wC-Tl; Wed, 21 Feb 2024 10:16:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004pK-Mi; Wed, 21 Feb 2024 08:09:42 -0500
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxPx3nPbz2Bd9w;
 Wed, 21 Feb 2024 21:07:17 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 787D114011B;
 Wed, 21 Feb 2024 21:09:26 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:25 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 05/22] target/arm: Support MSR access to ALLINT
Date: Wed, 21 Feb 2024 13:08:06 +0000
Message-ID: <20240221130823.677762-6-ruanjinjie@huawei.com>
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
X-TUID: 4G3ob+vdS0ek

Support ALLINT msr access as follow:
	mrs <xt>, ALLINT	// read allint
	msr ALLINT, <xt>	// write allint with imm

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a3062cb2ad..211156d640 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4618,6 +4618,31 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->daif = value & PSTATE_DAIF;
 }
 
+static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->allint = value & PSTATE_ALLINT;
+}
+
+static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->allint & PSTATE_ALLINT;
+}
+
+static CPAccessResult aa64_allint_access(CPUARMState *env,
+                                         const ARMCPRegInfo *ri, bool isread)
+{
+    if (arm_current_el(env) == 0) {
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
+    }
+
+    if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
+        cpu_isar_feature(aa64_hcx, env_archcpu(env)) &&
+        (env->cp15.hcrx_el2 & HCRX_TALLINT))
+        return CP_ACCESS_TRAP_EL2;
+    return CP_ACCESS_OK;
+}
+
 static uint64_t aa64_pan_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return env->pstate & PSTATE_PAN;
@@ -5437,6 +5462,13 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL0_RW, .accessfn = aa64_daif_access,
       .fieldoffset = offsetof(CPUARMState, daif),
       .writefn = aa64_daif_write, .resetfn = arm_cp_reset_ignore },
+    { .name = "ALLINT", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .opc2 = 0, .crn = 4, .crm = 3,
+      .type = ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = aa64_allint_access,
+      .fieldoffset = offsetof(CPUARMState, allint),
+      .writefn = aa64_allint_write, .readfn = aa64_allint_read,
+      .resetfn = arm_cp_reset_ignore },
     { .name = "FPCR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 0, .crn = 4, .crm = 4,
       .access = PL0_RW, .type = ARM_CP_FPU | ARM_CP_SUPPRESS_TB_END,
-- 
2.34.1

