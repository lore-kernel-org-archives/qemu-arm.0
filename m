Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3717564ejm;
        Tue, 25 Apr 2023 12:35:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvx1hZwHCvbuzNBKHgvnHOv1sBECFkrLxlFByrbpC5whPD8K0eSEHfhIZAtPapEu339dNR
X-Received: by 2002:a05:6214:628:b0:5ef:564a:3296 with SMTP id a8-20020a056214062800b005ef564a3296mr27730303qvx.44.1682451353609;
        Tue, 25 Apr 2023 12:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451353; cv=none;
        d=google.com; s=arc-20160816;
        b=ORdoG596gzX9gAJ3eSs8ZSGlveK+mmLu6aa6rz/6zG1SQIikI2P6QfOvdvyw5Yc/zJ
         g0ngJ/JlGn47ixZGMD5URRalTVr0yq3m0xUr0GjCxRG+o1cpUO6ftCew3tInTQNg/9ip
         quSD1tlAEUPJgQ5vaQNISFS7XrpOkYxPLmjaAcAGSoY6Evz6GxjhxyIrcF8xP+DnzNDv
         Fj+RHK1nTNhIq8ExS7+ftO5zKt3y0k0RZaADZdJSdmV2qoLbhP+Xcc55qE7nz9F18/h0
         adHVx6iSDMrVy7TpW2j0W1G4Men1vWk7dN9s+mEmxSg6+xcBn6nVw4gsVBSw+/WBydea
         +pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+P0K5bbe2wOaUg/ZSYckKIQ1gR+lhjFre48UvlDpErQ=;
        b=rM1rqqC2PWL/uYOAG9lv/vI8nTlnf+sqZQkvpyUE7mt7nC+UzZDK6ZsmdGObhO60ya
         5bW+1CRJfc/PEv+GJVrh0LCT9nmLKPgDFQnebGLH3Du9IMGQeytWlnrgJuxIGnHJO+j6
         D+pfV24+PLqEv6lzZ9meYkVVsooZu5WyHDTq9rJjRk+dYe09ccvzPnTzVCDSFyaMNNa0
         nSKAbSJUByDrFNGCNQ7LSieHNxq42fmWQts1AYr1GQad5x9e2MxxAsQyCkP8qKDcNBHV
         UVpaQG5UKUqXxJk6MevNIXiPYSnWZpuzKw3v7kFNSWNVKmBxmwYO2lSqhd19iJcHviyN
         HgdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FSP6bOgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d66-20020a37b445000000b0074e06b49eedsi8800594qkf.156.2023.04.25.12.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FSP6bOgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prORO-0004eD-6N; Tue, 25 Apr 2023 15:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQy-0003vn-SH
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:42 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQo-0004k3-VT
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:40 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8bbea12d7so61237831fa.3
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451269; x=1685043269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+P0K5bbe2wOaUg/ZSYckKIQ1gR+lhjFre48UvlDpErQ=;
 b=FSP6bOgzGR5Q2pKiUF7N7/ERmd96FPv6dCD/xt2coqsO1JgZpuYsOM04rhCDlQR5Zz
 gt1NU2t7RzCcd8Hb+7YXO+JprNCrR6E5nHPp/TJgUYFHTgTWiUvvmJr5k+G0jHXgRzjI
 XCse2YoulRFIR6/rFlttampKkt3aWDUUZNQ3AGc/6ruXD6OhBebR9cdsMnt/QOBxBf8g
 eKVKL4yLKldJiTh3vsTKGkAMmx5bzoHz2DHKpPXqh3zDdkyUKkEg7JyQg8FiQPrjrpJg
 UM4Aeddef8I5XTirfhw3lly2KJj1IV8OLnRSyIX6BxYfFzPM5Jbal1TXMlWde7qhiBuH
 Ixzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451269; x=1685043269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+P0K5bbe2wOaUg/ZSYckKIQ1gR+lhjFre48UvlDpErQ=;
 b=OsGUipfzYr687UTqa/KcomwQcCqSUU30uFgXrPKoWssj6Ufutl5ZYoo1XtnRf1s3bo
 XtKjV7IUaL8P8sJ4vz+HaopPXZfUQYBHVIUe+uyt1wKTbAMGJzQoghVzgQrYmvdmS37I
 cOL4Z/5bRepqjUjVbxwpv+IdAWjNqj8HY1vlF0Ba1QDBTjeo8gB8Fhem2OXUcgMzskz4
 PwCmlDfNxhqvNSwHgHVoasSNBrZqw4JWIMdhsSuXgO2PRwjEBYj6lwzvrTeQLduUOTBN
 qlgVW4jbqDtFXPc7RlbyiRw/batRWfvqciJ45AhduxLI+DYg5qGFnDV3Hc1g23s5L9Tu
 n1HA==
X-Gm-Message-State: AAQBX9fNvQuO1Zedf1wX9bHBQB3NEHaEtl1K0wGskZRkN4trns0Qr5mr
 1v5XatB1p6s6iVt+awjv6IPVFw==
X-Received: by 2002:a2e:8189:0:b0:2aa:3c81:db92 with SMTP id
 e9-20020a2e8189000000b002aa3c81db92mr3777802ljg.19.1682451269120; 
 Tue, 25 Apr 2023 12:34:29 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 25/57] tcg/riscv: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:14 +0100
Message-Id: <20230425193146.2106111-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MPNbMW94ZgHO

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1f101cbf35..8522561a28 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -860,7 +860,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  * Load/store and TLB
  */
 
-#if defined(CONFIG_SOFTMMU)
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -907,34 +906,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1

