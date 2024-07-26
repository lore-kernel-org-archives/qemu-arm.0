Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475106njb;
        Fri, 26 Jul 2024 06:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUe3Jc98E4aKSSo+nr8n2cLfVc0+6s2R7rhmjaXLQp5MWrUh4vTIdKjuo3+/LdjitznNG8Ld6AeuRquRlk6HuQtTRSL9kId
X-Google-Smtp-Source: AGHT+IFoE5M3s+G35E5bY49U2yUbSVn09Z+zNjRw6RG6EuZ5MYNg3dBE5h/O610gUjNj37e7ZoNh
X-Received: by 2002:a05:6122:4695:b0:4f5:23e4:b7c with SMTP id 71dfb90a1353d-4f6c9fe88edmr6486496e0c.0.1722001533219;
        Fri, 26 Jul 2024 06:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001533; cv=none;
        d=google.com; s=arc-20160816;
        b=znOLfAj0V62kWu8TnqQpKSDYAmqgrFPGVRWqiq4EXDI6o4T6+vP4W/T3wRBQEd/llj
         uPBy1KYg+kE+WvvQI3SoobnkRU9GG125owYrSHnbA702OlvYhMWhW+aI2hCtpAyy9Msb
         1VjvPb7nzpr38WY4jHKLSX0g+MPbqqxBWYTPoKLYpkQo3XUHPx80bcn8CcOvA3d4m2xi
         fphMRyzh8jIyXdSov1fVMaYz3dhSp593blj0RK4VI9kaU6G0VH6IfRj0Dk0KPuhFqsyb
         IUnPdcvPgrMsat3oqKU3iC7DEGFNtItcqPg+7XF4hlg8giStsspncizy6fGEmkyqLZ0Z
         +UHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SjcpbA2sD6CYVWhEq7nq8PpqkGiIsiq71NF+s5HMhDo=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=RCQuyBRj1dJZI41hEz9RbvDTFfTtH4MuibnsquS4nszcLaGVQZjKIok0zT6DzJPo5s
         hiAsjt1bHMSwXm4/OFmnTMFoJQe+ZtMjgTt00uj54tA91+D5464r75smhJdKdqR+bVb6
         FWDNFUl0klw0p26qc/Xt8xE4YrTcLLgBv9+bFmAe/nUCsx6SmhKa6Nb210eVaetb64es
         FmHzZgpuWAZSg6UM6T1rjqznUc4kO6EelfKfjtbTWpeeqfAXy2YZRaSTkihz7q/NjTG2
         SKPesXynhhi97s3yklD4ipnq/8o6tR7dB9mVycJ2JMQg76g2yVzKUckQTmbbwezfXoaG
         D6rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AMTozHP7;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe851b739si40794531cf.644.2024.07.26.06.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AMTozHP7;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjcpbA2sD6CYVWhEq7nq8PpqkGiIsiq71NF+s5HMhDo=;
	b=AMTozHP7D4xAnM6Slik4GAttBBXdsbQvgIsSDcD6tD7aGjhQ4j07E6kcDhO3Mw395oOVmk
	P+LuCTL05K+rs4EjBPo2/xpQ00lLxff3j5Gj1XhITu31knTkV/DcLIv+ljU5+SNs+THJhw
	Hr1Rq8URTkAT3M/u3TiU5au16y1D0Dk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-600-Du1ZquumO3icphIrhLcVaQ-1; Fri,
 26 Jul 2024 09:45:31 -0400
X-MC-Unique: Du1ZquumO3icphIrhLcVaQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33DD91944A87;
	Fri, 26 Jul 2024 13:45:29 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24ACF1955D42;
	Fri, 26 Jul 2024 13:45:24 +0000 (UTC)
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
Subject: [PATCH 09/13] tests/avocado/boot_xen.py: fetch kernel during test setUp()
Date: Fri, 26 Jul 2024 09:44:34 -0400
Message-ID: <20240726134438.14720-10-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: XPc1rxGF342p

The kernel is a common blob used in all tests.  By moving it to the
setUp() method, the "fetch asset" plugin will recognize the kernel and
attempt to fetch it and cache it before the tests are started.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_xen.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index f29bc58b9e..490a127a3e 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -30,23 +30,22 @@ class BootXen(LinuxKernelTest):
     timeout = 90
     XEN_COMMON_COMMAND_LINE = 'dom0_mem=128M loglvl=all guest_loglvl=all'
 
-    def fetch_guest_kernel(self):
+    def setUp(self):
+        super(BootXen, self).setUp()
+
         # Using my own built kernel - which works
         kernel_url = ('https://fileserver.linaro.org/'
                       's/JSsewXGZ6mqxPr5/download?path=%2F&files='
                       'linux-5.9.9-arm64-ajb')
         kernel_sha1 = '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
-        kernel_path = self.fetch_asset(kernel_url,
-                                       asset_hash=kernel_sha1)
-
-        return kernel_path
+        self.kernel_path = self.fetch_asset(kernel_url,
+                                            asset_hash=kernel_sha1)
 
     def launch_xen(self, xen_path):
         """
         Launch Xen with a dom0 guest kernel
         """
         self.log.info("launch with xen_path: %s", xen_path)
-        kernel_path = self.fetch_guest_kernel()
 
         self.vm.set_console()
 
@@ -56,7 +55,7 @@ def launch_xen(self, xen_path):
                          '-append', self.XEN_COMMON_COMMAND_LINE,
                          '-device',
                          'guest-loader,addr=0x47000000,kernel=%s,bootargs=console=hvc0'
-                         % (kernel_path))
+                         % (self.kernel_path))
 
         self.vm.launch()
 
-- 
2.45.2
