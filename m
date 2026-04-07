Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9622AFB5181
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:31:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAo-0007bn-FG; Mon, 06 Apr 2026 22:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAl-0007Yo-H0
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAh-0006zF-G9
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b2ae8a0103so1995345ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528886; x=1776133686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=VflEIBJ1/peda3v7MTr6U4GobQN+kVujohzBAV1/XMQqe3cylltZcIcC9cszin4fKg
 Y8kfTvpEyLAEjxJXqYlkpNZZpo0LUa8OPJ8BdtLxdikX7iuF3zgV4uEC2xu4VSNspeAp
 78gIMSUuAMBZkZAcDhghx+hk5li0/FXTHDvStRtmdwtM4ecBOQEg73N+XzZcUG5GbEwN
 Qk+AL2W512y/YxEBAIDyYz5022qyUsFBQNG8o85uGTMXXm7xpRAAjAUkeYf5hKGijHYg
 1ZStZsug/2I8V4/L5K+KayLU27FlxNr9bCZCEzyrU9B/uViJGt+i/QD76rmdQB0uBESc
 YbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528886; x=1776133686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=BVFOLjeq7rMkYfDpVpFCbPiRRmAYshJAIIExYQc3FOiLstaSv4AzTfFWdEgeRZnSTP
 nFFxDxUl+RGm4MjJYy5hrctrMRhy9M9qsQPPufudGzOY80FH3b4xxeg8bDnTZd+cLFNM
 doHpNedO8dZiuN3tj+0CrWeNWg32UfUq2U+EfSeSEKXmyqi70kW+wVN2zsQS0wCfbN3V
 gP0zp6qpQn7/Epxn1tCOGFj+sbCOegYvgoEUs49oo3mIla5lMlXgoSd2Nn8L3f4Lh+fX
 G6tm/taNXGITwhJBlSIj92Hn5aimzwjtedjkXZL9BybaFs2+lYpGJIxqr4c7nLy+JdNx
 LzCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxjwVFO3E3ESvx4MAY+uP76BI02VMkXEi3JvOo3v6Ma03idrdIwaRJTt8WmJkHLlj+uulsmf0I5A==@nongnu.org
X-Gm-Message-State: AOJu0YyRB/I+Gmic5cAuk8wh2wDzzCrIZ5RH6aBKGuMJHbo0Y/xJkLEc
 MPfSBFno9d52VJmUh/dqVjy4Snzumy4Gzi9WpwYJVDMQi49r6T4ddlfoE4nddRGaxQs=
X-Gm-Gg: AeBDietnEtzjpKiBpPqG0lbZoic9NlQq8YC/L7UZA0fBf9mxrfSwk5RE6xMKzbX+wvV
 4CIHojS0/CRVXDV4ydD0y4xU2uokvv/aZSOdG5W+5SantxmwSrDylRuFNYx18qNUK1vc3lbwH4A
 UNFQIs88UznuTzufhjV7ZgUnuf20gPPp2iNFMJFFvn0GetiKUj89p/sS979BppZH09hQVFm9rOz
 lRweDZ4iVw1mjA9g9HhPio8rKa7ZAC/PUVXvQCstpmOoqCQ2DwrypzxjzU5ipbjaDMfQ96dwl1Q
 WK4QVRMlk5A9s/IvL4Jj/9zp2NEs4WGJdRvNBRyp3ooKN3cGFUEX9WvOh5q1NAHw51NhpFyTVDG
 EZE3xtuK2fszBXSkbgZHFlle649F8beHLdYN8nJUTAF1TygcDe5/G/vCnNY7EHxx2diWGRyJw7z
 5+dbybEdyAaRMsssT5REM0zTs/cM3GbRShxNAMQZqtfd++7+fMprU4uWbxHFtolhUubH5O9w6sI
 rjs
X-Received: by 2002:a17:903:3508:b0:2b0:7a27:bb2b with SMTP id
 d9443c01a7336-2b28178ef7amr164946485ad.34.1775528885940; 
 Mon, 06 Apr 2026 19:28:05 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, qemu-stable@nongnu.org
Subject: [PATCH v9 11/20] target/arm/tcg/translate.c: remove MO_TE usage
Date: Mon,  6 Apr 2026 19:27:39 -0700
Message-ID: <20260407022748.57629-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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


