Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp307117njc;
        Fri, 21 Feb 2025 06:07:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWe8IA5fHEj/ZpcytLOlbCGUpucmi6UaDb6STIPyX3AZBTmtaKSfFqLZfthXhhOgsp62Ucohu/XNdS8xA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7a2KMtRz9Q/PGlV2TpnI/c79P6dfT/aJ+08WISGgmKUQwdZYGRGN/dTHQML/G9Iu2MC1+
X-Received: by 2002:ac8:5ac8:0:b0:472:61:64f with SMTP id d75a77b69052e-47222994b47mr44321561cf.49.1740146845882;
        Fri, 21 Feb 2025 06:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740146845; cv=none;
        d=google.com; s=arc-20240605;
        b=Uxd3EZFSJ5GofU3hHBagfAZwnGQKi8NbYAj/+juI1LWIqcnRXMmWyqMRxQHiVyoJMP
         HND4TkvRN3loQ1kdWRUJTp9CE4YYGUfaCMV1HGqWlaO5ZzC8bCmugIsRygm7WbRLkItz
         OVYgIdgLfDc0WydMCOSug3CHJwGR9ae84PisQQe3KL2FOCKmUMwjJHR1+9jKKdcL1hm3
         hZRwU8gxt0BaNTJvKuvI42V+xKXh7DlflObA65a1xix4E+/t5W1R7KBwHp2Fl3Ikovcj
         iCogceHn51du370M6CMq7oq2zPig3CyrvXNIHotGIuS3qBZOD/8UIpgNP041ibtKzDz/
         ZHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=otGMBD+B4/VET7RFn8bZmOFcmmLMoF/BIhvFgKTCsGs=;
        fh=6ygh8lbf+XvspWpGPd8xbHB0rPIUJcrgvR9vA5/qhQM=;
        b=X6+Xaw/X/5ACapm2ISW66QqUpFjUfQ2clNvUfoGCe2+wyVUsJyBSdZnndzVz9Q0/1a
         DyMenR6bBR06Pu8W0HyQc0qhhz0M9a61WehIs9W+gbuaJcplM0QsQZu/cpORSufDL/1o
         WDigvCr3Csx8q89BFiz0u+Uv1IE3R7QoO6Z3YjJDbi22f6LU8KfWRULFtzWaOtROrq/g
         aC0TyiUcqk0odH+xNJNv8pbtwv4rknWHUzqOiaZ2wdTMB0KKtAJiSuR5UTylyRj7T5/v
         mVguhQvRS1hPLmtN2rQ/VX/eI+3N62iyPEx+GRsdalgHIxlbbFG9v5NrDp6nYtr7u/Ct
         o2eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhqaN6FT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f473426dsi91278051cf.565.2025.02.21.06.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 06:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhqaN6FT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlTg3-0004mP-91; Fri, 21 Feb 2025 09:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlTfz-0004db-VX
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 09:06:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlTfx-0003ZQ-Kg
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 09:06:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso21562665e9.2
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2025 06:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740146803; x=1740751603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=otGMBD+B4/VET7RFn8bZmOFcmmLMoF/BIhvFgKTCsGs=;
 b=YhqaN6FTMmWrU4m1oV66ejG5GeVFPODtMwHYesVlEd1zoPelSjsqtsAOj0HPsrCYID
 SjmS0ovn1GFXSzV8f6XBNfj5WXE9vaAu/7yTB876FbZ0OcqYzK6Z4t89nXpAFNApLEZf
 uGubA4eaIT1TAi7bPCChRV96DBjHpnzZiG4A/F8g/xCwA/8c25MyDEpv6AMyT7Xtj2H7
 KPTLtY+NaXoemdPES1CAkdHRuY8bNSt9D3hzTH8ltIOpincgikLNtkpe60kUW6XZMfq8
 KQFzFi1JyfZyYsPXy9lKcYlRJ9hSFPy5l07GYdu9m6u7QUmIKr3xZYf6j/iz66gGFY50
 lQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740146803; x=1740751603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=otGMBD+B4/VET7RFn8bZmOFcmmLMoF/BIhvFgKTCsGs=;
 b=Lfi1C6iMfGS9INOS9N/Hyc+3bs+MV51msMdfGXHY782mu4fI15eW6fH3TNGNTx4LJi
 ldp9IoA6DemRVRx6Gjnf2NMyold3SgG6o1fXSZchjCLI+OXhQhmAnWanTdhS6w91102P
 R7fdHbG7e4yrXsty3KHG2pGjujID5ruF7C7WOu4H1gtiAcwHdXUr20l0q3CksL5qluPY
 OshusbqizYvVw7rW4sYYZjikb2x/vhnkwpxfHiUQ6VuPUB85t14F1D4kRfhcKpnQRNm7
 B0wk9k0mHdNJ0+qFjPTi1EH3+30qy2XYNF4JAuCtu7SkEmY31EmhwL9lMpE7ew2qWSwa
 aOUg==
