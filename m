Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DACCD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:24:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZB-0007Qw-Rd; Wed, 20 May 2026 14:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYm-0006tB-Na
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:24 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYk-0000Uo-FT
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-368f25ff4c4so2746118a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301341; x=1779906141; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgEwye1A/H/zER4vq4nD2iWWcMLX2i9wMfampUnYlVM=;
 b=oo6RFte0wdn5iVdGvdzksGp9vXbHzatLM424balUatPMIiTFRgZA/ew2yH+JWPaWWH
 NGOpifu+qtjbUQSK1PVLMijHu0/Kbfj+0rL5JzuV4uvvtM+XfgKT47NrzY8+3tcbF/bJ
 qv374ZSmN1XLL13GvnVk1S7Oql6s8eh4ZT4pQTleOAeYUJVjgqq5Vbgwqn5cNDLY/bbV
 yj6RMVq5zSrZktqNMyz0UVkCRVzW+CXdBWVHTKCZ1jNYrstlZjrngj/mFLHS0/T7hbi6
 E/ppYkYtY80XnEWwgwuQCLRwhaYhBSd+pu0KJymESXY2yR9SpE7x645iwC1w8B1xqeU+
 uDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301341; x=1779906141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RgEwye1A/H/zER4vq4nD2iWWcMLX2i9wMfampUnYlVM=;
 b=X6oCxA3r6uP/FiS7B4fkOneTb3Ip2bYrzzb1mKLkb0hxeUeIoz1iO50jaZbfPOh+wD
 Qn4tXyICEppE2Y68bIwCJKFimzWgSmg6N/7VclENtTA8whHTboVdlJJ5Zj3r42Tzd+gF
 0jDMg1z/Cvt4YzCJpclOY5PIhMgvuPTQUu6THlFZqvppFrfolx0txqpKllTY3EZzafXd
 GdDLDocVQ5fIXesSk/3zBEyNP4GLSBMVf7PHKjHSMcFgA5YhazuRWgxMkwpGAluAc2mY
 BrPM8Ys/+8R8jadbSeyNwsKFil5CyKxCsrpnFSGuQwmuelf/3bPiUnPnHrZpyriCHHGH
 9k/A==
X-Gm-Message-State: AOJu0YyCjmn/BRFkRbpgYfDQh4R9gQyslZnm1B2DDT2O94+7gy+tVYyQ
 ULWTJhTcmddOacglC7y7zTS3vKvmTMfC4ByGIgIrPpbhQtsVOjzWjiUJOH/GnBYZxi0jwKniOpI
 mMb2uIQU=
X-Gm-Gg: Acq92OH+0u07vVgETWNxxC4VepuxCIFQmuZqLhW6jigm+UnN8WFCgaoaCxPQsAwGpKg
 BhYF2GSNPf2OzszqEgYDjAsizdZgPcU5vPoALwaGCvBJnwyHizCxYR7dg5Cpyq8WnA5Ue42cc39
 S7hhXEsTzPLOvurq5N24bGXa1t0wqPItVaBBhN79497qap6Osp+UNUNIKmW2deM7cRwcZrhJdvE
 6JLuIXjv120jrDL5N/PjcJvGUy/yK5GcNJeHaEu/PteF/Xu/fDnGgkqEayWPMDtGUs6R+TrqVsP
 QaQmO80Q5X7uaCycIt3uXIEC/7z5WYhrg3/Y4pm2S0VASciPmjFVFfJX0GH8lyRjZf8rSkoILfW
 ys8YxQotIhZ6N1t8War1XdvjuNKIaxK/ksEMGe0P325+Avzd5vBJ7u7sM6kcO3uOTqgAg7cyfcm
 ui0iSrvSK+HErFz+hMssm62eN6RZMD
X-Received: by 2002:a17:90b:4a92:b0:368:a27f:9083 with SMTP id
 98e67ed59e1d1-369519c71e0mr21655080a91.7.1779301340891; 
 Wed, 20 May 2026 11:22:20 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 09/64] target/arm: Update SCTLR bits for FEAT_FPMR
Date: Wed, 20 May 2026 11:21:18 -0700
Message-ID: <20260520182213.872945-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 498af7db08..c114510446 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1485,6 +1485,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
 #define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
 #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
+#define SCTLR_EnFPM   (1ULL << 34) /* FEAT_FPMR */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
 #define SCTLR_ITFSB   (1ULL << 37) /* v8.5-MemTag */
-- 
2.43.0


