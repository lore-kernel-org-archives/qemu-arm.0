Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787144ejc;
        Wed, 18 Jan 2023 11:37:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbhIOUHPXC0mvydgnaSYWduhGxoBSWZU2TRaIC/XeW7WECnrdJoBZC1WWErrK+YqvY/+Iv
X-Received: by 2002:a05:6000:a09:b0:2bd:e095:3f8f with SMTP id co9-20020a0560000a0900b002bde0953f8fmr7685484wrb.55.1674070644562;
        Wed, 18 Jan 2023 11:37:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070644; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ5WbYQlCTrAy6wgYiiTWBvIlYwMJkZ9Uqv3Y9cDYJLensLOohSz8b1f8Y+ETYg6g8
         9CEBzGYnyKhucJDMPZbR/LJf5kSo1t2gSY3mt0+h/V/Mv++firDoWGU5iNMIn4uIU8Ox
         Vda6gBDIRmyv4SKVsRzU+axZ92zSra+SRLoWYl93GW/rgkSkUOruCiB7KHJ+YD2Dy87F
         /ErJhAU2EFAbXlBnoKSAaWSlCOpQ3XCm58Rmo/j0cKd9pundcjgR0IOpyaBf3u/ko+z9
         vi/xBEiM0i0p3U6j/QVCjfFd6jLI/ocgtGCs3JqW+eXlLR5vg0yVmhrSZTJo84Bru64m
         MNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=tOh9TckU1sSiBRvgWZve0VSfKbLt2OgigIgHgjgUZvE=;
        b=T+Sc/3xYyVZ5bL+Q1wItlhMO8G+c3LerS0gnFCEKh1AcvqurvlNYmSAuusDh2TbswG
         vFvz15KjApfR9sv/OQqZeAFhTOEit4t6UBXTjQGyJTnPhRFDGdyOjrjeA8de0KyrsxwZ
         8u5FfAHSks5Hh9iWkP/x5S135b5Fhcm7Z56AH826Yf+a6J5CvlTtq+BsAjQGShB2cbUI
         5TsEjGI9FP7p6qNMDqFlakhuHglWXpv1pRdWKU6q8Ee3ghHP6rzBc3twvbbA6VKKvawd
         F9k01R2X4sXhslrwNxXSPClnvnwJ0U5LDG9tycAzI0TPml1WTiHrGIFpqstDbpmGqL+k
         Uqcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="nq/+f78s";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=dXtNMA+s;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id e10-20020a5d6d0a000000b002bc1b7742f2si14689806wrq.326.2023.01.18.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:24 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="nq/+f78s";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=dXtNMA+s;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D86543EEAC;
	Wed, 18 Jan 2023 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tOh9TckU1sSiBRvgWZve0VSfKbLt2OgigIgHgjgUZvE=;
	b=nq/+f78szrdAFXTcDToqe9jO+EZZ3O9GFMjBMD6nsKlyMJU+/ciWkXk3WNBt2FfYWUtsZ5
	YD1kEETIpnsXY62Xtv2H86yarJTqBakC0iig1huKaNzYeA+2jkK3fwk+PO3EoZn4kfj0hf
	+ISI4rxDjulWJe4GuzNJ9MHygxbwP3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tOh9TckU1sSiBRvgWZve0VSfKbLt2OgigIgHgjgUZvE=;
	b=dXtNMA+skFoHz2bz5J+AOppBjAVfv9ZKYYHk2lez+nIkR8a1f5GXkPY0j0fyZOpUNlwjgM
	TMq3dW7ZBbzig5AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39656139D2;
	Wed, 18 Jan 2023 19:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 89j0AHFKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:21 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Date: Wed, 18 Jan 2023 16:34:58 -0300
Message-Id: <20230118193518.26433-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2IUly7shlbes

These are the already reviewed patches from the first half of my
previous series:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

This unbreaks the --disable-tcg build, but there are issues in runtime
that are still being hashed out in the other series.

For the build _with_ TCG, this should behave the same as master.

Based on Richard's "target/arm: Introduce aarch64_set_svcr":
https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

Claudio Fontana (5):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory

