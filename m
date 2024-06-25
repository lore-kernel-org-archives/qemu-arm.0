Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699174njc;
        Tue, 25 Jun 2024 08:10:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBZIoaxzJ1aUT3Z0EYkC3SIm/gx4UE8MIK/lK9oeuA/h3PERLj4kz2xNNdfKa5JE3wJ1raDkaI0y5Wq9FaH3CghPpjuVvh
X-Google-Smtp-Source: AGHT+IFP+e7xVRa3YVkfX37BH8aAtzqprHgCBAXXli3ccAqEJYcZvp8KZk/Rr73erL6BFzVmxSJi
X-Received: by 2002:a0c:c988:0:b0:6b5:6f9:4846 with SMTP id 6a1803df08f44-6b540bf4a8emr78074576d6.53.1719328200312;
        Tue, 25 Jun 2024 08:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328200; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3ySvp/24/VYy6uE9pKYEONFoSjC9k+G6kiW6+aoQ6t25eMCSpf0CfjLXrugrffzeN
         bXR6UojUMX5X/Hi/911MX+RCaGNuWjq5olqzkSHbdgDYNTPhR6LLcco9diRlqoittBED
         s0xwZKSswx7skMCDM7azHhF1drfZGAS5O9d5JhxFzOaUx6/vPG3XK20k87affWqGJeYd
         kA0zFne1tWSsKOT6TTa9P4k4od2XxQtfkj8wgVlzFUfhqigZGbJKARuecTihiu79QdS+
         EmtyrR3DKqV0fYIetp07kka7VegAI8BsX09ZlXNzj2Kqx1VxUZgZzsDfSbKU22uXg/VI
         ghHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J61sJoOBmQROnk8p3njEuKGc5ezAVKKkxaM0eVogGRo=;
        fh=aaDS/fEmgCJqyx8DoLt3/GY7CL3jD+2ZWMOyfeqYCQs=;
        b=iqSMdq/vZOINwMB6KBY3n/jBynbwFVMkKQd8ISSFyNJSvEv1bARGpzcgrt9Ma8MG6V
         YLtlWTEDLiJG0D1HtLuwUpzxhbyywifcfvALcFrVKoHY8JDsSuPHpvgRfMPwmJEWMNzA
         OmOtOivpgFHWYPFqPHQHSQgpx6TgQnnTEIibyr4Y3/C3zxT0gjrOo73ETwR8xqQT1ytU
         4fzpBf9PqfUKegrEmgnhNpdinOC8PeuTP/uXiN/Z6ROQNlAs6wheqXFNIHZLeNmCYNq5
         CLAOY8J9ngCJn467JrSQ//WfU/f9HSh7Ct0Ht4EBNd+EYzpUek+HYPU/A6BIco0zcq+j
         JOKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=VjPRfIIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51edd3156si106833336d6.370.2024.06.25.08.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=VjPRfIIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7n8-0001Fi-Fs; Tue, 25 Jun 2024 11:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7n6-0001Ed-BF
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:04 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7n4-0006Qp-EN
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:03 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-701b0b0be38so4714408b3a.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328141; x=1719932941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J61sJoOBmQROnk8p3njEuKGc5ezAVKKkxaM0eVogGRo=;
 b=VjPRfIICi0L8EIfDWbriO4I+r8r1znqjHXsJoKPExScdKLA1PZkgsg60GWDx9HdsCU
 xviIuQ7nQ/wEKAxuV2O+l2F2XN9lNethe2KnJ6w1dJW2I+zAmj1ksi3moADGIL2GxZGR
 BCmoosqY6zVPjSHPHlA0lHIh+wac1gcxqW5tUJXNBU5V8FpAESfQ0R4tc0GQFosXpwbf
 hFiPWC9ZfY+1FI0s2XgoScY1n8C/Lx3uAC0+R+31jpYmEm3GaIxCk3mVJUzUtbbWf6j+
 xsIpr0Qodz7GFw5UKvFrXGmKYGpx6ba+xAdexsKxe1Y3bLthQUt1gEDCbBEye8IXc/sc
 CdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328141; x=1719932941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J61sJoOBmQROnk8p3njEuKGc5ezAVKKkxaM0eVogGRo=;
 b=Vun4RpdMwWZpeddSKf+np1r/+Sej0KlimnoEajtS+7Sy82Lre0pKCS+BkuTJDYKPki
 uqBmPg957EgvKnN+SKYA1iYQO9epz4lfTvxFkYSR96tQ9KhDEfHim1W7uqZu/TA4fChQ
 9ZPIAb1bi2L47VgieGKBW7bZzV0p/zEnp+oGQjPAMWlcU5MpBb/9xywtEX+OABJaTATa
 Z1GQsDsc5dWF9Pv64OqIQALDhVwtg1Yc06moPS8LyxVF7QLU1nqyEeq0WHOUTbZFuKUm
 HXuzIQqrnoJSR62ckwKA5FoZ+FFUQ2fB2sRebqsD15m8FEPbGp4gg6Mgt3pZeBab6R8m
 JYKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhPtAWLkO/MD7S4pk9cpV7zMylEwrRKP2vCclo7URt45ONZAfgI9IIhXLPiZWXUMDMhuAeDraRer5khA0ZhcPODhVs
X-Gm-Message-State: AOJu0YxNPMgl/1JB7qfjCgxnBgmkpC0r8yPD7nHBZZhteHuH9bBttOiE
 iiN5768kATIizMFjY+TuNYwQGGnAYIHt23OQKmA7Y6C+7WXavud5jE2trkE/8rY=
X-Received: by 2002:a05:6a20:bf1f:b0:1b8:d79:55f6 with SMTP id
 adf61e73a8af0-1bcf7ebf190mr7155217637.25.1719328140722; 
 Tue, 25 Jun 2024 08:09:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:00 -0700 (PDT)
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
Subject: [PATCH v4 02/16] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Date: Tue, 25 Jun 2024 20:38:25 +0530
Message-Id: <20240625150839.1358279-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x432.google.com
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
X-TUID: pqPUfM+Bqy8z

Enable building the test application for RISC-V with appropriate
dependencies updated.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
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

