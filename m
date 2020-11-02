Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3988280lfa;
        Mon, 2 Nov 2020 06:46:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycDMiLQ0ohf2RdKImabZAZ16m0eaLnTda8RifZzKY0olBMTu2uRSG0AFv/lGqDIVDG4t3Q
X-Received: by 2002:a37:e212:: with SMTP id g18mr14437938qki.366.1604328405439;
        Mon, 02 Nov 2020 06:46:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604328405; cv=none;
        d=google.com; s=arc-20160816;
        b=bVgFNy4q/CQeBzBwCcbcGQhdtNEVrwWf7UNIqqTzYrJSqwqcGQw5kK4ggoTrooQ3kP
         BuiS7v3FXrXA4eQ+hwu4NplsX/yKPRRgY4+BKbV3X2gqwuAuYSLEwLUVCUFk1MP9PyuV
         MjXwo1sAnXaXHTawaUCZo4OkhvjMYzloaMn0BZvQ6ZXQByJipdsKevyZaYglFlF58EMr
         DZJ1FX9J0jVmB2Jlckotoygx5KGgdCHsyBhMym2IMvXuXcCC5VLNAiVy7dIaDj6ZLpxC
         e2MVcdCLucU+Ue9cSesauusrVEs2kEoOw/Eb6+W2k6n/Sv3/1NXiR/vnkTJ0gSj91Amx
         ORgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qP/8YRJtKkP03M8BPqXKBBV6xRtdXGyAn+uJzRiJSTI=;
        b=W5h8mA2y37xpETnlPlO5jG5dJ2fefs4q5oULLbYoF79LZ0af7ddg/S6OIg0ZYhsVf4
         5w/v2BgfYyzaLGNTfU3PdLS18f5RfHpx1xWSVSkdCvwQBIqbS1soiyvfdNOuQTKIDlLP
         +fW1aiM8qvflqcFMAbNEHMysvKZg189r9zdkCr9Ii2TnKiaqdIm4MmuZSNF7Zd5X+lEa
         PfgxRUiqfjAMz7ReilH5GRGDxtwfbXdx6WEhmrvPpfJZ+qxlsiYpDzsE9hKnXAtJZ1sE
         tR3YgBLFJdmd63LqZqBZ/VhEfI1YET1HO0prxR+jUXZKWFD/rrRjYV9PXe6Lo+ivjdyN
         gyRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aCJ708s1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si4483515qtm.115.2020.11.02.06.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aCJ708s1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZb6a-0007Go-RI
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb3P-0002Xp-SV
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb3L-0005GW-AH
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604328202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qP/8YRJtKkP03M8BPqXKBBV6xRtdXGyAn+uJzRiJSTI=;
 b=aCJ708s1SC6QvFp88VCWyiGIx++ZPMSD2lhSYUI0kg1rCwOwV51qFMndrwHIryGx0IYeSN
 EyI4ss6gpccUulvKf7fTWupMD7DINoaRz8enPtYLECGTIEThQyyV3d/HSr3hz6FWEmkRxw
 d9WgRsok0RhjpZXv2h3VKrX7I7ZR7rE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-6jibAEp4PleMlA1xXjO3Pg-1; Mon, 02 Nov 2020 09:43:19 -0500
X-MC-Unique: 6jibAEp4PleMlA1xXjO3Pg-1
Received: by mail-wm1-f69.google.com with SMTP id u207so3417559wmu.4
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 06:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qP/8YRJtKkP03M8BPqXKBBV6xRtdXGyAn+uJzRiJSTI=;
 b=hSdDiQCjUEPg39yN8Y8WqsvG4rfY4SbIIbAEjjSflHQdGdRV4hi4H3W0ROPkmCsa9J
 Momjun0RWa51e+3F0lfydiJMgc5S7rrDE8Cj6gRC1hr2iSUsKMWdGammHU8JCzmCLdN2
 asvurNoSbSoFz+bvmMhD+j7RpcWY5CwQjvZi7bwRDsDWYPwwpTJ//gEHqmZiU20JGRpH
 9rB7nsPerd8W9AFJ6vIn2/baG6+UEPpKjpivD94WBbL05pyXSnDkl7vXcSrPAvzNH6Oc
 afXmDPUnYahg6OPqx4Oj1Nirfk8+pn58HuYVdN9sOK4Vc6q6Y9QxWtgfGL55Z4i+gC+j
 UXyQ==
