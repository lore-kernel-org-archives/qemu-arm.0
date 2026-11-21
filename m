Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3DC606A332
	for <qemu-arm@archiver.kernel.org>; Sat, 21 Nov 2026 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXWFe4tW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUryY-0004U1-LW; Sat, 21 Nov 2026 15:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xUryX-0004TP-JU
 for qemu-arm@nongnu.org; Sat, 21 Nov 2026 15:46:21 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xUryV-000649-Gi
 for qemu-arm@nongnu.org; Sat, 21 Nov 2026 15:46:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so18092495e9.2
 for <qemu-arm@nongnu.org>; Sat, 21 Nov 2026 12:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795293978; x=1795898778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AaHxvjxuFM0ZGMpfN7ZubYdgVJfxHgv6fA2HEiSYIX0=;
 b=iXWFe4tW3Q8x0UpVHDTxmp72AqFepQPVLBgozGCB6U3G4wqffMM1kyK/8wXhdZwWe9
 U0U7aWGeltl2kgshqVtODII7/uzokkMgfs6lEwv3PXZIO8FD4qJOcRSappDNHwLS76j8
 M6/LKLVWeiPRMqt9UHkRzRBF1J4NoHPAkQ0YSH4q3BQXKuot5G9elOqy2VrtpJusc88I
 CiklkbkWQC/V2KYiy5KphlgUFH2r3AwmLqZyTXb4fNIM6/XsavowmVMrSzURlCdwAoVY
 R4q5s2gnYGnVaaq/3MQA8wMKUu4cHgsbb/txxmXojRYIPP+snOSLRqppxOy7s5TVYIFP
 xzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795293978; x=1795898778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AaHxvjxuFM0ZGMpfN7ZubYdgVJfxHgv6fA2HEiSYIX0=;
 b=ybHCzdmlKp123Ogjz1KK8oUrwHP1xRh+cgLzJWrAYIsy5Q1APoAfaapF6e+f2bqfkb
 Z5M1SDOgPkRzDqTKb+tmSTFn/6ybPCaDEqb1gPjtSNt5a30gUrEd5NKenNBzUtKqO1qe
 dsSuog9RRUG15Qg2aSTj/Ex+0mIBLtGej+l7FbbsY3Yi+vHrWYzDn+iGPDyqE9yes5oB
 QnEKN8vwKbhqKHUESmtKCP80rRRjidCrt9JHKEo0a4nP1muWF7Z4r+HqiEmLH0JUpf7j
 YCPfm1dixFXcVD7WREqf7dRNDm2m+GTAE4+tUxOsZRPr96ATZ6IJboYeg+6i1kQKnjhw
 Eo2w==
X-Forwarded-Encrypted: i=1;
 AL+hErEOMZvFlsud2/uQwrXaboGlpNuiEiBho4csW7GgEsOv7y/pTG5dKIV1NdsgcVfhVGmQUJuI2MJm+g==@nongnu.org
X-Gm-Message-State: APuU4Z8ytUN3FVZ2d7gFV1vVzlDKf7D5b+6jtk2zI0Z/QyLErhLQAUPD
 HOdLiaLIdoU8MxFo10GvITapQLSmSZGV1LLPV7FlJCgqVYssKSxD2Rwv
X-Gm-Gg: AZFdTZc80YJigpeNY5drnCuuUzp7vAv03366smINZiLUouv7/HV15e0RbmRiu7iNl+B
 Z9xDBArxdFo+R+NSlf4Bf4eG1Uq+X1C7hP5OKJ6yEJkSaNeXnqVCksRSryH0l5uxHJdTJppyctq
 ogY5IQXfYbkIU3ijeOdDeNnzVznC0mK5MnfQrhN+N/Zi/RKD8a7qidkQcRsJB8qRebYyNycKArT
 NIARA0sRYykUS4m4oVPTfafjF4y1Tp37rGraU4P14iE66nR3wXpZkakMmbC+0z0UBNUK88PEXOF
 V9nsUHjTG0r6MWUIK4YWfm7ryNRGywgLmG+HlWh3qo9XQrAD2eBFBrYWpl95MaqelVyLLup7a1E
 9JZ2tJm3KM43vrmKzI6J1lA+proiDa6l319MhWgqxAxSRpV3PFVqe5BRbeazMNqKpLZyly+4kXt
 7XeA9YwdkT3IUW9Rzs6XmYVP8gAbjnDt4HaXg7jiCq/TSf0Jzy38g+UNq1k5lF2ybExfGZJ4RHv
 187SdkfhQ5r9xgh+EHAqsJHqPnJaWwtAxEiLViUKWkdUDJuUOU08A9CDLtVCKAwmlR7K6XkKD+g
 cADb9TMvf/pvLfxSAuxPBD4Up97obv5OqnBrp/AY8CzB/VuLcwU705mjRtyW/uuf41wi5cWJpc/
 tUpWastuudcgbIjQ9mTJJj8c=
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id
 5b1f17b1804b1-4bb88940f1bmr154944795e9.34.1795293978122; 
 Sat, 21 Nov 2026 12:46:18 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b39b6sm180652385e9.12.2026.11.21.12.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 12:46:17 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Eric Auger <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [RFC PATCH v2 3/3] tests/functional: Add a KVM selftest for an
 nVHE-only EL2
