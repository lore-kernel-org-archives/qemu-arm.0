Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4553155wrv;
        Mon, 5 Aug 2019 17:05:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBSjURvTqGUgebpUArFh+t1hg8hrZedmC4WCWQyOkwzUOyQzuuh7nYGbqFilxwSfaTOS9V
X-Received: by 2002:a17:906:9385:: with SMTP id l5mr575270ejx.8.1565049927460;
        Mon, 05 Aug 2019 17:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565049927; cv=none;
        d=google.com; s=arc-20160816;
        b=0WSMOvDzUYySTfUzrV7ZHAF0nMa6GpwhGcf2dbo5OysPF9x4qA2JD8bA5ceyR4Hgmz
         VZf2Yhuj40oArZDbNY47BsyH3GIB3zGG3U6dmSBkKdXL+kIx0pZu9KmszGDGyMhSdX/k
         raLVd6M5LXm92PcSvnBt1J+gIH9LfaDEELAIpsTn5fgn3zZYkGTluMN74i2CREcVVphi
         +fUpNQpADgHjJz9QqLj4VcXTB+jHZZ9de6RAQjyiTWkHBi3YhptP5jzDZdp1heESPsth
         5VKvfwm+LgIMdclUIcTbzVuFNEbSiVVMzlmfb4lpm9qotfZ2nbaacvadfxXeNci2dgHL
         2aaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7UQASDLrOuEF/hUHDxJjRqnvDqT4SknEM9H9useKOF0=;
        b=Dd3ddH73MXJT9Fz5gdhag8/Qa56HFwiB1tCWwUaW/oDcyh1Ak+pM8pRv7XUTF5hPVR
         cXa9eLGonbYZxAVnSFqrK+/r1516v/XqH4fCeKIVB9PZdpDxw30FacYxDEKh0woiMiy6
         bEb8zvSad5rTjI6rKLSKQXWkXLoteFzh6Z5ffk3sTPTsXdswMdIGPQMdokbGuOK2Wbho
         AusJxbwW7gtqV+5bisuWyyWR2S9tfQvCrDRTdqhKH0soSjQpVg7tOJFhbeD1UOGyGxRi
         8+TMyFOD3+72+jo2RVBYQQ2B8v76dJPtn6nJS0v6xX7aFcSTIYAj+ntpE4Y0JbW14C3Y
         Nbew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yNC2n1Jw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a56si31094004edc.379.2019.08.05.17.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 17:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yNC2n1Jw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1humyk-00043B-I6
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 20:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33675)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1humya-0003y0-2m
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1humyY-0008G3-PH
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:15 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1humyY-0008Fl-Ga
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:14 -0400
Received: by mail-pg1-x542.google.com with SMTP id n190so5420361pgn.0
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 17:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7UQASDLrOuEF/hUHDxJjRqnvDqT4SknEM9H9useKOF0=;
 b=yNC2n1JwKlOEdhDUriaGW8KrTWfzkYCUOwpOHVwU2PqdBSqYs19X2N6xZXH4/INZn7
 fzIKYfCyisl1/LnI3/PxuHF/aG701rAFUku/VvAGnJttWMmivL0IKBvM8aDtEA+4h0Bq
 2tIjd5PlynA0qyNKwMNQWFbBtrMHFGRCAvkgbqqoR4+9+/wk7/kSL+iQtGGUb9itnJ5v
 dMeSuNKbkPLurNZmC+ZE24d2NJ/Qeur7Dfwn7OQZPDO4iyKEw4ZfTOh2lipzUVh5M7wa
 WkjAXQLrK0qK0BNId0JomCynIY3fFfgfVZCmvZ1pBjpR3VqVm38RRQL0iGWsJ0Annx1T
 xHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7UQASDLrOuEF/hUHDxJjRqnvDqT4SknEM9H9useKOF0=;
 b=b9n493vkqQj72EbhdkYncD5X2kPmQdOB91CuP+8TLmoDEkib5mhSd12jxdrEhrQPrc
 6EpI7K5r3fWQAxuxk6nep4HE9sAEYGztMrJUxF3LADOZImzRILrVCifKxMMV0M/vsjHC
 FYJxwF7DPS5NU3PIAIph2+0nOJxsJLysjJPSqDcBzU3kqmUR7u6djgzKIXCgXVf5Rv4j
 YcK293gnJHCPY+o+W5hebiKTyObSkwczqNe9LVRJ5qZC+vnfjQkMYOVUVVmBTiVvRcnY
 8VHKrY+d0M1Nh3fbaajvrXU5qsRlQx1TFb7naRzydriHu5H2o/6jLZlNtNb3i8NFDP/2
 NwRg==
