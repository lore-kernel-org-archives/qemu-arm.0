Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305395ejb;
        Wed, 4 Jan 2023 14:00:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvQ1OULoCxDjhAmrcewuBrGVlNvS8qils3DDo4AwhReWTY/+7gzusHTOHxBT/yZwsaPaTb
X-Received: by 2002:a5d:4601:0:b0:242:63a3:2f20 with SMTP id t1-20020a5d4601000000b0024263a32f20mr38835407wrq.11.1672869651637;
        Wed, 04 Jan 2023 14:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869651; cv=none;
        d=google.com; s=arc-20160816;
        b=JVOrk1NEX8ysO4PvLT2WoKBrW8foJPFLsXexLCxU1/KabYhO8X5Cj2xET5efQJPxcf
         CBvkVAjH4jRG7dLy1zjf+TgBEtKLWNmfTgrNn2e5yI4tqD8stIArAdZYkUiQY4ftll5s
         el+6/WkcfolyoypjM4s/fBLrpZjkYhKcC28CeNBoIXTjdo0tF4UyDJzTOnbiePWF2KsW
         tNBjYtcnFX6iaFYXOcrTHNQnu8giJssA/hc1UDuXJNuCUqCodYb7y1M3cvVOsAQhJ9Qy
         6/HfvigW4e2FTu5xYCTOj+o0gy+gEm0pM5PzRCXUURunLHOVkDAT7/+T7v5ny8xEtWt/
         HClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=CaguIzdmOv8g/9+LmJhW8PFOJmmxe+L0J3jYpCEO7AU=;
        b=t4NLCmt7lnyh6UZSuRsC43rQ4WOdLtNzuxAHjDEa1BM4AWy0VLardXoJIaeAvcnTla
         +nuF5cTs3Cb5DhfVhVJUgexc1FJzwVeJgaRf2fsnUDOMYN0juPXjlROW/uxUAhUXKMPd
         nSBctwNKFxrJO4vGxYSi6cuqqtwL9pDCXBRBeJYdsA5OC4jgHXZuSxcmTVJONP+f8WAF
         8l2ZzWy6pEaXyL2OSBOlGiWjsYZ5gyJ/I2v3RuOgytq755C+wo0l3xrqblQVjFL4X8wh
         N4TSxLpRdKPiHWSuddI/4J9kOHTwuTNCajhl2pHrYwC9nnxvzBqPjRXv4OCUpv3VQIPu
         FJgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=gUu6yauX;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id v11-20020a5d610b000000b0024246991110si19898939wrt.442.2023.01.04.14.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:00:51 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=gUu6yauX;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4386240308;
	Wed,  4 Jan 2023 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaguIzdmOv8g/9+LmJhW8PFOJmmxe+L0J3jYpCEO7AU=;
	b=gUu6yauX5v9xdNLRmhrThPJIe0RW3y5AdzHWohSDuHbRsFopgw0d5cQFuJOIJVRoMoPEPK
	2eq1XI+HePV+xWfngy4lFt4CGVx2KoReo+67lJipLxjahzN5seYMiX7n18191NIz2nFuk8
	txejlZ5Vi5pTJBSg67o8zVzJKJTO+cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaguIzdmOv8g/9+LmJhW8PFOJmmxe+L0J3jYpCEO7AU=;
	b=6D+AicIqpQUqsP9qnJ/9NOdolGmudlgZ8JOIQTJgt4kIMRH+lWLk3cBDoTc1YTZY/AzVPO
	5Z5sgh6cqaueB+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57B3D1342C;
	Wed,  4 Jan 2023 22:00:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mH0tCBD3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:48 +0000
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
Subject: [RFC PATCH 03/27] target/arm: Fix checkpatch brace errors in helper.c
Date: Wed,  4 Jan 2023 18:58:11 -0300
Message-Id: <20230104215835.24692-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u5xy1wJJ9/V+

Fix this:
ERROR: braces {} are necessary for all arms of this statement

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 67 ++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18e4680912..ed3da5ada3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9147,10 +9147,12 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
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
@@ -9355,8 +9357,9 @@ static void switch_mode(CPUARMState *env, int mode)
     int i;
 
     old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode)
+    if (mode == old_mode) {
         return;
+    }
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
         memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
@@ -9962,10 +9965,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
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
@@ -10756,10 +10760,11 @@ static inline uint16_t add16_sat(uint16_t a, uint16_t b)
 
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
@@ -10771,10 +10776,11 @@ static inline uint8_t add8_sat(uint8_t a, uint8_t b)
 
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
@@ -10786,10 +10792,11 @@ static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
 
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
@@ -10801,10 +10808,11 @@ static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
 
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
@@ -10822,34 +10830,38 @@ static inline uint16_t add16_usat(uint16_t a, uint16_t b)
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
@@ -10953,10 +10965,11 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 
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
@@ -10976,14 +10989,18 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
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
