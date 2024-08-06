Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1302987njb;
        Tue, 6 Aug 2024 10:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUG+fxfVkx0mWziurwLhzgitxUSI9dNZn3jOdYMfTwpyagsH0sPOjZ22A/VrHUJtkGzyPH/ow/rPYKiX3IStgjZe6lIjS8s
X-Google-Smtp-Source: AGHT+IG+MFT32W2mcdoqonlkFQB7mcApx0FqQgneRp5NLqFS7O5OLXZoLMYH0PQT0RO+IfSk2y8q
X-Received: by 2002:a05:6808:2212:b0:3d5:60b3:d9ca with SMTP id 5614622812f47-3db5583b506mr19546742b6e.43.1722965579598;
        Tue, 06 Aug 2024 10:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965579; cv=none;
        d=google.com; s=arc-20160816;
        b=XskO+B+Y25N7qbRe/9N/oaVcl4BtcBUFYOgWxq4UEstomT1re8vKlCnI7nNS3atTOm
         08YD9UpMjYNNSwcg3FxZXP3K0+AF+s6qYSFICJxaq6EBlFgz3HO+FtUIqox/ypwa6zaM
         YMKU5KY3eQZISxcJGcNsI6bJuTU+Tg5ksW+PrfPGH4bo9PKi/hvHL7Q8zTfaZH5Mwg/5
         dAVa7oJwc2ZaeZ2MNlGaTR0O0RHcPnRQl1M8vY6rmWxrTj0g3Dtvexkqz/K5rVVsFA6A
         ge3Kd6aBKTH+2KdOXlWXYSfYEbpRcXYuu3PkWvvGKY+gkGIpvnojWVNQWlgnJGz+itq3
         hRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SjcpbA2sD6CYVWhEq7nq8PpqkGiIsiq71NF+s5HMhDo=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=TJ7l/FUrmvgGOoFYc3VX9Hxx1AL12SugNxVs5IgvXK8yCZePjcTTxfD5dKiMg48lE/
         jl+9zUuc4Wx+gyRaNsyxPlBiOOp3T8lGYh5IfmaZjoaRqBFwMCzp1ij/xFi7zovtA1d4
         ATbdEmh+qsVum3eZVghjupufE2ualvofjzaMACIrQBlw4w8bmH3sQTOj8YjRzSXOLLUt
         ryN891woZFZQvSSgB6zaxFKCU+xyVoT0l/qKLpO5spzvoqzAfdrEVMERqCmRyn2tSjPF
         cbHBG2OuiAYK9CllbLA+qhiBiLCc463BmJBXE7ZGNrplK8FXl0tWoBRd+M09kAgS7cvO
         IDbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BBjSPEsE;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f775d3csi1296817685a.482.2024.08.06.10.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BBjSPEsE;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjcpbA2sD6CYVWhEq7nq8PpqkGiIsiq71NF+s5HMhDo=;
	b=BBjSPEsEp5W/wmu/sQ3+mREGl0C9S3r45dxWPKI72jUnWA499pjqGkQQBPGEslMdUi6Pxt
	WWOqSNxbTcWOOeZ5b5Ew8fsrXcOhDU/TMX4oACFim7Rv9HtLV14labUYVh6uImRlgIFLgQ
	TsyS+ypQGkEQyvVabeRbAfygwkxzTDA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-jdUwjjb2PYOdaJpWsbZVsg-1; Tue,
 06 Aug 2024 13:32:56 -0400
X-MC-Unique: jdUwjjb2PYOdaJpWsbZVsg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BE3B1955D48;
	Tue,  6 Aug 2024 17:32:46 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA23019560AE;
	Tue,  6 Aug 2024 17:32:36 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Troy Lee <leetroy@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Beraldo Leal <bleal@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paul Durrant <paul@xen.org>,
	Eric Auger <eric.auger@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH v2 6/9] tests/avocado/boot_xen.py: fetch kernel during test setUp()
Date: Tue,  6 Aug 2024 13:31:16 -0400
Message-ID: <20240806173119.582857-7-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 8bAbsDmSUV4s

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
