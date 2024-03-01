Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1309023eja;
        Fri, 1 Mar 2024 12:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzSvTrRdkf2+n88HoOMp0d0cMe9ENqjV/c9DN/KVK128W3TIkYJnvPcoQkoddPz5WjDRfNovoWOX4Klpk69ShEMC6mhe3D
X-Google-Smtp-Source: AGHT+IHZJtb0uR4MWBvtrYZpmo4y62CrQJgUlCriqW8tBrB1tDuvurbKp93dSElTgbXu4dX3DSc6
X-Received: by 2002:a0c:e7c1:0:b0:68f:e84d:867a with SMTP id c1-20020a0ce7c1000000b0068fe84d867amr2938970qvo.2.1709325715152;
        Fri, 01 Mar 2024 12:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709325715; cv=none;
        d=google.com; s=arc-20160816;
        b=oqUuvjHtyZMh2F42LF74XEKVIyaFp8yvHsTPsSn623IqmxpGnDXcCM7V3bDjs7R6sy
         hwmlY8E9BCk6ghAAmXTRJgRa6bML78W44R9PzkvVhiovWJXdtdZlOmSJVlXBCNrLJe+j
         jBUO0xntx+GwaqXLe781QkJwf9GDiWQvG77+bfBCrVxAQcUow4f0D8hwDfDxbb4u9Rfz
         gREW+evcw0/GIc05i3LhS1BQ8jqRjzPDDEmt6VnCJsJQfhuCwY4yoAp2iiCmSCPyjjN6
         5+sVxUustN1Av/x404nDcC/21C164NTBQnqSrvYFYB4/s4SGDbSyJ5Lcz1Z822sLmpf5
         JvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Kev1JbGsH8SPuVfwyjwv2zI6xwvmoOl1CfSqGhDN5g=;
        fh=X6WeDsGLRGf50j0Uf29WVs/9IAwsZZZhxH8c0rS+hfU=;
        b=ah25uxbTh+CMepz2D5YS2UbbORp8/mqvKvpS1eOIE+HBZyPEczI/6zPtZEbSCUCd+n
         D/vHuflS8YGdbeY9Q2xIhLEqzgnFCuRonuF727O4r+tyCkmvIZewwdRJKNzVos0C/7mY
         y2fU0UTdF+rrRPMxBDJ4+r4y/3VDXgr4Tcb+Ga02fkIULYei6bV2MA4L+9llSyux3Y5R
         YNNuHIauuLmrhowe/3cMhGqmzHmvm1T5D/YPCNWDSyM/9s8YTVb6jzy9PV9N5v1XE5Fa
         cgvNbhPdw+MSFQNe0NIBOA1M36acaSY/oYhhd9SYZzqOevMZbh6iQwgQye4eE7VD5ZzQ
         Gjtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AD0X293s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk7-20020a056214508700b0068fcd2cee48si4177790qvb.510.2024.03.01.12.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 12:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AD0X293s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg9h9-00020d-0R; Fri, 01 Mar 2024 15:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h7-0001zD-34
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:25 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h5-0006zj-ER
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:24 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5ce9555d42eso2024863a12.2
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 12:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709325681; x=1709930481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Kev1JbGsH8SPuVfwyjwv2zI6xwvmoOl1CfSqGhDN5g=;
 b=AD0X293sR33vul23ICEgKF0ZARYgH6FiQECEvBIRq98p45Ug5WG8Ts9ftxF4Wplmqg
 JiyZ12OTPent3DOId430dDaH2kIO7dqOpU4qzGXjglc9kXwI1HUIS9FsQiyDp8J6PVPn
 sc3tPu5alDsLE15z9bDpcFN4LXgWcKDn5bHzCMhh2Kjn16BPUJKYrBH9pMSWWcpIKLD+
 B6b1cLohHaXTvL8epL4y9y/hkn5OJVinhqi8d7O36yEWH3ofY0r7Cmj7xsdhatBxSFLn
 +TFc71oY+1qeBo1Hz5xMAhMkEblR72cQBDocFgMp2Y+spBynRVy0gZbRcJVFvb0SN5JB
 WuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709325681; x=1709930481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Kev1JbGsH8SPuVfwyjwv2zI6xwvmoOl1CfSqGhDN5g=;
 b=DhVy6cPy/e/Kv9CjPHPxl6yGEozLfv/efyVYB00w1V1BoanPUsX13Bl1LwW9KAYamv
 aTJ2XKYAw9S1t7i4VHihF7jN45yoPyXlKDeo9OA4QS4d+HJ2ktiBaDlvGL+HiZyMXp9t
 F612lcLvVlM5GTnB3dQAuNWVCZwlayI6yoA6iwPDRddOE3GeIPSdd7DJ1BqWdE43oOR4
 1FBBzAoSpyqIca7+Z4xnqcSDICMllJB4YL2aoN+K0aqpAcYMvOcU6X5cg+y3rXvUrOOb
 Jb3mxoPAfk/rGcrRilzv20ryuxIDsW51CsOJB/njdSyqK1pz6gpNF8EjZMBERB+kz985
 xZoQ==
X-Gm-Message-State: AOJu0YwcVR/9sWyVzr2K0tdY4L4yqNoIef72gq0AsxWlKN9o1cTRCttt
 fD/K4q8hUlvCBZsIXgo4KRSFyANdtA3irZHj1sNwTqLXrereP7q3sd5N87pOfnU=
X-Received: by 2002:a17:90a:4a0e:b0:29b:1073:c038 with SMTP id
 e14-20020a17090a4a0e00b0029b1073c038mr2745323pjh.32.1709325680787; 
 Fri, 01 Mar 2024 12:41:20 -0800 (PST)
Received: from stoup.. (098-147-055-211.res.spectrum.com. [98.147.55.211])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a17090ac58300b0029b2e00359esm681947pjt.36.2024.03.01.12.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:41:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH v3 5/6] target/arm: Do memory type alignment check when
 translation disabled
Date: Fri,  1 Mar 2024 10:41:09 -1000
Message-Id: <20240301204110.656742-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301204110.656742-1-richard.henderson@linaro.org>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 0Jz4mA0SuAam

If translation is disabled, the default memory type is Device, which
requires alignment checking.  This is more optimally done early via
the MemOp given to the TCG memory operation.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/hflags.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 8e5d35d922..5da1b0fc1d 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -26,6 +26,35 @@ static inline bool fgt_svc(CPUARMState *env, int el)
         FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL1);
 }
 
+/* Return true if memory alignment should be enforced. */
+static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* Check the alignment enable bit. */
+    if (sctlr & SCTLR_A) {
+        return true;
+    }
+
+    /*
+     * If translation is disabled, then the default memory type is
+     * Device(-nGnRnE) instead of Normal, which requires that alignment
+     * be enforced.  Since this affects all ram, it is most efficient
+     * to handle this during translation.
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
+#endif
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -121,8 +150,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 {
     CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
 
-    if (arm_sctlr(env, el) & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
@@ -223,7 +253,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
-    if (sctlr & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
-- 
2.34.1

