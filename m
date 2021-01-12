Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3447550lfq;
        Tue, 12 Jan 2021 03:05:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP3dR1x+md1c8cjATrVeEgZUZZbnKi/TjP0Xb3soxvmDYsR1v+L7gFRq3llSBAQqBh2tLD
X-Received: by 2002:a25:6dd5:: with SMTP id i204mr6078256ybc.78.1610449551860;
        Tue, 12 Jan 2021 03:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610449551; cv=none;
        d=google.com; s=arc-20160816;
        b=IFYAgJu7Mk5a5We+EwYrxIuBVKWf7J6tGO93R5v1eLNOAtIvCKhCQecrb4wAkDb9hL
         fBo/NVqpT3tFx/ulqrwTelsxQLFikxGuVVrwDcyDVwPNx4jOQRz+HoDSsELHfnu2gKuu
         HmPDzdB2n7iSpiFlg/kJW87RW8tzS/nyfKZoWEsseTWXBKUOLP4u41GYCGSBE5M7jPTG
         UrAZJ7BIj3sU87h/ZwMXWX9/EslWZyTtJTgs+WmxYnilfVXPpeeB+V6topmusAnwBaAy
         ZKue2E53/D3SWtXgVvB+6BCWOSwWNAy/J2Ngi2AbVrBlC6cPewQuIqeKRqFAtX2DfSLi
         o6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=s2+vNMwcfhCQyqwvb6dZHjZY2atcOcsHy/XC+pqouWM=;
        b=WBipgq2Iz5Tv/ZpOvUdJaBw7/KwbV+u+sUMW2aSb+PCQLfgePR2FqjlZnXu5B5tW5K
         Og+aMEJNKGLcpZDe1ORKI/6VXRSEZZONWBlWpd/F9qO1n6q/4b373cvswD/lOy0qm/dd
         qLqmM9S0BEs5Vrqa+42RYUWfs+z9nMxP6W6POyKl9pYN2EruIo+P3ywq+EqwhfedkyI7
         5jUO/p30cTd88W0tsDOYH83O+Y3DfHx+TcNE+l0ZpIzcOUJ9jkSrE6s5pOgJMFQFGFeH
         EHFszBIrkAxyH1SRzQsR0AA/yJ4awBbyKdMbNXWWlIrKqRvFXOVAhCIX+oOVdPuM600n
         pfNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si2349424ybk.438.2021.01.12.03.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:05:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHUl-0007Ff-7C
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHAy-0003bF-Gb; Tue, 12 Jan 2021 05:45:27 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56706
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHAr-0003LV-8m; Tue, 12 Jan 2021 05:45:22 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id D97565FE7F;
 Tue, 12 Jan 2021 11:45:11 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 02/19] target/arm: add arm_is_el2_enabled() helper
Date: Tue, 12 Jan 2021 12:44:54 +0200
Message-Id: <20210112104511.36576-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
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
X-TUID: uNsf3o3paLf0

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ad37ff61c6..0881e0157d 100644
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
2.30.0

