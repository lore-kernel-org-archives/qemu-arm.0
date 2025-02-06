Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1779186njb;
        Thu, 6 Feb 2025 12:01:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3vE5yMdmME7lLGAmtTTQDhP/2l4iFlBq+Rp9DcyVodbHzdJRkWL9DrAJuAfzqlba72nbfaTYtkJNFTA==@linaro.org
X-Google-Smtp-Source: AGHT+IHS3qGHZi/wD5/XYk0ZSQBjSyAm/p1yinwW77oNd45s5Oi3R/yZlXSs65mZrXTv6c6T0oGM
X-Received: by 2002:a05:620a:4555:b0:7bf:f8ea:d0ca with SMTP id af79cd13be357-7c047c13754mr76437385a.14.1738872081245;
        Thu, 06 Feb 2025 12:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872081; cv=none;
        d=google.com; s=arc-20240605;
        b=i9bWAKJ44I6x6kkYdDluA0svUBSthgq1KJvkKEqoK62jrPxfQL0xT89ho3mwSydUPg
         LuxKIywVh1awwsSUinM+tnwY5Af6oFLrJVrbrFWj7qUKZ55HLkd69wTx5ykIKN2VyzIf
         oBSfd6Pa9TxLAMNkgd5ONLXnVFpp+YtuuF9JiWNHYr4oVPKZMIll3v0LCfsompXV8ZNr
         Dd9/eUE+1co1bDTdJGBi4pOqvo+r80Mck8AgfcKYbtThUEzRyUciQyvXKRwAcXPQYZv8
         T0a70UW/zSuw92qQT66EILej1ayrpdLohd9iIXtT2ASogejhhrKBydGhWZ0evhSxGRmQ
         ABcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Xtlbbj3ba3c2YlVvb2qqUXYeWTRl+FoyWyAeHsAMccs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=MRYcan9mTQBxCu5AWN3SloqQJtHv/35JasSVHE6SH/pgMepFXcR7BraTHzgsk9qgME
         gBLQPA6GmDnVS5wrFeu48UkqvGDZsIhTw4PTQOfE3D7+bg37bALmq9iu+HFd7j/Ktyo7
         zAZpxFjZI8V4nAQeqfiU5TieK0PJcOkwiF4jAbxuRvlNDQ6eEfF2IKLTmbsXk0dIfhwG
         8OZ+TbeOOI0VxvPztuX5oeDMj/9q44U3hBHT7RBDX0GvuJ2x0VFGC0z6fQ2Rm0OMBPsR
         665OBeajslji65HYtsqDPICVFZxr7x3U3JdOCuZG4yNdKZjA4ne6IqhRX+O42Y8GYQiP
         jD0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKju7Lf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47167099d5bsi3863091cf.555.2025.02.06.12.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:01:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKju7Lf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg803-00076z-Mc; Thu, 06 Feb 2025 14:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg802-00076D-9k
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:22 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg7zz-0000QC-5U
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so2347755a91.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871837; x=1739476637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xtlbbj3ba3c2YlVvb2qqUXYeWTRl+FoyWyAeHsAMccs=;
 b=gKju7Lf9VufpN1KVxNbisf+b0DZ+QEqHPwRoRiyQGlFiwHcnQtHOc51BTHviQqssvC
 1qj/ZWuZarfkgKTMgm5hv2GCXJzUn9Isr312lMDEF7jv70+8NNjpaj37iy+4mKhPwrtu
 cyOjMBAUWePaOHxXrfj07MNajPHEFj7VutDeqg9Ba5LjMd5e6Z/2b98LuUr6SJOUMOn/
 xmAXUdVd8RMf+9WPAPnW2eQgZE0fuApQxjN2P8x8RWLgc14y5ruZaoJZZ3mQBtdcTcK8
 z0HPvTSz/fe+Tn5DDsVkF4zsjHzIMbBEhVKql2WTkQuiSsa9qDCAf7YlNwhnEubS+E1M
 aOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871837; x=1739476637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xtlbbj3ba3c2YlVvb2qqUXYeWTRl+FoyWyAeHsAMccs=;
 b=oSghaTtGCG+8PKspPXxG9n0jmVMAJb5kce9MfMewak1f/6pmrfNINsJni9UnpTYt0z
 dPr6snYOGOBwLuEUBeYZRmYEG6Q+2zGkaORTQ8jZZ2iA0YopzaWsIcInoGvNUlDXD/HB
 EVuipYexws4K/av9W7BqbczR5juQR7a+szcA+P5ha5cMvsJW7GgMx7eRdVYCLqR+hxD9
 jJkdIdmubjLw5bZt4YsPTTZx8KBddFDWbSuySWns/k5/06Cm8V7j2FBQ4ZgCYYCW3sK3
 hlRlW4vGSJ9eT1+glI1te4n27f0HKH2ClmGKtkV6GS7T8+z/sEvN26Qnw/XbahBfTxrr
 hP+w==
