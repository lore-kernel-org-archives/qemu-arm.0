Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF4C61DB9
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:27:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x052C-0002nE-5c; Fri, 28 Aug 2026 18:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0528-0002l6-Mf
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0527-0002Il-1M
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2d5cad1a6baso14524275ad.3
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956006; x=1788560806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JPL48k+kgX/er3dbBwM3QqTUUWWWeQuTkLu4LhOh8Fc=;
 b=n+I3Maf4pC/FHSPJiMMZtXb4HJvLQgSsOc89dUvrWdOMnmzFraB6tM6YBL0ZW0ciyO
 KBBSupK3ZovKlnPLpC6OawmoCv1dOIkujIFcUPwQvvUVuv9z9qfs0VhKjdWZOXwZyk/v
 BPYpgneNKZCbyt/+34WKYntvQz2xJq47biduTpS5MgEiF/UFO52qO9RwNkYMW5uH+OdR
 8Mr1WN8xYkrjfTPA7s/nz4mqA+Ha93t6nzvKMOr8v8dQ5BgtO5YTBO+OcJODjm3bpWZN
 KkQ0bnMc6nGDhzFHcB06y/f7zcw/Tcyjub8cSwJkEPs2Zv9LPAk1bojKpgxroER+Ztsi
 tFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956006; x=1788560806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JPL48k+kgX/er3dbBwM3QqTUUWWWeQuTkLu4LhOh8Fc=;
 b=Z42AZOSfgrUdEymZ7JYPc2VFz1r1fTcZ+0iIbfAalIw9HJHz3wm5ujOXg5PFXiJ4Y+
 5wX50nBQSDP9tL8F18f9VUAhEjGMGck6Td2Ad3cQiYAHNzypo9UDnpB02uoK9+QxIMF1
 b8ZemIJJeINX2HSlpI2zw9eoIRsZr7U+YXjNEaeqZAaAIzx9OQkm9LZKZyZ/LNqQtfFL
 XhWJV/4SV9Pk+CARY0Of+M/BmIHD9qQbBzLwaB2YcHGPkb9rt/HhlQtSv6JsjJNsVY08
 MkRDIGfEW7E61vBgpFuQJ/QefcMwDsNolRS/JKSsi7Jl0XUKt5wRntVIaOACxApqklpf
 t4zA==
X-Gm-Message-State: AFuF++mrhtbkHZdfNBp5FAY8Jd6mdcCxWOLZf3TpSrpDZ+A6uJ5Pwrmq
 24PV6d11x3A6ODh2xJ6G5n3tTvdPz573l1EgQvN7aHCtuGAWNfdLwCXqhKlatIt3Vfde46JNLfT
 7joJNETA=
X-Gm-Gg: AYBFou2VOE+TlVAds4mEY+U0HDQ5v1hiKTo+1ISR7xO82/wIN5ZW3WS084cLjW4zmdV
 YIBNYXmJCqWnR87Tw3ytArzRnVmyKSJxVZedBpva/ZESHKWAjJKb/i/uOX9yOa6O2EVGVzK660Q
 zX/e/vqD+S+9Pw4ts0qcMq/piD6OiBPcYbrT+WJFyo6qVNILBUjUwX4yB+XR4qklJy4BCD7ENl0
 jkFMSLpUo6TImDhpiMvKN5kBMbZr9hMDr6dT2W3LZNpGXUsbKgyp9NugAQxiy09bzFkzm8zd3bU
 QOQW/tQxZLvBj8Yg3SyaykHwpxNZzmqt1XYypF2KwJKWAXaOKQAwwmzDKhAAxAL5v3anZ0C4N43
 7MfIVqhqrleb5pgXM6hGf2r1b7Tzmw/WvXhAKfri4Z26JcPkVGdpDC26uA/IWdwJFbi/0NzSFx/
 A5nS38KAAlkql39PQLZUEMElr8+1HmlD62fBF/OoWnReCVsAGjY2lYB75hCDwxbyt08YW49xqJ7
 bcrA2aAGR00eMenbp8d
X-Received: by 2002:a17:903:144f:b0:2d8:d4d3:da4d with SMTP id
 d9443c01a7336-2d8d4d3db0emr42727475ad.17.1787956005562; 
 Fri, 28 Aug 2026 15:26:45 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/13] target/arm: Add isar_feature_aa64_uinj
Date: Fri, 28 Aug 2026 15:26:32 -0700
Message-ID: <20260828222639.1432046-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 8ec9832424e..1c57bacf5ab 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -290,6 +290,7 @@ FIELD(ID_AA64PFR2, MTEPERM, 0, 4)
 FIELD(ID_AA64PFR2, MTESTOREONLY, 4, 4)
 FIELD(ID_AA64PFR2, MTEFAR, 8, 4)
 FIELD(ID_AA64PFR2, GCIE, 12, 4)
+FIELD(ID_AA64PFR2, UINJ, 16, 4)
 FIELD(ID_AA64PFR2, FPMR, 32, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
@@ -1242,6 +1243,11 @@ static inline bool isar_feature_aa64_gcie(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, GCIE) != 0;
 }
 
+static inline bool isar_feature_aa64_uinj(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, UINJ) != 0;
+}
+
 static inline bool isar_feature_aa64_fpmr(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, FPMR) != 0;
-- 
2.53.0


