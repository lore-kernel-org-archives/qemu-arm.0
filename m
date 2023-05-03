Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3058756ejm;
        Wed, 3 May 2023 12:38:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6D4gZ2p32FdJ7FLUjQAJjxlyglDHN/AstbCkzz73j++YQyZqZwFBa5DF19N8Lfp3r0uRxR
X-Received: by 2002:adf:f012:0:b0:2fa:6e37:3d97 with SMTP id j18-20020adff012000000b002fa6e373d97mr765543wro.54.1683142725879;
        Wed, 03 May 2023 12:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683142725; cv=none;
        d=google.com; s=arc-20160816;
        b=uLiINE+dcRK/lwcsytVRt46A8jZqdtc94sUsiZrPTQ8/GSYMfA/lZd/aYJ496zUCmL
         f4WZz21SuIgpzUAjxtt7XRQMFxE6shahq5fctoSw2zTeXHN7S+Zz/QqQu9PMkRtZQxgi
         GUwsWsfQqYVy9KghJIY6ls+Dhp7LWDObUtfywn++8Sbo1qrMYzekqnhqmdlzZZuX1WSn
         e/liu70oUHwEk7e7aR3P0yVdGjygTJscsoH8h3TBvgalMZohoqQl01JOgtq63jcTF1oN
         M2Jt28HFwLHSkWlm1bc+Gk5IjlPs72+8qIMRdn3jaQFOQPVzT6a+PMGDi7/0zeK93cbO
         QsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=60RJNHL0Z614KMy2kOVdvDC6twMO69e3mE8TdhIdKiI=;
        b=cTUVlWBh2of/caz8TxAeWVQljstfote9wiH77A5vg9J8LjVlNsNJTCPrx6q7hXCi+0
         s733NEYqKwBDcMl0DrdVHrvhlfV2ynxp4vlYhRqVnil7CiKtI7Wbyou51H/qooRXNEfl
         bR2ABxRHvMCBwNiMy7+cTOg8fSEKyzmjkkVuSrobT5c/s9XlDMfiSiVSrza9+Sgc8hZz
         pe/Cv7ltkBbzTAcQ9nLkxE79wKm1LPSCnQOZmPf4tTQID72l2MxhlO89LuwNgEkzzStq
         imQnQ49850nfh6OEWxkR5stqXNeXZPPdIldzpIA7nsZir2X8tJwMNwGNiFXaT3IxTdq5
         HELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oI58QeEX;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=rhp2pB1k;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id a7-20020adff7c7000000b00300aee6c9d0si20584343wrq.899.2023.05.03.12.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 12:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oI58QeEX;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=rhp2pB1k;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86F5F206A5;
	Wed,  3 May 2023 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683142725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60RJNHL0Z614KMy2kOVdvDC6twMO69e3mE8TdhIdKiI=;
	b=oI58QeEXBCAZiFCrxGgHkG/PtBScFpWRcbHVEWze4YGeFNJJzb+StbsJtn/UXiff/cHC3U
	IXPSQmgxz2fuP3ffnpg1yFIM2fGE6ovkFclfOYcq2e7u25d65OCJVXo0T8NCI4MszYHgNK
	heiroXEz/XbDs5i2E7a/NF/ZCtj3n2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683142725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60RJNHL0Z614KMy2kOVdvDC6twMO69e3mE8TdhIdKiI=;
	b=rhp2pB1k7o0j22jQwIS3w15Gif+QMYc8+UFTldl35tVzpRSNR2m0jIMuc+hDMHicKHIL1M
	lUcHutZpYzsK3sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFC871331F;
	Wed,  3 May 2023 19:38:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +IewKUK4UmTNYQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 03 May 2023 19:38:42 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/3] tests/qtest: Don't run cdrom tests if no accelerator is present
Date: Wed,  3 May 2023 16:38:33 -0300
Message-Id: <20230503193833.29047-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230503193833.29047-1-farosas@suse.de>
References: <20230503193833.29047-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JCMzUSI+wMe8

On a build configured with: --disable-tcg --enable-xen it is possible
to produce a QEMU binary with no TCG nor KVM support. Skip the test if
that's the case.

Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
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
