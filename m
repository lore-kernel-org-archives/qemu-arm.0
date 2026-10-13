Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E638CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:43:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY4Y-0001eP-Ev; Tue, 13 Oct 2026 04:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3q-0008CD-K7
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3o-0007yx-Hi
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49fbb2acc90so22380785e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880835; x=1792485635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=HAJqqQ3Uo3xCW2Bb5E3vPPfl8N3rhsh3k10EI5/4JrQ=;
 b=wn3btXGiH9Lk2P98J5DPXkOiSEvw5OJ51U+FWUvbINUQ2jsDso4DBfSYty9eDGS4qA
 AfT/QhqwQ/Uo+AwcF5dDXxEQx5GykvpMnxTAqi5LYT0WZtxaTzprcVJGcX9Hj0t8cLQy
 9ZlPmR1SSGeOPPIBq+20g8YhBEjNPrhsaok0z5Cj+8cfl74hJoybs5wOycAEJOIW4cSK
 KCD3y4CMbauutW5xKQ68spuDi9DPGxpTcGLXYWiA31ku1mO3uODtHgyRZmX25CVMyOUQ
 j06n5knUagr6lSr19C6nbblwtV++rZ2duxBpGcUaiRvWpZlL7MQEUFWCUzoh2ajOv8+I
 exkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880835; x=1792485635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=HAJqqQ3Uo3xCW2Bb5E3vPPfl8N3rhsh3k10EI5/4JrQ=;
 b=15mAFb/FeWWH64EDZz87dAieRwWMtooGKjIjg/lpyE8mg+Nw4rH9O3wwz7UWNuMtEJ
 2U4pLz5tNlw8SLwyf3i5wHjx6V6M1vKpDCsRaG2j9NztqKw824YpW5QNEmy2fI5jkerw
 bc9gDAB6H0moIacSKgW+I73E4EwHB8q0Bth92233WSexmYdW/OgvtEJv9q9eWZZS8nGi
 88bbUov6nM74dfcHT1hstr9M76NpH0pkvikcEpaiL9wbEL1wbqhSuRl3WOdss6Ijh0ra
 HVa+luK045WJPxsgMQDV4Sc2tVICigp+al4/DrHrJ++Donnem7x0gV7HwtVGgWAckgOY
 VSIA==
X-Gm-Message-State: AFq9FYLaUFMsgGhEVM+EZMPSaAfbw2ghGUPwoForJSYRuq5ESQ2JcR4f
 21InFRB7hgwvRnZC23Fwic7BF1Wo7pndQHwUnCKWx/Sfkb7U7/i3PZx8hdYq952jKEcoD4Mp4Rs
 4KERdrAs=
X-Gm-Gg: AYBFou1WKeHfQzrHBeHYJRlFsuYUdscvWLMT2k3i1OvsCxJAlJEeseRfaz7lM09Dvl5
 KuY+amJTnlrs+xmUnEaX59JiSsInV7yEBNOeC47hiB+eZ9qzrRaCNvWESWl3FUpm2dJbmsLzPDO
 um0KMIibDlpP4x65uvmDmLI82O8vQLCJgO9RfXVe9xSe98GhsN72FR1ruYesYBNlY+M2lB9ye2W
 gdlY/6T7Gm+F3sRrbw/IRZcvQeyazxcQgEFRz/0erx4+V0chrml+kSShm3KAfLQcQezQ/MCNMOI
 tigJHjctHNLgsnVmEuh+vLah3nooaOnWKjkjghADfS0CecnM4KuViV78UlWVrXJtYW61LspgTkL
 PDmXbUTarKW5EpDhbu6T1i58x81Gi8xD7APw7wFp/Gn79pl7TwESAUeR2CPHXU+08bvyKXyxpSq
 wyfZn+Wc4jycAN//9JR5mJ7lfTtkDgiOibqn7oH6o3vXeKhIyLJhgl94fTBJM+NQMkyKoylEbQh
 gPdpOALIyD3gfvDOwtOGf+t3olnFNMInXQFzN7sir96L4hhEKCgole3ryXqB3g+Cx5jPyG2aXhU
 Guk=
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id
 5b1f17b1804b1-4a1ad01f924mr23660115e9.21.1791880834828; 
 Tue, 13 Oct 2026 01:40:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 42/86] target/arm: GICv5 cpuif: Implement GIC VDnnn insns
Date: Tue, 13 Oct 2026 09:38:49 +0100
Message-ID: <20261013083933.1024405-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GIC cpu interface has a set of GIC VDnnn insns which behave
exactly like the GIC CDnnn ones except that they always operate
on the virtual interrupt domain. (EL2 can use these to examine
and update the state of the interrupts of its guest.)

Now we've updated the writefns to handle the virtual interrupt
domain by looking at the opc1 field, we can implement these
using the existing writefns.

Note that there is no VD insn for CDIA, CDNMIA or CDEOI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 7f0109e9b12..64e59589cc7 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -1453,6 +1453,54 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fgt = FGT_GICRCDNMIA,
         .readfn = gicr_cdia_read,
     },
+    {   .name = "GIC_VDDIS", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 0,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cddis_write,
+    },
+    {   .name = "GIC_VDEN", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cden_write,
+    },
+    {   .name = "GIC_VDPRI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 2,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cdpri_write,
+    },
+    {   .name = "GIC_VDAFF", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 3,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cdaff_write,
+    },
+    {   .name = "GIC_VDPEND", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 4,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cdpend_write,
+    },
+    {   .name = "GIC_VDRCFG", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 5,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cdrcfg_write,
+    },
+    {   .name = "GIC_VDDI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 2, .opc2 = 0,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cddi_write,
+    },
+    {   .name = "GIC_VDHM", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 4, .crn = 12, .crm = 2, .opc2 = 1,
+        .access = PL2_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .accessfn = access_gicv5_ich_reg,
+        .writefn = gic_cdhm_write,
+    },
     {   .name = "ICC_IDR0_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 2,
         .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
-- 
2.43.0


