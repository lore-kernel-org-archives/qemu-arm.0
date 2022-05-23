Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3753901lfh;
        Mon, 23 May 2022 13:49:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqoU6zliljyRwyRiP+umWxPhjFWWeSbX0gvMbG75McKpm/qVAU2Gtd2cNYwpftOBE8o1ra
X-Received: by 2002:a05:6214:21cf:b0:462:485b:d7b9 with SMTP id d15-20020a05621421cf00b00462485bd7b9mr3041873qvh.78.1653338969732;
        Mon, 23 May 2022 13:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653338969; cv=none;
        d=google.com; s=arc-20160816;
        b=F2BJXZmwrQnXLG79MEiRtNyEmrO7JMuNlqhk8/uLP4ytupIpgUQDHYAYuDOai3STFK
         OZ+SZyfkNHRMesjggex5P8X1cwoMJ/Z2SvCFdqdCPVt1GzWOJqbsgeY8WFGun4vjHQPu
         54OqXbPnS2DhmnSOcPkUuK4NJOfDqPF7IaJOcecUYU07HhbI2MsJdzheH1NJRYwVylvu
         mk/fMOIGSzp+aNJd/iXatfy2Rts1jPiqHOyTjulGB3ysP4k4M5AhVCvv7Vqpaks+eF7x
         DBruD0xzV+AowFCnqUu5du+0rHcnotIWVTb+g7WQ+6oH/yqoKbYcDPweb+nPxmqy2lX3
         eN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CpC+VtE7S33sT1Hdq2TiErLR6SNR00Jn9wFnQN1e6KQ=;
        b=jFG5EpSrA2t8EJ2WfnC4JMcXQHBYPzBNS8tY/pWR7+NYNwNrJYcqT2gENN9sighQ/E
         oCBD560Hd8I3fh6g5b+NnIakP+F7DxrTBPzBkQAKnVRmUU/t17/NOHNmJYjlabdsKJqi
         hjn1ANimcERGjVR35hS7zSrkfFk52SMk+jcbPfUT/vNQLe9qj6SnM/3YSCxLdDGcrG5t
         MKpwr+KAvvzT2QcNVFCWlD7vDGFexhbDYCvjaSY0lWfxeYEoL07vN/HX/+og77XjVaUF
         gIfxBKa6RaqIKj98wvSpBhJv9g1DvureM+59Wg+tEw23pmS+A3svd4ALShV9MV7c5Gx7
         thRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwltIlSJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05622a170900b002f93e27b8d5si638222qtk.41.2022.05.23.13.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwltIlSJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntEzZ-0002dQ-6S
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExz-0008Dm-BA
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExv-0004zL-C2
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:51 -0400
Received: by mail-pg1-x529.google.com with SMTP id g184so14669333pgc.1
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpC+VtE7S33sT1Hdq2TiErLR6SNR00Jn9wFnQN1e6KQ=;
 b=iwltIlSJED/FUPBg3jLHZYLn1K7+GjcVSATzYGzChkTGLSWwHSGTcHfSherNfUZyDP
 9A/Sk0FeZpaunmk6hQWCBvX5QaPHlHuZtAXjqeRu2aiUbMcl5YQW66GXSL8w58JHsKmS
 CSKZAW9COQuLXjci3s4GTr683zCW4NBzD2EiDx2nVK5NWgZWCh2x8EvbCgXobQ8yF9bB
 U8WX4Ed5fbVDfsbLVYxMj/yiYo4rqWJXF4dxRrgHWqGkky0fwJBgT6KwvoSHREKlQIfp
 vrMiXIvYWJ31Wjtm5sQ+iSKku1qprDo+l6wyA0W3cLbo9c5OS6WNnMyncCA/TfgxXlfz
 SKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpC+VtE7S33sT1Hdq2TiErLR6SNR00Jn9wFnQN1e6KQ=;
 b=FRudyAkJzOszMA5J67DMhPQGgS5u9j6bBMtFl9gn+6LEgAhDE1POQtMQkNjwYzMPOZ
 4n4jMtkJutUYFdHRa73F2zgc3Z+U/y02Tq2B1mqcyNSN/r7uNyhey8oaZZYjRK/ib+A3
 HlHPOVzyYMn26xlGTPRIqW9vtEHrvnpHYonD0GZ/aSviZZZN503+IjNpiDhvjJZ3CcO7
 S+w5qotw8/52KVkHOCukOEXJheg0Gkk/eGag99Xu/jLI3CkClqVDufAaMBvBXHs11N+y
 qXXzDDUtL+19z6bvzi/KkUgSGHHj3hjtJlT0NteF901k8Z9QKZm9pepe9apSdoCL/E2X
 uObg==
X-Gm-Message-State: AOAM531xomjW1U//C6kVwYg90pcx4OnS0C9zapHSPd2rkJB/8Q4CbmwX
 /Vsc2osBVVuvw23xUJyNL0Sqmg==
