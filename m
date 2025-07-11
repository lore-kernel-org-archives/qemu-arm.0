Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290CBC83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 22:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaMb7-0001Cu-H3; Fri, 11 Jul 2025 18:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYu-0007ci-EQ
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:52 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYc-0008Od-25
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:32 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4079f80ff0fso2217617b6e.1
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 15:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752274162; x=1752878962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbpMjeNAOgpQVH9iBoeuKkwL+dC1QrhKT8NKphlDlP4=;
 b=VTjf1FQWCHgo+V2FxsALuWDkv+TyRaiyvFGB49aBvi+xifLP7E6gToh6knb8UZTigz
 x4X6LqXJKTjQpy+p5BrVJOMAW2beuIK7EC1VMOqPcGT1a+Dd3PgwJy8A5Ton5UfFGq7L
 TQct9xe2JICCMD2JSs2LlvarWSqlkpuhBPi6FfMkzOXYH/BoTK9y6H0QIqzSD6JJkJIu
 NMRz6D53X78U7wbTbcwsIo1ZzSxoKQ4gDx0Z/NqgIzeN4eVUnX2maIm5inC+CqaNaIPN
 bOA2MN9AIVD7r3+tJWjIFJ7liqbVllxXU9IjQR4BT5u24BZjc27wqOu1De1fgKr2VXHp
 Xotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752274162; x=1752878962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbpMjeNAOgpQVH9iBoeuKkwL+dC1QrhKT8NKphlDlP4=;
 b=wRmelqWJTAl6NgGFzjhE8d57GOQ64+/ZkbxSCyV8tI1IaebNjj2wtQhZOp0vZxOne2
 kHMu3zXp6WE71pjb/bpMNvNYFDBS8zJoBjNnwGZrK6B1A8K0NM6MwwnF1tY9AIzkr3ar
 iOejJDMBqd/EmBExT39Vhzp2lAewhsXfzx1nB2yQU16x6Gd8gNCLwYrwxIr/vgVQ00s2
 P0/EtviXwlYgP29TGf5jYLTTgM3+P7cbfw6T2Sod9BxGKNyNsYZEEm4DGsO90hXP+05R
 721oULyjSpwExoXejGQj+brCeUQQkNVsAZ4mQk/tijVjqnHMcFP7W3h2OBegGBUrzHlk
 gC7w==
X-Gm-Message-State: AOJu0YwBHGG5NyLiMKZU4NsuZ2N1q0tPYW8qt/1Ux2DBa+xAfdsDsY8N
 WjYe+XTWjG9qyAODi2iBiW9WDI5mWdnUtUZq1oOM2avXrvUxTpqb91jUC1xYTXFFsiU=
X-Gm-Gg: ASbGnctsoukIRI7mmhB2mA/v/wsiB8x/MoJLvhu/fq5Zd/BySynmnZURgawTztpLkou
 C9iTYx3kCzHUjh7V9vMFWG9ZGxtvtzMfX8ro/Wk8xagGtYs59CORuTfsD2+STZ85nJogeCcNxJH
 DAf76uSbREjdvw7OigMHGh2A2tST4bsxESWNy6+PFGMagcXaGcHxE02cMU64cUjl7VPVPZ8W2NW
 fjW29Wwmy4B8IwqGgg/kf02dvEeMkNxdtx3MieEWAYF8RgpGQM7o/o64SY5Ndoc6PiohrUwBRnA
 3YO5P56jvFQbKPZV8KJaOCoABT8NyStSv+oROaW/I1UByYDUDhEXf2/IpuoxCbtik/r0yyk0WjW
 iNIC08p5HsY1m4Grpphi+p910iS6+VqxE8zr1E3Z46lSf2EnyhrpmNbrUnM/qC6wqsempfAzxcZ
 F0qfG1YTdp
X-Google-Smtp-Source: AGHT+IHd/cShmp/DDpinxsJhjSfIokOny9YTjZKob2rm3OVi4pqd7xfB9nwXs1iaZCN0Aks+bo5Ivw==
X-Received: by 2002:a05:6808:1995:b0:407:9d24:af03 with SMTP id
 5614622812f47-4151f835e39mr3565860b6e.14.1752274162167; 
 Fri, 11 Jul 2025 15:49:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c6064sm696638b6e.20.2025.07.11.15.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:49:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 3/9] target/arm: Skip permission check from
 arm_cpu_get_phys_page_attrs_debug
Date: Fri, 11 Jul 2025 16:49:09 -0600
Message-ID: <20250711224915.62369-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711224915.62369-1-richard.henderson@linaro.org>
References: <20250711224915.62369-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

Do not require read permission when translating addresses
for debugging purposes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1b90e33f52..c7db93b95c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3646,7 +3646,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
-        .in_prot_check = PAGE_READ,
+        .in_prot_check = 0,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-- 
2.43.0


