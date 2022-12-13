Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4493612ejb;
        Tue, 13 Dec 2022 11:08:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62k4c5qDKSg68tN9qmRkYTsvbeDnB5dQiw+jmLCAjvJ/DTbNxnmcT937+CDkwD1u3Zrg5V
X-Received: by 2002:a05:600c:4e41:b0:3cf:8261:8de1 with SMTP id e1-20020a05600c4e4100b003cf82618de1mr16787962wmq.8.1670958507904;
        Tue, 13 Dec 2022 11:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670958507; cv=none;
        d=google.com; s=arc-20160816;
        b=PlfiZ679zLPiYbrLsDUmnigvU16lqM1sVhe+sPrKWq7JbKzPn8AQbiJsER3pj4w76o
         Q16H5mbK77rfcOUIpGM2RV9dW6KM38w47pwhYwLqms522k55RMgGs6DrtZizHG4oMhjS
         Veji9mQbR5fra5AppIxTf6vqYO3IqSqwS43KQ9c1olfCrc2bTeYHfN6rNz8Z0ZccuFVt
         ClYoHj8Kzdiaq5IYNwl7OvZEDc+jw1mS+TvG5D7XyjC1fHBMvy9SG3ys3VtP192tWgCV
         roNunbVB40eMa8mNa5pNacDMpSuEEsfvDH2cFooxQ2NZxSGIh+6HrSvgydiYtYE9dqFM
         cUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=LFf1zIDHqWBtG1h4KlzJnhLXK9qn8VZ2/j7hbKgy7gA=;
        b=LFFx8Uzh9ZDbGAaHXbdJsoYPo7FUlFiBC8pmH6QCnPlKkMTDfvBBodL8BqM+Zz6f/U
         vZUNlFadjcKDvVaY0rDmTYhGIitffmDO/kvp2r3g8FIPese55j2q90cdAV/AfjNHyCWf
         D94/TOvNGYcIQ4LXeZzLiAnVwPbVUl3955/2b++PQlEt1TEeYCbiAnsTPwwkjETFw2K0
         LERUXRse3Ynx5X1QSGMvGFlApUg+RvqYVZXYeNS6X24g84BNR98QN3mLWy5wOR+ulYIZ
         b8XsUcyFvoJ7K7hLuaKqMm4UbiWMPE7nd5P1qbGJrqzpQTPB+188cbO/1wwyoh626r5O
         Iojw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=eyuVGpUd;
       dkim=neutral (no key) header.i=@suse.de header.b=o5XtHXri;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id i187-20020a1c3bc4000000b003b4728009b1si6177497wma.174.2022.12.13.11.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:08:27 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=eyuVGpUd;
       dkim=neutral (no key) header.i=@suse.de header.b=o5XtHXri;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7713E22AF0;
	Tue, 13 Dec 2022 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670958507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFf1zIDHqWBtG1h4KlzJnhLXK9qn8VZ2/j7hbKgy7gA=;
	b=eyuVGpUdhoqw7FADDNl1XKi3OiKwDlskm605GheQ7BLTbgfJCS/hnzC+p3aYC/jD3wf3Ct
	v9uMdhUiuJjtQUCV012pmLqqNIo3tH/1nj8iy/r8j3r05dBR5obVLxgjie5LAkhSPJYYaa
	DIGNWLk5m+CtCx/rWC+2JaeaW3e4vzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670958507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFf1zIDHqWBtG1h4KlzJnhLXK9qn8VZ2/j7hbKgy7gA=;
	b=o5XtHXrilmOp3gJ7BmKGA+zC6VWl6C9R0WPYf8p+GcA85Ar1Znd+nSVX5XQZ7yMX3Riyus
	VDx5Mpg7kKXgcuDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A703F138F9;
	Tue, 13 Dec 2022 19:08:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WE4RG6jNmGOcBwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 2/6] target/arm: Fix checkpatch space errors in helper.c
Date: Tue, 13 Dec 2022 16:05:33 -0300
Message-Id: <20221213190537.511-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /DwwJOJ3icnk

Fix the following:

ERROR: spaces required around that '|' (ctx:VxV)
ERROR: space required before the open parenthesis '('
ERROR: spaces required around that '+' (ctx:VxB)
ERROR: space prohibited between function name and open parenthesis '('

(the last two still have some occurrences in macros which I left
behind because it might impact readability)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 77da24b0e8..b240dcf12f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -205,7 +205,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     uint32_t regidx = (uintptr_t)key;
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
         /* The value array need not be initialized at this point */
         cpu->cpreg_array_len++;
@@ -219,7 +219,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
 
     ri = g_hash_table_lookup(cpu->cp_regs, key);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
     }
 }
@@ -2325,11 +2325,11 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDRRO_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 3, .crn = 13, .crm = 0,
-      .access = PL0_R|PL1_W,
+      .access = PL0_R | PL1_W,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidrro_el[0]),
       .resetvalue = 0},
     { .name = "TPIDRURO", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 3,
-      .access = PL0_R|PL1_W,
+      .access = PL0_R | PL1_W,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidruro_s),
                              offsetoflow32(CPUARMState, cp15.tpidruro_ns) },
       .resetfn = arm_cp_reset_ignore },
@@ -4074,17 +4074,17 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
       .resetvalue = 0 },
     /* The cache ops themselves: these all NOP for QEMU */
     { .name = "IICR", .cp = 15, .crm = 5, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "IDCR", .cp = 15, .crm = 6, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "CDCR", .cp = 15, .crm = 12, .opc1 = 0,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "PIR", .cp = 15, .crm = 12, .opc1 = 1,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "PDR", .cp = 15, .crm = 12, .opc1 = 2,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "CIDCR", .cp = 15, .crm = 14, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
@@ -8351,7 +8351,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo cbar = {
                 .name = "CBAR",
                 .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
-                .access = PL1_R|PL3_W, .resetvalue = cpu->reset_cbar,
+                .access = PL1_R | PL3_W, .resetvalue = cpu->reset_cbar,
                 .fieldoffset = offsetof(CPUARMState,
                                         cp15.c15_config_base_address)
             };
@@ -9318,11 +9318,11 @@ static void switch_mode(CPUARMState *env, int mode)
         return;
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
+        memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
     } else if (mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
+        memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
     }
 
     i = bank_number(old_mode);
@@ -10826,7 +10826,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if (sum >= 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SARITH8(a, b, n, op) do { \
     int32_t sum; \
@@ -10834,7 +10834,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if (sum >= 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 
 #define ADD16(a, b, n) SARITH16(a, b, n, +)
@@ -10853,7 +10853,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 1) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define ADD8(a, b, n) do { \
     uint32_t sum; \
@@ -10861,7 +10861,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 1) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define SUB16(a, b, n) do { \
     uint32_t sum; \
@@ -10869,7 +10869,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SUB8(a, b, n) do { \
     uint32_t sum; \
@@ -10877,7 +10877,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define PFX u
 #define ARITH_GE
-- 
2.35.3
