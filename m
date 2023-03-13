Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp378453ejb;
        Mon, 13 Mar 2023 08:11:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set9GwCV3Hee9vtz0Yc+VKji0nsQv8k8IBrXfnMR5iWAPopv023GtPsWoNizqq37Z4EF7uj4v
X-Received: by 2002:a5d:4bca:0:b0:2c5:4ca8:a5a1 with SMTP id l10-20020a5d4bca000000b002c54ca8a5a1mr22260595wrt.23.1678720264943;
        Mon, 13 Mar 2023 08:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720264; cv=none;
        d=google.com; s=arc-20160816;
        b=ZxPx+kxVfDma0ihvQGxSEKKU5lDpOvsRDEo7y/HFzHEciY0XQcrMaazUKoN1fq/zTI
         Mo7mpHffQvxX0wqzTOfPGKZjXR1y2P9Wd29moBAmwwB2eJ4SzI48JAP8YSp/G5Qu82G8
         T+fRyJkDrovCgz6IuqpBOwmz3lP254P+aKDRRFRIzxkXGORTPF2apv4A3MMGmgxodwNO
         vFveyB1rxNR7sLfk3+VF8TULtQdSHq3SlFycAn7jsBRiiH/WULABXI7AWKhr+xjk9L7H
         8iULb0+EG9H3641Q3DyDR6Gscb0H0rCJ1X75r5aNd6cHzFK/ImlF9dV27JnaGzmbF2op
         obzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=ssI/NWzHmMvw+GvsIGyRcjkWHBGazlPQkwtfoO+cebk=;
        b=DRUB3s9fyewIhYhsIFcSpnR4KhjPQtyO3DX1AjffCQc4kQ0E+HuHpfQ2epMiNTQvQJ
         jm6M4iDQEBixu5nFKeGOQTZ13XO4l1932qrBIsspPxZ7ck+0EPpYNSLCcVCA9wrERAbr
         k3Oh/fg249j2uDJk9j7x8gS0EZ60wbqPhP852y3xAKrpssOpjGktaovRLl3O68UtXqXO
         d6x3OU/B4EeR/NCz78qURQ5a33XsDXEFWS/kn3o+A+Lyu3aVdIbqHh9epYDs81neFCU+
         ft2wCAvf7jl+BlDaY7TMMjZBQLO0BXhVgqb+cXxOpUswDK012BfOfuNtK/f5Aeff3E2w
         SpEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pmrgIRWA;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="imKxz+5/";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id p14-20020adff20e000000b002c54f2dd9b3si6828292wro.530.2023.03.13.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pmrgIRWA;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="imKxz+5/";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F3B322ACC;
	Mon, 13 Mar 2023 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ssI/NWzHmMvw+GvsIGyRcjkWHBGazlPQkwtfoO+cebk=;
	b=pmrgIRWAdfGX/ealqpF7PUZTywPNH1Qt+Cw67XyvTwZmAelzfYStakHKWdK7UTyw6TGYZw
	2P4TwMs/cbEwBtbFawW49fVuyDWosaiKNuvPcln7hTBy/ZwMeDjQbJrb/bdKnHZChbD7d4
	Og7aBdIRZWHZ67dtrufT2rmE/XRbec4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ssI/NWzHmMvw+GvsIGyRcjkWHBGazlPQkwtfoO+cebk=;
	b=imKxz+5/OgJ3UxM/RKzuRSoj+zIlH1nTxRXeHkREtByDCLGWFxvPuNStd8xXPnMYk8xCqc
	X5qn3mtzJVyfa6Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E3FA13582;
	Mon, 13 Mar 2023 15:11:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xtJ9GQU9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:01 +0000
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
Subject: [PATCH v9 00/10] target/arm: Allow CONFIG_TCG=n builds
Date: Mon, 13 Mar 2023 12:10:48 -0300
Message-Id: <20230313151058.19645-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QZimyjEFeiDt

Changes since v8:

- reverted back to keeping -cpu max code for TCG in tcg/cpu64.c;

- pauth: used tcg_enabled instead of CONFIG_TCG in gdbstub.c. However
  we still need to keep the ifdef around the function definition in
  gdbstub64.c;

- moved all the regression and test fixes after the patches that
  enable the --disable-tcg flag;

- tests with --enable-xen --disable-tcg:

  Tests now explicitly skip instead of passing.

  We cannot do the check at build time because we build the tests only
  once for all the QEMU binaries and the native binary will have
  support for KVM, thus breaking our !CONFIG_TCG && !CONFIG_KVM
  verification.

  I also don't think we can have a wrapper because which accelerators
  are used is a test-specific information. The test should be able to
  specify which accelerators it needs. In other words there will
  always be hardcoded "tcg" and "kvm" strings somewhere.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/804459781

v8:
https://lore.kernel.org/r/20230309201434.10831-1-farosas@suse.de

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

Fabiano Rosas (8):
  target/arm: Move cortex sysregs into a separate file
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
  target/arm: gdbstub: Guard pauth code with CONFIG_TCG
  tests/qtest: Fix tests when no KVM or TCG are present
  tests/avocado: Pass parameters to migration test
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 --
 hw/arm/Kconfig                                |  43 +-
 hw/arm/virt.c                                 |   6 +-
 target/arm/Kconfig                            |   7 +
 target/arm/cortex-regs.c                      |  69 ++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu64.c                            | 633 +----------------
 target/arm/gdbstub.c                          |   8 +-
 target/arm/gdbstub64.c                        |   2 +
 target/arm/internals.h                        |  10 +-
 target/arm/meson.build                        |   2 +-
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         |  72 +-
 target/arm/tcg/cpu64.c                        | 655 ++++++++++++++++++
 target/arm/tcg/meson.build                    |   2 +
 tests/avocado/migration.py                    |  83 ++-
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |  11 +-
 tests/qtest/boot-serial-test.c                |   5 +
 tests/qtest/migration-test.c                  |  10 +-
 tests/qtest/pxe-test.c                        |   8 +-
 tests/qtest/vmgenid-test.c                    |   9 +-
 24 files changed, 949 insertions(+), 762 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
