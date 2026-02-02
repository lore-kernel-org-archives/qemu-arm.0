Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB0E7FDE0
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 22:25:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn2LL-0007xi-Rm; Mon, 02 Feb 2026 17:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LK-0007wa-2r
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LH-0005dv-IC
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so4432943f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 14:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770071061; x=1770675861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPFR6g8HavYKktYDjPEU2UNFbYpGAVNrutPVXVv/Yzs=;
 b=b1iIW8FKaXmoKfWAl0N7c69Du4vQJJlj0iGiCThsJitG/OcN4if6VDl8/5P/uAsXcv
 9hTm5vzHKEhuvwsFbvzZcu8ejzAWtg8X5C1paxy6J9OsmKaIhaSZ7MFsYLOJqKUTOPtj
 WIliBnjtxyr1sJrMbtNEtv7WvCYKIt1TAEyEf6xH6O+T9wgApa7TTajl369EiOGc1Atf
 3IVkgHjBQMDBUu2sicJVCRqGn5FRKeDraE5PIyRMTOX3PhQgdLsr3fG1Q5u0nUWs7fxP
 3WaIW5iCyLBWFh2V8KPYRPQizhLIvnzeiGujPCDQzEuVrFCWg6PjceRMueIdeQRI2vfx
 hNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770071061; x=1770675861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bPFR6g8HavYKktYDjPEU2UNFbYpGAVNrutPVXVv/Yzs=;
 b=MArTLtriMrRgiFBYyBdjlwxfbsUSqmNdvZIJDebEB27OCNMEw142/TeYFp9KASaVnj
 YUfWMQazKjjiWZAZrsT0Z2IOZ2oz0IGZKC7dLf2nrd6Xk3V2A611rrR4KPavHvSEsJbj
 Nt2ZTLbr0Z/YCbtWXmHNXEcmqHW0y0tQCRRe1ThL7/yv/zqbiwHubIqGcuiV1ICfVPUb
 rNRRH+FDYW0BIu0GVN9JdwHpypMWac4UN3jNKdIJDzvojNXs/9iQLNZN/cWU3woO2Us0
 /86owjOxd8Q0DcutiO7X1GCYJdYDRbIgCUF3LhK/qdx0r62yO55/5ir9I6udV3zQf0FU
 mFlw==
X-Gm-Message-State: AOJu0YwE8qRK48/aJPOFc5tiLycg2DCRcuU+NH77Jlp7Rlw0pfd9M7PE
 9p0FzoOlX9oBcq678x5Ch/joVcYFxiVvsehojTQRKqUwuec46vVFInQ35BLiK39FNfc=
X-Gm-Gg: AZuq6aLdUiVM8eofjUVszG/FR4JHn2vADmpOTpM6CFJM9KYw/CAVPkqoNgvgjGNxnjy
 6isZ3KgdghvAkdDHXb8juExmbIawx6gtF4ap8B5FUDqvV8KQf3Q3CIXOTNnrtjduQIPxF7OjREY
 /M5eSSozQeyH5tbqTz89aRnbwDNIoYR1qFKTEkgpgIzhsPg+Bqlr+19k28s6jXyZhaJRtB6Dc7U
 a/OXE91N42+axnoYjVJOjLqH3q75ieSGFCUy+Td2eGlJ62fbe2DmyVdsfKiF1VS5TzFbS57fyxh
 gHS+XgSaveJfZPeD1/ApLHBBOaM34u+buWENcyYqOjgEedlYUEhqgRsTPL765kOqVOty+8ytlA0
 2BCJkuXjxSinHlBi7PW44bWDRRyZwj/vnMg7mSP2DbwavdHjA5Tdsnngmq1/+SElCGohfKzeAOi
 3+M1dePqLMrObuC+jQkc9RwroEOPYSz5axhzsPK/qT6L+PGdkUmi3vgnJJ7DfN
X-Received: by 2002:a05:6000:2001:b0:435:97ab:1299 with SMTP id
 ffacd0b85a97d-435f3abc8f3mr20340954f8f.51.1770071061146; 
 Mon, 02 Feb 2026 14:24:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e474csm45795473f8f.2.2026.02.02.14.24.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 14:24:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/7] target/arm: Have arm_feature() take a const @env argument
Date: Mon,  2 Feb 2026 23:24:06 +0100
Message-ID: <20260202222412.24923-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
References: <20260202222412.24923-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

arm_feature() only access @env read-only, make it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 21fee5e840b..d4a146b4202 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2140,7 +2140,7 @@ enum arm_features {
     ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
 };
 
-static inline int arm_feature(CPUARMState *env, int feature)
+static inline int arm_feature(const CPUARMState *env, int feature)
 {
     return (env->features & (1ULL << feature)) != 0;
 }
-- 
2.52.0