X-Received: by 2002:a63:ef4e:0:b0:3f9:e8c4:b72d with SMTP id
 c14-20020a63ef4e000000b003f9e8c4b72dmr11712232pgk.328.1653338865901; 
 Mon, 23 May 2022 13:47:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/18] target/arm: Use arm_current_el for simple exceptions
Date: Mon, 23 May 2022 13:47:26 -0700
Message-Id: <20220523204742.740932-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sHGHpcpUe2Wi

For these cases, the syndrome does not depend on the
origin or target EL, so we can simply defer selection
of the target EL to raise_exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c |  5 +++--
 target/arm/helper.c     | 10 +++-------
 target/arm/mte_helper.c |  7 +++----
 target/arm/op_helper.c  | 13 ++++++-------
 4 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 77a8502b6b..22db213aab 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -70,12 +70,13 @@ static void daif_check(CPUARMState *env, uint32_t op,
                        uint32_t imm, uintptr_t ra)
 {
     /* DAIF update to PSTATE. This is OK from EL0 only if UMA is set.  */
-    if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UMA)) {
+    int el = arm_current_el(env);
+    if (el == 0 && !(arm_sctlr(env, 0) & SCTLR_UMA)) {
         raise_exception_ra(env, EXCP_UDEF,
                            syn_aa64_sysregtrap(0, extract32(op, 0, 3),
                                                extract32(op, 3, 3), 4,
                                                imm, 0x1f, 0),
-                           exception_target_el(env), ra);
+                           el, ra);
     }
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c..e0be96b988 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3232,14 +3232,10 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
              * Synchronous external aborts during a translation table walk
              * are taken as Data Abort exceptions.
              */
-            if (fi.stage2) {
-                if (current_el == 3) {
-                    target_el = 3;
-                } else {
-                    target_el = 2;
-                }
+            if (fi.stage2 && current_el < 2) {
+                target_el = 2;
             } else {
-                target_el = exception_target_el(env);
+                target_el = current_el;
             }
             take_exc = true;
         }
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d11a8c70d0..98f2a3215d 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -540,14 +540,13 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
 static void mte_sync_check_fail(CPUARMState *env, uint32_t desc,
                                 uint64_t dirty_ptr, uintptr_t ra)
 {
-    int is_write, syn;
+    int is_write, syn, el = arm_current_el(env);
 
     env->exception.vaddress = dirty_ptr;
 
     is_write = FIELD_EX32(desc, MTEDESC, WRITE);
-    syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0, is_write,
-                                0x11);
-    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
+    syn = syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, is_write, 0x11);
+    raise_exception_ra(env, EXCP_DATA_ABORT, syn, el, ra);
     g_assert_not_reached();
 }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 6b9141b79a..61e9c1d903 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -503,7 +503,7 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
          * Other UNPREDICTABLE and UNDEF cases were caught at translate time.
          */
         raise_exception(env, EXCP_UDEF, syn_uncategorized(),
-                        exception_target_el(env));
+                        arm_current_el(env));
     }
 
     if ((env->uncached_cpsr & CPSR_M) == mode) {
@@ -567,8 +567,7 @@ static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
     return;
 
 undef:
-    raise_exception(env, EXCP_UDEF, syn_uncategorized(),
-                    exception_target_el(env));
+    raise_exception(env, EXCP_UDEF, syn_uncategorized(), arm_current_el(env));
 }
 
 void HELPER(msr_banked)(CPUARMState *env, uint32_t value, uint32_t tgtmode,
@@ -697,7 +696,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
     target_el = res & CP_ACCESS_EL_MASK;
     switch (target_el) {
     case 0:
-        target_el = exception_target_el(env);
+        target_el = arm_current_el(env);
         break;
     case 2:
         assert(arm_current_el(env) != 3);
@@ -808,7 +807,7 @@ void HELPER(pre_hvc)(CPUARMState *env)
 
     if (undef) {
         raise_exception(env, EXCP_UDEF, syn_uncategorized(),
-                        exception_target_el(env));
+                        arm_current_el(env));
     }
 }
 
@@ -870,7 +869,7 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
          * This handles the very last line of the previous table.
          */
         raise_exception(env, EXCP_UDEF, syn_uncategorized(),
-                        exception_target_el(env));
+                        arm_current_el(env));
     }
 
     if (cur_el == 1 && (arm_hcr_el2_eff(env) & HCR_TSC)) {
@@ -889,7 +888,7 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
     if (!arm_is_psci_call(cpu, EXCP_SMC) &&
         (smd || !arm_feature(env, ARM_FEATURE_EL3))) {
         raise_exception(env, EXCP_UDEF, syn_uncategorized(),
-                        exception_target_el(env));
+                        arm_current_el(env));
     }
 }
 
-- 
2.34.1

