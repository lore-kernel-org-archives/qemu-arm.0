Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFC2CD5BAB
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:29:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlcz-0005MI-68; Wed, 20 May 2026 14:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc4-0003xH-Vl
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:49 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc3-0001zO-18
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:48 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ba6485d219so38280555ad.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301545; x=1779906345; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM35gHOjOqj4uCcYch+AkhQTaXi12XhXc0hhEraB8uM=;
 b=d1V8G92j/yFV4C4e6dZmPZYLoRNKePc8Tbp5KTm6KMUVVSYALVyTOt2cbubCrg1cco
 6Z/jk/SDSIa93x9l6TQf0XQ5oB4UUp6v1MXIDgCVn+r8i8S8rbMIucIcp5eONWFbrhjw
 HK5v8iea+GbtYLoQpt3rsx/7yV8XrAyMDlNiBTr2xmLi1BULfDE1IXMyst65L6HJLZ/m
 4WITgFmPxF9EU6c/ER14/Jzs2m27NjpVHSFW7j/D0V5LBPNyQI+DorNxnzDO6u3A7EPh
 MjViyN8R3u0mevarWAUo8K9LPcYhQ53JRaf9gi3ZioaThlDDEsPGhH8kTJXAm0lkSRbw
 nn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301545; x=1779906345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xM35gHOjOqj4uCcYch+AkhQTaXi12XhXc0hhEraB8uM=;
 b=grhLdkPdJWtUQ9k7aMeaSoq/UhtGy8shQyyyxIdVFzltVjA2BtRChjg1sH9/cAcqLf
 Y4PNym97PQpunjyXzRcaSDd8IE3ILXT+bNi3DmcaUoOGqGg5NZUXxhPoNDaASJDApjAK
 w8VtTQMmpb0sk1XH8IeRcw57yElXxOnDV8dMvdEfGKjzXj1015Cxke6JZk6iJxQ3FkV6
 Zwp4lcv3J8lLSeIeoEyMsS0U82/8kxd85911PNtcE0Oy4b7uzMzeE/bKcEx5ZrLedOm4
 +MxuUlASx7XqQzyd0Cd00sECYrcu2m4Vs6UbcKTujYU4e7eFhDcrunOpeF9ecOn0ZrE/
 Yk2Q==
X-Gm-Message-State: AOJu0Yw+YAzVyg32MXYWjbJ2GyIFeppGXReL+CqqsBcT4OJDvUm0iaNe
 fWILZa3pNmFd/ToaploR6dreq5IFGxUHPbhe/VtyD/j0CxlrqXmYKcx1m++Ss4ygBMRQYFS1D9v
 zyQ0Co2o=
X-Gm-Gg: Acq92OG4owhFOeaV4qnOBbftTVvaAOy4CG3VG0nvWcHnqpcVzct5VkImOpNTxA/wpBQ
 NPOuzFqjKU6EwCzFpEhNHell5BY6x02jAynRtBy6pYvNMi9Joxv1vVptDc7Z+UhdKoLOy4/UKaa
 uLpp2cXFSohvDz9LYEPlYDVq56G+2zEbzM5cIOkMnd4tUH+rbIPzHwrTDVAGDsA/5OJzs80/Lx1
 o5zf9cqL/xG+KtwclbeQbDJScx8Aw3UhFMOWI7zKMm+RwZh84IP+YuzvnC/H21bi98h6O+KFTXu
 TMhUjtHZ4vlyeK746x8+kfKPeCxG1Uu9U5HrIVm/qn42yAGdVwVkyx7w6AXCBGLirOqwCc5l1OJ
 AxwWXiYGsFg37vr032QDWwWOJCy/LFVJZwFNbMXghPwsibZ/bqF7MLZSZK7mXPuwpqpfhg1CYgE
 kVPCQcchfA41tooucpczadv/2XblsB
X-Received: by 2002:a17:903:46c6:b0:2bc:c089:ff10 with SMTP id
 d9443c01a7336-2bd7e9a55e9mr256548265ad.34.1779301545361; 
 Wed, 20 May 2026 11:25:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 42/64] target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
Date: Wed, 20 May 2026 11:21:51 -0700
Message-ID: <20260520182213.872945-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index 6d5994450f..811f2a7291 100644
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


