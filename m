Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2AACCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:19:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7JaI-0000PS-CN; Fri, 10 Oct 2025 16:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaG-0000P1-M9
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:24 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaE-0002lK-FN
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:24 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-781db5068b8so2114783b3a.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127559; x=1760732359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2Aq2R8qFy1Zs+Gw1UAVd5afKCONPV4nbObRXjTv5Ss=;
 b=gRqn3rivhPd5hUL74tPrLGCw8+fIH840AKsJIYuk9WsieHNh8LHraAQYOD5ebLQk9t
 q1M/X4ber72ULEMJELvBi51SXZjUMMojqiBnyUk2syTobcAUMzF5fSAG+TZwss1VoIT0
 JI8tDpVOUxBhrclBy8myKxoeUvVCzGzr2rFfU37puGDmwWhnXC8cksF3RbbMWQ4nASu7
 SxW0plIdSJ4XRVVGp79aYZVqsNs0HG/Bw6WuBx1wFcUwDhGdQiYNGfEj2/xpcG16utmD
 m6aprKpn7y0xbbxccP9bdp3nuEGl07X5utj0XXM+TcWupYBssKMpfhVFz7nxS+xLYFS5
 dwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127559; x=1760732359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q2Aq2R8qFy1Zs+Gw1UAVd5afKCONPV4nbObRXjTv5Ss=;
 b=K5GpvicfE74pjUp8IpIo64bR+I/vbZYxkbNhBhMLElYeFNNGvOZdTgZL3T8gDMm4qY
 UTmnGYBmt95q7JDpdpGQZYHD8Eb747oe2QMG27nGoGLZAEBo0hi2WYR5ZdWnCVYqH4Cp
 6KfrZ7fUhrzwdc7IBSst1AjUoxscZo7di1ERXtEKw/dupEQ77jJRRTMAeQp0E3jUTvLV
 hQScmyFFIUFN1xdUTn/ewnZSqlllzisHdx469KmPM/5eT4lQ0f1fn9H6TdygUiVTPCuR
 CE5MHyeaE7IXKD1wjjuwnqmMItxycUnbPXdudS4nlDpri2nLwVU9n5IqHMdCRw41M1y0
 Gj3A==
X-Gm-Message-State: AOJu0YxG2gUqV+crI1LduqsNX5UeFh/2GjeNRwJHrkt+a7qwL+4dWXie
 EsGUGG1/S/CQwDhc7Mo7pq2RbuDjIM21c2ml15iS9T6CnkZTVnnEmIp/WfBsGywvX4o=
X-Gm-Gg: ASbGnctGbuyT0JniKKC0M7Z1nxMt90YCMug9SLZ712bMxd/TzVcDgNsPausCbaJ1sCT
 duAa31BLbbR+oqpjXaN0ekZHj+3g8x7C0ZuevTpd0NI9olFIxoS+9VKkw0ed9eEqaMo3Xi/7Vow
 QiPklSKSMHr683PqawJ7gZLIZPHh2RnFlollh6dll+/I4S+8zMKZFrxknZXv+o4PMzG9fSClsaD
 MeWYkMHFnIY+zEpuft7cb4IjbxCr9XXglr3I+Or8bh09ph1tqIs13SUaZFEwpBQi7qOCPY1WNM1
 zcLW2/u0JGtFpsQHbklgjWgpOw3WlNtuJu5Rg8nwaoQeQODn3q+aa4YRLLiWRba2iWjQj6oJFNa
 N9mjSh4/9GGlv7ku2NogphR6Ba1eyrpItng3IYjpCjN6o4UUQgaBayUxoWrZ1Sw==
X-Google-Smtp-Source: AGHT+IEWJ14Ez9JxUDmpVkgTt1bMHyIiSMhw2gQeIlLSqcXq6e9s1YF7aTi6dTmqKk3GsZ9ZIkMp3Q==
X-Received: by 2002:a05:6a20:6a29:b0:2d6:9a15:1394 with SMTP id
 adf61e73a8af0-32da8130c95mr17450009637.18.1760127559561; 
 Fri, 10 Oct 2025 13:19:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/7] target/arm: Add isar feature test for FEAT_AIE
Date: Fri, 10 Oct 2025 13:19:11 -0700
Message-ID: <20251010201917.685716-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010201917.685716-1-richard.henderson@linaro.org>
References: <20251010201917.685716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
index 37f1eca3af..579fa8f8f4 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1364,6 +1364,11 @@ static inline bool isar_feature_aa64_s2pie(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, S2PIE) != 0;
 }
 
+static inline bool isar_feature_aa64_aie(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, AIE) != 0;
+}
+
 static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, MEC) != 0;
-- 
2.43.0


