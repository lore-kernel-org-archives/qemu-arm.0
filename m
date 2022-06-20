Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp538419lft;
        Mon, 20 Jun 2022 09:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sENS4OD8iB5nSsjSFl5VTwDq4JOTdq7pt8qPpHLNfYRRoCydGc4Ean+onL2GbtlVsBJ34Y
X-Received: by 2002:ad4:5744:0:b0:464:52f2:c2d9 with SMTP id q4-20020ad45744000000b0046452f2c2d9mr19335712qvx.95.1655741367336;
        Mon, 20 Jun 2022 09:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655741367; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE6/vtXcBjLbgwv7zghaL+A9KsBgiNkFLYEel2IzfPemJfWHhyYCZQ6Vvac+9XkdiM
         nPSA/2nQDFMIy9z1EL7HfsJ8GscRC5AGTVyeneDSPAWyiUg/SCT2z830FJg0+Dh66rfd
         qNFtMoMTR5gKoiLF3UfuUdRUDD89cayQecicUAnl3DMlnqTBHICrLyfwSJFCW2Z1bZUW
         ibTU+c8ZCoC1sSIgzvps5Y1UFmkhUOnCFTr1fRoYAJRD7sSgo9KxOoy4Gg6WDthweg7D
         JUcnOFR3FyX0GJFNiTEyYvfD+7RdKfFWv1gj0Ccopu5Flbc9EVrVWAxQfm4NTT9kf85A
         Yf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=1ogZxc6cmwpv7cddFQqA+Z4wseDlUNUCq/IKgjwpRx0=;
        b=OJIp785OtsyCgoQjh+bWXgxsYcUr4caNSLXo73HJRG7SLsmnC+LSkVAdcCxgAZSItg
         jyG3chXEugMfUHxFPf9RXQwhKXmwSX/HAlz3UCJgYEvEw7sVaaUBZDfxSkGOo6jzsnY1
         Hymu0yVFQE9U6tWhYiD/HjBL8p1W99uSoxYQW2D2hV9zSwk2jo4dEKLZ/7ujvBXIRbdo
         LnD+pCt10leV6HEfextPH1psrt1VeKjtVjifECUlKAa/EyWolpf/zEKWHwZcu4/wFG8y
         tzFpVNNEjqEiWXqC8vkPe2RvLSsvbSi/lLhsRR7KPtLAU9RIhXW1UEf6aEKX5dxeDFgF
         mWmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020ad4576c000000b0046f6480fe0asi7293736qvx.270.2022.06.20.09.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 09:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Jxu-0005Iv-Qw
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 12:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1o3JxE-0004uL-KB; Mon, 20 Jun 2022 12:08:44 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48660 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1o3JxC-0001it-7t; Mon, 20 Jun 2022 12:08:44 -0400
Received: from localhost.localdomain
 (dynamic-077-007-106-140.77.7.pool.telefonica.de [77.7.106.140])
 by csgraf.de (Postfix) with ESMTPSA id 097ED6080263;
 Mon, 20 Jun 2022 18:08:21 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Catch invalid kvm state also for hvf
Date: Mon, 20 Jun 2022 18:08:19 +0200
Message-Id: <20220620160819.65191-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BY5Khl0ScR9a

Some features such as running in EL3 or running M profile code are
incompatible with virtualization as QEMU implements it today. To prevent
users from picking invalid configurations on Hvf as well, let's run the
same checks there as well.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..03510f29f9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (kvm_enabled()) {
+    if (kvm_enabled() || hvf_enabled()) {
         /*
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
@@ -1498,17 +1498,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         if (arm_feature(env, ARM_FEATURE_M)) {
             error_setg(errp,
-                       "Cannot enable KVM when using an M-profile guest CPU");
+                       "Cannot enable KVM or HVF when using an M-profile guest CPU");
             return;
         }
         if (cpu->has_el3) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPU has EL3 enabled");
+                       "Cannot enable KVM or HVF when guest CPU has EL3 enabled");
             return;
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPUs has MTE enabled");
+                       "Cannot enable KVM or HVF when guest CPUs has MTE enabled");
             return;
         }
     }
-- 
2.32.1 (Apple Git-133)

