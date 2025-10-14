Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F456CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 19:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8l2c-0001bh-A1; Tue, 14 Oct 2025 15:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2W-0001a1-60
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:32 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2R-0003P6-Sv
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:31 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-782bfd0a977so4826450b3a.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471421; x=1761076221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGTdg/LZzblv6K2MzSpCOwRjS6tslAbCgjOSWDOaa5k=;
 b=yA5URG6Khrp2V4l6c0BA87kKsfbLwRdnhG8UMBwFi2NhruGUhR/tBp0n2zCZ9MPdNK
 HZM+DQS+ffjdNwbxJ+6QItbabHhpz1MvfRvtrF/CpVvjlB+gnRm+9bmsHlM0W4t+3PgN
 6g3odFrD0xdfuxa2lr1jenV3ZUmLj0V9u0gAUsnVa8yxDNUu1YjIcn/shSuJKsLhZue2
 2TQUXaMFiHPrXNjbF+otZeWt/oglbXh/i2Ph8eWixPOUtbFbVEMn+v1CpR6mLmgsXpM+
 C6qSiEGbar4XSq6zCJx5TsN38bswQEkfEoeHOv35k8D8xb+R1hthqQ8sGAXMMeARCxz8
 C9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471421; x=1761076221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGTdg/LZzblv6K2MzSpCOwRjS6tslAbCgjOSWDOaa5k=;
 b=TCdnsKFNJfdsM09+AFMxf1Xt1wqVl9+T/idC3QwzFXSfh0N/q/zWFPGxgNfkR7UPwF
 93Dhd3NC/Jj4IhyxmEdeHuyJ8Zv0WgKmYgkV/XXtrAL59i/Mb4ZiGOKYW2mYBLJWaBGI
 Fn+vEulG3px3pXCQkJ/S3Uv0BTdnno7g+7B2ap42ZA8l+fUQ3aq+buOuWL8tv23ohyal
 qme9dGQGHVyzFv5ciDfHWbMbOM3VC7d6EJND4IIoa0lP5hsu7BKzdur1KzQkQPSUjc94
 KNyf/pW2KAeRC+f20X0mtKJWtHtf4nuJaEoR446Ijj/y2LulITsrK5I9qBAWsmbe3j17
 t+NA==
X-Gm-Message-State: AOJu0YyGVOA++i+E+p1TNhJSPNV+YADG9/UVx83E6UOjKXegNtS+6sGT
 gAD8HvI2uxLfTwOl+D+5XSzRhSu8kWfoWKZUI2Np97TnqNZeM6Eh4kV+XWOUqFAuj1o=
X-Gm-Gg: ASbGncsikLfwIqsvhiWu2I2iXRhfLCIXvMr4lWQ3BDlZiOhkKnmkiKRVBz6PG8zTboi
 vgZbhI39viE+VJnD44Bpbhr/kbTaPTQ2zccPR4S2v/NY2+DyAcaW2f696NB6PrD/lc56IT1yQ4W
 +gbDbcSHhlcX7ICkLgmI5kqFvriV3j4O4OiJyXHnDncPC9fiqklHoEe0i02kjPwudHiD2FLO0Xy
 bKnERCMqDdAUpMBFbCqOjN1OznunBwAV7pVUTiE0DeSUrLQtSOJD3T3fB5UgTa55vvkpBpIpCdP
 jbjpb1pe9CVMt4JmmxbV2bhLct/iM9Wltfx4BAXjF3hamGqIVcxR4GI5DBsfWHHh4aMREJMtIQI
 4s0O6ovpzCsk0RE4Jbxd+D4DbR/+3Tz1etz+gFiQwiflbZSFcbY448OR3OtqtHQ==
X-Google-Smtp-Source: AGHT+IEiEvqMccmlfePAMgsCcVR72mKZ9Ooac0GY0sPl2ZlopqvQGzBVt+5elNFTVTF9YtCRNITNOQ==
X-Received: by 2002:a05:6a00:3e27:b0:781:2582:822a with SMTP id
 d2e1a72fcca58-79385ed2f30mr31473473b3a.8.1760471421102; 
 Tue, 14 Oct 2025 12:50:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63a03dsm15918727b3a.19.2025.10.14.12.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/7] target/arm: Add isar feature test for FEAT_AIE
Date: Tue, 14 Oct 2025 12:50:11 -0700
Message-ID: <20251014195017.421681-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014195017.421681-1-richard.henderson@linaro.org>
References: <20251014195017.421681-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


