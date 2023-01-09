Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663627ejc;
        Mon, 9 Jan 2023 14:43:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs+BTTFN/SbhVDpbWG7ITdP8SzI1VI2RFd54cexppcicC1YoZD2StuaZUlWXzkAjQuGQ+VZ
X-Received: by 2002:a5d:5d11:0:b0:26c:aa9d:93f1 with SMTP id ch17-20020a5d5d11000000b0026caa9d93f1mr55388326wrb.25.1673304186469;
        Mon, 09 Jan 2023 14:43:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304186; cv=none;
        d=google.com; s=arc-20160816;
        b=tcYdn8o3KkjfsuJi5mxbefydeFcyPoYS4HUOWkK+RQ6MbhPAJipBjwSYR3it4o8mPz
         hI88OCNg5t30q1pyuYZ9Zr9vAXCQvz6La0YKDjZMtBn9Pt2dgLtRflhyxuma1iEZN5we
         WrEeZ16Ym0CQqtmCf0+Y1eRApTq0uxvilvVDXxGMpMsdDSjIJACSUTQa+Xa8VI95/AfH
         U6kvh5jDld9wrXLEmHBYRb+cdeYDOVKPLTOcnbnNPi4iNn+adbn1LD6u6DZZQsOQgM5/
         7KU76jl0d1ovZEF0Rv5gj9nLMJaQEDBkq4zU4R89JWdUsrMLLy2TtY4UQYJoit9Nxk4L
         suLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=pKLwvhRPuXtRlcYY51nLSTjafk4HZRRTFDg9CQyhWCo=;
        b=u5J9r+YRNNolwe/gL/MfTfnNp1qOQyMjgUzIOYzmMXKnaLDy5JJMmBiSLoObmzwW7q
         41//LSvlauA0DqvQwwYXRb1SzNmO+YhtJwqBc36Wi6q39SL3k6LnQJWc/r7M6AQRawXe
         qdiocTl0Wd/J95VNTbaW5ucWpJVKJrBJIT9ioUMte0f+Hr/YHun+MPNrE+P/cAV6Ltlh
         gSZ3KOVtAxxwiAYac0ZsMGcT8exlNUP/qWwFubjimyqp7Z/U67URBpkV3Gi0g/lKfE2b
         EXARiZHl4krutNfygDcXMMepx23EfNASX9nO5QIT++zo0AZSBaEfIVMraaEIKR7dItpF
         JZAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=yCqqrgUV;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id bp13-20020a5d5a8d000000b002bbec163edesi3509298wrb.297.2023.01.09.14.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=yCqqrgUV;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 96ECF3F8AB;
	Mon,  9 Jan 2023 22:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKLwvhRPuXtRlcYY51nLSTjafk4HZRRTFDg9CQyhWCo=;
	b=yCqqrgUVS5fQkv4+fNWnyo9bd6AlfusXPXtYvl5TC1784PgGoVmfSgFIUgAKy8ZaIF5rb6
	0CJ1L838/a61AXmtI01LJ7PjtUVeXbIXU+EABLR7nAXUejFoCIYaL1xzCFvxYAzUU+bQLm
	/QY1usNrX0yEsi1YxzOFGwRayo06RNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKLwvhRPuXtRlcYY51nLSTjafk4HZRRTFDg9CQyhWCo=;
	b=9/psVeLXlOwZq3WD7gjlCikITPpYtN6SuBzh9ZeRNvbt7gRc9mQWR+Rc2uQuIdRnPLfydI
	Sd6crDUiSzsS+TCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0243413583;
	Mon,  9 Jan 2023 22:43:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wMQ3L3aYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:02 +0000
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
Subject: [RFC PATCH v2 09/19] target/arm: move helpers to tcg/
Date: Mon,  9 Jan 2023 19:42:22 -0300
Message-Id: <20230109224232.11661-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UO9LTD71ukgJ

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
 target/arm/tcg-stubs.c               | 28 ++++++++++++++++++++++++++++
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
 18 files changed, 44 insertions(+), 14 deletions(-)
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
index 0000000000..021489cf38
--- /dev/null
+++ b/target/arm/tcg-stubs.c
@@ -0,0 +1,28 @@
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
