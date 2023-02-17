Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127948ejb;
        Fri, 17 Feb 2023 12:14:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9M0f5U22zK5iR6ouHooqBhWtn4dnJFoAjme5YO/jYvttBaOJ5Qocxrli/mH7Qz38EWoGyN
X-Received: by 2002:a05:600c:3085:b0:3dd:97d6:8f2e with SMTP id g5-20020a05600c308500b003dd97d68f2emr1120037wmn.17.1676664865987;
        Fri, 17 Feb 2023 12:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664865; cv=none;
        d=google.com; s=arc-20160816;
        b=Ev2S2LO+R7luPcfjqHjKrKJEwVBVld7bxYBwT3UbxI3GeNateNd/ArFK24S7HPiZyl
         doHPib1DmrwJt/XwpDMA0RkxkqgLnrqPkabuQHgPbbJS825VcnSJfQX3kYI556KrcXzH
         LWxMmtxNwfBtiFT9E28wq97TfHpEfwWPSn1StQ1IM2qLAVqtWRTppQN2santcuxUsj7z
         rC6yvVmmuGXupfVSGaGWdPyQcr+s6jOkO86oWg2b1FduUKsBX+yEGsH6EeOahBBR2LyV
         IWeCb506Ek5XUJqfhff9mbiQ5ezd/+WcWtfuuOfsvZ7ISO+ub49rH4JmKtpDe5PZnLBD
         ZLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=hy2cNC4cK/PMZdfqfDxXauSL8bS6+cHJmfDoGKJ3/3s=;
        b=mlE64jTQw+LsvzI0xxqvT4t4yJo5Y8kPtlWi//iQV2LpS4dfNODeuExOIliEazQHVq
         xAgq+d0uh9459aXpa6wG9AmDeYnYVZcTxREPJ9Iz8IbbVeS2M/NtosWSUEfEhQ+j67sT
         i/ufU9QGqtTCKv+AIXgNjAhsPl9I1EP6YDAuAvZbZKWAiuET0Gs+xHn6YdEvFXy+AIsJ
         gRNaJoK9VrMvuwuoAw4xjTOVIe43mrCWiCI/h2AUt8vJDGMAmBQLsF4jwwMwBRq15GxB
         2w9ZhoiSzwW/1EC+Ngb6uDTcziJtV/9EOIhhOVWguYRX1nmf6/Tu9qnDNzju+Wls+MYl
         tpWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UivnYipb;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Zy9oWl43;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id f20-20020a05600c155400b003d217a5442csi6536405wmg.96.2023.02.17.12.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UivnYipb;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Zy9oWl43;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A4D520FB3;
	Fri, 17 Feb 2023 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hy2cNC4cK/PMZdfqfDxXauSL8bS6+cHJmfDoGKJ3/3s=;
	b=UivnYipbvB87SgjVgI2tWMpAALbCgMz74LJQP1e56pOQ90CDKvaxBlrxFArRmKY6UPMYg0
	LDX1xxZZ6f0QhjwnltktUz5CxJ27j74QQ3k/2sU//KAkHmq3I0mmmARMjHt/asOCc9IOOs
	dXtJFYLB4GsL5wD395/FNsVdVNzVSEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hy2cNC4cK/PMZdfqfDxXauSL8bS6+cHJmfDoGKJ3/3s=;
	b=Zy9oWl43eHmsdUYJkgArYYxwyRAr59E24oWZPwnJi7yB/kuS9U15hqtQ3/gKO6AFadpn/7
	tv5ZEy2iksVXVMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8223138E3;
	Fri, 17 Feb 2023 20:14:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qBLfHx7g72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:22 +0000
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
Subject: [PATCH v6 09/29] target/arm: move helpers to tcg/
Date: Fri, 17 Feb 2023 17:11:30 -0300
Message-Id: <20230217201150.22032-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wTe/RZGUY6nD

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build               | 15 ++-------------
 target/arm/tcg-stubs.c               | 23 +++++++++++++++++++++++
 target/arm/{ => tcg}/crypto_helper.c |  0
 target/arm/{ => tcg}/helper-a64.c    |  0
 target/arm/{ => tcg}/iwmmxt_helper.c |  0
 target/arm/{ => tcg}/m_helper.c      |  0
 target/arm/tcg/meson.build           | 13 +++++++++++++
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
 17 files changed, 38 insertions(+), 13 deletions(-)
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
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
index b2904b676b..3e2f403005 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,17 +1,9 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
   'debug_helper.c',
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
@@ -22,11 +14,6 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: fil
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
@@ -43,6 +30,8 @@ subdir('hvf')
 
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
index 044561bd4d..1f27ba1272 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -23,10 +23,23 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
+  'crypto_helper.c',
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
