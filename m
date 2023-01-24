Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294326ejc;
        Mon, 23 Jan 2023 16:01:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsOja/0RZ1G5Pilb0AbvFnCHwTZARHyue1lnFWmuvBLtB2AroLlUDGzJyxp3qvlaOOdnLQw
X-Received: by 2002:a05:6214:3886:b0:534:8823:a248 with SMTP id nq6-20020a056214388600b005348823a248mr45909218qvb.46.1674518510980;
        Mon, 23 Jan 2023 16:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518510; cv=none;
        d=google.com; s=arc-20160816;
        b=Yqn2XLqbin31inGkpzIbskIF2MzAfVedcoAi/IQYW9hbE/bHhA/RcSp71Cblgyv+KW
         58P9lkitROtSCXmcwsssBI7En51yQQRSa6GaltxhfrdCku4FuHOpHC3gdUZNF5AZwvIJ
         tz5F1ttGOYiByRLyBZb0evsiMdxntzdVw/tWtxA4nvXg/l6K8WlNOT1bOK4e72GaeMFj
         t203TUGbGY9DQEbNlmT4ORm8LK7d+RilcFH+deUTwTirBy2zg4QlyZa+g/+5cDn0ddDG
         TadDaNv5oq5E1Nw686Sqr+1DofbiJCd6Z9ehe3Omz4IjebKYuQuwbjEOyqtIwFYPsV+k
         nalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LUf95rwr1zmpxbrt8VlVK1sP2Ifcp9yoQEapeTzLdPY=;
        b=N0AVs/I8KiXm+jF7yXIQPDFXu1P+3g59TfpLrioLoy63SSLUVs4JHv72r29w6b4Whp
         csQi0eW5lT+2hlnUQM19gcYlw5Q62ruubaTiay3TWqBIDheaxs00WTMvuoHKri8aS7hs
         69OPUnDic6nJcYjo0UW9ctxLbMg19ebm/VuKY44JQ9XBGu+zEr9/y9320h/jzFF1zBAg
         8bRFniRQ9bsqIL1K3xkBvZPt0ZYxA3CG/cA4UvWDT5BnivlWcjl4bthCqZsMnvhzHcUA
         3qc0zQuegp2cyblkuaP9b2a84GKK/cHJpOJwfLdEhVvGI+W8WZXKfdzHF9wMkVgqyNk7
         NK7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eX/lxgo3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05621402ae00b005354ca36ba3si283645qvv.169.2023.01.23.16.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eX/lxgo3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kS-0000UP-L2; Mon, 23 Jan 2023 19:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kQ-0000RV-BU
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:10 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kO-0001qX-5K
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:10 -0500
Received: by mail-pg1-x52e.google.com with SMTP id b12so10242411pgj.6
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUf95rwr1zmpxbrt8VlVK1sP2Ifcp9yoQEapeTzLdPY=;
 b=eX/lxgo3zg6dhSxlEM6WNjB9u3GhW1AB6yXByxuWPTTc3kCMCR+eEecJRy/zq1JAyl
 noPtNqdW67wExKtPo/Cq6beVXxCVrhI/w1rQ5e6bFDWr/uz8pA6w46UQN1yFuUOhRIB8
 qFDfz4Oc5l6HsJscHHTOwwAnp1SXRRiiT5767Jc8j3BIOmOd2ZMnUV+RW/F1Z4yT34T/
 XeyMt+a1xglwsQvAKDGlrkVNsUgQzwQg2Md488L8EhV+wwfzliqMlb2HIJPQdO3nTNXk
 9cWOB9WSIUjZj4ED5prU1qIVRgnV4xiUiIhu6Dy6RIz4272xNl7hoMBXJZFrCWfHBika
 KBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUf95rwr1zmpxbrt8VlVK1sP2Ifcp9yoQEapeTzLdPY=;
 b=G2dxn0DX9iyjdA6QeuKC9piwdpUhD5miRERekIIm8MdxxPad6BoVwgYfBOewNjyr1r
 vBNpwi2SymHf60LJrfJvZd8mUvmPZKxOUsPQSCF63RT9xmShLvkh6sY7YQxnqgKu/YTm
 R2spc4uorLGHZf0rVeq5VldaFJ0Cjogdtn7we3g9PVW2BYDjhw1gV+AXtzsjPZ7GYv5v
 nMKwihLkhJ31cMfzZcVANuAjOB62CBusFLyynCt8KOaV377cTKo13u3u+dALcwt/MFR0
 3awAj7aevbvfeeLS2PP6dunovswRdTLitm5qCYXlx7S4IPo2yw7mG8l8wfXMxp/Ul0tR
 yZ2g==
X-Gm-Message-State: AFqh2kq69nVCbVHphPD4QMqq8xxlsKfv6riXnBuWKtOp/fkZNMBuECtW
 kyEFXPJR9S3cdvKqDPCVVIOmOE8M3LuGbgb+
X-Received: by 2002:a62:148d:0:b0:58b:ca43:9c05 with SMTP id
 135-20020a62148d000000b0058bca439c05mr23674453pfu.16.1674518467325; 
 Mon, 23 Jan 2023 16:01:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 12/22] target/arm: NSTable is RES0 for the RME EL3 regime
Date: Mon, 23 Jan 2023 14:00:17 -1000
Message-Id: <20230124000027.3565716-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wBmTDmMmQlP/

Test in_space instead of in_secure so that we don't switch
out of Root space.  Handle the output space change immediately,
rather than try and combine the NSTable and NS bits later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c1b0b8e610..ddafb1f329 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1240,7 +1240,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1256,7 +1255,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1417,29 +1415,29 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddrmask = MAKE_64BIT_MASK(0, 40);
     }
     descaddrmask &= ~indexmask_grainsize;
-
-    /*
-     * Secure accesses start with the page table in secure memory and
-     * can be downgraded to non-secure at any step. Non-secure accesses
-     * remain non-secure. We implement this by just ORing in the NSTable/NS
-     * bits at each step.
-     */
-    tableattrs = is_secure ? 0 : (1 << 4);
+    tableattrs = 0;
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
-    if (nstable && ptw->in_secure) {
-        /*
-         * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-         * Assert that the non-secure idx are even, and relative order.
-         */
+
+    /*
+     * Process the NSTable bit from the previous level.  This changes
+     * the table address space and the output space from Secure to
+     * NonSecure.  With RME, the EL3 translation regime does not change
+     * from Root to NonSecure.
+     */
+    if (extract32(tableattrs, 4, 1) && ptw->in_space == ARMSS_Secure) {
+        /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
+        ptw->in_space = ARMSS_NonSecure;
+        result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
+
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
         goto do_fault;
     }
@@ -1542,7 +1540,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= nstable << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
-- 
2.34.1

