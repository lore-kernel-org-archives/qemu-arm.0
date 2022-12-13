Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4493637ejb;
        Tue, 13 Dec 2022 11:08:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EKTRFZUPte1dSHIo89n+8n/LPqYUIwKCKgFwLXLobArzS3bD9eywgXBcdE55R/+dB9mCU
X-Received: by 2002:a05:600c:19ce:b0:3d0:75ee:3571 with SMTP id u14-20020a05600c19ce00b003d075ee3571mr17179125wmq.20.1670958511094;
        Tue, 13 Dec 2022 11:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670958511; cv=none;
        d=google.com; s=arc-20160816;
        b=X/EONyPP0zQVhTY3hyFMaeKl6XWN7BOnSKpD5O9tLznkdEkC4hzvjTOMKEEYsQqb/D
         jo5/0TNczgxL/a0JgGYzgZN0ay/OEDeCDMr/MgddqrATXYurVzUydpq4W34GuvcO+58L
         PSG3dp5lw5NcfQAEvIZDS+I6KFwZONlryAFKYIJzNgu2hGbT57xtB1UAoRl+DN4WtXqa
         CvywdoeFUm5j4MJvJJUsOcMG0+WBvj6+ACRqxqmBUa3ZQ/3zscJfSLGA7TKOisYZ6nDN
         3JfJ/tg3O4zBsVxADkFfHAlcyBsuLjqsCBXcacO7cSZxAAcuLzWrDD819fUqdk/iH+Ca
         iD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QSpPtc/c7Vsy4IWrj+qQkkzdykLwLGhQBK/wGs1h5Wk=;
        b=eFl9xcPeVTe6qwevyiFz+4Wjbmlf+kZESZyyZo7JWEFH8GGrRlEHYfBaa1Fo9dWmxe
         gD434yMPeTMSxLU9//KTDrw8NMM1VkSsGou1DxCZhXQwYK+pcLmDdS2zTrGPGZ+497NK
         uuAz9HRkFLlC3veRDsI/J1gCclwnlskutF5Fj13PJBx3yFQcTzQoMH5Sf1dbJxNpMm8/
         Z+eZmw7l4wNzJ+TXsA+QkQY+mB0kgWYHkhKKPTnx1l0EeVh+feHSY28J8IqLGB7YI18W
         e8oI7+EHPnaoZKWCUk+GlUcviodl3A/5rKntP48l+uCYAKmPLeBJ9bKl2Ojx7YbB6jhR
         bs+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LeWLNVhu;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=RWlOW335;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id bu1-20020a056000078100b002427ac026b9si302397wrb.1012.2022.12.13.11.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:08:31 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LeWLNVhu;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=RWlOW335;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B428F1FDB4;
	Tue, 13 Dec 2022 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670958510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSpPtc/c7Vsy4IWrj+qQkkzdykLwLGhQBK/wGs1h5Wk=;
	b=LeWLNVhuhmcQTmzQSYl9LCZZ6OWfD4JfdxNXnf/TJmJxV5puWzgMTfYdOmOJ19HccqnYDn
	6djXH71t/5wn0NuSVjOXQN52GHHFnBLZgT6wxJbcUdcJsgNUHn0X4HAbY6A8ipKYpvztVE
	TWDR2Rr2yS5+5UnwVAQtc4Hpr6JRbWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670958510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSpPtc/c7Vsy4IWrj+qQkkzdykLwLGhQBK/wGs1h5Wk=;
	b=RWlOW3351rZ7HkQEbeXKCp8FClm3nTxvpSIbAOzlKnQQcBD5rHe4trWLum6ULmqbXBPBSW
	GEuRDBrASdVHJxDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3B3F138F9;
	Tue, 13 Dec 2022 19:08:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YCO3KavNmGOcBwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:27 +0000
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
Subject: [PATCH 3/6] target/arm: Fix checkpatch brace errors in helper.c
Date: Tue, 13 Dec 2022 16:05:34 -0300
Message-Id: <20221213190537.511-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IgkrK5/YrYMz

