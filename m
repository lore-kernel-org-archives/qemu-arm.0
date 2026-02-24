Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DD7F3C991
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 15:44:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuuZt-0007wz-RF; Tue, 24 Feb 2026 10:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuZn-0007rF-7z
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:43:56 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuZk-0006IQ-K8
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:43:54 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-65a36583ef9so478678a12.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771947830; x=1772552630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLxuXw2XnWGwhF/mhX3epGfGgtQaomurSwQWIXwnoKY=;
 b=vE17HoZ8lvYb0tU2g5N8mBoBqfHJ+DqmXNjuPGtc5jW6WL+H/iwqAFdNL4d8/kSvz4
 HLVwT97b64CDm9E36BdRQEAoOlBe7wD3sgNWpuas2rihIXubURSHt/F9iKSWckCbFnZR
 DvOP68kXXaK0/vm+3lXquwatAyRA0XavS8RDX0DibX9Pb5b25eZzPTTgps/Kk0on04JZ
 Ebu635vBAvQDUTeFJMIdtgMLRLy9LXSzyt20g72VOyQPHsqcNERP0qTQeWylEJOcFrG+
 oW6o/iYcyqxO+2sY+yQhknst8xp3KWaSfHGTAMjuwmZNkjYCTUNq+UQkVTkMmHm63S3h
 XgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771947830; x=1772552630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jLxuXw2XnWGwhF/mhX3epGfGgtQaomurSwQWIXwnoKY=;
 b=EqjV/iMK0kkIUSs6va4KNiSrt2oJZ8k7imH84QYW2VEzdpWc9i3CHKNHWXStgsIhB+
 EEUdNLXEc8t62JbfHiOUB43qGq6iyuGUw88JRvedOOqFYVJmUi/YBsbuenNv+uyworQy
 EinMGuqmMr7vDTZVM3afzzzOF9Fy3ByGf+SsI2EGEIzmRup7mhyuDjSnfzqo53aob+Os
 IEM/Th1ef8o0C58ZbcBBe3Bz85QGa23FhKUzXmrRAcXF/4Wpi9LvwklNlCgu9il9L/gw
 A/d3bEyAaWq2TFDeaG0X8E7KRZNWJru4HypnJDnAo4A1F0+IwPX4uCRf379REDFBQUpw
 7ffQ==
X-Gm-Message-State: AOJu0YyDs04vfFK5ZCymS102U7M70EJRVjjVmpX0CgcWAvmHGwkqyVTI
 cm/lsIewmcATnPRhaXMhw6oniVTRwJnDtx7rw+5UM+mnuaC0K+B+OPqR+4zsSCwhHakV/9INeZv
 IvhB+
X-Gm-Gg: ATEYQzzP1r6P+k8qvyBLIOCiEnudVOb/HyS6axWmW8qDWS8lzibv5+JtPAtC/b6GngQ
 sAUgDZnbSJwoPnIIxtwY4MSSZqzlWkT+Q/DOPIeIR2bROuO9PewG+Lcyx7vgXfQ9uH94CP2CYfX
 wNVi5kt0kXQy7wkSqlRF9FBVnr7tgR4T1jJzDbwrdLCBaiW+P7mc8W8/51sn8R41a1QsoBKTs9W
 DShaoebJM/NV2/hOjEKTdszorcJt5BCMl/5Y/Rw+YeBI4NQ8CxHlmOG4oMh2T5u+q9Rubj+GRCU
 yH8IjWmW0cwIKK+i3tMWGu1Ut+geeXo0AZxAJi8+9OnHmNFsoEe2Ixg98aLRHbJ3J4C+CLp8Mt9
 fFPn/qV4pyalJcxXxnTZngFwlOmpDTTTUHnCCJUfxzRWf3NlV88Lp+4hHdgk/i3waEmw2n8oBJ0
 BozoVut54g6RsBBgveyqwI52c=
X-Received: by 2002:aa7:d5c2:0:b0:65a:23e6:ae60 with SMTP id
 4fb4d7f45d1cf-65f7ba1a129mr180961a12.12.1771947829539; 
 Tue, 24 Feb 2026 07:43:49 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba2db5csm3657446a12.24.2026.02.24.07.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 07:43:48 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 624525F8BC;
 Tue, 24 Feb 2026 15:43:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] target/arm: use FIELD_DP32 instead of open-coding syn_wfx
Date: Tue, 24 Feb 2026 15:43:44 +0000
Message-ID: <20260224154347.344219-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224154347.344219-1-alex.bennee@linaro.org>
References: <20260224154347.344219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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

We can use the registerfields API to safely set the individual fields
and avoid open coding magic numbers. The EC and IL fields are still
driven by defines but we could convert them later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index bff61f052cc..86a2d5ea9d0 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -26,6 +26,7 @@
 #define TARGET_ARM_SYNDROME_H
 
 #include "qemu/bitops.h"
+#include "hw/core/registerfields.h"
 
 /* Valid Syndrome Register EC field values */
 enum arm_exception_class {
@@ -352,11 +353,24 @@ static inline uint32_t syn_breakpoint(int same_el)
         | ARM_EL_IL | 0x22;
 }
 
+FIELD(WFX_ISS, TI, 0, 2)
+FIELD(WFX_ISS, RV, 14, 1)
+FIELD(WFX_ISS, RN, 15, 5)
+FIELD(WFX_ISS, COND, 20, 4)
+FIELD(WFX_ISS, CV, 24, 1)
+
 static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
 {
-    return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
-           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
-           (cv << 24) | (cond << 20) | ti;
+    uint32_t res = (EC_WFX_TRAP << ARM_EL_EC_SHIFT);
+
+    res = FIELD_DP32(res, WFX_ISS, CV, cv);
+    res = FIELD_DP32(res, WFX_ISS, COND, cond);
+    res = FIELD_DP32(res, WFX_ISS, TI, ti);
+
+    if (!is_16bit) {
+        res |= ARM_EL_IL;
+    }
+    return res;
 }
 
 static inline uint32_t syn_illegalstate(void)
-- 
2.47.3


