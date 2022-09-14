Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5192762gdb;
        Wed, 14 Sep 2022 05:47:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Y/e1JfAE4TfE4XSPD/TItelJgZgdT1AhL9thAMrmq9UHFox2TvPOb18Lq547c1hI066HW
X-Received: by 2002:a05:6214:d47:b0:4aa:b52c:bd54 with SMTP id 7-20020a0562140d4700b004aab52cbd54mr30772322qvr.32.1663159632036;
        Wed, 14 Sep 2022 05:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663159632; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy5TBa8ESltcXwVGuFS9e/+B/ISmzo/pCnU2OfnRsWtcwAwSLxPb+CEimFDrnYPZ+o
         0yWeIiB+TjKFvCo48l+YQJ7KleOB6KnjwKWOqMQ3sa/ZzeFZBbmACIEDac+nLwRnfITa
         lP6+IUO/vNfa061eFTsxsX4SnoIzQsTZINdRUrMJITc5mGf6jcDSGC61n5e+J+R+WOET
         JxwrydSxhgIzCG1+D9EPD/mvyL5YhWga8Oa5C4hXhf4zTCYdWpnE1J90m5iqZvRI9AT4
         iK0Sb62vF9K6NkBmJnLnjO8JF4KhrvXWauYruV8ia1LjeHR5W17r0sCewcarZY+unJXw
         5wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
        b=meS6GpUbAiVaRFavzSWD0xlEPX0FQG52rj/39vXn+lWBuxiFh6Jyea7WMCpV6M/b+O
         ggulOYPIpP0PtykuG8py/EOo4/OT0I1zib9l1uETxhXbZfIE/G/2OOXRLXWBVDUvhauQ
         ScYVBLlm1XM3HMceErx/6d7zH13grtVXsAXB+v8l1C0+Pr1WAXmCFyTL0UBbLW0k7UVO
         vReZQzSyG+B08DcwLC072c9DRsRISTVRE/ZiHMU++Plkq7OmnjAisffd3HHl371WIgZC
         SuZcxNXemR2LXwKoc54mwUCZeXwnNHb2CF4NSHikL1SZqP2yPnBlQuDsACgWG0aS3Jcx
         SONg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lodtsBi8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv9-20020a05622a0a0900b0035a6812fb4csi1205794qtb.673.2022.09.14.05.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lodtsBi8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRnL-0004tM-Hb
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwS-0008UG-0w
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:32 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwJ-0008V7-0K
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e18so5222429wmq.3
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=lodtsBi89wJHnt1FzXvuR/o1FB8WIV/qDbI/+EHwVyj+xbMFqUMlP48c3iqGq/V/Fk
 eP0c8HqHbhwl/w8iOHD4F1OO6+4r1PXwNgS6w+60zwFdjTLqiwKx57Mi0HUz4djCdjaR
 1lOu9ssBTyD4Uhy0cHQAyn5s5heANLdfqw1eMzMHx+2eDP32niRszXSnPX/MwvGqyYxH
 YbODtHITuuopHSzKB6BEjCrLbBE46Osz59N6tnONQ8sFESmVO1i5HUrsogKLahTNZMWf
 6jKydRJBN2fPMQ8i5KbsS6XGNb2ZzKDiLBWcUa8lLxdwSm5+Lxks9L8Vj2hJ2MS29Dya
 UpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=xa1LrtwSa+KVyPh1+ZoQb38/XhdJhVkcy6v/xStfnyVn2vceDuXUm3NLDG/PU0FnxE
 yJo62vh/gEvPUIGebBsJGD86AuvZa2irVHAHLq4Cb6d2iEZOrSrthV8PbcdHebxUPH5d
 rWK4j2E7l6Wm8lEkbdi08NYvtiD1+2Y00+Wa01wphnvMwADIAgjVvdVP7/8xJc/4x/Wv
 +sqawmPxLhNOSD4KFziUO4278skdhjoEM5hDTz/UQItyYbr4wu5OZFGov3PYP+XzZCRO
 fsXTOwhudIB+xkEYBlvdLR8zuyZX58f6D0/SvH05xku+uFdvfXSBtHQC948pBd6kFnfx
 584Q==
X-Gm-Message-State: ACgBeo1Jxi5dRubmipr+QvuxFxMRaWLaX62Gkv4wVjm4yLGG1YCv3A1x
 1djWhvbFfwVJ+rpmN9Y0k71kpw==
X-Received: by 2002:a05:600c:3d93:b0:3a6:1ac3:adf8 with SMTP id
 bi19-20020a05600c3d9300b003a61ac3adf8mr2757603wmb.125.1663156340563; 
 Wed, 14 Sep 2022 04:52:20 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/arm: Do alignment check when translation disabled
Date: Wed, 14 Sep 2022 12:51:58 +0100
Message-Id: <20220914115217.117532-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SZbOFdsQHF2O

If translation is disabled, the default memory type is Device,
which requires alignment checking.  Document, but defer, the
more general case of per-page alignment checking.

Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..79609443aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10713,6 +10713,39 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
+/*
+ * Return true if memory alignment should be enforced.
+ */
+static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
+{
+    /* Check the alignment enable bit. */
+    if (sctlr & SCTLR_A) {
+        return true;
+    }
+
+    /*
+     * If translation is disabled, then the default memory type
+     * may be Device(-nGnRnE) instead of Normal, which requires that
+     * alignment be enforced.
+     *
+     * TODO: The more general case is translation enabled, with a per-page
+     * check of the memory type as assigned via MAIR_ELx and the PTE.
+     * We could arrange for a bit in MemTxAttrs to enforce alignment
+     * via forced use of the softmmu slow path.  Given that such pages
+     * are intended for MMIO, where the slow path is required anyhow,
+     * this should not result in extra overhead.
+     */
+    if (sctlr & SCTLR_M) {
+        /* Translation enabled: memory type in PTE via MAIR_ELx. */
+        return false;
+    }
+    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
+        /* Stage 2 translation enabled: memory type in PTE. */
+        return false;
+    }
+    return true;
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -10777,8 +10810,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 {
     CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
 
-    if (arm_sctlr(env, el) & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
@@ -10871,7 +10905,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
-    if (sctlr & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
-- 
2.34.1

