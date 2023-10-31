Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp326631ejb;
        Tue, 31 Oct 2023 07:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+q5kDnBHhJJlRQoEx0NXcggsUUsRdFGKuEtJjQ1o9i5SL5rHyHW/KCvxxdptdrZwkXORp
X-Received: by 2002:a05:6358:9144:b0:168:de6a:d653 with SMTP id r4-20020a056358914400b00168de6ad653mr16039495rwr.21.1698762793405;
        Tue, 31 Oct 2023 07:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698762793; cv=none;
        d=google.com; s=arc-20160816;
        b=usHzS9iSQcy1GNbpqRa1X/YgjODyFwQsZhjV37Bs+0iyycpFqpTmpa+MVLzl559v29
         L6mKZcHG5ifbh3yNzyM99rc8eJStvGIL9Z3ld2JzT/kz6VhJLmozLtNcaABoOZhyqFFr
         naBpf9QB1f7lM5PhJjm3C/nY80K3SsPqfNJWki1tF8MYnyn3vjIcAoQDTkILf0njXcUB
         RKuTj1/w1nDZ3z/1Qsw5cTfHPmxiuO4PvDr9hhRAuvJVxpkyyMN83YvCxoPl7/V5pFb0
         AF79ZcbnadWVJQGUR/TVpONG0FK2MQ5ktSXQtoazWPp8lpJGhj14LDyh5vwRmHByUema
         JK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2CYGRwQkn3vBbegQZVV/vYVzIasu5qHXxrirxpdWc8M=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=xwMsLWviKl4cWUSoVN2/7migceD5jNgA6z1EAomhsNBXtBkqBmhBezAHcYWRBxPivO
         +eBYwvOX0Y+zRWxm1GT/FcZmSOOPj6oPc6qEdQ+aLeuUZUNy2o2R5Z73ERrIg7uGqoKX
         Pdr37daCp/ixVx48vqFcNZ9ADZU2SBcEdbE1TFFo5G8bzXFM3Wy724wHBLWrShQje96m
         DDSc9YMk5pLQo1OKWf38Oo8oRgguGrRvMD0sJIcm7GfcnaGGSAut7zWGxGsfXcbYUeAG
         6M9OLMHu5mOFiudjNeJULVxuNWBo8jQJWmHFjUoh10sTqAFjHpT6YVOAllYbBU6JUGsL
         hq5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZvFShhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c127-20020a1f4e85000000b0049d86ca38aasi162491vkb.304.2023.10.31.07.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZvFShhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxpnb-0007x7-UI; Tue, 31 Oct 2023 10:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxpnD-0007lc-6V
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:32:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxpn1-0008C6-W9
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:32:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6be0277c05bso5071114b3a.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698762738; x=1699367538; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2CYGRwQkn3vBbegQZVV/vYVzIasu5qHXxrirxpdWc8M=;
 b=YZvFShhCceI3SC6Itlt4rHgOejRuQKSiFiiKZ6gfX7Oe/ChQo0H4MC2m7Ksux+VVa2
 +3cifE1MVr4mGuk79J5tvMJn19HaethCjm/Fg124r9rALJRbBWe2cxZGjWnhK5i5g3sb
 WTwo4E5MXoPQlCIB30T4t8s7aPhEhRXMfCMbCAz2s97Nz/hFNSgM9g0kbYK0PWIv0/L2
 hkZ0+7/5Vw8QYtAsAfQS0qUGoblRWKLSYHuE2KWx+YCYc/pJwL9kTTAWuAzrHUr/hyCs
 lW2XnwHQ+naEttTjUeRnRtAx0/OzzphXc3sRR5GqIXgt89OfgBNW+DhQ3xa6SNP2Bvlp
 TzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698762738; x=1699367538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2CYGRwQkn3vBbegQZVV/vYVzIasu5qHXxrirxpdWc8M=;
 b=d1Hy8oSD33VbhFOByy6ugk+3hsDu4EVjarOs9/130SQpCu7H7osL2hUwmbDSdnwLpY
 Ts9QH4hi5wa1FjEepLBW9bPuHq6LqlulPmrPmlNc9edfO8+s05T3aqedWdVauUjyqXQE
 ZrtWdNOybh3WfnJa45p5/2d8kPalAL9ZFO+r4ugbPvEWnmAWK//KZvQnOJ3gdutuEfDt
 gEZPgK5x4ug14gdelj1CHBkaUiJYIu+UUTG9O6OXE6WexfIDHx4w/nfQX5EMD408xNei
 XdTcJ2H6sGGAeIwVZ4Otf7Ahtl/2DVe354kDYDJzGg/qyUC7xrpcVXCzfIuTlPpogmy9
 viPw==
