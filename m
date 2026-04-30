Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AB9FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9T-0006N8-Ff; Wed, 29 Apr 2026 20:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9Q-0006Lc-PT
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9P-0006BP-0g
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82f0884bcfaso256959b3a.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508466; x=1778113266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/G6a8pFSVWZ7UbYRPC/FgRTYLt4qcDCTU3OgJbrV8A=;
 b=enrx8kAhVmRqf8pWcKAJYDl/cOTrNzGHS6xl0qMqmJ6uoRi7lUr1ldfYfVsxdlEDee
 NE90bkSQ19wjeNu33AmoiM3iH2VC2MJFvl3zsf5Sqe+GErowxuA2TNSglGByJ9ohFqAo
 7T9EtUasBpkc90FRKPgMXG1vQt4+oATeYNiwCn5/8c+QNZBUv2PzYUXj4+nvyjbKGVWP
 +tsTeRDhqQjocGECTzba16d8MUckvo4pMq8C7ThzLmFHFC6M6R06tH1uwp1PGnwFKdtn
 Vhni5GAFOLrhH85868ZgdciTeYNfMpP59cYtDrMoCqiu4/mOQ6rRWoik95dIvzynvaT6
 pACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508466; x=1778113266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2/G6a8pFSVWZ7UbYRPC/FgRTYLt4qcDCTU3OgJbrV8A=;
 b=GEXJilVw1/9HXkdY5X2EstMQGlJOohGkC7hKkt2E9F8i0s/Yumbq7dEk0E/rs+K7Ag
 eEsWAQZFEB6p705FNLfgEbo3w4M2TKub+xemZ3L+Pd3Z+/M2gvqQ6FSxPRWKlyJAuny9
 QRJJkcKaPxr40h1GkQesqisvVDVidr16K+Dxh4gWO4d17cjhTXn/g+F3IduFiJ9bu8yv
 smEbD9feyWkSg5cOODGlHPPZ4BnMiKhLt0rbYgZm39+vZzKFR4o69eQiXIz0TKOyB8lm
 WRjDA+Pazxcv4JX6qDRtblGCxXOHGD7U/ctVal0UoHIqs3D2az6sbSYSn/apJVyhHbpZ
 DT5w==
X-Gm-Message-State: AOJu0YyotR1VEyCDu+mbs/rPWpSyTkchMRcG9HVH8jqmrgeKVzxPyF04
 M9PtJmrVJrZa0/dDA/pCY2m3t+iIarWq4PeBd4mmMl6DnKckFUXJc5ItOPbxYIS7yj4=
X-Gm-Gg: AeBDiesSvUapthNGkH6TuaMxdThHSk857tx2wEQN4OM+IZeBV/XZ22BbwFlbqH6WVDv
 PBfFvzIGTD/5GfAZg1B2mFwtyN+gCWN3rHkvQ5GsUl66Y8UkRS/N5xMchhNE0MNEtw0T7H6J24o
 QlJmopktBDGdXPJbVAV5g1qEXqWbm0sPZZlyIBFk4YS6CfZHYZCKx3hG0AscL0BXNjrtfm+VzET
 uq9xnPsgEjEzeynYDXr6aCg6xdbe375M0br1sk9TWHkZOUTHcrHVdAKGrVSBZL/3TqOBWVPox02
 XVdUfKhPgXso2INrXayy273vgMvA+HEek2An/qMt8XAszmAmCMJR5L7qzRgAhSZSepP9puert5O
 2RIROrPLJ1fJgeYjtt19irQTA7vOac0xWf6HjwNgCkEIeEhtqyKon6jqlhR0s7BKCzR2sZVnPLC
 cmSUnLbh57G1l2G/Ltgj+JjCwi2tphSeBqmZhc3J7FuvSjYiUr43E=
X-Received: by 2002:a05:6a00:13a9:b0:834:e880:7a21 with SMTP id
 d2e1a72fcca58-834fdb4bc01mr887105b3a.18.1777508465629; 
 Wed, 29 Apr 2026 17:21:05 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 06/47] target/arm: Update SCR bits for Arm ARM M.a.a
Date: Thu, 30 Apr 2026 10:20:05 +1000
Message-ID: <20260430002046.59739-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
index be14a47c35..da1b7fde1d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1796,6 +1796,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
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


