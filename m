Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2220171ejq;
        Mon, 8 May 2023 11:16:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57QPxBOvvwnSboK7SHqJ1Yr1vb1nxxWSrl9/9Iol/5WlZUuR9LxGwo7uF/qGL4C0Kf6JK9
X-Received: by 2002:adf:f586:0:b0:307:9b67:d14f with SMTP id f6-20020adff586000000b003079b67d14fmr2172770wro.9.1683569785718;
        Mon, 08 May 2023 11:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683569785; cv=none;
        d=google.com; s=arc-20160816;
        b=LGp/Y1ryOCZeqKii2D8SJUW5wPq71GcaQ9qnBATv/xAj+AJjjN2ZYMyEVomy1HnkN4
         oBXBdUen9PkUJvJOmEWmPA7BfuE5l9CMdV5FTZGdSzKmzzk6KxHvG7q2bbCY/lMeUTlL
         ei33o/5dt72PyuOHv5gOQZShylpuIOPtu1ajK0BzRC9xFfvxtynB/l/fQW5f/jErvFJS
         oW7LgZtodvQhaKDyw3Ny/efP8MrZX0qIolanZcvFUTV0ocOXERXa9VTQJDbaDdBuFHcL
         EH+aOf+/c1rL3HZRU3eBwDIb99X0g+EmqgqFh3VfQdY30E1pL7MgcbDtCnlWALedIU/b
         53vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1zafHn16XtoiP6kc+hds89WELr+cCfzccygkbaSPXbE=;
        b=sVFRnrzBuTdgfHQcW3fO6ji8kWM0RYg1Gneva8rw+28Fm1aTjnbKlZ8S3b4+epRthy
         OoYYjD/5nF7Epn2IEG0kiDGKGLvXM1IMDSEADdCI4XidtENO3WajrTPjNosLn2AlH+Kz
         Qm0AAjR1kN+mlza4+ghU8Cjsm1cxSNf3hO6uIO58Oa/8nYTVz57U6tXD+8akM31y9xVj
         6KxgGsbp8+OVyH0LeZHpdJ+nOVsBAfOsCzvJWmrbx/So96DxRJ9kDabm/J6kZkZnrvVK
         QGYG7BS771XQhdByOMdWOvWCBDlX+9C09aK6kGWtDqBCiHZc29u1zZlCwNjeTJC2r8Z1
         Lawg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VNuk5VIn;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=nJkfAKHg;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id z6-20020a5d6406000000b0030628c0ecf5si4745699wru.48.2023.05.08.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 11:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VNuk5VIn;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=nJkfAKHg;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 62CDD1FF6A;
	Mon,  8 May 2023 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683569785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zafHn16XtoiP6kc+hds89WELr+cCfzccygkbaSPXbE=;
	b=VNuk5VInCXWkgMncRkDGhEbohCZ1TgIXtTVun1YRiCne4BVgnWK3+Y3gznrkyy/UBchbO2
	I1Jnycy/zP89sK4H+uVmdxqpHNkiqdomLeOU9Q40qOcx63aT8xCt2UkaeqjTR0B70AebAf
	bW/hGWtHZrDojc6mFjTx3rbFcJrANR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683569785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zafHn16XtoiP6kc+hds89WELr+cCfzccygkbaSPXbE=;
	b=nJkfAKHgEaqHJD3xmN2pzu9JimUx8O6op81dP6K28qI0Eh5j6m4z/rGvw5SGux+Bvngm6V
	sqF4fCvnwELk36DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AEF41346B;
	Mon,  8 May 2023 18:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mLAbFHY8WWSIdwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 08 May 2023 18:16:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3 3/3] tests/qtest: Don't run cdrom boot tests if no accelerator is present
Date: Mon,  8 May 2023 15:16:11 -0300
Message-Id: <20230508181611.2621-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508181611.2621-1-farosas@suse.de>
References: <20230508181611.2621-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pRa+3HqukF1b

On a build configured with: --disable-tcg --enable-xen it is possible
to produce a QEMU binary with no TCG nor KVM support. Skip the cdrom
boot tests if that's the case.

Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/cdrom-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..31d3bacd8c 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -130,6 +130,11 @@ static void test_cdboot(gconstpointer data)
 
 static void add_x86_tests(void)
 {
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
@@ -176,6 +181,11 @@ static void add_x86_tests(void)
 
 static void add_s390x_tests(void)
 {
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
-- 
2.35.3
