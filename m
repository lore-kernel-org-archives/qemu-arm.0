Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3058703ejm;
        Wed, 3 May 2023 12:38:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43b8eOp+NphbAwy2mPn8rney7zvPSBaVtvTPvoq6swz6rJpc6YSM9dYPw3Pi1bRL4phdAt
X-Received: by 2002:adf:f98b:0:b0:306:2c39:5d52 with SMTP id f11-20020adff98b000000b003062c395d52mr826260wrr.57.1683142718695;
        Wed, 03 May 2023 12:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683142718; cv=none;
        d=google.com; s=arc-20160816;
        b=K2jsc2B+yvuANHkGjh8tTrqs8Tcm9EUpxyfQ/NUlx4spTFjzB88odU6vahvX78PJQI
         +RbL4j4mAwKS4azhLm0SNalx+lJmnVUF5pvPMKHKvHwFCZViB2XUR5ZoC7/d28xI40fe
         mLZMxIJDQoxPE1nph1cvACl/gatV/xoUBhRKU+4RNhSiE5ejvbJzB3GWbtA/CaEF11ey
         CWeF8NhiJgcGXO6f9Vp2G+P6x9Zyx3amV8Wpy57GsN4B1wTWKJJYtdzB2ZrKdTi9w8T0
         jwZMp+bEzMJ+Oyvn5JjUsE7XoQpk9rGygaVldys7tHKzLuvVT5wb6CO2mLxxY1eaXkpr
         M1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=UKbydkf8tEevwnM9EJLqnc1oN0PgR9mzrT/VWdFlVl4=;
        b=ZUrMa6cJBxbB0zZmal6g4EwCb/zxYfnKbmqMAljDNHWb1RPXUm8NSWb/cKJdaLWsjo
         eqr/OY9H+t37Fhev+itVGbGPjN/I46aVd6oTFRkdE6mmRYj/nG6NfP9+Hs2S+6QXYKAO
         6UBFY9j/5qkXdohmbFXakaeikxEyyKm9tHPxjC3wTriZpZ+MHef/FAFf6m/VZqke1EJ2
         xawVkIr4Q8Sh3cpv7y75FqV19Ta8PJdqV6k20Rx2HRI/184BFpVueyM3snxc/SruL1fj
         BNIFINv6tQY466zh1Ung9DWeboRDnKhaMlrC8TBeu5MKNNNIpCl5AijPTBM0p3Q2qG2j
         1MVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JJ9Lgc93;
       dkim=neutral (no key) header.i=@suse.de header.b="e/I11Jct";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id r11-20020a056000014b00b003063073f0d3si3869640wrx.759.2023.05.03.12.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 12:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JJ9Lgc93;
       dkim=neutral (no key) header.i=@suse.de header.b="e/I11Jct";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 03F96206A5;
	Wed,  3 May 2023 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683142718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UKbydkf8tEevwnM9EJLqnc1oN0PgR9mzrT/VWdFlVl4=;
	b=JJ9Lgc93L9qdotqE3u77hgnplbeUP1+OreeTelfGOx3hpdScKO8EiJWij2CAZffOmZGMR3
	ByA690EkndczurLmr6zf0stvHUN+y1we7kCL+0HTCjxvCZnTT1sz40Vp+7uzQpNH4YVADN
	lHDWyKGztQ2MufRQH2TQv7QXX6em35M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683142718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UKbydkf8tEevwnM9EJLqnc1oN0PgR9mzrT/VWdFlVl4=;
	b=e/I11JctZ+EeqJj/KB/vcBv0AvBekezqQyHlvq88oXVYLOcQlvqnYdy01dE8Cr+LqeQivm
	oJtliA+Kl5GPqlCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C0DC1331F;
	Wed,  3 May 2023 19:38:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 19gpOTu4UmTNYQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 03 May 2023 19:38:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/3] target/arm: disable-tcg and without-default-devices fixes
Date: Wed,  3 May 2023 16:38:30 -0300
Message-Id: <20230503193833.29047-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 62bkGg6zGmPf

Here's the fix for the cdrom test failure that we discussed in the
list, plus 2 fixes for the ---without-default-devices build.

When I moved the boards CONFIGs from default.mak to Kconfig, it became
possible (due to --without-default-devices) to disable the CONFIGs for
all the boards that require ARM_V7M. That breaks the build because
ARM_V7M is required to be always set.

Fabiano Rosas (3):
  target/arm: Use CONFIG_SEMIHOSTING instead of TCG for semihosting
  target/arm: Add CONFIG_ARM_V7M back to default.mak
  tests/qtest: Don't run cdrom tests if no accelerator is present

 configs/devices/arm-softmmu/default.mak | 1 +
 target/arm/helper.c                     | 4 ++--
 target/arm/tcg/m_helper.c               | 2 +-
 tests/qtest/cdrom-test.c                | 5 +++++
 4 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.35.3
