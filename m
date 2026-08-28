Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB43C61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0529-0002mO-MK; Fri, 28 Aug 2026 18:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0527-0002kI-W0
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0526-0002IM-HN
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2d7200b2e15so16773145ad.3
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956005; x=1788560805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L/7Y8RdhplbD4Abq8NZ3BtTsO0de2a0oqbAmGeIVel4=;
 b=mB1enHum4woW+m8qtNtKyoo4c9XU8mVVhZMJJUa4beIO1U+sxCdOa23xUA0eCb/8Q4
 cGi0Kl5h3ZzRw6ylGDNeB+NtaRJvP0m70hA1JA067cJHN618KYJC2MsoumTIL3/EASu7
 3dcBmfos4WiY7/6HX/O0WeGOu9zlZRyff46D7LLrJcymOkk+MhNog8mmZYYK116IUfy8
 x2mSr0w3ojV8fJ5C9l9DTTYTbdOmaX1NGT0AaJrt5XXLNvRlImbk95hCZYMPWbzbnlRo
 b36Yj3LV10ZZWvaN0drGK+ciWZAdFl/znSa4sTqrA/QriWJEpL5vAn6gPfnM7rYAh8ib
 /fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956005; x=1788560805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L/7Y8RdhplbD4Abq8NZ3BtTsO0de2a0oqbAmGeIVel4=;
 b=DJ00tntPacPIbqkRyrkzVK3B8fApfwx5VrOO1vG02Mw7jtlG5M+Lzn9dguWD51v+QA
 w2KjfMh+nRFIB5+THliqz+q9SBuF6CrfgXnEzwnufBINzr5d/WajaymQnWZcn8RT8lyF
 w1X1uFjD/oYJexwLiqvq+ysNnmELJ2c9O4j7WeZ7B9ozpmFFu+/toSOT2TPY7sbischG
 AfKzqr+kZTlWEYHsNSQyZuaBKSYoqiQEysLEjo/frBZ0JTLXEN9hq1Ts7DMstM8aEoi0
 QQwe3aP0XEIXPBNJEvm5d43zukr0rV0b6a49TSOT5WMQXxZN83CyNqf4y7qEmBGrrEwD
 7CWA==
X-Gm-Message-State: AFuF++l97ZG/2Bkl/T1haFc8lYnSH1UHmj5Rh7rvdN5/UgWkriyjvXIO
 /o1wOxdOsNyohR5pzrvNdLYEUdAJTqzgYao2HRq41z/qACEdHEBAH0Eis8eEX5+4c4o=
X-Gm-Gg: AYBFou2hJVdA/WcWb5gyW63BfynX9GN2jiBExMBn/2yU8R8a1yVBgLXxp6ek1R9RxHN
 VKTpJBhGZhjAviUtNT2nsiT2uYXO0YsBYok0dSjV8PWm0BCA/2yaLzvlYe3KUNfC3zme7oIUILa
 wG+szJ5RY7ZJmnGl2ZZKDt6aTFGoc9Kgno02pjJ71zxgjCZQCyxS00y/HDGOauZw58LvN169TCJ
 zKC4sohX5t6ClFuZqlaeIqEoB/yF3xVateFSZJFxtCPDvbNGzD45yGlBON9nRrdt4Bg3/ZomsmI
 Xkb92Ygo0z+Hl04y+uhDfZkJM64qIaKnbjrvspJHmXM5d0wM/pK9loUEEZb5DqcQ6drznn/9puP
 oMH5RIenEwPI68eZJMt84OooDd95RRfrUI+xWHOW/QOlbrAjFsGD5iWWj7+nRHgBuT2ZzrPFuX5
 gRXvup4uEK7WkkDrv6IrBL8Jiup9QBB40cOlxbw+pHZjYvGOQQWXW7bylonw5wVVvAJYsyVpmXL
 zjA4gK5nEqr/sPFRIka
X-Received: by 2002:a17:903:390c:b0:2cf:8131:75f4 with SMTP id
 d9443c01a7336-2d74dee9430mr201795605ad.11.1787956004988; 
 Fri, 28 Aug 2026 15:26:44 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/13] target/arm: Move ID_AA64PFR2 feature tests together
Date: Fri, 28 Aug 2026 15:26:31 -0700
Message-ID: <20260828222639.1432046-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently the MTE feature tests are clustered together,
but those are spread across two ID registers.  Sort the
functions by ID reg and bitfield order, like most others.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 280ead6f9cb..8ec9832424e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1207,16 +1207,6 @@ static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) >= 3;
 }
 
-static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
-{
-    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
-}
-
-static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
-{
-    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
-}
-
 static inline bool isar_feature_aa64_mte_mtx(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTEX) != 0;
@@ -1237,6 +1227,16 @@ static inline bool isar_feature_aa64_gcs(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, GCS) != 0;
 }
 
+static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
+}
+
+static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
+}
+
 static inline bool isar_feature_aa64_gcie(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, GCIE) != 0;
-- 
2.53.0