Fabiano Rosas (15):
  target/arm: Move PC alignment check
  target/arm: Move cpregs code out of cpu.h
  target/arm: Move cpregs code into cpregs.c
  target/arm: Move define_debug_regs() to cpregs.c
  target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Don't access TCG code when debugging with KVM
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: Move cortex sysregs into cpregs.c
  tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg

 MAINTAINERS                             |    1 +
 hw/arm/boot.c                           |    6 +-
 hw/intc/armv7m_nvic.c                   |   20 +-
 include/exec/cpu-defs.h                 |    6 +
 target/arm/arm-powerctl.c               |    7 +-
 target/arm/cpregs.c                     | 9533 +++++++++++++++++++++++
 target/arm/cpregs.h                     |  104 +
 target/arm/cpu.c                        |    9 +-
 target/arm/cpu.h                        |   91 -
 target/arm/cpu64.c                      |    1 +
 target/arm/cpu_tcg.c                    |   59 -
 target/arm/helper.c                     | 9461 +---------------------
 target/arm/internals.h                  |   38 +-
 target/arm/machine.c                    |   30 +-
 target/arm/meson.build                  |   48 +-
 target/arm/ptw.c                        |    4 +
 target/arm/tcg-stubs.c                  |   27 +
 target/arm/{ => tcg}/a32-uncond.decode  |    0
 target/arm/{ => tcg}/a32.decode         |    0
 target/arm/{ => tcg}/crypto_helper.c    |    0
 target/arm/{ => tcg}/debug_helper.c     |  367 -
 target/arm/{ => tcg}/helper-a64.c       |    0
 target/arm/tcg/hflags.c                 |  370 +
 target/arm/{ => tcg}/iwmmxt_helper.c    |    0
 target/arm/{ => tcg}/m-nocp.decode      |    0
 target/arm/{ => tcg}/m_helper.c         |    0
 target/arm/tcg/meson.build              |   51 +
 target/arm/{ => tcg}/mte_helper.c       |    0
 target/arm/{ => tcg}/mve.decode         |    0
 target/arm/{ => tcg}/mve_helper.c       |    0
 target/arm/{ => tcg}/neon-dp.decode     |    0
 target/arm/{ => tcg}/neon-ls.decode     |    0
 target/arm/{ => tcg}/neon-shared.decode |    0
 target/arm/{ => tcg}/neon_helper.c      |    0
 target/arm/{ => tcg}/op_helper.c        |    0
 target/arm/{ => tcg}/pauth_helper.c     |    0
 target/arm/{ => tcg}/psci.c             |    0
 target/arm/{ => tcg}/sme-fa64.decode    |    0
 target/arm/{ => tcg}/sme.decode         |    0
 target/arm/{ => tcg}/sme_helper.c       |    0
 target/arm/{ => tcg}/sve.decode         |    0
 target/arm/{ => tcg}/sve_helper.c       |    0
 target/arm/{ => tcg}/t16.decode         |    0
 target/arm/{ => tcg}/t32.decode         |    0
 target/arm/{ => tcg}/tlb_helper.c       |   18 -
 target/arm/{ => tcg}/translate-a64.c    |    0
 target/arm/{ => tcg}/translate-a64.h    |    0
 target/arm/{ => tcg}/translate-m-nocp.c |    0
 target/arm/{ => tcg}/translate-mve.c    |    0
 target/arm/{ => tcg}/translate-neon.c   |    0
 target/arm/{ => tcg}/translate-sme.c    |    0
 target/arm/{ => tcg}/translate-sve.c    |    0
 target/arm/{ => tcg}/translate-vfp.c    |    0
 target/arm/{ => tcg}/translate.c        |    0
 target/arm/{ => tcg}/translate.h        |    0
 target/arm/{ => tcg}/vec_helper.c       |    0
 target/arm/{ => tcg}/vec_internal.h     |    0
 target/arm/{ => tcg}/vfp-uncond.decode  |    0
 target/arm/{ => tcg}/vfp.decode         |    0
 target/arm/trace-events                 |    2 +-
 tests/avocado/avocado_qemu/__init__.py  |    4 +
 tests/avocado/boot_linux_console.py     |    1 +
 tests/avocado/reverse_debugging.py      |    8 +
 tests/qtest/meson.build                 |    4 +-
 64 files changed, 10210 insertions(+), 10060 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (63%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 create mode 100644 target/arm/tcg/hflags.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 create mode 100644 target/arm/tcg/meson.build
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/mve_helper.c (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/psci.c (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sme_helper.c (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (94%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

-- 
2.35.3
