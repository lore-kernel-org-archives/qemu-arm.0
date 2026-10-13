Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96753CC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:52:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGa6s-0004kN-Fx; Tue, 13 Oct 2026 06:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGa6r-0004k7-DQ
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:51:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGa6p-00060l-OH
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:51:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so17666335e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791888710; x=1792493510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bRyz74roj7Gk7mgs1Uzn7YPeAkhJHfzrPoxB4VBW06s=;
 b=VFih+bF+wkPmDRSHT5MfWsbay3e9rdZuzpJ5cH0SWdzQhjEppRSqW/+wvosU37ev2D
 ixzIvz8xARkb0+sJcrK7fZAaLpkWNk4mKrov/KJXkNpVHZfekyRqZMGSVDAQMsb6ZHz3
 oMsfXeVjfghrNgNPhiSRRzDlMGJ16LtcJGhMTwIjskyxrvrdFw0+QB00FOH7+z6vA5xk
 RuFdkZuS3Lp8p4vZwqojnGYGA889S5zE4+sVcG07dPZduWKISFtG86IZLylK79wLyOqT
 3XY3DqkI1HodXAVLjNEOGd5Xm4jcTWjepNzxj2fTzyLEje8YqozC0s9Zwhnq8Us7Fb5Q
 3opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791888710; x=1792493510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bRyz74roj7Gk7mgs1Uzn7YPeAkhJHfzrPoxB4VBW06s=;
 b=MuaPfr9tzzjBiBpFXUvbhWO/EmEvBh1/r2V3OtLtyOYXH/aF0btqU6s3FjCqdAbWFZ
 m58bASIIdoXTaqAkieAxyBdi5LMJKk0gQqBdBY3FITGcnP7BVQcm5mNzDywZIwnAHN5i
 oOx4EV35ZOTYmxeX/JfJYSh+QjkReYSVgcJjwFgDOQtweqI3+e2incd3rF/lKHkoRinx
 HfEUVml5ILj96bpJuDNZePzBQxulP3ygq8ZKKUJJX45BsU4s1guPEu26Qkw5UjOFoR0t
 6p6MgWTOI7cRHmUqKBXTMGTbO8Z4dQekPQEfsJAtJWlRWmBXUn+TzwLU1lCBBmOLV1pO
 9Bqg==
X-Gm-Message-State: AFq9FYKM56NmvI5H2rGKze/o6xXhY12HBasOUaCUkjHDSVBiznwlJVfu
 kF5ug0UJlvR6sFidOtfwrUZjHvKnInn2JkT1180V4egFxupzEcAsPxR3U6JK7jrn4OlROV8vtk5
 nKAcvUuY=
X-Gm-Gg: AYBFou2kTjqy43UGuxLWTC008ZzFLhh7sjJmhHQkC1s0LJTh7ljsiEjxNqbwtmjZpoX
 yUv/iSwLImW5B/IYDi/hD3tKs0ej6CJYAJrzZhAkEMhsCy2XDjPH+qslg4brbvaKUYm/OpDLDBo
 gRnG8p3TjoZjyHyGFgCh+YNqPUdJuLrAODoFkdiJcuTmQchOvvaegvcAy6fiKLQuvsgk2ipWHsx
 QR3Dw/G6kHqMDrumMQz5RqsHk8Aa2J/z+XtJDuAw4ybXpxQUmKOw8lAjj4IPP7tIrxlUHvArVEq
 UGymoBIYjmeYvoU4ND+2Iy2UQfD2SCypL3AWNkNiS0E/+lYhBuyPMfsnLGZ4SqIBqiWVYT7JpQd
 3i/W1UJHOMHUVQ9GXAdZnOk/8THQ+6teY5rYtR/HL9+373m5VcUKYRy+9fUurkjxBLqaIgWAp8G
 Y116W9JogJ2EHglvC78gdjqi+C1jFFIELR/3SJKk/DynclcoRLktarFrTyMCE16Q5AUeg8E6uZC
 BophIzlenvv3PEW2egJXjLMD5TiCX1cBZt0PWnK7IJbLcCNAT7hua26NVlsNrSwc9hI8oRVgV8j
 3WA=
