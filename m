Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305296ejb;
        Wed, 4 Jan 2023 14:00:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5NXJuAfipmbLMq017N4I9e1QlqZ34DnR9htAy8TD2hLNArGaUVIsonAfOrQumXCiVU8O9
X-Received: by 2002:adf:ee88:0:b0:272:893f:e70f with SMTP id b8-20020adfee88000000b00272893fe70fmr28740008wro.63.1672869641821;
        Wed, 04 Jan 2023 14:00:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869641; cv=none;
        d=google.com; s=arc-20160816;
        b=RFKkuhuMZ+vU157MK/xAPDFgnV0o7FQib2/3/99OdXzz3+szA+t+XukAKm4TdjAWQv
         SZSFBOnHVd7/+pwMOSa6KkNrKZQ1NEkkwoMFD69x6gejIMC9uL1Fl1Nz5LIsanOBWxfk
         aywjUdK/7rL2bj+zkugaQhDC7kT+1XvFPhlQ84ZLICF1Uzr8YCV74/VWTAFHhRZFDe3h
         +8vs90NnQ+M1qQjkCOkRQjb98Ic1KVXQLc5N/71ZA9D01DNsgpr099qWrGMs81R87R5c
         Pb+43VgCSjr+JMdnvRoYDhg27k0TclSgEKF/z4d2ZcXDqYKvhHIFmj/reHRw/1wKShQz
         33Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=jQyvzVyepOLFufWtChEgKriFOqzyRYhrNUetb0Ptorg=;
        b=uucL98Cx8O6dHyeC0vzLyXluVxuWL+4UjOIUSya5ufgmyOHBGDlm9NCauJvegjjJHn
         3GJo02SIedeNVXsYFc25Oo8/7NP+EzmyX4o9rrXkrLw8VIZMhSosus4CtlUlXpgPovzD
         JHT/apAlavBklYj2uKuR3n+Q2yZJQFspXjbxT6NDreq+d4COp7EXFbU1dsmEmb9VFWQt
         BXjHwrgySMSqnXGxCbhTy+I/XRqWeudpz4OQsBMjRj144Sn6+mCqLUX9BBxfM+pWEvL9
         z/YX5dy4ouvN5sWif7ZIrUWhzqGWJtjMP8wZoSRGdGvBilYRDPWm7KrpCwgVxuW46rxm
         MVUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=AR7SVmMV;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id g11-20020a5d64eb000000b002a1879fba14si2938830wri.1003.2023.01.04.14.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:00:41 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=AR7SVmMV;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 12C5C3EF48;
	Wed,  4 Jan 2023 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jQyvzVyepOLFufWtChEgKriFOqzyRYhrNUetb0Ptorg=;
	b=AR7SVmMVanZU0NM3oUll5hLe2y+wWIsSBcYwoXML1IxG16xT9uwuchRYQT+3phA8foFf4Q
	4drEs6GLm3wsde0qjRCqpz/23FOEKwSEtgGzF9cpr9dpO15K7dTt9Q/YgFHdZn8XyppZ6U
	d2uvx5PtKLoT8ovQgdjF3eiANl/7TlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jQyvzVyepOLFufWtChEgKriFOqzyRYhrNUetb0Ptorg=;
	b=dzZn7gYuDR28W/0Eabeibbj2tTwlNvsiUn7vxIgLlDBXMWcze+foswKE/E7fL6a3sJ5S2j
	U/OXFKGUDMP/2TCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 488081342C;
	Wed,  4 Jan 2023 22:00:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zKdhBAb3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:38 +0000
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
Subject: [RFC PATCH 00/27] target/arm: Allow CONFIG_TCG=n builds
Date: Wed,  4 Jan 2023 18:58:08 -0300
Message-Id: <20230104215835.24692-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2JHfSJsYmIrX

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

I have included the other two already reviewed series to facilitate
the merge. Patch 12 is the first from this series proper.

I could use some help with the last two patches which deal with the
fact that ptw.c needs CPUTLBEntryFull and probe_access_full which are
_currently_ only compiled with CONFIG_TCG=y.

The 3 cpregs patches were split from the larger commit[1] from the
original series. We're still left with one huge patch, but it is only
code movement, it can be checked with:

diff -u <(sed -n 's/^-//p' patch) <(sed -n 's/^\+//p' patch)

