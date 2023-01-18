Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787539ejc;
        Wed, 18 Jan 2023 11:37:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtxpNIy2zD34DLbrb0cbnA0VCo1R73IL92Jk10tlE8ZeM69YZfsX+yCnpWFCiw1k3o3/VGv
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id n20-20020adfc614000000b00248ab8a5144mr2717765wrg.63.1674070676320;
        Wed, 18 Jan 2023 11:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070676; cv=none;
        d=google.com; s=arc-20160816;
        b=KrwFudB/7/pzNjFsg3GGXdRfs570nm4lyeweSfmoHz471QZrJncnYkT59tseybmupN
         uCrdT3SrSDPOC+dh0804IiEKbVofFu0sM36W2NtkERBsxbHLhukuB10uKcPouXb0Drxw
         yS68dtEH5G6HYEApVxyKvkoeKMKmW5o2RHnePc/i7ffrzwsQBQW2uaoNuaDVaq/tmD6Q
         QEWombaoEL0vm4PjIQ7nbx7z0Lf4RQo+o7mEHfMDvW3tDL6MR6mUUnimvib19h7ZK1n6
         hBAMIUc3dZ8+cYr7XOActjJWc23jRQJZrkEKsJVFtnlsueFqYda3Kex9vCL5537X0+YI
         bAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=K/jBmUabTVczY6Hp9pBSh2z/Gnh7KU2c98MhZsGyMOY=;
        b=nzNnbN5jElSKj0ZfA62sXg3yVOo+sgb3UhwzTNvQpnhIRIol9B77dkxL4lbJcm+1jy
         KHR1WakvS7fgyolQtMHTRdwQP5uK/U5gEcZieFkosR4U4EbLwJXxseCO/0mYDyCMdibU
         V1SkGi+vb1h514Yf1oOqQUXU/yofQ4PUyJwaXay1pCuLm0AdUnwLiRP8EWZQi1VscI0w
         3n8yoNKoz5WGFfQcAQLExlNNkCO43Gt8tYjsvOVkiVuAlsOYtXW/iFnMHWtO4VrLHOLr
         iygH7bahsyeA5HAcrRekWR/69PAjVnYGgs/Xvgz9isYeq99VDh1++UGpNMuNX5lHFbW1
         l4TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XYSgyVyx;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="z9+HvE/1";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id w8-20020a5d5448000000b002bbeacc7a31si24304180wrv.945.2023.01.18.11.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XYSgyVyx;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="z9+HvE/1";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB3233F65B;
	Wed, 18 Jan 2023 19:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/jBmUabTVczY6Hp9pBSh2z/Gnh7KU2c98MhZsGyMOY=;
	b=XYSgyVyxb7p0etxZcv6fPSfjgQuTml4orTf2LyX6KFjcAswdSiaVcMQvYTvgtL6kZPy+LY
	UDTF1eZNNVeHbheBvLSdKuqUxdd5mZQsiMC/VQJlwcQSL0kHiKD4gJoSJTGbcqv+BVwE0F
	3SicbkuJuOEJRgCQ39fIwmkKH9ywU0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/jBmUabTVczY6Hp9pBSh2z/Gnh7KU2c98MhZsGyMOY=;
	b=z9+HvE/1ImqrSWD+WVbfQr3jSbf9M5zagKAWmQFf4raY3lfTRFm1EW7kiDzzCCrp7c0xAn
	EdlLeT7Wun+FjdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57443139D2;
	Wed, 18 Jan 2023 19:37:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aJ6RCJFKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:53 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 10/20] target/arm: move helpers to tcg/
Date: Wed, 18 Jan 2023 16:35:08 -0300
Message-Id: <20230118193518.26433-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Eb97tFUxe55i

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build               | 16 ++--------------
 target/arm/tcg-stubs.c               | 23 +++++++++++++++++++++++
 target/arm/{ => tcg}/crypto_helper.c |  0
 target/arm/{ => tcg}/debug_helper.c  |  0
 target/arm/{ => tcg}/helper-a64.c    |  0
 target/arm/{ => tcg}/iwmmxt_helper.c |  0
 target/arm/{ => tcg}/m_helper.c      |  0
 target/arm/tcg/meson.build           | 14 ++++++++++++++
 target/arm/{ => tcg}/mte_helper.c    |  0
 target/arm/{ => tcg}/mve_helper.c    |  0
 target/arm/{ => tcg}/neon_helper.c   |  0
 target/arm/{ => tcg}/op_helper.c     |  0
 target/arm/{ => tcg}/pauth_helper.c  |  0
 target/arm/{ => tcg}/sme_helper.c    |  0
 target/arm/{ => tcg}/sve_helper.c    |  0
 target/arm/{ => tcg}/tlb_helper.c    |  0
 target/arm/{ => tcg}/vec_helper.c    |  0
 target/arm/{ => tcg}/vec_internal.h  |  0
 18 files changed, 39 insertions(+), 14 deletions(-)
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/mve_helper.c (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/sme_helper.c (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6dc7b800e6..01143a805c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,17 +2,8 @@ arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpregs.c',
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
-  'iwmmxt_helper.c',
-  'm_helper.c',
-  'mve_helper.c',
-  'neon_helper.c',
-  'op_helper.c',
-  'tlb_helper.c',
-  'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
 ))