X-Gm-Message-State: AOJu0YzADyFfmskD2zxjJEqIxM+lm8fx2eb8l4Rcx7gl2x2Ax91LxmPi
 54+ldbT4dQSvH8NaQTuzN7i8KXzAJsgH19MiEwhdnWEjrsUYh3zmr8nCiMlq3KE=
X-Gm-Gg: ASbGncsglCHVwsfA7fIFvOX4Hto+YiIi7cMa8GpwmlL5VKPldb/sbO+rA+y3uWIVKOj
 BoERyEiCy6To339vQVHA2DuxI1ar1kTRUACP/T14pLLdTrx9mgF5g32pfF8UNKDQSXU916ynOUO
 Z6dZUn4evkpSzXNINaw7nChqaPR0/fju236bwiqbhffGl9T6PuE0Reymtq7g4rsBiSdsHz4P3zp
 0fbJjn6wcXdRZ7JzP9OJ/o1XInui+1ZvotEeVp2QC9fuULDMmEQOgZh2ZATDmfJV0cQgB+MyRVx
 AquFLje+vXd5gQ38pmeRxCqeiyl9bm3E2DroI6eFXw1NVF4=
X-Received: by 2002:a05:6a00:22cc:b0:72a:8461:d172 with SMTP id
 d2e1a72fcca58-7305d4318a1mr971020b3a.3.1738871837518; 
 Thu, 06 Feb 2025 11:57:17 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/61] tcg: Add dbase argument to do_dup_store
Date: Thu,  6 Feb 2025 11:56:15 -0800
Message-ID: <20250206195715.2150758-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oBoYYIWhmOWl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index d32a4f146d..1aad7b0864 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -483,8 +483,8 @@ static TCGType choose_vector_type(const TCGOpcode *list, unsigned vece,
     return 0;
 }
 
-static void do_dup_store(TCGType type, uint32_t dofs, uint32_t oprsz,
-                         uint32_t maxsz, TCGv_vec t_vec)
+static void do_dup_store(TCGType type, TCGv_ptr dbase, uint32_t dofs,
+                         uint32_t oprsz, uint32_t maxsz, TCGv_vec t_vec)
 {
     uint32_t i = 0;
 
@@ -496,7 +496,7 @@ static void do_dup_store(TCGType type, uint32_t dofs, uint32_t oprsz,
      * are misaligned wrt the maximum vector size, so do that first.
      */
     if (dofs & 8) {
-        tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V64);
+        tcg_gen_stl_vec(t_vec, dbase, dofs + i, TCG_TYPE_V64);
         i += 8;
     }
 
@@ -508,17 +508,17 @@ static void do_dup_store(TCGType type, uint32_t dofs, uint32_t oprsz,
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         for (; i + 32 <= oprsz; i += 32) {
-            tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V256);
+            tcg_gen_stl_vec(t_vec, dbase, dofs + i, TCG_TYPE_V256);
         }
         /* fallthru */
     case TCG_TYPE_V128:
         for (; i + 16 <= oprsz; i += 16) {
-            tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V128);
+            tcg_gen_stl_vec(t_vec, dbase, dofs + i, TCG_TYPE_V128);
         }
         break;
     case TCG_TYPE_V64:
         for (; i < oprsz; i += 8) {
-            tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V64);
+            tcg_gen_stl_vec(t_vec, dbase, dofs + i, TCG_TYPE_V64);
         }
         break;
     default:
@@ -574,7 +574,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         } else {
             tcg_gen_dupi_vec(vece, t_vec, in_c);
         }
-        do_dup_store(type, dofs, oprsz, maxsz, t_vec);
+        do_dup_store(type, tcg_env, dofs, oprsz, maxsz, t_vec);
         return;
     }
 
@@ -1731,7 +1731,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
         if (type != 0) {
             TCGv_vec t_vec = tcg_temp_new_vec(type);
             tcg_gen_dup_mem_vec(vece, t_vec, tcg_env, aofs);
-            do_dup_store(type, dofs, oprsz, maxsz, t_vec);
+            do_dup_store(type, tcg_env, dofs, oprsz, maxsz, t_vec);
         } else if (vece <= MO_32) {
             TCGv_i32 in = tcg_temp_ebb_new_i32();
             switch (vece) {
-- 
2.43.0

