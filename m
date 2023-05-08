Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2220068ejq;
        Mon, 8 May 2023 11:16:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sIN3YWpa125jkbSzVzDdCwC0yU1OwE4pmAGXlkryeEV0ty3JGb3xZh787GYnHkPIaA6L0
X-Received: by 2002:a5d:4101:0:b0:306:2c43:7255 with SMTP id l1-20020a5d4101000000b003062c437255mr8354658wrp.35.1683569777129;
        Mon, 08 May 2023 11:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683569777; cv=none;
        d=google.com; s=arc-20160816;
        b=hOlKj2eYeV5GPiVCHXsHOY5KUFgJZgDC2mhI0BamkaUDYgoLjTdTv86d9EK4zzKHbv
         nRhpaW863TqjVV0W+hOoGhl9aVM2pQSibjIG09bMO0oxaqzYwuI5C3HyttWy1sobEtGS
         LwbK4okjEJNl0S3JzS+8XvW5YYxe7TnzDzjt7r901kSEUOx4zO/uCewdGIACrwjT5ifh
         kV1vtWRRj/R4A3OPMB0hvqsngAxvcasilsty8RdJqUxm12oqfcGVSWmkx8Uqw3wDP1rO
         W1qVxpX95czLXVcFmZN1mj1A626uiZ4I+E9KX0BZfYQrQdX+HZIcPZUdKXCJctq8Mpmn
         NYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=r4LoEYLWUK2QZ3xHcrNcaHu1sfKizQ/QB0rWonEISkE=;
        b=RVhc1ybYp0zoUMEPB1k96VLPM/tMsMK5AbKrV0KurFhvUJIXQBf3iiGTinqyJrmdsq
         8Sa7eXK6kx5GRDWg3zXEdymX7V/bbhHt9r1mq5XriXCqjTGB4xhK68irTatkMulbCc2x
         TtznrKzbln2idQbL3dzjhqmmauZbmqXLTCr9MqMi/nzONRFYKk9l/PxtESrnt+YUiLd7
         +XRHm0Gzx8PYteszv535thyBSZGc9vqMf0V1ucTgjIAU2Xj0Svj/D0pdSx638Bq/5mMl
         RlxzRlhzjolmd9SvZ9ydzRMzfcf3XSBLxFCZRwORfYJCoar53KqNyI67n00r6ocl+Y5h
         VVLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NWdjf2QK;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id r13-20020adff10d000000b003062df6aa7asi4740093wro.409.2023.05.08.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 11:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NWdjf2QK;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 82B201FF6A;
	Mon,  8 May 2023 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683569776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=r4LoEYLWUK2QZ3xHcrNcaHu1sfKizQ/QB0rWonEISkE=;
	b=NWdjf2QKLULkWKyI4FxB8IYJawv7Dg9qDe8MHtRMen6Vg67H0KnhY76rlz0Cz8g5N7W+BZ
	i9vDHqNCx6+KXxQFgHYY1tTkH778aUqaL6RydH+9MKKeWIhQ7jW2VAo6g6fMSxLbwGGRZT
	d9uHiZfg/ZZoOCuY3JEGWoGNP2C6Vus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683569776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=r4LoEYLWUK2QZ3xHcrNcaHu1sfKizQ/QB0rWonEISkE=;
	b=f7xM6ri51AmOjqqpSXW63QGykbcNh2NEFP2n7vEW26qcMY1MuR/fuR4DDICVgFY3mRrEy6
	Iys6sPV98e4S92CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30C8C1346B;
	Mon,  8 May 2023 18:16:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id S5jKOW08WWSIdwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 08 May 2023 18:16:13 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 0/3] target/arm: disable-tcg and without-default-devices fixes
Date: Mon,  8 May 2023 15:16:08 -0300
Message-Id: <20230508181611.2621-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TsiWBaid2GB+

Changed the cdrom test to apply to only the x86 and s390x cdrom boot
tests.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/860488769

v2:
https://lore.kernel.org/r/20230505123524.23401-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230503193833.29047-1-farosas@suse.de

Here's the fix for the cdrom test failure that we discussed in the
list, plus 2 fixes for the ---without-default-devices build.

When I moved the boards CONFIGs from default.mak to Kconfig, it became
possible (due to --without-default-devices) to disable the CONFIGs for
all the boards that require ARM_V7M. That breaks the build because
ARM_V7M is required to be always set.

Fabiano Rosas (3):
  target/arm: Select SEMIHOSTING when using TCG
  target/arm: Select CONFIG_ARM_V7M when TCG is enabled
  tests/qtest: Don't run cdrom boot tests if no accelerator is present

 target/arm/Kconfig       |  9 ++-------
 tests/qtest/cdrom-test.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.35.3