X-Gm-Message-State: AOAM532bD71G18RErvnumyH6B+8vOs4wBBWqh0K3OTSkoRa1+L3oXuQc
 bWZZ+fmUucGhFGZCkZl6bARhiJQ9Jdx9UDS8alJsxpNkrsuQ4J4WWU8oYj+yG/Dg66FFBV/KcmX
 xt/0ejoBV+tp5
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18432491wmb.16.1604328197369; 
 Mon, 02 Nov 2020 06:43:17 -0800 (PST)
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18432450wmb.16.1604328196981; 
 Mon, 02 Nov 2020 06:43:16 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 9sm12791059wmk.5.2020.11.02.06.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:43:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH-for-5.2? 5/5] tests/acceptance: Let stable tests use the
 'gating-ci' tag
Date: Mon,  2 Nov 2020 15:42:45 +0100
Message-Id: <20201102144245.2134077-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102144245.2134077-1-philmd@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HESfSP033Rl

Switch from "run all tests but disable some" to "only run the
tests tagged as stable on CI".
Declare our current set of tests as stable with the 'gating-ci'
tag.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/boot_linux.py               | 10 ++++--
 tests/acceptance/boot_linux_console.py       | 38 ++++++++++++++++++++
 tests/acceptance/cpu_queries.py              |  1 +
 tests/acceptance/empty_cpu_model.py          |  3 ++
 tests/acceptance/linux_initrd.py             |  4 +--
 tests/acceptance/machine_arm_canona1100.py   |  1 +
 tests/acceptance/machine_arm_integratorcp.py |  2 ++
 tests/acceptance/machine_arm_n8x0.py         |  2 ++
 tests/acceptance/machine_avr6.py             |  1 +
 tests/acceptance/machine_m68k_nextcube.py    |  9 +++++
 tests/acceptance/machine_mips_malta.py       |  4 ++-
 tests/acceptance/machine_rx_gdbsim.py        |  3 --
 tests/acceptance/machine_sparc64_sun4u.py    |  1 +
 tests/acceptance/machine_sparc_leon3.py      |  1 +
 tests/acceptance/migration.py                | 12 ++++++-
 tests/acceptance/pc_cpu_hotplug_props.py     |  3 ++
 tests/acceptance/ppc_prep_40p.py             |  3 +-
 tests/acceptance/replay_kernel.py            | 17 +++++++--
 tests/acceptance/version.py                  |  1 +
 tests/acceptance/virtio_version.py           |  6 ++++
 tests/acceptance/vnc.py                      |  9 +++++
 tests/acceptance/x86_cpu_model_versions.py   |  1 +
 22 files changed, 119 insertions(+), 13 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index c743e231f47..55d1ac33b6d 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -20,7 +20,6 @@
 from avocado.utils import vmimage
 from avocado.utils import datadrainer
 from avocado.utils.path import find_command
-from avocado import skipIf
 
 ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
 KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
