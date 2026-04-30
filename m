Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9561FCD13DE
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFB6-0000A5-9w; Wed, 29 Apr 2026 20:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAb-0008BX-38
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:27 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAY-0006d9-HS
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:19 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c70fb6aa323so81619a12.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508537; x=1778113337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucQgH8ucWGVHrkVPLqcR6+KfDeuLOnhjY6za/Y44N2Y=;
 b=vJTQAyh9DbM0WnwgW97AVgNVo6dLxY89/7o8YGuME0jrnW7RK587YY9tTq/P8Orvrf
 UVYhtMU0cMNEsJZeZ3SvdAAwAqRKLh2pDQroMXGTqmWnBUtOlrOZ1yyiu1HFKTiR+nIr
 m1rA67FoIMI/TKBWLvNb/8tbno03sB69v5VujKTwy9XQq4xRnLBiQ2tc49ZoJYc+6mat
 GK9hpQ9cj/mWbNiddo5qYs3ULutOmmT8KYv2jnz7aLMB/ZdkAuelY8WFXPBq6Kck68t9
 otHD/fjpjE4OgW+Mc2PFzYP3oeOWdspCK/CVXZVd+OopK0B+MwsjV2q+9C07UMb9QdrA
 3x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508537; x=1778113337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ucQgH8ucWGVHrkVPLqcR6+KfDeuLOnhjY6za/Y44N2Y=;
 b=g7JW+MrHoYZcWSxeHgP2xK9Ufx/xadpUml+bkhcube8Rgh/QMmC9oQJLcTwSlucTpP
 UmVrjjLDagOrl7DiZRTD1GNnDoo2tyCYmvORz/C/MBFqbTheoAfDDNkUzmLSluHA4RI3
 RV4P7sBzTNkTIaa9nc3t27ukx68ZoO58wDf6LuxtsL+xlP75IDIFeXmJEIQ5CW1XKL5O
 bOy0K+nEQEKiu/Qy6qrceuRK8TmXIhtooffT0JH8xbgHTF8vAVU77eDsRId51PeD22P3
 1MS1dH4LkyQCKp5b6S+/939ZBqmihMCRk4ihC90PNr3ZKZIXy61sEm5SukR5pGI64Zvd
 Lm8A==
X-Gm-Message-State: AOJu0Ywgt1USGmfzLL2P0L4EK6nNHV5wr1JIZ30W2+CP1u2zhG8qY/rs
 LZNqlrgCkB9OOdew454YgdogOhceguSXB16NmqZn+ZTG/7OT/vWMZVfR8fqPYGiKX1AZQG2fIKW
 KgRBjXGg=
X-Gm-Gg: AeBDieuoPJ/W6kFSF5XksO6XhGhyUyL2fmDeMe4W0rGQi0EWXh5qArQN9pPTZUAkdHm
 IT4r5mjpurgShyvuZnHjPo65aZyfeXKFqXkXGcu3e/I9FYtswfVKMsnHT7dt6NBv7GvQ2O5X838
 ZrQx3Bv5r0w+RDU72jcU8s3nZjilyqsLd4lXwvSslVORoUin3hXiVe5KUQVbRfd0cgrREouMB+j
 y2305NKPJ8nNbj5SaZKtg1L/bXSj5fM7cLYI+qnkMy1UfWtXDZWNgWbPY4TghlH7tLPCUXvkb9H
 S3gI3jL76HVMVWN9yBgWmxUTp7SSjwrSI09ej0q3FxtxjsLCE2CII8U2rRVszKXNFv9RG8qAB75
 YzW7xUKV/mKyYvNFSn7yCnkuS5Y34uwFLd0gNmqA1jBp6mkaiWZTjiznzGnF8poEgimGP//pISl
 RDHe/SPuqXCPSnifbyWmFtN6J+sNgbz41KBaySVY9e
X-Received: by 2002:a05:6a21:3284:b0:3a3:2b7e:a4ab with SMTP id
 adf61e73a8af0-3a3cf85b1aamr609886637.44.1777508537010; 
 Wed, 29 Apr 2026 17:22:17 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:22:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 39/47] target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
Date: Thu, 30 Apr 2026 10:20:38 +1000
Message-ID: <20260430002046.59739-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 target/arm/cpu-features.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 03fd860406..15e9821ce5 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -388,17 +388,28 @@ FIELD(ID_AA64ZFR0, F16MM, 48, 4)
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


