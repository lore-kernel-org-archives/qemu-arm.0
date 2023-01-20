Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303290ejc;
        Fri, 20 Jan 2023 10:50:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumhRetGxXyrdOdxCzlQl1+oDff+5FY0YGNh9diR7YB15+puhJ60HfiPjEJtQg6iaE9Pcxn
X-Received: by 2002:a1c:f310:0:b0:3db:15d9:1485 with SMTP id q16-20020a1cf310000000b003db15d91485mr10017763wmq.39.1674240632116;
        Fri, 20 Jan 2023 10:50:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240632; cv=none;
        d=google.com; s=arc-20160816;
        b=kcRGjMLfz+8ZlOl61yfr9p+UxH1jWFe4PuTURh76oL/8b7/Dc1rUh2LrNKrLanULm1
         zN9xI/3sxkNunn/pBOY48wWbmOMbss9Abwv7p/UGAQdWpyrOmQMwOQPW8CETzdZKdnxz
         +FSuqvJWvDoxkmYC4wCmYKHlcvEApQHJ8x7+zuCbXrfvukLNa3HybJa8wXzrct+BG8OR
         s3bUmE7GNgi06ZwY/r5xtsbn4HP8Wi1GJRm+q1QyJXXZhfW3OyZVExWwpCN3q5rAblPW
         I0HeHDaRBiUo4gdThuudIo7vohZpAuSmVxjsMtpZ469bTpG2kX/SlLVMwAA3BL1UEa9u
         pAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=ZwSxwK1RVrkRcXI3JB+sTN/wZ8lCk0L2hnmiLpHXDBg=;
        b=hjd0vQgKTfjQEmB2doeayY5OYcsY22LegaQ7O2IQGgZCCadoxGV7lyuyswiloWJtaL
         5mwYQXJstMfl/alxrIK/pCf7psIS+ROTOAIzUPyOK1I905HD7rVV6VPz6rwqJ1duX/Yk
         /hOTv+t2TvMw/yNaB/JlncL6KXQ3t4Sjzbsvg35ZMo4Yp1O7i6YMRpJzQKlEdFnSpN+Z
         28cmwXSH2nONSVsMqjbKodD25NZK9ddLGCeC+CUkMb8/HguGtRz7HELqyBCx6ercVbvL
         RfB1az/3JzuY3xchbvXVDymA7/J6SMt4swre8SjibobeCMLHnEmgSY5KARwEyV85P2yt
         4d8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=EoZGLMnu;
       dkim=neutral (no key) header.i=@suse.de header.b=x7EK3zDx;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id n18-20020a05600c305200b003da0f10fceasi2363894wmh.161.2023.01.20.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=EoZGLMnu;
       dkim=neutral (no key) header.i=@suse.de header.b=x7EK3zDx;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 328005FC21;
	Fri, 20 Jan 2023 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZwSxwK1RVrkRcXI3JB+sTN/wZ8lCk0L2hnmiLpHXDBg=;
	b=EoZGLMnumSc1UJa86OvzmlvxeVzT0b+L6OffnfNPuv0EfRKkrQiwmUteo6WhxAErVdGe+M
	KDXz3tWtuXJIgwuyxyoAP10C/GYNKgVrjngr2ZpVZlb7Oz6FVCKK2VJqmBrLZNiuW6YpwT
	yi3QMKVt2x4W+tdlSw/1yghu5vTwpZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZwSxwK1RVrkRcXI3JB+sTN/wZ8lCk0L2hnmiLpHXDBg=;
	b=x7EK3zDx92hL/57BEbpzO9UDId8X4nFvlvojhFDBzCqxm/Ej/OOnjLQIakwjbY0wRP3Pu8
	zCD7QVCGfkZ/kdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B20D1390C;
	Fri, 20 Jan 2023 18:50:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id haMUNHPiymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:27 +0000
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
Subject: [RFC PATCH v5 0/9] target/arm: Allow CONFIG_TCG=n builds
Date: Fri, 20 Jan 2023 15:48:16 -0300
Message-Id: <20230120184825.31626-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DpXQZpJqjpWS

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

Based on "target/arm: CONFIG_TCG=n part 1":
https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de

Since v4:

- Used "max" as the default CPU for KVM-only builds. This allows me to
  drop all the clunky qtest changes and it keeps disabling TCG
  separate from changing cpu defaults.

  I'm neutral towards removing the defaults for arm. We can do that in a
  separate series. It would be nice to make the TCG default equal to the
  non-TCG one. Otherwise we're bound to get reports that "this command
  line used to work" if users switch from: 'CONFIG_TCG=n -accel kvm' to
  'CONFIG_TCG=y -accel kvm' (the latter would try to use the cortex-a15
  as default).

- Move the ifdef around valid_cpus into the patches that move the
  respective cpus. Patches 1 & 2.

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
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Use "max" as default cpu for the virt machine with KVM
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

 configs/devices/aarch64-softmmu/default.mak |   4 -
 configs/devices/arm-softmmu/default.mak     |  39 --
 configure                                   |   6 +-
 hw/arm/Kconfig                              |  43 +-
 hw/arm/virt.c                               |  10 +-
 target/arm/Kconfig                          |   7 +
 target/arm/cpu64.c                          | 632 +------------------
 target/arm/internals.h                      |   4 +
 target/arm/meson.build                      |   1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  13 +-
 target/arm/tcg/cpu64.c                      | 654 ++++++++++++++++++++
 target/arm/tcg/meson.build                  |   2 +
 tests/avocado/migration.py                  |  10 +
 tests/qtest/arm-cpu-features.c              |  34 +-
 tests/qtest/meson.build                     |   4 +-
 15 files changed, 772 insertions(+), 691 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
