Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1122401ejc;
        Thu, 9 Mar 2023 12:15:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+p2L9Ek648tYzjzhf36hXC7Qx8/SA/eNrpoOWt4MxYmYdCA/WB3r1lZ90n5ZTwz/kxoYV4
X-Received: by 2002:a05:600c:1c28:b0:3de:1d31:1042 with SMTP id j40-20020a05600c1c2800b003de1d311042mr452097wms.23.1678392920558;
        Thu, 09 Mar 2023 12:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392920; cv=none;
        d=google.com; s=arc-20160816;
        b=lMPsTTIztZiamZ9tJThlx6DDbBKO3TkLSlBz3r7l0+XQIziigZCD3D49NTpv3/tZEE
         hP/u74iIJek7dJdazVdoPRn0RaQwafRf7zqYK1t5DgOZDhZVTDAGKp9lmGZpgWXKcUeD
         AFWYfNVpIYmw9WV7hsarY+K4lIpPZ/QXp/3Ya4jx4n8GtkzE+1QUSsDu9uze8WxDjmOa
         JjGTztPm62WIqgh1Z4GLTIfd89DD7AgMnW2h5qI248bjbwg+qXhEMLTMDgbuTDDcJl4k
         iYbeNJtrA+EvAavF6quHvsItc9gGtsRKbcImrXa0TCvIKDtN36gluw5LAwL+aLCi2ihI
         Ld0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=b3ClZ5bqNSiKy/nbq5LS98oyuV7R9Cbo4BQLBqocESs=;
        b=Y2hd8Uo953VjqgAcxHaSZYoq2u3GWq8RRL0wGQKxjpr4Rg+laOic+vgNZfWyIFP/jU
         3Oi/No5rSKlR3R0WRBkXjpXJni7Kr1xnLgTjOtGkR9BERNYMUm9ytFCLgjkgAn0aFkwZ
         ki+CX+6yiHP3FoppDWIUQzQzfOmQOR78KdVDm8dJVgskQkTZAde2TY7LJlBQFhBQ9zcn
         VICyv3nj6i1TAEO99wBVZGLBeUXM6XxA9peDKOUo8twFZ390e/HRnxHP1ZdeomJm021v
         book0QF8k66U0f+neVwm1eU9apXnSlzoKkJx2tw2IQOXfRJPhUbVvyrU1uO+2ZIKZvdK
         bQew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MsBnb0PB;
       dkim=neutral (no key) header.i=@suse.de header.b="dZQC/eky";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id g8-20020a5d46c8000000b002c71b942737si307926wrs.188.2023.03.09.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MsBnb0PB;
       dkim=neutral (no key) header.i=@suse.de header.b="dZQC/eky";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 292A9202A7;
	Thu,  9 Mar 2023 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3ClZ5bqNSiKy/nbq5LS98oyuV7R9Cbo4BQLBqocESs=;
	b=MsBnb0PBWSsVV9UC2zwBmQrbZNWi/u3xYz0OrzUfXxU3xI8Hz2TTlMNN/LmomiyJTaaPR5
	MLw1EfmrYNuDZzoT0u7sBlnss73lFNeHPyGn162mTPnFe8YXuJjDKmC0UNSSRAUrE+Q3m4
	p+drIAyA0PAhb2k30voSG4kc0ABY1BM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3ClZ5bqNSiKy/nbq5LS98oyuV7R9Cbo4BQLBqocESs=;
	b=dZQC/ekyYIPxU0rB1i8fqryosmRjHgwgmYdLwDQa/hWUG8dFtzUcOv2cMZrcFss/SFxP8q
	SqJLtHTRz5bJgsAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B5B31391B;
	Thu,  9 Mar 2023 20:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SLpWAVU+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:15:17 +0000
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
Subject: [PATCH v8 11/11] target/arm: gdbstub: Guard pauth code with CONFIG_TCG
Date: Thu,  9 Mar 2023 17:14:34 -0300
Message-Id: <20230309201434.10831-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pYYS8wfQZzYW

We currently don't have the reading of pauth regs implemented for KVM
so wrap the pauth registration with CONFIG_TCG.

This avoids the build error when using --disable-tcg:

libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
`aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
reference to `pauth_ptr_mask'

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Does this make sense? I seem to remember we had a rule that for KVM
register values should come from the ONE_REG interface.
---
 target/arm/gdbstub.c   | 2 ++
 target/arm/gdbstub64.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2ecc362ac2..fc937580dd 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -521,11 +521,13 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
+#ifdef CONFIG_TCG
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
+#endif /* CONFIG_TCG */
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 3bee892fb7..67c7cbb63c 100644
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
