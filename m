Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2433030njd;
        Mon, 31 Mar 2025 16:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/koN8mW+o2ttLkSCCbQ7DUCupm0+q24rKPwq+PEsF2TshA4uxvGxWPvu/EL5f8zLqlNxwVdjWpqVcZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGjhpbVz99XGgrQ92sWjzJDKSaHrqBq+BqV0xReIrOE9+QnMaI0+xkpq/B2Sylb7q+LAYnv
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c6908757d6mr1590991185a.35.1743462327771;
        Mon, 31 Mar 2025 16:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743462327; cv=none;
        d=google.com; s=arc-20240605;
        b=K/q5CHEd5UI9UkDf6Sa4tB5TuHUmfTfBDFrdb/FCn/6toNOutncLyXNqqI22rRByi5
         59gho06m+UsHVIb3BJStYtPFNpF+QxbRmXObrB6QYvySXPzGwOeIBqTxoIT5Hx0JgBoF
         prUWD+Y66evmqCaGqDHKMENcnX8F9XEtwqVXVN+XYoAOgNnCwauNtG+wO7FpFfK2HsXO
         FPHs4RAl5XBt61YiCtjm4yVkZHtuCDrwPr4k6b9qGGaIK21InXvRPDMx3oTMJs1u8oM7
         sKlwwlVC1jdE6GLJG9vCO1qgcTZCbTgT/OhNQX/TIS25HJc4Yws8voQNv8hlktRkZ9xD
         Di/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BIwoF+GPbpxMD6AIqgIwHFGJjyw7iyBvkQD2QC7CyfI=;
        fh=JGcWPbCnFn7/PWbaD/do9Q48y/FopRz0nYTfl/DOOyc=;
        b=YAH8k3pMa/8u1X08YK4MkaTRtV26DrA685eJEGkznyxeoTNdD3k04tKjejQ0EXUjoc
         YIqhOXhZkUu3HymCjvQTT6jZ7ogxf7MNGpfwz9m8/6u+5zz2KAVkPERtoA33UQ6xi2wY
         ImRT9HtK0UjXowVkxPW1gUFhqf8CsUOAn17dAJghvoEjyhTGh1M+00SLH8RWIDFepQ6J
         UrRHsYdW7TOogJtXZkV0SZ3ge9zn7j7IzY5+abMiE+tqWithJ9pReK2ozYys0a7Xv7d8
         I21Zda1bC5BU5o+IBIdpU0pu8gza0q6AB8l80pFSUExCqAsjG+qiPBCmU6CBPBtmmaMY
         mEFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbFLxMK6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f77b5921si793292885a.519.2025.03.31.16.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 16:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbFLxMK6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzOBg-0006oD-FU; Mon, 31 Mar 2025 19:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzOBf-0006lM-BB
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:04:59 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzOBZ-0005lI-Gz
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:04:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso49989945e9.1
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 16:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743462292; x=1744067092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIwoF+GPbpxMD6AIqgIwHFGJjyw7iyBvkQD2QC7CyfI=;
 b=hbFLxMK6yVuDK7+IhMqnG9IjMNLMGb47o/7nkjnlBOnOsfjA0ZVHjZIzJ1fMP0n7Tx
 JygYtJpEFcIevNcfhjyIcVZyQ1WAz0EEue80Id3lHXLshKqyhpa+g5KVybZg3m+K7ln/
 3TGjEvxA2oynSNsUxObv93+w84WpGBiD8yxbY9dsT9GRSapRPD0iWdILBAV0hfGFTSZ1
 DAlqLTjZTDzO0VfPQt9BWc4/SloBNoI+PUVxUNx1wvI4sxF9XOGHOxcvBewJRz+P5S8B
 QHzB9NOz4Z5v5bSuTExLq4eySGF8aOsLYkrjtpGIqAwcUSeCJuZWNCOwUr2uW3mcczIs
 i7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743462292; x=1744067092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIwoF+GPbpxMD6AIqgIwHFGJjyw7iyBvkQD2QC7CyfI=;
 b=lVwft6iC43cO+uaQn2ERO+r24i0IbACQNAetZ6KXI8JFpQUMfH/tyVCln15p1UfNrs
 0kO5sYOtayj8D3st19IWoUroAYtlWP9OiUDJJfTKvMzRs81z/8LpxFhMavmEheKTyAW1
 9AG9kIMmLxbNLX+Z6E0RyRW9x+GRUSyZZf8tChU6Auxv35DsBd1uL//dcY2iA05a0xP4
 OKZ9rdmUlJ+wYzht1yO2Eqo5bhvELcZGDepGorQpwwvRp/eDkzadYV5bjJTMkBTvFcCm
 NNQ1U6FcUDWcKKe3mcP5gR3jinROLP30Bvd9pq7oHRc2bkw0qPhTlabp+14fMWpmBdPY
 vGGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVB9YgH6LoKaFVTe01+Ow3nndToQRBKAyZzsstxkgYXQHInz8qC4wpnKbeCkh2v2L6B6gmh3p0Jw==@nongnu.org
