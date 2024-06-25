Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699457njc;
        Tue, 25 Jun 2024 08:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsCiybZDoTA2H0bOcOK9kyKINyGZL1QBRufvXGpF9/qZgpXqCdCoxU1l8YjAW58eFFNYkuOLjPu11cGiB5pRYMSsIwwPcU
X-Google-Smtp-Source: AGHT+IGvfmHLsVpWa3/084vJSSpJloTtZMqT3lHl66e4PJcTwtT8nm5dUEu3ZzV0YuX+iHn2fgts
X-Received: by 2002:a05:622a:500a:b0:444:dc63:ba1f with SMTP id d75a77b69052e-444dc63bb58mr92100121cf.46.1719328248355;
        Tue, 25 Jun 2024 08:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328248; cv=none;
        d=google.com; s=arc-20160816;
        b=q+4v66pkl0Y3fSjQJqS205/Rd0w7jNJziCR1PZjDakmNGqe7QknPSt9hTDxMVAn+nu
         FF6dduj014Lf2g5OHVmhJ8/Z8a22pXHdfbVN2AnFJkbbCfCaj3hHrF7QybVF972QNF6X
         +ahHa8n9SJD6krzYkUpFqf/CrpstUvgqvY/l9ji7qUH8y8b4F+3lIYy40i1S6NBgYodZ
         9OaSjeHgZh0Y9W9VX7PmAttfqY3CPGE6xDS55RlT8RoduupUVTC1Ifjl9HhTvPkW7o62
         cCpdfFVeW9NsS7bXm8w3PrS2zx8eGTzIb99cvdNNLaSTJ44qONnle2ly3QuYB7U+4Tmc
         RwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=olkiI7wyhmRaTOBe/j8f3rBI3dB8B8MYASE/tQDUo2k=;
        fh=ZcVJlQcokrh8uY71gpJCcoSF08hI0Btyo9435g5Ymm4=;
        b=wwHsTsMU8Tqf/82j6ihxW2dbu6jfVsQhGorS5rxjdyC++obBmlFzYWmDXOPUl0xt6q
         mNTVGOPsxXj8sTJpffTsYzSWpiCr0FsUKLoAyYOuFv7e5HCJqrn7RMEGPygALXnoWe7X
         yS2wEa8BWNMPqb92WmAZpGxI3VATvkWwdlZfVeO/zbERB0OJkrE7hqmwvty+GrnhcQaO
         nHcZP9heDPzJEvwCJA6RK3VMZN/seg8DHGoxOZ9C1cXcESSiUSmXrfzrvIycq37hix3Q
         GyPpz9byGF+61KZqOoeaLMMgE2CYXPP7uVldhqdkPch98TibZ117o+bPZfPUPz/51fKv
         QiSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GURkNqiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c5f9a6si102956721cf.550.2024.06.25.08.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GURkNqiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7oC-0002dZ-2J; Tue, 25 Jun 2024 11:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7oA-0002WW-3D
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:10:10 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7o7-0006o7-TW
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:10:09 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-70677422857so1721729b3a.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328206; x=1719933006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olkiI7wyhmRaTOBe/j8f3rBI3dB8B8MYASE/tQDUo2k=;
 b=GURkNqiUaW6oSb9cV/z/Yt4rrE71o5N7JpDy6FiUWbsitDAShzFVBB0BZVn2vM77BB
 ZNF7xFSDXcMFqYvLOVW35KbsI4dpQhsBC3vIaz+QkYpdrs8bSBjdmvTkdgpHbzDspPC1
 mdsj1dTV4kC/EVm9YVOpjQfylfW77u0pL+lKwTCVja9avQSlPm7yLECPjoIthRSzyhNi
 LH6tKsXqcjV/h+hi57EnRPUMbjAHZNDUNV7o0RKSytHrxi7j+WXfbz9czWDsF5FFDo8m
 u8Mc8hJM2wYcIoOvjEyO3x6JntVNs0727k7tAcM2JINBCiUHUO9Dh7xwQoK6PvQdCMt3
 6VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328206; x=1719933006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olkiI7wyhmRaTOBe/j8f3rBI3dB8B8MYASE/tQDUo2k=;
 b=qh98EBL9J6AgqgUG8XqzK/n/3XYtKcFN+DcEZ5BNunSKwQXxEIBiB2tL/E6uTP/1be
 +9KYcEWSPe3gvbe+U9acpdCZAiIBBOboaCb9kgqywUAcRrj7gWixFRGe4bMr93IX1h81
 2p2vwRYC6qwj0xHlXPi9Zhrzuadq8SFbWgiHsaFUcQxB2yRloaYnn/A0YpT5H6twZa1P
 lsDIhngWxCQZcci7KRLvNPlbShACYwrpZ60X9bKqK+QR/I1dl+6GUNi79NYNzeWxHLx6
 i/DVvoXQ88HEk9PajqLkD2TVMcLB4Q6XWpQnfkN/9AIeZ/EeGhy8ixgcVctKSjMDToL+
 INkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGY1ZQ07c3RaOcQTd+HjYORiSL3iYv0+ctqFC3CYQHK6C5x9KpNVZageH327Tzew7L6WzS/ngBwyrAze/GFDgPmbSS
X-Gm-Message-State: AOJu0YxIMq1bEgJG8mqk3ErBYS6YSbVSgh+GXBwodr3j0xN3bFY4/eG6
 bElg8eYN1qREL0HHWjxWQn2rCZK+KojWpaJrk9z98fksfsRVRoMhjbig08lrMVI=
X-Received: by 2002:a05:6a20:29a1:b0:1bd:289f:2cc3 with SMTP id
 adf61e73a8af0-1bd289f63b1mr453187637.7.1719328206324; 
 Tue, 25 Jun 2024 08:10:06 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:10:05 -0700 (PDT)
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
Subject: [PATCH v4 13/16] tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
Date: Tue, 25 Jun 2024 20:38:36 +0530
Message-Id: <20240625150839.1358279-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42c.google.com
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
X-TUID: JtnQ9jPVv6NO

Update the list of supported architectures to include RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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