@@ -114,6 +113,7 @@ class BootLinuxX8664(BootLinux):
 
     def test_pc_i440fx_tcg(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=machine:pc
         :avocado: tags=accel:tcg
         """
@@ -124,6 +124,7 @@ def test_pc_i440fx_tcg(self):
 
     def test_pc_i440fx_kvm(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=machine:pc
         :avocado: tags=accel:kvm
         """
@@ -134,6 +135,7 @@ def test_pc_i440fx_kvm(self):
 
     def test_pc_q35_tcg(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=machine:q35
         :avocado: tags=accel:tcg
         """
@@ -144,6 +146,7 @@ def test_pc_q35_tcg(self):
 
     def test_pc_q35_kvm(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=machine:q35
         :avocado: tags=accel:kvm
         """
@@ -171,6 +174,7 @@ def add_common_args(self):
 
     def test_virt_tcg(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
         """
@@ -184,6 +188,7 @@ def test_virt_tcg(self):
 
     def test_virt_kvm_gicv2(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=accel:kvm
         :avocado: tags=cpu:host
         :avocado: tags=device:gicv2
@@ -198,6 +203,7 @@ def test_virt_kvm_gicv2(self):
 
     def test_virt_kvm_gicv3(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=accel:kvm
         :avocado: tags=cpu:host
         :avocado: tags=device:gicv3
@@ -220,6 +226,7 @@ class BootLinuxPPC64(BootLinux):
 
     def test_pseries_tcg(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=machine:pseries
         :avocado: tags=accel:tcg
         """
@@ -236,7 +243,6 @@ class BootLinuxS390X(BootLinux):
 
     chksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
         """
         :avocado: tags=machine:s390-ccw-virtio
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8f433a67f84..70d89191d3d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -98,6 +98,7 @@ class BootLinuxConsole(LinuxKernelTest):
 
     def test_x86_64_pc(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:x86_64
         :avocado: tags=machine:pc
         """
@@ -117,6 +118,7 @@ def test_x86_64_pc(self):
 
     def test_mips_malta(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
@@ -150,6 +152,7 @@ def test_mips64el_malta(self):
         [2] https://kernel-team.pages.debian.net/kernel-handbook/
             ch-common-tasks.html#s-common-official
 
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         """
@@ -171,6 +174,7 @@ def test_mips64el_malta(self):
 
     def test_mips_malta_cpio(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
@@ -213,6 +217,7 @@ def test_mips_malta_cpio(self):
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_mips64el_malta_5KEc_cpio(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
@@ -273,6 +278,7 @@ def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
 
     def test_mips_malta32el_nanomips_4k(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
@@ -285,6 +291,7 @@ def test_mips_malta32el_nanomips_4k(self):
 
     def test_mips_malta32el_nanomips_16k_up(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
@@ -297,6 +304,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
 
     def test_mips_malta32el_nanomips_64k_dbg(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
@@ -309,6 +317,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
 
     def test_aarch64_virt(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         """
@@ -330,6 +339,7 @@ def test_aarch64_virt(self):
 
     def test_aarch64_xlnx_versal_virt(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:xlnx-versal-virt
         :avocado: tags=device:pl011
@@ -355,6 +365,7 @@ def test_aarch64_xlnx_versal_virt(self):
 
     def test_arm_virt(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:virt
         """
@@ -375,6 +386,7 @@ def test_arm_virt(self):
 
     def test_arm_emcraft_sf2(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:emcraft-sf2
         :avocado: tags=endian:little
@@ -439,6 +451,7 @@ def do_test_arm_raspi2(self, uart_id):
 
     def test_arm_raspi2_uart0(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:raspi2
         :avocado: tags=device:pl011
@@ -447,6 +460,7 @@ def test_arm_raspi2_uart0(self):
 
     def test_arm_exynos4210_initrd(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:smdkc210
         """
@@ -489,6 +503,7 @@ def test_arm_exynos4210_initrd(self):
                 'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
@@ -531,6 +546,7 @@ def test_arm_cubieboard_initrd(self):
                 'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_sata(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
@@ -622,6 +638,7 @@ def test_arm_quanta_gsj(self):
 
     def test_arm_quanta_gsj_initrd(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:quanta-gsj
         """
@@ -660,6 +677,7 @@ def test_arm_quanta_gsj_initrd(self):
                 'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         """
@@ -687,6 +705,7 @@ def test_arm_orangepi(self):
                 'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_initrd(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         """
@@ -731,6 +750,7 @@ def test_arm_orangepi_initrd(self):
                 'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_sd(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
@@ -786,6 +806,7 @@ def test_arm_orangepi_sd(self):
     @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
     def test_arm_orangepi_bionic(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
@@ -829,6 +850,7 @@ def test_arm_orangepi_bionic(self):
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_uboot_netbsd9(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
@@ -893,6 +915,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
 
     def test_aarch64_raspi3_atf(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:raspi3
         :avocado: tags=cpu:cortex-a53
@@ -915,6 +938,7 @@ def test_aarch64_raspi3_atf(self):
 
     def test_s390x_s390_ccw_virtio(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:s390x
         :avocado: tags=machine:s390-ccw-virtio
         """
@@ -935,6 +959,7 @@ def test_s390x_s390_ccw_virtio(self):
 
     def test_alpha_clipper(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:alpha
         :avocado: tags=machine:clipper
         """
@@ -956,6 +981,7 @@ def test_alpha_clipper(self):
 
     def test_ppc64_pseries(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
         """
@@ -975,6 +1001,7 @@ def test_ppc64_pseries(self):
 
     def test_m68k_q800(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:m68k
         :avocado: tags=machine:q800
         """
@@ -1010,6 +1037,7 @@ def do_test_advcal_2018(self, day, tar_hash, kernel_name, console=0):
 
     def test_arm_vexpressa9(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:vexpress-a9
         """
@@ -1019,6 +1047,7 @@ def test_arm_vexpressa9(self):
 
     def test_m68k_mcf5208evb(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:m68k
         :avocado: tags=machine:mcf5208evb
         """
@@ -1027,6 +1056,7 @@ def test_m68k_mcf5208evb(self):
 
     def test_microblaze_s3adsp1800(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:microblaze
         :avocado: tags=machine:petalogix-s3adsp1800
         """
@@ -1035,6 +1065,7 @@ def test_microblaze_s3adsp1800(self):
 
     def test_or1k_sim(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:or1k
         :avocado: tags=machine:or1k-sim
         """
@@ -1043,6 +1074,7 @@ def test_or1k_sim(self):
 
     def test_nios2_10m50(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:nios2
         :avocado: tags=machine:10m50-ghrd
         """
@@ -1051,6 +1083,7 @@ def test_nios2_10m50(self):
 
     def test_ppc64_e500(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
         """
@@ -1060,6 +1093,7 @@ def test_ppc64_e500(self):
 
     def test_ppc_g3beige(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc
         :avocado: tags=machine:g3beige
         """
@@ -1069,6 +1103,7 @@ def test_ppc_g3beige(self):
 
     def test_ppc_mac99(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mac99
         """
@@ -1078,6 +1113,7 @@ def test_ppc_mac99(self):
 
     def test_sh4_r2d(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:sh4
         :avocado: tags=machine:r2d
         """
@@ -1087,6 +1123,7 @@ def test_sh4_r2d(self):
 
     def test_sparc_ss20(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:sparc
         :avocado: tags=machine:SS-20
         """
@@ -1095,6 +1132,7 @@ def test_sparc_ss20(self):
 
     def test_xtensa_lx60(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
         """
diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
index 293dccb89ab..213c8976568 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -19,6 +19,7 @@ class QueryCPUModelExpansion(Test):
 
     def test(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:x86_64
         :avocado: tags=machine:none
         """
diff --git a/tests/acceptance/empty_cpu_model.py b/tests/acceptance/empty_cpu_model.py
index a1e59e45e4e..f60f557c054 100644
--- a/tests/acceptance/empty_cpu_model.py
+++ b/tests/acceptance/empty_cpu_model.py
@@ -11,6 +11,9 @@
 
 class EmptyCPUModel(Test):
     def test(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.vm.add_args('-S', '-display', 'none', '-machine', 'none', '-cpu', '')
         self.vm.set_qmp_monitor(enabled=False)
         self.vm.launch()
diff --git a/tests/acceptance/linux_initrd.py b/tests/acceptance/linux_initrd.py
index a249e2f14a2..bc5a86860f4 100644
--- a/tests/acceptance/linux_initrd.py
+++ b/tests/acceptance/linux_initrd.py
@@ -13,7 +13,6 @@
 import tempfile
 
 from avocado_qemu import Test
-from avocado import skipIf
 
 
 class LinuxInitrd(Test):
@@ -32,6 +31,8 @@ def test_with_2gib_file_should_exit_error_msg_with_linux_v3_6(self):
         and expect it exits with error message.
         Fedora-18 shipped with linux-3.6 which have not supported xloadflags
         cannot support more than 2GiB initrd.
+
+        :avocado: tags=gating-ci
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora/li'
                       'nux/releases/18/Fedora/x86_64/os/images/pxeboot/vmlinuz')
@@ -53,7 +54,6 @@ def test_with_2gib_file_should_exit_error_msg_with_linux_v3_6(self):
                 max_size + 1)
             self.assertRegex(self.vm.get_log(), expected_msg)
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_with_2gib_file_should_work_with_linux_v4_16(self):
         """
         QEMU has supported up to 4 GiB initrd for recent kernel
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/acceptance/machine_arm_canona1100.py
index 0e5c43dbcf8..25a05a32e9a 100644
--- a/tests/acceptance/machine_arm_canona1100.py
+++ b/tests/acceptance/machine_arm_canona1100.py
@@ -19,6 +19,7 @@ class CanonA1100Machine(Test):
 
     def test_arm_canona1100(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:canon-a1100
         :avocado: tags=device:pflash_cfi02
diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptance/machine_arm_integratorcp.py
index 49c8ebff78b..d61a966b165 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -54,6 +54,7 @@ def boot_integratorcp(self):
     def test_integratorcp_console(self):
         """
         Boots the Linux kernel and checks that the console is operational
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:integratorcp
         :avocado: tags=device:pl011
@@ -67,6 +68,7 @@ def test_integratorcp_console(self):
     def test_framebuffer_tux_logo(self):
         """
         Boot Linux and verify the Tux logo is displayed on the framebuffer.
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:integratorcp
         :avocado: tags=device:pl110
diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/acceptance/machine_arm_n8x0.py
index e5741f2d8d1..94e6844664a 100644
--- a/tests/acceptance/machine_arm_n8x0.py
+++ b/tests/acceptance/machine_arm_n8x0.py
@@ -35,6 +35,7 @@ def __do_test_n8x0(self):
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_n800(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:n800
         """
@@ -43,6 +44,7 @@ def test_n800(self):
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_n810(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:n810
         """
diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
index 6baf4e9c7f3..a340b63fd5c 100644
--- a/tests/acceptance/machine_avr6.py
+++ b/tests/acceptance/machine_avr6.py
@@ -26,6 +26,7 @@ class AVR6Machine(Test):
 
     def test_freertos(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:avr
         :avocado: tags=machine:arduino-mega-2560-v3
         """
diff --git a/tests/acceptance/machine_m68k_nextcube.py b/tests/acceptance/machine_m68k_nextcube.py
index 2baba5fdc26..fa027a9aff9 100644
--- a/tests/acceptance/machine_m68k_nextcube.py
+++ b/tests/acceptance/machine_m68k_nextcube.py
@@ -69,6 +69,9 @@ def check_bootrom_framebuffer(self, screenshot_path):
 
     @skipUnless(PIL_AVAILABLE, 'Python PIL not installed')
     def test_bootrom_framebuffer_size(self):
+        """
+        :avocado: tags=gating-ci
+        """
         screenshot_path = os.path.join(self.workdir, "dump.ppm")
         self.check_bootrom_framebuffer(screenshot_path)
 
@@ -78,6 +81,9 @@ def test_bootrom_framebuffer_size(self):
 
     @skipUnless(tesseract_available(3), 'tesseract v3 OCR tool not available')
     def test_bootrom_framebuffer_ocr_with_tesseract_v3(self):
+        """
+        :avocado: tags=gating-ci
+        """
         screenshot_path = os.path.join(self.workdir, "dump.ppm")
         self.check_bootrom_framebuffer(screenshot_path)
 
@@ -94,6 +100,9 @@ def test_bootrom_framebuffer_ocr_with_tesseract_v3(self):
     # that it is still alpha-level software.
     @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not available')
     def test_bootrom_framebuffer_ocr_with_tesseract_v4(self):
+        """
+        :avocado: tags=gating-ci
+        """
         screenshot_path = os.path.join(self.workdir, "dump.ppm")
         self.check_bootrom_framebuffer(screenshot_path)
 
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index eea046141d6..d7ed035fe73 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -15,7 +15,6 @@
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
-from avocado import skipIf
 
 
 NUMPY_AVAILABLE = True
@@ -94,6 +93,7 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
 
     def test_mips_malta_i6400_framebuffer_logo_1core(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=cpu:i6400
@@ -102,6 +102,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
 
     def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=cpu:i6400
@@ -111,6 +112,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
 
     def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=cpu:i6400
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/acceptance/machine_rx_gdbsim.py
index 32b737b6d85..c565b4f5da1 100644
--- a/tests/acceptance/machine_rx_gdbsim.py
+++ b/tests/acceptance/machine_rx_gdbsim.py
@@ -10,7 +10,6 @@
 
 import os
 
-from avocado import skipIf
 from avocado_qemu import Test
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
@@ -22,7 +21,6 @@ class RxGdbSimMachine(Test):
     timeout = 30
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_uboot(self):
         """
         U-Boot and checks that the console is operational.
@@ -46,7 +44,6 @@ def test_uboot(self):
         # FIXME limit baudrate on chardev, else we type too fast
         #exec_command_and_wait_for_pattern(self, 'version', gcc_version)
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_linux_sash(self):
         """
         Boots a Linux kernel and checks that the console is operational.
diff --git a/tests/acceptance/machine_sparc64_sun4u.py b/tests/acceptance/machine_sparc64_sun4u.py
index 458165500ec..c94cd6d84b1 100644
--- a/tests/acceptance/machine_sparc64_sun4u.py
+++ b/tests/acceptance/machine_sparc64_sun4u.py
@@ -21,6 +21,7 @@ class Sun4uMachine(LinuxKernelTest):
 
     def test_sparc64_sun4u(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:sparc64
         :avocado: tags=machine:sun4u
         """
diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/machine_sparc_leon3.py
index 2405cd7a0d7..881ef09ef6f 100644
--- a/tests/acceptance/machine_sparc_leon3.py
+++ b/tests/acceptance/machine_sparc_leon3.py
@@ -19,6 +19,7 @@ class Leon3Machine(Test):
     # and QEMU exit calling cpu_abort(), which makes this test to fail.
     def test_leon3_helenos_uimage(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:sparc
         :avocado: tags=machine:leon3_generic
         :avocado: tags=binfmt:uimage
diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index 792639cb693..4194539e832 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -64,17 +64,27 @@ def _get_free_port(self):
 
 
     def test_migration_with_tcp_localhost(self):
+        """
+        :avocado: tags=gating-ci
+        """
         dest_uri = 'tcp:localhost:%u' % self._get_free_port()
         self.do_migrate(dest_uri)
 
     def test_migration_with_unix(self):
+        """
+        :avocado: tags=gating-ci
+        """
         with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
             dest_uri = 'unix:%s/qemu-test.sock' % socket_path
             self.do_migrate(dest_uri)
 
     @skipUnless(find_command('nc', default=False), "'nc' command not found")
     def test_migration_with_exec(self):
-        """The test works for both netcat-traditional and netcat-openbsd packages."""
+        """
+        The test works for both netcat-traditional and netcat-openbsd packages.
+
+        :avocado: tags=gating-ci
+        """
         free_port = self._get_free_port()
         dest_uri = 'exec:nc -l localhost %u' % free_port
         src_uri = 'exec:nc localhost %u' % free_port
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/pc_cpu_hotplug_props.py
index 08b7e632c60..3e264fa3399 100644
--- a/tests/acceptance/pc_cpu_hotplug_props.py
+++ b/tests/acceptance/pc_cpu_hotplug_props.py
@@ -27,6 +27,9 @@ class OmittedCPUProps(Test):
     :avocado: tags=arch:x86_64
     """
     def test_no_die_id(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.vm.add_args('-nodefaults', '-S')
         self.vm.add_args('-smp', '1,sockets=2,cores=2,threads=2,maxcpus=8')
         self.vm.add_args('-cpu', 'qemu64')
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 96ba13b8943..9e60576fcb2 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -7,7 +7,6 @@
 
 import os
 
-from avocado import skipIf
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
@@ -49,6 +48,7 @@ def test_factory_firmware_and_netbsd(self):
 
     def test_openbios_192m(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
         """
@@ -62,6 +62,7 @@ def test_openbios_192m(self):
 
     def test_openbios_and_netbsd(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
         """
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 00c228382bd..a231426661d 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -14,7 +14,6 @@
 import logging
 import time
 
-from avocado import skipIf
 from avocado import skipUnless
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
@@ -77,7 +76,6 @@ def run_rr(self, kernel_path, kernel_command_line, console_pattern,
         logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
 
 class ReplayKernelNormal(ReplayKernelBase):
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_x86_64_pc(self):
         """
         :avocado: tags=arch:x86_64
@@ -96,6 +94,7 @@ def test_x86_64_pc(self):
 
     def test_mips_malta(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
@@ -125,6 +124,7 @@ def test_mips64el_malta(self):
         [2] https://kernel-team.pages.debian.net/kernel-handbook/
             ch-common-tasks.html#s-common-official
 
+        :avocado: tags=gating-ci
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         """
@@ -141,6 +141,7 @@ def test_mips64el_malta(self):
 
     def test_aarch64_virt(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=cpu:cortex-a53
@@ -160,6 +161,7 @@ def test_aarch64_virt(self):
 
     def test_arm_virt(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:virt
         """
@@ -175,7 +177,6 @@ def test_arm_virt(self):
 
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=1)
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
                 'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
@@ -211,6 +212,7 @@ def test_arm_cubieboard_initrd(self):
 
     def test_ppc64_pseries(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
         """
@@ -227,6 +229,7 @@ def test_ppc64_pseries(self):
 
     def test_m68k_q800(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:m68k
         :avocado: tags=machine:q800
         """
@@ -258,6 +261,7 @@ def do_test_advcal_2018(self, file_path, kernel_name, args=None):
 
     def test_arm_vexpressa9(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:arm
         :avocado: tags=machine:vexpress-a9
         """
@@ -271,6 +275,7 @@ def test_arm_vexpressa9(self):
 
     def test_m68k_mcf5208evb(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:m68k
         :avocado: tags=machine:mcf5208evb
         """
@@ -282,6 +287,7 @@ def test_m68k_mcf5208evb(self):
 
     def test_microblaze_s3adsp1800(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:microblaze
         :avocado: tags=machine:petalogix-s3adsp1800
         """
@@ -293,6 +299,7 @@ def test_microblaze_s3adsp1800(self):
 
     def test_ppc64_e500(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
         :avocado: tags=cpu:e5500
@@ -305,6 +312,7 @@ def test_ppc64_e500(self):
 
     def test_ppc_g3beige(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc
         :avocado: tags=machine:g3beige
         """
@@ -317,6 +325,7 @@ def test_ppc_g3beige(self):
 
     def test_ppc_mac99(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mac99
         """
@@ -329,6 +338,7 @@ def test_ppc_mac99(self):
 
     def test_sparc_ss20(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:sparc
         :avocado: tags=machine:SS-20
         """
@@ -340,6 +350,7 @@ def test_sparc_ss20(self):
 
     def test_xtensa_lx60(self):
         """
+        :avocado: tags=gating-ci
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
         :avocado: tags=cpu:dc233c
diff --git a/tests/acceptance/version.py b/tests/acceptance/version.py
index 79b923d4fc0..481b94440e5 100644
--- a/tests/acceptance/version.py
+++ b/tests/acceptance/version.py
@@ -14,6 +14,7 @@
 
 class Version(Test):
     """
+    :avocado: tags=gating-ci
     :avocado: tags=quick
     """
     def test_qmp_human_info_version(self):
diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio_version.py
index 187bbfa1f42..32fed541ce9 100644
--- a/tests/acceptance/virtio_version.py
+++ b/tests/acceptance/virtio_version.py
@@ -149,6 +149,9 @@ def test_conventional_devs_fsdev(self):
         self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
 
     def test_conventional_devs(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.check_all_variants('virtio-net-pci', VIRTIO_NET)
         self.check_all_variants('virtio-serial-pci', VIRTIO_CONSOLE)
         self.check_all_variants('virtio-rng-pci', VIRTIO_RNG)
@@ -171,6 +174,9 @@ def check_modern_only(self, qemu_devtype, virtio_devid):
         self.assertIn('pci-express-device', ifaces)
 
     def test_modern_only_devs(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.check_modern_only('virtio-vga', VIRTIO_GPU)
         self.check_modern_only('virtio-gpu-pci', VIRTIO_GPU)
         self.check_modern_only('virtio-mouse-pci', VIRTIO_INPUT)
diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index 3f40bc2be11..a0fe0a16a00 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -21,6 +21,9 @@ def test_no_vnc(self):
         self.assertFalse(self.vm.qmp('query-vnc')['return']['enabled'])
 
     def test_no_vnc_change_password(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.vm.add_args('-nodefaults', '-S')
         self.vm.launch()
         self.assertFalse(self.vm.qmp('query-vnc')['return']['enabled'])
@@ -35,6 +38,9 @@ def test_no_vnc_change_password(self):
                          'Could not set password')
 
     def test_change_password_requires_a_password(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
         self.vm.launch()
         self.assertTrue(self.vm.qmp('query-vnc')['return']['enabled'])
@@ -49,6 +55,9 @@ def test_change_password_requires_a_password(self):
                          'Could not set password')
 
     def test_change_password(self):
+        """
+        :avocado: tags=gating-ci
+        """
         self.vm.add_args('-nodefaults', '-S', '-vnc', ':0,password')
         self.vm.launch()
         self.assertTrue(self.vm.qmp('query-vnc')['return']['enabled'])
diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/x86_cpu_model_versions.py
index 01ff614ec25..715329760e2 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -28,6 +28,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
     """
     Validation of PC CPU model versions and CPU model aliases
 
+    :avocado: tags=gating-ci
     :avocado: tags=arch:x86_64
     """
     def validate_aliases(self, cpus):
-- 
2.26.2

