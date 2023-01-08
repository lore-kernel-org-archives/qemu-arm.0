Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1327929ejc;
        Sat, 7 Jan 2023 18:46:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXszkAdlD0MksLa7IA0rAtjzPW5w0ZtYgLTl+4ql5GDSsIUnBgzeydesgyigRFWX6gkoDV/t
X-Received: by 2002:ac8:6e87:0:b0:3a8:11f3:b81c with SMTP id c7-20020ac86e87000000b003a811f3b81cmr82901985qtv.53.1673145973772;
        Sat, 07 Jan 2023 18:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145973; cv=none;
        d=google.com; s=arc-20160816;
        b=pHwCMe5QUXUK0h+BF9XGbDRl5zGQcx2Rg/9iMvoxS98qxUC2KyKw62SvZwmYDtKF8o
         n7+hRNOg7ZlSoNvEv01f1kd/ZOoSy5+OWMEmYnP7z36JaHk9dkNyNiK0Ayy+67HdbHZZ
         c1hm7gLdmeJ7gKbEracwl+PfeNflmI8PJDOUiVd9wZ/EsgKQLmsSWck+2qdwkzRcNizI
         l8tzDw2XIidd359Gil6fcNZSAx/M3JFhK3PyBM8Tkzv3VQpoHA/vWmUlXFPPz9X+9Vi8
         ZMO7TCILmtKcGTC+KR/3TQxHE2DQWsAMGPQ/WWresqroUnxUzfg9WPL0m1REhYQ64yl2
         9PZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0m37yJViirw0Wc/T2o6kI/jHDeYjleRW0O5TzNJ6/Gw=;
        b=dN0FS8ZSDwoWw7AXkd08tUQXDeLCwTYQbzpd9Wmtt3YG79bMrOJy4Okd5m6qx5wfEd
         xipePrQthD3fS2wzYfrDntYfI21BSjmZRDh+A5F1hoOPUfp6hDaPawCdY/o3a1Aqzhzb
         CLEw2BM41eg/F6QKoRd4GvMo76G6H2InQfpL3exJFtkCN2WR1vuRiHo8KRAwmMVG4mtN
         hgCoijglcd9kV6V+Ok9RuEFkXprHPyw44DrHTDKpT1WqduD/MlZSU/kFalOpMAnzF/Vv
         HDHWAQuvbSVkYIvjQ4VoBQwOTUcxC1FzsZDz78m7F6RHaZxRjH5YB0A7N0OMME0fy4LR
         hOdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4+cxeTY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020a05620a294c00b006fa2412eec9si3127718qkp.587.2023.01.07.18.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4+cxeTY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELa7-0005rv-RS; Sat, 07 Jan 2023 21:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa2-0005k2-DD
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:38 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZE-0004i4-Kx
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:38 -0500
Received: by mail-pl1-x636.google.com with SMTP id d15so5874135pls.6
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0m37yJViirw0Wc/T2o6kI/jHDeYjleRW0O5TzNJ6/Gw=;
 b=h4+cxeTYl00k+rgoM0vv41/Usl7td91koPjOdPmbIrk9Ea10TDSD1uGzQBwgxvqv48
 OsoS1rK0TA8yfiadWo4InJ+9YJ3xPMKYi5rxK0YG4SyEJK9yPu8ZtnmSo6J79MaJbzBc
 wjQvhWqFw4mTmUFfLQc6eZbWD7QbT/ByITs7ttr6HJ7GThC0EbQkEq+kVYiawTXFKTV+
 h1jSXt5sM3RMsEhpU8r1OB7CiJiAtFwROctYRt3qP1RmJjmvP5/wYUKqt4En2ocWs4UK
 c1Qvt/KAy8hd2ecxd8W+Swd/WGhGKr7RonpbqmsH6mI/EPiHlxD+KurTJIjmsCoDd3Ct
 hU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0m37yJViirw0Wc/T2o6kI/jHDeYjleRW0O5TzNJ6/Gw=;
 b=EUECOFgtdR1gMJXw4XqTQDaoeVgeICsrnq1qdnRvlpKCwYd3nZhWVdlGYRIeJdzSB9
 xwHrBRGINucc91rSKlNyke9d0FkgMyUlUe3CvBT/XTXQzQUfzxXgAUQ5/cjJfe4mJsoo
 QaWOCqiZ4eClve44+EvJwJLdHGwuwlbG/IY1a2vcfkae34/rkFioxioGPsFVr+hneHfe
 pryPirK5fFipMP4ka1y5A7VDYZa5ucDLNdB5AY8kWk+T5+THBld1b9p6OhkltGePzPIK
 5LMmnzM6qlm1UbdYco4U+Ivdqtfl2VwuOQk5ZsoNA3Yeay782Sv1nMBiwc0XM14H6v1z
 XdGg==
X-Gm-Message-State: AFqh2kqey7vopbF9dg0gmj6XniyAjNX+pbtBhm0huVka/fhWdxrpnGZU
 pk5/XiKgk6JLKQISAyUphRoBt28CPXVYN8oI
X-Received: by 2002:a17:903:40c4:b0:193:197e:494f with SMTP id
 t4-20020a17090340c400b00193197e494fmr5227036pld.27.1673145467340; 
 Sat, 07 Jan 2023 18:37:47 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 24/36] target/s390x: Use a single return for
 helper_divs32/u32
Date: Sat,  7 Jan 2023 18:37:07 -0800
Message-Id: <20230108023719.2466341-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ebW0G9bMRZs1

Pack the quotient and remainder into a single uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix operand ordering; use tcg_extr32_i64.
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
 target/s390x/tcg/translate.c  |  8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 93923ca153..bc828d976b 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -10,7 +10,7 @@ DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
 DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
-DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
+DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 954542388a..7260583cf2 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -34,45 +34,45 @@
 #endif
 
 /* 64/32 -> 32 signed division */
-int64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
+uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
 {
-    int32_t ret, b = b64;
-    int64_t q;
+    int32_t b = b64;
+    int64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (int32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/32 -> 32 unsigned division */
 uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 {
-    uint32_t ret, b = b64;
-    uint64_t q;
+    uint32_t b = b64;
+    uint64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (uint32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/64 -> 64 signed division */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a339b277e9..169f7ee1b2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2395,15 +2395,15 @@ static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divs32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divu32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
-- 
2.34.1

