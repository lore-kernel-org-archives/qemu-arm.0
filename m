Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C66F46C45
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVm-00038t-Pq; Mon, 06 Apr 2026 11:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVj-00035f-T0
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVi-000452-3m
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-356337f058aso2148511a91.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487905; x=1776092705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=kuNDAMVM91p6Zt9Um9Vo2t5htWbF/b9VefOu5hvwFc9RGmwWqrrVLOsNdOA04sq5Ry
 Uv4jM0Z08y2mB83+lt3xyGUSb8HqXb5G75SYHripdsesYUPm9dWJEhiTkM5ShHW7RV7o
 SyrVuLiKp0t6tfeuMUSHIzYWgTAc9NEP04cVvDuDEezXp4BTqcZSZ5rkcHVr3EH6Yzax
 DdC1P3vqkBJlm4rODF+pNL4wwUQ/iM5roP5CODB7n4kgoep3MBENNgdleQttHs7fl3mu
 ZZSjjndJhj/kYNTtU+78FmLw9VZEbEfVKXMLLL/oOhuK9Nch88W0JIkbHHLP0SamOOW7
 YMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487905; x=1776092705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=afiGBrsePT8iGGieke4QhBqymgmLwBteddmJ9Iw14p2wsOg4abcxnITMHhh4eYIF/n
 Ukp9NYb8Y8fqMFflYOiMbJyReYRA5jRq9AGwuO+jMW2Fme97armF7Y7jhXv/qVHSIPuJ
 +HPB/NUGtxcRxn5WRnRVNxmt0hoC9tBHvezHtT8XgU5CYfGNxaZImi6XlOJTBorjJHGl
 4NojP7ptJvVKINodjzSMbOT891VHlvfK8NuT8R2HdKTlOf9JlMeKKmx/Lxf+qkhjOMY0
 1/fj2Xl2QAUYliagNNob/I7O7YjQNbQmH1alO5NYJFzOyaKkhIy4UrtQ3KzvRF7yvncp
 yIwg==
X-Gm-Message-State: AOJu0YyQPVWe/+PX125r8sJDB0JxofqNQZ0QoIp6eONYlu37XJBbAgpc
 bQoG/HNOoOIZ6I5AtpcNYL9+FUiJrrWv9NDc8kb/XjMyLMwePtzkCmRX+1a9wFCO76U=
X-Gm-Gg: AeBDiev84y1mT7GUfL68MtkES2qYYpCEWmCZHtfJ1xscPrulM24ngEIoIIcs/cpXDkl
 P10Il01dSZ0Lk4pVmPEPNRR2zIMk0mYmR7cC2FA5m3Ic1DjmhKJXve6nHA9lWTf9ynO+WDloxy+
 qN1Npmg4enwxGV2Iaw5MYZoLJFMGyFU79edsU2rI5BC1XztA2h2fyaa8xQ2bSHnY7/KrI3uOd4F
 OcWVW/PR3LKF+mNrUw4so0N0+6Ie2jsmR71G0tSeVL2zdaBZ9f0dXR2r4Z4Xt4bnTwj7J1yg7TZ
 6iLeacWcz0tXhAxmlAivkwyd5bDqmG+ioEtggIFf9IdrROcBalwQbCcgS5ZX4Mz91gjnIwKsjGO
 sG5We+ILkw4EwhbJqcq8YDw60ZHHNyzO3fnbPp25K0v2EFLFHtbxFv6Ze4PTzvUx5TsJwrRUiuF
 qtZX//2JIj5+/qR6I8L3sqI/v3uHBhQgpXyY82HAcn0I+BkEvGp8q+D/UbzT7FUJeySBgwDzgHC
 17x
X-Received: by 2002:a17:903:4b0c:b0:2b2:5305:d492 with SMTP id
 d9443c01a7336-2b281783b69mr136552605ad.17.1775487904419; 
 Mon, 06 Apr 2026 08:05:04 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:05:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH v7 11/14] target/arm/tcg/translate.c: remove MO_TE usage
Date: Mon,  6 Apr 2026 08:04:31 -0700
Message-ID: <20260406150434.407201-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
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


