Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp996727dlb;
        Thu, 23 May 2024 23:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZel72k/UGkzZe0Wfi9ibV6a/5qe7NXToaJuyTWn4yaroCUty/+asE1kNm9uOABdW/pn61OdGxWEB77OIcAzfkg3TBYXqQ
X-Google-Smtp-Source: AGHT+IHOGeO0jRP1rG/JcYkRJN8QpCK2A09GDcQT0Zmvv+AnbdiFwriTZg9pSdmSDub3mEI+sj27
X-Received: by 2002:a05:620a:1929:b0:790:fd5f:2947 with SMTP id af79cd13be357-794ab1149a8mr166565285a.49.1716531331683;
        Thu, 23 May 2024 23:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716531331; cv=none;
        d=google.com; s=arc-20160816;
        b=svxOq4EvLncCzil0kemJVIgMWvgF7MYse+kjAm6gcut1aO1+hm1VWtmvlXw3li3Lxz
         7T6s3biiVTRId9hh7FneYdOnlg+DS3zAw+79woB6eO/qLxnJ6W3obS/HeonaisZ/Yk3w
         TPBfL3RHOA5ektzvAYrekla2wyOMDX0EqWWwaAgaQrJcVTaI+FGhlX+XVkzFGSTIJV/o
         +xtwN3ZY+ghl//myC+yC144k+Z4n0jNOOTmYXHTnQymlMKzeMBlAj5DGsmID5HBoLmN1
         5E50XAkPlQd/0dU1dfajYZHxkrmM0QiPdxck5NDvDUpCD7SurqMxtK1fBeQaAyaGCq6W
         YPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Etm0+s3up2JqM8ph6JUMLJUOz4fBS6haqZNSI55ovMA=;
        fh=FUElS1R31tSZ3iV0O5RWS4E5lUSSRajW6UIjzULHa6s=;
        b=vsxpxTwmoin24TgPe/Pm0TkEKKQzXoQ5A6FV16K1q2gNj124ULXcXLNyrr6iEUaIc4
         B4qj8ZzmDHfx1h/gFdIBBzMj/4qlVe9r9d3wbol+WRt5GnwZ8MCQPwwy83hDVS40bPqs
         tpUvGjiS0U6lA579QYE/AYhtPM1p7lTOaPvNNhcQ6WHciv72dXGewRaw7EIbeJqGCGX1
         vzu/5TQ7Nr7sT9Cnb4gq/5ysdRoeRhl27zXcNXdNWV0g38zfuCy0sFyIDtMzptIE4J8Y
         c3jBiKWE0nowA1QO9ohQuL6xIUNHc6+y7uBe9+RBYbONUzud5LFUfmGpy/YKBjfGpraD
         QkLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=D2I1knQp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd4d701si88713285a.570.2024.05.23.23.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 23:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=D2I1knQp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAOCR-0001zM-Vv; Fri, 24 May 2024 02:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCP-0001x8-An
 for qemu-devel@nongnu.org; Fri, 24 May 2024 02:14:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCG-00017J-8O
 for qemu-devel@nongnu.org; Fri, 24 May 2024 02:14:41 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6f8eaa14512so502984b3a.3
 for <qemu-devel@nongnu.org>; Thu, 23 May 2024 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531269; x=1717136069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Etm0+s3up2JqM8ph6JUMLJUOz4fBS6haqZNSI55ovMA=;
 b=D2I1knQprli65yKXO8Z/WtGjbprH02kfLHM3G/KV51DDnp8r9ovN1GKI6XDw5ZcZVS
 m/aa0BB0xxwADRs6kC4cnYQCiCKvFRe2uVkrbOeb9D7KX52t4o5WUngsNRHTsRK60nyl
 R0ezPBGf74Fv/h5CbduWZ3GRoa6pdx4VHOXtchUlaP21Z3wlLUGqIYSt99gArfXBbecZ
 RFASGdNyTTLuMh4HLC0uTQOJTjemCUS68RyiH5l46J6dpLCLkUvKqY0NvdLBr4NSgAx1
 4IWrJ/G8OYXMYSGOKwkHiGLtgq7C5kSIfoXQv9iz0hvLb77hdUDie2ciI8GIO4nG5azO
 TMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531269; x=1717136069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Etm0+s3up2JqM8ph6JUMLJUOz4fBS6haqZNSI55ovMA=;
 b=XcHnk5ApWz9taboJZt0jpu10e+kqtNzDfEbKkSJt13USz5X0g+UYfkEQWt2HSLYvmk
 CHEv9jct2W5EouTzr7NKftZpcuAj9sfGE1jfBFQ7p3yhyZfszdiPrpJuVihToldG2P3c
 3jcP6lkmXVIo/HjDlDCcumSjEwpv3ce7gi43mSdLx5+zkfDYQjRtvyiHpqxV2DTsOCZ5
 ZqSJ1x0pKvPq4kMGHbp5bpht3B9XI4+DmjPiGaPK2wp7eIEfd2ZYN7KUvv8ufZf2Yv4W
 TvtfhS4mOcXjQ4jkTZMweTbJ/G7oTRkkcH4jsxsRM1EPIeZx8AalwKkLCcvhRD/gYOh7
 mJcg==
X-Gm-Message-State: AOJu0YwmiQ5xzWlDfXpEaO7Rnp0f9g9Ph/chZT5TPVpPe6Xf7Xpua+7B
 yZcD0934ZJ2Zgl3TywD6tyzL7h7kavnRA/RPCSCkkVXXV/zPjDK1M28vT8E3rXp3TdSQAb8+luA
 sxSM=
X-Received: by 2002:a05:6a00:4007:b0:6ed:21b2:cb17 with SMTP id
 d2e1a72fcca58-6f8f2c6dd92mr1353636b3a.4.1716531268908; 
 Thu, 23 May 2024 23:14:28 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:14:28 -0700 (PDT)
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
Subject: [PATCH v2 01/12] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Date: Fri, 24 May 2024 11:44:00 +0530
Message-Id: <20240524061411.341599-2-sunilvl@ventanamicro.com>
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
X-TUID: BgcwbmIpjs8p

Enable building the test application for RISC-V with appropriate
dependencies updated.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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

