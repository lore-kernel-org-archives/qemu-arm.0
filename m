Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305366ejb;
        Wed, 4 Jan 2023 14:00:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvR0UacJkXxBVbQ/PT6bGITgSMeGc9eqB8NbJZzf32K5OBdEfZQw4e2VXLH6NYijdo0semq
X-Received: by 2002:a5d:5a18:0:b0:297:9256:c2ac with SMTP id bq24-20020a5d5a18000000b002979256c2acmr8329387wrb.8.1672869648294;
        Wed, 04 Jan 2023 14:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869648; cv=none;
        d=google.com; s=arc-20160816;
        b=B9xZRwrAliCWFaCybIWxw/bt7uobmh6vq0iDj1QIbflIsotZK7EQN6FEBuEE0wL8vI
         9u9xM28PcMU4Ym7G0Lf+Etw4oMsHKT6i9mUzbF6wMfj223jijVlGDIdaQpp0jNgIu0lB
         sveFUqth5VgyenpMiY0geEq6cX9U6moBtwPne7uOwH+DfWYfTaS0lIivpP9DrsFTRYKk
         8FfJdWbiN8Wtq+yPu2YTFSc8csUfvrcmDBn310mak7fJwfh5EbMQrdl7kw8dSwnQ7Swd
         a8xHp+0tGdLGpMotgn2y9N8jmQVpIrOx2euua/0WUHOXDOLrJONgMyhGBtRcseEuSkWD
         +e3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=vTpssxDOxW5K8r0mIqNGjY0Vwm9oB8W5sgiY+HSmlSk=;
        b=cIJzV//24WhKk/bYwBC+t52lv3+/9mNY0KerzHTv46vKyEK3DzLssZ/LfdQppNlTzr
         7dv1fhAuvo76gn5fpwXzzi2PI2NJTT0+jLz8qjq/iTv5GE9COk9KLuI/8duCLnWQs1kW
         QVKatcWtV9Q0jVsGuAWiUTGoimyK3NVoBatxnIK76SrRSCR9DglxiQml8v8biMw+N/Rx
         sp7zp8dwm6kJwUxxhvPYkDtihmx2YVDA3i4qJK/XMQWrFl66hMenPcV2RXrJ+zmazYIu
         xwjEKEaKh0RP5Dj5pexLAr0hxUEHVC2MoV6/6mwlIvjPfGn53zezU9sXHw1MTE0oACDv
         ynBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=o8zw3XB7;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=9YCH57Yx;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id 6-20020a056000154600b0022e363b16dasi25960337wry.1026.2023.01.04.14.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=o8zw3XB7;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=9YCH57Yx;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3FB8402D8;
	Wed,  4 Jan 2023 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTpssxDOxW5K8r0mIqNGjY0Vwm9oB8W5sgiY+HSmlSk=;
	b=o8zw3XB7Ufae+qQqimWdT0CjDCoRRb6J5clzFPtfZPjf+yGEJrHilN+tWVl3xzSSnJW9Yp
	rEP6bXMHMV51c3DQL5JG1+QTKB835GrweqQqiYcEMDfssvw7j0Y6DFINuAJ1pFtYpeFL0N
	bQoWXqHsMLH0pqKtyB2FfrwspUr99+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTpssxDOxW5K8r0mIqNGjY0Vwm9oB8W5sgiY+HSmlSk=;
	b=9YCH57Yxz20q/DxC/LonMcajCD7d5MaxOxqCDKT/CrCiFI+igBCb8ukp77OAsvMKV0DJVe
	+mp7qiKHVLZuinAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01D061342C;
	Wed,  4 Jan 2023 22:00:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0N7RLgz3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH 02/27] target/arm: Fix checkpatch space errors in helper.c
Date: Wed,  4 Jan 2023 18:58:10 -0300
Message-Id: <20230104215835.24692-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: flVsp2eWbGSK

Fix the following:

ERROR: spaces required around that '|' (ctx:VxV)
ERROR: space required before the open parenthesis '('
ERROR: spaces required around that '+' (ctx:VxB)
ERROR: space prohibited between function name and open parenthesis '('

(the last two still have some occurrences in macros which I left
behind because it might impact readability)

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6703936a28..18e4680912 100644
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
@@ -2350,11 +2350,11 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
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
@@ -4099,17 +4099,17 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
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
@@ -8392,7 +8392,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo cbar = {
                 .name = "CBAR",
                 .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
-                .access = PL1_R|PL3_W, .resetvalue = cpu->reset_cbar,
+                .access = PL1_R | PL3_W, .resetvalue = cpu->reset_cbar,
                 .fieldoffset = offsetof(CPUARMState,
                                         cp15.c15_config_base_address)
             };
@@ -9359,11 +9359,11 @@ static void switch_mode(CPUARMState *env, int mode)
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
@@ -10867,7 +10867,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if (sum >= 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SARITH8(a, b, n, op) do { \
     int32_t sum; \
@@ -10875,7 +10875,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if (sum >= 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 
 #define ADD16(a, b, n) SARITH16(a, b, n, +)
@@ -10894,7 +10894,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 1) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define ADD8(a, b, n) do { \
     uint32_t sum; \
@@ -10902,7 +10902,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 1) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define SUB16(a, b, n) do { \
     uint32_t sum; \
@@ -10910,7 +10910,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SUB8(a, b, n) do { \
     uint32_t sum; \
@@ -10918,7 +10918,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define PFX u
 #define ARITH_GE
-- 
2.35.3
