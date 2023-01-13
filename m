Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp415007ejc;
        Fri, 13 Jan 2023 06:07:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVQkBWx/Ge7E+HTJ35HIuBy9J1jwM4SSUeKLDi9A/mnx/xE4h1SlsEDGYHm9q11724htTS
X-Received: by 2002:a05:6000:1c9:b0:2bc:1b95:f364 with SMTP id t9-20020a05600001c900b002bc1b95f364mr12237887wrx.54.1673618859103;
        Fri, 13 Jan 2023 06:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618859; cv=none;
        d=google.com; s=arc-20160816;
        b=JmEHhRFHyMGe/WRkitaamXxf6PiYZPr9A2sguc2HvsEWQ56tOPrR7N3o+J/4h6svz8
         Y+J1PAEYvrvITI676fE7qNWAIGqc/d9H47VVlHa0OgywhUStOc87/YQcaHMVyi2SRMUO
         6MhDFTzlMM2P8GjC/2oewCQ1vikS6Bavf63mpfhvEYrmYbmWARnlAUkaevwpYkVUSVpP
         l8jeWCmIJ38cL7KbfBpzK3oB5Uz4tkgBFvhFggii6k6+SFNG0klcZr8dRB1ZFmXtLCUU
         w3dqUhjOzsIL9jDl2FkLSD3njZK0M0OKV44+T7Oy8f5IZCg0Q2fEWHCk8caWomAZWD2l
         tUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=43Vb2eVEM42+G2dsOM6a3AIXh1asg0rkcfl8Hv/lG+k=;
        b=bf4dIi4bcW8ahb9kEYIHzhIpFDizIC9zT+PnOVMaCeXqbCC6XE0R0NnzZqChDNVtSC
         JnZYBikJj0dU8RxuR5JITRI70+mmnW3iIstd3IoirosWKVxDHyxAstw+QhbhO7q/ULY/
         7Bb2lcouo1kLkhslQEGWt+P72eEw5j0LttgSbCGjx+KqewmWaCVfNx7rSJ3FYYVF85Ul
         3m31xrZSG0kHLwYD6gBQomsu8bmTg1OS+SBtgoOao7ZL2cqb2CAS3Zj2gywOj4Ots726
         5Ryn8yCHhgfWVypeHL+vQA1a9LQTHiQQhvBLFgyPeP8/IGYIosnsqHApTbkhoYvoGsPS
         KFrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TiKNpqU8;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="zQc7/UgY";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id m5-20020a5d64a5000000b002bb31e4caacsi22780230wrp.400.2023.01.13.06.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TiKNpqU8;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="zQc7/UgY";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 237255D6FF;
	Fri, 13 Jan 2023 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43Vb2eVEM42+G2dsOM6a3AIXh1asg0rkcfl8Hv/lG+k=;
	b=TiKNpqU86v6JeZFG/xEEa73RJbE8StmpWmWC4D6JP9R9nPSV1EsxoriSHUkyQkUU0JPqJ5
	IVGapQaNA8vgUmP3oWUTUmV8OY8It2/YK8DYNfy0UjUhLSlQZySPxMEL0Rly80S+XDdIvh
	6zR0sH/L1Pb4bpgzDbN/je5eVUItRkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43Vb2eVEM42+G2dsOM6a3AIXh1asg0rkcfl8Hv/lG+k=;
	b=zQc7/UgYldFU7M7uXoVwBpypxR8HnGeJFsJIKBvdfXdciSE3rrX/BnhfizRgYEqgI/OAcs
	nK0Z9/Y5uBAqYDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B4D91358A;
	Fri, 13 Jan 2023 14:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KO1nBadlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:35 +0000
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
	Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v3 23/28] tests/tcg: Do not build/run TCG tests if TCG is disabled
Date: Fri, 13 Jan 2023 11:04:14 -0300
Message-Id: <20230113140419.4013-24-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GYcB5+pJaye5

The tests under tests/tcg depend on the TCG accelerator. Do not build
them if --disable-tcg was given in the configure line.

Test against CONFIG_TCG='' instead of CONFIG_TCG=y to account for
CONFIG_TCG=m.

sample output:

$ make check-tcg
  GIT     ui/keycodemapdb meson dtc
  SKIPPED x86_64-softmmu guest-tests because TCG is disabled in this build

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 configure              |  4 ++++
 tests/Makefile.include | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/configure b/configure
index 9e407ce2e3..a6f9892757 100755
--- a/configure
+++ b/configure
@@ -2352,6 +2352,10 @@ if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
 
+if test "$tcg" = "enabled" ; then
+    echo "CONFIG_TCG=y" >> $config_host_mak
+fi
+
 if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..aa0e610cf2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -45,6 +45,7 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 $(foreach TARGET,$(TCG_TESTS_TARGETS), \
         $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
+ifneq ($(CONFIG_TCG),)
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
@@ -56,6 +57,15 @@ $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
+else
+.PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=build-tcg-tests-%):
+	@echo "  SKIPPED $(subst build-tcg-tests-,,$@) guest-tests because TCG is disabled in this build"
+
+.PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%):
+	@echo "  SKIPPED $(subst run-tcg-tests-,,$@) guest-tests because TCG is disabled in this build"
+endif
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
-- 
2.35.3
