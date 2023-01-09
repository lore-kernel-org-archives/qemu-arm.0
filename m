Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663658ejc;
        Mon, 9 Jan 2023 14:43:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMEXta7+EVB4DSiAKeTrWiZS/fIvEuC108QqbqI84AdXB+Cj9BmkdbjNacMi5ChzOlPbig
X-Received: by 2002:a05:600c:3b26:b0:3d7:fa4a:681b with SMTP id m38-20020a05600c3b2600b003d7fa4a681bmr49908301wms.0.1673304189923;
        Mon, 09 Jan 2023 14:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304189; cv=none;
        d=google.com; s=arc-20160816;
        b=VgbAObFgDmKTrDEAvybpiXkadLRwYFnLUiUywQihrO0pXNfi6p9YZ5mIup7WjxYNhT
         nYPRStJMpCjKG0UVF1qcJMGPWtnJJHf5xCZNblo03jZkrbqQZ3yEffToi/rl9kmE2+pA
         mS3eUkLmXE419qbr5FQfLyu8Hgl/GbQKR2zWEarKjpKH+cMZ/XpqoSpyH0U7PH3U5bvC
         GnmdWKk2B0xthz/0zknlX2H3yAnlFuwBFk2q3EQutxwyqi9DlBMBFIN64boYEbT6/ZW9
         FReCtyE8A+7GNRMocf208X2SRR3trBboupOJmZ7bmjvNSeRZH8zRi5Saa2O7sYVin2AC
         8f6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=s2fBiDJmUaPyNIfgWPRbS/aVGtxHXhf27DnSmH1JgYU=;
        b=Usa6L060OYLsLWd8N+aT4drv5wPFuAUgJfyXLeRJ4Jh4Q+FXhyxDEiVvlwzPjbwxT/
         PSRaC0WnMJCTQX7tm3ZrOhRUGXdMsHFxkeosW+eWCOH5L6qiYlGdn3ongOb36nUr1KjW
         kkpfbSh485yp44aCseBQYcEixDJFNRGnM3D0qoX1RYHbtJsP0XGiFheabzOWY5rXBdFu
         8xARA8Y1dqjCXLCu6AXLgpqWbqK/sE+1kQIil+/6U40+l22dZaBOnCLQwma6cNCUsV+7
         P+hN24cEQ0TykwMSqxyIzHgrT63Wh0G+5D9+UI96oI4hrUKaXriTTesNY9aiX+KUDomT
         M3sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QtXXJ72f;
       dkim=neutral (no key) header.i=@suse.de header.b=QMHGZL8e;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id o12-20020a05600002cc00b0029bf2042354si7569640wry.685.2023.01.09.14.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:09 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QtXXJ72f;
       dkim=neutral (no key) header.i=@suse.de header.b=QMHGZL8e;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97F995CDD9;
	Mon,  9 Jan 2023 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2fBiDJmUaPyNIfgWPRbS/aVGtxHXhf27DnSmH1JgYU=;
	b=QtXXJ72fizud//BFJRx6lmqoxQYii5s9eQkzrBZXS0o1+H0sx2Sf/CNHCx5DNmNhLDdV7y
	SZf7Rh8hjva45WAgsoEpTdyAmTuwmRGxRJreV1DSCFYuMEpkqcRkpyHFiD36q20Jyg7nnn
	oyotXMyRteQqp8m9psva22r3rCcP43Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304188;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2fBiDJmUaPyNIfgWPRbS/aVGtxHXhf27DnSmH1JgYU=;
	b=QMHGZL8e3LrXWO4JFs/JFOpGM9mdkQEnkXdg8GVze7AMDIV7lji0BxqY3Z9XP5olgJ+E9Z
	Sv8Vjdqcb0ETSFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06D7913583;
	Mon,  9 Jan 2023 22:43:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MG2CMHmYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:05 +0000
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
Subject: [RFC PATCH v2 10/19] target/arm: Move psci.c into the tcg directory
Date: Mon,  9 Jan 2023 19:42:23 -0300
Message-Id: <20230109224232.11661-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2C1J82Es570d

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 target/arm/{ => tcg}/psci.c | 0
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 01143a805c..595d22a099 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -22,7 +22,6 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index c27ac2939c..47006f903c 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -44,3 +44,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'sve_helper.c',
 ))
+
+arm_softmmu_ss.add(files(
+  'psci.c',
+))
diff --git a/target/arm/psci.c b/target/arm/tcg/psci.c
similarity index 100%
rename from target/arm/psci.c
rename to target/arm/tcg/psci.c
-- 
2.35.3
