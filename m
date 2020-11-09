Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3663888lfb;
        Mon, 9 Nov 2020 06:13:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR9CmHQq78L7+wZMEjCs06X/YVTOt56Tmw/EqtpR9j+/HHl+HkYUlMWsC70D622CGOPZ7m
X-Received: by 2002:a25:774c:: with SMTP id s73mr4041687ybc.262.1604931197147;
        Mon, 09 Nov 2020 06:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931197; cv=none;
        d=google.com; s=arc-20160816;
        b=POpLVB/KH5LyXb6+1vrwfHN5LiRqubDAVA2/RwYezS4ZKfn3bTQkRhZ+bakknjqbPU
         2vTVmWuSZ7lf06xPQUihPJqoYL7rpP2yhgbZza1UxwbYydh/Xgb7LEQa1BdakF1KBArY
         okQYL1n78gfLPhKRXeno/PS91C4HWRXmhyUUWRyQXfuZNnnAJnH4wIXfN0fb516zeHbP
         bIBjoJBMfBIiTBrCD4emuvZQ84AZv1T2N3odiwnhu+tsz0PZfRhZ2SIYXowpOKwLpU9G
         jmV2IOOfimxDkKTiSeKWIobItP1bvUThqiTW78eoycb2awmZKuBnyZ9nDqCNiXDRRYrD
         tSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=U4teBWxBK918BkGXIbOm0FC07WJMn6uDWiKZGpjPyc0=;
        b=Jf3A/Zvixq+Ov/ZqOjWjZucMKECog7/A76O7A6+DsGqiY/VXeXJ6DeWkhrBO4lINZN
         MI967jD44kXTu6xdUHeE8On52hNx3mtH6XufFenRrZnENpMi0vU5DXmTm8YOCFUJ6ZIa
         LnpoeTJ1rLLesR9ZeBQZeymDHgH5IKyKh9au6Nl+oRAyoALG1KHzKIvFrflBQWwstB6y
         GfY1uVrI5VfxIZZ7Pbi6T3TDStq8sSXHPmIA6DAby7dX1aMDxGkBO/Wit4pLvnDwqf1p
         dNoimT7MKWUU9YmFBABpuEnL7u44z0B3y8nhrHfLMHM93A8GKVoDhK2gpNtJnLtDNa6b
         4G1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h62si9061962ybi.5.2020.11.09.06.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:13:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc7v2-0006VE-HW
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sK-000323-Gf; Mon, 09 Nov 2020 09:10:28 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60172
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sG-0002kg-3x; Mon, 09 Nov 2020 09:10:28 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 3F5725FE42;
 Mon,  9 Nov 2020 15:10:21 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 02/17] target/arm: add arm_is_el2_enabled() helper
Date: Mon,  9 Nov 2020 16:10:05 +0200
Message-Id: <20201109141020.27234-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: dIEXVgUfdt9d

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c18a916766..adaded6bab 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2040,6 +2040,17 @@ static inline bool arm_is_secure(CPUARMState *env)
     return arm_is_secure_below_el3(env);
 }
 
+/* Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
+ * This corresponds to the pseudocode EL2Enabled()
+  */
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
@@ -2050,6 +2061,11 @@ static inline bool arm_is_secure(CPUARMState *env)
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

