Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp480847lfu;
        Sat, 30 Apr 2022 23:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQzuQNqCZTTGfI4AfyAD3tgMDLaCMmswkG0XyuFxCoZy1IVMg4ZtSfJlYvIxDPoDt11/2z
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id jx7-20020a0562142b0700b00432f7e6e443mr5398558qvb.125.1651387188094;
        Sat, 30 Apr 2022 23:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651387188; cv=none;
        d=google.com; s=arc-20160816;
        b=Rr/33H70EEmnte37Ed/aPWHd6avwkvW8dweAfzA0F8qZ6xYLv89PmXDPYdsXTYL1TX
         483IjMPte5UGhN6XLOxh3UchYOYl8Fik2R1W1BxDQJWYD08pa7p8s7YG+WlbFdBcrMUP
         B1tuZNaw+uar9VaExZVmpnDoukfdHPOTOJ51/WMBUYs2zSKhxuzm+UdEgcmMP6uRveq8
         OGs3KlEymdf7CQKUy4f1eDMVPnnqt5Ltx7Ik1wq1mbusZBxety3y2VRuU1FLXivw3Jkg
         bhx0KX+3PaDFDSA+AQK6ka2jM7pVEA5XK2skcFvGEWgIqRMnCg04CEmA8cngl6dLIgoA
         1mnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
        b=JXXUVSmfPFZh4IoAe19bEwdirtSNxr68+RloGc1OS15bqAtRWjQ6WMuERwJ6rjCNzd
         vH1lCL8RM9bE7ruqKaoL8j+/Ou4KtXk7kFN5qnaGDxK8daJu8mF96NlfYukxEolpyyJp
         Ge103QRLf8VVP0Lsz3+3PUafyVRCCQXa9ZPe9j5gi6ikh9B35LzhCyWtnDqgfmbaY2Wx
         32MdfK2Gi/PsKW+4D4YmAWqvl1LgmUzAL5zsWjWPWWn9/jsBSA1+wvQVNbM7eSRGP5US
         j7qWKJQREKlKoaLnYoHMjwj1iUnva+PKziQ3GF3PIuxQ9y5BMFKAaMDEsnlHJfUpIyH6
         ++ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rUOWgaS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm11-20020a056214268b00b0045a8612ddd6si487859qvb.130.2022.04.30.23.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rUOWgaS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3FD-00070X-Iu
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U6-00071x-M0
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:08 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U3-0001PI-Tg
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:06 -0400
Received: by mail-pg1-x531.google.com with SMTP id z21so9509726pgj.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=rUOWgaS4vwR8VVvkrEvuhKIa7e1UdDZddaGjJek5fnPe9pFwWKkBWiX91H1aqAKuc4
 o+akn8esQQieNVMXFK2q/Jnoz2PoKtrFlI3XW79A4aJbllbo9DR6Ug3FFs/mpbbFr/hL
 2k/+T9gqGKgE26fBhoyMts2ZGfjtZZEaTI1PuUHrvpIBiH9tlMNEZ8gK/MKQ/OXnCgG2
 qEP8SEUUokr1aFMQeg3FmdjsF8v41DWyTsTm6OuXa/WsKLuKerTKd6BXZ9iACgwHT81z
 +RqVR6gcls8C6KP7X97HMaApkflDjN7FINGLIcrQngBRFkGU7FvuSCJ+i+MPLwhu3bFD
 6bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=hpKFSwbkMiAWiHHlpiNuDmtr959NaqyjZUx2QUumFqVpQI4fQk+33TQxuoydReJ4Ed
 0mmYvHhycff91XtkHcvPNyNQGqemBTWiUblRssnXXx2LBI4I2jV4TbB91byB8SLyCz37
 fkdbLRC2pl29VtKexf9GJ2TtWaVE+EIhppPYdTE9mb9YoJTuJYrHWwE9CBf5QHbITT4g
 vc1CZHFUO9Rn9yTQXnIm4KpcGCSFFt/WKvKa/HAG8LB4SMh2hIdK0MXNTq+TlR/7LU1K
 +WTmL6nf94TT90XbGPoPuX7PKnBFJUrucs0Fon0C7NR5n+oHlnMnz8uoiR++P1c6n007
 oV1g==
X-Gm-Message-State: AOAM533OGf8ADmTHvNn8u+tnrXnL3TkM58zrxWokE/KOHHRlXJ9JGTxx
 j7jI+bKMqImkZh4t9b/ZYop7H3rul5FoJQ==
X-Received: by 2002:a62:170b:0:b0:50a:6901:b633 with SMTP id
 11-20020a62170b000000b0050a6901b633mr6221375pfx.34.1651384260981; 
 Sat, 30 Apr 2022 22:51:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/45] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Sat, 30 Apr 2022 22:50:14 -0700
Message-Id: <20220501055028.646596-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NlgQDlGC6AhP

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 965f35d8c9..0acac6347c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 202fd5c46e..88d3cef93e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,7 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b6fc3752f2..337598e949 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,8 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.34.1

