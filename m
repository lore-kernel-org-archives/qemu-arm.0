Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp906467njb;
        Wed, 5 Feb 2025 06:11:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8R7e8YB/mDdHqE+25bC79QXv4tttEm5GoJrEk0BDXqJHVNvOxqynRQppWBRC1/aobCL281qKwXmxkuA==@linaro.org
X-Google-Smtp-Source: AGHT+IEh4QXMT1KOpoKqiYEq/dxd4nFD551Z/fHiGGjS7JKiUmaXosAdPwgg76KlQJEdJiywFsTK
X-Received: by 2002:a5d:59ae:0:b0:38a:a083:9200 with SMTP id ffacd0b85a97d-38db490e777mr2329004f8f.44.1738764711497;
        Wed, 05 Feb 2025 06:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738764711; cv=none;
        d=google.com; s=arc-20240605;
        b=Czm+gv4X9SajstZss68Xjnj7BNxHHo2smMN0mB7kRLJNZ8rt7SwrBx5KdCHTrYPXKV
         Vdg4br+n8ZV0+GH8pQuU/1DpgjqOcNgAg8gFYl+5evn8pAyyJx8a5bd2T4vbvUnqP7Q1
         45XKN4FCU60PHFa3N1cRumOXV2axjs/wFnlPZjNgOZjVbQa5n+cx87IqfIHp//LVfRRR
         TBn8tilS/mt56ynzRipizk6NgnWIj+Rk0NEs+cj6cWSUzfTfuxrqH5yHW9+NRhc+UPOX
         S5MyFy4BBT3+A/arlQGOkL9bH7QQOVNd4Fbs1qOV3l+sCRbjmKFaDnvTOn+pb4J1yduK
         GXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+I0angLWhFqNaRHNyVwlaABRE92RM41orHFIOYkM9Zg=;
        fh=XfaJlA5zhTkEz3ItW4lDuW5oO9wudj7AqMBqimOQoy0=;
        b=lMWoBHYcH9/ot2oedTW516sfyOJG0tCZlFudKIUf6UfECcorZaneveOnbEygHmiq+v
         pdzoxdnPp2cnq9GcOcDIi8PaQDs/ocVTJBTvR6jPOIh5zV+suQIw6UZEJUPziF066+Ty
         7IQNnFMIsURivfYQyekUmn2q4xa35cAfnuQqg9f7fJlYCuXTuI2Hfv0Q2hYXDHNffM3F
         MvQUGPhBs/8n0OZnCTRDjF9JcurfMspJHW6pywwgiYKUlmWC87+Z0Uh0LzICyGPsf7S9
         Ee/46X2GKKZg1puLb+9j1ovHngqGTrxhC4FLyiZwccP2zHJw1PiXnUMZCERDQUJhCbAd
         PPJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJrSN3kC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38db1e507e9si1354298f8f.253.2025.02.05.06.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJrSN3kC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738764710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+I0angLWhFqNaRHNyVwlaABRE92RM41orHFIOYkM9Zg=;
	b=BJrSN3kCGkAcJmhdX85hQv3//gCQc3KsskW++SEZTZIYfYVByVp9jGDwb2KiE0ZBPKVCvq
	TJZY+AK1P5r9oZtlPwmMxLWlsv+oV5O3GuCqV3kdXfDJWUXz74Ze9UyXqfrUtS66RRWh06
	yMFaXrHYfi4+1tyqMZT9ht7edj+1zbw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-yrUoxerPMx63E7mA9wqRbw-1; Wed,
 05 Feb 2025 09:11:45 -0500
X-MC-Unique: yrUoxerPMx63E7mA9wqRbw-1
X-Mimecast-MFC-AGG-ID: yrUoxerPMx63E7mA9wqRbw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97B4D1801BDF;
	Wed,  5 Feb 2025 14:11:43 +0000 (UTC)
Received: from thuth-p1g4.str.redhat.com (dhcp-192-228.str.redhat.com [10.33.192.228])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C0BD01800360;
	Wed,  5 Feb 2025 14:11:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] tests/functional/test_aarch64_virt: Fix vulkan test without egl-headless
Date: Wed,  5 Feb 2025 15:11:40 +0100
Message-ID: <20250205141140.97437-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: FT3te00rA547

The vulkan test currently fails if the egl-headless device is not
available. Let's add a proper check to skip the test in this case.

Fixes: 3d30f882ce ("tests/functional: extend test_aarch64_virt with vulkan test")
Reported-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/test_aarch64_virt.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 07c1c13638..95f5ce8b4c 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -189,6 +189,8 @@ def test_aarch64_virt_with_gpu(self):
                 self.skipTest("No venus support for virtio-gpu")
             elif "egl: no drm render node available" in excp.output:
                 self.skipTest("Can't access host DRM render node")
+            elif "'type' does not accept value 'egl-headless'" in excp.output:
+                self.skipTest("egl-headless support is not available")
             else:
                 self.log.info(f"unhandled launch failure: {excp.output}")
                 raise excp
-- 
2.48.1
