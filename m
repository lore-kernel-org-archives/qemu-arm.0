Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414949ejc;
        Fri, 13 Jan 2023 06:07:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvIJ0r07/7f1A4Uha4ths7hYXeyNbyYlFoemmr4ldHrpi/l4uDYbaT+uzfJTAkr60F7PqSg
X-Received: by 2002:adf:ef02:0:b0:2bd:d8f1:2efe with SMTP id e2-20020adfef02000000b002bdd8f12efemr3832377wro.34.1673618855314;
        Fri, 13 Jan 2023 06:07:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618855; cv=none;
        d=google.com; s=arc-20160816;
        b=o0ri7Lp/eAQHt0YG6DDitCch6mZXiIMdjdmtx8rYLOSz1vccIy3QxV7ZPw5t7mNtRo
         k+B+xYbvAQneVbJfpfmcKT9grjMnjUeNJ3nN80/k/AMq3iNGbopanN55UxpD3ZvNabXK
         SchZLD4L/lyogI296fmz5upYuldeuypNrO/mBZ5i8DD9/y/nk+tetj5Ncp/R7SYCSKcy
         lzDPgujKWE28OQ0zRxmQg+7mOCJNSc83Et/qpzVTq+pbLWjXNjStmlvcWqhvLrDOpjZa
         76/0rwzY9lrSEbIZMo2feJlB7ijwLHA1YMPUtoLngpjy1YwVW2g9GjniidH6OEPvVtWL
         41uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=LBaB7kJBIkOKbfkC8jH8KUUZzj4I2us8cuUjwdgflsA=;
        b=YhX35yts85CPE7mKb+1pgjtSt9CeSdQhTMiApx2nLzyinXZl3y/HJtSeoSROPOtOYr
         Uf/JJ8/AQn0MOo6Dc4lnedL/1TiMA9/U/XsBjmff12zS3c31cl4rul7P+NAYr85logxl
         +vTc3CPeIa2Xbs0ZaswRlWoczh5aud20Z8XSzVlvfhuo0+B2pR1BsOK6PIrtPXvkMiYP
         Pec3jPFhB1nl9/NUJrQWiMf3yIh6ndza47xf+GaSCbfDpzp/xYM3GfUk5Slkifq1C24Y
         ZulMJNdhIvgVVfD0GCEx6w+zePFPj+za09xZbhMap/exhCpHYWm+p+C972fT9aTSW19D
         pOqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zF2LOYtU;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=jU8iIRqu;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id f3-20020adfe903000000b00280bab64841si14642362wrm.374.2023.01.13.06.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:35 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zF2LOYtU;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=jU8iIRqu;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D34126B4FE;
	Fri, 13 Jan 2023 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBaB7kJBIkOKbfkC8jH8KUUZzj4I2us8cuUjwdgflsA=;
	b=zF2LOYtUZkc8RRYzAL2rHdehKxsUVQKNw1/8nxgX9vk1xdwLO/wm/KDVo4TRU1xoeJA/x/
	wSn3Zw6jZYiH3/FxQ9W4j9rXdk2Em+p3DXdZkiiYXrtfUPqcehJM0zyJZzrJsqS8iSpgRa
	qq0dpamuKPxxeBAqjzG5d0to/RN45ks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBaB7kJBIkOKbfkC8jH8KUUZzj4I2us8cuUjwdgflsA=;
	b=jU8iIRquAHt2Hb+pf08gTBVDcK6pe5NPHYLUCsz5+wStFvVtbmdqPPWc6ryK+Xi9oF3d7Y
	ETE7K0E8F2aP9CCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB6E21358A;
	Fri, 13 Jan 2023 14:07:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aHn+JKNlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:31 +0000
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
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
Date: Fri, 13 Jan 2023 11:04:13 -0300
Message-Id: <20230113140419.4013-23-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qJNFKrMf0nhH

We will soon enable the build without TCG, which does not support many
machines, so only run the bcm2835-dma-test when the corresponding
machine is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f0ebb5fac6..1af63f8bd2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -207,11 +207,11 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-   'migration-test',
-   'bcm2835-dma-test']
+   'migration-test']
 
 qtests_s390x = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +                 \
-- 
2.35.3
