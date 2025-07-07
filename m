Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A8C8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 20:58:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsun-0003VM-Lq; Mon, 07 Jul 2025 16:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLD-0005K7-8g
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:33 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLB-0004J3-Ij
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:30 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4a7f46f9bb6so44465291cf.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919688; x=1752524488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1deyp58YXRZuCAMqJMg6ysDvX/JkTOChz9F9ihpe1E=;
 b=vlSwKHKdg8E4snCmP8KUI5m0DkfUqheH3tZXRxxN7K1/kP8bgYvu2lKqW9zZFNR9+R
 sYSXG0Tb2YEq95Hj0ydF5zKGGXGfhAZlFJOowBVGs93qryBPwWRX7+XEpRreJosJyzFh
 8OtF6bttZskMCRVfKfHmExvTmAqSZEgKyrCL7i6/0aHI247kdOt1YLiN+9CwKbhqn64v
 rjPoOXCijdEC0vT9M/abImBxhuJ4YJkvESErGZ8rP0eRAsRrWFYYB94BdAoQor9HcUt7
 fn976Ce2/v+9CRTcIg3/7wItBzco3mAk8RQR0E2QKB3K/tA+X6CL4TlgQXq93WO9RSHt
 DY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919688; x=1752524488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1deyp58YXRZuCAMqJMg6ysDvX/JkTOChz9F9ihpe1E=;
 b=YDzAzvKNnUhzE+JHLZA/sEmEUHCEFI/B+weFpNyh8Thp69Zz5tTvHtGqbPt+21QZHU
 wJ2YWfnYezylwbiWUmck0ZCpMuYjwkyJbJ+R7TrrOir5jywXKrOXjPoVoPnlAfZTZgWo
 xTyGUVZLV5AYaWJjUNmrFoLEM/vFT0wxEjfbGEkp7WGac4CSTox6QXVqs72eXZavhyrJ
 zcvl+Vfm5okoBLOccGkQKZY8uCZ1L1b2/3FVd9ZxBbeWel7C/AWhKdZW7OF+q5nIrLbM
 gzFwtYgG70gnHWA7zSFsnxW5onsmJ25nMmSseNxbTkaHDEsIL4QZZ/htja1qMWBaywsB
 ZDng==
X-Gm-Message-State: AOJu0YzEPQ9z+lMCuQAMtXJqa1RkX5axIK7Qa/41IVFToHcFo0OTOz9f
 uMR9BAMHUZKzQ25fdJEdVqsUyA4ed70TE2d+YLgga5Xrb8ahhtLWovdKV6W64DnXO/Sa+ZknxDt
 HEWpA9lw=
X-Gm-Gg: ASbGncu96DRZt00Yp1mMzXjn60i1FXY79Ah83gs9kJUd5DcVqq8paCnQkteSC05lIiJ
 AwpwqTWiB2WdpPhnsZ/0io9SW8yLlJZj5bUn1WSP4jcLIC7WRuRf79LzrYLW/kZo+vxjM1KkoQb
 Np+p8BFQvS/wWF8vvQ1jbyQIGXKSllRzfgBKYfzdqcWRpGQrfmZLDSvxJ0whIvBd5GcGj//pRNa
 sJY7KI1M7EqJNx5q9jmUcNYFDpnhf7pCiY1pyr/cBcssktowHTcyBb87315mf1JU9f6Dr9XYuN+
 RBasDxf+6wHDBX99t532t6rMyOsDPA17KOJ9cUYidm16R+P4Gs6TH3wZLAFUCOXsGOkoJYZuYr4
 pHn8Us6bM8p/WDors
X-Google-Smtp-Source: AGHT+IEaun/h1LCpUEneML7kuCxHjkR2cw6FFRicD2gM25663YyS52l8Fi2rMViX02q3ihGZzdsOQw==
X-Received: by 2002:a05:622a:1a04:b0:4a9:b087:4075 with SMTP id
 d75a77b69052e-4a9b087423fmr118141091cf.2.1751919687989; 
 Mon, 07 Jul 2025 13:21:27 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/20] target/arm: Convert v8m_is_sau_exempt to access_perm
Date: Mon,  7 Jul 2025 14:20:58 -0600
Message-ID: <20250707202111.293787-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a11df31b18..78a9c21fab 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2754,14 +2754,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
-                              uint32_t address, MMUAccessType access_type)
+                              uint32_t address, unsigned access_perm)
 {
     /*
      * The architecture specifies that certain address ranges are
      * exempt from v8M SAU/IDAU checks.
      */
     return
-        (access_type == MMU_INST_FETCH && m_is_system_region(env, address)) ||
+        ((access_perm & PAGE_EXEC) && m_is_system_region(env, address)) ||
         (address >= 0xe0000000 && address <= 0xe0002fff) ||
         (address >= 0xe000e000 && address <= 0xe000efff) ||
         (address >= 0xe002e000 && address <= 0xe002efff) ||
@@ -2798,7 +2798,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
         return;
     }
 
-    if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
+    if (idau_exempt || v8m_is_sau_exempt(env, address, 1 << access_type)) {
         sattrs->ns = !is_secure;
         return;
     }
-- 
2.43.0


