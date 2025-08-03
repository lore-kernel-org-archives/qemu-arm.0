Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A49C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:40:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNiJ-0006pY-RV; Sat, 02 Aug 2025 21:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiH-0006mT-Tx
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:37 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiF-0004bY-Cu
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-71b71a8d561so19666707b3.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185234; x=1754790034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbRbPDY2xoRqId21bMDT0xVX8cUKze6JV5vAtkR4wEg=;
 b=lIu4ktoLzY1A3dpgzysRMo7Gv+2CPJC32JQYzM2SWoSLP//fBP/FV/YTVY55I45QGc
 S/i1Ll1oOQuCG/izhhNAOINiQNPRrNEvFdYCHP/YTwthB1ljf7zAN2ZG0IplFv7aiW9D
 0wAdhv0pqozwoh626izRq94FcTWpRCqPXtFnGDKBI1ndj/zBDmlJXp7au0rgQUR6PuKj
 Hko5BDxzCZvTYdJi5bGqNLwu1oK+E+JTrCxMXVxaz2JO//0uWzQnfbd+EaSTI3boADpL
 hxg0WJj6r/DuEAjZli8ugqBvm/1B8f1b0GGML7XxVEdGP+4F2uChvBtOmt+64idLyp35
 G0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185234; x=1754790034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbRbPDY2xoRqId21bMDT0xVX8cUKze6JV5vAtkR4wEg=;
 b=q14StsOlem8VVFpTTD4I94yJom8sSVIybXOURyLgLiHTBrb2cl2f/BeaLaZWr7I7jK
 C8xGvIR5i+wFSN7prWaWWNxc9sp2gmpE+c7shKuluDwgN6eQSvMFVmL588QQ8K8rZIaO
 MTQh8WHnfa6QLUMRc9QmG0R2yhiuMCJfTJyGR7ouarWEt5Nd+YwTv0vnQ9z8u5rj6xVP
 msZ9zmwed4tRSV0WXrQhcrAvUS3C5EKPIDOeEBBOiKeFtKzOHQVJD2j88GRFTi9+Ck1X
 W43UifsFZ1mSHqe0PApsCHS+LY12jIH5MuJs15l9lWQ8diaxIqvwHOkr/Fy/W4poEF3P
 6DQA==
X-Gm-Message-State: AOJu0YyHsrTDm+clCNlx6CsxiP5FxWe2/HKGv2Q3XcXEDUR5KqQqz+2L
 syKpT/m2tyKH4/ClCfkovTb8Ay8bSqVcAAoSk3xmhruzVYewu+px8CBZa2214QgPRTY=
X-Gm-Gg: ASbGncvOo1jjW0g5RENgG3W+4g/UOdlWXaddNmP/eH1zOfR9/4zxMjB5wPS1guQvA6I
 kf1n7YYuvE94sQ10yUK9KTskrwUXUhEj3oB8WA+QjGEMRdAoqz1mBrJuwT35KeFzYbuurVKMZIH
 Jbaaq+Ke1LZNLxN4zRq+0p1RzPGA9z+rLXVsv49kdNhOp82hFzM0asniEIYJGyEsRpezaOGmBfY
 5bk7XSavTQxJIXdrerbqblA1U4Dm1xLJogYNyqMdWHUa+CUDEgiyiftNNhYSIvyOhLR5s5TEms8
 RncjpZsr1w87cBXhCVzGTwYJUSvgQuhigE0z+wvYCgjW0Sf9AIfeQXY+5wMRrb6jbCdqza9++dW
 NRhuTqJ+KbjkVhraGMyrhCIGIQoPS2NnMC+bVziXNMiiksxiy0+a+
X-Google-Smtp-Source: AGHT+IEtSRn8NUbqRKE920EBw5ICwQKkp+/tuDUaqcl3spANNJHnAZzM0NEf5/jRgSPq4ZjsFWqifQ==
X-Received: by 2002:a05:690c:fd6:b0:71b:69b6:9438 with SMTP id
 00721157ae682-71b69b6a1a3mr112635847b3.0.1754185234082; 
 Sat, 02 Aug 2025 18:40:34 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:40:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/11] target/arm: Add feature predicate for FEAT_CSSC
Date: Sun,  3 Aug 2025 11:40:09 +1000
Message-ID: <20250803014019.416797-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1130.google.com
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
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5876162428..f12c5c8be7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -604,6 +604,11 @@ static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
 }
 
+static inline bool isar_feature_aa64_cssc(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) != 0;
+}
+
 static inline bool isar_feature_aa64_lut(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, LUT);
-- 
2.43.0


