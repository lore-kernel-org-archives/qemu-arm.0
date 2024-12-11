Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4107271njb;
        Wed, 11 Dec 2024 06:45:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWNn7b56HxTPyGwhLLk7V4s02vxJrvQQC8uQFRdTn74zYIUfdACrITrwfLV5ttlDsi8THJcTmgkTIXCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFamiNfPSHK/trHHY5zfoyaQbnB5hTQWbac4oNkL+l5/apgkhnYjXg5b5afpXgq48fqJTKl
X-Received: by 2002:a05:6102:b11:b0:4af:f5bd:6377 with SMTP id ada2fe7eead31-4b128fe35b3mr3803783137.12.1733928316312;
        Wed, 11 Dec 2024 06:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733928316; cv=none;
        d=google.com; s=arc-20240605;
        b=haHjS2IHv4zBA9IqEmds6ppAZNkeIbFyETDISfy+VTApIMKbVMkCL/ryeimH0lElLl
         VrIpYDDsFbZwKHNIdDSwT17m2zvG5B+O5is4ENJFQtUvqfW/uyUzUWUgXx0mYBNqVMiH
         sVtMV8H3+ZJ/YQ7YsARzv4ZwcC5/q+Iq3PWr1GIOJCeDzWZfr3zZyMNV4+IO/aXpxGhR
         QHw2H9zuMtum0JGLs0ei7hGKoC73Dhpn2rZdwzCRFDWWhVKrrNUIV/7OBy7RWyrSp3ml
         RpvNQ6MyBzM2zI4RqXWnu/jNYvpW8V2XaCpb65dd7DxZoRfNepB9p0UE3ykZdDcGoR/b
         nAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OtTkwTKI52bcxg/lJzvBSIA6PD09skuET2+JQoRaIc4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=W/2piCsbAtxY5zuqlNJ9KxQtN/WLldwGdu2Rg4e7hyVVIEWGP8iF8jilzjOT1LPIqd
         gG0NfQY5FvJeJPJZVlIxLwbLE3DOz2DJH9efiSA+MpsAae2wl2ZFs6TFnryGgIhjogAD
         hRMg2Nlz6z7tndaVmmONiKxugkajt2HqRkvrbNVn3Zr0fh1ZcsVR2MCfZ52aOZJX6J8W
         KdhD8iAc+bxqbHMiBOxwrhO5HjZOe9vDueqF6kFRUTi6KLBms/IrGeQv0zG4+xfSLB8G
         zp7XfSH1MlMYj+1owDLcL9JbH0J3hUyq5S+PlZWuKHErvF6GpYc1jSBntIi4oy3FWXQe
         EoCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eR+VPz2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4affa514029si2107459137.241.2024.12.11.06.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 06:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eR+VPz2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLNxU-0006uE-5E; Wed, 11 Dec 2024 09:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxL-0006tU-KU
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 09:44:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxK-0003sd-5U
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 09:44:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so471252f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 06:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733928288; x=1734533088; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OtTkwTKI52bcxg/lJzvBSIA6PD09skuET2+JQoRaIc4=;
 b=eR+VPz2y0lKC1kb6T2eM9G8BPt0evEq/KC2FMp2WJmoFV3Ck77b3UefbYOqdidglfh
 OGp1+1zteQ5dYhcGqZX5xJObM6VfEGc7plhqd8yYIq/zoLld060t3AgO2JKfetpCDReU
 N4cXvwLEnM2kXaRo3JN+7WYOHs917xGeyOCZhN1akWEx4apzwU4sV4Xi1ynRvj4R8UUU
 56g7DzzhJ+GLPFDPy4O/vTCwjWJq3/u/XkjApdp/tY3Y/r0VmBmvaOzZSAgaaV5fYW1S
 9cqRD76DKyCZ/WLj2Kvi+tauNikakYGsFqSIuEZy81dAWSRNn/LxGJnh3T4iG0X71yRZ
 69LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733928288; x=1734533088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OtTkwTKI52bcxg/lJzvBSIA6PD09skuET2+JQoRaIc4=;
 b=nj3/eyw9AQwpt2LdW9d7h56LwSfLh0poeVWEdfbRqzCg/YXaS0qrImD7HEwPoBNCYv
 MkZbOMxfEYpyygpT+U7u4GccYhjFxw3HFA41J3M0c93WkY+Usna2Ve9xyR2Rd7QhARxV
 tkiTS3UwHStu0mOzbctD/7wXmDYAsMuJb59vOpSKkJF8MsooLVek2AzE3lQaFdmlaWnX
 xRtjnE7cSMYnnqC5MaWxSnieiqdWHf6sOXGpPTH7C/JGH9sihugJbVdBNh0g29TRfyPz
 70AfLngsMqzAQrkRdGsugTdhbXMtc0sn80AWI+r2fi9EYo1U+4nSR4prFTo0n8dqdSIq
 821g==
