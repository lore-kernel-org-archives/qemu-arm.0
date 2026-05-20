Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B64BCD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlYm-0006u9-VQ; Wed, 20 May 2026 14:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYk-0006mR-Kc
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYi-0000TU-9o
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:22 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-365eecc5885so4832040a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301339; x=1779906139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYsxgOkKZmN/D6H7dyuNYSLIwdX/Ih93Qf3lIcR+ofE=;
 b=fJySRgRJe4kQlc9AYh07WUhA/7JeaWX9cvlEoHMr3sag6pAeWqm+CZu75IdcUDkL1L
 MS2TzrhihdxXDJegjD6LqtsW8oReFjGIFRuKY4XsmWiyYTY5sV9tHyplNgxpy1myojIT
 7SxwITUSkr6WTAxFMTFiSJt3ABu5QCbmbm4sGeDSQTyFiY50iSrja0lLiiHnYC3iALqS
 hLu7qXgkg7PGgmCFMHr+hn85hZ5TrnxJpZQBfTZgAIUFykix/cjrLAJ1oZyzUPRtUDYT
 GTGX9OqfMY5naYxrUzt92bWZ021m1C2sd/uj94d8vOu/sd3+kwRtNAzCvAyRepCNO8Lt
 voeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301339; x=1779906139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HYsxgOkKZmN/D6H7dyuNYSLIwdX/Ih93Qf3lIcR+ofE=;
 b=d29Q9jNGh3Hu9bSq46kPdNvrki4Dt5dnsAn9b27JTsATlmht4gaBEXkP77oMyeefx6
 F5ASi9PFhVvtknr5bDTbUeeBTyEyBTPQGv2LTpsleD51GRohx3afRy7OXwtfnEdGlmer
 nx81aF6h3MzsBdgmWNpojOwhda/Q+z4PndQro5HIhbqatrzLu3ipurpAd0sm/qVwqoex
 rtS5NKglenVf/RJITkQVFF0v7S3IsNZRnZPKMsf2wp5bhsDhQ6I8rzncCxmo2PE8T1Nr
 L3sxL3Ckpocf6iw+a7pUH2d5u/CcBvtt1R4MRHwxhYZsLhL+YCBERFL21btHiKV02oek
 JhdQ==
X-Gm-Message-State: AOJu0YxOFK1zd1rJmebXcROGsa7klQmzLapQEgcB9jlVmrWW7IU3iNU7
 sWjcgJzAoDpwUnRvmF710fzqKZcwcPMjuEQN7/Tgtx90HdxligmPtLSTvVvso3N1N9o=
X-Gm-Gg: Acq92OG81PLf/ty7lZMVWw6NrZnNhFmoX4GPRHbLJ+859OujIdcPKHeN+0rKkmYlM0o
 /WpIyUJ8LKJx9JJ5+jHlmb5kX+9pv7f7dO13dTBfBtlNTz94RtGKwHvvRHFBebUlnhZ/d1BMtu5
 uGS7aC8QIS8k9WkIQz/6XV1Wm4Q1K0ReVPQ7l7lkbb/FaImowBnJ2iRrsrVw2lGjeTg75wvBmkg
 RMrfR19vMI7RnjlbuhfBjfPYQ97aayFg68Jd9bkCI07OCLb5vx1/Yc9sC/bDbAXvWreqBQiuw5c
 zjZqk9u7ddyAUW3TkjAeKgitORMVPasBKAtl5vaMraCGFPFNSF+YfcIucK0EFbecMxdLrTggloR
 4I0JvXxcKWb6YnlVtzry3aYbnvXqze0WuD5zNOtZIBFjlq86wU6qlVy/QVvxfkvk50sOkU676vc
 AfwXUbxbCLqCJJWZEB8bJS0okaszkY
X-Received: by 2002:a17:90b:4c50:b0:369:d7c6:450a with SMTP id
 98e67ed59e1d1-369d7c64a4bmr12739749a91.0.1779301338786; 
 Wed, 20 May 2026 11:22:18 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 06/64] target/arm: Update SCR bits for Arm ARM M.a.a
Date: Wed, 20 May 2026 11:21:15 -0700
Message-ID: <20260520182213.872945-7-richard.henderson@linaro.org>
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
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15a13b9292..0a11dd9002 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1820,6 +1820,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_AIEN              (1ULL << 46)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
+#define SCR_ENFPM             (1ULL << 50)
+#define SCR_TMEA              (1ULL << 51)
+#define SCR_TWERR             (1ULL << 52)
+#define SCR_PFAREN            (1ULL << 53)
+#define SCR_SRMASKEN          (1ULL << 54)
+#define SCR_ENIDCP128         (1ULL << 55)
+#define SCR_DSE               (1ULL << 57)
+#define SCR_ENDSE             (1ULL << 58)
+#define SCR_FGTEN2            (1ULL << 59)
+#define SCR_HDBSSEN           (1ULL << 60)
+#define SCR_HACEBSEN          (1ULL << 61)
 #define SCR_NSE               (1ULL << 62)
 
 /* GCSCR_ELx fields */
-- 
2.43.0


