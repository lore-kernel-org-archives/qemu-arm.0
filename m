Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61422CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:09:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dG-0006eI-60; Tue, 26 Aug 2025 21:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4ch-0004sG-AM
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:47 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cT-0007KW-Dv
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:46 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-770530175b2so2642446b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256752; x=1756861552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JIkeU3rXeazXD0joqAFpWiHN3iI9fKZ4K7whY5dqlfg=;
 b=kctRrk+ngPr3gFJnMlBQrsMgrQXT+LG+JcHqqAdZD1uo7gd1EWs7fuyZyDEmh4pOho
 NBlIc2nYarTpN5TUL41WKcwya9zfkpH8Qv/8POKLljaWf+S88piWx8RRsZmCTpxhN8Nx
 QE4GWc+h4c2X81xiBRnHTkelVQ1gntn4oa131JpwbU3cze0MAiLWu93i/zTIte02KvcV
 AlsvMvk84zMT35ODHxIWjQmoPivyENW+G6lACZaDuJj9RG093B/PDO69yISadajoTkUS
 aUNpMNCGz+tNnVRHIH4R06Wj1lff8bwxggVYdRfSPincvq1NqRcBubKipzyGCxl/wgBK
 ljhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256752; x=1756861552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIkeU3rXeazXD0joqAFpWiHN3iI9fKZ4K7whY5dqlfg=;
 b=HFkQqPo6OA3q4DiawnqKaZfGL81YOcww7xfBHJVMGn/Waxzas50gCEwcxU1WKjVZ67
 6RRAI1bcqIJOh/ACf6ICW/3LntgAswJ5sPVM3Zp91bEamMgRadRB5ZSk+dnifOEtqIMA
 E6ooRzBo1J87fEAc8hH89ycZZN/YzaKYRowUP9FKh9RMxF526Lkv3Iqt2c4mwGXi5Ic4
 XYR3yP7g/lwMr0zEb4tCF9AJRhScnI0X2VU/RDaE7842SQXy4jeij6cKLZGhiKDrGbud
 dRSgkcj2FLuyCJb1rUcuU5XOegdLcgmCKW0mF3se/r0r4XoSQGYdct02P1UayMF6tkqN
 sxlg==
X-Gm-Message-State: AOJu0Yw5WTqdBQDr4Vxgt/yFFfYsO3lISa9O21CtmcSrT2mwligMY+4x
 +l971GS5z3+5H5kENp8QLRarSI+o/u+PXyOZw55AmF9bSHY3aHIw2FhW8tjER9peLqT4KDCYs0c
 uP1DaS7g=
X-Gm-Gg: ASbGncv/X4QKRjFxz6EcWoHB4S0bKF403Bjmw2L8XRJueMxpGjFUwibwDZZWqawEj2r
 ZA4zbPkEzQG3ZEoprlK4izXlNuJUIUWm3tGS4rvaR8k9btk3Ibv7YVIa6js+mGIgbMN9QPNyXPg
 0rJBfec6qsO/yZOLTLDRvFS7JgFoKcZp6faAHgG/h/x+CfUdY+riFBpf7SABqqX4tXDUdwHGXtu
 sqUPUkVZA2y+uB9+gRq0Lc3JW4NTtMw8a8RgUElX8FrwPDzkMnQyyMeMJDnaVCYbV+NPjmslxw7
 rKLTr8CWTmFk3hf2UEPde8pPgZ9cAOV/Tea3PnZxZQUqtu+HeZt5ayGrTAAMHlLeAouh4MDLO6q
 B+ExboLxhpVYEyoumv9rShTzJ0A==
X-Google-Smtp-Source: AGHT+IGq53fAtfQ9WKrngq87nWSvsvyjcpUdxHmpVrB7JN0jGslnRkl/4oLHs803/u1K4niu+LQT6w==
X-Received: by 2002:a05:6a00:a8e:b0:76c:1eae:fd30 with SMTP id
 d2e1a72fcca58-7702fa02d0fmr23844538b3a.12.1756256751598; 
 Tue, 26 Aug 2025 18:05:51 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 7/7] target/arm/hvf: Sort the cpreg_indexes array
Date: Wed, 27 Aug 2025 11:03:58 +1000
Message-ID: <20250827010453.4059782-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
 target/arm/hvf/hvf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 647eb675ef..88ed96be11 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -925,6 +925,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     arm_cpu->cpreg_array_len = sregs_cnt;
     arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
 
+    /* cpreg tuples must be in strictly ascending order */
+    qsort(arm_cpu->cpreg_indexes, sregs_cnt, sizeof(uint64_t), compare_u64);
+
     assert(write_cpustate_to_list(arm_cpu, false));
 
     /* Set CP_NO_RAW system registers on init */
-- 
2.43.0


