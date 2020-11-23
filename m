Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3389698lfb;
        Mon, 23 Nov 2020 00:07:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjIQSWXi17FP2cxBeJoYh3qIKw/JjqLN4u+gF1YWGZfbmJe6VTOnWdQ025rOqnbmuxc/+U
X-Received: by 2002:a25:22d5:: with SMTP id i204mr51599704ybi.0.1606118875062;
        Mon, 23 Nov 2020 00:07:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118875; cv=none;
        d=google.com; s=arc-20160816;
        b=1FPMUTHZhEti6iPOTq1+N4hCd2g1okaMeM3+62mJU+BpfuROOLII8Yd7SWF7r3xMB1
         on0OrMUxnx4OfeYqNuxEvHQDFL4CDEV7h8SjMpGCleX3UzqymMKiWlbU1rfpH3j4jrma
         zrE/yp572ZZDe1MTSt+bb9YnCkoRYFg2Lf/6vt68LVSunS0VEbMFK4OlqmoxL48jak8E
         9vcmC+APNZxWdROy1LYOcL9pGEvm3J3F+v6Bte5Ej+hWOjBEQIHOiJJE6D2dy/6jR+JH
         2PzbKr6hQKdwTy26AGYZK28kcfLhLFg2p45WBGLoMDGvvvFD8/4FUQCN3+zIMPfgIcww
         j8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+SGhqfcLqjx/l2sLRD+rUhLUd2YgOXuwFjIlwW1SR5w=;
        b=LVyrYICskyZWFw5WSqVKLip8n7wSeOYXhMnP7A1HSSSds0YFfNldjsDNg641mTQfk/
         UGZ5S73J/CafPKYZeNMvG/XiyNrFYqCUaUy7mCGUlQfMKRnmMLzxccnatQwBFFKHE4OK
         gxoZceNxRqueWWWlmmoCD1XLhTQyiBaFGgoQOB9pb4RCJrZawFfTvAi/lP+NAc7yxiht
         diESogNZIrJcPVxBXgN3u2uu7eFiSU0UmKH29XWd1IBzO4YIZ93U07qIP3XtlysyzTu2
         HExR4o/qun5YoC/tZmrYfFIZ62t7wLuc8/kw1nrOmnQxV5V/Xj43JatSjaE0q6qj5LAy
         IRWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si10739159ybh.491.2020.11.23.00.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:07:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6t8-0003B7-Fy
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6o5-0005kg-BJ; Mon, 23 Nov 2020 03:02:41 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54620
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6o2-0004dk-OG; Mon, 23 Nov 2020 03:02:41 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 873225FD4A;
 Mon, 23 Nov 2020 09:02:37 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 02/17] target/arm: add arm_is_el2_enabled() helper
Date: Mon, 23 Nov 2020 10:02:22 +0200
Message-Id: <20201123080237.18465-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
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
X-TUID: CRKL9I6WtBhT

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..30b5af5cde 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2040,6 +2040,18 @@ static inline bool arm_is_secure(CPUARMState *env)
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
@@ -2050,6 +2062,11 @@ static inline bool arm_is_secure(CPUARMState *env)
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