Fix this:
ERROR: braces {} are necessary for all arms of this statement

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 67 ++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b240dcf12f..3cf978bb93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9106,10 +9106,12 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         env->CF = (val >> 29) & 1;
         env->VF = (val << 3) & 0x80000000;
     }
-    if (mask & CPSR_Q)
+    if (mask & CPSR_Q) {
         env->QF = ((val & CPSR_Q) != 0);
-    if (mask & CPSR_T)
+    }
+    if (mask & CPSR_T) {
         env->thumb = ((val & CPSR_T) != 0);
+    }
     if (mask & CPSR_IT_0_1) {
         env->condexec_bits &= ~3;
         env->condexec_bits |= (val >> 25) & 3;
@@ -9314,8 +9316,9 @@ static void switch_mode(CPUARMState *env, int mode)
     int i;
 
     old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode)
+    if (mode == old_mode) {
         return;
+    }
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
         memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
@@ -9921,10 +9924,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -10715,10 +10719,11 @@ static inline uint16_t add16_sat(uint16_t a, uint16_t b)
 
     res = a + b;
     if (((res ^ a) & 0x8000) && !((a ^ b) & 0x8000)) {
-        if (a & 0x8000)
+        if (a & 0x8000) {
             res = 0x8000;
-        else
+        } else {
             res = 0x7fff;
+        }
     }
     return res;
 }
@@ -10730,10 +10735,11 @@ static inline uint8_t add8_sat(uint8_t a, uint8_t b)
 
     res = a + b;
     if (((res ^ a) & 0x80) && !((a ^ b) & 0x80)) {
-        if (a & 0x80)
+        if (a & 0x80) {
             res = 0x80;
-        else
+        } else {
             res = 0x7f;
+        }
     }
     return res;
 }
@@ -10745,10 +10751,11 @@ static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
 
     res = a - b;
     if (((res ^ a) & 0x8000) && ((a ^ b) & 0x8000)) {
-        if (a & 0x8000)
+        if (a & 0x8000) {
             res = 0x8000;
-        else
+        } else {
             res = 0x7fff;
+        }
     }
     return res;
 }
@@ -10760,10 +10767,11 @@ static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
 
     res = a - b;
     if (((res ^ a) & 0x80) && ((a ^ b) & 0x80)) {
-        if (a & 0x80)
+        if (a & 0x80) {
             res = 0x80;
-        else
+        } else {
             res = 0x7f;
+        }
     }
     return res;
 }
@@ -10781,34 +10789,38 @@ static inline uint16_t add16_usat(uint16_t a, uint16_t b)
 {
     uint16_t res;
     res = a + b;
-    if (res < a)
+    if (res < a) {
         res = 0xffff;
+    }
     return res;
 }
 
 static inline uint16_t sub16_usat(uint16_t a, uint16_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return 0;
+    }
 }
 
 static inline uint8_t add8_usat(uint8_t a, uint8_t b)
 {
     uint8_t res;
     res = a + b;
-    if (res < a)
+    if (res < a) {
         res = 0xff;
+    }
     return res;
 }
 
 static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return 0;
+    }
 }
 
 #define ADD16(a, b, n) RESULT(add16_usat(a, b), n, 16);
@@ -10912,10 +10924,11 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 
 static inline uint8_t do_usad(uint8_t a, uint8_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return b - a;
+    }
 }
 
 /* Unsigned sum of absolute byte differences.  */
@@ -10935,14 +10948,18 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
     uint32_t mask;
 
     mask = 0;
-    if (flags & 1)
+    if (flags & 1) {
         mask |= 0xff;
-    if (flags & 2)
+    }
+    if (flags & 2) {
         mask |= 0xff00;
-    if (flags & 4)
+    }
+    if (flags & 4) {
         mask |= 0xff0000;
-    if (flags & 8)
+    }
+    if (flags & 8) {
         mask |= 0xff000000;
+    }
     return (a & mask) | (b & ~mask);
 }
 
-- 
2.35.3
