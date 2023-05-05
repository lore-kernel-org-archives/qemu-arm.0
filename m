Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp383870ejq;
        Fri, 5 May 2023 05:35:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ox3h0fWEiBkx2tAp22F+C6ZWD9F6lXvF330CfAiNe+RxP/Ley9SM1d2PsJ/my1PmawySB
X-Received: by 2002:a05:600c:259:b0:3f1:7123:5f82 with SMTP id 25-20020a05600c025900b003f171235f82mr1123291wmj.12.1683290137630;
        Fri, 05 May 2023 05:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683290137; cv=none;
        d=google.com; s=arc-20160816;
        b=I/OeMRQokJIqvWQUUCMwJD1K06NtHUDZxVJ0b2S7SYyLdI644bdKgeVnI2VEj2+4c2
         qQ2hh1iqUvUPmoAAxtyoxUfoBqbhIGbUeRkzeiwZsrlaAIr0+iYHrXKGVak22q31FmP9
         Muw7iDX2yHVitdZR4PHQ+sDtxFgpafSAjz9ZPHzywq8vxq7ZenpZjneX3OqazRvkc5yi
         Z2YqED4qmOA8Fpm8edpMYUwy9p6EGCl4wVyFTRrf6UbCH0nRwkqtYgk0i4y0af3Gozkl
         i2nLrj8CRBfo4z33Az/wjIbADmQD+wdBh/M4vKzi8q073bQxG9TixwyAHR9EVm22Bukd
         Onvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=pb4QQCvxzabUE7t1Q+mi8AHbjHxilUXW5WJZhE5XcO8=;
        b=HN65get2FOxPOZpEEEegLuJ7K6ROCMzyPo5dp0aAR87W97IniTcNyKzyKqaGzaIYG1
         OCCVaEJ1CAU+wh6XeL/4bDaPeLfB1uQ+eBSmZeA50MkaPYUH3jHSSPFHRTRJDoatsvbx
         TsFL0dWU0D4+p+XtehHY6fMakvtx2H3OIQETRtZqEBmFKOgJ5Wxjhfyd2LhNk9SdJ5an
         kVPTkdJ98yCQTiSix7aKh6oGZbGr1lNDwlWrSzMcfFKdqMR39akEr3NMlW84cLvg4Plb
         MdngtUuscxbFmJqhuS+4T4R8W5ntverMVHh+DyYTk/ENNW+oamgeWSijDFf8uBIzk4ip
         dWNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xvfyqIiC;
       dkim=neutral (no key) header.i=@suse.de header.b=iMYiTMt3;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id z15-20020adfdf8f000000b00306381536b7si1009570wrl.963.2023.05.05.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xvfyqIiC;
       dkim=neutral (no key) header.i=@suse.de header.b=iMYiTMt3;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35D2A22AE4;
	Fri,  5 May 2023 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683290137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pb4QQCvxzabUE7t1Q+mi8AHbjHxilUXW5WJZhE5XcO8=;
	b=xvfyqIiC3NfSsheYxbY+03fcoTktw83ajKLz3+erle2NF3QOQxt38Yi7mYEAqEIbNBrdd+
	nJ1KuKddhQMVZKMJbDk2Euu9h6NWbi2p2jZKZGdFmLjdI+6mUe4uklfYhnia/iZxG5BvhJ
	yCdTyl7iMuqCXL2uOmIn/p8nlNmeO0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683290137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pb4QQCvxzabUE7t1Q+mi8AHbjHxilUXW5WJZhE5XcO8=;
	b=iMYiTMt3HiH6mtiRUK8lpHyL9sFxK1aieXDeC5tOK+DmDVrmP2DIa3K/2AVMi8wRWkKM1U
	+Lms5Eb/GNF/9QDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D82113513;
	Fri,  5 May 2023 12:35:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SPJAERb4VGTaOgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:34 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 3/3] tests/qtest: Don't run cdrom tests if no accelerator is present
Date: Fri,  5 May 2023 09:35:24 -0300
Message-Id: <20230505123524.23401-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230505123524.23401-1-farosas@suse.de>
References: <20230505123524.23401-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iC4cSjZtW7eA

On a build configured with: --disable-tcg --enable-xen it is possible
to produce a QEMU binary with no TCG nor KVM support. Skip the test if
that's the case.

Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/cdrom-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..09655e6ff0 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -205,6 +205,11 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     if (exec_genisoimg(genisocheck)) {
         /* genisoimage not available - so can't run tests */
         return g_test_run();
-- 
2.35.3
