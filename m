Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663405ejc;
        Mon, 9 Jan 2023 14:42:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuE+RTBnIbmaMrwyBJnyvvyA8wVEIzaYpmjnNpx7mWuTo52tETwxyQ9QstxKe94I5dnA2Lr
X-Received: by 2002:a5d:5a01:0:b0:2bd:15ef:fe7 with SMTP id bq1-20020a5d5a01000000b002bd15ef0fe7mr75698wrb.3.1673304166873;
        Mon, 09 Jan 2023 14:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304166; cv=none;
        d=google.com; s=arc-20160816;
        b=htfMrI19rZgAGok6F5qtEjUR4suuaWH7omvMlyZFWS8tW1PUU8DxJeWJPzDhp3CzrM
         AoCL9iOhlSM7gzWnUkWyVnuVzKwaf/LJlbVV53xx7yXMqYmNPZ7mkUb9fjVhxzIeGB6o
         n5q4r0PybqlWwLkTdDatuFrSwOPi/D+tR6LEkZ783KBkLPGo4V9QvTX7Qi0qgvoY1JyC
         kwTB0MOTDF6y0YBeoI95jTdF4toDDecX+OW3c4FTWaTPaFG1wJxyOywlnuAAsWGiIfSV
         1eGmruJ53zsAXqe91B141ImzYm/JciCAzs5f5lWXpAlKLPKS0sjavRmgT8oFm7h+y/dz
         ov0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=h3KkNITzSs94Fyk0YxMQd+TgFbMPFMYrLs7cwANF9j0=;
        b=kn4a8+QYuU4pRVXV9lDSo3980kTojomRfTT66knep15jCm/HMnpkl2kEff1URLgUzZ
         uHtKkhuo/oT7C1QeVhy3maqTFheGV+7U8xuf12c7hWcUeTYabz3zPiTch8qGW6YXMgzq
         fpevzLCzu4eNG+C01gAqMnL/k2EHpnx9BE12W0lQ/fpFDU/jycBsSBSBf4ojFheUSuS0
         UgIK12gStd7E9tGEd69qxgJhLX+TixYXnG7ilTb0ZtXfpr7yJTFMRyWG6xzWISsmbz0q
         VuC3LWQDCLNe0Rb8Td88oRcCW27FMkN9esYbFGq16PJVvXItg8QUmFIEInPsIq8bLA1w
         erKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DMup9pbs;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=iWw3yOgO;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id v8-20020a5d59c8000000b002bc87f273c7si341840wry.725.2023.01.09.14.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DMup9pbs;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=iWw3yOgO;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66CDC4D34C;
	Mon,  9 Jan 2023 22:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3KkNITzSs94Fyk0YxMQd+TgFbMPFMYrLs7cwANF9j0=;
	b=DMup9pbsXPiB30ZSrF5liE/1wQfoXzrShyxiDqr1YfTKlWpIei+PN0NAZq4ToXztkb4d3E
	xu9rGedpHS4lOS4VnnZ8fRBpngOILKkIPiw/XPiMftqvvj2UT3EFWc7z5m2Q75+1szicwL
	Ub1JheJ+bPKEbgarJW5W/1t0YNugS58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3KkNITzSs94Fyk0YxMQd+TgFbMPFMYrLs7cwANF9j0=;
	b=iWw3yOgOZn5FwSHPNSI3/8lQH8AVTQRBDwTCti9uJ1qlTsZzikrlfpe24+Ze/4aRk0G4Sp
	QD3t2ArzAQMnJqCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF06E13583;
	Mon,  9 Jan 2023 22:42:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sE2qJWOYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:43 +0000
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
Subject: [RFC PATCH v2 03/19] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Mon,  9 Jan 2023 19:42:16 -0300
Message-Id: <20230109224232.11661-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CwhPGVQ8l88J

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9cc136b508..ddb0d76b70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10578,11 +10578,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
 
     if (cur_el < new_el) {
         /*
-- 
2.35.3
