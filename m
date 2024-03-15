Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990580eju;
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW48MAXl0UQRpIs80zgFAKmA8qvW980aRyACrMHbRxMeVor9wmEhHR5/V3oZWOMNmjzWy1XUTmgSkXqiZSjCZge/+H+2JfS
X-Google-Smtp-Source: AGHT+IE71A8XUGutco2UMb8PhemkOzaTd+f97v0kYl0Iy+0UWgxzte3lU+AWk+w/oDOGR8mfFa13
X-Received: by 2002:a05:620a:1672:b0:789:ea35:4465 with SMTP id d18-20020a05620a167200b00789ea354465mr37447qko.31.1710508296474;
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508296; cv=none;
        d=google.com; s=arc-20160816;
        b=p8QSgWsEVwRGTCMsy33RZba3Js0sFOYvvEZR+v43BtMxWQRTQzg5t7w0H8F0XhAfT5
         9hZKIpfvAMXfLl9UE5c1u8CCCUVQL6j2Z6sCMBXAjKbyJYGwPPoqRbN0EGRNxL4jf/iD
         VsaZnQm1R2vhUyO9e1gUkHPX7k3IWMAvf4OLVxVsO5P9pU+TCmSKOPpZKjsQiKZX6Owu
         SHvqiX6m3rmgENHO15W7206xZmo0stnDEGbGPv7YTQWjtve1JFAyWcFDFHEeussiH0n5
         8QP+I4GlPPn36oMcr59Z6CUCfzAK5o4LdhVzmRv0XjINubT4EEQVl22WSnLgS/okg2wE
         9sGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gri6e0kUQ2zYZ/hFnr3bQcljAuIiwyEyI/MJW064ldw=;
        fh=uGcXrD5210VkmqrQURzS9Txl0eldLxl/g55OxRC+1V0=;
        b=OJmH8Ru6ezYFZXNdgPp1Reba0VvEGXUqd13HVN72ldzuK8aSVBvJFa2AIGjxYmjjJq
         tR7tAYw3KbZq+6U7SMRGI0XS48GXnEeyF9KHlLf0Yds1XoyfLgYNzSWnZ++ReyeMVx7X
         UbzcxJS4/jQo5l8afMRiJ6iGsT/OuKUIcenmAYQovJcRINswMm4xHfIUa5AnKJczk75n
         o6hw/z47JCalg9/LPilGvQWpT6h0WyThGM71iC1+tpuA4fayTP3GKDjUtNDe9LYd/umk
         7rp0vyeVCcyKbRC1IsGbe0hejFigWYeJQ+QAFfTANgOnYWhaCNf2NojGcKn2uN3TQlPg
         I10w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WQ+oUlBM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm36-20020a05620a19a400b00789e90f7010si384560qkb.169.2024.03.15.06.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WQ+oUlBM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rl7Kw-0008TV-8a; Fri, 15 Mar 2024 09:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7KB-0006ac-Du
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:10:16 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7K4-0007vm-2T
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:10:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so2537719b3a.0
 for <qemu-devel@nongnu.org>; Fri, 15 Mar 2024 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508204; x=1711113004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gri6e0kUQ2zYZ/hFnr3bQcljAuIiwyEyI/MJW064ldw=;
 b=WQ+oUlBMUTFP7uA5GKlAU9HLBHG2/mQJwYMcgh0qm9w7v3mWl9AKfDH6Seh/wbdDfn
 c8yFtRY86tvfn017oqaH2e9REatLrhKI48XWDO5YmwrMXwRDx5L8HHI7agoogUf0hQEH
 xBip0nAa8pgoLLf8eshcA2LwyHywr5XO9QbO6l43pRoZ2W0JU5G3i6XRvqQGHuuDxAlG
 lmKsOg6tbtcCmUAxxaysb22L3wrFO2NIkDRyAJotRJT0TN8l7T9Tcw6sbXL5tWOANaLF
 RKhQkJGSCS1qDKiDfXOgaxVEEkI1wkRMmXRQljoOkRVuGrmKlI1/nQaq6vN43La2s0WO
 p/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508204; x=1711113004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gri6e0kUQ2zYZ/hFnr3bQcljAuIiwyEyI/MJW064ldw=;
 b=JLMhY7v9N0WFr3r63tiX6oCnGwg0onE38sG9M/cawep77EDV2qVRBUO82TvoCgkOsY
 0tcxVjmpYKSput0cNVYQt1CZfUSyF9rbGWB0S47vHVpWnOZvydJ6n+VsiF9PdjV4J1+1
 0OdsgXXCWHn5riQbOE+Kt2aDVG7L9wVD0PqVpvpoDd8U/1JcnbPqy3+OHFg5Eg1u/OIm
 Feby/0KtpSi8AG9Ct3DJn+Milit/gG2BQB68xZeR9X6hPuMDNJuPkMQ3fs5CzVxltFCl
 ietGdWKZXxYd5o66LzsceMTWWfRCg0zqSIgTmRAAmwYk342Mm45HBvJ/JezRb3wWTwH7
 j+Kg==
X-Gm-Message-State: AOJu0Yzl4YH3iiTsNPMy9Z8kJEBTsWxNN4aqB5G5y4z9LfjABgN34mCH
 rAZaQ1zqynQYzwP7RKVmHglRrceMDyhkm/ERk7Nl/ETwfG6utJoPGYWTlyKU01TCK8n403URFeH
 q
X-Received: by 2002:a17:90b:1bcc:b0:29b:a1de:32d3 with SMTP id
 oa12-20020a17090b1bcc00b0029ba1de32d3mr12532208pjb.17.1710508204543; 
 Fri, 15 Mar 2024 06:10:04 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:10:03 -0700 (PDT)
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
Subject: [PATCH 09/12] pc-bios/meson.build: Add support for RISC-V in
 unpack_edk2_blobs
Date: Fri, 15 Mar 2024 18:39:21 +0530
Message-Id: <20240315130924.2378849-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HGP9ND0Qlgtf

Update list of images supported in unpack_edk2_blobs to enable RISC-V
ACPI table testing.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 pc-bios/meson.build     | 2 ++
 tests/qtest/meson.build | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 0760612bea..8602b45b9b 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -4,6 +4,8 @@ if unpack_edk2_blobs
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
     'edk2-arm-vars.fd',
+    'edk2-riscv-code.fd',
+    'edk2-riscv-vars.fd',
     'edk2-i386-code.fd',
     'edk2-i386-secure-code.fd',
     'edk2-i386-vars.fd',
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 36c5c13a7b..dd19711d9f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -252,6 +252,9 @@ qtests_s390x = \
 qtests_riscv32 = \
   (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
 
+qtests_riscv64 = \
+  (unpack_edk2_blobs ? ['bios-tables-test'] : [])
+
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
-- 
2.40.1

