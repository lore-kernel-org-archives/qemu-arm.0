Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3694578lfa;
        Mon, 7 Jun 2021 10:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEW7Vck5YJ4s0p6d+mQzUcP7X0q/C8Of28kd6EBlyqRLbti3MLW1SgIfuVxwwEK5hsYa1p
X-Received: by 2002:aca:1b14:: with SMTP id b20mr209521oib.174.1623086677688;
        Mon, 07 Jun 2021 10:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086677; cv=none;
        d=google.com; s=arc-20160816;
        b=Vt/4aJIUSRP4ItXyfKr0/6F7/zKR5HbR2LWLOekf2U5pKIJzAuWGE1eaFnn1wkm0EC
         zGBF0LyVVktuD48zeGj3TzVjSwM8sltMiOWYgCeFPZCp9BMgQdRQrCUA4yN/N5omraku
         ITE7U8eJktT3wFhk8iAFMAozkcVVQr1H8P3sWveyTUme2j+nFxlQaACtxTOd9Yr/ToUr
         CcuENnNeXoizDtJkximS6YUBgkjmV8uXjrKNt6Jf988pV6jNuoTRgD4+xC1S7yZqziZ/
         x9TuEq4EDWHUF3fbp4iASN1tveJYyYd2p1OiBc+OoCvu6rchVYEO0s1Q7wtV3hCHOAWQ
         I4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v6w6D3n71RpoUYab/m0xGRbMyYPeb8rynJ5A3BjU3ls=;
        b=HsHDxKU8vD1xQTFz7Kh05RhsisLcZLhs9E8K9ivY1ZQMtOAZyfNqNV99eoqtepnh5Z
         di2e4zQ+uBqgDzbGUUQvTfzstEc8QVxuiRThAGHZD/KMlsCovGAe/YThoGH0gTR7Z7Re
         MmyCW9uCbGigtvMdatKTDVTF6kVFCPKW+We6izS1y00nlEijsf/DX0nYv/udQglfpKMn
         aV6oURSGvefnscDTtBuRuO6LSpZEq9WnNTY5CAEXMnr3KC4z5NsTi4zO5T1nwsjPfOMp
         Lzq2/FlIJgzwyo67lukbI3hafH04S8YIkp8U96q21o6hrr90zfy56aI5nLtD9s3FOl9P
         yxRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsEkyYC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a184si3738052oii.261.2021.06.07.10.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsEkyYC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIzM-0004n3-TU
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb8-000840-Mv
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-0007zA-Qm
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y7so13799149wrh.7
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6w6D3n71RpoUYab/m0xGRbMyYPeb8rynJ5A3BjU3ls=;
 b=EsEkyYC7Ayih1klwF1CkLCtrmCF7DH00AqEtcgitdJ1pHv5hqNGE5MVwlwOE3zi+oM
 lOUtBHubeQiAkyW6/BaiYo6tG7/lVZ6l6zVAQmgq0ww/HXzGAWjd551YzYvYczCJJy+N
 IYNljMbn+D0N6aLRncLdW5x3gu7VyBq97P0RFqRf3Aa2gPMnziRHaRZhDfUIvgJ+U3v/
 dHUP0MAMv3mNnIC3ermJC/LRV79qy8fQmZdYBVbbyEBeL9zeZWAyP/G1Mbe3uxVh69zA
 G9zdPV974BRdTrfXKxR3OkU83zPD6rEbtjSG0ledb7dyTw2U1/hFG9JcQ7dbyQTNtnwv
 sRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6w6D3n71RpoUYab/m0xGRbMyYPeb8rynJ5A3BjU3ls=;
 b=RCd7UAjEiMnGi8SCw4n+urOzvfwMi1KS5r8G5K8Wtk+nYhE8gq+TSiF3VVcdaBCFAR
 /2R5iNzV1cX4Ec5sYXrmA6H3ZP81FeYjc+/q5vG9rqS8V0AyG8zO0hfyzCy4DmQEziD4
 33tI6ieB0pb6igB9uCIKsgptMsUOBp/84mt1wInX3HMpzJd4bQhvAHTyDIgdE1w2373c
 7DhhWbRFlLmR0/LbzLjgmtShE6Cfrot6sHvClkH1dufyjLs3C4SJC0mpqm51GXFdyaNV
 4QyYsDEvxEa2cJQFu54ylkdS0RJmH+f6jZ7D2yoswOfqGi1EBLlZAWUyJr5lM209iqfr
 rL7A==
X-Gm-Message-State: AOAM5321MxUYP4g6axRwciEhRdbOBvBlKjKtxEW0J3kOjKiq2D3tENxR
 +ZfX0bVdPO8d5YIqUokKNTu4DHV9mvH5x7hn
X-Received: by 2002:adf:cd82:: with SMTP id q2mr11678942wrj.258.1623085121510; 
 Mon, 07 Jun 2021 09:58:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/55] target/arm: Implement MVE VADD, VSUB, VMUL
Date: Mon,  7 Jun 2021 17:57:48 +0100
Message-Id: <20210607165821.9892-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Es4YAnWLTzq

Implement the MVE VADD, VSUB and VMUL insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 12 ++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c | 16 ++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ad09170c9cf..b7e9af2461e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -71,3 +71,15 @@ DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vaddw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vsubb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsubw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 332e0b8d1d6..f7d1d303f17 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -33,6 +33,7 @@
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
+@2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 # Vector loads and stores
@@ -77,6 +78,10 @@ VORR             1110 1111 0 . 10 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VORN             1110 1111 0 . 11 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VEOR             1111 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 
+VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
+VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
+VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 6b3d4dbf2da..39ab684c0c3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -323,6 +323,12 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_U(OP, FN)                        \
+    DO_2OP(OP##b, 1, uint8_t, H1, FN)           \
+    DO_2OP(OP##h, 2, uint16_t, H2, FN)          \
+    DO_2OP(OP##w, 4, uint32_t, H4, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -334,3 +340,11 @@ DO_2OP(vbic, 1, uint8_t, H1, DO_BIC)
 DO_2OP(vorr, 1, uint8_t, H1, DO_ORR)
 DO_2OP(vorn, 1, uint8_t, H1, DO_ORN)
 DO_2OP(veor, 1, uint8_t, H1, DO_EOR)
+
+#define DO_ADD(N, M) ((N) + (M))
+#define DO_SUB(N, M) ((N) - (M))
+#define DO_MUL(N, M) ((N) * (M))
+
+DO_2OP_U(vadd, DO_ADD)
+DO_2OP_U(vsub, DO_SUB)
+DO_2OP_U(vmul, DO_MUL)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0e0fa252364..1b2c8cd5ff7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -363,3 +363,19 @@ DO_LOGIC(VBIC, gen_helper_mve_vbic)
 DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
+
+#define DO_2OP(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        MVEGenTwoOpFn *fns[] = {                                \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2op(s, a, fns[a->size]);                      \
+    }
+
+DO_2OP(VADD, vadd)
+DO_2OP(VSUB, vsub)
+DO_2OP(VMUL, vmul)
-- 
2.20.1

