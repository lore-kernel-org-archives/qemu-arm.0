Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706706lfg;
        Wed, 3 Mar 2021 13:49:05 -0800 (PST)
X-Received: by 2002:a1c:195:: with SMTP id 143mr814894wmb.147.1614808145877;
        Wed, 03 Mar 2021 13:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808145; cv=none;
        d=google.com; s=arc-20160816;
        b=M4+zb3513XrJZBaoR2+MWCGi2Mp5HfZrfK4V2lssf+IaApp/D212moXHa6dgs8gHSG
         mMHCr2k+AwWPCSBjK19WhDoZ+MlM+FE9bNdWHDsC7axNTvOQH5cs1Ma6VdKBGPvQtRl4
         +CUeW7KlDNlgw/iwop5XSS0lwgMWkYhTlUHV0qhEPrHI3iIf8m1VgtFeZQZtjhCojQ+P
         kd58utDAYAw9ADvSEfxhZhpRsVVCS2RxBvx4zWWrqdogehKNddJsPiakqrljMS2Cm82d
         nsEe4oOfCKNAvJaWBu6FnnK3H96/nAIUUglPE5DuV4IzwAOGwb1CJGVlZwlXpzIjaG1G
         hsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YomvsDs5ZuIQvjHtj4a66pfmvsA4AEqB6lKkhbtyTa0=;
        b=gw45UELcHoqJ+YXYktgqbJmrIBBIxOEypm61j8GW0ldvkDIH/PWJtN5W1SwXQ1N59b
         uchvl+zCO3P4pmdiCsqocxsMV37LUy31j6jTw97rfOsxuolsovHRAIkUZEDmsNq5U4Kr
         B26ez9JCb/f1QGBOEgRHvQMvnbdeo61X/3PNy6NfoNVWVvyDmIHKWqxPOnr6AXtNYh8R
         MY8xuiGlX3C2RVu2flbbRb/mUZ2fZyGYaomMGbJ4qz7ll7BcLSkQ7/ZtjhCWQMbKglh5
         jF9RgBjWbHhf/a4xv2zxtb0gE3U8FckUK5+mvnFxEsCSEMMWJTc4Aur+KRor3Gm/Kyia
         +M+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q9kzaXXL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9sor9290104wrv.48.2021.03.03.13.49.05
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q9kzaXXL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YomvsDs5ZuIQvjHtj4a66pfmvsA4AEqB6lKkhbtyTa0=;
        b=Q9kzaXXLsrtgfnSy3Tmba9fCoXSao4m4lBzQq5YHleVSSrhl5zcnSqGhWkEO4OAobR
         WvW/ywB6OTsHYI6wQ8cPu6VaeIvn/CYQiUjUcCYUDVEQG7R8Ms7BiFJx0ZyN88JYnF0u
         G/52mSy5QIerKxgusOdPeJgyGXbt6ahhnW5NmJrE85vpSEc617OVjW9CJcp0t++14T5b
         BjkEBuNXGKWR7Z4Teu6KbLpTp9kiXtNX24tHACRzjnjBqG+1lbJ+uDPGBBYeCivsdwSI
         OO0FsP49qsvuTTNGyX8rMMWTUxEB17cYGPC6IBxoLdEdsv2hn3uVOx39iIMg6psvp6hA
         q6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=YomvsDs5ZuIQvjHtj4a66pfmvsA4AEqB6lKkhbtyTa0=;
        b=DZxiT/aW+epDgepZxXHoz3o4tV6CPW13k+u431cUqJP5K6pOtlJtGNKpLyb5xbzRrr
         5brBCRlleZlOCAlm4yLtLcakU3Ha3KvEJ6UEy+vOSdVtajACbuOkWXSs+QpbISm3vhsq
         5NnV8dckOF4z+SAgfX9OFDVt3Edm4XPVzQJvIpILznmjRWBgNOtN+dP65pZg1wAWtIf6
         7UIJDwxSBpQpswJpuHL7JlMX2DZttU1UUWvh4LgeBGjbevIkgPTcHy85R2vbjRwCsBaC
         yg95J7vOjvY0iw2uUOddeIUhGZH7pQQC7z2CjPc2XokKJL7l+si9W2BjSxJKw33Wk1j1
         +mVA==
X-Gm-Message-State: AOAM532nItr7Ka3I0dThe0/lg2omeUctHqi75BN78JePPB+i6i5zA6b8
	Vmz791rX/31g3TtaoAFPqKg=