Date: Sun, 22 Nov 2026 01:46:01 +0500
Message-ID: <20261121204601.741616-4-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121204601.741616-1-haseebashraf091@gmail.com>
References: <20261121095636.289814-1-haseebashraf091@gmail.com>
 <20261121204601.741616-1-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=haseebashraf091@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Run the existing kvm-unit-tests smoke test with VHE hidden from the
guest hypervisor through SYSREG_ID_AA64MMFR1_EL1_VH=0.  The SYSREG_*
properties are available only for the host CPU model with KVM, so
select the accelerator and CPU model explicitly, and check that the
guest kernel initialized its hypervisor in nVHE mode.  The test is
skipped when the host kernel cannot limit EL2 to nVHE.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---

v2:
 - Select KVM and the host CPU model explicitly.
 - Verify the guest kernel reports nVHE mode.

 tests/functional/aarch64/test_kvm.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
index c977e8c6d2..b7a4aceb66 100755
--- a/tests/functional/aarch64/test_kvm.py
+++ b/tests/functional/aarch64/test_kvm.py
@@ -30,7 +30,7 @@ class Aarch64VirtKVMTests(LinuxKernelTest):
     # base of tests
     KUT_BASE = "/usr/share/kvm-unit-tests/"
 
-    def _launch_guest(self, kvm_mode="nvhe"):
+    def _launch_guest(self, kvm_mode="nvhe", cpu="max", accel=None):
 
         self.set_machine('virt')
         kernel_path = self.ASSET_KVM_TEST_KERNEL.fetch()
@@ -39,7 +39,9 @@ def _launch_guest(self, kvm_mode="nvhe"):
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                f"console=ttyAMA0 kvm-arm.mode={kvm_mode}")
 
-        self.vm.add_args("-cpu", "max")
+        if accel:
+            self.vm.add_args("-accel", accel)
+        self.vm.add_args("-cpu", cpu)
         self.vm.add_args("-machine", "virt,gic-version=3,virtualization=on",
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
@@ -50,6 +52,9 @@ def _launch_guest(self, kvm_mode="nvhe"):
         except VMLaunchFailure as excp:
             if "does not support providing Virtualization" in excp.output:
                 self.skipTest("accelerator has no virtualization support")
+            elif ("SYSREG_ID_AA64MMFR1_EL1_VH" in excp.output and
+                  "not found" in excp.output):
+                self.skipTest("host KVM cannot limit EL2 to nVHE")
             else:
                 self.log.info("unhandled launch failure: %s", excp.output)
                 raise excp
@@ -73,5 +78,18 @@ def test_aarch64_vhe_selftest(self):
         self._launch_guest("vhe")
         self._smoketest_kvm()
 
+    def test_aarch64_nvhe_only_selftest(self):
+        # Hiding VHE from the guest hypervisor is a KVM feature: the
+        # SYSREG_* properties only exist for the host CPU model with KVM.
+        self.require_accelerator("kvm")
+        self._launch_guest("nvhe", "host,SYSREG_ID_AA64MMFR1_EL1_VH=0",
+                           accel="kvm")
+        # The guest kernel must run its hypervisor in nVHE mode
+        ec_and_wait(self, "dmesg | grep -Eq "
+                    "'Hyp (nVHE )?mode initialized successfully' && "
+                    "! dmesg | grep -q ' VHE mode initialized'",
+                    self.OK_CMD)
+        self._smoketest_kvm()
+
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.34.1


