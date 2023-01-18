Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787800ejc;
        Wed, 18 Jan 2023 11:38:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvveS4RenvkYz5d8LFkqBlM0ftDq+FJDyo+BQp99qQewfBWxhltooUS2G//c5RPnBeP2Zrn
X-Received: by 2002:a5d:508f:0:b0:2bd:cb39:2ca3 with SMTP id a15-20020a5d508f000000b002bdcb392ca3mr3240371wrt.59.1674070701421;
        Wed, 18 Jan 2023 11:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070701; cv=none;
        d=google.com; s=arc-20160816;
        b=r1UoEJY9aqmWyL/w6PK+xM91gZ0t/E6Kd/pLHj8ONWkb8/jJqOgJo9Wujg3L8lzhpd
         T0F6suuonhmTxFmRWxmoIYHI7MYfGVuanydcYnaRfzNniItnhSKYL7dCFZTY6qFykVzs
         BYZzdBRuw9v/ZbIzpoT2d6qn3Yetd+M0Y7W8RFV9GY3SVcLIAKgwbTLDONnn7b6l2FwL
         PEg9OwuE3jJuXzc2m7zBL6h8E8KorgjpSP2D+nCYu4HwTfy5PWh6p1lcoynyEDSubjnm
         wgpHt49HaO1uoCWuWkeiAqjD68SMbze/Ig1872lECIcC//NY7HwT2RJJzm3RzABP4al8
         nf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=AHPtg+fYob44FYMVFnRZ4i2j7dOgdMT4zBY3BrbjsUg=;
        b=DCoHuPjnvBl3GnbkvgQuFTi+7O/6SOaVsoFxuMA8kEMEU+j7yRYnC0oGXoB6fzt8g5
         G2di+50EvBJ8dzammOuYNB9OnXgAUC+JjHDEg9riXSprnfPSX0D2KOresXoAmKQe3wgX
         rR4E3xB9vZleH7103QtPJSdQ5w43sfKtaZmnA05tDNnzGBB+ss/edQFdLWsDuewMQegr
         zE+WE89IzlBZ91bYMBOcmhN1Z+H/4WejxUC1Se/9tAfxVMNpcD/EsLke1PO37bJWP/B0
         JMlQTf6XNF4mTCS1mgekAAwdOgI5NOi0ciBrPcQct9tYZDN0XnU7biBNJ6M39ibj2QEr
         RHnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FmlN4GA2;
       dkim=neutral (no key) header.i=@suse.de header.b=VVmMh0Ot;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id v15-20020a056000144f00b00241bf91afabsi38491953wrx.570.2023.01.18.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FmlN4GA2;
       dkim=neutral (no key) header.i=@suse.de header.b=VVmMh0Ot;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F9703F6D2;
	Wed, 18 Jan 2023 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHPtg+fYob44FYMVFnRZ4i2j7dOgdMT4zBY3BrbjsUg=;
	b=FmlN4GA2jsaN52mIdJROEcX3zoHP703onve4+q/GQBJaRn574qb1nKyNpNIEm7smeSdx1m
	MMBW665zj459ETpA5SStxYtfw6Hgk0uXAwCQjqeCLvhz2hNF/ONVIsb5+i77iHcfj31kHN
	pXdetfeTflRwkTL7aY7A7dryVZyQvcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHPtg+fYob44FYMVFnRZ4i2j7dOgdMT4zBY3BrbjsUg=;
	b=VVmMh0OtOyChEgKgo59DyaCvu/eupyzycrMaoQMm5KAv4dw5T0OIxJJizc/LHz2+eHuFRD
	pdR9QykJqgUHEIDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01A28139D2;
	Wed, 18 Jan 2023 19:38:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uAE1L6lKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:17 +0000
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
Subject: [PATCH 18/20] tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
Date: Wed, 18 Jan 2023 16:35:16 -0300
Message-Id: <20230118193518.26433-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OdU4CeSCIjfU

We will soon enable the build without TCG, which does not support many
machines, so only run the bcm2835-dma-test when the corresponding
machine is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
