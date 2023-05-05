Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp383755ejq;
        Fri, 5 May 2023 05:35:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5GKCZoN0Tfs39LuwKLHf84MEhJ1Tahip3vzg8sF2F2veQLR4aaz2KseqIk+4hdo26EArrS
X-Received: by 2002:a5d:4e4f:0:b0:2f4:30ee:310b with SMTP id r15-20020a5d4e4f000000b002f430ee310bmr1350398wrt.26.1683290129907;
        Fri, 05 May 2023 05:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683290129; cv=none;
        d=google.com; s=arc-20160816;
        b=dIPHGLPc2bVWWu26giJQgGTtyiS1iBbNEw36PpOiXdU4a6zShurOkeiBqczT0rLXuR
         DMbFLMjypsC2dL7By60Yp91Dk0j+/KqfCOebDVRoX6QCGaBT4hec7OLap8/c4oFzGLga
         O9rsdNEam01qwTpjDMHF7+MvozD0M3lOxwK47IOgydzKcCngEgIEhdFLX4dcKiXghjnK
         DyjehGr5sIs+dNPAuMj1FHIghlJGvkCEDsA1BoscgrAG9NjJYTk4OwjDyiosulKsCxTd
         8qlOI3dwPLpCs+rw0TaXJ/kpdIY1KCBiU566TG1M7rAUsMhtGm/MfkTy/YViWrIUpdPv
         Cc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=HzjcJoll4B5xFSKfI7iPIVut4n/G+FBvDwZtC5WuS6A=;
        b=GDzGo7gA7kNwkwq1TnYpV3JyyJrDv0r0PTnW35hj91NWPOlCVMbzl1fIuNnBDDOImN
         /qntOqFUHLusWIYMP/5kfwgOBe4DKt5AP5STiN1wp3ljgVAUbPfre8dQUC9SGy57Xfip
         cOEyvGNm1EBeM1mB1fGlY2j2bBqwOMNf4cDEsEf7x4f7EUTSChjEq2yV6Yha2lZAxO3u
         qdJE0VGWIM5JqKB661hhLhdi2TtsKhdMTerMqzgMvVCCtaFVD0J1a79DtnroknsXbnbQ
         18UMM90bz8IILjSYmrjnUN3UDr2IaIgdVaEgByTGHfLIfyBzi7rBvgtcx12beqq1DTwp
         xT7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=KDmY29WM;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id e8-20020adfdbc8000000b002f72ddf30absi1071254wrj.707.2023.05.05.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=KDmY29WM;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1242B22AE6;
	Fri,  5 May 2023 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683290129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HzjcJoll4B5xFSKfI7iPIVut4n/G+FBvDwZtC5WuS6A=;
	b=KDmY29WMLX+Ok/cRES7yRthSt5FbJpDlQGQVrR/0tE2C29D7z62WnHhpQRmH3c+xgKJ7Dw
	cAF0ltFAyL2vw1W2EpKACzlpKHSRnVFkqlRIiJVzciDQyJo6rhH1bp0opmxLVO6M7ExRMc
	30WXkDazfOuvLsXQH6aBOwOHqN/uxyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683290129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HzjcJoll4B5xFSKfI7iPIVut4n/G+FBvDwZtC5WuS6A=;
	b=1YpO36J/BCqCDv8d3GyMsdkmpFsUe3sVkVikfbnEKJUt3OYLvR0aR2RVuTGCLWUhu+erlC
	QjSVato9WxtFOFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0205713513;
	Fri,  5 May 2023 12:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8TyjLg74VGTaOgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/3] target/arm: disable-tcg and without-default-devices fixes
Date: Fri,  5 May 2023 09:35:21 -0300
Message-Id: <20230505123524.23401-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7AtNoaGsYVjc

Since v1:

Used the 'select if TCG' pattern for both build issues.

We don't want to use imply for semihosting because we'd need to
unpoison* CONFIG_SEMIHOSTING and include CONFIG_DEVICES from helper.c
when building with '--enable-tcg --without-default-devices'.

*- I see the config at build/config-poison.h but the compiler does not
   complain about the usage. It just gets ignored. Any idea why?

CI run: https://gitlab.com/farosas/qemu/-/pipelines/857704454

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
  tests/qtest: Don't run cdrom tests if no accelerator is present

 target/arm/Kconfig       | 9 ++-------
 tests/qtest/cdrom-test.c | 5 +++++
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.35.3
