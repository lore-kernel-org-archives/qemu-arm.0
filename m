Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989638eju;
        Fri, 15 Mar 2024 06:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzNeNeE1H1GFPSQ6r0kONGbNpAAPWgZlC9xZX8QzyAnPr9mRhWO3IiymN8F0fJPqDfudN/cN4SCSH9cVz0qW/Uq+e6EgrX
X-Google-Smtp-Source: AGHT+IFcyDT78Q7/xNCOK8zv+67YONF3mK0suuPPD/HCDw3SmQ2AHb26B39P689kTYbCbfQhADkY
X-Received: by 2002:ae9:c109:0:b0:788:2176:e1ed with SMTP id z9-20020ae9c109000000b007882176e1edmr4452985qki.41.1710508226843;
        Fri, 15 Mar 2024 06:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508226; cv=none;
        d=google.com; s=arc-20160816;
        b=torPAqJac1fT/a27dUpc1+2GFlqazL2xyEINvRATRQalAYjZPjJ5dG3d43bDGKe2sQ
         qddijVufb0JmYYaribjWNHY7P2CyFxY4SddmNYSOchlSl4H72rCUlgJnB8kNzmwKuCf3
         i8zhHZ7VNG5VWX5eqafjOc72spth2vST8zitGOwr3raOPzOVhWecVrQ0quEzi0YK67NB
         70yhoBdb3KjkQKZfaCguYYQ9dzYYYmWrRZgss5xzI2voYYfJGvbCqllCMPz+GOCsAC2Z
         NXmpIuIKZu3jrKmbH693qS/tXdnd0gYP2HC5o+vekKpaa5Oo/OPTi/putN9vsj0Bu5jP
         vrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y4vX0WH0NUhjpqoGC54S3e1oXOXXObwA9DbtQ2MGi0g=;
        fh=qWTAIpnpjnlg29hkuLe0Wrjqftv7a2D/M/xbiILTcJU=;
        b=yPjw0GOSzmT1Heyrj/N1m7irqzi+77rmDhz3xAsNhfBU89GrYSY64atyAC1x6+8Cjw
         GCVm25aTGwrr3zZ+QoKnTO0Sy574vIcwMaZkVtISYhB+JGjceHNaNVQpCAx9i23qIFTC
         wYZllE3CD/a0/++vgYodXfnPAC8qBfR51TDHmsHNSyd3oUjGLf9HvkpAJWeAhkJcRjBG
         yJdjpOUTp3GVFzxELPeftmaZPYkHm638l8iM20H0j8rDUgAVUR2qkUslYVCJFzVHQNKf
         i4dp69k94o0uEQmFMLTplaHTlqpp119TyQEHMORpLMgWP5fBRlsRN9/S9rN+x1r/R2nm
         45Wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dpbDMCxE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05620a023400b00789c67669d7si3464824qkm.775.2024.03.15.06.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dpbDMCxE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl7Jp-00065Z-Ru; Fri, 15 Mar 2024 09:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7JZ-0005eG-TM
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:09:40 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7JW-0007cl-8L
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:09:37 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso15530165ad.0
 for <qemu-arm@nongnu.org>; Fri, 15 Mar 2024 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508173; x=1711112973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4vX0WH0NUhjpqoGC54S3e1oXOXXObwA9DbtQ2MGi0g=;
 b=dpbDMCxEvWES4UrjeR6mWrMh7ranEAo92ypKgzMniMXuMof1fy2xgtEXXgUtGaO9vJ
 bUVgFLoXqo7fa1+Nb1MWBpG124tquYFS1TgW4RWjt4osVWjf4zir+cxxnVlLxgzhoK+K
 RphAs5sWCEA1yyhEcZAV8+r2t+nDC7w2432TGLxnPpaCDjzvhkDtqeTNjc6h+tySquFv
 PW9vSoOkZ8HSEVOI/BQ/diyif5pYEwM31SCjsPjWP330qTHDQjSQKTM2RX1fbOzeLo7V
 6MOE6LGJVA1i6SepTyN7nbvGxlC8Q72wMg/PYlXVjtCs5VZH3fnDMbPDyNdEK9W7XJGd
 bKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508173; x=1711112973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4vX0WH0NUhjpqoGC54S3e1oXOXXObwA9DbtQ2MGi0g=;
 b=cBGQP/d2Azcb4wnhR3+OioxHs1QCOZ3Y12lNp6h4D9mVE/g6rPhzMbFzZOEQUUxS08
 rXA0tkjnUkAhugq6bUm61OfpyZeF3stoBeDDiFqjgqok/x+92vPOvSXmCvZDmY8/tL24
 QdxzPzZYD4UNywTxRVZtaNJ9wDQWRdWAYp1GByTLUgUHrc8pL2vbTIBLeUCxtRFKES52
 c8fBsUhc1zk4l1/h5pVy3xQjRGVJ3CtCqZZBSwfF2ziAbTPfUemExpF6VSd+Pi7VxyK9
 eKmrekWqO2Lb49lWXjumCjEltjD3VtBRrVEUBZ8al0YlUP7EYLAxHJhmYj9m16+o4bHw
 n/aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGyoC3xV3a1T4an6aep7Z6Zza/R1MF3lSvBwGmHqnFyMcO4qO+fZeuY6BrpO5hCJrHJQ+GUONycVNk8GoOR0cme880
