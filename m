Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6568073ejq;
        Mon, 15 May 2023 07:53:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LkRrQz9hC3qUxn7zSlCF/cpfZb4SJg/S4azwoFqQXxaH3+WQXEaO7MNKCGm+8T4QVRwEg
X-Received: by 2002:aa7:d705:0:b0:50d:8c5b:86b with SMTP id t5-20020aa7d705000000b0050d8c5b086bmr27396831edq.21.1684162423036;
        Mon, 15 May 2023 07:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162423; cv=none;
        d=google.com; s=arc-20160816;
        b=KgZHkG1Fee/vLgy8Zce4JuOLqFV39PkFwbrHXwe7b9YCJPLltFRD/X9v0vF07V8634
         l+pgl/psxIwui+xebZCGR44NcTn2MIUBmxjfcvwyekLE4kmxDiR0NYEOJArCPG57TG+L
         GpQwpXp32R3XpgOpxBPT4pko4gHyL0vCGzYot57arkCVu2McmdS2l/yXCryfZYj7j2Qe
         QwaMA2XnFt9V/4vpgcURoWYSqFJjuhUOTCcoOSnAKf8TzPyIN2DwFKkbDEB4j6BZA3ya
         3aqESdZQPqxAqHSxd4df8hwkGwRDhI2IrfdiFdMOXquKFYS97hJ0wJA1NeuZL2u2YUrS
         BFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W19ruQQxWDDIeEDzZGJivenEm5AmU9KSchMTkoB+WqU=;
        b=DxoQFt+rUGWIs6fz3E+jnv0KVRH4WLalaRXqb5DY8bNwh1HyMhUP2obhvbLtf/KwpH
         HSCe4AP9hDWdAeR5R6XIieCUB1OWgou0L+qgg86MQjVmqK/vjPT6ktZh07GkVEZWe6lw
         5DQLoPqqaTEv+I3ZyHaU43zKyG7WlXLL32lYtfTMYGdSkK60IgTr5nzu2T4fJg5OoIw5
         GyFQvgAnDQIMxz9MeWiXISgIFAnVVzj86tXCU88ZH1iFP8hzAY8HNJW3fNfZNkEQ6WCg
         Nq/P1A5ps4OQI6LVgNRRnsMflJDd6GtI5uTDk8CL7IA4IH548+0jy+Dslklqg/jLVCsI
         8fig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KnuDKmix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020aa7cf13000000b0050d86aae43dsi11650629edy.370.2023.05.15.07.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KnuDKmix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIl-0001Dv-LR; Mon, 15 May 2023 10:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xg-KT
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGW-0004wj-Qc
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1addac3de73so29994155ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161211; x=1686753211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W19ruQQxWDDIeEDzZGJivenEm5AmU9KSchMTkoB+WqU=;
 b=KnuDKmixTWNf1+WQ9EELsmyOgKu1k2cdwzF0UTOzCEeUro89rK/YZHJRdDHwGP5Hh1
 lC+dJ/59V0kQHlOitXxQvEz2nFYylxkVoR26MHaHb4UUsVdf2+AVnUPzfodGrSgC0JQF
 8fendN+RfOn5MqehSKRLayGeU683TPWEzPfrnCm97u0uoVjR6qlG924NExUjvPajZ17S
 qO4vlpHE/6qqARS/bMaFm8zMhDlG+AcfiG6tXMksYWmx3GqAT5sTDu64jBgyGJsJSvHV
 12MjiJHR3MDuZoyTYWAuOAztBN6MxEia82EhuswI0IxYxtApoSMAquAAtEiXJyqLxodI
 wOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161211; x=1686753211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W19ruQQxWDDIeEDzZGJivenEm5AmU9KSchMTkoB+WqU=;
 b=ZS03vpxX7aWN2TXCSkbH2Crl7ejAUbFcAH8vFcJAOvq2cQfeFZXxnN/vbo3ztWusKB
 GewdeG91TKM1LZXmJzqRb1qb2V7U2ifU0DoHojMAU5r93JdLq82uEY7bwmhARjSUbtIS
 dvumvnDuXE5lKP8M8sZ7vn6/pHN9I+HGPELveooBmYgNvOf9DOHS9zOZzWo8OVTUeZ+M
 H4W+5+TqnJwkP0GYPBsH3dOoNmoFaSUKmCinuonRUWBJ6esz7m405i04YbUK6KeycBOM
 GCssQWIG0cD3HtoYDBa9CGpc+fCdUnjM5jQQb8ufhzSdkVXaXgxtaKbDgJHx/t3P38Zd
 xlFw==
X-Gm-Message-State: AC+VfDygEEfSyulqEFiL1h2ruygXHCAouiNcTsxuRbk37Qg8CmiRF1fm
 7+86RpC54AGv6gR0vUp/fIv2lmZYsxjiDcIvk1Y=
X-Received: by 2002:a17:903:2292:b0:1a2:3108:5cc9 with SMTP id
 b18-20020a170903229200b001a231085cc9mr46161994plh.40.1684161211318; 
 Mon, 15 May 2023 07:33:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 19/54] tcg/riscv: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:38 -0700
Message-Id: <20230515143313.734053-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dK+HLWDf7VOg

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 8ed0e2f210..19cd4507fb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -846,7 +846,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  * Load/store and TLB
  */
 
-#if defined(CONFIG_SOFTMMU)
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -893,34 +892,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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