X-Received: by 2002:a05:600c:8206:b0:4a1:6811:8d with SMTP id
 5b1f17b1804b1-4a18e4a3b34mr238630055e9.11.1791888709875; 
 Tue, 13 Oct 2026 03:51:49 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19ba624b3sm242473825e9.2.2026.10.13.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 03:51:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PATCH] target/arm: Deprecate using named CPU models with KVM
Date: Tue, 13 Oct 2026 11:51:47 +0100
Message-ID: <20261013105147.1070641-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently when using KVM on Arm, the normal thing is to use either
the 'host' or 'max' CPU types, both of which give the guest the same
CPU as the host.  We also for legacy reasons allow 'cortex-a53' and
'cortex-a57' CPU types, which will only work when the host CPU is
exactly that matching CPU.  This is because the original idea of the
KVM ABI was that userspace would request a particular CPU type by
setting the target field in the KVM_ARM_VCPU_INIT ioctl to an
appropriate KVM_ARM_TARGET_* constant.  However, it quickly became
clear that this was a bad idea, and now everything uses
KVM_ARM_TARGET_GENERIC_V8; the tiny number of existing CPU-specific
target values behave identically to GENERIC_V8 except that they will
only work if the host CPU matches them.

Future support for "show the KVM guest a CPU type that's not
identical to the host" is going to work by telling it different ID
register values.  Real Cortex-A53 and A57 CPUs are now all over a
decade old and not in widespread use.  Deprecate the ability to use
'-cpu cortex-a53' and '-cpu cortex-a57' with KVM, to get rid of this
odd legacy corner and open up the opportunity in future to support
named CPU types via ID register settings if we want that.

For any situation where the cortex-a53 and cortex-a57 CPU types
currently work with KVM, '-cpu host' or '-cpu max' will have
identical behaviour.  (Though note that if you are using "KVM, but
fall back to TCG" then the fallback under TCG will be different.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Personally I doubt anybody is actually using these named
CPU types...
---
 docs/about/deprecated.rst | 13 +++++++++++++
 target/arm/kvm.c          |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ccbc4219497..153fe118151 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -234,6 +234,19 @@ in the QEMU object model anymore. ``Sun-UltraSparc-IIIi+`` and
 but for consistency these will get removed in a future release, too.
 Use ``Sun-UltraSparc-IIIi-plus`` and ``Sun-UltraSparc-IV-plus`` instead.
 
+``cortex-a53`` and ``cortex-a57`` CPU names with KVM on Arm (since 11.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+QEMU currently allows the CPU name to be set to ``cortex-a53`` or
+``cortex-a57`` when using KVM; this is identical to using ``host`` or
+``max``, but it will only work when the host CPU is a Cortex-A53 or
+Cortex-A57.  These CPUs are now over 10 years old, and the ability to
+use the named CPU type like this is part of a legacy corner of the KVM
+API, which doesn't work with any other host CPU types. Using these CPU
+names with KVM enabled is deprecated; use ``host`` or ``max`` instead,
+which will have identical behaviour on the hosts where using
+``cortex-a53`` or ``cortex-a57`` works.
+
 System emulator machines
 ------------------------
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3d905f8565d..de09d63d2e3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2015,6 +2015,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return -EINVAL;
     }
 
+    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_CORTEX_A53 ||
+        cpu->kvm_target == QEMU_KVM_ARM_TARGET_CORTEX_A57) {
+        warn_report_once("Using the cortex-a53 and cortex-a57 CPU types "
+                         "with KVM is deprecated. Use the max or host CPU "
+                         "types instead.");
+    }
+
     qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cpu);
 
     /* Determine init features for this CPU */
-- 
2.43.0