1- [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
   https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de

Claudio Fontana (12):
  target/arm: cleanup cpu includes
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: only perform TCG cpu and machine inits if TCG enabled
  target/arm: move translate modules to tcg/
  target/arm: move helpers to tcg/
  target/arm: only build psci for TCG
  target/arm: make further preparation for the exception code to move
  tests: do not run test-hmp on all machines for ARM KVM-only
  tests: do not run qom-test on all machines for ARM KVM-only
  tests: device-introspect-test: cope with ARM TCG-only devices

Fabiano Rosas (15):
  target/arm: Fix checkpatch comment style warnings in helper.c
  target/arm: Fix checkpatch space errors in helper.c
  target/arm: Fix checkpatch brace errors in helper.c
  target/arm: Remove unused includes from m_helper.c
  target/arm: Remove unused includes from helper.c
  target/arm: Move PC alignment check
  target/arm: Add tcg/meson.build
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Extract cpustate list manipulation to a file
  target/arm: Move cpregs code out of cpu.h
  target/arm: Move common cpregs code into a separate file
  target/arm: Move cpregs definitions into tcg/cpregs.c
  target/arm: Move hflags code into the tcg directory
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: don't access TCG code when debugging with KVM

 MAINTAINERS                             |    1 +
 hw/arm/boot.c                           |    5 +-
 include/exec/cpu-defs.h                 |    6 +
 target/arm/arm-powerctl.c               |    8 +-
 target/arm/cpregs.c                     |  482 ++
 target/arm/cpregs.h                     |  103 +
 target/arm/cpu.c                        |   33 +-
 target/arm/cpu.h                        |   91 -
 target/arm/cpu64.c                      |    6 -
 target/arm/cpustate-list.c              |  148 +
 target/arm/helper.c                     | 9132 +----------------------
 target/arm/internals.h                  |   20 +-
 target/arm/kvm.c                        |   18 +-
 target/arm/kvm_arm.h                    |    3 +-
 target/arm/machine.c                    |   58 +-
 target/arm/meson.build                  |   49 +-
 target/arm/ptw.c                        |    4 +
 target/arm/tcg-stubs.c                  |   37 +
 target/arm/{ => tcg}/a32-uncond.decode  |    0
 target/arm/{ => tcg}/a32.decode         |    0
 target/arm/tcg/cpregs.c                 | 8088 ++++++++++++++++++++
 target/arm/{ => tcg}/crypto_helper.c    |    0
 target/arm/{ => tcg}/debug_helper.c     |    0
 target/arm/{ => tcg}/helper-a64.c       |    0
 target/arm/tcg/hflags.c                 |  344 +
 target/arm/{ => tcg}/iwmmxt_helper.c    |    0
 target/arm/{ => tcg}/m-nocp.decode      |    0
 target/arm/{ => tcg}/m_helper.c         |   16 -
 target/arm/tcg/meson.build              |   52 +
 target/arm/{ => tcg}/mte_helper.c       |    0
 target/arm/{ => tcg}/mve.decode         |    0
 target/arm/{ => tcg}/mve_helper.c       |    0
 target/arm/{ => tcg}/neon-dp.decode     |    0
 target/arm/{ => tcg}/neon-ls.decode     |    0
 target/arm/{ => tcg}/neon-shared.decode |    0
 target/arm/{ => tcg}/neon_helper.c      |    0
 target/arm/{ => tcg}/op_helper.c        |    1 +
 target/arm/{ => tcg}/pauth_helper.c     |    0
 target/arm/{ => tcg}/psci.c             |    0
 target/arm/{ => tcg}/sme-fa64.decode    |    0
 target/arm/{ => tcg}/sme.decode         |    0
 target/arm/{ => tcg}/sme_helper.c       |    0
 target/arm/{ => tcg}/sve.decode         |    0
 target/arm/{ => tcg}/sve_helper.c       |    0
 target/arm/{ => tcg}/t16.decode         |    0
 target/arm/{ => tcg}/t32.decode         |    0
 target/arm/{ => tcg}/tlb_helper.c       |   14 -
 target/arm/{ => tcg}/translate-a64.c    |    1 +
 target/arm/{ => tcg}/translate-a64.h    |    0
 target/arm/{ => tcg}/translate-m-nocp.c |    0
 target/arm/{ => tcg}/translate-mve.c    |    0
 target/arm/{ => tcg}/translate-neon.c   |    0
 target/arm/{ => tcg}/translate-sme.c    |    0
 target/arm/{ => tcg}/translate-sve.c    |    0
 target/arm/{ => tcg}/translate-vfp.c    |    0
 target/arm/{ => tcg}/translate.c        |    1 +
 target/arm/{ => tcg}/translate.h        |    0
 target/arm/{ => tcg}/vec_helper.c       |    0
 target/arm/{ => tcg}/vec_internal.h     |    0
 target/arm/{ => tcg}/vfp-uncond.decode  |    0
 target/arm/{ => tcg}/vfp.decode         |    0
 tests/qtest/device-introspect-test.c    |   32 +-
 tests/qtest/qom-test.c                  |   21 +
 tests/qtest/test-hmp.c                  |   21 +
 64 files changed, 9551 insertions(+), 9244 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/cpustate-list.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 create mode 100644 target/arm/tcg/cpregs.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 create mode 100644 target/arm/tcg/hflags.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/m_helper.c (99%)
 create mode 100644 target/arm/tcg/meson.build
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/mve_helper.c (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (99%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/psci.c (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sme_helper.c (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (95%)
 rename target/arm/{ => tcg}/translate-a64.c (99%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (99%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

-- 
2.35.3
