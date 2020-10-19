Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3961235lfa;
        Mon, 19 Oct 2020 08:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUVhJPK7IBpUw+yc3ukEuRP7/3v6/RrcRG/XciyuT/rLL9sjFT0h5jw/K1R3yMJ6Cx+HSi
X-Received: by 2002:a25:344d:: with SMTP id b74mr208319yba.500.1603120697825;
        Mon, 19 Oct 2020 08:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603120697; cv=none;
        d=google.com; s=arc-20160816;
        b=V5aB7zw5wLfqaUyPCuMX7iAW1kPTou/K1LEt/ByVtqwrNBHjiYyzTje+B1X+j2/Hym
         N7+cqGlpDxE2wpusSyefBiCay/8mRbDHE+SZDDYbb8z4+TaLDhCph4fDJExUlD9PRyV2
         aOyV7N6Am3NjrIB++wUbsWXE223XZDWkrNA1oSeghKIjMGOvVcbeMEa8FkfnAfMgqJf6
         TnidCfzvlDxO7CUuOPJGcOXyf4sq4r+n0VPruBcSyhuqal72n+wwYzlerDv3KY9jtXyM
         vItLfrKOjtYxZkPmdjUZDUhyRGOptQZmWrS+IJwKcBQpmc/udpQI9N68URZj2h/UB7aZ
         ms0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6hKic17i51H/7+th1/P5umqhoIFiqn2jr04cBxU9UUU=;
        b=Vyl8XWkTEUSzoEy4b2v0BZQLX5L2Ft7ha+Ly0LskxuVdirWD8lmilmM6sBiBkbEfcu
         08gtVjatc9Elb9tByM25oDsLs8kdVn90fb4joaVsamoRbsZeOoqyyIT9c90nwMwC7IJZ
         Yhh/VoxmLGaSbiiodqYVGDMqz5ZDNvn4fERMHaapB/AvCApiSOVKv1/KrL+L6AZBXWxU
         fNbiYR0SuCOBKx6GMdsC4Hirw/oT9gSc+nfzNDq2tnDFENSJ8mpn0kA7PY+iznqP+K1+
         InWD6vM4Xvl5IGV2j/zl34uWLloK0uV9k5NeIT38iG9mguaFcoZBFEDUq5dDom6mXtoF
         7aLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XO/pELET";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c73si224642ybf.305.2020.10.19.08.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XO/pELET";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWvR-0003yl-6a
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqc-0006vH-0S
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqZ-0002lf-6M
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:17 -0400
Received: by mail-wr1-x444.google.com with SMTP id e17so83547wru.12
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6hKic17i51H/7+th1/P5umqhoIFiqn2jr04cBxU9UUU=;
 b=XO/pELETpBfePYzggX2WerIDXKceQabShhBSBsEq+UtA//1x/7mx6XFoGSmpHtEpIY
 fYVOjvtUpzEWyyS+ZNP6Z8hQjvuY6kEUfMXJUv7o0f1g6KReHTgio8+9w7xxtUdaOYPa
 PJr7Ho/0IGO8lca9gLnAmhJG/tK0IjBUnWStzJ5Q/YMUy/elxGLxVTVZ3zbADPeIQwrv
 JqPeb7n6NiJiRKoWG7ItUZXuJBtCAHyK4uxnQT2sYcCIz4dcTPtw4PTvYr0/Ve6jXUjH
 wWQOANOZzdpu4UMvYlRdrdI4lSG++qufwTuHiAPOxASxP/R5R21oJ2g2vZc4WRF11VJ2
 F/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6hKic17i51H/7+th1/P5umqhoIFiqn2jr04cBxU9UUU=;
 b=HOapyF15CP07qvUHOqahfgsgpaucCjFvmmYkIJIBR8kb4vDZOpmh1ESKuPe5+NM1eb
 0O/slpp1qM4xlv0kuRcXkDXlj3Zb/EX24qosCJPvybBHjdOBEfPXBHhiNejXTHmqY+No
 AjJ7XME+j65O2Ls5LxqybHcjTR4eUio4GeSnMKQAzgS8r0xh8T5u0eHac6tSX/pZjI9W
 fZ6Tgs/5OdM6st/T8nLOOikstBesgtX4YpuoDpNcDNJ6/d0YnPzdT+2Fg+CrtTuSj96I
 LIkbMk/g4cf2KKkpRXp0v9Vtmei5WeUVangWsbKb8O+y6K+nBs7s464fHQ3vWg8a74Mz
 xVrQ==
X-Gm-Message-State: AOAM5323P9i1x7tHFcjYiC5KFKT0YwdXkPP8SglRmWLqKJuMSCX3eB5f
 zVxgNofCC9/teHmjAslSZXT6T8ek+fgQWg==
X-Received: by 2002:adf:8bd4:: with SMTP id w20mr20242969wra.391.1603120393234; 
 Mon, 19 Oct 2020 08:13:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm309918wma.48.2020.10.19.08.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:13:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/10] target/arm: Fix has_vfp/has_neon ID reg squashing
 for M-profile
Date: Mon, 19 Oct 2020 16:12:59 +0100
Message-Id: <20201019151301.2046-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019151301.2046-1-peter.maydell@linaro.org>
References: <20201019151301.2046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
X-TUID: m6F6/0P2hbt+

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

