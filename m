Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2536889ejb;
        Fri, 8 Dec 2023 11:09:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9GkoQokwkHBeH4M3ua+Ipztl74Xc5MxzJ38Uz6r7ID4SYkgs8R5NGHqrRm6y6QzeqWo3M
X-Received: by 2002:a05:620a:172a:b0:77e:fbba:644f with SMTP id az42-20020a05620a172a00b0077efbba644fmr2097704qkb.46.1702062571602;
        Fri, 08 Dec 2023 11:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062571; cv=none;
        d=google.com; s=arc-20160816;
        b=wKBW3a9biWecsSKFynq9HPcE/w2GBr8F4z+A3ElXV4rikhEr5kC0neAYw/MyoI3JO9
         zaP2ZzVMxhD+8JLIOi6ri+/snlWTiD1skH83miurgaG8E3KbXIKuy+6IR9D0FVDn7IFE
         iIotnwR7JR+XZooAtWmeXWPpmqIQlUWVej2QgARIK51l//mHK4hFluQbZJLnVTR0o5R6
         V80tKhmNDfQdDkzgodpcOH738uq2YPARO686ZFblDXTF867/BIJ4qaZ/2YvIrPyCE6bS
         Hf7g6/BnEqOFmddoIS7Mk+vMO3ujlsBj+Fe8LTo1Ud8Vx1toZStvu+s9bmqFT0Qr7Yb6
         RqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HAQodLw6o39wfGU2+kKO3r3kXuqnKBwHuQCL8rcVZAo=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=vDIy28xYfwfSpMGNpgcoFNmiKrVFRht0TC5HqUHNQ6RgT2yTujDhY/xOTwbdqi+RQd
         2nvOYfZgPs+PXoda9Cc4zCWbcboK3SFFeKUIVuRKuun1JltKLlW9EJtSlG+pRXy6nVTd
         g7aCz7Rn9e/++Dz9jvB3LckDr9UP+1t7zyf1bqFntafEaAF/IsswSM5SvXdchshS7MMM
         G6+eIlTxNx6sQCxjv9pKGgq/ZsSnXCuufpzV07fSmgyeaPrzg0X5wLpQu/T2ajrO4Qqh
         EN449GdrL6qJy5AQOTV30HqPOaDhRiWJxor3/4kDwumIPwpBuNmo0yvdOdm7D7oP/NAz
         WyhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e31gyEU3;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c23-20020ae9e217000000b0077bd014247fsi2481379qkc.744.2023.12.08.11.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:31 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e31gyEU3;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAQodLw6o39wfGU2+kKO3r3kXuqnKBwHuQCL8rcVZAo=;
	b=e31gyEU3gyMwsBf+HcOUhrNfeHoZpYy5AX8nI0ECK1w4/2x5x6YZcroWLuK70N76/s1Wma
	x3muxDZyfr6O0j4Ev7MmlBfMyJtGPZzWNbqUC/vMODJZXObr2CpETKfC9V4rwIPw1jwT34
	7c+3F6zu0zA2dxeidVql2vUdomLbFBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-st6o27ktOfGRsVq4m6Pwjw-1; Fri, 08 Dec 2023 14:09:28 -0500
X-MC-Unique: st6o27ktOfGRsVq4m6Pwjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73CE85A58A;
	Fri,  8 Dec 2023 19:09:27 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23BB112131D;
	Fri,  8 Dec 2023 19:09:24 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 02/10] tests/avocado: mips: add hint for fetchasset plugin
Date: Fri,  8 Dec 2023 14:09:03 -0500
Message-ID: <20231208190911.102879-3-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: F/tiBWSOtkBD

Avocado's fetchasset plugin runs before the actual Avocado job (and
any test).  It analyses the test's code looking for occurrences of
"self.fetch_asset()" in the either the actual test or setUp() method.
It's not able to fully analyze all code, though.

The way these tests are written, make the fetchasset plugin blind to
the assets.  This adds redundant code, true, but one that doesn't hurt
the test and aids the fetchasset plugin to download or verify the
existence of these assets in advance.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux_console.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8066861c17..f5c5d647a4 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -303,6 +303,11 @@ def test_mips_malta32el_nanomips_4k(self):
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page4k.xz')
         kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
+
+        # The following line is a no-op that aids the avocado
+        # fetchasset plugin that runs before any portion of the test
+        self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
         self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
 
     def test_mips_malta32el_nanomips_16k_up(self):
@@ -316,6 +321,11 @@ def test_mips_malta32el_nanomips_16k_up(self):
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page16k_up.xz')
         kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
+
+        # The following line is a no-op that aids the avocado
+        # fetchasset plugin that runs before any portion of the test
+        self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
         self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
 
     def test_mips_malta32el_nanomips_64k_dbg(self):
@@ -329,6 +339,11 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page64k_dbg.xz')
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
+
+        # The following line is a no-op that aids the avocado
+        # fetchasset plugin that runs before any portion of the test
+        self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
         self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
 
     def test_aarch64_xlnx_versal_virt(self):
-- 
2.43.0
