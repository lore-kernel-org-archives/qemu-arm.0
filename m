Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1942488wrq;
        Sun, 10 Feb 2019 17:09:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYzDhaF1mMJKvs8oO8YwanzANTmcFtyFOPaRjccoGZGK5n96pM74BK3Qv8NRLSXW5ggiLv6
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr19034669wru.306.1549847398205;
        Sun, 10 Feb 2019 17:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847398; cv=none;
        d=google.com; s=arc-20160816;
        b=a5KJrYBNiCEb+wndcWcXrSWXnX1pND9gq1uWGQ9QhTnc4KwLZz4wduxWAPIN5boy58
         XzLdi3ZZlM/a3RK7ANhDIbbvbORnYU0m8uTLRNGJnEUOZZoW7ACGDvUJP2wsbFZwbtbW
         X9fzQ/rSJCpI9x59T8NXTQHnxnL6NH5rchHBgilHO9/D0iLVetYpmIScxDCGeGgl0bW1
         9dwIuKe8WGuUaT9eBdMxh5Wfb8IzlUr+UyE3OmVFYNQRz+xsFsEVD2OYeNQWBpC+wNZs
         CQMNTZNq9y3Nk1LWDVNNAPdoOcvHHFAR2C2+5/8kwxOl8SFPpblAJ8JQmOJQGqoa8hOJ
         zXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1ThSYlTjjjdful+PEa+IzVjavr7hehgRai0NxwGpzTA=;
        b=TdaXgxjyFNT5KA+iw5HhY63uPkpY6PRddNUy97E+apjHdg+GQi1XW1awea+S1PPM4j
         wOZom34XN0LFM25E8xWnQ+aAdHkHZHV2CHt6W4mrn7AbxTT5eNmrxKgrDCjJKWvZgZli
         H19vzjTcIB4pC/kZ+yHQamRWyUdK9MTYVkyOjpEiDyfZbr7Nur28CIC7jUooCi5mcp3v
         5iQet0Xp32Yi0nh+E94cJmw+WSvu+uyG+nFIYU3BOCunNjxyYtVGQnFXvwB0TC5UoAZl
         l9hM12CL7+jUQm9D3ar7tPpr1xyxOqzjJNCGaHkSWYWgpVZZx90m9M5fzrPcrjFxNf/o
         RiLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lb8pLBzY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si2670119wrp.49.2019.02.10.17.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lb8pLBzY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt06f-0006Rx-1J
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:09:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05l-0005ib-4c
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0008NJ-8j
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05g-0008K7-Ez
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: by mail-pl1-x643.google.com with SMTP id w4so4525666plz.1
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1ThSYlTjjjdful+PEa+IzVjavr7hehgRai0NxwGpzTA=;
	b=lb8pLBzY99qbbnUezoxVC8+N1IJ7AAi2fNowxzt9sV/FSUWgss64EUFGWgDrW3176P
	7AU9xlHugcY9U+JJhBHxw0gL96iVsAmdi+QWAGXIGSdhO29dPUuwcUTTrfQ5a7DPYGLV
	dPdWLruaK4KfivPHZ35kyGllIEAJhoa8CGGt665Ae9wrnVcJ6MkmjwGokxhEfjaQZrXa
	cory593DEWqeNGx17URLtv7Ej0nnNwK0d9r02xxyz/gVQyHoEaTdnFHGTmcABGk5bwz1
	UzJ+tcfRahzgTzozABie++4bZo0XL8EsGrCKTy4MBTu+2II9sEMd02Unqw1roPAkVY/k
	deYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1ThSYlTjjjdful+PEa+IzVjavr7hehgRai0NxwGpzTA=;
	b=s0i5lhjAghD3WewH0K/BbsO53Nyac3d20tU5h2YEoIlugkMV2dEh5mHJm3oPNywXth
	wT96BjMSO3+dAFK1xKMjKFR+qYvMXaQF9vvfcsb4IhEkLjRq+Ngnf2lt/MgPxR/CG7hJ
	8z40vC8qe6NAfIskJqXuVw4nYMoimtJ+4G+scjbEPoL00L1pct3WH6tGx+3b2X+bAXx3
	Zv6FH4sOR2dKbhveNHPpHqXqas9z2Fin/9qQkDYPR2kkbTKRkXcQRPq0JVM/P+rEYLPb
	nZzMB0EwrltDDVa/yoEIKs0sd4A/arbzWOu3v9A2Th9xXdVbikq5aqEIfrNeqh+Zvazy
	SP/Q==
