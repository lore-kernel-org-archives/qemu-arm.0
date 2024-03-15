Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp992614eju;
        Fri, 15 Mar 2024 06:14:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx7BJMqLbwLjK+Qier0Iglb6UipjJe2mwEXtjisnA0x2cfebR4aAAdKwHj+45Zm+4e39+NafNnrWdFOEnXeWaVbYdLUdrJ
X-Google-Smtp-Source: AGHT+IHV6rAGfpLSPt9iYY7GSqSUwBT2wor6XUmo7NrRzMdeMXWZYfUdHoJ2/18KZdMnQD+QXe/d
X-Received: by 2002:a05:6102:b06:b0:476:6b4b:29e2 with SMTP id b6-20020a0561020b0600b004766b4b29e2mr650464vst.24.1710508463481;
        Fri, 15 Mar 2024 06:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508463; cv=none;
        d=google.com; s=arc-20160816;
        b=m+RD7TxXW9wCioiXxtFWNXaxFIUv13FUJRjeTA6LmE6hTwSQ2v5Y3lCTM7r3wzM/l8
         lqAxf4BYIHxENjQHyGpaUQaKgpsmmrqttNPCuzW+m4siOirr8kCwm3dw3Gua/rcbPiyH
         Wxf0oaGlSGnwsCMOxTKIiGssNEAHySpIwvdwWQqtKXk9Fu09SKNztvTCT/oTqq3d3HRu
         Ev0WOHDlW2aRuwmeEFIZ+6HNNiBDQhw40WxyM5HVNp3GfF6PBH3eUq+ZPso/GmLD0ukl
         G4nRid5bI0S0216jSMDEDWM/n/RlRTBEmNtWJhjjLNJVnpUrajFdIgpKljWaajOtXcrs
         BBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rLrHBMIvFW4XmoCMhvXju7BN+IFOvSPPXpZv8Qzl0AE=;
        fh=ceYyVsojsUhDifc+cJ/3088BWgc6hELCxp4VImebiM8=;
        b=OpHYurIAaOSs7r9tCRAA2opUGmdUvkUbJJkX09TS1/XKJsMtJA9Xxh7lfgwN327Z09
         Puy0JCormbD2qMC+3Ol4yHNKVCxR6QHLlj0P3go5kS5aiTkr02VRIFlKFMzuVzxk5lzr
         t9eONFLFO4RQ360NZKPfPt0VrUOT+9To4ve/a/L9mwire6BNWFheujwQwgrN4oCBCh4i
         zw+tMB98T6U8n9Q7pHK9Uv3AHsQSrshpfNo2oGdnACnPJBFeRvUp8xozgQPcGXXBHTsC
         uqqOJZmY1OdH+AZYWSGM+hQZXZpR4fFEiobAvvivRFN8+vvCQM8OJLDwuBk/I8Te/RbF
         R1wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZoKXrnjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05610207b000b00474be0190aesi535454vsg.229.2024.03.15.06.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZoKXrnjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl7Kx-00009U-BA; Fri, 15 Mar 2024 09:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7KI-0006mp-Ef
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:10:23 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7K8-0007x1-NJ
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:10:20 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6e6bee809b8so1995138b3a.1
 for <qemu-arm@nongnu.org>; Fri, 15 Mar 2024 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508209; x=1711113009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLrHBMIvFW4XmoCMhvXju7BN+IFOvSPPXpZv8Qzl0AE=;
 b=ZoKXrnjX3H3Q+d2tmzUQ6o7PY93aQuSpWCHlbyxoj/ye8i2rYYKDgr3ZD3U+8hBoo9
 RXU9rZgTKCDoMvKq01GZK1Ht0raNjYmbjchmIoD/1fLWnUBO8MtyM1NCLHQ8/kwoGiwz
 FQzzMEx8Sg7Xgs0YYSQGn3pB8IFjAgUm0vH0vxO944KaEwWiFthXPJtEWQ2XZxs2wP0h
 a5XeCue6NOum9qe9g7GRWWVbEJuhnbgX8y8d0Ba02RQ+vjdrvQYDGbPB39o66K4YNd/N
 3lLmgFjLmSUKA3oH6aiYP+XUuE7V+f/GDPwZZQVISf4Go3llha7ciRbmIrVVPpuJ/O7g
 YceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508209; x=1711113009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLrHBMIvFW4XmoCMhvXju7BN+IFOvSPPXpZv8Qzl0AE=;
 b=AY2RgSdCxgIkZEG6pyDSpgDaqe5wQqxyhieuzp26BsyFKGuEMWrp2d71GG5qrf+/FC
 x6TonOLg4QaanC7xA8sJQdaTJMl108hkCh/+Ml2WO2uvP5ThhVk/92NRG8mnx5lmhI+b
 nHc/0LJ29VodSjPrvKYIkzywS5CHbd1h+SaYD40jYuNnqmQQND5Zi+jkuMTMx6KfXGRE
 pv6hvxWqSct2P2xu2KPwawLK8s6yQna4RrF9NAc/3rxQ1m+nk1jq55HTGCk2RWXVNYp4
 U32kJ5iI31WcZhOHPrHmvWhZC0r4wirvZEZVaL6laJDSFTPS15vPHJlXGe9DqYfaxeSg
 TGsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE7uqtQrTyAn2Q7temRbU5uHikEm0DT4Y1PRbBYggK1SHUY9KzSIKaiQClWHNZPCVuzB1/kdTdmwgrX5QIWLEELPCH
X-Gm-Message-State: AOJu0YwP1OgPu4qSy+TRrQP230c6u88wKDJEGRwUIEMwYskBrNcJq0tx
 q1GQKqW6QunxA8mlGSt27Fi4prNdbeK0oOdOKjDDwegZ0rGpcNz69n6zY7y4+u4=
X-Received: by 2002:a05:6a20:1591:b0:1a0:e187:87c4 with SMTP id
 h17-20020a056a20159100b001a0e18787c4mr3772557pzj.38.1710508209727; 
 Fri, 15 Mar 2024 06:10:09 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:10:09 -0700 (PDT)
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
Subject: [PATCH 10/12] tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
Date: Fri, 15 Mar 2024 18:39:22 +0530
Message-Id: <20240315130924.2378849-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
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
X-TUID: 5G8N8SY9WdBQ

Update the list of supported architectures to include RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/data/acpi/rebuild-expected-aml.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
index dcf2e2f221..c1092fb8ba 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -12,7 +12,7 @@
 # This work is licensed under the terms of the GNU GPLv2.
 # See the COPYING.LIB file in the top-level directory.
 
-qemu_arches="x86_64 aarch64"
+qemu_arches="x86_64 aarch64 riscv64"
 
 if [ ! -e "tests/qtest/bios-tables-test" ]; then
     echo "Test: bios-tables-test is required! Run make check before this script."
@@ -36,7 +36,8 @@ fi
 if [ -z "$qemu_bins" ]; then
     echo "Only the following architectures are currently supported: $qemu_arches"
     echo "None of these configured!"
-    echo "To fix, run configure --target-list=x86_64-softmmu,aarch64-softmmu"
+    echo "To fix, run configure \
+         --target-list=x86_64-softmmu,aarch64-softmmu,riscv64-softmmu"
     exit 1;
 fi
 
-- 
2.40.1

