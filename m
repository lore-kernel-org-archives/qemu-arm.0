Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp996891dlb;
        Thu, 23 May 2024 23:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKsIdTAoD/+bAZRDpQzafdPEHhlgTofkkYa71O9mnIbcOiNrfpopnMuhY5CstZMHs6NEgTKYsyPDyOeGvUvpCLuO88sl/T
X-Google-Smtp-Source: AGHT+IGfP+wdwp/4u5/2FYCy4DmHmVzy8bEjOb9YVCxkmKQMFaKOxV9v2OFC07Pete1RHNDxiQTK
X-Received: by 2002:a05:622a:11d3:b0:43d:f335:425b with SMTP id d75a77b69052e-43fb0eff504mr14572641cf.44.1716531357582;
        Thu, 23 May 2024 23:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716531357; cv=none;
        d=google.com; s=arc-20160816;
        b=wiXCLRve8xsoAH49QWCBjhCh8biqyqvgndHL3VKJO6fnuMVHVeeNS0v2RhtRCjVq92
         BGgMu5LKTjFstPwPH4mJGvs6uVcCnkHbqc6f/7rDeg6yGC0go+u/vL9OPN7FGjDTY1qD
         1e94eAX54tZ9XhP1RBtmyVCgDUJSjX0gFVe+Hq8ageKeWFbF+9ad3UtZFniZhjKrLfI9
         px6xsvBCSXTMvvMr6RW78Jr/lckFz8kkpVSwjKhWiBpsE2PkH24NQOsZOjLKtmhApOb2
         1S7yAZfUzQguFpi29oactzbFiVUjalhWxsogAGgT38h6Ik4jy0r1xeuPUNOTTaezS/6/
         G5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pvZbx7Qhc09keL1vmWRUuQcCdr8TgH4NHpQR9QL+77M=;
        fh=Xr2BtNvIkTvrMX3qscctLerCe6NrO37CGMHSlG97XOA=;
        b=ch7O2nw+KcxXJs8IwSAAqlCNOY5+quaYVnV+3VnecRuMBtzXhCTjY3i/ChOXXJ8uiD
         QHwlOZ3Oy//mU8SW5OPbQdLGdsqahyVi6MVnIaafEXUnOsNWhUjaFrq+3HpCzLcIt9i1
         1WSj/e72qjEZbYmpAQtYcN+qIm51EcSNwJvqOOKIHhs5hdxR86WxwQsX88mDTn7O29eV
         3WxcAPC8qyw+lt+b022bRLl5jO2lgndgC78BPHtkDotsTQukBv6Prrwlo20y60Q1z91W
         geTrfzSEZvdX5VeNmNGmUgzLlI53knRK3bIZsRW8qOVf5XKeqF+I8RoS7L6G6Iw+QNC/
         VVCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="an/m6vxE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c55fesi11226691cf.598.2024.05.23.23.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 23:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="an/m6vxE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAOCU-00021v-Co; Fri, 24 May 2024 02:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCT-000212-Ah
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:14:45 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCL-00019i-1z
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:14:45 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6f8e98760fcso497595b3a.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 23:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531276; x=1717136076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvZbx7Qhc09keL1vmWRUuQcCdr8TgH4NHpQR9QL+77M=;
 b=an/m6vxEgS/i7AaLVIH3xDtOgKuzKgWnhYNvIoantypgBXGomjZSUXKMPq31YBEG0J
 Dg/W5Z7Am9bb5pQcp1KDYA8R9xrK9k5XMoPhdK07NKk50VKYK/9R2+98mdMK35pbJYWj
 +GKY6gIIsCkrz4+NnTWfx5t8EsQgPfqAwkTV97Dq2u2knoKrkerb+bSYiWFUoxRbvJJv
 vPO6JrNvM/EzpY+5jk2Fp8v2sCovqgZd02Fcf+XGoH/jaxgvM0Ei0KnGMwspj3M6S1El
 9k9uf9mM1DqQvYrmfFVVxXo18PV6mzYxsQTA175tiEwy65TKXy1hkaoMKsHKfHGzAwqC
 2yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531276; x=1717136076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvZbx7Qhc09keL1vmWRUuQcCdr8TgH4NHpQR9QL+77M=;
 b=ZCke5NPSxUrO+BGkslbgFuRz8QjbQEedtrzzUpqzU6mAwADt5Nckk9+lCrDAtHzPXk
 5HPfk/boAMXlWkdlxTsZKd3eqsGzLu/t3GdlLXmsa1yiZN1zLYZBiB/rCsxIpAdeLhcl
 ei3css21ErZ4durTe53EHMBCTSwk37N1RtQyMKWfpnCKsSP5eyGwgUCI5Oh0793m1F55
 CWjmZ6OXJUoy4ZGGBhctw0ZlUab/XtnoojadPFui/PopqVvyFvyaex4AexRsxPio8yul
 A53baZqIihREqf3o4+WlDxqEWGa/gred88wDpksUA4Wf5BGHCDndhcTL83oGQ7d3y/jM
 PdXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULupkhK9pw3Jxudcbuuh0kUE9iru++rzKXr4SNa/oqbyuS4cfoV3ws07w2mIcvO5YG7qPuFJLqU+dx4xi9110Be8dW
X-Gm-Message-State: AOJu0YwSrEyNi6GUhynOiibtLQ9bcTcN3fnZastAhdichiXy+u7tpf0/
 h4JEetyGZtxEl1p7J8ETJkBO+IBf5C33VjanDYE3vkeCb8C5CAJmmsZ0N1twZE0=
X-Received: by 2002:a05:6a00:301c:b0:6ec:f712:8a69 with SMTP id
 d2e1a72fcca58-6f8f3d6e6b3mr1647997b3a.29.1716531275758; 
 Thu, 23 May 2024 23:14:35 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:14:35 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 02/12] uefi-test-tools: Add support for python based build
 script
Date: Fri, 24 May 2024 11:44:01 +0530
Message-Id: <20240524061411.341599-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: osu6ikm1lZCr

edk2-funcs.sh which is used in this Makefile, was removed in the commit
c28a2891f3 ("edk2: update build script"). It is replaced with a python
based script. So, update the Makefile and add the configuration file as
required to support the python based build script.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/uefi-test-tools/Makefile               | 19 +++----
 tests/uefi-test-tools/uefi-test-build.config | 52 ++++++++++++++++++++
 2 files changed, 59 insertions(+), 12 deletions(-)
 create mode 100644 tests/uefi-test-tools/uefi-test-build.config

diff --git a/tests/uefi-test-tools/Makefile b/tests/uefi-test-tools/Makefile
index 0c003f2877..f4eaebd8ff 100644
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
@@ -95,15 +96,9 @@ Build/%.fat: Build/%.efi
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
+	$(PYTHON) ../../roms/edk2-build.py --config uefi-test-build.config \
+		--match $*
 
 clean:
 	rm -rf Build Conf log
diff --git a/tests/uefi-test-tools/uefi-test-build.config b/tests/uefi-test-tools/uefi-test-build.config
new file mode 100644
index 0000000000..1f389ae541
--- /dev/null
+++ b/tests/uefi-test-tools/uefi-test-build.config
@@ -0,0 +1,52 @@
+[global]
+core = ../../roms/edk2
+
+####################################################################################
+# arm
+
+[build.arm]
+conf = UefiTestToolsPkg/UefiTestToolsPkg.dsc
+plat = UefiTestTools
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
+dest = ./Build
+arch = X64
+cpy1 = X64/BiosTablesTest.efi  bios-tables-test.x86_64.efi
-- 
2.40.1

