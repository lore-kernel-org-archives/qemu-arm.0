Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4362915ejb;
        Tue, 20 Dec 2022 06:27:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6AnGgwDSZf8/zrJtRqcryMeEzZMpjW3Fs2A0ogBRuoPkoqSdmi3NVDzWdyCbwErucenMU9
X-Received: by 2002:ac8:5c03:0:b0:3a6:6181:f4ef with SMTP id i3-20020ac85c03000000b003a66181f4efmr82149496qti.60.1671546420436;
        Tue, 20 Dec 2022 06:27:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671546420; cv=none;
        d=google.com; s=arc-20160816;
        b=ALahDcjWKKtrt8uq32JQe1KiuKvTuKmeORkor1N0N9T/380Lnx8DAYmMRk7fgviQVz
         Un8SesKpBv4R9JiqlGKDOXup3XVgOvE4JzqngtcQyNChBuxjGv7ES1sdxbBR2ZBCnR7L
         Kr0Jdred3lSZdkFUsaAgkveHnDdwR1/TleMyYzr72NrmeaVPqlSRO6zY3Uqhn8aORh6r
         r+KiqUrbbsaehaLFTiiOI5EZ1oCUAM2UiRwg2cLXkiE8GfTcePyedhJy1ClcskNU4HDN
         EYqGUayo1Bg6GvvXzneGlQzWw+i3BFfK5+7blrUnvt/nMNTgoSC1mYhEpkPFzdtoNfMu
         EmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wS5CxhmEHaWzfXfeaPCFtcR9LUEn6cDWq+iuQTZsc7I=;
        b=czM876V6YAYSJqeQWmvx6XdYY415e1xooAkjBY7SlaqID/jLRUnFTIk42m7oYlij9G
         N7PmRod9ksIX5Og42bGkp7KOYuSiwDVajGqdKaAAcM38+aoUmA39kUKPC9bWtKTNeaPx
         /+mBWGFP8b469foD2RNby3mrjTHE9c2SmVVIaI2cuk/x/j5bCc9PbGkvm3F3EJrTarS0
         B5QVZZ9atfvuz3FTjoTSFuEnn/ix3P2HHYc0s/zkZ2zfgHT920Cym1HAMK8sikRRQl2f
         QEFoP90+mchvC8H5aPRBsx8vZfe4TMZERAzARG1x0/sbyiLCn5HAEZrqytSo8XwJiVZG
         sOXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l1jlxIsv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020ac84e90000000b003946863ff63si5696788qtp.536.2022.12.20.06.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 06:27:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l1jlxIsv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7dZ8-00034v-Nk; Tue, 20 Dec 2022 09:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYs-0002t7-Mi
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:25:46 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYr-0007De-7f
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:25:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w15so11878084wrl.9
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wS5CxhmEHaWzfXfeaPCFtcR9LUEn6cDWq+iuQTZsc7I=;
 b=l1jlxIsvfSo8PNFA5hwP6NUH44msHURNTzOD27kGZjcfS8tz04zr5cB0/gSRh3MzOn
 bIakl97bmFtQ4EYKu5r7BRTia9siCUhuA8ATdoMz1RWjaH4MzOmskkbanHr8fQAc5G2k
 Bqh/ZbSlwj2Cu7e59dFPp/7jBGyhCUDz8QpxmgRgYdCcsLzrEz7yZluLtPp+jg+3MlNy
 7Pn/K5ZTnzKfR/6+2G75pgtgRpZGBlNLFEH1B4xHNqga6zjKD683KC4A1NSNttQxPo7Z
 prccLjlBNnIjaPNsJ6gwOeYwwFKLk60j7eqWfWS8Ly4z6LOCSacFsKO4Y8CG0KCyQqW9
 S/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wS5CxhmEHaWzfXfeaPCFtcR9LUEn6cDWq+iuQTZsc7I=;
 b=C6iho8VesfX2NblQlx2h5KNgGGlgcbW5v0y9pgAcBhjo6AiLOgtOczag0utqzcjfbu
 Z6/CbDb+2eMj3TwUxcne9fotqYZ15pdh4MGXdom3Ylgc6cJJjsAUXkI9hTlwy2bUxO2N
 LRMvGKhDCLghFpnSU3A+VEJoAycNYsJsPlaG0T8OasFARrHF1DLYA0Pz4XR53/YMnkq3
 gMI0Zf5g9MZL4I6prRZQMUt9yZep05NY9pdBz32uv8Gw+HhmIMs1nZGfgx6Npb1M+r1S
 62VA2YBZm1RbtSFxcCvWyfYP42LCCU4YbbUcuI8qFf5WraeupZdbOyUAyt9sjZJGqfMi
 zIAA==
X-Gm-Message-State: AFqh2kqnAwmBTYJHH8etroTPjLZjTcxUzY2B0uHsnn1H/+3n7OVPubc/
 Tun2eWoGEfkK5C0hcAcMMXVZTQ==
X-Received: by 2002:adf:a15b:0:b0:242:61ab:5979 with SMTP id
 r27-20020adfa15b000000b0024261ab5979mr2302875wrr.71.1671546338972; 
 Tue, 20 Dec 2022 06:25:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003d351a9db76sm11175015wmq.30.2022.12.20.06.25.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Date: Tue, 20 Dec 2022 15:25:20 +0100
Message-Id: <20221220142520.24094-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
References: <20221220142520.24094-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: xlh6ACD+z0tt

Silent when compiling with -Wextra:

  ../hw/arm/nseries.c:1081:12: warning: missing field 'line' initializer [-Wmissing-field-initializers]
      { NULL }
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/nseries.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 2ff29f52e2..c9df063a08 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1078,7 +1078,7 @@ static const struct omap_gpiosw_info_s {
         "headphone", N8X0_HEADPHONE_GPIO,
         OMAP_GPIOSW_TYPE_CONNECTION | OMAP_GPIOSW_INVERTED,
     },
-    { NULL }
+    { /* end of list */ }
 }, n810_gpiosw_info[] = {
     {
         "gps_reset", N810_GPS_RESET_GPIO,
@@ -1099,7 +1099,7 @@ static const struct omap_gpiosw_info_s {
         "slide", N810_SLIDE_GPIO,
         OMAP_GPIOSW_TYPE_COVER | OMAP_GPIOSW_INVERTED,
     },
-    { NULL }
+    { /* end of list */ }
 };
 
 static const struct omap_partition_info_s {
@@ -1113,16 +1113,14 @@ static const struct omap_partition_info_s {
     { 0x00080000, 0x00200000, 0x0, "kernel" },
     { 0x00280000, 0x00200000, 0x3, "initfs" },
     { 0x00480000, 0x0fb80000, 0x3, "rootfs" },
-
-    { 0, 0, 0, NULL }
+    { /* end of list */ }
 }, n810_part_info[] = {
     { 0x00000000, 0x00020000, 0x3, "bootloader" },
     { 0x00020000, 0x00060000, 0x0, "config" },
     { 0x00080000, 0x00220000, 0x0, "kernel" },
     { 0x002a0000, 0x00400000, 0x0, "initfs" },
     { 0x006a0000, 0x0f960000, 0x0, "rootfs" },
-
-    { 0, 0, 0, NULL }
+    { /* end of list */ }
 };
 
 static const uint8_t n8x0_bd_addr[6] = { N8X0_BD_ADDR };
-- 
2.38.1