X-Gm-Message-State: AHQUAubz2MEvzWY+KU6lNgdSCpEEmS7y+K3cdFasD3+7NBpUaKw503F1
	iI+u9vIliPuQ3kKIt8BztEPciKtjeBQ=
X-Received: by 2002:a17:902:8bc6:: with SMTP id
	r6mr34676795plo.67.1549847335170; 
	Sun, 10 Feb 2019 17:08:55 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:21 -0800
Message-Id: <20190211010829.29869-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v2 18/26] target/arm: Implement data cache set
 allocation tags
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5KVVeiCCpXCe

This is DC GVA and DC GZVA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use allocation_tag_mem + memset.
---
 target/arm/cpu.h           |  4 +++-
 target/arm/helper-a64.h    |  1 +
 target/arm/helper.c        | 16 ++++++++++++++++
 target/arm/mte_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-a64.c |  9 +++++++++
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 74633a7a78..ca32939483 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2160,7 +2160,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
 #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
+#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
+#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
+#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
 #define ARM_CP_NO_GDB            0x4000
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index a00364fb4c..4ad900d36e 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -113,3 +113,4 @@ DEF_HELPER_FLAGS_2(stg, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(st2g, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(stg_parallel, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(st2g_parallel, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(dc_gva, TCG_CALL_NO_RWG, void, env, i64)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 74bace81e4..9fac3628e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5820,6 +5820,22 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "CIGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "GVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
+      .access = PL0_W, .type = ARM_CP_DC_GVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
+    { .name = "GZVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 4,
+      .access = PL0_W, .type = ARM_CP_DC_GZVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
     REGINFO_SENTINEL
 };
 #endif
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 13befdbf86..93f7cccee2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -386,3 +386,29 @@ uint64_t HELPER(st2g_parallel)(CPUARMState *env, uint64_t ptr)
 {
     return do_st2g(env, ptr, GETPC(), store_tag1_parallel);
 }
+
+void HELPER(dc_gva)(CPUARMState *env, uint64_t ptr)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    size_t blocklen = 4 << cpu->dcz_blocksize;
+    uint8_t *mem;
+    int rtag;
+
+    ptr = QEMU_ALIGN_DOWN(ptr, blocklen);
+
+    /* Trap if accessing an invalid page.  */
+    mem = allocation_tag_mem(env, ptr, true, GETPC());
+
+    /* No action if page does not support tags, or if access is disabled.  */
+    if (!mem || !allocation_tag_access_enabled(env, el, sctlr)) {
+        return;
+    }
+
+    rtag = allocation_tag_from_addr(ptr);
+    rtag |= rtag << 4;
+
+    assert(blocklen % (2 << LOG2_TAG_GRANULE) == 0);
+    memset(mem, rtag, blocklen / (2 << LOG2_TAG_GRANULE));
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9bd68d522c..a3bd2e27ef 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1811,6 +1811,15 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         tcg_rt = cpu_reg(s, rt);
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
+    case ARM_CP_DC_GVA:
+        tcg_rt = cpu_reg(s, rt);
+        gen_helper_dc_gva(cpu_env, tcg_rt);
+        return;
+    case ARM_CP_DC_GZVA:
+        tcg_rt = cpu_reg(s, rt);
+        gen_helper_dc_zva(cpu_env, tcg_rt);
+        gen_helper_dc_gva(cpu_env, tcg_rt);
+        return;
     default:
         break;
     }
-- 
2.17.2

