Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1805554lfb;
        Mon, 6 Jun 2022 19:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKpwQ9LQgquctli/+kZu/znzXx/W8Xuk/LuFBb932YCDAKB/Eu4oV/cLGuHhZwRxluRcM/
X-Received: by 2002:ac8:5b50:0:b0:2f9:3e39:b75b with SMTP id n16-20020ac85b50000000b002f93e39b75bmr21061710qtw.60.1654570642080;
        Mon, 06 Jun 2022 19:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570642; cv=none;
        d=google.com; s=arc-20160816;
        b=eIOCtdMe60kW7gcT5PLtpjc6Cq67Sk5eiGN/xESFHe7uN7BLrYpSR5ffN5QCcGBPdg
         nr1Qd8NAvxXJMNc6g8pkXW8ti2e5nHbIb6AQoYCnkbnh3h3GkUjSbwyerrnoJfDawxd0
         SJKMxJ1x721vM7Em+WIVHVQxPL6q/IPx/oiDXjLeoEFa1t8V2pnIJwVNhd1Y8HhmppHd
         h0TB9+f1WTdm4AcXceB1hSpTWF9OMFEg8pD33y1cNhr68g9NRsLXdN2+Uvt38+eqh4ER
         h+T74bR6l83XKn+hTpKhdfJLvHLLu26IWV+nOocdIOlpIKHAFCRMef9grOflEqffROrA
         +N5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aAUg0t4CNRhFnxvoa04tRoC0cuTYTfVxatS7xBTko0w=;
        b=ZsVpv/h0TZmj4AUMBYcSUnVxV1M51oSeofxvXPI4UwNI8RdvS98t6ZF0ahRfNXySuZ
         zW3PfHjeqYXhXr+YrhgQmTeauxt183+FgloY3FOJI83vMjH9sxM6vqOr2j2Ky1Y4ervN
         lkaydYHoNpIO2ZULMSUaEiVFRyf8qNcDDALwgEpLkruLMc+5864Y2fmP6wlT0mOWyKpz
         UJpG5a492cnMBkLFtQADxQWTwq7G2Hm6xgbwNFP0nf6cpjDUfJd3ZdkeCRpYiwDhiHWd
         hidBVU9PErzKIRCr1qb6CEZt53zVsR3DsV6+BTGHvzxMXhOFEfWrnDNUOgMFSCV77sF0
         GIcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sa0KsQxp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05622a190700b002f3eff80fcdsi9525611qtc.452.2022.06.06.19.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sa0KsQxp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPPF-0007Py-ER
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG5-00075Q-9h
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0000Ln-W3
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso14238434pjg.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aAUg0t4CNRhFnxvoa04tRoC0cuTYTfVxatS7xBTko0w=;
 b=sa0KsQxpiX6Q66nJM1M1NhHyMQzTSzoW/PNj7sjW7FiZCZYM+g+s6OYqpgMGxs6RiM
 4uUe0xmHnYoqAL46oo3AicG9aaGItpmJmZDAwNTj7L3gGLa5HBmme5TJvNJN04R92lWJ
 lUsYlS4/+1QG4lY/xgTVR4QWIEsvvAhBQ74WGUxTakP0TT6BmyflRzGt074iivPmkyCt
 cB3FSLDk8bDdGolgr2zrE8XGKlqU/JLnQ0d+rBSBLSDpVhfr8kVrt5irK4DHbIWHJg51
 SwwHoNeqhjPuXoL5izlLJdm7maSdy0nNax80Ei5uy7/uHh/Uts0d7yuy+EjcoumtYKn6
 Kpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aAUg0t4CNRhFnxvoa04tRoC0cuTYTfVxatS7xBTko0w=;
 b=K9f7IusX9w48Sl1aT6oMseE2Bex8t3LgJ4pcQeZPIbNQSH3hVNgLQnWkdsGAKMvaML
 t+EHfjLpIdlDqHC4BhDwU4cztELvfFs+qwl+jp0JHEAgc4k8gS9v+u2PGMOw/cAKhQ3A
 XG80CMtFsDvv/a8ekXTzDBFeoKguwe3l5lPF1mjbw/xrthXAGZHky8jpYJKCoDr8o4Zk
 wcHVl/beOILleNHZEezjpjP1SNa2wsMOe7ALVJQJl7BGuupZDuUiqjfrkMte7m/1n3ad
 RQNYe01hqyQmy+2WBdCnf2ula6iJV2s6j+Mg9Wsg+hWR6nL7bCRfUOA14Niykih3fnuw
 chbw==
X-Gm-Message-State: AOAM531Q7ntdo5gBnPQ/yRl7nk3vlohOXbhPUQHCyex4b2CnnN/pkmQt
 XFl2QDjjJT+W55DQaW+d4gUtrWi1QNZW0A==
X-Received: by 2002:a17:902:d4c2:b0:166:46c9:577b with SMTP id
 o2-20020a170902d4c200b0016646c9577bmr23581425plg.66.1654570067488; 
 Mon, 06 Jun 2022 19:47:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 14/25] target/arm: Create helper_exception_swstep
Date: Mon,  6 Jun 2022 19:47:23 -0700
Message-Id: <20220607024734.541321-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XxlJu8ap5/LP

Move the computation from gen_swstep_exception into a helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h       |  1 +
 target/arm/translate.h    | 12 +++---------
 target/arm/debug_helper.c | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index aca86612b4..afc0f1a462 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -48,6 +48,7 @@ DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
+DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 04d45da54e..c720a7e26c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -350,15 +350,9 @@ static inline void gen_exception_advsimdfp_access(DisasContext *s,
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

