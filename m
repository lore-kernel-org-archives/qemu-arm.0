Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1302746njb;
        Tue, 6 Aug 2024 10:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq1GPaXOVg6gGogpfQwmvMeFz3eAA4hZZTVCpjhVBq0MVQTJwX5emC8sgAv8S//OG3uWTc8T20HDgNf9NNMB90uM1WxzUp
X-Google-Smtp-Source: AGHT+IFCvUZ8J7QaaHcLJ698m5mdSTzjp/I2pigfBJ80c6Kmq0n+WwPpG5ZZifHGGaEwXYB+u2It
X-Received: by 2002:a05:6214:4881:b0:6b5:e60c:76dc with SMTP id 6a1803df08f44-6bb983a5437mr222543426d6.19.1722965533026;
        Tue, 06 Aug 2024 10:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965533; cv=none;
        d=google.com; s=arc-20160816;
        b=OFxNACv2nGY46TdD0uOY2siOb+rixk/rPpApqa1oUagRn8YBTT4JT0cF8y9ci50RW5
         0BmHZSbuW7inOlRrrCuPNnJIqgHvBFsm9gXyDHSb4/OPJuxP0Y9uAGyzIKGLOO8m4IIb
         yitJK0pqGLao7RkonoUCT25YYNNYsNLBSSxr6RswBZbKTv3m2KCtyVW+IYKagU9rgprw
         htFRGLTZL6XEdYrZSlWnI+AXtLk/5OoPqCcQihSrsRUG8it4YDH+E6TWIgHAWoSu9N+5
         BU4XBaRRz1jOmiLlpGzVWyHF/S9tfMWf2RHi/6jmMt06w1/4MpQOZBNOpYvqUk38MvIk
         YBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X/GXQbUC+egQPtXlpcMkSOyDnU1wegvQLfhRmhDNQso=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=WDr+C3naWm0MX/fwk8GSv/OYxXenMVPORiXT3CkhCoal4MJxU87DnX43T3U9jx9S2t
         eDQ3DEHbE1UqTjhpPiA+UYEXAxLlskFZ1c+PUP36cSWzGUUm1S+jTq0GhMnTOIFI9ik6
         8cdUcw5MgNEDKu6NVNdrPltmQ8d1EEYaNbVA1Ibypjlv3y4poDliYcg0DCB/ZEy3LueQ
         lILeuuOogOOpWHWpMN+CkCjPGrM5JvdjDQO1GLZ+SjEb5sBxVwqOjsuGuyZT9C9jbjeP
         +2E1IbWlbG25us9u2gZhUv/7ugi7cXlxFv2AoJF0FNQa9gn2/Q2z9iOB6LF3wen75ZxJ
         TfHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cvBcIExn;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c840b96si116665076d6.297.2024.08.06.10.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cvBcIExn;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/GXQbUC+egQPtXlpcMkSOyDnU1wegvQLfhRmhDNQso=;
	b=cvBcIExnHBO9QaancAk2jTyQH+v1B3Pk2hW8y3sI/X4dw0sYMjeKM7hlI+w4N//nPUuoTo
	Uv2nOuLz451hZ6FA1XSpsHh/Lb+e0FImK1Xy/n7KkB1i6xZXOeBEPZ91P6UGc6iFvToqLr
	W2kmq0GWU1Ik+eCg57X+Kb9rOZOBOOc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-qFtQ_wqSOQOYfMZtDARYNA-1; Tue,
 06 Aug 2024 13:32:08 -0400
X-MC-Unique: qFtQ_wqSOQOYfMZtDARYNA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4783E1955BEF;
	Tue,  6 Aug 2024 17:32:04 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2C8F1956046;
	Tue,  6 Aug 2024 17:31:49 +0000 (UTC)
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
Subject: [PATCH v2 2/9] tests/avocado: apply proper skipUnless decorator
Date: Tue,  6 Aug 2024 13:31:12 -0400
Message-ID: <20240806173119.582857-3-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: zpuHZg/8Ngfo