X-Gm-Message-State: AOJu0YwOu2aUlncfjJncJNMY/6ejBcIVLKYxAlC/GRtj9AtIQWLiOfnE
 Oed1YZTnAnIdiuWWbOsbLDaAV8eqRzZ+TJIvb7D3l6N2gDl3Cp+hGAWFjBOtKyI=
X-Gm-Gg: ASbGncu7RPmbXdxWI19muPO3JcmJ73or91+A2hnbNsUZs+a4OEHDSo4gfHXDPaObXX1
 Jl2vJi8U2b0J0LIHpAfE/d6eJV8W1zSWL2tuCNy+ViwKWX9/JJSEvkIha2KfTp93X/fkjogGTyD
 +nubRCzhSfNB+zOxfAs9WSk3pyadp27t4uamKKK5l9MIXkI04twEZsNOD8f6AGvDHxTcHqsXKNb
 AoqavYz8ogQBfeNWhm2Q2iYkO6fk846h8A6xpRN2Z0uwBbXgbScvYd60XQVnWdEHDnrRrp4/iYT
 vkF69pHKeoEsX5w0FFYkwuLFbr6MM6FM+PKcsWV9AjCyaXWsUz8u64WqaMFnPn04PgOKtZhfLHb
 4Mo+PXvHALixREsuNb4I=
X-Received: by 2002:a05:600c:3b9d:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-43db6227a09mr87300745e9.9.1743462291971; 
 Mon, 31 Mar 2025 16:04:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dede2csm178484285e9.5.2025.03.31.16.04.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 16:04:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 1/2] hw/misc/aspeed_scu: Set
 MemoryRegionOps::impl::access_size to 32-bit
Date: Tue,  1 Apr 2025 01:04:43 +0200
Message-ID: <20250331230444.88295-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250331230444.88295-1-philmd@linaro.org>
References: <20250331230444.88295-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: yKWQJKodRPaW

All MemoryRegionOps::read/write() handlers switch over a 32-bit
aligned value, because converted using TO_REG(), which is defined
as:

  #define TO_REG(offset) ((offset) >> 2)

So all implementations are 32-bit.
Set min/max access_size accordingly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/aspeed_scu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 76cfd916716..6703f3f9691 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -427,6 +427,10 @@ static const MemoryRegionOps aspeed_ast2400_scu_ops = {
     .read = aspeed_scu_read,
     .write = aspeed_ast2400_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4,
@@ -437,6 +441,8 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
     .read = aspeed_scu_read,
     .write = aspeed_ast2500_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
     .valid.unaligned = false,
@@ -779,6 +785,8 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
     .read = aspeed_ast2600_scu_read,
     .write = aspeed_ast2600_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
     .valid.unaligned = false,
@@ -906,6 +914,8 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
     .read = aspeed_ast2700_scu_read,
     .write = aspeed_ast2700_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 1,
     .valid.max_access_size = 8,
     .valid.unaligned = false,
@@ -1028,6 +1038,8 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
     .read = aspeed_ast2700_scuio_read,
     .write = aspeed_ast2700_scuio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 1,
     .valid.max_access_size = 8,
     .valid.unaligned = false,
-- 
2.47.1

