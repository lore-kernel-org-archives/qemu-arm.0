Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp150904njc;
        Fri, 21 Jun 2024 05:02:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVs/EwneYXKOJTT97cB3ovGo8mC0RAadVVvY21BhoQ1dreDMMxAnTaDo7Olmz59IDmDHcJ8UPiRUHYEYy2BX5czHic2mT/5
X-Google-Smtp-Source: AGHT+IFNXSY6HFGu3zPbtWvvN8R2WawTCZtqOT3t4MXCZM1+2Kdragwy7PyGFtBTz3tQ3LMCuFpj
X-Received: by 2002:ad4:4d09:0:b0:6b0:89ba:396a with SMTP id 6a1803df08f44-6b5104ad71cmr49074766d6.47.1718971321990;
        Fri, 21 Jun 2024 05:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971321; cv=none;
        d=google.com; s=arc-20160816;
        b=s4E+kdUp6WUtGTvzjk8DQYhqugK1nQ1UF2Qxk7vXSOEBH1IvYAHCHBSosm+XMIInhs
         7zoLuOMxJ769QcjyU99dNemXd7T36QZRV4vDA39eVVzOiQD9ZLHK6rwd9bM/cI5fYRvf
         kBI7LKjPo4gPPHa7TmxevGh4pnM1qG52Hhw5KiNYMAvxwCKVgpXHJK8KYUtVI0Pzie+W
         YEFdnL7nu+uUzKOJMX0aT1LBCRPlv3CJqaLGMSOMWGzgz9YP0ArQ7FW8XhuLUf+hYe1F
         iMb3UhJJWF8f8tYNXoKH5uqoiUGbZ6MKXO0ssfUdlS9ZoXhlO4hNGks8+UMtw7TuPBR2
         rBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pvZbx7Qhc09keL1vmWRUuQcCdr8TgH4NHpQR9QL+77M=;
        fh=bQDQrlPrzZo1QI0iP5G1zwRQro6/5fB3OT1u7VoARm4=;
        b=max05G7E3I5XcaQp+nZ8QS0zI1uJm5xNlF19yRwMmPWZk/CwclnzoXDfI6aUVaiwfj
         BiOYa+RK0mCTYPmp9kM4yMZZ9JaR8AF/Dk7iTKWDdmT845Doe3xfhT2rMYpKwRISJEO3
         qSH+wwFS6QBeD0oV1tuSMpJC4gBubXXlV2oRplFo/vaD4oZGvLjgE1ZpuEUA4n/C7TzB
         ZrTYsxOBiaWwVKMzLP0SDgoc787eBr70Mw9ZHrUQpbBq46tHa7BMZfuYfQi+T12QGwZn
         0vTrvtT28ujgOmn27YwtDPq7Ke6S6jvjtKddvIoe6/u2E/tDiuA3NCvpcWLjZpQfB67V
         CQPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=U13nhwAt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51edbd4e0si14460146d6.277.2024.06.21.05.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:02:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=U13nhwAt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKcvY-00047j-DJ; Fri, 21 Jun 2024 07:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvS-000437-Px
 for qemu-devel@nongnu.org; Fri, 21 Jun 2024 07:59:31 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvQ-00035l-TY
 for qemu-devel@nongnu.org; Fri, 21 Jun 2024 07:59:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f47f07acd3so15774115ad.0
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2024 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971166; x=1719575966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvZbx7Qhc09keL1vmWRUuQcCdr8TgH4NHpQR9QL+77M=;
 b=U13nhwAtDExA58rH9mScbkSYHygFSAbfi18WWCMFEZInBmn3yUU3Fee/0P6rs91BVz
 aXlvepNKHxbYBgLXSarHCjNp9bPxpJOM8o5yuB2O8XIOEQryaRYWYmTQSCWPY79FB+Ci
 Izh+Yio+eYFhevbnxmdc2X0ZDTt00rgp9e3FX3BckKcDEwM2fxzG8ImGWVdl1Dh1eUMV
 mcydLjHOsVbTRAiOarZ3T3HYVcfkw7FnyX6dhVdkhi/PgghMtnBBOn/SbeNH0rVEMYFK
 wj3v0acNd3mkwsiQumOZ0T1pY8cHaU4+momZYD9nJa6eVxh/+GAitnKHHsvarCZH5TYI
 7hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971166; x=1719575966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvZbx7Qhc09keL1vmWRUuQcCdr8TgH4NHpQR9QL+77M=;
 b=X1EMHYdc9ZLou7cD41QWuhMukseORRxD3srQxzypFakbCtcxx4WYtCZj5OG53TjwnH
 TS/q7VsGB49YNAK26PA9QL2Peloq3o9xgBy9eABjFVqUxNeL3NTIwKjLWc0E0TdYkxng
 IGPoymZqbqyy5sDKspYUP5ALeOux4BWQtQ0ruNzeIL0cQysAxjuodiYqF4Q/J5XLwl6t
 JeYMkAyC0uf+Pab+CjIf9HKGYBxmiGxiWzt9rAH6mPpAgjFqygQJiBvmrw53/OJe3CeK
 jFlJRunkDRMfUXpWNTC2UC3pgZnAwQTPBCderoHY1D9E4+60UaJwlauLoh3wknfowoDq
 VocQ==
X-Gm-Message-State: AOJu0YzvlTwz1pnslu30IFftmbI5lrONGv6vXUHRs+0wfQHKqf7nbvs8
 SkgYDsRVasZ2nGh88KcrhZRw1upo3EIs9QPqPRbNzroaKlmwkMYa+VQbOukeywVKxbWyRCoHW1X
 n
X-Received: by 2002:a17:903:1cf:b0:1f9:a4bf:de10 with SMTP id
 d9443c01a7336-1f9aa3a5cd8mr98437135ad.2.1718971166278; 
 Fri, 21 Jun 2024 04:59:26 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.04.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 04:59:25 -0700 (PDT)
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
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 02/15] uefi-test-tools: Add support for python based build
 script
Date: Fri, 21 Jun 2024 17:28:53 +0530
Message-Id: <20240621115906.1049832-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EhXhG09JBAUq

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