X-Gm-Message-State: AOJu0Yx9jh6bOz6YTUUPCtmt/BKgVjyjU3jRStPocyeOV8tCAKD1dyhV
 py7MZLN09b5T6nvTCasXoYc71GkiLYX7WcrR1eNPXoUHt63l5Sx2W+yov5310Bw=
X-Received: by 2002:a17:90a:ea0e:b0:29b:b15d:5353 with SMTP id
 w14-20020a17090aea0e00b0029bb15d5353mr4612835pjy.31.1710508172750; 
 Fri, 15 Mar 2024 06:09:32 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:09:32 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 03/12] uefi-test-tools: Add support for python based build
 script
Date: Fri, 15 Mar 2024 18:39:15 +0530
Message-Id: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vmDQg+lMaVCY

edk2-funcs.sh which is used in this Makefile, was removed in the commit
c28a2891f3 ("edk2: update build script"). It is replaced with a python
based script. So, update the Makefile and add the configuration file as
required to support the python based build script.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/uefi-test-tools/Makefile               | 18 +++----
 tests/uefi-test-tools/uefi-test-build.config | 57 ++++++++++++++++++++
 2 files changed, 63 insertions(+), 12 deletions(-)
 create mode 100644 tests/uefi-test-tools/uefi-test-build.config

diff --git a/tests/uefi-test-tools/Makefile b/tests/uefi-test-tools/Makefile
index 0c003f2877..f94738b645 100644
--- a/tests/uefi-test-tools/Makefile
+++ b/tests/uefi-test-tools/Makefile
@@ -12,7 +12,7 @@
 
 edk2_dir              := ../../roms/edk2
 images_dir            := ../data/uefi-boot-images
-emulation_targets     := arm aarch64 i386 x86_64
+emulation_targets     := arm aarch64 i386 x86_64 riscv64
 uefi_binaries         := bios-tables-test
 intermediate_suffixes := .efi .fat .iso.raw
 
@@ -56,7 +56,8 @@ Build/%.iso.raw: Build/%.fat
 # stripped from, the argument.
 map_arm_to_uefi     = $(subst arm,ARM,$(1))
 map_aarch64_to_uefi = $(subst aarch64,AA64,$(call map_arm_to_uefi,$(1)))