X-Google-Smtp-Source: ABdhPJzaxOXYuwf2B9PFQezRCx5O1WE2DWF5RcZ8r+jGknmMEb+TBFXF69v358dK6ZjgUEnlnFQ20w==
X-Received: by 2002:adf:9261:: with SMTP id 88mr754722wrj.270.1614808145655;
        Wed, 03 Mar 2021 13:49:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id h22sm9089008wmb.36.2021.03.03.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:05 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 21/28] target/arm: Refactor some function bodies
Date: Wed,  3 Mar 2021 22:47:01 +0100
Message-Id: <20210303214708.1727801-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wklAa3Tnza0b

Refactor few fonctions body to ease #ifdef'ry review
in the next commit. No logical change intented.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Patch easier to review using:
'git-diff --color-moved-ws=allow-indentation-change'
---
 target/arm/debug_helper.c | 72 +++++++++++++++++++--------------------
 target/arm/helper.c       |  5 ++-
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c01d8524443..980110e1328 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -230,7 +230,6 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
-    int n;
 
     /*
      * If breakpoints are disabled globally or we can't take debug
@@ -241,7 +240,7 @@ static bool check_breakpoints(ARMCPU *cpu)
         return false;
     }
 
-    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
+    for (int n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
         }
@@ -266,47 +265,48 @@ void arm_debug_excp_handler(CPUState *cs)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    uint64_t pc;
+    bool same_el;
     CPUWatchpoint *wp_hit = cs->watchpoint_hit;
 
-    if (wp_hit) {
-        if (wp_hit->flags & BP_CPU) {
-            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
-            bool same_el = arm_debug_target_el(env) == arm_current_el(env);
+    if (wp_hit && (wp_hit->flags & BP_CPU)) {
+        bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+        bool same_el = arm_debug_target_el(env) == arm_current_el(env);
 
-            cs->watchpoint_hit = NULL;
-
-            env->exception.fsr = arm_debug_exception_fsr(env);
-            env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception(env, EXCP_DATA_ABORT,
-                    syn_watchpoint(same_el, 0, wnr),
-                    arm_debug_target_el(env));
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-        bool same_el = (arm_debug_target_el(env) == arm_current_el(env));
-
-        /*
-         * (1) GDB breakpoints should be handled first.
-         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
-         * since singlestep is also done by generating a debug internal
-         * exception.
-         */
-        if (cpu_breakpoint_test(cs, pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
-            return;
-        }
+        cs->watchpoint_hit = NULL;
 
         env->exception.fsr = arm_debug_exception_fsr(env);
-        /*
-         * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-         * values to the guest that it shouldn't be able to see at its
-         * exception/security level.
-         */
-        env->exception.vaddress = 0;
-        raise_exception(env, EXCP_PREFETCH_ABORT,
-                        syn_breakpoint(same_el),
+        env->exception.vaddress = wp_hit->hitaddr;
+        raise_exception(env, EXCP_DATA_ABORT,
+                        syn_watchpoint(same_el, 0, wnr),
                         arm_debug_target_el(env));
+        return;
     }
+
+    pc = is_a64(env) ? env->pc : env->regs[15];
+    same_el = (arm_debug_target_el(env) == arm_current_el(env));
+
+    /*
+     * (1) GDB breakpoints should be handled first.
+     * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
+     * since singlestep is also done by generating a debug internal
+     * exception.
+     */
+    if (cpu_breakpoint_test(cs, pc, BP_GDB)
+        || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
+        return;
+    }
+
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    raise_exception(env, EXCP_PREFETCH_ABORT,
+                    syn_breakpoint(same_el),
+                    arm_debug_target_el(env));
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b94211..54648c7fbb6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6595,7 +6595,7 @@ static void define_debug_regs(ARMCPU *cpu)
      * These are just dummy implementations for now.
      */
     int i;
-    int wrps, brps, ctx_cmps;
+    int brps, ctx_cmps;
 
     /*
      * The Arm ARM says DBGDIDR is optional and deprecated if EL1 cannot
@@ -6614,7 +6614,6 @@ static void define_debug_regs(ARMCPU *cpu)
 
     /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
-    wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
 
     assert(ctx_cmps <= brps);
@@ -6644,7 +6643,7 @@ static void define_debug_regs(ARMCPU *cpu)
         define_arm_cp_regs(cpu, dbgregs);
     }
 
-    for (i = 0; i < wrps; i++) {
+    for (i = 0; i < arm_num_wrps(cpu); i++) {
         ARMCPRegInfo dbgregs[] = {
             { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
-- 
2.26.2
