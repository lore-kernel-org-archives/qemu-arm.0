Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810A2CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:41:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3o-00085s-LG; Tue, 13 Oct 2026 04:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3W-0007Pc-Qp
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3U-0007sm-F9
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so24328875e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880815; x=1792485615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Jn5hYBmxlFxPYaAOsEx1XVxpQ4Vhj6Xdy2HZCagZ5gA=;
 b=iS9nU8vY+5RuH+aofJGDpzFfTNVNkE4zPhv/Kkphhj0gnOgYzPi02qs/bPpnian/NO
 GHv05ySm59ShXmWHhVfFDDqdBMKg0o6LFlD/IW7pcNFoJBOLurCnYF+KWsrf/XO3mLZl
 Bi8/WBquZ/N6vjkxr0/gtUnimJ2NmIi/7HE4bQPPHJZhZnItc2ZR+d7y6JIPWC0XPCL/
 W6StOoNL0sBw0tLszZuhkHVqpoHKjfHakGSNJPC26WNn1Uj6UqEFcL/u7Z09XocXQ+hZ
 g8m51O73JfZJYQEURgDb2wIJ4zl1wMU2fDJ8wJxcVd3Up3xayUpuTrs3eLNfjBVUXOqy
 IHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880815; x=1792485615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Jn5hYBmxlFxPYaAOsEx1XVxpQ4Vhj6Xdy2HZCagZ5gA=;
 b=F7O4eLR2YTpm9sgcAh3O7D548hfoPzjyrw2qKInIWT6raDEsHKQXm3LyFjI5KA7cPm
 ZLvQew/Z+8g7CQBaLBcAY9V2oX4Uur4+/m1/9SQHfk4moUFOiupPpcbYEu+yhj1aYLWf
 Z5334jo6iMgwAa935Oqee7pR21YMUtNBPlsfO6A4yf95KAjK71+mKXI5NW/86bLNu8bc
 yaFlugLoyi7roNuC9ooDJeBitztS9BuiyEDZb4+tr+0xtcE0Tm6vpFLHSe3rCtO1LpAx
 LnRx6oz+7UcUtVE7Hw3CJh9d2g9bh+DqdGnwUSGSbITHDRHsts/UXzUyGDIw2FzQeFP7
 hFUg==
X-Gm-Message-State: AFq9FYJNtRDjV2LfA6yE2aBCOnBB9kVeKdogKUzJHyKWaF6QOpHx3J0b
 ENe5YIqFN/lxOJqiEiaGwoypWkWNqDke3GvikF24uwvqQX3ndWKg7wB51PM/RW+/w7YWX29tgva
 82RBYJg0=
X-Gm-Gg: AYBFou0ZWNJNHkE9N6r5SqiZbz5bqbQO+3kI6uj3zhb3ByCrzmjMJmw1ENpiZ3wnNpP
 xeoxyhQoI76FgFQwGRzL/BMfhL2KKwYP9PwxeOBlNdK0YP6TDZk2mvP7g4TYKrlUoW8f0S1/pkg
 loRWeoXunYjIoHFujkLOJo2t5Jr9LxUQ88755ZhS2qjDigMIZOqqF1mcvJ6yfinsyvt5KhmJI98
 RECOjArCYgi+zl01bf6cyKyzVxer67rMPbyekervqB+rxCUFTlgeCEJmsRXjsrHzdePfJZG7y/p
 YZaUBrEbC9uVX4ydAqF0gzZ65mqeulgWDWuUWIDw3lg1egdo4sp/H4NizbSJxilr9l0uUFqRThn
 1y6NYK2qBM3ZrEtGPlknLmra+ouOuFqtROKepKPSjHmFfRi0qRl6RcddvZW9qFtn2D0SzkxHyTi
 VsWVEr9JpOfcoQkVQbS9BfDXmJqB5HS4ieQ7TPApV1yRfdq2A8eBQg9UiMxhDyv85K2zh1Ch4VR
 P5X725HSjYXXjEXJRteo04ZN3ViUWhf5WjVuB3/ViCre7v9aIXpMausfNKwLHIMVZ86HPpti0l1
 JT4=
X-Received: by 2002:a05:600c:c3cb:20b0:4a1:a7f8:c12a with SMTP id
 5b1f17b1804b1-4a1a7f8c1b4mr25662785e9.21.1791880814627; 
 Tue, 13 Oct 2026 01:40:14 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/86] target/arm: GICv5 cpuif: Add comment about
 ICV_PPI_HMR<n>_EL1
Date: Tue, 13 Oct 2026 09:38:35 +0100
Message-ID: <20261013083933.1024405-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The ICC_PPI_HMR<n>_EL1 and ICV_PPI_HMR<n>_EL1 registers are both
read-only and report whether PPIs have the edge or level handling
mode.  This doesn't change under virtualization and there is no
mechanism for the hypervisor to report a different value to the
guest.  However, we do need to honour the ICH_PPI_HVI bits that
make the PPI behave as if it was unimplemented (bit is RAZ/WI).

Add a readfn for these registers so we can mask them when they are
read by the hypervisor guest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index e1d3ffb7b1e..b55fe4991ba 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -425,6 +425,23 @@ static void gic_cdhm_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv5_set_handling(gic, id, hm, domain, type, virtual);
 }
 
+static uint64_t gic_ppi_hmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint64_t value = raw_read(env, ri);
+
+    if (gicv5_icv_access(env)) {
+        /*
+         * The spec defines ICV_PPI_HMR<n>_EL1 virtual versions of these
+         * registers, but they are read-only and can only ever report the
+         * same value as the physical ICC_ versions. However we do need
+         * to make sure the bits RAZ/WI if the hypervisor has made the
+         * PPI appear disabled to the guest via ICH_PPI_HVIR<n>_EL2.
+         */
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+    }
+    return value;
+}
+
 static void gic_ppi_cactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
@@ -1054,6 +1071,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_HMRN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_hm[0]),
+        .readfn = gic_ppi_hmr_read,
         .resetvalue = PPI_HMR0_RESET,
     },
     {   .name = "ICC_PPI_HMR1_EL1", .state = ARM_CP_STATE_AA64,
@@ -1061,6 +1079,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_HMRN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_hm[1]),
+        .readfn = gic_ppi_hmr_read,
         .resetvalue = PPI_HMR1_RESET,
     },
     {   .name = "ICC_HPPIR_EL1", .state = ARM_CP_STATE_AA64,
-- 
2.43.0