X-Gm-Message-State: AOJu0Yy+xP4NM6QR9KbMVoJWxuct3cVy7zQx+cXy8udKU6/ANaSZMEAD
 i9Di64Y33M1bJThVHufaTpy5AW6qPMC3Y0t1/Zc55+RqBCKpBd6YkQFulCsN2WTudecNiYEQthC
 c
X-Gm-Gg: ASbGncufF7rOc2N26XxffpM8DpF8dwuiLP5SQrGaWzfj8XirGC1G2SukMDxMC+nLQr5
 +7oLO1e8X4Zo44XNgZKJrmSA5OEiT6rK1K88PSz37VYoe+WqDAfoJkdX3UPIEIVhsFKTCKog+aD
 rP7RcyrrFMxhEXaYT4sHos709CMcVEaAlOGfYRmZjXwGjSJ0X4Jy/6FXNDNNZ9tcdcugAKXFEs1
 z6BHZp3Ez6TxNcxLixsTjemXK0p0Anad8rUI9qbvg3m+q/fi3N/jrMH34WK
X-Received: by 2002:a05:6000:186b:b0:386:3672:73e7 with SMTP id
 ffacd0b85a97d-3864de9e81fmr2504639f8f.9.1733928288468; 
 Wed, 11 Dec 2024 06:44:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361e54ef20sm19477685e9.5.2024.12.11.06.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 06:44:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] tests/tcg/aarch64: add system test for FEAT_XS
Date: Wed, 11 Dec 2024 14:44:40 +0000
Message-Id: <20241211144440.2700268-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211144440.2700268-1-peter.maydell@linaro.org>
References: <20241211144440.2700268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: ai0yNhYt/h+L

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Add system test to make sure FEAT_XS is enabled for max cpu emulation
and that QEMU doesn't crash when encountering an NXS instruction
variant.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
[PMM: In ISAR field test, mask with 0xf, not 0xff; use < rather
 than an equality test to follow the standard ID register field
 check guidelines]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/tcg/aarch64/system/feat-xs.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/feat-xs.c

diff --git a/tests/tcg/aarch64/system/feat-xs.c b/tests/tcg/aarch64/system/feat-xs.c
new file mode 100644
index 00000000000..f310fc837e0
--- /dev/null
+++ b/tests/tcg/aarch64/system/feat-xs.c
@@ -0,0 +1,27 @@
+/*
+ * FEAT_XS Test
+ *
+ * Copyright (c) 2024 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <minilib.h>
+#include <stdint.h>
+
+int main(void)
+{
+    uint64_t isar1;
+
+    asm volatile ("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
+    if (((isar1 >> 56) & 0xf) < 1) {
+        ml_printf("FEAT_XS not supported by CPU");
+        return 1;
+    }
+    /* VMALLE1NXS */
+    asm volatile (".inst 0xd508971f");
+    /* VMALLE1OSNXS */
+    asm volatile (".inst 0xd508911f");
+
+    return 0;
+}
-- 
2.34.1

