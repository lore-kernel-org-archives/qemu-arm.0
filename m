Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1168409lfa;
        Mon, 12 Oct 2020 09:03:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhNDMG89NLW/7YQ5raWWp59yiOq820nqQ1uB3XJVKyp8O55CxhP9HF2U0kCyzS7jerJR1l
X-Received: by 2002:a25:ab31:: with SMTP id u46mr32097469ybi.161.1602518598692;
        Mon, 12 Oct 2020 09:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518598; cv=none;
        d=google.com; s=arc-20160816;
        b=K2fH0C8KiBrcLrR1lCf3tpd9gtPrEWvHk2B+ycMSb/dpNhfI5qGRlof+uKV5CABjaM
         ujteZvgxnAUVQpbvb5+jUsAJ6/IQqozsJfgNG4VJfNjEZN114YrGdKfBU+6d+awbVyvZ
         wasCI0ikDVMIa+SNIDmK/jCP1RyJyQ6ADIH/sh0F4G8b9kWoEfVHca414TFuPUTrvETH
         10nJZnmlARhNut4bi6GsE1W9WytXksu6t9+kbHkQ9naHgt6/7s7AwbrxND9RBJ69u/eY
         ozXOGlr9YkK747RH0lt8Q4GvdVJp+FJRjkVhgVRNGLysiJQmZqIckXf+cbLD0CFiPq8v
         Au3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=karobGThPUBbxRoaP+yKeLZSzAdIl7EhuaiEL3CMR4I=;
        b=d8ZutfXY0UDaVdIQVk8yEVTA7W+qOF8Cha1yexU/HEkMTgpXrHlb+Bh9kCRgolIlDe
         kYtlQAfsFUTXBHyr15snR/pMJVnR+5LosRhuxPZDJUp/RNHPx6Rg5x3dfbn1wk4wFTQx
         kCSH4yRnvofV+lUeVZOYSED0X+XVgoaXb5FVmDsXomizMA07znJ4cxorOzUJmQEtc1E/
         VhvJeDnhnNGlw77Qi+1AMw27Dk3GmBKBP0hEfDoIkKekXuc7XAZoTOqhdlsDkDKICzYf
         qfvcI+pCZLxIJ01WQEFAD2WYCZd98ldXM4x2jCXDMGGYeTlfUtVcuJZ6PmGWyKXpdioT
         k1jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pB1gdTf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si14333042ybi.303.2020.10.12.09.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 09:03:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pB1gdTf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0IA-00044n-1g
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 12:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztk-0003jc-P2
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:05 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztf-0007mb-Gx
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:04 -0400
Received: by mail-wm1-x344.google.com with SMTP id b127so5150042wmb.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=karobGThPUBbxRoaP+yKeLZSzAdIl7EhuaiEL3CMR4I=;
 b=pB1gdTf6L1Hy1roe0BRvGPb8EXrIBhUrtaB+/QVj4KAv+etAljPqtZ+CMfpTatXXU5
 PTCmXyMsX4aaf0l5BqBHW3kztsLnAOd0qVsOhcIJ0kUzwZwYjF2BAat89k0XWk5ACnRU
 vQwGt3Jd5J5kRjfQyj1M7VDXP2S3XSngTGcFG1iu15ss+s2O0e5LuMg7i0BSrxFoZrwO
 uQ1mZ6k/zJAUJMNtX14faQ8iU6zgvT5mSMTNIQahGmw7BwHjH4gbMQ/WpTEJ3MwWYD8b
 26SA9d9tEDuDqk/0WZIKLXnByjvlbI7a2HwilvbrUWVGqjsg7LtsrBjXe3Hb4b8zOaa7
 y6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=karobGThPUBbxRoaP+yKeLZSzAdIl7EhuaiEL3CMR4I=;
 b=JK1FtGyslF80BZTzacLVguU/0hLeM0oeproPGlxre9AH7fmfqydrYEBgusQ+1AVTXK
 5PZfjqrfW5hNI6ThDfi2mzD/eLupSXA0mqNpAwa9LGxDx7ztyjqQwYk0QvI7139GgF1A
 eEBN/Cpnz94GX4RJrD5EeGG6ZSybz4WIWApvxXH4KyT/0x8Yal9cU0eHLyCP/p/amors
 5NCDfS+5AnmNQAd1JxxOpk3cZUM4p4puA61q53Dtr/xV2z3kVf/MgY20T2QLr/d2OY+U
 gdCT+Zgj6SBtsRYPkQbvIGStYybsv90SGcdG/AAxqIrQiuP+8/wHJVqa/gdXpGFNaaKI
 We1g==
