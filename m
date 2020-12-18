Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2167906lfq;
        Fri, 18 Dec 2020 02:48:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxoGS6/m/+a9Z1XirzJvgcgjDPIuSacKeynGizEQcGKE7y1YwvTYmjRxGhJ/xPLBgatcWt
X-Received: by 2002:a25:b803:: with SMTP id v3mr5150304ybj.326.1608288493070;
        Fri, 18 Dec 2020 02:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288493; cv=none;
        d=google.com; s=arc-20160816;
        b=QV7LHAfyy7r/Ql/LyYElPr5h0l0+U+yGPyMI34uq/b8sfjJUqWdfLQ/EK80uYjxOIk
         a65OGXG6NWH8HOKTQCpbS6YUcWfqRj7oILh4Rft12VYA8ZZ2Wn5Vm9mj0ErlD17yEHOC
         bK0KAB/iarkvAjUJ1RwB9g8XhrpCFmQv8E4Wnc4byiOl/E0rbXbSE+tQib9A685q5+wp
         F0o9VFaJAePR8xtVf5ruuDU9zQkzptZSGJFg1mZ+zxmCAHOv4ORVntVRBOBBW/ZY0i31
         w+v2t2EDzrZ9RW4czubjt+B0PKy57BgTGUAJKaRdSdpFK4smJ1O7i/+kABer7x1l/nCG
         LgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=uGjcI52vN7OBfrVJYYTgd0OFGlaClFg5kkA90tqPVDA=;
        b=nICm9Hb6BIuZYhBwf6/f80I0EGBS+uPfXVQxFf69ZeomMEMSG4Ddvo3GX3hBOqFSy9
         KCoFUXfeeLrscT9QYd3IsEZVixJG3HkSsORwMweDd5oyk7lxwfZrtNmaijcTois+P4Ki
         imIp5kEq85NCKXGEqxTrnrKIBZSMD8TIvVeImflD/79kp7AuDwdrcJUgDIKKtZKpfUyb
         IHpIAWt9u3kYpmSZ8Pz5KANjI1MjczMmsWxjV33LMHNYE0rPBCw5P6Aap0HalEVHpGnn
         40l0xAq/0tqJ4PRGAIZPSqcYGypi+Gh+E8Yu5zRSf/67JH1bIllT5fU6OJ0X9fwPJqOE
         u35w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 207si8183953ybl.27.2020.12.18.02.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:48:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDIy-0001Qo-Aw
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9D-0006A8-CR; Fri, 18 Dec 2020 05:38:07 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55288
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9B-0003Jl-NL; Fri, 18 Dec 2020 05:38:07 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7F6C4600E1;
 Fri, 18 Dec 2020 11:38:01 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 07/18] target/arm: add 64-bit S-EL2 to EL exception table
Date: Fri, 18 Dec 2020 12:37:48 +0200
Message-Id: <20201218103759.19929-7-remi.denis.courmont@huawei.com>
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
X-TUID: rnrGB+eXJAcw

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
secure mode, though it can only be AArch64.

This patch adds the target EL for exceptions from 64-bit S-EL2.

It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
mode. Those values were never used in practice as the effective value of
HCR was always 0 in secure mode.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c    | 10 +++++-----
 target/arm/op_helper.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b85c1bf9d8..99adac5cc1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9005,13 +9005,13 @@ static const int8_t target_el_table[2][2][2][2][2][4] = {
       {{/* 0   1   1   0 */{ 3,  3,  3, -1 },{ 3, -1, -1,  3 },},
        {/* 0   1   1   1 */{ 3,  3,  3, -1 },{ 3, -1, -1,  3 },},},},},
     {{{{/* 1   0   0   0 */{ 1,  1,  2, -1 },{ 1,  1, -1,  1 },},
-       {/* 1   0   0   1 */{ 2,  2,  2, -1 },{ 1,  1, -1,  1 },},},
-      {{/* 1   0   1   0 */{ 1,  1,  1, -1 },{ 1,  1, -1,  1 },},
-       {/* 1   0   1   1 */{ 2,  2,  2, -1 },{ 1,  1, -1,  1 },},},},
+       {/* 1   0   0   1 */{ 2,  2,  2, -1 },{ 2,  2, -1,  1 },},},
+      {{/* 1   0   1   0 */{ 1,  1,  1, -1 },{ 1,  1,  1,  1 },},
+       {/* 1   0   1   1 */{ 2,  2,  2, -1 },{ 2,  2,  2,  1 },},},},
      {{{/* 1   1   0   0 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},
        {/* 1   1   0   1 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},},
-      {{/* 1   1   1   0 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},
-       {/* 1   1   1   1 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},},},},
+      {{/* 1   1   1   0 */{ 3,  3,  3, -1 },{ 3,  3,  3,  3 },},
+       {/* 1   1   1   1 */{ 3,  3,  3, -1 },{ 3,  3,  3,  3 },},},},},
 };
 
 /*
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ff91fe6121..5e0f123043 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -652,10 +652,10 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         target_el = exception_target_el(env);
         break;
     case CP_ACCESS_TRAP_EL2:
-        /* Requesting a trap to EL2 when we're in EL3 or S-EL0/1 is
+        /* Requesting a trap to EL2 when we're in EL3 is
          * a bug in the access function.
          */
-        assert(!arm_is_secure(env) && arm_current_el(env) != 3);
+        assert(arm_current_el(env) != 3);
         target_el = 2;
         break;
     case CP_ACCESS_TRAP_EL3:
-- 
2.29.2

