Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593151ejm;
        Wed, 26 Apr 2023 11:00:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEQpGxxtg5YS3b2nSDIoymxVgAlSuwqgDVaBcGFcZukq9DZAK128BK88YnZGiqeVYFLB2D
X-Received: by 2002:adf:eec6:0:b0:2f8:fd30:4a7d with SMTP id a6-20020adfeec6000000b002f8fd304a7dmr14987746wrp.50.1682532019491;
        Wed, 26 Apr 2023 11:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532019; cv=none;
        d=google.com; s=arc-20160816;
        b=vM6IedPs4+h6NqslC9Oqdz9RQI2HOukRS6dKwEDYgccamSoiFWKB5igUl2b12ebZNx
         DFyPmLwqkXTYlbKvnE9JaTQxwhHnmUEsaZNA0t0i78u+QpScl9fqAInkqNO1Nriy1/9r
         3/IOjRECgMmNCa7o9yPUwTklFI1NMTaSYTocoPIrFpEj5Q6KedMi9DOPfWZh49ZC22Lq
         w0hIa3GQ28jDHYJ1Isu5soUNO8VcNK11hf6ESCTSFZFKXJwmSzf9by6QeEf/WYCdNYAp
         7mQ+oMnnW7Mh3zrgv7j//R7kaDCVx1hDH4EeSe2XqSoH0VniJ1jH3tZv4HAD80cbCGuU
         hWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=HGKzVmkKRBdarPSqZ/rI4dvPKS3AfTyaGPYaDmWcgPE=;
        b=MbqORUWV1SBOA3aZFkeXg9ChkuVHwesLNGP1qW4ZMEAKvdRQa8yWxCZ+RAhL7dHZSV
         twJwh3Jho2S3pYXfo0VJLMGA9If3c0X9lWvSK42fOTQjWWFMbOokFJ0U5/q9I810wobn
         +7waFwowQktIPybEQwv+u+Gy1iXc4Y8cfwU6R2XdkQR6SwxkipiIv4qbMhtEQJ80ZSuj
         ttKmY9VdOz4Jda8mkfsdLQU1ViqwtacRx9WBU7IS69VWI7SIYjl2g65FCvs+ecjBIAni
         Cr91nHCKp5OVwJBBCmE15X3/S6Wb6JdNjDsDj3uxIQcDLP/xaC9LbjqmmnkZBNgkCf52
         MQpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=aDwC6qJu;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=6rRcpLwW;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id n15-20020a5d6b8f000000b002f8d97a695dsi11519630wrx.268.2023.04.26.11.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=aDwC6qJu;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=6rRcpLwW;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2726219ED;
	Wed, 26 Apr 2023 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HGKzVmkKRBdarPSqZ/rI4dvPKS3AfTyaGPYaDmWcgPE=;
	b=aDwC6qJufoeT/Q6cE5U/tnp4vV/hE47r8FLgrDUJOUVdzVWwyGYQ8xEc+7EbsQNlITkp36
	Wj5zaiD+od67pHGBsBKCJi3evApKgzV0dW2gokAHjyl5Qku6gv0gUaxwrizJuXnDE2g2uA
	5mDuAdtc7CJxSP43UQd80GV6hF2GPZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HGKzVmkKRBdarPSqZ/rI4dvPKS3AfTyaGPYaDmWcgPE=;
	b=6rRcpLwWjghnIeuvmH0pbRYg1wZtYTtkLnAYkbSqI/IanA4YlLfiO1JWoi2nr5OcF28MVA
	g0R+7nGFMaWXbsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC358138F0;
	Wed, 26 Apr 2023 18:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xYprLK9mSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:15 +0000
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
Subject: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
Date: Wed, 26 Apr 2023 15:00:00 -0300
Message-Id: <20230426180013.14814-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cQYThRfphQBQ

Hi,

Some minor changes:

- new patch to move a test under CONFIG_TCG (broken on master);
- new patch to document the unsupported CPU test (Philippe);
- changed the test skip message when no KVM or TCG are present (Igor).

CI run: https://gitlab.com/farosas/qemu/-/pipelines/849926795

v10:
https://lore.kernel.org/r/20230412121829.14452-1-farosas@suse.de

v9:
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

Fabiano Rosas (11):
  target/arm: Move cortex sysregs into a separate file
  target/arm: Remove dead code from cpu_max_set_sve_max_vq
  target/arm: Extract TCG -cpu max code into a function
  target/arm: Do not expose all -cpu max features to qtests
  target/arm: Move 64-bit TCG CPUs into tcg/
  tests/qtest: Adjust and document query-cpu-model-expansion test for
    arm
  tests/qtest: Fix tests when no KVM or TCG are present
  tests/avocado: Pass parameters to migration test
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build
  tests/qtest: Restrict tpm-tis-i2c-test to CONFIG_TCG

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
 tests/qtest/arm-cpu-features.c                |  20 +-
 tests/qtest/bios-tables-test.c                |  11 +-
 tests/qtest/boot-serial-test.c                |   5 +
 tests/qtest/meson.build                       |   3 +-
 tests/qtest/migration-test.c                  |   9 +-
 tests/qtest/pxe-test.c                        |   8 +-
 tests/qtest/vmgenid-test.c                    |   9 +-
 23 files changed, 1016 insertions(+), 832 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
