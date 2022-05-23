Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3762573lfh;
        Mon, 23 May 2022 14:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZYWp0cxitbMxaWcCtbgBvduocv9QXG1Ld4qH3pBbcZwU1YR/ngnYvdF0O1zS17ySIqVL2
X-Received: by 2002:ad4:5bef:0:b0:462:3243:6e3e with SMTP id k15-20020ad45bef000000b0046232436e3emr6909813qvc.74.1653340034307;
        Mon, 23 May 2022 14:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653340034; cv=none;
        d=google.com; s=arc-20160816;
        b=McIH+Cvo3YB2ozuspTKLmWa1sStiIGrrbnUUDBms+s9WJEif4myOqtqeVke9tuLqo7
         94+X6Ku/ebHgYtLqzAk6B67Mlc1aUoarG3wx8R+r2Q2agPSVXz34N+F/lIUa9V77XQso
         BmV1fJhfyvGMkjFukT646jDJR1f/xUzFshuutgsmWEp+E4bH7bzWMe7m/K93HMgc+XL2
         0x+pgK5o2nQ0EIsc8IWZQL6koea1VpreUOOPDhrNob7aY6cOjFxF8Hdx4LV2FUnNK7lx
         6EcgiMfz0wCpZiRKIZpICP5Zr6iL3NunvnfYgj2ufaf3tgqpHrNmDMXWPaKwS/g4yR+P
         wizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ob+JyjaA3mDDf+b8simoocWpP1x20nWcpANbzQ0uZBM=;
        b=hp6ltowTaPqh5HSvF0UJJGRQrvqXRcIdLpCJhu3U/UEahwCtV5lSdecTghlwwSyyEN
         6WYGfczdh3Wkh+o+HpGugKCTYWS0V9rEzsRECE4DboKr5no3JZ+9bE1xioB4yjG789Sd
         5puApVbPnUPHc38F7Nu6JpPDTROq6+yjwSC5WttQIioRJ60K6EY2/b5LePwPIxevx6Ed
         0CTpSZLwQcWoscz4eHTOH4fqPmxPVZPHjHPBW/z+OS2Lt3QJ/ljp7zjRbFqoNaFiOhX8
         6XlZxLVIkNXCr0NCneVlPUVRo5h0YDz/L9d+yPzMnlith8woGlWGy1fMNslSuB4FvBmw
         bJmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnGdZIAf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl5-20020ad45e85000000b00461b52e0c53si3047095qvb.91.2022.05.23.14.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 14:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnGdZIAf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntFGj-0006nb-JJ
	for alex.bennee@linaro.org; Mon, 23 May 2022 17:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyI-0000Tb-Os
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyA-000539-D0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 a23-20020a17090acb9700b001df4e9f4870so368820pju.1
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ob+JyjaA3mDDf+b8simoocWpP1x20nWcpANbzQ0uZBM=;
 b=VnGdZIAfsxGX2A4Styl41yxY6YhZFwHIPel9299tBkUrkLEJiN68NpTefiUc84oPBp
 Dvi7YAVa4afGw44WCtsyBAPi/R1AxIKMOIzlmZHuPAZFkIe21ZQQgumLaJ7OnCLXZNcg
 nmdRErpC6cdNXm/Nz7Il7MtklrC4SxUKl/bqh2IOwnsnjEGyKpCzXQ3QIHbImOQIpgiC
 0mge07PpBSkekU9y8LHEFIENHBgIGSvnQrw+/wdiTH8S7JkJKm921MRvcp1E26Z+Ctde
 6W1uFLE1q19ZNHmuU4v1nm8YW6Lz/f8j40tg8J5zhRGjLQPwdqXZgzumWGHf/eqHLuwQ
 WJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ob+JyjaA3mDDf+b8simoocWpP1x20nWcpANbzQ0uZBM=;
 b=LeWY3MUd6letBShLFk5WMQ8U5/TkVjEKYOZlrET5V7G0rR/67WuZgH4ofyetDwH6O1
 I9tuWxWrtN34YGkZrBiNLwrksnxBttTeBV/YBpdmvcHvrPwI4EhOqYVuaFFjae2dMvDn
 2G1+q3NpzYSy6Qkmq8b4Mt4tI/x9qYoKv5iGaVzTdsMPP+n20NRsnda3CV6pkYC7NkrF
 sOkLGHYmJTOaMtHDRqBU6vQ/lxZV7QhfOJAKEedVaXKvZgiNidkHN6xkivP9Xy3nzS/l
 daIWOffIJu4obzlBjpU+LKs8P/jvlPA0gxsKt/8dxOhjNM0PdwkRw7bocQaN5pGxhUwy
 7eDg==
X-Gm-Message-State: AOAM5310GEpubNJk9rgFWCjFnbLSAvt0OcI4mK+pTZP+2rQecaxenOmV
 q00GUQouokk1L0CDjz8nsFRpMHxX86Qr5g==
X-Received: by 2002:a17:902:e80c:b0:161:9b73:3908 with SMTP id
 u12-20020a170902e80c00b001619b733908mr24367791plg.54.1653338881549; 
 Mon, 23 May 2022 13:48:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:48:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/18] target/arm: Add cur_el parameter to
 arm_generate_debug_exceptions
Date: Mon, 23 May 2022 13:47:41 -0700
Message-Id: <20220523204742.740932-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
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
X-TUID: 1f4BWyMk3HQR

We often have this value already handy in the caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    |  2 +-
 target/arm/debug_helper.c | 11 +++++------
 target/arm/helper-a64.c   |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fbb69e6919..09d25612af 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1308,6 +1308,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 
 void aa32_max_features(ARMCPU *cpu);
 bool arm_singlestep_active(CPUARMState *env);
-bool arm_generate_debug_exceptions(CPUARMState *env);
+bool arm_generate_debug_exceptions(CPUARMState *env, int cur_el);
 
 #endif
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 8d87b65a8d..a5363a5048 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -94,10 +94,8 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env, int cur_el)
  * CheckSoftwareStep(), where it is elided because both branches would
  * always return the same value.
  */
-bool arm_generate_debug_exceptions(CPUARMState *env)
+bool arm_generate_debug_exceptions(CPUARMState *env, int cur_el)
 {
-    int cur_el = arm_current_el(env);
-
     if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env, cur_el);
     } else {
@@ -111,9 +109,10 @@ bool arm_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_singlestep_active(CPUARMState *env)
 {
+    int cur_el = arm_current_el(env);
     return extract32(env->cp15.mdscr_el1, 0, 1)
         && arm_el_is_aa64(env, arm_debug_target_el(env))
-        && arm_generate_debug_exceptions(env);
+        && arm_generate_debug_exceptions(env, cur_el);
 }
 
 /* Return true if the linked breakpoint entry lbn passes its checks */
@@ -309,7 +308,7 @@ static bool check_watchpoints(ARMCPU *cpu)
      * exceptions here then watchpoint firings are ignored.
      */
     if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
+        || !arm_generate_debug_exceptions(env, arm_current_el(env))) {
         return false;
     }
 
@@ -333,7 +332,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
      * exceptions here then breakpoint firings are ignored.
      */
     if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
+        || !arm_generate_debug_exceptions(env, arm_current_el(env))) {
         return false;
     }
 
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 22db213aab..fe2a0aa261 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -924,7 +924,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
      * We check 1 here and 2 after we've done the pstate/cpsr write() to
      * transition to the EL we're going to.
      */
-    if (arm_generate_debug_exceptions(env)) {
+    if (arm_generate_debug_exceptions(env, cur_el)) {
         spsr &= ~PSTATE_SS;
     }
 
-- 
2.34.1

