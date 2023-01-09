Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2196362ejc;
        Mon, 9 Jan 2023 04:09:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsiHUx7m4cSX2MUWEw3feyDferUDmV4s6xYY0dWijQ5JiLPRCaQokzbRm1y53k5KRrrfsxD
X-Received: by 2002:a05:6214:2ccf:b0:532:bd9:f596 with SMTP id lf15-20020a0562142ccf00b005320bd9f596mr26209468qvb.50.1673266151633;
        Mon, 09 Jan 2023 04:09:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673266151; cv=none;
        d=google.com; s=arc-20160816;
        b=AiBjjl0XfvBRveJ7meaJkPg4mAVVUm9Fafp/hVxqfOwU7HfHQnvyQ5LWelAeTLC7/P
         brHrYndGVWk9eK4UQ8y4urTZ953n4yO/o0KvQa+0lJjNQao3Gd6uT4HU5zq27lQFWzQk
         RcUyEEka6PyX9zTNQBONs5JS1Hl4+Yps3vR3gBcuZxOQbPRYhWhkA2f4/abW0pzQ6QuQ
         tblv8tuTMU7vqW1qY01A6y5Q+as8MTFXSd+dDo4TxurvkhmoCUDxY1/xALhvE0wVzdMN
         duPLfHDUG/FJqezqszDSHk39dBYByoC81nzXukpd5YK0w7mYJaEva2g/m1pbFpeY4d4l
         Y9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fbdqJdHQkqZ1zlOSqiHVW5as1b5l8uF3BLsUWk2mkB4=;
        b=CsPwBh3mJfKSYDQINnoCQcP+fD3krsU6B8qwzx+OudrByNWQtQkOuQr6a20VJJFQqd
         wYyqi8MEILQD/7M0CCkHJSAZmqdqsz9LpiP9+e9fzFRh5Oa188nTVkdsN4qr1PTKuMCG
         572ox+RKXGYuInjmbwGANtlLIPUOGcC/c+WFJZFFvNFozQaZySXMFSg/uievLDk6788I
         Gy+6NjT1rBYZ1aH0mbV52ugMX1g88PeZFl0WvV0Xr7BcfnyYq3OWjzPxAOqUzP8/cR0D
         wXI2yy0pdlo8Gr9PCA1nAlM72Jty+Ldv7+H1JtQC5xPjxIuV6wLCqvYaOYtf+vMR7gcx
         cduw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQJgC4G+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a056214076200b004bb933e590csi4287832qvz.28.2023.01.09.04.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:09:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQJgC4G+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqjI-0003EM-BB; Mon, 09 Jan 2023 06:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjG-0003DL-1R
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:14 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjE-0008CE-HZ
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:13 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g10so6074885wmo.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbdqJdHQkqZ1zlOSqiHVW5as1b5l8uF3BLsUWk2mkB4=;
 b=wQJgC4G+IEut3I7ha9T9Q6SCdf/ps0N9N0nBl7WPF5ylGYc2yWxv26w7MyGPgC33bX
 ta3/q8NQ5eKoWfOeSanzlghudqEb8+y/0Ik6ZwXwVPN/oSewxVhqfBCktC4Mz+2KsDrl
 uY3qf444K7xmLcdo/OaX0knUSuuLEehr4KoGug6j4PfuBZVe5x7d8Q2OwljJq5g7aCon
 tzuYnzROjvqVoa1U+kG2S1X4xarG2br2Dvk/xGrniINVcE6AuNIEU8X7INtpailCXhdY
 Vi5JICr3tMGj/O6arFa+JD7YHcU1gIxFy3W1kOCLeDJtOkUHk451hZtOLfvrjxkxIIJM
 9j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbdqJdHQkqZ1zlOSqiHVW5as1b5l8uF3BLsUWk2mkB4=;
 b=J81wHWkb0QqBvFOot8MpWwV76C+BBU0xohedj/buxOHLVA/ld2RbzYXg98hBpnw4qq
 Y8ZB6RBCCbQa4VdTL6lMWos6WXfcNMC3W7kzfDS4LHnGxzbza+hFOhKj359DEfwNWTNQ
 xMcmQ0dqE/N9wwhrN06QtClP8LW6+EdmJPX/P27Ta7rUFY+3c1aA4Xf/rzbZFm3CtOoJ
 r0CNFlJsiOgiffSkvZtEtMOr/db0UWbgtx1kL74sFn+ofMyaSuZrjTgSYKHDFuVQDGd4
 TfMR5BpuIOZYi7sfHCZsSofVIdupGxOm2FAjG86lphDeiLrIKsidazHhY/3F9aD8QsHk
 em3A==
X-Gm-Message-State: AFqh2koaoqyTerdJwkdktOe5G4ja0KfymUnSsL7w1kowXi8VTnEIwW+8
 XDpZW/P18WH+BCX9lXb7VFAXzP8QiMv5iJW5
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id
 c17-20020a05600c0a5100b003cf6f4dc259mr44893613wmq.39.1673265251307; 
 Mon, 09 Jan 2023 03:54:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm17224440wmq.20.2023.01.09.03.54.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/13] hw/arm/z2: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:14 +0100
Message-Id: <20230109115316.2235-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: ax6+1iGYHVFl

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/z2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 8eb6f495bc..839be3ca16 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/boot.h"
 #include "hw/i2c/i2c.h"
@@ -297,9 +298,10 @@ static const TypeInfo aer915_info = {
     .class_init    = aer915_class_init,
 };
 
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 static void z2_init(MachineState *machine)
 {
-    uint32_t sector_len = 0x10000;
     PXA2xxState *mpu;
     DriveInfo *dinfo;
     void *z2_lcd;
@@ -312,7 +314,7 @@ static void z2_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 4, 0, 0, 0, 0, 0)) {
+                               FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
-- 
2.38.1

