Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp378827ejb;
        Mon, 13 Mar 2023 08:11:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set9luFqnk5awHpw5k7hQmrISpCY88WymmOmI1VIFsFoAQJlUH2RO1Av0yrVSAxGYKFyoI+So
X-Received: by 2002:a05:600c:548e:b0:3eb:2708:86ca with SMTP id iv14-20020a05600c548e00b003eb270886camr12368280wmb.28.1678720282225;
        Mon, 13 Mar 2023 08:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720282; cv=none;
        d=google.com; s=arc-20160816;
        b=1J1lVNsQE5GjrVbk9abW6BTQoJk3G2gPZP/Nz63cXB8P2eq6la6fH6B6YsAuQ0zxv1
         t/GZiZl1JDBXSptmtkgBhPSpxnjOvG5jsFNvbzemFdTmZ0ZlBP8HYv0BJMNoVhgisDaY
         phjK1i0KMFNCnw4mcTSS0fF9CQcU0MxWp/301zDlEWdTVb9Ss47iXVBl+JdrcNDPhNcC
         el+OT3GlIvsGtkJRlGyAZ1TjLfOBS+qZv9VgadoKX58P6m4OdXML95PYkCQvrOGMc7gi
         CwBRD1xpwx3AutoGhy/A1/tb+/NAR0flq23K6oIsm0CSEWC4Wn0KgAVO9VEfktmW/Xjj
         lYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=n6Q0GraW1WT1dpCp5ROo0whUmfGSr130gbFRRKJ3YsU=;
        b=0iNk8Idf/e5ThCylDsWKGlyCT+4FMvyot9yYtR3BZmi5nulvxWSnVj3Up17nHu2h5V
         9r2wFt5dw9N3SjQxmi/ZVOKj1OSrDKPETKyXjYRY1MWkmkT7VIxPT6UI/DQDIH6e6FyY
         +qX8cYaHNV6FaCOxVLeHmq6hRZyoZvLE1U4MagnUxER1XdhynfSRMyPVHLaChPnPPDyu
         ukwJSsSqLIWkfNWUzCaNcEGKvW7MdUd/IFBcNlr+YccfcWPvo4QQFWbGhcLo6/4cH0Ss
         95O8kGU7wQkQ0gvQcXDhp8CHUjD5iZ0u+Ejv7FoKQ4DDElCp2i63b2rGytt60LXEN3SN
         PCZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VriTWFpG;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id f12-20020a05600c4e8c00b003e215fe5887si7556452wmq.218.2023.03.13.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VriTWFpG;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C221222ADA;
	Mon, 13 Mar 2023 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6Q0GraW1WT1dpCp5ROo0whUmfGSr130gbFRRKJ3YsU=;
	b=VriTWFpGorj6DiMpvU50XYbXynfnf6wNFuV/WehIR7yBPQLNOfPsMNT9PLuyTw8GSBZiqI
	VkB6GbMAMYhFaQ0rqD0+c/MtalXxJ6wDUuvpNyh2j1yJ2yBCYnJI/Zv/gjuvi3BhjsyD8o
	M0wkEM9emPQ13mQBl54OEuw1DnroM/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6Q0GraW1WT1dpCp5ROo0whUmfGSr130gbFRRKJ3YsU=;
	b=IINf7NUj3oFmt7LJa9Xum1xlTklHitTxGU8C3h0ObY6AMeXgjrkSY1+FOQ69/RT02ZM9QA
	+20rH5MIf+y6EkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E260C13582;
	Mon, 13 Mar 2023 15:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2K9DKhY9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:18 +0000
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
Subject: [PATCH v9 05/10] target/arm: gdbstub: Guard pauth code with CONFIG_TCG
Date: Mon, 13 Mar 2023 12:10:53 -0300
Message-Id: <20230313151058.19645-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dilVt76jDPYt

We currently don't have the reading of pauth regs implemented for KVM
so wrap the pauth registration with CONFIG_TCG.

This avoids the build error when using --disable-tcg:

libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
`aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
reference to `pauth_ptr_mask'

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/gdbstub.c   | 4 +++-
 target/arm/gdbstub64.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 36a1d7dbc5..3ea50bcaaf 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -23,6 +23,7 @@
 #include "gdbstub/helpers.h"
 #include "internals.h"
 #include "cpregs.h"
+#include "sysemu/tcg.h"
 
 typedef struct RegisterSysregXmlParam {
     CPUState *cs;
@@ -522,7 +523,8 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
-        if (isar_feature_aa64_pauth(&cpu->isar)) {
+
+        if (tcg_enabled() && isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec1e07f139..104a43e471 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,6 +210,7 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+#ifdef CONFIG_TCG
 int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     switch (reg) {
@@ -243,6 +244,7 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
     /* All pseudo registers are read-only. */
     return 0;
 }
+#endif
 
 static void output_vector_union_type(GString *s, int reg_width,
                                      const char *name)
-- 
2.35.3
