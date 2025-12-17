Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A81D66BA6
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 21:22:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVyxL-00006D-PH; Wed, 17 Dec 2025 16:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vVyxF-0008Sh-Lo
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 16:21:05 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vVyxC-0004YW-0H
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 16:21:04 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2a137692691so28877275ad.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 13:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766006460; x=1766611260; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2+w7aKeM4mn6IUIq7PiZicrN3KwLnQcc+QlfR75hvY=;
 b=VB9dcjcwiOWVSdQ37lIEzrg4x/3Mm52GgbuaqYC55WSx7EO1cJaF4x937gjKcR1hbw
 6Dz6Phg+6Ji0Al7JlwpRIoVBdCQlKWVqu5evjWNJ8aagTTJLslNtAKrbQ/4csnuPbvxG
 MXBO4OsyACiTQT23+SbFA13FGMp3UMtujKble4XlBZbWQZbqq3di0XyoGLS8qKfZEBIn
 /k2T2NvVUU7lmCwjMIrPFqXOxfYK7Q/+Grnb2Z+ZFKvV8u/sMi/0PXgNRTc4p79pEKIq
 B5kiZAj3oWOmlUZ6DpSXQ+JI0TnToThscAVL/0JIhb+2LOfafadqD4673uaUU+JVr6db
 66Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766006460; x=1766611260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u2+w7aKeM4mn6IUIq7PiZicrN3KwLnQcc+QlfR75hvY=;
 b=s1s7WX8mBh/ObXhahThIk4rBXyVhlbozhYEwHlo35Nmva4FifRGETgM+Sqhmv5JsVu
 u6zKVbhL96jxkbuxpzL8Jz55jl12Y4B5x3GNo03OclkNLYns8zq0ZAutkSp2hM0DY3Hp
 bSri4pGlcmiMg/WPNJk9jG4co2ddB60CBou87QGf5TJr6MOLFMIJ4hNp2QXPM3SPOXBE
 tYYzTL4yacKoBiATiyPKCrnVqbx9+391VI9+ntxMu3EVh7aAxi64qvE6/GzuomuZwEPb
 rtt2GyD5uetcmqt2RESRbPL5g0ujs0c5jXIeiRRkm2SQL1oRqwKexElLpkTKBjKKsOdw
 W4fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0RS8PL8bihqUtdV8GJiagL0NIJ3t5Xi69gobJbXtMh3eN2dTU1z8lyV7E94DFbeuXMFtdErjxxA==@nongnu.org
X-Gm-Message-State: AOJu0Yy3/tcYgzI3kDxXC5T5kgy+PQtdlOO66xlNEl/9GEIC4h+XLqF9
 PUxQ2LiLllc8kSl0tj1nZKgLtOq9abp2RxLefOzZogivhLPhQcRhTee0Uj2fXdNi1WU=
X-Gm-Gg: AY/fxX4MSZXewoaNMw/E9Ea37gRqXNmMhq5ERfftusn1YhU58WdkCejT1jZ9DWtqPGQ
 ZALEnQJjX5A2Lcwd2e6CU1xWIc41PgSr7psFK2hLcprqfPj1LqJZ3ivElIO4PZs4aDw5gNvQND8
 bR2N8oP2+PuGJiEb8i4lzmtyKP6FnX3jIDxmJPCfafGjYaGLUY9LQ8Ap1a42RUelgIpo4NE6m+3
 35pwa1tmp4VN133dujZNHcsrJRmodWFBQWIOjqEWcD9VQ3mvleOUlzwNEcQOdZxq+l3E+z7C2oP
 6JfhYTm1xoh2povt4on7XqPlNV9aS3+zC9gc8JcUTVWfm04jM7YMX3sjqGZlKlwUt/vf9gZIVhi
 A5elPhu7ba+QsrmrfmaSeKY6vnxQ0DqKF5Nl1uTNJjMfBt4bcVWh9zjDqSohyQEnsGpR6zDDffj
 /fs+ZRiZzvDaeMwS0=
X-Google-Smtp-Source: AGHT+IFg3xV2gW/RwJSjplPlVf9W1qWvTBF6RzlOUdR5mVzRDt6DQLTiIxH6E4GP+uNSJPDW7HEBsQ==
X-Received: by 2002:a05:7022:e20:b0:119:e56b:9590 with SMTP id
 a92af1059eb24-11f34bf9f44mr20860406c88.21.1766006460351; 
 Wed, 17 Dec 2025 13:21:00 -0800 (PST)
Received: from gromero0.. ([191.8.216.160]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061ef3383sm1852476c88.0.2025.12.17.13.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 13:21:00 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v2 2/6] target/arm: Add a _MAX sentinel to ARMASIdx enum
Date: Wed, 17 Dec 2025 18:20:14 -0300
Message-Id: <20251217212018.93320-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217212018.93320-1-gustavo.romero@linaro.org>
References: <20251217212018.93320-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a sentinel to the ARMASIdx enum so it can be used when the total
number of address spaces is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54d..00f5af0fcd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2336,6 +2336,7 @@ typedef enum ARMASIdx {
     ARMASIdx_S = 1,
     ARMASIdx_TagNS = 2,
     ARMASIdx_TagS = 3,
+    ARMASIdx_MAX
 } ARMASIdx;
 
 static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
-- 
2.34.1