-map_i386_to_uefi    = $(subst i386,IA32,$(call map_aarch64_to_uefi,$(1)))
+map_riscv64_to_uefi = $(subst riscv64,RISCV64,$(call map_aarch64_to_uefi,$(1)))
+map_i386_to_uefi    = $(subst i386,IA32,$(call map_riscv64_to_uefi,$(1)))
 map_x86_64_to_uefi  = $(subst x86_64,X64,$(call map_i386_to_uefi,$(1)))
 map_to_uefi         = $(subst .,,$(call map_x86_64_to_uefi,$(1)))
 
@@ -70,7 +71,7 @@ Build/%.fat: Build/%.efi
 	uefi_bin_b=$$(stat --format=%s -- $<) && \
 		uefi_fat_kb=$$(( (uefi_bin_b * 11 / 10 + 1023) / 1024 )) && \
 		uefi_fat_kb=$$(( uefi_fat_kb >= 64 ? uefi_fat_kb : 64 )) && \
-		mkdosfs -C $@ -n $(basename $(@F)) -- $$uefi_fat_kb
+		mkdosfs -C $@ -n "bios-test" -- $$uefi_fat_kb
 	MTOOLS_SKIP_CHECK=1 mmd -i $@ ::EFI
 	MTOOLS_SKIP_CHECK=1 mmd -i $@ ::EFI/BOOT
 	MTOOLS_SKIP_CHECK=1 mcopy -i $@ -- $< \
@@ -95,15 +96,8 @@ Build/%.fat: Build/%.efi
 # we must mark the recipe manually as recursive, by using the "+" indicator.
 # This way, when the inner "make" starts a parallel build of the target edk2
 # module, it can communicate with the outer "make"'s job server.
-Build/bios-tables-test.%.efi: build-edk2-tools
-	+./build.sh $(edk2_dir) BiosTablesTest $* $@
-
-build-edk2-tools:
-	cd $(edk2_dir)/BaseTools && git submodule update --init --force
-	$(MAKE) -C $(edk2_dir)/BaseTools \
-		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
-		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \
-		EXTRA_LDFLAGS='$(EDK2_BASETOOLS_LDFLAGS)'
+Build/bios-tables-test.%.efi:
+	$(PYTHON) ../../roms/edk2-build.py --config uefi-test-build.config
 
 clean:
 	rm -rf Build Conf log
diff --git a/tests/uefi-test-tools/uefi-test-build.config b/tests/uefi-test-tools/uefi-test-build.config
new file mode 100644
index 0000000000..4fb89f7db9
--- /dev/null
+++ b/tests/uefi-test-tools/uefi-test-build.config
@@ -0,0 +1,57 @@
+[global]
+core = ../../roms/edk2
+
+####################################################################################
+# arm
+
+[build.arm]
+conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
+plat = UefiTestTools
+module = UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.inf
+dest = ./Build
+arch = ARM
+cpy1 = ARM/BiosTablesTest.efi  bios-tables-test.arm.efi
+
+####################################################################################
+# aarch64
+
+[build.aarch64]
+conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
+plat = UefiTestTools
+module = UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.inf
+dest = ./Build
+arch = AARCH64
+cpy1 = AARCH64/BiosTablesTest.efi  bios-tables-test.aarch64.efi
+
+####################################################################################
+# riscv64
+
+[build.riscv]
+conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
+plat = UefiTestTools
+module = UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.inf
+dest = ./Build
+arch = RISCV64
+cpy1 = RISCV64/BiosTablesTest.efi  bios-tables-test.riscv64.efi
+
+####################################################################################
+# ia32
+
+[build.ia32]
+conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
+plat = UefiTestTools
+module = UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.inf
+dest = ./Build
+arch = IA32
+cpy1 = IA32/BiosTablesTest.efi  bios-tables-test.i386.efi
+
+####################################################################################
+# x64
+
+[build.x64]
+conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
+plat = UefiTestTools
+module = UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.inf
+dest = ./Build
+arch = X64
+cpy1 = X64/BiosTablesTest.efi  bios-tables-test.x86_64.efi
-- 
2.40.1

