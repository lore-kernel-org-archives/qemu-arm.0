Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp687318lfb;
        Thu, 9 Jun 2022 13:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvx1DulUQsrKT2zWzlucYtsfpGfaMez9sq9W2DZ0JeUsYNksDO2EplUPtO6LMjLf9QGBMK
X-Received: by 2002:ac8:7c50:0:b0:305:392:9780 with SMTP id o16-20020ac87c50000000b0030503929780mr7812384qtv.589.1654807410649;
        Thu, 09 Jun 2022 13:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807410; cv=none;
        d=google.com; s=arc-20160816;
        b=iW2NNcx/pUMqvcQ1HUbaDo6Q/NhA3bB4ApfYONoQ2MoevMAU/6phDst9zuesmcn2FZ
         0KIqzB3fToi2PkeXkGVWsiP89OcyQSdR+33dIy1KHXXLPKXdFJ5xiU6oTMriTF9g3BN3
         6oVPsRVWKUfnAJj1pXjJukDDAnVTlh1/QhjOkLTcquhhK/BUWweoHLmwVuK9w+QvFEeu
         hrA+cMqCMHP/Ad/htU9IroDct15EnSMZKiIxRHqUEjkUfY0qYV/ZYi/72Htk0sNnlJnl
         uwN1V47sj6BjReZ+GWBZ1usgCTSe4FeO4EsEOx6XAHgM7fz2E4tfWJi9ptP5hmKDETYT
         1K8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0+1B/GKcGEn9X9Wh/vHToPB3bf3Gcg47/xOcf+MkVK4=;
        b=wyX4PiRQ07OIDTos+MR9v0Z2uPjNMBF0xd6Dag78Z9mHwyVbyekeQyegFnSUDHCQbn
         NmtHtADJ81NOhsX+C9mFvzMdRmvR1FO3nOgMN9wEX3r4XudJEF66NthbEdFtg/tLBSyI
         /dHrGQxYDfdR/bPwVpPL4KtFno9ji3+cbMKEEoQpZzDsiHie2x4BVjst9Cs6LItM6sA6
         FPXTmgbbC19EHNw8P/z9SfvElhgabamLd61LMJ9nA8+IDGhgNP94+oMcXiwQqbsgiPQp
         HVIJsogdbhg8ynYSrBt44++mu66f7MyqsHS8SB4WxE0OZgNv0KNCsJGyllBJlhRM0JTl
         IXNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+ly7rWs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020ac85c89000000b0030502f70a3dsi2897746qta.575.2022.06.09.13.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+ly7rWs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzP06-0002IK-3P
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmO-0003zF-HA
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmJ-0008Ux-Ad
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:20 -0400
Received: by mail-pj1-x1032.google.com with SMTP id e9so11776340pju.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+1B/GKcGEn9X9Wh/vHToPB3bf3Gcg47/xOcf+MkVK4=;
 b=k+ly7rWsmjvspi/PxfIQPbs7w5Q1elL8Dw0+KZmqiAZ1gnoUT4S/7BbUosoK8MPKB2
 IjLtEGToeLRJ1Loc3G8eVnf5I/iqqe+Xr9PE+JxrKk/0B5V2vAW5i3G95GaSPv5Pf12H
 OdjxJ/QnxDMUfXDYOY3Gs1lTVRWeh5mSfHhFM1ERuQsfpEK2L8ssyFeLcXTVYQSl3Yec
 kerD0oxFp4iwikJ3+hOqjodq5WkRyyivqGnblXNXInHMGxFHjzJnxOmhHOvj2e629edp
 FZMXrFlgtOdkSO2sbJBE1zRHPLn3QZxVLoghxjo2rLkTEXZ8wzzmCTFGoeGMedDSPpdY
 QLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+1B/GKcGEn9X9Wh/vHToPB3bf3Gcg47/xOcf+MkVK4=;
 b=8I0/QBhrOsGSQ+4WRgc3kqZxKYpm1ZdMzY+fC3xYJNebMPXbgGgARUHA6Bn1Gzx8Dt
 0gH8upHLG9xsORRK2o6oCD2k3Ol7X2W3nakyWfadF/5vpl/dqzeLLA7MX2ls2f4ouiaS
 0XruLEJGtZ4uyuNPLpdke9YNFh2j4FZ4fmM/a6/kFB2L/TTitO/FI9b92WXSGXO1ke4g
 TvyoPxO0rlNfq5ZgPLmiYfppboaClk/FOtUwcYlweq5tB76szNRfOpTEKqV89E1ZL6o3
 bw99uEE6ftu/xCmasgXIn1lw1h7LWZ/LoDSkuw0O0ysBpCkvGqqrjGKdgwG6Mr/KE7fL
 e3tQ==
X-Gm-Message-State: AOAM530I7+Jjw8qOnftRsDhm57nI3yAcscITOv4Ol5LnstoojyN8a6Yw
 1JJTq2zHAS9140UYbxh0lSkj/lGeUyel5w==
X-Received: by 2002:a17:90b:2246:b0:1e8:5531:5e61 with SMTP id
 hk6-20020a17090b224600b001e855315e61mr5031073pjb.86.1654806553943; 
 Thu, 09 Jun 2022 13:29:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 13/23] target/arm: Create helper_exception_swstep
Date: Thu,  9 Jun 2022 13:28:51 -0700
Message-Id: <20220609202901.1177572-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KenQV+KbksAt

Move the computation from gen_swstep_exception into a helper.

This fixes a bug when:
  - MDSCR_EL1.KDE == 1 to enable debug exceptions within EL_D itself
  - we singlestep an ERET from EL_D to some lower EL

Previously we were computing 'same el' based on the EL which
executed the ERET instruction, whereas it ought to be computed
based on the EL to which ERET returned.  This happens naturally
with the new helper, which runs after EL has been changed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h       |  1 +
 target/arm/translate.h    | 12 +++---------
 target/arm/debug_helper.c | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5a6802e3fa..db7447d233 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
+DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4575af6e1c..890e73194c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -341,15 +341,9 @@ static inline void gen_exception(int excp, uint32_t syndrome,
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
-    bool same_el = (s->debug_target_el == s->current_el);
-
-    /*
-     * If singlestep is targeting a lower EL than the current one,
-     * then s->ss_active must be false and we can never get here.
-     */
-    assert(s->debug_target_el >= s->current_el);
-
-    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_target_el);
+    /* Fill in the same_el field of the syndrome in the helper. */
+    uint32_t syn = syn_swstep(false, isv, ex);
+    gen_helper_exception_swstep(cpu_env, tcg_constant_i32(syn));
 }
 
 /*
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a743061e89..a3a1b98de2 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -487,6 +487,22 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
     raise_exception(env, EXCP_BKPT, syndrome, debug_el);
 }
 
+void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /*
+     * If singlestep is targeting a lower EL than the current one, then
+     * DisasContext.ss_active must be false and we can never get here.
+     */
+    assert(debug_el >= cur_el);
+    if (debug_el == cur_el) {
+        syndrome |= 1 << ARM_EL_EC_SHIFT;
+    }
+    raise_exception(env, EXCP_UDEF, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-- 
2.34.1

