Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345652ejc;
        Thu, 19 Jan 2023 05:56:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYXyM9c+Kbhj/nkz8iyMYT3TfUSMy1g15zaf+e6zf4sBOTJa6VccdzNr9tIpaNGx8vMqR+
X-Received: by 2002:a17:906:b317:b0:84e:d302:1551 with SMTP id n23-20020a170906b31700b0084ed3021551mr11390422ejz.37.1674136609714;
        Thu, 19 Jan 2023 05:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136609; cv=none;
        d=google.com; s=arc-20160816;
        b=jB3wt7XQzP24l8QQbWD5lgM61aW1kpE15cOtawOB0X6wx7t5XKd6TDPv64oBMWwu3f
         umYYtqFJ1YogIZFQB3PxBTaBANMwveMQEuUstfulC/xW6xuGZux+00OjlcAG/PX7lTXt
         LvrRXovjZLQEd/edoBoGtjuMj2wH6Tyc2/O0/wbz1NHKESwIAN/3qYYFLt3A2SWX/b7a
         WFsojrgl1IWmLPH2h89E30nQ9QxXzioilPvCEYJQX462Gdbue2agMSczDsOgT9R48kii
         gUmgd/dEPp3gQTMQSP4qRpAaaRjkG8gChQQeUM3UxBhUc3NqUMDV004ihhwSvdc/Xq5a
         Zlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=pOHcxdY1LhPmAxt6QcRmCOJFL4WbnqEVMCoD9cJwpTA=;
        b=oFV9v0GK/iLhsEUKhcnqNILE22hgQgGUYV6IzFwhi78lUO6p3+uVR/qEAWvd69qc0u
         d0nU0H0Xw2tnCNPCC5XdSlcFYm3fMU79L+BxP0q08EE/IE0U9jfxsXYlimzFmdFfHagO
         jY7nzVDdFG3QRvyieG5CQpEFlpJ086Lr+uDTlCNc7k7xWJrne8UOJ3/HfYgoWTHPsXBT
         7+eXreCA0rPDYQu/ACM35nBJUoLsg/LghFqqjBsiGQxCkaBfc8c7/GPRxLmPeo2iouSu
         qfoCcQR+GavmcTBOMPD/1X8EroMJoXiprmb1mhXSHNLRHiQGpgdxPQOZru5UUrc7ZMBe
         Redg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oJ5p0feU;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="CGUaP/62";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id xb13-20020a170907070d00b0084d1310711dsi41901247ejb.315.2023.01.19.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oJ5p0feU;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="CGUaP/62";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A5B33F42D;
	Thu, 19 Jan 2023 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOHcxdY1LhPmAxt6QcRmCOJFL4WbnqEVMCoD9cJwpTA=;
	b=oJ5p0feUmJAGHMPBu5ez6hcgwq4q4e+FIf1jfFNp6eF2cMEQnNQAHvKtr4dHxqY0vTUhpn
	hgCAMmvgp6G8Bkqm82X3yn3cFoPq4VzoTqE5nXV2uDOkK7XR3mOnFMnttF3wp/w34wOX3P
	1snuEA/or1XAGdc3a+n4b/I0vhalPMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOHcxdY1LhPmAxt6QcRmCOJFL4WbnqEVMCoD9cJwpTA=;
	b=CGUaP/62tDPP6DugZZloOkD0nOe4mw9AnWYRNdZDNeCIcEKZXjggw63aPXrih6e3V+Xq5+
	Dg5Fz0AlDO1Bf/Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3949134F5;
	Thu, 19 Jan 2023 13:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QHDKJR1MyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:45 +0000
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
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 05/15] tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Date: Thu, 19 Jan 2023 10:54:14 -0300
Message-Id: <20230119135424.5417-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1z1Z2ug/JvsQ

These tests set -accel tcg, so restrict them to when TCG is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 1af63f8bd2..9dd5c2de6e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -204,8 +204,8 @@ qtests_arm = \
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
   (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?   \
+    ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
   ['arm-cpu-features',
@@ -295,11 +295,15 @@ qtests = {
   'tpm-crb-test': [io, tpmemu_files],
   'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
-  'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
-  'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
 }
 
+if config_all_devices.has_key('CONFIG_TCG')
+   qtests += { 'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
+               'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'], }
+endif
+
+
 gvnc = dependency('gvnc-1.0', required: false)
 if gvnc.found()
   qtests += {'vnc-display-test': [gvnc]}
-- 
2.35.3