X-Gm-Message-State: AOJu0YwYBdxphIht8mfRd96fSXK8S9KCurhjCfSPbJFHwdP4O4xGeV+o
 ttuIXj6r24x6bbSHwTtEvU2zwYSMO97hdx2qEKQmqk+Tk6lzjmq3SUt11TodUVnAMjpdXoXMjr4
 P
X-Gm-Gg: ASbGnctzp+RoMjC65y/P8OMfwaGgNCJB3/2z5a7tf2szvUhpjeqqDwPke/BWqMTK4rR
 cNvmJcqGXR1T6tZ4RV0qbzi57/QqGQ+4w6N+o9+yM3I0Bb0mUli/awhkkfgE2OUcYosdNl58iha
 XAL0ZMQoc8wmA41c2efl1/+6kN/d8BguDqTREoSqDCy74OgICc/d1fAUoszsW2F9UFro68Vfj/k
 x3XXg7kdDDyKbBDVhMbsj2zRLlcSeecsi4C6Y6TVQqV5g3DS+nCM75i0DxDZ0nkxzzZ67tJ3C6z
 cE7oUt10zw7+N55yNu1wu4M4pzZFALh+
X-Received: by 2002:a05:600c:46c9:b0:439:93d2:72b4 with SMTP id
 5b1f17b1804b1-439ae1f159fmr40024825e9.16.1740146803111; 
 Fri, 21 Feb 2025 06:06:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399c5f901bsm40455475e9.3.2025.02.21.06.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 06:06:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/functional: Bump some arm test timeouts
Date: Fri, 21 Feb 2025 14:06:40 +0000
Message-ID: <20250221140640.786341-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CCyoYDUorLvZ

On my local machine, for a debug build, sbsaref_alpine takes
nearly 900s:

$ (cd build/x86 && ./pyvenv/bin/meson test --setup thorough --suite func-thorough func-aarch64-aarch64_sbsaref_alpine
)

1/1 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_sbsaref_alpine
                      OK 896.90s

arm_aspeed_rainier can also run close to its current timeout:
 6/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspeed_rainier
                      OK 215.75s

and arm_aspeed_ast2500 and arm_aspeed_ast2600 can go over:
13/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspeed_ast2600
                      OK 792.94s

27/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspeed_ast2500
                 TIMEOUT 480.01s

The sx1 test fails not on the overall meson timeout but on the
60 second timeout in some of the subtests.

Bump all these timeouts up a bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This at least gets 'make -j4 check-functional' to passing for me
for an arm/aarch64 debug build, apart from the gpu test hang which
we're discussing in a different thread. Whole thing takes 25 mins...
---
 tests/functional/meson.build     | 8 ++++----
 tests/functional/test_arm_sx1.py | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index b516d21cba1..effa31701cf 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -15,16 +15,16 @@ test_timeouts = {
   'aarch64_raspi4' : 480,
   'aarch64_rme_virt' : 1200,
   'aarch64_rme_sbsaref' : 1200,
-  'aarch64_sbsaref_alpine' : 720,
+  'aarch64_sbsaref_alpine' : 1200,
   'aarch64_sbsaref_freebsd' : 720,
   'aarch64_tuxrun' : 240,
   'aarch64_virt' : 720,
   'acpi_bits' : 420,
   'arm_aspeed_palmetto' : 120,
   'arm_aspeed_romulus' : 120,
-  'arm_aspeed_ast2500' : 480,
-  'arm_aspeed_ast2600' : 720,
-  'arm_aspeed_rainier' : 240,
+  'arm_aspeed_ast2500' : 720,
+  'arm_aspeed_ast2600' : 1200,
+  'arm_aspeed_rainier' : 480,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
   'arm_cubieboard' : 360,
diff --git a/tests/functional/test_arm_sx1.py b/tests/functional/test_arm_sx1.py
index b85bfaa178f..4dd1e1859fa 100755
--- a/tests/functional/test_arm_sx1.py
+++ b/tests/functional/test_arm_sx1.py
@@ -44,7 +44,7 @@ def test_arm_sx1_initrd(self):
         self.vm.add_args('-no-reboot')
         self.launch_kernel(zimage_path,
                            initrd=initrd_path)
-        self.vm.wait(timeout=60)
+        self.vm.wait(timeout=120)
 
     def test_arm_sx1_sd(self):
         self.set_machine('sx1')
@@ -55,7 +55,7 @@ def test_arm_sx1_sd(self):
         self.vm.add_args('-snapshot')
         self.vm.add_args('-drive', f'format=raw,if=sd,file={sd_fs_path}')
         self.launch_kernel(zimage_path)
-        self.vm.wait(timeout=60)
+        self.vm.wait(timeout=120)
 
     def test_arm_sx1_flash(self):
         self.set_machine('sx1')
@@ -66,7 +66,7 @@ def test_arm_sx1_flash(self):
         self.vm.add_args('-snapshot')
         self.vm.add_args('-drive', f'format=raw,if=pflash,file={flash_path}')
         self.launch_kernel(zimage_path)
-        self.vm.wait(timeout=60)
+        self.vm.wait(timeout=120)
 
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.43.0

