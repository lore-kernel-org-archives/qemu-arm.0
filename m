Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4384DCC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:43:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3p-00088q-IL; Tue, 13 Oct 2026 04:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3S-00077U-QX
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3L-0007cr-Jv
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so26703645e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880798; x=1792485598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=K/fazeDrj1SJvW+QNVTTmk1BBmWOISZMReEdlQ3HE/s=;
 b=vCLsdyaBxcUANmL5UPuu+dTDqhaIs8BAQ8jTzu34/RhvRE7+rmBmnCxbRiHE5MrQZy
 eJ3DDrwPBJRFtKNNZWNgEvmgd9rrPhHggI3DzxbxglSieqNeaYcF01qArPP66H268j1e
 ORGWprrcuTwYT8iFEvoemnStbFE1+UeqUQH9VFTogGCbAFTLuE1+eu12a+5Qa8FGuKf8
 O2OwJDbCiVmphVHlPmnsai0zE+TetXcXCUp8XxxQM2moxtuJoeASsXiM8C9Wpf/6l9Nm
 89XBy3O76401L1oJPSgcRbyDCS/RwLwQ7iKTpcbItLoY4A3wmH+bALwJplvdScX+S5Mx
 eMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880798; x=1792485598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=K/fazeDrj1SJvW+QNVTTmk1BBmWOISZMReEdlQ3HE/s=;
 b=Zx/BWbSRTBvSrKtydIxuSLnGtw0fnOKnUiHhPAG1Jg9tK1s3DyQ5uU6L9Q9ee2zhDD
 yeQkFm/crI1ow01Ssqa5ORDU11tqNDO/g1KDCiFUCSs81dW9JEvECya/CZcbYxs559nS
 8Cx3lb8hNHECirQXmBU4aPMjRGmqJwK9zwEyNTS55g2M5f2vjQUCzKctl5b14bfanElH
 IwwUF8766VAYhXnD2UeR3wNFSh+V190R/SNh2F2t1VWV/rxqjHdupcZ7sixPg5ljYmLw
 qU7vTdxeCkDL2edQxwXU/VALTwu9xrnHHINbYypq58QiAFthz34K48yTS4im0pqBFJN6
 Ryvg==
X-Gm-Message-State: AFq9FYJliEFmWpNDiVGxjx9V8T0liP0qzX4UFdhNrl1LRVO67zW1gy+X
 VtQ03Qn1KJcQM2LkF6vGPg3Uaa3dn1NXX7xjnaEmMu/dCRUSZ4taT0vGjaQdvZ1TTkq5FOFK3z+
 i7/oCDuo=
X-Gm-Gg: AYBFou147igzruiYprcBZ3ZIIWLWrF+ipbEjor1nq7nsUQ6trwBYuxfhBgQNMnqB/9E
 q4C1yW+kooMq1eHoHOK2XM0axYdXEO52RWFJi5TfBhSu9eNyTmVgpYeXXEmZ7a8epcYmzfUUxVj
 fgPGwx6NKk/ZsKtGp65TclaA8iMFzkydv3xi9TBtf8/8MAOz2XSkq+xqw2NCNEED49fA8CE37q3
 pAJ26D638vsJgA6JCSPjNG0GNq2TsTYU0KLxhl9XLGXfRm3G/hVhdOgPuBsEmY1pAyghNoe2Sf7
 kxsr7GpPzhaNC2rlW2Qtvs6YCfl98dOSyawU7OrF4w6D0KreaF8BSbM41qE+MwsoiqGuL1NJcWL
 k0yqM/45jKnytyfx7ODxpgkB6k2pMBhzqV8/QGblRed7926JAqoweEjzQc6I28iW7gjvKwj+E4v
 RGvaF3e0eZR3p01oJKz4m7sA4cA62OlseTy5AfjMhqziaF7f7vsJ+EIbyXkMO87yvdbZdklDiSS
 ecJ00jtlv1VvvsnmN1AyveOt3/p1cLBTx1KpooANM3ZJuc0t4DK9IGPShm3etwD4FXYc3HP9CYs
 gJvALQytKIbWiw==
X-Received: by 2002:a05:600c:1e0f:b0:4a1:7b87:8d34 with SMTP id
 5b1f17b1804b1-4a18e4b46e1mr212143875e9.21.1791880797929; 
 Tue, 13 Oct 2026 01:39:57 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/86] target/arm: GICv5 cpuif: Implement ICH_VCTLR_EL2 and
 ICH_VCMR_EL2
Date: Tue, 13 Oct 2026 09:38:24 +0100
Message-ID: <20261013083933.1024405-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the ICH_VCTLR_EL2 and ICH_VMCR_EL2 registers, which hold
hypervisor state for controlling its guest's GICv5 virtual cpu
interface.

We give these write functions and mark them as ARM_CP_IO even though
they currently don't do anything special on write, because later on
we will need changes to fields in these registers to trigger a
recalculation of whether the VIRQ and VFIQ interrupts are signalled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  2 ++
 target/arm/tcg/gicv5-cpuif.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5d3587739d7..4e7076a5339 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -596,6 +596,8 @@ typedef struct CPUArchState {
         GICv5PendingIrq ppi_hppi[NUM_GICV5_DOMAINS];
 
         uint64_t ich_apr_el2;
+        uint64_t ich_vctlr_el2;
+        uint64_t ich_vmcr_el2;
         uint64_t ich_ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_pend[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_enable[GICV5_NUM_PPIS / 64];
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 2141f1d8e2c..ac667c84c2f 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -493,6 +493,18 @@ static void gic_ich_ppi_dvi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void gic_ich_vctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
+static void gic_ich_vmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 /*
  * ICC_APR_EL1 is banked and reads/writes as the version for the
  * current logical interrupt domain.
@@ -1034,6 +1046,22 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_ppi_active[1]),
         .writefn = gic_ich_ppi_active_write,
     },
+    {   .name = "ICH_VCTLR_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 11, .opc2 = 4,
+        .access = PL2_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0xb28,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_vctlr_el2),
+        .writefn = gic_ich_vctlr_write,
+    },
+    {   .name = "ICH_VMCR_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 11, .opc2 = 7,
+        .access = PL2_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0x4c8,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_vmcr_el2),
+        .writefn = gic_ich_vmcr_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


