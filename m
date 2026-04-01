Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1812107639C
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:21:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8188-0006jy-Bz; Wed, 01 Apr 2026 15:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w8184-0006dc-4H
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:28 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w8181-000332-4c
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:27 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-35d99bae2ebso47405a91.3
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071282; x=1775676082; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=t6uHQEEq4aNiIpE8kix+FSNa+AiHVDagscDydj3snHvwerPPk3T3k0+KzWnGZ9zhYI
 fRXJjVvFyVpCc/UFw/dJSK46QF1boj1k/6vFJQseLHKqtxnfdDoXvDikoLj+c4Z5K4wW
 dM20QRNrQOyZDX74Le0cw60017e6K8FXwRAMwVIKBpgyvtvr+ZkN8mb36xLdRUtu0tjF
 uXurBpuvv8z35Bp56WCKXWNeBMVKOrFyBn+E2R6pSx8WudGXfQ+u89WIZaFFKVQM9Mhp
 0zq/nty+rlgvMgSncCGkJW6MNHGuJjwcOBjxX0Q6+iq7TxzHVibEBzkbdZ5q/Oap4CXP
 Go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071282; x=1775676082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=PVy0suu6RGWR+rQ5a7IbCaIUSjfRSYyvwDR3avBUiycmb+t+nA3Bzx+p02err43hlR
 +tM+bc1/RyUD9xXwPV4upzR6z/QtXWB9vac2AQAtSeENq4QXF1m9hJegDlQXKgPENds2
 Pe5u/PRvrL3urArlO4EqvahKWh/aE0JzFySw4/A9jxzTf5V0VaDBKO8rwJVIQbw7YuPy
 vo/1GYh6q17hLbyoYykVhdT7OUXpBg3l9aY80A6RDUVNti8fMOs+tNl4vzu7pJfGT+YR
 FBNUTD7JK0tsRawIKz/IbkEySud6r3rxLJQ3WLu2S87F5BP2rVvQFF7ujgh3ukmZDl/3
 Od/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm67oPLNoaJIdZS09n/9cPJ3usMqLuEkKPUBgPpSKfpY68DygZgi1kwGee6Xu2Groz/vLmiLEibQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxo33W607kv0iPJXYxe3yrN2myCI884C4WQLMKA1HzIZtgicop/
 BvCU9ITWPXEGAM2lxgNgRrpO5t8oWvwwNehxlwvVFxzEMhQaH7yp9Z7AT4edP2RZcvc=
X-Gm-Gg: ATEYQzyQtCNvulQ2GVmK3IhbbANUCLbBWcA51vkPX2p9+yPB38U52hLS4RZYnbzf1Tn
 +TMQnwqEvrZLVnNKkhydHv0lbzHDTALA/6xF5m8ul3qxFg/aItF4eUoMl6LqNu8io22DQ+moaDA
 eQBZCTvYUxoeICupvZ3DwTHi6buGzHtKMD3XI60sP9iID0HKGkk773vD+JmMgIqjwaTz78Qn49/
 3GqEf3iWvpqT2hqiqPmWV7JAjVNsYbRc7wwAFHn00sca3rOmv/tWLKXT7ICe4xcN8r8w8qKjerX
 kFMM9EqynQqTP/YCmP9eefdpzM9cAmL+DiwdiCztnaqJo8fn56MbOQ6UEDngA+wuClP+RtXixIH
 YK2tNZMMcGDHKu0aTcPdWFC2sH36GXUIXPRZTqauSmCZMmDs30g9wn9eZ6xzYG3fZN2Tgskhje4
 8ChkBKFxI8Ld0NvOOQx+BK6Ee7qPHjA2M9wwCIjyzBn8pDE1ViVK+TiYkYHWFo2QT3h27uZ2aNG
 oa0
X-Received: by 2002:a17:90b:4a91:b0:35b:a170:f266 with SMTP id
 98e67ed59e1d1-35dd406afc5mr539092a91.13.1775071281889; 
 Wed, 01 Apr 2026 12:21:21 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH v6 11/12] target/arm/tcg/translate.c: remove MO_TE usage
Date: Wed,  1 Apr 2026 12:20:56 -0700
Message-ID: <20260401192057.1182724-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
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


