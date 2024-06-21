Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp150389njc;
        Fri, 21 Jun 2024 05:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbCefe8P2WhNNY1L8uloGPvpQQI1b7gMPKCR6qOHLUY3iGQY+NNDSAZGrRjBoAJN7nS2giDyO0C2UNy/UQ95ZsMDz0TvMD
X-Google-Smtp-Source: AGHT+IGZ+X5Wl0tqf9cBhTe2aC7qPLxpEapcSdOGIAp/Gj0yyQ1URfSFinWSQyESX0PxI2KOhAt8
X-Received: by 2002:a05:6122:17a5:b0:4e4:eab4:ba2a with SMTP id 71dfb90a1353d-4ef277dec55mr8977534e0c.16.1718971225571;
        Fri, 21 Jun 2024 05:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971225; cv=none;
        d=google.com; s=arc-20160816;
        b=t+yntW810si7XU51FyFDQF/gRWuCMs2/HEX6JhJq/JoOw77Apr4YsWkecYVSkNelaL
         TC52ccTD/nzvhvckBbzr5BNcoBp286ogA3czE1evxgnK6eawhABUQ0XrKAXoxMX4LKqW
         02KZWILPr1E9ZXxc/FOOskImpOlD7bRS+yb1z3eokyN5NqTjE4HikJUbTneyOtSpUH2V
         QfRB8dX+6gxlI612uoFlETwtWpBqD9nqNwAeei5n9mSLBYc8ORTRTdFxAjq7C/G7j/pI
         F5F5FNB6yTtlPkYqFGmePqR6lJkqDRpLkp4ERxrhBEf9VQyPzzhojEKN55NiXQ78bls7
         aHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UDbKEfyEUEiUxcuzENCLs5kF/Q2o0hJJx4pz7l2e6bk=;
        fh=HW3k3p78fMD85z7DiBkC1An1NxltMTcmALo3QcvPt0U=;
        b=ZigqOm2YpmSbflSF0lb97K+7/LF71kfh+SR3FyyKMri5unwKALgZztAYgZRJzwkQ6V
         6oqIp8Cq32VW2dovvpMQoSpkJl3g3g8HkZQ2Xx52gAfW7h6a8iJqxDtYrPp0MkVeLCjQ
         hMWVXxz0lC/1QUscfXGumjpSXB8p1uGkM7qtktkO7FsyDU4qTaN7/WbwO0PkpDXC5xZw
         JM28NAjTxDek5P/C7K29C3SvkwRO6B9GLULxjcG4ZN9HJWft8anCmqYtgZuOABkGXZKf
         KYFTNoyTFUwlhrbIu0RWZbIxBvXKl4va5aGmlA9m3FeNxZ96jiI5mKq2zaBnfKGhX2Zr
         jgCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=fImpggof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce91392csi164280485a.362.2024.06.21.05.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=fImpggof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKcvS-000435-Mw; Fri, 21 Jun 2024 07:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvL-00041c-M0
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:26 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvJ-00034u-Vz
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1f6559668e1so14491215ad.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971160; x=1719575960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDbKEfyEUEiUxcuzENCLs5kF/Q2o0hJJx4pz7l2e6bk=;
 b=fImpggof5Dhwp9WJdAEUwUucDdupt2mN60wLQgCHiLWceheCKWqH1NLVzucM7t9ODr
 rcB5i8z7sJvezC9sD/pks4/l26DvzaE9U8hEVGaWhW9myPIwZtcNAJL86vPb594idrOo
 vmap37aR/9RKUkN59Vuq7YqqWDRUr978WZFxnQzHjStOvwBo3kB0ezNzT60uFDNZ33gl
 k9Q5pi9yS4Fh2WvbWGzZRTatxuTPJ9QVS6Z7aphRZKppwJoNDXX6kvIg2DPCFzvrwhi+
 c82pQug7T90u8GjAP3cddasNzC8FykP28yMQfkGIAgEgf8oCtAbNWeExmk3roXby6vjQ
 lgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971160; x=1719575960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDbKEfyEUEiUxcuzENCLs5kF/Q2o0hJJx4pz7l2e6bk=;
 b=E/DKkY1YOsJvFs4XhSY34I347Wsr+AulTuVDKMyJszf/6VXUWIHNnSWjbTV9JFURm1
 KsGY+9+rinWnPkxqi7edTmhfwoe4bm7KVCrZMkFcIlI2XhmcAOSc1wEjRo6gCf8gwqIc
 nEtduNK+gm+nv7Ir0raSiQSJZIvn4ELZT4o1Ds7pZwigInsVrScwgd8K77Swr8dKZFzx
 BAOAJkNT2HhRGcoq41O1aK733bb2qkJ13tPUL6LIklyaOVaLzlZTc8MVCPGiCMVg6AIC
 2N0AcylvegadxtCLsiWFIiBJlVgC19i3bz58PtyCmv9OGeZiRFcCd/BZgIbfwIx/Xlmr
 Voqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW+y4VPi7J4m02G3BnbgYD7Od+jnP4q3OJeUs26vJu2M0eQMeExvbu0ApHuvN8FeL4XtzCNadKn97e2HZ/8BwrrgUG
X-Gm-Message-State: AOJu0YwpwYmQHSJqjTn9oDnpAlo07Dp8hV0HJqzzXjn1R26fcS51Ckeg
 SJFS7xIAhnYfbXUHTBHNQcmq/pWmM7sQY/Ro4fl+NeHPwmLRo+yRRmA1uBBYSIs=
X-Received: by 2002:a17:902:da8e:b0:1f9:99d8:4a9e with SMTP id
 d9443c01a7336-1f9aa3ddab3mr93375545ad.25.1718971160582; 
 Fri, 21 Jun 2024 04:59:20 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.04.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 04:59:20 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 01/15] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Date: Fri, 21 Jun 2024 17:28:52 +0530
Message-Id: <20240621115906.1049832-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x636.google.com
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
X-TUID: 09OWqxBUu9yf

Enable building the test application for RISC-V with appropriate
dependencies updated.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
index c8511cd732..0902fd3c73 100644
--- a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
+++ b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
@@ -19,7 +19,7 @@
   PLATFORM_VERSION        = 0.1
   PLATFORM_NAME           = UefiTestTools
   SKUID_IDENTIFIER        = DEFAULT
-  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64
+  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64|RISCV64
   BUILD_TARGETS           = DEBUG
 
 [BuildOptions.IA32]
@@ -60,6 +60,10 @@
 
 [LibraryClasses.IA32, LibraryClasses.X64]
   BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
+  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
+
+[LibraryClasses.RISCV64]
+  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
 
 [PcdsFixedAtBuild]
   gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x8040004F
-- 
2.40.1

