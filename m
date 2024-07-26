Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475004njb;
        Fri, 26 Jul 2024 06:45:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyR0Yh6wX/jBCmwVUafwSAz5v5m3Rek1IishNkRJTDqjZj1U6BUgFaBs4CoOyVQJo3tNWNolGHMT1p5k5Or4uNYmRwXa+2
X-Google-Smtp-Source: AGHT+IFVeNxWyrCzOYYImxtsQlgSS1ie7zVfbOSRzmMzFBvw0Lw5cceE6jFtYXD0SZX7ZGuQn0de
X-Received: by 2002:a05:620a:430f:b0:7a1:d69f:5b9c with SMTP id af79cd13be357-7a1d69f5f33mr976328785a.27.1722001521495;
        Fri, 26 Jul 2024 06:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001521; cv=none;
        d=google.com; s=arc-20160816;
        b=XwlLVPVEXVDbnGvTk1X9k6ZX8rBDfr9fYQ/dyRNmf0OAIRcZHdfFj3XZxd3dtlirc1
         oZsRCwxp921BbcnKmgrM/ktTycQ8wtzsNk4d3Bdl1DHjExR4UKkv6RYGZ3MD/5dX9hbX
         mbnBMOJiTF+SfpwYSZOMkpx1JlcF5+YSlMIXeR1HzYxBIAiZLTG0fyf3ffNC32I6cXvi
         XWDghHBEj6oYFHlIxkxKUKAVQaRQRH56lmjyp4XXGLM5BTKx69JSzjco5ERmASwxHSk6
         Glsp8U7OjorQpn6KyQmMR3Prdlc87frA6zcZMgJOFjABXE4N7Ehj0kLWS+sOmQHps+wf
         6b8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WtaWhlmHpoy33xPksIjdi5YUZQGPJj68+Jp6A9OldAg=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=RfD/ixdX08teAWRANKHNh1SEh90VVhDB004SOhOwhGIIy2Xa9SueNYIZbHJ6stfqfC
         u00Srdk+wl2Gl7/hAfY99VSxC3+iAJrx1O80KLCHAvPBWdQwz0o+DIJZC/qOjt0UUMAG
         w/T6v6I70p3ag/hkCRzb1oZ/6HBJAC/UXkRJxnaZKT8xPmr49rx/YXqkfaSLvE/XFoao
         5pAbgTUCGTKrAfjeLdpnQ+fpLRM4DU8L+1tFoYDoOAUjvCipWYL3pmXz/AMIJTEIuc3Q
         N3WdCT1B9Vv/PIDpU9OjA1LWyd8JYg1KICSKxc5LVl7yUgo/gjI1NnjiNyNwL5bIw58P
         4Gug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cy3Db9Lg;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d739b811si405034385a.24.2024.07.26.06.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cy3Db9Lg;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtaWhlmHpoy33xPksIjdi5YUZQGPJj68+Jp6A9OldAg=;
	b=Cy3Db9Lgk3s6PYOqgZU5TNNl0mkXSTGWLSG75cxnicLmQzWQQkh+tQT5w0z5IG1D1Z5Ctd
	46zBrzgAMyGu0ZVD/DfAoBjUyaE76CE1Pigm5mlKyEeBog1LU5ac6opaXv0EOTWRUFC1Sv
	5hYYtjI3AbwztFwpSyMN4RnHQ5/V6KE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-GsuuMM2uP7WZa0qYNGJc5w-1; Fri,
 26 Jul 2024 09:45:14 -0400
X-MC-Unique: GsuuMM2uP7WZa0qYNGJc5w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2DB31955BFA;
	Fri, 26 Jul 2024 13:45:12 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 708501955D48;
	Fri, 26 Jul 2024 13:45:08 +0000 (UTC)
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
Subject: [PATCH 05/13] tests/avocado: machine aarch64: standardize location and RO access
Date: Fri, 26 Jul 2024 09:44:30 -0400
Message-ID: <20240726134438.14720-6-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 6HXKE/AksHWj

The tests under machine_aarch64_virt.py and machine_aarch64_sbsaref.py
should not be writing to the ISO files.  By adding "media=cdrom" the
"ro" is autmatically set.

While at it, let's use a single code style and hash for the ISO url.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py |  6 +++++-
 tests/avocado/machine_aarch64_virt.py    | 14 +++++++-------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index e920bbf08c..1275f24532 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -129,7 +129,11 @@ def boot_alpine_linux(self, cpu):
             "-cpu",
             cpu,
             "-drive",
-            f"file={iso_path},format=raw",
+            f"file={iso_path},media=cdrom,format=raw",
+            "-device",
+            "virtio-rng-pci,rng=rng0",
+            "-object",
+            "rng-random,id=rng0,filename=/dev/urandom",
         )
 
         self.vm.launch()
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index a90dc6ff4b..6831d2c0ed 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -37,13 +37,13 @@ def test_alpine_virt_tcg_gic_max(self):
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
         """
-        iso_url = ('https://dl-cdn.alpinelinux.org/'
-                   'alpine/v3.17/releases/aarch64/'
-                   'alpine-standard-3.17.2-aarch64.iso')
+        iso_url = (
+            "https://dl-cdn.alpinelinux.org/"
+            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
+        )
 
-        # Alpine use sha256 so I recalculated this myself
-        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
-        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
+        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -60,7 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
         self.vm.add_args("-smp", "2", "-m", "1024")
         self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
                                                'edk2-aarch64-code.fd'))
-        self.vm.add_args("-drive", f"file={iso_path},format=raw")
+        self.vm.add_args("-drive", f"file={iso_path},media=cdrom,format=raw")
         self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
-- 
2.45.2
