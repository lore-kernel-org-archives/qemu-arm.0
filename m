Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281039ejc;
        Wed, 12 Apr 2023 05:18:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350bd6FSmYYV40AvPghV4j+SLP+Rlqz2yK5RyM0jMcjcIuFPJm7nY7GjZSwBAEICBhqrCAQi9
X-Received: by 2002:a1c:c90f:0:b0:3f0:8ed8:853c with SMTP id f15-20020a1cc90f000000b003f08ed8853cmr4198965wmb.37.1681301916322;
        Wed, 12 Apr 2023 05:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301916; cv=none;
        d=google.com; s=arc-20160816;
        b=lPGmwoW3Y/f7e5dr1hjaTv2tOXrYUMziV0d/sc8qk10RIHfMUthz13VZmGnHSWXV4W
         4Jg7ew0ya3nn2V7teXE4ZHqsnnMD1Gxpjlc354HCows0TPfty0/+DMulJeE8tRN4dz0c
         5rXG1qnd4yN1TiD1AYUHYjbVkfKz6314du7uxFvSlj46w0eENqZ9Qph9ui3as/AK8NOO
         5ahvdG9vJaeUEEcqHHra3ML8LL133ZwiTQmhWls3qfcCb5lrtTKvTETvhOQv3xvAy+yD
         JY4JxwgoYyWU5zfBXPAs8W249dptl9S1lEVWHCstA+2dYb4eYaBzqaGRPacD5E2tV7ua
         rUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=MKijkx67CYmcwu13PgnqnjEbuLd4RThGldKjbblvjlU=;
        b=sNqrMFeZKWqA8J4bvnXxv/2V5aWTQAwSxEBrJhLN+puiCcJfD2vB0xidPEPsoI36zE
         vogeml161RgoK0FPgGvoCNpadH+wBleC4c/2D+uuJ9Dng2tjo9Gf8ci8wiV55mJikUUj
         D8IWkkVQu52UJfNSCKuo0Gf8nsQhtw3pRms17OAC/YPq+SwJxG5PNYrmf5JC1rTCCldk
         WDiEgS3xHjdFqSpBgy5j9K2F5Q+du4sp+LoyqeWRW5qJuAk6itc9egH3pThq247gY/cY
         cWqeHKTnXCbSYYNXUfYVWP2oeUSYIKi3T3zvJxKi5LlQkJZfGn7PghBPlUmhfftnEx8I
         k5sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=evaVjfTc;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id r17-20020a5d6951000000b002f484e686e0si1082545wrw.472.2023.04.12.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=evaVjfTc;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B10F31F6E6;
	Wed, 12 Apr 2023 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MKijkx67CYmcwu13PgnqnjEbuLd4RThGldKjbblvjlU=;
	b=evaVjfTcAK4EAAytD2+ctjFo0MqIH3s8r3GazvTUiXxq0X9ofgXnVdIdjgyxW2ii5ft/dA
	e/87zMqnoAcp8U/2gvQOmGKD4Av0LEYnGBfqFfbL82r5/SIlaiY6bZjJQi3qIjzQM+pSjE
	GliPxOG1ejw/aDZpKAHu7kT/6K78ub4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301915;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MKijkx67CYmcwu13PgnqnjEbuLd4RThGldKjbblvjlU=;
	b=YB0kH+K4eBkXCeU+LtDKrcGj4gVeEyvCnQYo3kDAKGhAIUzRhN2j1s/dJIxWRzokG2Brle
	yIpjYlejieWJOcBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A71F8132C7;
	Wed, 12 Apr 2023 12:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Co/nGpihNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:32 +0000
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
Subject: [PATCH v10 00/11] target/arm: Allow CONFIG_TCG=n builds
Date: Wed, 12 Apr 2023 09:18:18 -0300
Message-Id: <20230412121829.14452-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9S8+pgHQDLTk

Rebased on master, moved the neoverse-n1 regs into tcg/cpu64.c and
extracted three new patches from the cpu64 move:

- patch 2: remove dead code from cpu_max_get_sve_max_vq
- patch 3: move TCG -cpu max code into it's own function
- patch 4: add the tcg_enabled || qtest_enabled logic

CI run: https://gitlab.com/farosas/qemu/-/pipelines/834334928

Thanks

v9:

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

https://lore.kernel.org/r/20230313151058.19645-1-farosas@suse.de

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

Fabiano Rosas (9):
  target/arm: Move cortex sysregs into a separate file
  target/arm: Remove dead code from cpu_max_set_sve_max_vq
  target/arm: Extract TCG -cpu max code into a function
  target/arm: Do not expose all -cpu max features to qtests
  target/arm: Move 64-bit TCG CPUs into tcg/
  tests/qtest: Fix tests when no KVM or TCG are present
  tests/avocado: Pass parameters to migration test
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 -
 hw/arm/Kconfig                                |  43 +-
 hw/arm/virt.c                                 |   6 +-
 target/arm/Kconfig                            |   7 +
 target/arm/cortex-regs.c                      |  69 ++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu64.c                            | 702 +----------------
 target/arm/internals.h                        |  10 +-
 target/arm/meson.build                        |   2 +-
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         |  72 +-
 target/arm/tcg/cpu64.c                        | 723 ++++++++++++++++++
 target/arm/tcg/meson.build                    |   2 +
 tests/avocado/migration.py                    |  83 +-
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |  11 +-
 tests/qtest/boot-serial-test.c                |   5 +
 tests/qtest/migration-test.c                  |   9 +-
 tests/qtest/pxe-test.c                        |   8 +-
 tests/qtest/vmgenid-test.c                    |   9 +-
 22 files changed, 1007 insertions(+), 830 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
