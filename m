Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2421701njc;
        Mon, 24 Mar 2025 23:16:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFO1ZNomC7FX+HhoxrtBL+5xtarIQA2dKQePto5h1PFp7FEDtcH5GlxyAnqtMYVA9pUEjMi6VBImN/HA==@linaro.org
X-Google-Smtp-Source: AGHT+IFoimphwk0wny7lD+WVtcioCkChyncV1lW3/aD+ge0bCD907pCdNC9m5jwVHW73sGU8dNyv
X-Received: by 2002:a05:620a:46a5:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7c5ba1476f2mr1980210685a.15.1742883397590;
        Mon, 24 Mar 2025 23:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742883397; cv=none;
        d=google.com; s=arc-20240605;
        b=iNNQZZiI5pIzMXsULwt52RnszNRwDYPyPttfTgGAnF9UasaQw+KoiyZYVe4u8Q4Pny
         0n4BJDRCJXry0PxBI94O30B8vA3HQfkoLS9Mw0/GaJbTafuDxERtPBuZ4bvBL9+0XUXt
         3nocCPuMeU5RXzhE98W8NSWbtq7BN4VPVwPOsWt3WkXV5blZAOUvA+1MHecTxpDgUD6O
         RjC0dLp4rVhwJFKhMlNUYB+dE2v1KY5xob1cRMgWNtnP3Cv0NQMWH+tpX5R/GmQYgy7S
         eaSbgPCEmytwjsGR2zKxtu146UmPalhptsoAHqVLmOZ/Bi7m0WHdKLURrIujzpN4Uouz
         GDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Gw6lxk9yOm3sP+zriilNbLgx9UhXL85FJnkBQ5eF7/I=;
        fh=6Zc4XHOvPhe7AQvDNXTfFqcjRCq4H1iVRL3l0f7Wc5U=;
        b=UXbgkECKdWFWDS7zrvqAUAfhXXP4gJSfxeX+6i0kjhD/JOtcnUTu/K6k03F0xO1a91
         pfm2iUM29WHVBKymATHFOPuy81PCLBQyID1hMdq2kdCqNVU0tp90b2I0zCCmi9mrrQvB
         5QNCupDUfUAJCTxAUmX8QfV0D9ldBgsjfgoEfHwfPqZh9D2z4mJTpqztS2dPtEaOnPdr
         HjXHKHQ+9PLkzyJIx1CRade5Cpw6CTFuW8TyPOpbaIUyXwFEoYS+4cMgsfX5vnacXdK9
         vNQH9g6Qjp2IHXecorfHlFYxt0BYB9thpU1ZLUImOgkEk/oObGY7v6wiFZkfqGMaNuXB
         cYqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h9V7oTvH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c5c865dce3si525992285a.54.2025.03.24.23.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 23:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h9V7oTvH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742883397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gw6lxk9yOm3sP+zriilNbLgx9UhXL85FJnkBQ5eF7/I=;
	b=h9V7oTvHacIbJikQ00oYWb3Iwp3KwWyyVjRq05HLZlolR6OxA9gJSM1WkaR94waCskOx5p
	81aapS0QZFJVELFBe73FOThsnS/c0wi9uiXMyPZ5rWzf8aVvhz7tdMzkFXKRXJSKbQ+BCD
	lHv7sB/JN6gebwOdQFKu3f73bN/T4E8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-Z6XGz_dUMlaNYhWQAcU7Fg-1; Tue,
 25 Mar 2025 02:16:16 -0400
X-MC-Unique: Z6XGz_dUMlaNYhWQAcU7Fg-1
X-Mimecast-MFC-AGG-ID: Z6XGz_dUMlaNYhWQAcU7Fg_1742883375
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE0F7196D2D2;
	Tue, 25 Mar 2025 06:16:14 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.60])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 933B519541A5;
	Tue, 25 Mar 2025 06:16:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests/functional/test_aarch64_virt_gpu: Skip if "dbus" display isn't available
Date: Tue, 25 Mar 2025 07:16:09 +0100
Message-ID: <20250325061609.272847-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: uiutqRnWz4b2

From: Thomas Huth <thuth@redhat.com>

This test currently fails if the "dbus" display has not been compiled
into the binary (which can happen when CFI has been enabled, for example).
Check for the error message to skip the test in that case.

While we're at it, also make sure that this test is covered in the
right section in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                               | 2 +-
 tests/functional/test_aarch64_virt_gpu.py | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f470a1c9b7..c1ccb0acd14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1018,7 +1018,7 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
-F: tests/functional/test_aarch64_virt.py
+F: tests/functional/test_aarch64_virt*.py
 F: tests/functional/test_aarch64_tuxrun.py
 F: tests/functional/test_arm_tuxrun.py
 
diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 314d994a7aa..38447278579 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -74,6 +74,8 @@ def _launch_virt_gpu(self, gpu_device):
                 self.skipTest("Can't access host DRM render node")
             elif "'type' does not accept value 'egl-headless'" in excp.output:
                 self.skipTest("egl-headless support is not available")
+            elif "'type' does not accept value 'dbus'" in excp.output:
+                self.skipTest("dbus display support is not available")
             else:
                 self.log.info("unhandled launch failure: %s", excp.output)
                 raise excp
-- 
2.49.0
