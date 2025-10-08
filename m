Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02121CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:09:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cCx-0000oo-It; Wed, 08 Oct 2025 18:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCj-0000Nl-Lx
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:13 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCP-0007OJ-JF
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:13 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-78115430134so215768b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960791; x=1760565591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtTcosX1PI6oFmrETJfm7j20wRw4ZF0RoKREZSs+mx8=;
 b=tFpazfECAC3WZwU/kkGyFlPTqEVh0kBhmWbhcTuKHNq9enavoTiHXsEA6MN5OddoFJ
 gSm+JgOC1UVVLLfJKUv38PJhwo2UaOZ0JUz0jWyBcWc0CeGr1MvnsrD1/EgX1w6dlcI+
 yFnvOZDGLXVW4m81lDiQtj2/y9UbtbXFaaM7sFYGcuHzHL0zUlcteJysWn6qRcsc0EUB
 W29lmR1G5rqtXHgOqmgATREg2N3dftXVnTF++IMn7DqqakqyEvOQ7lvojo6aOXnGKmNI
 6DiJquYPHG2BmXOakv2avgfZYOPRtfKTJwiLdbk9NJpNCWgLcFnNXt6EDjJ/0PQJlNQt
 jl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960791; x=1760565591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gtTcosX1PI6oFmrETJfm7j20wRw4ZF0RoKREZSs+mx8=;
 b=maD4C6Vqdk3GV1rk9pDLGnJmsndydnPab1giOmwlzYP04bED8A+XpHKYb3M4BiHHYT
 3oIZbesEjBAEIgPA7d2h3tDWLHBX1gcXZ/0o22VYYf9LdPBJyjDEmHsyrnPffmmF5ycg
 j8bRFC14TY4Y6wPGtHiXAFbeh7BlFxGVOPjOn9eOjGJGMayD4cmEnnE02qYippwGAxtN
 i0f7+qLfx9g3wSWmOB7p6qlI+f/epbyyAssEH371hMbxJ2OAu1gn/LJuEWj561x/7hbW
 pj6oUjVJLAV2sg2VbFi/iS6rzMya4PtG4UDCsjOqFUoW7x8UNzdemq8PGPkyt8CZypEs
 fE1Q==
X-Gm-Message-State: AOJu0YxmWefU0VGSvPiaJvKw3os5uCZgZI/0TMV4VZ/DtULhdG5ZLzJV
 1RrzNfMtW3DVKEp/kUGljCaNwbKRB2UbJMtLP/Z16f/1TeOAOv5h8Xs8NZ4/Bp9PAf8=
X-Gm-Gg: ASbGncu3NO+UlN5fepiBff0arxFiIpq+z9tDSU5RhcHdwUJuzM2crX6STml+/YJinKS
 K9zdSUk7O/d6c/dVZQVgzuHvVd9bq0SR52WtzqMJf3ptUFfqfQIlo8kJVMHEvAN0EfrTHlP3v5S
 TerqwTgM9D69v1Io7TI3GFMh6bXVN+qpFk/Jnt6xLa5FfbNX1D46YJUyIzBQiZCxAIeh7Lxu7oj
 2g53EZqhnamBW9hnbkSmrhE6AIhI8NBwvFFxdG4XWC+YtZvVuUKaK87qg4oxgKwVhuPwcLJMzvK
 mj8mq+cq506+Ckd6wBmZ+QXk+81cH+Dc/g8L+VGhRqjkau0ZeXGABTgWfnNWWYuuQ9PZz0rQINj
 4ZeAN0XhQzLtwQ5BNEt7nBxJGXE81mtJaZF6mQUNy22r9MLufXnPz+3xM
X-Google-Smtp-Source: AGHT+IEI4zw2x5A3P/GyHqWIBLtD6hN8Kl0LWetIEPTE0Yk9AndjnbS+VKUqsZvXaRGr7MLdpdIQ5g==
X-Received: by 2002:a05:6a00:9a4:b0:77f:efd:829b with SMTP id
 d2e1a72fcca58-7938783414emr5393857b3a.22.1759960790627; 
 Wed, 08 Oct 2025 14:59:50 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 55/73] target/arm: Add gcs record for BL
Date: Wed,  8 Oct 2025 14:55:55 -0700
Message-ID: <20251008215613.300150-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d58257be40..9a564339fa 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1678,7 +1678,14 @@ static bool trans_B(DisasContext *s, arg_i *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
+    TCGv_i64 link = tcg_temp_new_i64();
+
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
+    }
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     reset_btype(s);
     gen_goto_tb(s, 0, a->imm);
     return true;
-- 
2.43.0


