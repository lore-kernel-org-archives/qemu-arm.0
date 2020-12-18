Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2161918lfq;
        Fri, 18 Dec 2020 02:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMHY9EoAykq173V9sluR1qoJmOxtyzhDKOASLHDOknroDvB0tuwMLj7WHJMAVRu0qPQhwd
X-Received: by 2002:a25:84cc:: with SMTP id x12mr5148776ybm.426.1608287897004;
        Fri, 18 Dec 2020 02:38:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608287897; cv=none;
        d=google.com; s=arc-20160816;
        b=OK3ZNZmHCb5664TV4SqycosiJsrtYizyLZ+zJcfWFfGbIOpaAP+DTE6NHZcteswtJE
         wAJ2W/3+yXsKaB8OU0boiwGYygxamT4icyL0PZtcc23J5PadT2+NMDMHcTIMpXGnfWoH
         hTH78W1z5SzFgEuGo3hfh/7hCiPmfSwQc1vL67pK3ZINrv5coXj/tsnlwxoJvAemq0As
         xOFCfpGs34jvfZtOLTSx8yS6KgN7lvIoTIr61768q1D3h2BeUaHrB4djd7oZrW4TiEbq
         sxrPs+ONV2vo+ur91keUKiUw4JjA7+3l1Rz9YO/reYYibJB115h6KtQ+DcO9GY+7Cgxl
         8xWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Dax2cXVBJa3NOoXgxgMq6eSe8H5SzlKbxcONi6s/ZpI=;
        b=vufLmrhQPm1jaR107ujOGJsJIvWSBA/Pd7LrvxVaJCpn2Hl17DM4jeh4NQbJ6zQPbu
         2Qa9SyyskqLYNzoitsBREZ60jE8NqQ1dGB70KUklVsBqq2jxYJemUOAkzyUaUp+BORkH
         IYiUjG9pwmjf47Y49i2hEcXHr0DAi6sO5BEHdKukeMLdrXgH8l9zaCKMdnLWBipLzx/o
         YiwQAkpf9HaCTi5S8U9lIOvgVS+KbwS86wtS6jXR+xjy3/0VZu4Ir4CA/jb86Ja+DG60
         YYh3+cIu4wz3TsEB4zmLKqkDIiqNhbF81o7IOFN3iw6Z19YN/hIJgJIQdk05mmdZD1As
         9t1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n67si8692179ybn.37.2020.12.18.02.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:38:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqD9M-00067F-Af
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9A-00063c-NV; Fri, 18 Dec 2020 05:38:04 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55278
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD97-0003IH-8V; Fri, 18 Dec 2020 05:38:02 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 18FBC5FD51;
 Fri, 18 Dec 2020 11:38:00 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 02/18] target/arm: add arm_is_el2_enabled() helper
Date: Fri, 18 Dec 2020 12:37:43 +0200
Message-Id: <20201218103759.19929-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bb4jKL0ZfmeB

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..a37ae8eac6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2072,6 +2072,18 @@ static inline bool arm_is_secure(CPUARMState *env)
     return arm_is_secure_below_el3(env);
 }
 
+/*
+ * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
+ * This corresponds to the pseudocode EL2Enabled()
+ */
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return !arm_is_secure_below_el3(env);
+    }
+    return false;
+}
+
 #else
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
@@ -2082,6 +2094,11 @@ static inline bool arm_is_secure(CPUARMState *env)
 {
     return false;
 }
+
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    return false;
+}
 #endif
 
 /**
-- 
2.29.2

