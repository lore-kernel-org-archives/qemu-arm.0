Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663841ejc;
        Mon, 9 Jan 2023 14:43:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDDz3j4IefDuJxq17DOFvk4hFilUmNtsAY2Jz3ztPBPWBrxDPG9aF+qB761eKsUoeAN8PJ
X-Received: by 2002:a05:6000:4088:b0:2bb:e896:5a09 with SMTP id da8-20020a056000408800b002bbe8965a09mr5046772wrb.66.1673304209288;
        Mon, 09 Jan 2023 14:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304209; cv=none;
        d=google.com; s=arc-20160816;
        b=l2tCmDiO3fgWrCl13KPcxQL+7BtgLJorIx4IRTXdVzQzuWY0GbVNS2I2wYq7r6aHZU
         Vnv7KxEovKfHn0QGHUEV35PpPXhscJh5TYfgKVVpWQnVnhn+xLYh/C0h4khUNIntcopU
         8JhtHtBA8Kz2nFs/0aFAKuWCpDgkG2qmwl6Hde7yEbhL2SJ/nvv/TAIzX2KVkCzHiE80
         ZW2XREE1hCfs/Nn4T67ifDVyhZaLU9jQWEqnH43BeBUCoe0mzMLGa8ICTVa+ejB0lAr9
         PwdXq7DhrgWWp/xXjQKGkMQInIL9btE3d5jy97RJk0l2oo4gz2auFVXLTzR5Dq9P+4bR
         onxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=HGJ4/+qQUdyPODxPG2cP+HJYVboRrZ3kGN9lq/KT9Qo=;
        b=CWOk6vWoBbyNJqBfC2AXM6W5Bs/V7MBDH9vUW6zqHG2cvS/66gR3Yw+3opET+99RR2
         QvJS/v2KQ7+eDhkZTGXImvhYfkzfJGh9+C0OnrAdWEpJ7P9ZyvCU0Ir9/sehf7Pfwr7F
         HFbrMQtrs5wuG7Zasu9j1kzmrJHoB/DUAauCZUcZ7HkMwgWydsXl53WKYZLtSiVD1vdL
         q/Jrx6JE8xtnLPqRSsQkE9a9ChORNNvzFycoq5boTu5gS7ouWhH86dnHA6V17vSTIzFq
         y83vsHHtGE6pvCd2ksgPvn+ycPYJJFnAFua91tUo0HLbiZZIDpI9bb3HPcCKYqgahMqN
         2Obw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=S7nXKTaF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id j20-20020a5d4534000000b002bc81220414si1165898wra.128.2023.01.09.14.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=S7nXKTaF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D1375CDE2;
	Mon,  9 Jan 2023 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGJ4/+qQUdyPODxPG2cP+HJYVboRrZ3kGN9lq/KT9Qo=;
	b=S7nXKTaFaN3znEDGqEPHwKAb/JqzLtAVrypyG0xrUNmzB+CIrovmqFV1ByLZw4s9oWaUni
	JxSYxK9vmhCcFcKGjtce8NR73F2LWoYOn1GXWfrT4Zl5yX/WROppysdMzqfUpwPVdMfsjS
	1yu5KVhT1jdgWJf0P15LLd5eZPjSpJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGJ4/+qQUdyPODxPG2cP+HJYVboRrZ3kGN9lq/KT9Qo=;
	b=d4/BtsdUbOVzEXmAn5WN/t3joprzEv2y6kRHIFFA/l43/wZ5HWODxT2hxKdMp2J3sjnnJ8
	+FjaWOqiRvbj1lCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 988D613583;
	Mon,  9 Jan 2023 22:43:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UHV3GI2YvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:25 +0000
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
Subject: [RFC PATCH v2 16/19] tests/tcg: Do not build/run TCG tests if TCG is disabled
Date: Mon,  9 Jan 2023 19:42:29 -0300
Message-Id: <20230109224232.11661-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: o72ogAwkGISq

The tests under tests/tcg depend on the TCG accelerator. Do not build
them if --disable-tcg was given in the configure line.

Test against CONFIG_TCG='' instead of CONFIG_TCG=y to account for
CONFIG_TCG=m.

sample output:

$ make check-tcg
  GIT     ui/keycodemapdb meson dtc
  SKIPPED x86_64-softmmu guest-tests because TCG is disabled in this build

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              |  4 ++++
 tests/Makefile.include | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/configure b/configure
index 2281892657..ad25a3b5f5 100755
--- a/configure
+++ b/configure
@@ -2351,6 +2351,10 @@ if test "$plugins" = "yes" ; then
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
