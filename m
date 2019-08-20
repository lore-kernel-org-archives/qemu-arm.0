Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp8241wrs;
        Tue, 20 Aug 2019 14:27:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHcCIpfpsnrG/pvkFGVOMILienYHa9MNGc6LDGwZIWydJjmqbtwp6lMA+Jvd0/o94sjR7V
X-Received: by 2002:a0c:e6ab:: with SMTP id j11mr13900239qvn.178.1566336467079;
        Tue, 20 Aug 2019 14:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566336467; cv=none;
        d=google.com; s=arc-20160816;
        b=nUk/IMpyI70PVD3PpPRqf8NEKO9IwotU6UfbNxogoO05JjEfLPKtPyZrxpuh5UVH+W
         GaxDWyo8LKVSaC0LqJMQRDm6MQQUp7Mzf0d8p6w+r84FSmjJKvwptYYq6+DGLqA9VyRK
         QG1vfBCJUmCmf+fIhJRUquXpDQlzTA0iW71K4ZUFko5UzJlBf33zgor2goRp0X5qpfyv
         eOo+ViMwALCO1+Fyndt1YNxXEddCeg+2YSYUGJDK4Nn7SxuopCn1M9TRUBjtJvkrGyE0
         Ykznk3Gf7P8suszyAc7uyB0QaBpzQFnek4DI4Wpupx1QTtBJiq3iQEHoUkxtzt1/02d/
         DIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nSUrF1uk3AduHW47FcRxNvtOuMuTx2/7SA2elwSehDg=;
        b=gMfF3ZCbXps41cgWuhFBkLWWOFFrtU3WBJVG9+Ga7Nn5kB5GJn+/HQLRB03UibwwGO
         z2DZCdowfCw0/UraYWaL2I7UnzQBZbrkPNeaDdnTWF+XteygXokx5nAvRlZsdQaIS60T
         u4qzPDyyBDLRDvP0exE7U69rgfFnaAgCQTwc1aeUvwDV/8mM3ARkfX1zWjlDmfKZk2ad
         yJFOlljAzu9yEjmM+WZmS2boPrOu3iUSl6nPPrvR+pXOFSTG8gukQAlLInk1OFZ21tIv
         AIy3Ir/rbzA8jWJ+LIcsZAUIexUPpU1klmxmcj2GOZYXZuRomyqokE8piCYx3h3MNUix
         u3kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dTNR3oOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e55si11452169qtk.14.2019.08.20.14.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dTNR3oOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BfO-0000ON-1o
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM0-0000JN-Ko
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLz-00009r-8U
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:44 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLz-00006w-1f
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:43 -0400
Received: by mail-pl1-x644.google.com with SMTP id go14so102403plb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nSUrF1uk3AduHW47FcRxNvtOuMuTx2/7SA2elwSehDg=;
 b=dTNR3oOr2NCBTwzIGc5R3Mdlzd4W9hzQ87v9G5kYcaGHqMVco+8liB/2+EAgpmBhyB
 6yorMPpZ8qF/8JbQ+jfn4zX0pHVof6G+HmrlgZNim+qbw0Aotp/nhcbu+6PLxbP6K2n9
 zYFFNSlVQdzn5Yu2uZKZqrIWNs3H2Z2KisD7dQtTE7G2YSwNQVpSgBliI97dXhNWRG90
 7j1dmL5slesU/eHbO3Ddu2jFPdqTqwoK3y1/B9YOlB/TU9F2JcuUwy7URET6K6ZcPET7
 ffd/NddUYcCEjisNLIUZbw4mX6jcFe3qK/hQND8S5kvQReznHxDvyOP98Z6YEYLLpDGw
 sZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nSUrF1uk3AduHW47FcRxNvtOuMuTx2/7SA2elwSehDg=;
 b=MD9hrxswy234v4847ChPhomm/NeTNQpdYUNOlBmlOoHD000G/MiM3CEHYIBrIJ6Xjd
 Az+iqy7gtybSGOaMOBznbhyv+upS5l04mR6w0Ojbsv/vIVrafED6oWRZ1CHza+66cdz8
 0Z6c6zAJzjbuEIFsRgg3oXzrcfg2c3nVRHbZx5piaKVSeMl9/6RcRJyqCwz+rdqHOhVi
 wtsnKKg3DxPjhJSyPWrVg5JMPeI/Eod9Z7h6FpD8A+DWTFH54UZrJFQ/8HgbaAGdrrEq
 tUwbhdnsW239OILF0MJA33lF1UW+O6WsN8E/wfzYj1gj+xXZaa14CJatZnom1iC/B65o
 e9MQ==
X-Gm-Message-State: APjAAAVnerMH2RC3zsKbo5nxO1TefIuxATzeBf2stYJxFK0pN+pBpdWR
 VGRxENc41M2NAVmb6/hdwUeXLYWavdk=
X-Received: by 2002:a17:902:5a04:: with SMTP id
 q4mr30699862pli.280.1566335259913; 
 Tue, 20 Aug 2019 14:07:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:16 -0700
Message-Id: <20190820210720.18976-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v5 13/17] target/arm: Split out arm_mmu_idx_el
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGlmseU5eQ3Q

Avoid calling arm_current_el() twice.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  9 +++++++++
 target/arm/helper.c    | 12 +++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..f5313dd3d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_mmu_idx_el:
+ * @env: The cpu environment
+ * @el: The EL to use.
+ *
+ * Return the full ARMMMUIdx for the translation regime for EL.
+ */
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el);
+
 /**
  * arm_mmu_idx:
  * @env: The cpu environment
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 83ae33dae5..19bdb9b9d6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10988,15 +10988,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
-    int el;
-
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
-    el = arm_current_el(env);
     if (el < 2 && arm_is_secure_below_el3(env)) {
         return ARMMMUIdx_S1SE0 + el;
     } else {
@@ -11004,6 +11001,11 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     }
 }
 
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
+
 int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
     return arm_to_core_mmu_idx(arm_mmu_idx(env));
@@ -11164,7 +11166,7 @@ static uint32_t rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
 
     if (is_a64(env)) {
         return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-- 
2.17.1

