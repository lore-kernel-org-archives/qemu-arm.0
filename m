Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7355FFF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:24:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9m-0006WS-NC; Wed, 29 Apr 2026 20:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9X-0006No-SN
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:18 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9V-0006GV-PO
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:15 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-82f8cebc935so157255b3a.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508472; x=1778113272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0cgKbjERVeOkuhp8HI+EMvkfqkw4Lr29AuXT6VGnEc=;
 b=QEz8GXYDdgp1IuaJwORM5NG/vMpjKZxYI31hros+zeerOdRYf7ApJPhxIFm6T8sNl+
 eAuyPOZifX0xGBba3DRqp/GyMQBRFwpMj3rhO4Cex+mIiJD+8gSkwCTv21z5V5rSXGT8
 crXmklM8tL+p/d5dbToRwslYXPE0vluGUJFJQ1e5NQNQiPo3HcZ3oeI6iowiiBb7mavs
 hynlYtk7B7FoKruBEkGnG0jyAjkk6yO106BtN+dJ+LhEzxCnd1ElciphbtL5zHCCk8uk
 OaxQdmVrxYFNxhKCcMgcStY7eVcgLUe4qOojLHT+Qm1exT3fx5pAdgJEXdOaX6qccI6E
 yZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508472; x=1778113272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e0cgKbjERVeOkuhp8HI+EMvkfqkw4Lr29AuXT6VGnEc=;
 b=RtD32kwZfn1zmBvHu/w/hSpKwCCN7UjHgbtber34PzNu5knOPA24D7UZ+xtuXZDBmm
 ToUIszNc8zroase+ktUNmUy9G8x0bPxYW7pjRi/Mg0BHa22bhLgGSGoIk2jqkzwxmUWS
 oggtOOp9vzibnCfp7Vm8IxK6xWaILqWs1PtX5h+uxZyFHRh+1s75kLiM8TiAodYKO9OU
 44DfVR/PtbJQRXxWgdhfwCA360lxmDY9JYHG2eoh+xJY9aIuvrzQbdS4swgj7eDJCtKN
 32cPcA9ge4mS9e0lvdajFRwwUCxPV/u9jJww1CGny03u7apaDMEP1+HmiRNropc8RlaQ
 DIjw==
X-Gm-Message-State: AOJu0YwcSocO4Tkfge6Th8tUUx32Z1wfIQB8jUThniSz20LCeJV4F6gm
 VsJhN4eiTAFv/DVd56tXTN8+n9V50uno+INPWfiyEGgEdsmAJrZOiU+mKJAa0r85kaA=
X-Gm-Gg: AeBDieueKRjSHkAGQFKn5ubjLu4z+2JB+6tMbzicOMrcpI0ln87mhZr9S1NNyF1bucU
 TPtQRhuhjtAzOErWhFFWxl8ggqshKMPdVoxtlfqElquEnTwCCncJdw/gRpjZCOQmbBX9tua8/2K
 pmIq9E8CPgGFiBXU/klkMUBa0tqBEVigo2sExNOp2KS868SuTaJWXtqr59bmbO1Y3PF4Vkq+ZdC
 CxYwew7keNAbEYk4HyVgDif3zQVAg0JCaEoWUrlOKXm51cw7BLMRjDLZCG1dBHgkjewwV0DXwcJ
 OdEJ/KTC7gvnjUs/FULrv/qF1YVblsTRQwZKPxXFlclB5uXw15qkHvpbKbjj4I/Tl+Fevzb/8ZW
 H/++tZ4nz1FsSp/TCWGbqx5r2Zy0hqWu2aj5YYUMff1OyJh3fyLGNLWlmDxp6bx+tibjAeVrmY2
 +NS9QoRbLRvENXDQ1ozI1xkQaZv5RcxqkS8JWU4Qq+
X-Received: by 2002:a05:6a00:1c85:b0:82f:74dc:5f48 with SMTP id
 d2e1a72fcca58-834fdb58909mr844546b3a.2.1777508472103; 
 Wed, 29 Apr 2026 17:21:12 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 09/47] target/arm: Update SCTLR bits for FEAT_FPMR
Date: Thu, 30 Apr 2026 10:20:08 +1000
Message-ID: <20260430002046.59739-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
index 1a55275e80..25cae59878 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1461,6 +1461,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
 #define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
 #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
+#define SCTLR_EnFPM   (1ULL << 34) /* FEAT_FPMR */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
 #define SCTLR_ITFSB   (1ULL << 37) /* v8.5-MemTag */
-- 
2.43.0


