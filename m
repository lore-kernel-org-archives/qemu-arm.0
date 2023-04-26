Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593755ejm;
        Wed, 26 Apr 2023 11:01:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z6n4BTP0Pyf3Hcgk+Kno6b7cy/V7hy94/+Q4xBQH79lc9x0TiAvEJaHcZTqt75gQYbOjbj
X-Received: by 2002:adf:fc46:0:b0:304:760c:6470 with SMTP id e6-20020adffc46000000b00304760c6470mr8706388wrs.36.1682532063166;
        Wed, 26 Apr 2023 11:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532063; cv=none;
        d=google.com; s=arc-20160816;
        b=RvRWKdvmjD7iG7+CQSjV637RQRJ+YuvAQcUu/nTasTfaJeXefwS797FqCJ5FpfBYG+
         YXTeaxcDSQQB21SZZFSH0+J4LL/7YLcy2RAwufYcFfBPSaNcr+66C3k91jcHfAAIZfC/
         C9gCFG4qFfamXYATUiTsCGkbF8vDnLfUDYLKMwuTW+YrhtgFZKS0AvP7DT3HcOPg0/sm
         PqjRFcTDto0fyoZWD6M4S9wZI70sx2DAVzFI0cYyu3ZfhOJIdDB8+jsQFOYMjHUUq2oV
         Le/3lfEqz6FMk72z99tDx7VV47bfbDQW6HfC+4xo4Ft+MxB3TbGNmCxrFYZYGNuGOqBz
         QKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=vq7MpugCYsy6+5iaIFy+AvFN1pra7JrINg5j6BTyQhY=;
        b=vroQbaglEKE6f5XchTvQh0CMUBD6j+xkMDGlAUilbgt5IDtnhLwUJ9XblW+J5ML6RD
         zeWpm7FH1QS4w3AuDaWBkSOinNq9ZkBFjXlRZhB4hqkc0ScfsIxcbfYCT+6GIlf5tRN3
         xFzAMQ9W0ZQ2XoTVoofH24DAOI40/6N82AdhXz2VR0kpp/1yl7q06RZBGGCfD3gs1x68
         4FrsvtASETBUSUz++Lmf1XDEN01ro2xqpmVa2ENOa3UagViqlETRnMVv9E2o8mUiOGaG
         RKtqe9raGVAXYAWaRSJvNN6XdrZqxH84XrOwlJMzD8jLys3TJDNaLWWTTrQN3+dfVIpG
         EBJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=sAQ4fb9D;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id c1-20020a5d4cc1000000b002f9ee11e5besi11626040wrt.924.2023.04.26.11.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=sAQ4fb9D;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C767721A19;
	Wed, 26 Apr 2023 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vq7MpugCYsy6+5iaIFy+AvFN1pra7JrINg5j6BTyQhY=;
	b=sAQ4fb9D+AlN8raODxKH8crW2yRazk/a5SpQotna9cdxYm8ouGbPbALFfAe/5okgrzyT4E
	YRg32U+H7Dr/z35bfTruX0erO54UOAnCdImQMS9q5gT9Linhj7LgFraEjLVifr1ryYUy68
	DuS4I7lAHDG5mWevbLRVEqxHEfkWV9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vq7MpugCYsy6+5iaIFy+AvFN1pra7JrINg5j6BTyQhY=;
	b=UfOA/9dszGGpuJz1HyNebnSiU9RDozKcfaey7ChpDaOJ1G6nzI8VfMoZv0M2DHWGkYttLN
	eWklrT8msrNOBFAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EBBB138F0;
	Wed, 26 Apr 2023 18:00:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MG6qEdtmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:59 +0000
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
Subject: [PATCH v11 12/13] tests/qtest: Restrict tpm-tis-i2c-test to CONFIG_TCG
Date: Wed, 26 Apr 2023 15:00:12 -0300
Message-Id: <20230426180013.14814-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +I9EJTGXJdvz

The test set -accel tcg, so restrict it to when TCG is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index cfc66ade6f..48cd35b5b2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -213,7 +213,8 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
+  (config_all.has_key('CONFIG_TCG') and                                            \
+   config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.35.3
