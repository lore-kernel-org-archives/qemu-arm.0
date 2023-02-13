Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547528ejb;
        Mon, 13 Feb 2023 12:33:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+3w/KiplRfvEx91+i0htKijMme627oUU3x5F8vQLn/P0nGxvTrOSejzJQloKHRjBAbHFbJ
X-Received: by 2002:a17:906:1c99:b0:88c:4f0d:85af with SMTP id g25-20020a1709061c9900b0088c4f0d85afmr156497ejh.75.1676320383258;
        Mon, 13 Feb 2023 12:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320383; cv=none;
        d=google.com; s=arc-20160816;
        b=rhsb0a6c3gsAbLoS/2pyoovXdfH71kAnaCjt7maAbssDdNaiN2IHxucfXf/9BB0sVg
         QEQALuF2nJkSuGyzqxZYUH3fX1ZYBceZ6nY10LDohjn1aJASDbFxgxaS6H++wXrvuKrl
         DH0xLK4+89Reiih/X2i00QBhsADsYg8ZqYn24FfloPnya3XWnR0yX/7G3ueVHgMU7i9E
         8QEsZ5+QuJMk9wQcXgBuXscaOkiL9HVZhWX6jVur9IruT8IY97jfjE+YM0TGfbb1KM0P
         jfdx2O/H/wW8uvFOByZadM7lJR2JXl94DeIkwTttVuTjCEkJ8p2shkurfKEQ2My87aS7
         vK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1c+piQvK4VVfdyaMTNwcv2F+KUVfBJzIjyYofPYGUZQ=;
        b=doAOUjeejjafnpEHNdF/OFsZ1VelHQZTtaj8VA/nawmIX+xQUKFSsQW+l1XED8YmHE
         C1OnsUWZ4U5FBaueUXexfu2P2l/jE/vBolGvHIrUIpifdmqW9oEl24WC9aTWyhY400ft
         jMQ5XbratpWh8P9Y2+A+vExpIQaqQNhYrKfzgBQSRFH4TGVKsCMRTaRIGz4qRwPforDM
         0ghu4y64fs4ESslcAhdSzaOJxvo4ojf4FCKxXV3AycPnRU/MzGHweNEOIQkvtYpDGY45
         TcZDGE6dvpXN/tgA+X7daapfRZVAczZ3kj5nwWRbMFrFrr+xyw/s4XWJuhlIFpis46st
         D/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pJaUfpFs;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id fv33-20020a17090750a100b0088aa09de654si6468860ejc.766.2023.02.13.12.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pJaUfpFs;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF84E20288;
	Mon, 13 Feb 2023 20:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1c+piQvK4VVfdyaMTNwcv2F+KUVfBJzIjyYofPYGUZQ=;
	b=pJaUfpFsatdhOpbkLEHM92tYIoiDy5d7P+OqLXijNbHCDPl5dX3UJRqpncQldS0tXXqTqp
	57v9kLR1m8mtadfZj5XaGupWn1H5y8MQdgwNK3K9klmrH/pwdt1VVl7SyCkCF7aye9vn+W
	sXpI4Vxn9USAiRmYGnQxVp3uHv1IpmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1c+piQvK4VVfdyaMTNwcv2F+KUVfBJzIjyYofPYGUZQ=;
	b=ugmpw7y0p8CzgINqTnLdPSb4py0E9qhqrTafIZbwWC/UBUg5AXuEThjDM8PSq6Wg22F9r1
	prUWRNlF1MejXPDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 548AC1391B;
	Mon, 13 Feb 2023 20:32:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WG3yBnue6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:59 +0000
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
Subject: [PATCH RESEND v5 24/28] tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Date: Mon, 13 Feb 2023 17:29:23 -0300
Message-Id: <20230213202927.28992-25-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jf1/E8KEa8FD

These tests set -accel tcg, so restrict them to when TCG is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
Removed unneeded hunk restricting dependencies
Use config_all instead of config_devices_all to check for TCG
---
 tests/qtest/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e97616d327..e882e405ff 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -205,8 +205,8 @@ qtests_arm = \
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
   (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?            \
+    ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
   ['arm-cpu-features',
-- 
2.35.3
