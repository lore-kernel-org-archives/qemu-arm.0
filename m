Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345474ejc;
        Thu, 19 Jan 2023 05:56:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5BTmLrdiIev/1jh8tHzhSYLljPBbtRvDf7vIJuyR/A5mFkjjImOUu3af3U28Tt1bC533C
X-Received: by 2002:a05:6402:1c84:b0:49c:d353:8237 with SMTP id cy4-20020a0564021c8400b0049cd3538237mr9945491edb.42.1674136590486;
        Thu, 19 Jan 2023 05:56:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136590; cv=none;
        d=google.com; s=arc-20160816;
        b=jWD6IHpJxbcSA/jPsT5DIv9R3u2Z2BctoW/RXBSXBu4n6UudnDr6j02rHX2EOrV+Eo
         9kyXFBDjne8pcGbYqIJIS/FpoAX9ccabGo1gSJzbIkK/bM5KoqMCKZepmNErLbGf6l9m
         6/MeXciE3GFQ2EUfFsXCwcL/7LnIBKEgLqLREA3wMWBsyCWR6E82yRNJa25UrszcYH3c
         ZyGg7mk5REQAw6dge9HhF8vVZDgoh0p6VvXakQZ6kREKoYJAstaV27tvkU1jBo58tip3
         U41/DZ3i/uwxVtV5OsZyeilvdePWe/z1QwrthzV0B98a0B9WK3x7kVij0X96wme7fdFY
         Mnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=oliGwYKP5xIhh4SI6Oq8VhV0YNuZWeeVtWzQPSGl6b0=;
        b=gVy31uUTf6av1znoxTukWc03+rZtg8ecQ4zS3yR6XV8CKCLrYpujH0lpzvoeHlBViv
         AAX7sdPWnl/7A/oTUdfagzoDnvom8aTtQOYWlz4MglpSXJ5ro02kFl5oh7YxKC+KFlPN
         UUdPoktMgm7b3NG18LlOLDqzDoqSMDdT1TltUjdNoM3aPKZpjXK8zdKok8jb9Jw4IXe+
         zRKdyF0C5SBlF8kv6kyvK4y9WWGRu8IauSHK8z5dtv3+NoSahprN8LqEj7TJZcmT46XX
         biXMpJbXEjY/cQ3GR5BsJkxtM3cvxowO1mgUHZ6WdZ0K8G94tOUpvKVk/Ji5GPP0Nfgz
         QyPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wR+Aqq8m;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id i9-20020a05640242c900b0048ee2e45defsi51382823edc.288.2023.01.19.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:30 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wR+Aqq8m;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D88E05CE73;
	Thu, 19 Jan 2023 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oliGwYKP5xIhh4SI6Oq8VhV0YNuZWeeVtWzQPSGl6b0=;
	b=wR+Aqq8mkFVPhMQ1S0rg+C3v3sfrQRb+zrbZY85kkgWu6jCQtNudQTAXtJePxqyvU5CgXF
	2aIXZCCYSabb3O3/yOEI4AqgVCGNPZ4dwDKe+qGQNyOso3k75+0vvhxQ/rofLs9+W5Q9sm
	NH1pDTkoIGUrFhh4QKQ9c6KdMe6UD4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oliGwYKP5xIhh4SI6Oq8VhV0YNuZWeeVtWzQPSGl6b0=;
	b=Qy54Pl/I6Sq4WqKYlb63OPpWHYxbKc64xF8ij//kXDpWpaixZMynwf7/tf3fTtFh6iEQIo
	bRQV/4pYBvWP0hBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CADBE134F5;
	Thu, 19 Jan 2023 13:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id S8eqIwpMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:26 +0000
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
Subject: [RFC PATCH v4 00/15] target/arm: Allow CONFIG_TCG=n builds
Date: Thu, 19 Jan 2023 10:54:09 -0300
Message-Id: <20230119135424.5417-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yeEPWoEBYYE5

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

Based on "target/arm: CONFIG_TCG=n part 1":
https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de

Since v3:

Aside from minor review comments, the larger changes in this version
are:

- The split of 64-bit CPUs into tcg/cpu64.c. I have moved everything
  aside from the cortex-a53 and cortex-a57 cpus which could in theory
  be used with KVM.

- qtest vs. default cpu. By removing the default CPU for KVM we now
  need to make sure the tests pass a -cpu option.

  I don't think allowing tests without -cpu would be feasible because
  we'd have to go searching for every piece of code that assumes a cpu
  is always present.

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (1):
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (14):
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Remove default cpu for KVM-only builds
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  tests/qtest: Add qtest_get_machine_args
  tests/qtest: Adjust qom-test to always set a -cpu option
  tests/qtest: Adjust test-hmp to always pass -cpu option
  tests/qtest: Adjust device-introspect-test to always set a -cpu option
  tests/qtest: aarch64: Set -cpu for numa-test
  tests/qemu-iotests: Allow passing a -cpu option in the QEMU cmdline
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

 configs/devices/aarch64-softmmu/default.mak |   4 -
 configs/devices/arm-softmmu/default.mak     |  39 --
 configure                                   |   6 +-
 hw/arm/Kconfig                              |  43 +-
 hw/arm/virt.c                               |   9 +
 target/arm/Kconfig                          |   7 +
 target/arm/cpu64.c                          | 633 +------------------
 target/arm/internals.h                      |   4 +
 target/arm/meson.build                      |   1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  13 +-
 target/arm/tcg/cpu64.c                      | 654 ++++++++++++++++++++
 target/arm/tcg/meson.build                  |   2 +
 tests/avocado/migration.py                  |  11 +-
 tests/qemu-iotests/testenv.py               |   7 +
 tests/qtest/arm-cpu-features.c              |  34 +-
 tests/qtest/device-introspect-test.c        |  17 +-
 tests/qtest/libqtest.c                      |  99 +++
 tests/qtest/libqtest.h                      |  11 +
 tests/qtest/meson.build                     |  12 +-
 tests/qtest/numa-test.c                     |   1 +
 tests/qtest/qom-test.c                      |  19 +-
 tests/qtest/test-hmp.c                      |  34 +-
 22 files changed, 960 insertions(+), 700 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3