X-Gm-Message-State: AOJu0YzfJJRN8JTg/4PxKvqxM+slalenrqJ0H1m6ggYmmof1sfFJ+8F6
 Kwt5FYbD5AKTjITWLTxqT2VKSQ==
X-Received: by 2002:a05:6a00:1a93:b0:6b6:7a04:6f9 with SMTP id
 e19-20020a056a001a9300b006b67a0406f9mr11771745pfv.28.1698762737685; 
 Tue, 31 Oct 2023 07:32:17 -0700 (PDT)
Received: from stoup.. ([71.212.149.95]) by smtp.gmail.com with ESMTPSA id
 e19-20020a056a001a9300b006be484e5b9asm1321847pfv.188.2023.10.31.07.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 07:32:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH v2] target/arm: Fix SVE STR increment
Date: Tue, 31 Oct 2023 07:32:15 -0700
Message-Id: <20231031143215.29764-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: Y3gZ38Idha0A

The previous change missed updating one of the increments and
one of the MemOps.  Add a test case for all vector lengths.

Cc: qemu-stable@nongnu.org
Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c    |  5 ++--
 tests/tcg/aarch64/sve-str.c       | 49 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  6 +++-
 3 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/aarch64/sve-str.c

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7b39962f20..296e7d1ce2 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4294,7 +4294,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         t0 = tcg_temp_new_i64();
         t1 = tcg_temp_new_i64();
         t16 = tcg_temp_new_i128();
-        for (i = 0; i < len_align; i += 8) {
+        for (i = 0; i < len_align; i += 16) {
             tcg_gen_ld_i64(t0, base, vofs + i);
             tcg_gen_ld_i64(t1, base, vofs + i + 8);
             tcg_gen_concat_i64_i128(t16, t0, t1);
@@ -4320,7 +4320,8 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         t16 = tcg_temp_new_i128();
         tcg_gen_concat_i64_i128(t16, t0, t1);
 
-        tcg_gen_qemu_st_i128(t16, clean_addr, midx, MO_LEUQ);
+        tcg_gen_qemu_st_i128(t16, clean_addr, midx,
+                             MO_LE | MO_128 | MO_ATOM_NONE);
         tcg_gen_addi_i64(clean_addr, clean_addr, 16);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
diff --git a/tests/tcg/aarch64/sve-str.c b/tests/tcg/aarch64/sve-str.c
new file mode 100644
index 0000000000..551f0d6f18
--- /dev/null
+++ b/tests/tcg/aarch64/sve-str.c
@@ -0,0 +1,49 @@
+#include <stdio.h>
+#include <sys/prctl.h>
+
+#define N  (256+16)
+
+static int __attribute__((noinline)) test(int vl)
+{
+    unsigned char buf[N];
+    int err = 0;
+
+    for (int i = 0; i < N; ++i) {
+        buf[i] = (unsigned char)i;
+    }
+
+    asm volatile (
+        "mov z0.b, #255\n\t"
+        "str z0, %0"
+        : : "m" (buf) : "z0", "memory");
+
+    for (int i = 0; i < vl; ++i) {
+        if (buf[i] != 0xff) {
+            fprintf(stderr, "vl %d, index %d, expected 255, got %d\n",
+                    vl, i, buf[i]);
+            err = 1;
+        }
+    }
+
+    for (int i = vl; i < N; ++i) {
+        if (buf[i] != (unsigned char)i) {
+            fprintf(stderr, "vl %d, index %d, expected %d, got %d\n",
+                    vl, i, (unsigned char)i, buf[i]);
+            err = 1;
+        }
+    }
+
+    return err;
+}
+
+int main()
+{
+    int err = 0;
+
+    for (int i = 16; i <= 256; i += 16) {
+        if (prctl(PR_SVE_SET_VL, i, 0, 0, 0, 0) == i) {
+            err |= test(i);
+        }
+    }
+    return err;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 62b38c792f..c6542b5f1b 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -103,7 +103,11 @@ sha512-sve: CFLAGS=-O3 -march=armv8.1-a+sve
 sha512-sve: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
-TESTS += sha512-sve
+sve-str: CFLAGS=-O1 -march=armv8.1-a+sve
+sve-str: sve-str.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS += sha512-sve sve-str
 
 ifneq ($(GDB),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
-- 
2.34.1

