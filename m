Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp383819ejq;
        Fri, 5 May 2023 05:35:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79tN3e5VnRpzeCPrVrZxCxgr74tBpl3HpDz45k2Jm8EzMysdUrD9bHkhfO1SzVj2tfYnnJ
X-Received: by 2002:a5d:604e:0:b0:2f6:9bc4:76f1 with SMTP id j14-20020a5d604e000000b002f69bc476f1mr1380638wrt.1.1683290134350;
        Fri, 05 May 2023 05:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683290134; cv=none;
        d=google.com; s=arc-20160816;
        b=TH2imsWucOL1eSsbJIZCSThLHkyB6wHwGh1C4T+gq+hGdus9hU2z9b/3yF+WiQKvNn
         OLIBV5TO7j77Mx68aL650xLgBQXPN0o3wcc+5vb+TgBtSTKX0e5YoxzjGDlB7Eu3jIiE
         NoPNOMs5DovQk0oQ7yIbLHJThwsruHJVkoNvQQl5jcAvFGLhGECDWda3RO5klVYyZmZ1
         661wBjUmykWFo0vCpFgI3kUlHs6Nyc0iUaqvkqOUiyMw2mfjWGotkShmPPvtfn/uksiN
         rQrw73sIBhJ4l1WoAnUxFW8i92mo+yzrMSlN7DD2xvExkQprt1Q8FCXE58LPeWetFi3p
         R6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
        b=fxaG3bghG1AAlPwzYi0PpgM2nYLTrMEabkXDt17cOEth3WXQ8Wlwu+lf7d72nS7rP2
         YA29pGItufuKVmzYqTcbDGj3A5GZt/RcMakSb/9TR7IOk0duA8BpFsEDEZJCzxZpowQk
         7h0l1CGCd8pSMVpBcoUEba7oCBRkd/Fq0/Gd0CzxDCvleWF4DjnWRUZW8Xqa92wQKg0B
         87NbE7pktqipTmuruxCTuncZZoYkJVhXXfPbdDpOODtcj5e/G1LeaCZoV2iRoeJt74I+
         XIdcRHI58LJ0xno3wvIjILKzmSMxak3wKSUmmQYYH9++42cqw5qZdkEHU2nb7Md9rKvq
         rA8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pvbs+270;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=AQ2H282z;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id m6-20020adfe946000000b002e9bc48eec6si1020213wrn.212.2023.05.05.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pvbs+270;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=AQ2H282z;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C1E822AE2;
	Fri,  5 May 2023 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683290134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
	b=pvbs+270X86deJmnBRjBI+wvDQWUq8ok83Vn3GYYl8ne9tEpqfxxAzh1ajzEeznXHvNpQ8
	8OKwpP8coz+dbuT//q00jX212i2AsGlvdKANF50IHl5pg7N+K/84LlzMevmdDmrqxhlHsO
	EsURlBBm03qLjbmJH905Afay2zgFaww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683290134;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
	b=AQ2H282z6/CEIg3hWgoA8t1xRCn4ShmOeo/jFoRdSn27Ms4SQpigpghqy/3Etc386/LmfH
	s3UWB7W5/4XDxDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 026F913513;
	Fri,  5 May 2023 12:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aFrcLhP4VGTaOgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:31 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is enabled
Date: Fri,  5 May 2023 09:35:23 -0300
Message-Id: <20230505123524.23401-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230505123524.23401-1-farosas@suse.de>
References: <20230505123524.23401-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nd/ewr3v7On7

We cannot allow this config to be disabled at the moment as not all of
the relevant code is protected by it.

Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
is now possible that nothing selects ARM_V7M (e.g. when doing a
--without-default-devices build).

Return the CONFIG_ARM_V7M entry to a state where it is always selected
whenever TCG is available.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3fffdcb61b..5947366f6e 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,6 +1,7 @@
 config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
+    select ARM_V7M if TCG
 
 config AARCH64
     bool
-- 
2.35.3
