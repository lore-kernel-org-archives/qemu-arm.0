Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1321945eje;
        Mon, 10 Jul 2023 10:02:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHfyylLQBFtcnZZQ2ZXgnLkkB3mK0fqcPw28VhN7QPMqDWE3BKCE9wVsdtryvl/5WBCcTSW
X-Received: by 2002:a05:6808:20aa:b0:3a3:766b:7c31 with SMTP id s42-20020a05680820aa00b003a3766b7c31mr11678250oiw.35.1689008524521;
        Mon, 10 Jul 2023 10:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689008524; cv=none;
        d=google.com; s=arc-20160816;
        b=f8n2FFPFGUkfbbIGUiBhjq/NRWhhgLBGkde6a2hM9M/wgOJ1TvG5ZEvHyshYLR3G0a
         Sh/2uYwgCaID0L0RYYBIgmAXoWaf1oZjqZuR7j7ygUlyfB58irm00IHiE0J0CAYutPAS
         hBFRcdKjQDwIo88gjLJLNDlsgWveuquj8/giK6vDqoCF6RCot8KfznkNFmgchIYnbNSn
         isKgO//D5I068FtqH5nqkdTu8l4QP+B5rSUq3CK6RBeLB9OgCITM4v+b7c6sZn5Pk3rS
         or7l735jrxznojhs42BdDRHlUq8Rpe2OpP+odeg+UvlEUp4p2EhYeaWwWrMHkMohrJdQ
         zmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=cx1rnRIeuyVVSO8/3NH5unDX9hfH1KXnsG2nccb01qo=;
        fh=OVEh+urGVizzbIt239QAwBs4Ae3sQ66TQvb6MmztEd0=;
        b=We9CdAPU3vLdXN7yptGLHUFrmh0IRYSrfLe3flQxufHwpTltn7x9NB3MVXMRShz2q8
         fXV4h/Lj4FKgcVuEQreSstVkSipv6qxGpF41WykwsxbjGkvxOYh8c81PwRGn5rI6q9ED
         qZLuv9CCku7SedPsDGAnSwu19n2GO/OTFbAJsSwhJGi/NqMHQuOW4VKgncpgzs0bwLoO
         /+03/H7uY1HvtdPapiX5HAcTxf7C+CZmx6ibEOMxIyILyMALp+CPpVE4jU1XX09aUTse
         5bjGX30078yYrzmjBxi1ZYrPIfBkC/+T9RMiWUCQY5711N3y2FF2d1IuiLUGNYXxvIgG
         pN5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uja4Hiva;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n22-20020ac85b56000000b00403a6492e19si73795qtw.543.2023.07.10.10.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 10:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uja4Hiva;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689008524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cx1rnRIeuyVVSO8/3NH5unDX9hfH1KXnsG2nccb01qo=;
	b=Uja4HivalIdxj+WzYOp8PQe7DB9TEhGTQbWRE7po72igvqU2ag+AN6JhqNiF7S0e7NUtiY
	EKjKqXQ8rzfyTE2FFG9pRfPf3V/Yqy3XbSujqHRjWmJRdNVmUOdYYxavb6Q3PAtB6orJF9
	zwvbpdNIiFIIFjL2pb3y7OMlb4QkEsk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-oLMWT4-zM6ue0pPgIPjMNQ-1; Mon, 10 Jul 2023 13:02:00 -0400
X-MC-Unique: oLMWT4-zM6ue0pPgIPjMNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABC763C0F662;
	Mon, 10 Jul 2023 17:01:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD894CD0C9;
	Mon, 10 Jul 2023 17:01:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>
Cc: Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2] tests/avocado: Disable the test_sbsaref_edk2_firmware by default
Date: Mon, 10 Jul 2023 19:01:55 +0200
Message-Id: <20230710170155.7192-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: f3UXHWqjYOMz

The test fails occasionally, see e.g.:

 https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489
 https://gitlab.com/thuth/qemu/-/jobs/4623296271#L290

It also fails on my laptop in ca. 50% of all runs. Thus disable it by
default by using the QEMU_TEST_FLAKY_TESTS environment variable to fence
it (which we also already use in flaky qtests). While we're at it, also
document this variable in docs/devel/testing.rst.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use QEMU_TEST_FLAKY_TESTS instead of GITLAB_CI as sugested by PMM

 docs/devel/testing.rst                   | 5 +++++
 tests/avocado/machine_aarch64_sbsaref.py | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fb651eae11..b6ad21bed1 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1384,6 +1384,11 @@ variable as shown on the code snippet below to skip the test:
   def test(self):
       do_something()
 
+QEMU_TEST_FLAKY_TESTS
+^^^^^^^^^^^^^^^^^^^^^
+Some tests are not working reliably and thus are disabled by default.
+Set this environment variable to enable them.
+
 Uninstalling Avocado
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index cce6ef9f65..a794245e7e 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -8,7 +8,6 @@
 
 import os
 
-from avocado import skip
 from avocado import skipUnless
 from avocado.utils import archive
 
@@ -76,6 +75,7 @@ def fetch_firmware(self):
             "sbsa-ref",
         )
 
+    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is not reliable')
     def test_sbsaref_edk2_firmware(self):
         """
         :avocado: tags=cpu:cortex-a57
-- 
2.39.3
