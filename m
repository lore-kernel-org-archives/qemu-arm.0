Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CFECD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:46:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OS-0000OA-JW; Thu, 07 May 2026 19:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OP-0000Kr-EE
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:33 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8ON-00014A-My
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:32 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7dbcb467f2bso1302595a34.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197470; x=1778802270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WK8IU7LFshBJy1B3/luWeWQwxfypwBRVNYAwu+A8Dw=;
 b=Na6CmFJHKaKo+P1cdFYcGz3VHuFwjmxzYU0OAKe2s9f0OuT+s1KQ+coF5qy6fUpuNP
 eL9oVVYtlANPIeDFT8xOp6G4YJyBnzbHBwJVUw1K88p6FOTC2x4ahzL/CWmUN8MG68RA
 nhQZ/KIW13ALqc+7eanQY3aDALi5CitZqjZJhbdBHPFDK0OMGekEIwKvge6OMZhn32v3
 aFnhnblBsNmvfs1S03fVQDy+Sjnx1QHUx6fb7FpPYcs5r4aCXyOlst5tY6bHJMENmAIr
 W/RBa7ScZPyFlyb2909eJgzWb5DiLuTzLiXilXBc7c7rmrOQzGancqKQGzzdhDoB0dPH
 oDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197470; x=1778802270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9WK8IU7LFshBJy1B3/luWeWQwxfypwBRVNYAwu+A8Dw=;
 b=Q8gpie9l07I0CObZ//gMnp7mDcqKMF2wmvuKm2tRGS/JbYiOOLmkK4c8WDzB08hxg/
 lpw8e42SaRd4L5XgFerQQZqpsdvf+mbon/5Vsk7yAlMCLtX5yFi8SJ37ZSYQCflsfAqq
 kxTK1gs9h9bMNuEKimGri3EFVco5G61KrLcpkQvpwcyzNhZIQmM59MD18SPa500Ni0Rq
 iLjPFu2aoQR0N/NycW4Xfyg695D4wALrtJfAvmWp/WaTf/6T3Gm0uKPwRg1dgVMjE565
 clU2mJOEFkIsSHEUi/EboUD7qT85BdO8eKHJjJ1TR1j7zInxblKVCixQi6FKzhoax0+p
 lSFw==
X-Gm-Message-State: AOJu0Ywq5w6QuRVaq4aEV9xd/Dl+sDDMZCRmbwEzyD3njeWfBLOw0nqt
 LX4mT0Z4XfbwSbrDQMUzPHrptJm7ilNEWZtukP1maLKx/5uVWQZ74vfrePmhJHe2qlzD/FARmik
 d9RyY
X-Gm-Gg: AeBDietLyAN4sMvUsNPL17NsuYN5Bg5JYZdF0MaKccDC+4+QONbK+t9EgliG5lfG2L0
 Jr5TmlncjT980J4EeIVkVYwk3BLfKA3oGugDiug6/P4d3bffaTovon1hhWqMT9AD1jLJ+WZGiJb
 X28RcL44kBHnh8w32tm9wLoCbf3JdEmt85mPC0WMmUe/w5yLxlXTTG1qbsmZjWm34H1uVtaGqiw
 ORZj+KVs2GaTvCVY7ztp9gfev/lo8ofQYs3YjxsPYKVHjgyTCHa47OXmVzWTg5XfhlNR4IEHoFe
 UuHC9e1rQn5VZ1JWho+Pgh3VtYQZ8iD4tjzdtHBln/HmmWacbcZnfRuU0JPKAC1EX0yZ6y+9d0X
 XWapFVUeBgwIrQgdOjTFP/nSP0FonzpgXtsO2wX8QQA6TiF/pgAljw14I2NvclmXwuS9tf/kJHN
 fPbHMrdoIocT4ilTRRfeecuAmp0zo8jk+ik12zwF0QT1FgM1M3oR2RWN31
X-Received: by 2002:a05:6830:4488:b0:7d9:d2b6:1568 with SMTP id
 46e09a7af769-7e1df0d22d9mr6473160a34.17.1778197470543; 
 Thu, 07 May 2026 16:44:30 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 17/60] target/arm: Add isar_feature_aa64_f8cvt
Date: Thu,  7 May 2026 18:43:30 -0500
Message-ID: <20260507234413.643512-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4ba263b225..3758bd19c2 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1563,6 +1563,11 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
 }
 
+static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
-- 
2.43.0


