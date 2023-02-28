Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6099636ejc;
        Tue, 28 Feb 2023 11:28:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+Tbazkqbh8KTJm/myly31x3Xtv0pzu54BJHBoesAjcVnHABnDwTpZaVB1qp6gXJT6Hso4g
X-Received: by 2002:a05:600c:4b27:b0:3eb:38a2:2bcd with SMTP id i39-20020a05600c4b2700b003eb38a22bcdmr2828250wmp.28.1677612514468;
        Tue, 28 Feb 2023 11:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677612514; cv=none;
        d=google.com; s=arc-20160816;
        b=V8JJWpIWPQR52sRiHrlh/GjVBXbN5Lz0Ncat81f01w0qQJOCpr/TlGjmbugemCHOKw
         jHeKhjudJMNVCHL7cIOCeWyKpVAw3q9/c2pfIDVbUyFZsuWN9HoeEJjwBYhkx3MQ2mxe
         IX5S2XCwoCLHFKhdE/qi0A86+BM7uwIOhKaVpDS0+tEXsIhO5Qbua6RjL4jL03Lv7uM9
         pEEgaH4l7E6F+il2kX7fpGtdmbuWLvUWnJ2VRW2Xo6Otu3pj3FQs89YFM3tNvA8W16tL
         OsvuzvrAnXPEnjSEgvXCBeMs77FQNwK8cFKXOSOix4hroWRARjdvGtIPys+mWIAQ3iG0
         1cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=BylTwKg8YlkwdSNNbKzlz0/+plpdoDjrEgBsGDbnAW4=;
        b=oYiykKT/AVYYadi2cXfOP+VDzhwSw4VO6VSWoq0MRWGeThPmSY24FsBmyYeTjkB+IK
         S/WIOGmc20eRuUcr36fshDdyLQ+4BP9Bg9t/nVdtQSDyPQJ/73nTUiQ837bXqWw+FvWf
         raAVXKujAfyhHS6MvAnUkWvtLLRzPH0/6cgRWNSHHxJjTFfyWQbJQKVoFQrFcocFy55R
         +Bm41kRXYJLywRcC5rdWHgdr0AS0c+sF3hse9Wi8VFAIbvaIKA532zQ0svuDVAARJVAg
         yvyQGXDCWGEzAKhgOG0+NTxPa/H+D/n2oYbfGq9Aj/C/H3aQhv7B8MQcCMsNWF42a5hK
         1Jkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=baQ6YnmN;
       dkim=neutral (no key) header.i=@suse.de header.b=994jBdmd;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id f18-20020adff8d2000000b002c70d74052csi9377770wrq.971.2023.02.28.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=baQ6YnmN;
       dkim=neutral (no key) header.i=@suse.de header.b=994jBdmd;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3D1821A7A;
	Tue, 28 Feb 2023 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677612513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BylTwKg8YlkwdSNNbKzlz0/+plpdoDjrEgBsGDbnAW4=;
	b=baQ6YnmNCNEymFlLiqokgCVCKevsrtnwx6bY0KFZ4hIsdOP7F/1TivtxrurarKAh7c/eCs
	Grxp5pxpB31OCMrjHw2O9ej7QtQRtrdsEFpEylnJ77FrucbX+iAo2f3YAeNAKR0Xxkd4SD
	aorNa6rvArpy06RCTGoSZLZOoOiDkdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677612513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BylTwKg8YlkwdSNNbKzlz0/+plpdoDjrEgBsGDbnAW4=;
	b=994jBdmduqDOwoR6XCi1/UtXrGsMqltBjqmcIeD3sKe8j1vnHwOqWMXvgZjfgQxmAMr1B1
	V7HaTYMc4hx3dGBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02B061333C;
	Tue, 28 Feb 2023 19:28:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +w07L95V/mNBagAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:28:30 +0000
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
Subject: [PATCH RESEND v7 0/9] target/arm: Allow CONFIG_TCG=n builds
Date: Tue, 28 Feb 2023 16:26:19 -0300
Message-Id: <20230228192628.26140-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I/KsBsDD382w

Resending with the remaining patches now that arm next was merged.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/791478895

v7:
https://lore.kernel.org/r/20230223130841.25916-1-farosas@suse.de

Changes since v6:

Now using the same feature set for -cpu max for both qtests and
TCG. This requires a slightly awkward code movement to expose
aa32_max_features to non-tcg code, but we gain by not having a
different environment for the tests.

Also applied Richard's suggestion of creating a new cortex-regs.c
file.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/786195517

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

Fabiano Rosas (7):
  target/arm: Move cortex sysregs into a separate file
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Move aa32_max_features out of cpu_tcg.c
  tests/avocado: Pass parameters to migration test
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build
  tests/qtest: Fix tests when no KVM or TCG are present

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
 target/arm/internals.h                        |   7 +-
 target/arm/meson.build                        |   2 +-
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         | 141 +-----
 target/arm/tcg/cpu64.c                        | 438 ++++++++++++++++++
 target/arm/tcg/meson.build                    |   2 +
 tests/avocado/migration.py                    |  83 +++-
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |   4 +
 tests/qtest/boot-serial-test.c                |  10 +
 tests/qtest/migration-test.c                  |   5 +
 tests/qtest/pxe-test.c                        |   6 +
 tests/qtest/vmgenid-test.c                    |   6 +
 23 files changed, 772 insertions(+), 601 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (87%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
