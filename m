Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41155CD4F54
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrR-0000Ha-F2; Sat, 30 May 2026 19:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrQ-0000Ev-12
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrO-0007Yh-Dk
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36d98c9b596so94158a91.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182773; x=1780787573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JX7+OeeD2FN1dxWerp/I3Ll3/ZlzCTLqZCteUU7Y4Pk=;
 b=M13BaetuOc0OZLXHzV57TRPk/ebdq0lLAX9he1SnYft+88y0oN/q+4FKYVZpUGg/q0
 f5VewJJQCaqxHrLn+wT4/t4Hxk50fqoNHr3HpGcU6Q8IyidHsPKaLTWXZqo8m5eyDJFK
 FBK7DfhVAFnDgQmOMxSZ2VMv+plLPlYnaEfpa0UF/Q+ZxTIlrWPxz4W50SZXmb9J2tdx
 a6E0JIO9AUnx9Bb5wQD2NYyXbaOpo3XW+3P5fpzZv0z/OF9o7pPNpXEffsWi5JgjSgi+
 0E2KaI7tV0mMMMOCAYUlLy0cTyctZdCKhtL8IxuFY5dn39OY6bkTTfnwkaEYK29Z+R7h
 cMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182773; x=1780787573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JX7+OeeD2FN1dxWerp/I3Ll3/ZlzCTLqZCteUU7Y4Pk=;
 b=oCl3VfMO/6vuhV13idOwt2KyoMWwLYYbhNgZvIAu1YKJZ78ro0nE4BfyBBkOmTHnAl
 9RNCL+n2G2mf1Plhy353JSi7Cf2A61fojjszHvhpBI/3u3/WmM7rKEV9JhWWGkQa2XX8
 04iJ/h6iVCcxnZhGlU6LBD8gaq69qifQN5KgAeU0vJOSVCSwULh1f7WNhL6Z8k2x1VzQ
 M09DQDTjDCuGK8jpWAeaqqBXi6I3dN8WUIiPbYULQ9IWPmXendq+10UBpXuSPMR4bMJx
 gqGVR6DFhDRHG74RyB89nCnbI0QY8AB/3rkauOmEajdVVUyuepEcUKWcqE/HKs0N6DQY
 Cqvg==
X-Gm-Message-State: AOJu0Yw74lUK4JHMZ3NuVs6aQpw5jL1gsgXlQoNyivYRcbZ3l05Cj/hn
 Hy/X78OYa3H0XoAaWzKZisECnw7tiPiqKvS5jYEfeZ7NnsvhIGeIK0hUkWML7S68yN+Z+8N9b7D
 kJ6TS/Ac=
X-Gm-Gg: Acq92OHDljQISyEGEhoUdpN3cRmgTAkDvFSWN1mh3PyMkrTBdQxjYZ5WaWLuOc7MlVI
 TGHSKgxvBpQRQVOKDt1DlbFaxxdgUY36ZdCYTp+6fX8ZWrNHMc7lU3o5obkewbva188Ld1zx5HG
 P4F4kb7wxfxEYEvLtg0jiSEBO61d14NE2JItVzNpHeDdYx+64xxuKJ4irwWLOaFeKtUIrzchSUq
 PpOt7xpcbTEQHTHE8XJVbPuErHtQ16Kyo3biByRQBDpxZZtkHxpO6FItbSnxY18RPFfdK9GWCPk
 2TsqLycI83UnfiECNw7CbEBVpPHMCU5V/p6BFy1A8RseaULh/TH0KMf0owiJbBvEnSkXxxCPqjx
 mnPy0USPO+tkqcUWjJMTzk8yzaIhuDaGAPJDmkcnJZXIdaBfPXZ9+Z2dL1bmqsbW8Na2pW3Lstn
 QvYnJyuY8iJGpdpv/5UWO/d3yZIyoUy8003dyYbsJLm6vdYw+7Aw==
X-Received: by 2002:a17:90b:574e:b0:36d:633a:e8aa with SMTP id
 98e67ed59e1d1-36d633aec7amr3361391a91.13.1780182772958; 
 Sat, 30 May 2026 16:12:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 21/41] target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
Date: Sat, 30 May 2026 16:12:09 -0700
Message-ID: <20260530231229.400441-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b220ed3437..3a754f8d61 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -397,17 +397,28 @@ FIELD(ID_AA64ZFR0, F16MM, 48, 4)
 FIELD(ID_AA64ZFR0, F32MM, 52, 4)
 FIELD(ID_AA64ZFR0, F64MM, 56, 4)
 
+FIELD(ID_AA64SMFR0, SMOP4, 0, 1)
+FIELD(ID_AA64SMFR0, STMOP, 16, 1)
+FIELD(ID_AA64SMFR0, SFEXPA, 23, 1)
+FIELD(ID_AA64SMFR0, AES, 24, 1)
+FIELD(ID_AA64SMFR0, SBITPERM, 25, 1)
+FIELD(ID_AA64SMFR0, SF8DP2, 28, 1)
+FIELD(ID_AA64SMFR0, SF8DP4, 29, 1)
+FIELD(ID_AA64SMFR0, SF8FMA, 30, 1)
 FIELD(ID_AA64SMFR0, F32F32, 32, 1)
 FIELD(ID_AA64SMFR0, BI32I32, 33, 1)
 FIELD(ID_AA64SMFR0, B16F32, 34, 1)
 FIELD(ID_AA64SMFR0, F16F32, 35, 1)
 FIELD(ID_AA64SMFR0, I8I32, 36, 4)
+FIELD(ID_AA64SMFR0, F8F32, 40, 1)
+FIELD(ID_AA64SMFR0, F8F16, 41, 1)
 FIELD(ID_AA64SMFR0, F16F16, 42, 1)
 FIELD(ID_AA64SMFR0, B16B16, 43, 1)
 FIELD(ID_AA64SMFR0, I16I32, 44, 4)
 FIELD(ID_AA64SMFR0, F64F64, 48, 1)
 FIELD(ID_AA64SMFR0, I16I64, 52, 4)
 FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
+FIELD(ID_AA64SMFR0, LUTv2, 60, 1)
 FIELD(ID_AA64SMFR0, FA64, 63, 1)
 
 FIELD(ID_AA64FPFR0, F8E5M2, 0, 1)
-- 
2.43.0