X-Gm-Message-State: AOAM532SbGswngWcjlAg9U6ez7L1aVH6euG3CrEDAsXtJFe+0vg/6uIO
 KTcYie83ttQPPD9MN56EF3Hjm7F9fnQZZE/g
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr11718388wmb.181.1602517077201; 
 Mon, 12 Oct 2020 08:37:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm7095961wmd.14.2020.10.12.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:37:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/10] target/arm: Fix has_vfp/has_neon ID reg squashing for
 M-profile
Date: Mon, 12 Oct 2020 16:37:44 +0100
Message-Id: <20201012153746.9996-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153746.9996-1-peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6PJEGNEHmhS

In arm_cpu_realizefn(), if the CPU has VFP or Neon disabled then we
squash the ID register fields so that we don't advertise it to the
guest.  This code was written for A-profile and needs some tweaks to
work correctly on M-profile:

 * A-profile only fields should not be zeroed on M-profile:
   - MVFR0.FPSHVEC,FPTRAP
   - MVFR1.SIMDLS,SIMDINT,SIMDSP,SIMDHP
   - MVFR2.SIMDMISC
 * M-profile only fields should be zeroed on M-profile:
   - MVFR1.FP16

In particular, because MVFR1.SIMDHP on A-profile is the same field as
MVFR1.FP16 on M-profile this code was incorrectly disabling FP16
support on an M-profile CPU (where has_neon is always false).  This
isn't a visible bug yet because we don't have any M-profile CPUs with
FP16 support, but the change is necessary before we introduce any.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 056319859fb..186ee621a65 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1429,17 +1429,22 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.mvfr0;
         u = FIELD_DP32(u, MVFR0, FPSP, 0);
         u = FIELD_DP32(u, MVFR0, FPDP, 0);
-        u = FIELD_DP32(u, MVFR0, FPTRAP, 0);
         u = FIELD_DP32(u, MVFR0, FPDIVIDE, 0);
         u = FIELD_DP32(u, MVFR0, FPSQRT, 0);
-        u = FIELD_DP32(u, MVFR0, FPSHVEC, 0);
         u = FIELD_DP32(u, MVFR0, FPROUND, 0);
+        if (!arm_feature(env, ARM_FEATURE_M)) {
+            u = FIELD_DP32(u, MVFR0, FPTRAP, 0);
+            u = FIELD_DP32(u, MVFR0, FPSHVEC, 0);
+        }
         cpu->isar.mvfr0 = u;
 
         u = cpu->isar.mvfr1;
         u = FIELD_DP32(u, MVFR1, FPFTZ, 0);
         u = FIELD_DP32(u, MVFR1, FPDNAN, 0);
         u = FIELD_DP32(u, MVFR1, FPHP, 0);
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            u = FIELD_DP32(u, MVFR1, FP16, 0);
+        }
         cpu->isar.mvfr1 = u;
 
         u = cpu->isar.mvfr2;
@@ -1475,16 +1480,18 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
         cpu->isar.id_isar6 = u;
 
-        u = cpu->isar.mvfr1;
-        u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
-        u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
-        u = FIELD_DP32(u, MVFR1, SIMDSP, 0);
-        u = FIELD_DP32(u, MVFR1, SIMDHP, 0);
-        cpu->isar.mvfr1 = u;
+        if (!arm_feature(env, ARM_FEATURE_M)) {
+            u = cpu->isar.mvfr1;
+            u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
+            u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
+            u = FIELD_DP32(u, MVFR1, SIMDSP, 0);
+            u = FIELD_DP32(u, MVFR1, SIMDHP, 0);
+            cpu->isar.mvfr1 = u;
 
-        u = cpu->isar.mvfr2;
-        u = FIELD_DP32(u, MVFR2, SIMDMISC, 0);
-        cpu->isar.mvfr2 = u;
+            u = cpu->isar.mvfr2;
+            u = FIELD_DP32(u, MVFR2, SIMDMISC, 0);
+            cpu->isar.mvfr2 = u;
+        }
     }
 
     if (!cpu->has_neon && !cpu->has_vfp) {
-- 
2.20.1