Commit 9b45cc993 added many cases of skipUnless for the sake of
organizing flaky tests.  But, Python decorators *must* follow what
they decorate, so the newlines added should *not* exist there.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux_console.py | 1 -
 tests/avocado/intel_iommu.py        | 1 -
 tests/avocado/linux_initrd.py       | 1 -
 tests/avocado/machine_aspeed.py     | 2 --
 tests/avocado/machine_mips_malta.py | 2 --
 tests/avocado/machine_rx_gdbsim.py  | 2 --
 tests/avocado/reverse_debugging.py  | 4 ----
 tests/avocado/smmu.py               | 1 -
 8 files changed, 14 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 2929aa042d..cffdd6b5a2 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1522,7 +1522,6 @@ def test_ppc_mac99(self):
     # like issues with a buggy kernel. As a result we don't want it
     # gating releases on Gitlab.
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_sh4_r2d(self):
         """
         :avocado: tags=arch:sh4
diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
index 008f214397..992583fa7d 100644
--- a/tests/avocado/intel_iommu.py
+++ b/tests/avocado/intel_iommu.py
@@ -13,7 +13,6 @@
 from avocado_qemu.linuxtest import LinuxTest
 
 @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
 class IntelIOMMU(LinuxTest):
     """
     :avocado: tags=arch:x86_64
diff --git a/tests/avocado/linux_initrd.py b/tests/avocado/linux_initrd.py
index aad5b19bd9..7f47b98ae7 100644
--- a/tests/avocado/linux_initrd.py
+++ b/tests/avocado/linux_initrd.py
@@ -54,7 +54,6 @@ def test_with_2gib_file_should_exit_error_msg_with_linux_v3_6(self):
             self.assertRegex(self.vm.get_log(), expected_msg)
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_with_2gib_file_should_work_with_linux_v4_16(self):
         """
         :avocado: tags=flaky
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index f8e263d37e..c0b01e8f1f 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -323,7 +323,6 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
         self.wait_for_console_pattern('Starting kernel ...')
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_arm_ast2500_evb_sdk(self):
         """
         :avocado: tags=arch:arm
@@ -343,7 +342,6 @@ def test_arm_ast2500_evb_sdk(self):
         self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_arm_ast2600_evb_sdk(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index 8cf84bd805..07a80633b5 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -102,7 +102,6 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
         self.do_test_i6400_framebuffer_logo(1)
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         :avocado: tags=arch:mips64el
@@ -114,7 +113,6 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         self.do_test_i6400_framebuffer_logo(7)
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
         :avocado: tags=arch:mips64el
diff --git a/tests/avocado/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
index 412a7a5089..72f0296e21 100644
--- a/tests/avocado/machine_rx_gdbsim.py
+++ b/tests/avocado/machine_rx_gdbsim.py
@@ -23,7 +23,6 @@ class RxGdbSimMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_uboot(self):
         """
         U-Boot and checks that the console is operational.
@@ -49,7 +48,6 @@ def test_uboot(self):
         #exec_command_and_wait_for_pattern(self, 'version', gcc_version)
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_linux_sash(self):
         """
         Boots a Linux kernel and checks that the console is operational.
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index 92855a02a5..f24287cd0a 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -207,7 +207,6 @@ def get_pc(self, g):
 
     # unidentified gitlab timeout problem
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_x86_64_pc(self):
         """
         :avocado: tags=arch:x86_64
@@ -225,7 +224,6 @@ class ReverseDebugging_AArch64(ReverseDebugging):
 
     # unidentified gitlab timeout problem
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
@@ -250,7 +248,6 @@ class ReverseDebugging_ppc64(ReverseDebugging):
 
     # unidentified gitlab timeout problem
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
@@ -265,7 +262,6 @@ def test_ppc64_pseries(self):
 
     # See https://gitlab.com/qemu-project/qemu/-/issues/1992
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_ppc64_powernv(self):
         """
         :avocado: tags=arch:ppc64
diff --git a/tests/avocado/smmu.py b/tests/avocado/smmu.py
index aadda71e4b..83fd79e922 100644
--- a/tests/avocado/smmu.py
+++ b/tests/avocado/smmu.py
@@ -14,7 +14,6 @@
 from avocado_qemu.linuxtest import LinuxTest
 
 @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
 class SMMU(LinuxTest):
     """
     :avocado: tags=accel:kvm
-- 
2.45.2
