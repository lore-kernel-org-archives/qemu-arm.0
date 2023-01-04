Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305850ejb;
        Wed, 4 Jan 2023 14:01:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXve3E5Cfhd0fttWPD0qhddb8GFNiKEEjAdvmQs61vl46d3LvdNn1iJMk5dtM865Uh7zzkL5
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id m34-20020a05600c3b2200b003c6e63e814bmr34483596wms.2.1672869689793;
        Wed, 04 Jan 2023 14:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869689; cv=none;
        d=google.com; s=arc-20160816;
        b=JrWL1sv0wSqUnZW7MjWW1JN8VGv2l64PBF5l0/GLuG7l0G1JPretIcZxvctEZnFSGP
         YPDHAsRJuSxhtEBzKrSzAb3ZiXHRCr7uh/pja2tIbCcFqmWUpj9+G50aSupzwFFlW0JZ
         v0gDCrcmlVe8MHIxA9b1nSp/XlFY1EZHVVeWj+Ui8MJ0onwm4fB7g2eNVcNhpF4aPcX9
         4qDbjQ5ggCssJ9gQNLWUQ378XfqhZ8TvuGo0EMU1R+yNEAu/i0VSzfVeRghL1kELt3kY
         EHKoiIS0IIlVUd+kYGzQ8f+gYD353DRsMk3TrpFrSzNfc5sag8YmvNR3HJVLN5FJlODq
         AHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=297UEoXDqboo8qnXlTVYpI2mxQXRWY++S049ODT7DIg=;
        b=dpOmNm3MLg1lLqveFd222ijxVYP/C583CZLtx0P26yp8+ps9AltnwZgKyLsTQZ8jXX
         3aYzfjTrAKiiLwzsWKa44gIP1Xq1vbdcj1bSdYQ4p5oZ6y7XxyHfqks2GwHNnCFFsrCL
         AxscIdt4mZq+18j74tWxsYeKxmlXt7EzkEXg5l8lN1IkaM69EJ8Uv3T34+bb+Ycm1Hob
         7Z4X7jDF3u8cZ15iRfOofCOL4EStXrlQlaA68B5UF6vWVxR3F7ZzfUBHfpDhszBXE/K2
         csNai7eYRvwAj2FXgIVUeINjYgGPksqFxJQ9wbQ6K/+iZ7Yh9+4XGuIDNaS3LxAXOtLB
         dY6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fihpOWCG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=i5numLnv;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id y13-20020a05600015cd00b002421affd20dsi28948370wry.910.2023.01.04.14.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fihpOWCG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=i5numLnv;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66C0C4D800;
	Wed,  4 Jan 2023 22:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=297UEoXDqboo8qnXlTVYpI2mxQXRWY++S049ODT7DIg=;
	b=fihpOWCGNZb/hydPc01qXVV+Morh/rvuPTrY/cjcYNCtTh5xI9rLHtLcq9iRlmwgc+uYcj
	bA8FfqZi92ADAQfiTAAzLH02yIBWLb6TBIS+kDZ+ILQUhyN27KajMS5Yv0TNv3/DhSL1Dz
	eD9VdEUYi67WDvdwGNqdgZALtteHR/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=297UEoXDqboo8qnXlTVYpI2mxQXRWY++S049ODT7DIg=;
	b=i5numLnvwiV2WpOkXdGBhAvw0vV7uVHGJyo5IF62yFYLCfR/0EYePWpEvZ75JNEPkb6N4I
	UCKkC7HVAJ+uVUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB32A1342C;
	Wed,  4 Jan 2023 22:01:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kNtoHDb3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:26 +0000
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
Subject: [RFC PATCH 15/27] target/arm: move helpers to tcg/
Date: Wed,  4 Jan 2023 18:58:23 -0300
Message-Id: <20230104215835.24692-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jOQnaPEhYR3R

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Included {sme,mve}_helper.c and left a couple of files behind that
still have non-tcg code to be removed from them:

helper.c (and op_helper.h as a dep)
vfp_helper.c

Originally from:
https://lore.kernel.org/r/20210416162824.25131-3-cfontana@suse.de
[RFC v14 02/80] target/arm: move helpers to tcg/
---
 target/arm/meson.build               | 16 ++--------------
 target/arm/tcg-stubs.c               | 27 +++++++++++++++++++++++++++
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
 18 files changed, 43 insertions(+), 14 deletions(-)
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
index b2904b676b..0a9fd09b3d 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,17 +1,8 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
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
@@ -22,11 +13,6 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: fil
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
@@ -43,6 +29,8 @@ subdir('hvf')
 
 if 'CONFIG_TCG' in config_all
    subdir('tcg')
+else
+    arm_ss.add(files('tcg-stubs.c'))
 endif
 
 target_arch += {'arm': arm_ss}
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
new file mode 100644
index 0000000000..a28960d88a
--- /dev/null
+++ b/target/arm/tcg-stubs.c
@@ -0,0 +1,27 @@
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
+
+void arm_reset_sve_state(CPUARMState *env)
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
