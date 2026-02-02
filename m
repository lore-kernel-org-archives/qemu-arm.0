Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC7BE7FDE0
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 22:27:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn2Le-00084b-MY; Mon, 02 Feb 2026 17:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2Ld-000847-Ao
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2Lb-0005gd-Ig
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so2671699f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 14:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770071081; x=1770675881; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81e/xdnyRjFZ8mxcbWyUm8xYnIAVgB5Q+4bR4erYypE=;
 b=QpDaWTZXBrPCcbBfvyBrrrmvZqUQCK/XFLay8MB9SBug+JAQDxsiQEmwSAL22f3Yz6
 jNNDK+xZCwB/QJuEl+NEmNtBOQJMV35xJuRtdJ6ag5dN0twxGKxBWHrRwwE5jUpS58nX
 TA3uWqMloAReIjEIt7A6dfbfGJHHb/Lpfp1dg34ulRD0I1lXKOanDBaKEq4zyc6yK7Hx
 QpcJdwlHTNd9XmYjLfc0lYGcDdbuvX0nbYulc12XRa1wgq05inbPQssVQ8f0XhqUO2NU
 qhvGf5HF809Rv0oHh1VEIJ10pgXOJGME4Xiq1hR/FDYllyaBNGQ8f+5mh87Gk/sfUZd8
 0zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770071081; x=1770675881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=81e/xdnyRjFZ8mxcbWyUm8xYnIAVgB5Q+4bR4erYypE=;
 b=kuOW18Jhyxnn642zIHrwM6/5hzrk9dEf+z9/qR8TP51isTmbv7SRqWpd7bPnb/qvnQ
 ptIaffBct8k3t/UOEqzyPsNG7/q+WunkdnZ2g8n5t/cBMpBlxxd14IT+6sQ3cMx7DhEI
 dJFGekwfOljFA+bIA29vz31NS3YJon/3m7M4Ux9yvr4MuWUnhfBtERhPGgG3UcX02mPK
 RxYtUT8x5rv+G9w3y3UQlYm3qfpi6yncc7Y+FMChhwWZCivtfsNFhvDQ6PT4PY3nXEU8
 oVQsht50pD3Vg3fYSfkOrmplHh/bShpzTgm493vQ8BW8BDtPsevBNmwwXCgUHPtQ/Yf4
 KNhA==
X-Gm-Message-State: AOJu0YzBrJpRkI2lu5jMUtrH23VAaMx9paSQuh1k86/9j8C37NZ42bLd
 8TtTPw94BtDZkFVz/6cBJaByP+p1HrGBx4Wt+zxFrFYSMq8sqI4rpHrvaiwhbZDkuno=
X-Gm-Gg: AZuq6aIdC6J5CyL849ziXYpyW3aTVIEpbeEYRe1e7tDn2PdI/xl1Cz3AqcQZE1eHOCm
 t6RXThvYbWxgewFiBoHH+4M37f6nYX09kvt7W6p5vl5M7NIEiPKAJLvS5RQENa6o33tzRUYGcP6
 LTZU4nTt1zcKEvkh3noI0nKM4qtsXp9/vGriSyYxEg7R8Bw+Gku4hn9WaU9K+U/RqisWnRzqwOB
 FvHSELpNgaDN/4+qGVuq7BqZlnivZqJYQvyUcWd8+AJVO5BFS2Dhfpn/gBTL2qiX69M2Vr35bgZ
 +RRPflKqWcDv7nVH7vw590f8r/Xh8rlc7wlx1OlASEkAmxK0ILJErR2HVeZV7+XAdyVv6nr/570
 uD1hRXkZLi47/+R3hfyMLhAkZo4uGKZzBYayu1PubxYN4+gRw7b4PgloGvoIviVH+rrvcBIbZl0
 7Kh3xPCZmyNfSPrsu3Rfx71YuGLocMsYvyrIt8o9Fe+YOfhtpSHCDfapzpgX9lSCg640PPn0A=
X-Received: by 2002:a05:6000:2401:b0:429:c14f:5f7d with SMTP id
 ffacd0b85a97d-435f3aaa9f6mr20982292f8f.29.1770071081533; 
 Mon, 02 Feb 2026 14:24:41 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce93sm45848864f8f.24.2026.02.02.14.24.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 14:24:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 4/7] target/arm: Have arm_sctlr_b() take a const @env argument
Date: Mon,  2 Feb 2026 23:24:09 +0100
Message-ID: <20260202222412.24923-5-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
References: <20260202222412.24923-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

arm_sctlr_b() only access @env read-only, make it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 40237168419..e146f7e6c41 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2385,7 +2385,7 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
     return (GET_IDREG(&cpu->isar, CLIDR) & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
 }
 
-static inline bool arm_sctlr_b(CPUARMState *env)
+static inline bool arm_sctlr_b(const CPUARMState *env)
 {
     return
         /* We need not implement SCTLR.ITD in user-mode emulation, so
-- 
2.52.0


