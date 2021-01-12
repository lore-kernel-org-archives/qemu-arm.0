Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3457156lfq;
        Tue, 12 Jan 2021 03:19:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOjzhScy/Eyi4NHXI0gbyMX3g88gwTeCwvwq9xItf7FInacpBKlQNqryagqFYXYhX1BHaG
X-Received: by 2002:a25:4d44:: with SMTP id a65mr5740281ybb.222.1610450346085;
        Tue, 12 Jan 2021 03:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610450346; cv=none;
        d=google.com; s=arc-20160816;
        b=z3D3XzGbB1t+s3vRoXmHtQ0Ydm/LE3zeEwpNvE9l5cTZ1cLYU49+3+2F1xt2zKAXf7
         2x9R0tJdYE8byd8WhW8VqY0C8IaafsY6NTexvymjB9iW+5NY4l9PguVyrK07hOHh1ApZ
         NzUj893lKRCMK8dtfI98PIrHHlkTW+sVwt578/k4Gc9gnxcUvytc0akSLLgCh0t6uHhQ
         49LUtdeS3X3VkS+MgjgKDXpn+iPYp3+rNpM2baIIvwCaB1R2U9ZUx0Z93ePzbsaf3tBg
         HgqJXZOLa03noKIxSqhRrGS7QTrFyr496/HpQUw1eOyGdPB8FMhoWt3wUt1IHquQRXG0
         SK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=0sHQC6jFq6qjLHZ2+SctmYGXCqQOipRS6A6UPAgKNAs=;
        b=Gn5GhvSXXlXP+5xIYNHsVSEf1oDIZ6rnrE6thMvlqcntkXh9khDq9X00ElWEbYmRUK
         Eqjc1nJMyF6kYiLqCBaLMvJ0py1OJgGzEdamrdCTsESZEPfIW2tvoQh0Ixg9iDfG0lbT
         4gljmQKjrFUYc2U+qDNo3BaSXMl6qcyRh9dH3OoN3nmSMDp3uEeOkClGk81MKeqXI6VK
         7x7YYU3R3eZn5ZHDixHjR8DutZiWJomc7YtFP0qqIu4EmK85HkK3AL/MstdFef+T22Bt
         BOGF6XaxTy7jk8oasOFmTyPkbKdVWvniu6c7FQ2fQnhv4GiF/yUyRD6LIeqh7Wm0ZXBI
         j1aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si2454779yba.318.2021.01.12.03.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHhZ-0007b7-FG
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBT-0003vB-Nd; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56716
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBM-0003St-V5; Tue, 12 Jan 2021 05:45:54 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 445D0602C8;
 Tue, 12 Jan 2021 11:45:13 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 07/19] target/arm: add 64-bit S-EL2 to EL exception table
Date: Tue, 12 Jan 2021 12:44:59 +0200
Message-Id: <20210112104511.36576-7-remi.denis.courmont@huawei.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YevnL9Du2usr

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
secure mode, though it can only be AArch64.

This patch adds the target EL for exceptions from 64-bit S-EL2.

It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
mode. Those values were never used in practice as the effective value of
HCR was always 0 in secure mode.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c    | 10 +++++-----
 target/arm/op_helper.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7860ccd7ae..bc228e070f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9001,13 +9001,13 @@ static const int8_t target_el_table[2][2][2][2][2][4] = {
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
2.30.0

