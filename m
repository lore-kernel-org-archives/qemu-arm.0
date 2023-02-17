Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128691ejb;
        Fri, 17 Feb 2023 12:15:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9ikanQh3TlkZoj/EqNRtlry4bEfhtCt+YHPcXF1Qki/jmQ7uk56PR++lXqmxGVbrvGntIh
X-Received: by 2002:a05:600c:168a:b0:3e2:1f00:bd02 with SMTP id k10-20020a05600c168a00b003e21f00bd02mr2851239wmn.5.1676664916149;
        Fri, 17 Feb 2023 12:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664916; cv=none;
        d=google.com; s=arc-20160816;
        b=midBJ7fInpusGB0ugU48wYM0XYt2cjWhFs2eb4RArmAyTzwB0YHFVKkXL/eTfchx36
         pRCr4lTzF7/j6Y0/0XqEBGmOrBiTj5W2WDs1YbjKsKIXTe8dyznZbRHmUzfeoriRdSdK
         //TVtuotmV6R5FpS3vt6h8laItCPADUHuASU4EPYtl+pKUQJb164nxpIF6uEb/qNhUvP
         +qFv3UP1n0ToPdbDxdVLvsVEVdYtm7YmCB+N35FBp8zhfOzcSa3JepuAyTLpDh9kA+1K
         MxZxa0UTDOaOoTaPMAUgokdDqYTyHPqW8fy9ayBx0f/HmWieZQbhf1Xt42vdaPruVM7+
         4KjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=HixjPLpKXbacccVNwdrYDdahM5J1XPYKuj5sKS6qJNY=;
        b=nU/hde9vb9cqbzm6fP9ffUCvw8i8Qjw4jnIQp17bYvGeH5VwVi/xwAgj064JirPpud
         XukjIkUzwtZev+fcuXMMrsrGo/fan1dDthmvAIfjvGwe59pNb9gdG4yjRdtVyhTSO1LI
         TVaz3G3be+c6Q+hdDJv6cMMZk2wXOoPb5NW4fQ9XzDwXM4GR9gFlPDIprc8C+F7d18Gd
         ciKKUz93W9qjJ6Nz/O8GH/jhy7NCgyGPiBspg5z4/gzGKZhlW7F+GcRltEt+zZ1+K3Cr
         +E8QZsvIERNDNXZo19B34piUb4eTOvcApOEbE8W+pfzUV7jmDmJYOA3QaIxNSUBRiE1O
         fAEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=gDjePK8+;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=XziyP3Bi;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id k10-20020a5d628a000000b002c3d9d1e349si5646246wru.792.2023.02.17.12.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:16 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=gDjePK8+;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=XziyP3Bi;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC30D34657;
	Fri, 17 Feb 2023 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HixjPLpKXbacccVNwdrYDdahM5J1XPYKuj5sKS6qJNY=;
	b=gDjePK8+qqMllmUNjxVHPlIThOLq2V8soJF8mXakhwziuxeaWp9VkecgLpu/ZCzv3U7yPB
	xSG05vF1RN/njwiv6C1WUP/5COpzkQeYXIW+pO5lEGZddYyzVW2NtAIMEeDhRrZf86vW2O
	B1usDQVsKQtY4QgD+srJFCzO7kJquhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664915;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HixjPLpKXbacccVNwdrYDdahM5J1XPYKuj5sKS6qJNY=;
	b=XziyP3BiNpQoQkwSpmQt9AY+fXccgEZBxO36i9wP1ZCIDeRDxbYbxjnwcKzmK8xCoS0AZu
	5nS55hhd/7DaVdAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F9B3138E3;
	Fri, 17 Feb 2023 20:15:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YBk3DlDg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:12 +0000
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
Subject: [PATCH v6 23/29] tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Date: Fri, 17 Feb 2023 17:11:44 -0300
Message-Id: <20230217201150.22032-24-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FPZkDfzG6RiH

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
index 222e1892fb..29a4efb4c2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -208,8 +208,8 @@ qtests_arm = \
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
