Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303436ejc;
        Fri, 20 Jan 2023 10:50:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs7JCgqDe/dupkr4qabSQVaTus66v9QPcPMmBbKKbFm2VonZXYqpgqqQWwVqrg+oqTZpc1y
X-Received: by 2002:adf:ec88:0:b0:256:ff7d:2346 with SMTP id z8-20020adfec88000000b00256ff7d2346mr13925279wrn.51.1674240651534;
        Fri, 20 Jan 2023 10:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240651; cv=none;
        d=google.com; s=arc-20160816;
        b=ekyuklIcMsjUrU3jY78hevzgNlFICloBsFw16Sypp0DCft4ggvZ10FvkdENCDVjzra
         ccE+Q/jj4SnyvnJFGvXtUaa5MVDA8wYyunnSVBbChgsUgb6YC7jD2oo4smj7aMNUQR62
         0Ogk+5DLg+mgM6W5lh+uLUi4DtG9SPbwQDT05AzbzNHOWXtEOKadfxfjUqyOjo97h8gJ
         6uL/UJCFFuVdhGUibG+SR+crjYcdmQdnWIjD+d9uE1HiSc86vy5St6qoigLdfrkHw5YA
         Z7Bxsd/iFqFAqIuDc4jcRv4hBl1ENy5wzQxXB7fKE8n9kjcnPl02LpOUartbyy4OOxFj
         Pr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=JY1Gb86AFUOz3H7y2Mn4syFFCLf2nud0y7ky5bo+LHc=;
        b=WujVl31WNkFoEteTgffz+6tQ991qb2UqSkYKVgaadloSARIGLlPeOi1TvqO1rxzlYf
         /Rhg2QEMCKuEfO9aAqxiBholYonKBdX0Bcx3sf2pX8WPTLpC2ktPHVZYlWG+q6B1DZ2Q
         cdC8KZNbf2cUeKuChGssv5djuPCNuipp7H/njx0YQERLKKAu7Z1/wFZ9xOC90YSAOxDd
         Z/Odc3q8sTb2r2Ctt8N1xn22x4LDqCjeFbuvpJjXk2+PuIyAK88FfmDxx5txKN6xMs3N
         bqy34HW7NMMopQussKPhqotWGfyOIW3P1D47+9ScaUzYUdh6XzIJuaa40BYsdC1X+MQX
         lV6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FE0yUUmh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id f2-20020a5d64c2000000b002be04469e91si17345996wri.984.2023.01.20.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:50:51 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FE0yUUmh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2BAD25FC21;
	Fri, 20 Jan 2023 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JY1Gb86AFUOz3H7y2Mn4syFFCLf2nud0y7ky5bo+LHc=;
	b=FE0yUUmhdekHu1YoCDWNWe4WvtJzxgK/fRiY+H3w/GJiHthuTq8+volpzx+282lKww6Wt9
	lUdUCE+kuMVasAJXhHbReMhS8mWRfHMSNaREUnQ3utq/pgjdkvmMV6iZRepTv8Z1Exy4mV
	r7eFNVfsSojpKBj4ahmpTT1mYGIHc5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JY1Gb86AFUOz3H7y2Mn4syFFCLf2nud0y7ky5bo+LHc=;
	b=vGfR357XT0WkLC8VW5/81CuUF5MIxmNx4zom96ii5h71nsyrrI7Y2M12C4fS9mFYCvGc/+
	CSpHGeoPAfgUcdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E72C1390C;
	Fri, 20 Jan 2023 18:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WHvXGIfiymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:47 +0000
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
Subject: [RFC PATCH v5 5/9] tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Date: Fri, 20 Jan 2023 15:48:21 -0300
Message-Id: <20230120184825.31626-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qYnVOj8dD1Ky

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
index 1af63f8bd2..26d8cc4222 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -204,8 +204,8 @@ qtests_arm = \
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
