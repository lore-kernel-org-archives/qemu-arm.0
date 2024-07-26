Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475179njb;
        Fri, 26 Jul 2024 06:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSwqdH3XgOW2ClnTOnOgknLefnMkdBrU59rB9UczKbLKyXIg/1/0uX+t+yr1wpx9NfosdvY66IgqGt0gWTI99yQ+2toZWv
X-Google-Smtp-Source: AGHT+IHXTgpjMJ1QwkKNt7IXHyXqYlEG/0CBCp3+J7ji4/1x55Cpv+Hixg7EpqXda3fouXj48F6U
X-Received: by 2002:a05:620a:2556:b0:79d:69b5:aaf7 with SMTP id af79cd13be357-7a1d44fb0a3mr743586585a.11.1722001542532;
        Fri, 26 Jul 2024 06:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001542; cv=none;
        d=google.com; s=arc-20160816;
        b=sCu2L7QrB0pLWrHSyugdJ2g6grdDWvzfKhlaGg8JP0CTyscOMOOUhMThD6q7TwXor0
         dwpI4kD2eBVaqiA4/LYRSETK58eX/e0XBuzqXHr7C0VcE11VsAz2OMYhCKqex83OuIeh
         Kn5djHekDBa6MCPujKlHsRQfcFMbZfufTpTg6/L/X1YOB5yw9Dlz3W2+Db4JS9NVWobZ
         RJydaoyupxv52tbcna0pIKw1jmkp3hGiT5qHjA4EbEVFHVMjmsL8ghUE0dfVLssab7ev
         bE9nNRyKabVXf2QJztlcVADgnb2UaiAZo5G7ialSAnvRPJy81NpMd9lzbwQ9+TIqISxH
         tovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9Pp0EmgfUgef5CCbhzHhQ+sBuTsis6yWoLZCERPLAmQ=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=I7xXbGxK3UmQQvHCkBam8RaHtmpJ1o2rF5h+WEYDRAHnD+fcgJQeN0guW84tdXkwPk
         uFbbAUEWaFIxniiO9Cz7VpQXTnPwjZKmE4KknJRHXfw4YsE8pue1WvHTM3I8Cmh0SLHC
         Gl2t5KiNvDEEYc1ZgRKaFqNgvq1GkSUErOuvp4lcHxgjFepZRmt/YF77gBD6hfvMesV7
         O1rLB3npTGNz7OeefjRPyggSpVrPppjuJY4EYEXnLQ307hiOA9BJkGn+leu8mG2eXH+M
         6G9vS4R+MkUS5LrLjXzYsDlbjPpILQFRtQbNlkrR84UCoB5tZ9fpeCllBZBnq6fMXqTS
         wNRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XMfb5sgA;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7399a2dsi419031585a.124.2024.07.26.06.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XMfb5sgA;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Pp0EmgfUgef5CCbhzHhQ+sBuTsis6yWoLZCERPLAmQ=;
	b=XMfb5sgAcE4+E9MIi89XeR6VK8xwuUaWgkjkH8elBeKn4qZeZwh5DIbJDf0Z6NSJylZtNL
	O1BFQ6PuifciKHfUAxzgYrcTpGs3UVf6x0ro1cbBFXBopJvFFnYjRZ3m7Pngu+nQqJaO1+
	mGOP1FEmPZHIvM/E+F//ZF5kHBW1B3M=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113--MtupRyvNCOkAExirddxAA-1; Fri,
 26 Jul 2024 09:45:37 -0400
X-MC-Unique: -MtupRyvNCOkAExirddxAA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FD191955D63;
	Fri, 26 Jul 2024 13:45:33 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 701441955D48;
	Fri, 26 Jul 2024 13:45:29 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Cleber Rosa <crosa@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 10/13] tests/avocado/tuxrun_baselines.py: use Avocado's zstd support
Date: Fri, 26 Jul 2024 09:44:35 -0400
Message-ID: <20240726134438.14720-11-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: L8Dv54r6QRcv

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/tuxrun_baselines.py | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 736e4aa289..bd02e88ed6 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -17,6 +17,7 @@
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
+from avocado.utils import archive
 from avocado.utils import process
 from avocado.utils.path import find_command
 
@@ -40,17 +41,12 @@ def get_tag(self, tagname, default=None):
 
         return default
 
+    @skipUnless(archive._probe_zstd_cmd(),
+                'Could not find "zstd", or it is not able to properly '
+                'decompress decompress the rootfs')
     def setUp(self):
         super().setUp()
 
-        # We need zstd for all the tuxrun tests
-        # See https://github.com/avocado-framework/avocado/issues/5609
-        zstd = find_command('zstd', False)
-        if zstd is False:
-            self.cancel('Could not find "zstd", which is required to '
-                        'decompress rootfs')
-        self.zstd = zstd
-
         # Process the TuxRun specific tags, most machines work with
         # reasonable defaults but we sometimes need to tweak the
         # config. To avoid open coding everything we store all these
@@ -99,8 +95,8 @@ def fetch_tuxrun_assets(self, csums=None, dt=None):
                                          asset_hash = isum,
                                          algorithm = "sha256")
 
-        cmd = f"{self.zstd} -d {disk_image_zst} -o {self.workdir}/rootfs.ext4"
-        process.run(cmd)
+        archive.extract(disk_image_zst, os.path.join(self.workdir,
+                                                     "rootfs.ext4"))
 
         if dt:
             dsum = csums.get(dt, None)
-- 
2.45.2