X-Gm-Message-State: APjAAAV1gix7HPGM246xR1kDW5AJqjphscTDVUw46fwrr/yUnE6gigaL
 JuhwQ7g8Zd5fVVMMW1/EQml1Ww==
X-Received: by 2002:a17:90a:25c8:: with SMTP id
 k66mr276028pje.129.1565049913622; 
 Mon, 05 Aug 2019 17:05:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm92149782pfo.138.2019.08.05.17.05.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 17:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:05:06 -0700
Message-Id: <20190806000506.10833-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806000506.10833-1-richard.henderson@linaro.org>
References: <20190806000506.10833-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v4 3/3] target/arm: Rely on hflags correct in
 cpu_get_tb_cpu_state
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSZWd17KwJeS

This is the payoff.

From perf record -g data of ubuntu 18 boot and shutdown:

BEFORE:

-   23.02%     2.82%  qemu-system-aar  [.] helper_lookup_tb_ptr
   - 20.22% helper_lookup_tb_ptr
      + 10.05% tb_htable_lookup
      - 9.13% cpu_get_tb_cpu_state
           3.20% aa64_va_parameters_both
           0.55% fp_exception_el

-   11.66%     4.74%  qemu-system-aar  [.] cpu_get_tb_cpu_state
   - 6.96% cpu_get_tb_cpu_state
        3.63% aa64_va_parameters_both
        0.60% fp_exception_el
        0.53% sve_exception_el

AFTER:

-   16.40%     3.40%  qemu-system-aar  [.] helper_lookup_tb_ptr
   - 13.03% helper_lookup_tb_ptr
      + 11.19% tb_htable_lookup
        0.55% cpu_get_tb_cpu_state

     0.98%     0.71%  qemu-system-aar  [.] cpu_get_tb_cpu_state

     0.87%     0.24%  qemu-system-aar  [.] rebuild_hflags_a64

Before, helper_lookup_tb_ptr is the second hottest function in the
application, consuming almost a quarter of the runtime.  Within the
entire execution, cpu_get_tb_cpu_state consumes about 12%.

After, helper_lookup_tb_ptr has dropped to the fourth hottest function,
with consumption dropping to a sixth of the runtime.  Within the
entire execution, cpu_get_tb_cpu_state has dropped below 1%, and the
supporting function to rebuild hflags also consumes about 1%.

Assertions are retained for --enable-debug-tcg.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain asserts for future debugging.
---
 target/arm/helper.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b07350cfe..abb8cc52dd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11155,19 +11155,29 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, uint32_t el)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    int current_el = arm_current_el(env);
-    uint32_t flags;
+    uint32_t flags = env->hflags;
     uint32_t pstate_for_ss;
 
+#ifdef CONFIG_DEBUG_TCG
+    {
+        int el = arm_current_el(env);
+        uint32_t check_flags;
+        if (is_a64(env)) {
+            check_flags = rebuild_hflags_a64(env, el);
+        } else {
+            check_flags = rebuild_hflags_a32(env, el);
+        }
+        assert(flags == check_flags);
+    }
+#endif
+
     *cs_base = 0;
-    if (is_a64(env)) {
+    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
         *pc = env->pc;
-        flags = rebuild_hflags_a64(env, current_el);
         flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         pstate_for_ss = env->pstate;
     } else {
         *pc = env->regs[15];
-        flags = rebuild_hflags_a32(env, current_el);
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
         /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
-- 
2.17.1

