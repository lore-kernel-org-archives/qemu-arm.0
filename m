Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2537201ejb;
        Fri, 8 Dec 2023 11:10:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3lzzaS0GG2jxv1LnqjgoblBPtcAIaE6UAbqnk38JL4wYR/svFvJZUpuxqmWWi+g75nQHW
X-Received: by 2002:a05:6a00:138c:b0:6ce:6beb:9a42 with SMTP id t12-20020a056a00138c00b006ce6beb9a42mr682114pfg.64.1702062600472;
        Fri, 08 Dec 2023 11:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062600; cv=none;
        d=google.com; s=arc-20160816;
        b=cCmL8+LoLY0YXOoi4GIsV/UKsJaOsrq7G3MUlh0KF4joQb54275J5/Qp3DOPdcW1Io
         qcoUnxGILVMgbqc0buRz0/ha1QmOJcaGIkP4ipk8+yUTWRJmlnAzdVDX4b+Zq6pM57ri
         sgnC33qLqE34nldeEhjMPSxYhUyZlgoR4lolg7r0Hyao0xuY3T5JcONjOK6AKx9dEfSR
         pzdvG5NM366cyKQFjw2N7zYX1dF2dPtbTOHLupkt41E7+ScfNlGrxRwAhCPTa4boPuc7
         PBhdQzUEKTm+3+S0u4qo3xqg+1PbFb2E/UaMItEOSTlOUf2NjVoOtES6wLWHXylbE/3u
         u8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=pfo6t1Tv1s9qe/N7cakX7vdc0jIAiwRYsYLYOF8ZcxM=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=aa286PbZmtNbbPeek5iYDR93DJR+3cmBWozeBv686dcDjd+aSFZ8P3nwU7MwqRF21U
         P68pkjy+ulOdSdBE7QX5E7rdEWW5fsPjh62viuZZXaqyblv3F9DaTZhK8HMhVJSgqESU
         ICTLMssYqzLNpSPBS9IPbexn1ZhaLQANz6fCgbyeLHMhmDg79Ip7kkS3BnRuW0TrIxjj
         fxQUTHzOjTES9XcbMeQgT317Y0Yo1zbMUy/fFql51za63st29pZuyRywu1KkAKk2NX5k
         dnYajKAUNYjW7yifcPd5KLoGDnpC2gG26V3lKfkmn7AYHbIyFwp6TuZfGbQ/gbSsv1ys
         iycA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvrij9az;
       spf=pass (google.com: domain of kvm+bounces-3955-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-3955-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-3955-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id w16-20020a056a0014d000b006b4231ba465si1952013pfu.85.2023.12.08.11.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-3955-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvrij9az;
       spf=pass (google.com: domain of kvm+bounces-3955-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-3955-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E52B128177E
	for <alex.bennee@linaro.org>; Fri,  8 Dec 2023 19:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1E74CB33;
	Fri,  8 Dec 2023 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gvrij9az"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8924E11F
	for <kvm@vger.kernel.org>; Fri,  8 Dec 2023 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfo6t1Tv1s9qe/N7cakX7vdc0jIAiwRYsYLYOF8ZcxM=;
	b=gvrij9azHgK+FZLuLue1mLqZpgO4+i4F+slkZHzJolHhTNE5Y6IJz2lHeIbFSmmUSXfueW
	Of1oN0PPj5DHfEy6xmLbt4TVoxn2Wa0UQB/wWQ+OnGYx0XgIBCWbRQayTBcc8gEOnIFpCA
	X5vlMeAQOUZTUZq2OqYcw3hauJbnGDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-quU-GsylOAWcEGm1VCZntw-1; Fri, 08 Dec 2023 14:09:35 -0500
X-MC-Unique: quU-GsylOAWcEGm1VCZntw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F265185A780;
	Fri,  8 Dec 2023 19:09:34 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A767112131D;
	Fri,  8 Dec 2023 19:09:31 +0000 (UTC)
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
Subject: [PATCH 04/10] tests/avocado: machine aarch64: standardize location and RO/RW access
Date: Fri,  8 Dec 2023 14:09:05 -0500
Message-ID: <20231208190911.102879-5-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: 9AdGb21FT0eo

The tests under machine_aarch64_virt.py do not need read-write access
to the ISOs.  The ones under machine_aarch64_sbsaref.py, on the other
hand, will need read-write access, so let's give each test an unique
file.

And while at it, let's use a single code style and hash for the ISO
url.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py |  9 +++++++--
 tests/avocado/machine_aarch64_virt.py    | 14 +++++++-------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 528c7d2934..6ae84d77ac 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -7,6 +7,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import os
+import shutil
 
 from avocado import skipUnless
 from avocado.utils import archive
@@ -123,13 +124,15 @@ def boot_alpine_linux(self, cpu):
 
         iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
         iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
+        iso_path_rw = os.path.join(self.workdir, os.path.basename(iso_path))
+        shutil.copy(iso_path, iso_path_rw)
 
         self.vm.set_console()
         self.vm.add_args(
             "-cpu",
             cpu,
             "-drive",
-            f"file={iso_path},format=raw",
+            f"file={iso_path_rw},format=raw",
             "-device",
             "virtio-rng-pci,rng=rng0",
             "-object",
@@ -170,13 +173,15 @@ def boot_openbsd73(self, cpu):
 
         img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
         img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
+        img_path_rw = os.path.join(self.workdir, os.path.basename(img_path))
+        shutil.copy(img_path, img_path_rw)
 
         self.vm.set_console()
         self.vm.add_args(
             "-cpu",
             cpu,
             "-drive",
-            f"file={img_path},format=raw",
+            f"file={img_path_rw},format=raw",
             "-device",
             "virtio-rng-pci,rng=rng0",
             "-object",
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index a90dc6ff4b..093d68f837 100644
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
+        self.vm.add_args("-drive", f"file={iso_path},readonly=on,format=raw")
         self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
-- 
2.43.0

