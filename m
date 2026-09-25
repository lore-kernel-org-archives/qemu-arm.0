Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759BFC9830E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:53:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADov-0008KW-TI; Fri, 25 Sep 2026 17:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoE-0007lp-MH
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:27 -0400
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo9-0007m2-Ca
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:21 -0400
Received: by mail-pz2-x0f.google.com with SMTP id
 d2e1a72fcca58-86b90133ae8so738047b3a.1
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373012; x=1790977812; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KidwwYkf1WwMwb3GYWA2PIDAyv2awOr01ocgLXZNEGU=;
 b=Dcc+jE4G6nOMk2eYPFmAuXJxjhQRsRhUgXXMakyX001Bg8UnTOnCvyfburkZRhtuMk
 rFoImd5pqo327wuzGjXHsXFpoTDomtw1MTci32NjNtT+RDGvrhjBHjc/grfe8Hc/ejyv
 2QZz5mO8hvjpkqr2hKVBsOdwKASQ95IOK3K2nRt1mCQQmO7ogirifNoF2LwvnJpw79DU
 5gEqdee77EpA5lH3bvtFgDILGYCR0y0kz3SCDFh2CsBEziGVGv5bkPBk9PzvcUPjNCwR
 P67FQ7yjUyOtzwBZy69wpMf9g4WPWZ8aCQag+OVrvzejGOfQsjopF5KADv54aVL6N278
 4ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373012; x=1790977812;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KidwwYkf1WwMwb3GYWA2PIDAyv2awOr01ocgLXZNEGU=;
 b=JC6TBHOdADzyQoOftXYZKfVFRBTqcNkFS4FJpTUWKqAGg0k83z2Gh0U5I0KK94xZ8I
 eDDlH2ZODbWY05OC+86S/kTLpK3fDZOxIfbGzGpB+klCQkkypoLOYb4Q7ui9K87ym/H/
 rEAcTZoFBXhjJoW/b0PBJNz2unVVTJ66sJjS2yOe+Y6pFMQ+aSgq3UD4rT8nRxa/Qvp4
 OuQDZ4hpgtsk9O0tXMZTXsRx+yCGdJ1UX4ycFI52pmLB1R6qSmhqi1H8CM37pERTahKr
 auyKlmAROCBKjZ0pUZIgs2B0TEUCHjlIDben09SFtx6C4GM5v+ZsU/soIF3K+Jcj56IB
 f5zw==
X-Gm-Message-State: AFuF++mJgErvoE/BpSQtE77lGNu8reVb6qlZsxFT8lhE9V0An3sLIV9n
 IMPlNwnoh1X1rz1/9qxmtNoboHti1r5k8D3Dml17QWN9Tey1CFJ5SgvV5WDRJU9WaOkjXPBOq6r
 Uet1O
X-Gm-Gg: AYBFou3oP0IP8BRH+3O/T/HQu6MiA8Cyj5YimnJY5DTW5kBMiH/IEG+jpFyRH35aKus
 fNl3J2GUbpilhf4mQjljGQzVuZDOk9FHmb1ft4JgCs4ao4JcGZXvq8130kOVZ9peQIw0sL7Lhoz
 21Xkdhoy/iIVWzgDE3HDm/39HENnsnHXvaOmWzkEbNXVErhVBOHVMsX+oM0JEcy2mbDHbIYB+9U
 y7eazv32GWhIYgiFXrU0EKDI07chelVFRH0gb41pZKnxFBXCFmW5nY9ojKa3/BfGyK1qQkBE8/b
 iz2+OG493nzJiub4zo2QypLvvpHTWvWsyqG0lBBhzvlDswLG267KjvfRVwvhV8g4JCNwYZhbI7V
 nHVdGEU28eHAr0p96lffPNaZui5cFKnDAfA5YhDqnFgd4Z3Ts8vKSBvbM/8VtFlXe3dBYrCXNPP
 lTKjoBa0AMBNaALQjBLwZ23Sq0q+CAMhBfMPQVBAUZWhWPIsSb/XKouCknTFlsszQ2NTBfSvoos
 FknAxtsgQdmNo0eZv1okpGQ4ERwYmNwYfbbpdOy
X-Received: by 2002:a05:6a00:6c88:b0:857:7384:b5f6 with SMTP id
 d2e1a72fcca58-87e9946e383mr5936783b3a.18.1790373012446; 
 Fri, 25 Sep 2026 14:50:12 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 07/14] target/arm: Drop U from most PSTATE bits
Date: Fri, 25 Sep 2026 14:49:57 -0700
Message-ID: <20260925215004.456336-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

PSTATE is already 64-bit, but many bits are defined
such that ~PSTATE_FOO accidentally clears the high bits.

Except for PSTATE_N, we can just drop the qualifier.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c50e91004d..d36611e04a5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1558,26 +1558,26 @@ void pmu_init(ARMCPU *cpu);
  * Only these are valid when in AArch64 mode; in
  * AArch32 mode SPSRs are basically CPSR-format.
  */
-#define PSTATE_SP (1U)
-#define PSTATE_M (0xFU)
-#define PSTATE_nRW (1U << 4)
-#define PSTATE_F (1U << 6)
-#define PSTATE_I (1U << 7)
-#define PSTATE_A (1U << 8)
-#define PSTATE_D (1U << 9)
-#define PSTATE_BTYPE (3U << 10)
-#define PSTATE_SSBS (1U << 12)
-#define PSTATE_ALLINT (1U << 13)
-#define PSTATE_IL (1U << 20)
-#define PSTATE_SS (1U << 21)
-#define PSTATE_PAN (1U << 22)
-#define PSTATE_UAO (1U << 23)
-#define PSTATE_DIT (1U << 24)
-#define PSTATE_TCO (1U << 25)
-#define PSTATE_V (1U << 28)
-#define PSTATE_C (1U << 29)
-#define PSTATE_Z (1U << 30)
-#define PSTATE_N (1U << 31)
+#define PSTATE_SP (1)
+#define PSTATE_M (0xF)
+#define PSTATE_nRW (1 << 4)
+#define PSTATE_F (1 << 6)
+#define PSTATE_I (1 << 7)
+#define PSTATE_A (1 << 8)
+#define PSTATE_D (1 << 9)
+#define PSTATE_BTYPE (3 << 10)
+#define PSTATE_SSBS (1 << 12)
+#define PSTATE_ALLINT (1 << 13)
+#define PSTATE_IL (1 << 20)
+#define PSTATE_SS (1 << 21)
+#define PSTATE_PAN (1 << 22)
+#define PSTATE_UAO (1 << 23)
+#define PSTATE_DIT (1 << 24)
+#define PSTATE_TCO (1 << 25)
+#define PSTATE_V (1 << 28)
+#define PSTATE_C (1 << 29)
+#define PSTATE_Z (1 << 30)
+#define PSTATE_N (1ULL << 31)
 #define PSTATE_EXLOCK (1ULL << 34)
 #define PSTATE_NZCV (PSTATE_N | PSTATE_Z | PSTATE_C | PSTATE_V)
 #define PSTATE_DAIF (PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F)
-- 
2.53.0


