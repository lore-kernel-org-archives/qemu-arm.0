Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D80BF46C70
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:28:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oem-0007UK-91; Mon, 06 Apr 2026 14:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeg-0007PG-Fd
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:36 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oee-0002Oj-CK
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:33 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so3630099a91.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499990; x=1776104790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=EObqqvDcn3+vImdSSIATVIbdYqBSUOWmeo165uCxFpdM0RrzsBzG1o1os2/ArkB3ns
 WFjwUPLGlKVs6GwYJuKtK5m4QwLdwoIEyw7EeyZdieKLlzoj1xej/yb/Tg7uGJkX7Gkx
 RUd+I7hA+e11JPJ6ZnlEHwzyuskEv0/96nAKpBvZ0xasbyahCUrV/kfMMAwjbO+G7pG+
 4F3GmhKeBRyZNNp+IJxlhQtQ8qFTbp+Q47gxz34mewOQHDCQpc8VZgxWGQ9hqh57I9g5
 69T3wcWlk9vmZTo+d4cBGQlphOXfc4X1Pt6cfT8FX93RrxiQAUdFeaAJKsS3AO5Y0M8h
 Uo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499990; x=1776104790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=Tur8xYPvJq47gVHYR2eJ/EcJlQLZ3pAWbJImujD++BOG4vV05NikpzHkuGM24XnlL1
 0LdnvHU6cY6Elf/rAyLlFMaxkSrtY29lWWoT50Dn3VSMOaxxINAwdMAYIuGSX9qLkDYW
 gb6vNoM5lIlNG5QPwOi3UtwPxT/wQpsNUNMCgskRP6lJWXAIiyU3lEWcbggwHBBiR7Bg
 LTqA1tWL/UAYvyN9yEiQ2vLuaU8zbZIMmYiYKRe1dT3C6Nd+0BcpqWmd7ah5CORru4BZ
 EfmgAI61ExEGlOM73ujd2PzfdolEj9YIxFNU00t4OcQRzNXlOjDJ7Ax1qerKjhYSjK2L
 UANA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Inat8J/U09/Wd1rJnsk3ecv8pbsIjZdt8zyiytb1+WeFjBJa9CzaOSXb3oFGn8dpoyTj67V6jg==@nongnu.org
X-Gm-Message-State: AOJu0YyM6JVWaHRefmDWsFwgP4o//ODq1Az0auCDmJkmIaotmpBfJDXV
 5m8UHP7TTMoQqDBTew+wabAyU0u3+CirTX3uyFgfugwHKVJjTKqH4r2Hsb2ZChcLKLLab4ot0uO
 9dUyFibPH8A==
X-Gm-Gg: AeBDieuh3wDTgBNRH4BdrTRB10SLXHHNXxUy4aFWEBlTEYaxSlSeePsxdblIiMmfAL+
 aw6BHwBTFxuTA0mAKEJUZUE0khB90V3Sj8MBhPr2qN7qb4mIF7tW1vIySAgFQ3DiQSb0dxzE4Y+
 vyMMoKT8OCFIRNNE1Wywcpjrep0GDa+EJzEJ3IudL3ehQjOVxkMLB8Y+LjaYFE+7FFgYcb0HBQZ
 /6KK9YMYxGOdfKgXT4M5rHWEpQFrplguD9Z1xgPztl2MSGOT9LQR/Pr29cjMa3HwED4ztp4p9B5
 22POpgXoi6OxZOJ6vpDW1ll6hvZpKuGinYmQurwg66kR8U7VjPU5k2vFxAkn93+3eNPcoxNtnwc
 p5JgeKsDMTuigMgVxZsj7EeJr+OJquanhnqUPU8FzNUNz6NVkG+L1os1fN0IkWHpzb01QIA/blD
 rWmsGOFo6nkHL8N0k3VCu2DkTGodTzQq0iEZ7dW9fBeoEiAYTNXrQ26HOeVKHb8ZmZf3uA6CDde
 i4h
X-Received: by 2002:a17:90b:224e:b0:35b:e56e:a17e with SMTP id
 98e67ed59e1d1-35de68cf52fmr13822521a91.17.1775499989782; 
 Mon, 06 Apr 2026 11:26:29 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-stable@nongnu.org
Subject: [PATCH v8 11/20] target/arm/tcg/translate.c: remove MO_TE usage
Date: Mon,  6 Apr 2026 11:26:00 -0700
Message-ID: <20260406182609.193886-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1033.google.com
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

dc->be_data is already set just above in the same function:
```
    dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
```

Cc: qemu-stable@nongnu.org
Fixes: a729a46b05a ("target/arm: Add wrapper macros for accessing tbflags")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 56ef1e0eb59..4546bbeeeff 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6344,7 +6344,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-        dc->be_data = MO_TE;
         dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
         dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
         dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
-- 
2.47.3


