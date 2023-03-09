Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1121738ejc;
        Thu, 9 Mar 2023 12:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set8w9mmZ/h0b5fTzhIJqINgqkhKNV3VdEboJ9zgGlK+AL6sLtnoKcxkFYwOL7bB6f0AOlsn+
X-Received: by 2002:a5d:4b8a:0:b0:2c9:9b81:11de with SMTP id b10-20020a5d4b8a000000b002c99b8111demr17455515wrt.20.1678392880192;
        Thu, 09 Mar 2023 12:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392880; cv=none;
        d=google.com; s=arc-20160816;
        b=mMdSlLdtHCK+pgWk2VKVDy0clwcZbJ1J1e8PT9CfTO+My0AtKINhFarB4Iuv6cJGLC
         E+F21XqHykqtnMJ5huMK/SbRjw4zkU/1i7zmDMXCXNnheDLi14nyJVn0Acw7X/sHoG+Y
         08yQcvVl9KYk4BFDUeONwPnamGEqGrtxPt/stFjCmFcTzd1ExpXH4Q69UPzmuz6dp8YD
         zStY2/9ttXe/aWCypiiugWAWwM1N1E/JDSLNsl4MXxCHs/39/2YDP1ohlg1yN6nZLQxh
         8FW8+pYK05/bvFiENiAfEWPNs3TbvlG2RKGbh0bsnAGauqhEiUQ7BqYXBzWGjm6i+H1Y
         92qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=ZLNtAGCa5avhacFqL5fpgWGOfzoV3RLsxTR4Fqc0q9g=;
        b=eIQA5eAdReu5Nv8N+1R61+g7hMY7CNvyIrYtFeTNozF9zwy/QkdFwSUGiKf1GRa7dE
         H2sNEuiMRsm0bx7lhMnbY9FJGysOZIpeXBtx14Q6s0g9MuaaCPMiaFCu7dMm57aicOmy
         9PoW41vO5abOfy6vQJ+cTR/52dA8CV1E/Vhjbj83WJqC/KwILSbaVFMwWsONiC60sNZE
         VXIqkZWA+t42jKFuV5VWXz/gmVy1LRXi9WXOU+f1fJijhTaMsGSaAH1IHKgOE8rAucNb
         xI8Ws+bR7lOyJis1nUc/pv5JYcmjguNDQaGYPjoVpoZNRseB8ynUyduSrmL4gZBwOa01
         Ws5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=vVMLbTp8;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id z13-20020adff1cd000000b002c56a45ce85si344956wro.124.2023.03.09.12.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=vVMLbTp8;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81C12202A7;
	Thu,  9 Mar 2023 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZLNtAGCa5avhacFqL5fpgWGOfzoV3RLsxTR4Fqc0q9g=;
	b=vVMLbTp83lomC07N7lWEKJ6EfcB6aVMGM0StAO57cRpZt2QQml/IEEkdsaibQP60vKzhF0
	LLzRkLqXDC8yBmqnF0pDLpBxmY038r8T/zZOR2BwMCn/7tD/YL+70ZJv2B5j4wn3Ps88lb
	dZmGCn+XV/jkZLUHW8rpx/rto7vz9p8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZLNtAGCa5avhacFqL5fpgWGOfzoV3RLsxTR4Fqc0q9g=;
	b=vt37MPuKT8h0jEb4H3ONDLSw6OG7bGevp9CtdYYIuTc7FUQ8bCr5LSPyJtTHuisGmgpngY
	mBJPGiflLsyaH9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 960BE1391B;
	Thu,  9 Mar 2023 20:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cETwFiw+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:14:36 +0000
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
Subject: [PATCH v8 00/11] target/arm: Allow CONFIG_TCG=n builds
Date: Thu,  9 Mar 2023 17:14:23 -0300
Message-Id: <20230309201434.10831-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TvhPx8sqzxMM

Changes since v7:

- patch 8: moved calls to qtest_has_accel after g_test_init to avoid
           the TAP error;

- moved the avocado patch towards the end of the series so we can
  merge the rest without it if needed;

- two new patches to fix regressions due to gdbstub changes.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/801656194

v7 resend:
https://lore.kernel.org/r/20230228192628.26140-1-farosas@suse.de

v7:
https://lore.kernel.org/r/20230223130841.25916-1-farosas@suse.de

v6:
https://lore.kernel.org/r/20230217201150.22032-1-farosas@suse.de

v5 resend:
https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de

v5:
https://lore.kernel.org/r/20230120184825.31626-1-farosas@suse.de

v4:
https://lore.kernel.org/r/20230119135424.5417-1-farosas@suse.de

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (1):
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (9):
  target/arm: Move cortex sysregs into a separate file
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Move aa32_max_features out of cpu_tcg.c
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build
  tests/qtest: Fix tests when no KVM or TCG are present
  tests/avocado: Pass parameters to migration test
  target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
  target/arm: gdbstub: Guard pauth code with CONFIG_TCG

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 --
 hw/arm/Kconfig                                |  43 +-
 hw/arm/virt.c                                 |   6 +-
 target/arm/Kconfig                            |   7 +
 target/arm/cortex-regs.c                      |  69 +++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu.c                              |  69 +++
 target/arm/cpu64.c                            | 399 +---------------
 target/arm/gdbstub.c                          |   6 +
 target/arm/gdbstub64.c                        |   2 +
 target/arm/internals.h                        |   7 +-
 target/arm/meson.build                        |   2 +-
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         | 141 +-----
 target/arm/tcg/cpu64.c                        | 438 ++++++++++++++++++
 target/arm/tcg/meson.build                    |   2 +
 tests/avocado/migration.py                    |  83 +++-
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |  10 +-
 tests/qtest/boot-serial-test.c                |  10 +
 tests/qtest/migration-test.c                  |   9 +-
 tests/qtest/pxe-test.c                        |   7 +-
 tests/qtest/vmgenid-test.c                    |   8 +-
 25 files changed, 787 insertions(+), 607 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (87%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
