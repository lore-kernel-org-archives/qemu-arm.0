Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp474784njb;
        Fri, 26 Jul 2024 06:45:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJymOV9EXo/wLDzcRxtvOD/WgLKu+Y5BKyGgbFXrQoN23uLOkHDPIXfMP0cIpG+swEKWYfj615IfLBFykqDWljTHYBOSeH
X-Google-Smtp-Source: AGHT+IGsDwn0hcVgRjhocnSyk4rWYskpqrlA7LuKubllnVfrkpI34nLZ7R3tLHt3NYDoxNeKupdq
X-Received: by 2002:a05:622a:1207:b0:447:e2f0:64db with SMTP id d75a77b69052e-44fe9208fe7mr55377271cf.57.1722001501838;
        Fri, 26 Jul 2024 06:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001501; cv=none;
        d=google.com; s=arc-20160816;
        b=qWf8TbVjO9kLk3advFY1iO2/Rn5mG2ZY56ecgtWr3AojrdNYNpGkD23TgIaLkPfFf1
         55p4zyOgmDcaT1ibVN+u5IcqdzbtFSQ4PtPfgaG/HEpVLCU3L3/gMUVNyWKjtpHLrgbi
         8K+DTnEu33rd8e7LYWGdAN+nEvpp8EsTem3z1Cty+P5s0fQjY9lePdJqmrphjjkITbBY
         ygM8v0sbXWCpubiBiFu0LUvLoN9m/PoNL796mTcHpxRiCWEefDFo3i8JvW16qXhGitrf
         4fujgYc/HbrM/Q9VeR6nCxUeorN/lbQ35Ga1hcvVT0wyPxQcmr2Cz/MUKS/pd8lYv2tb
         QnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RKmLOo511M5++BDmKAMU+H3V3j7+sw7OERXfgONtCK4=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=zkn7GkraRc2GkiaiC+nkihDbVLP7JqnVI7zAGlnJ4na+qv8Jl5Up0GTojZdD/5PVzJ
         Tw43ivfGhVxVqyxqUu3QOcvekUPCFo9dez3cEdZBvjLmmihyF6MfWvmSly8Pvh2OlHPQ
         XFeiJHg5C3ROj9C0CNexu1Ea94WpdUFQ/OrnQjzlY6M4IqCyzuKpwA9TXab+ozp4o1oe
         J3Yvhx5iRSkmZIlpolyj5OwZOq31802qtiBZO0DYGFowFg4+Z7T8sTGAFCsrOewnG8WA
         EC3UVz9HeNvtqvTxKrj7vGYnaLss84HokoPpwtCC2+sYMJY+2fxYRFYJwORdgz/3V+cC
         ff+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KxN9ATOc;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fe513si40534251cf.363.2024.07.26.06.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KxN9ATOc;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKmLOo511M5++BDmKAMU+H3V3j7+sw7OERXfgONtCK4=;
	b=KxN9ATOcESLsvbW+xyMrrV6h9/wfrcOg4CNOmFiBcw+YUPI4/7+z5SvSDvcMWNHUOEy1I4
	IamJm9AbViYynQAgOFY9aDQAMtCTXWYcxGQx+5un6ARVHH4BGjjVxCS2sZnPCpwcvxn+ET
	qlrKzHPomAm4ix7tF3645E7BqF6pHeM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-QtkdACIBPma6-WCXhF2TOg-1; Fri,
 26 Jul 2024 09:45:00 -0400
X-MC-Unique: QtkdACIBPma6-WCXhF2TOg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E48F21955D53;
	Fri, 26 Jul 2024 13:44:57 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E6F51955D4A;
	Fri, 26 Jul 2024 13:44:52 +0000 (UTC)
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
Subject: [PATCH 02/13] tests/avocado: mips: add hint for fetchasset plugin
Date: Fri, 26 Jul 2024 09:44:27 -0400
Message-ID: <20240726134438.14720-3-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: tLcxn9hssLl/

Avocado's fetchasset plugin runs before the actual Avocado job (and
any test).  It analyses the test's code looking for occurrences of
"self.fetch_asset()" in the either the actual test or setUp() method.
It's not able to fully analyze all code, though.

The way these tests are written, make the fetchasset plugin blind to
the assets.  This adds some more code duplication, true, but it will
aid the fetchasset plugin to download or verify the existence of these
assets in advance.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux_console.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 450d67be6a..b8b0a4df10 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -274,8 +274,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
-        kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+    def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
         kernel_path = self.workdir + "kernel"
         with lzma.open(kernel_path_xz, 'rb') as f_in:
             with open(kernel_path, 'wb') as f_out:
@@ -303,7 +302,8 @@ def test_mips_malta32el_nanomips_4k(self):
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page4k.xz')
         kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
-        self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
+        kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        self.do_test_mips_malta32el_nanomips(kernel_path_xz)
 
     def test_mips_malta32el_nanomips_16k_up(self):
         """
@@ -316,7 +316,8 @@ def test_mips_malta32el_nanomips_16k_up(self):
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page16k_up.xz')
         kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
-        self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
+        kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        self.do_test_mips_malta32el_nanomips(kernel_path_xz)
 
     def test_mips_malta32el_nanomips_64k_dbg(self):
         """
@@ -329,7 +330,8 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page64k_dbg.xz')
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
-        self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
+        kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        self.do_test_mips_malta32el_nanomips(kernel_path_xz)
 
     def test_aarch64_xlnx_versal_virt(self):
         """
-- 
2.45.2