@@ -23,11 +14,6 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: fil
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
-  'helper-a64.c',
-  'mte_helper.c',
-  'pauth_helper.c',
-  'sve_helper.c',
-  'sme_helper.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
@@ -44,6 +30,8 @@ subdir('hvf')
 
 if 'CONFIG_TCG' in config_all
    subdir('tcg')
+else
+    arm_ss.add(files('tcg-stubs.c'))
 endif
 
 target_arch += {'arm': arm_ss}
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
new file mode 100644
index 0000000000..1a7ddb3664
--- /dev/null
+++ b/target/arm/tcg-stubs.c
@@ -0,0 +1,23 @@
+/*
+ * QEMU ARM stubs for some TCG helper functions
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
+
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+                        uint32_t target_el, uintptr_t ra)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/crypto_helper.c b/target/arm/tcg/crypto_helper.c
similarity index 100%
rename from target/arm/crypto_helper.c
rename to target/arm/tcg/crypto_helper.c
diff --git a/target/arm/debug_helper.c b/target/arm/tcg/debug_helper.c
similarity index 100%
rename from target/arm/debug_helper.c
rename to target/arm/tcg/debug_helper.c
diff --git a/target/arm/helper-a64.c b/target/arm/tcg/helper-a64.c
similarity index 100%
rename from target/arm/helper-a64.c
rename to target/arm/tcg/helper-a64.c
diff --git a/target/arm/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
similarity index 100%
rename from target/arm/iwmmxt_helper.c
rename to target/arm/tcg/iwmmxt_helper.c
diff --git a/target/arm/m_helper.c b/target/arm/tcg/m_helper.c
similarity index 100%
rename from target/arm/m_helper.c
rename to target/arm/tcg/m_helper.c
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 044561bd4d..c27ac2939c 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -23,10 +23,24 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
+  'crypto_helper.c',
+  'debug_helper.c',
+  'iwmmxt_helper.c',
+  'm_helper.c',
+  'mve_helper.c',
+  'neon_helper.c',
+  'op_helper.c',
+  'tlb_helper.c',
+  'vec_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'translate-a64.c',
   'translate-sve.c',
   'translate-sme.c',
+  'helper-a64.c',
+  'mte_helper.c',
+  'pauth_helper.c',
+  'sme_helper.c',
+  'sve_helper.c',
 ))
diff --git a/target/arm/mte_helper.c b/target/arm/tcg/mte_helper.c
similarity index 100%
rename from target/arm/mte_helper.c
rename to target/arm/tcg/mte_helper.c
diff --git a/target/arm/mve_helper.c b/target/arm/tcg/mve_helper.c
similarity index 100%
rename from target/arm/mve_helper.c
rename to target/arm/tcg/mve_helper.c
diff --git a/target/arm/neon_helper.c b/target/arm/tcg/neon_helper.c
similarity index 100%
rename from target/arm/neon_helper.c
rename to target/arm/tcg/neon_helper.c
diff --git a/target/arm/op_helper.c b/target/arm/tcg/op_helper.c
similarity index 100%
rename from target/arm/op_helper.c
rename to target/arm/tcg/op_helper.c
diff --git a/target/arm/pauth_helper.c b/target/arm/tcg/pauth_helper.c
similarity index 100%
rename from target/arm/pauth_helper.c
rename to target/arm/tcg/pauth_helper.c
diff --git a/target/arm/sme_helper.c b/target/arm/tcg/sme_helper.c
similarity index 100%
rename from target/arm/sme_helper.c
rename to target/arm/tcg/sme_helper.c
diff --git a/target/arm/sve_helper.c b/target/arm/tcg/sve_helper.c
similarity index 100%
rename from target/arm/sve_helper.c
rename to target/arm/tcg/sve_helper.c
diff --git a/target/arm/tlb_helper.c b/target/arm/tcg/tlb_helper.c
similarity index 100%
rename from target/arm/tlb_helper.c
rename to target/arm/tcg/tlb_helper.c
diff --git a/target/arm/vec_helper.c b/target/arm/tcg/vec_helper.c
similarity index 100%
rename from target/arm/vec_helper.c
rename to target/arm/tcg/vec_helper.c
diff --git a/target/arm/vec_internal.h b/target/arm/tcg/vec_internal.h
similarity index 100%
rename from target/arm/vec_internal.h
rename to target/arm/tcg/vec_internal.h
-- 
2.35.3
