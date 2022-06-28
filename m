Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2890110lft;
        Mon, 27 Jun 2022 21:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbZj8IrHY81SF3cL65GWEBFFXh82TgLvl0tHujOtMFGYkchbyhwZvz1d82n/SEDInye7tn
X-Received: by 2002:a05:620a:2942:b0:6af:f7e:7b40 with SMTP id n2-20020a05620a294200b006af0f7e7b40mr9139394qkp.330.1656391134412;
        Mon, 27 Jun 2022 21:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391134; cv=none;
        d=google.com; s=arc-20160816;
        b=oLpCIB7Pk7aTDuCGLCy8VoZdJ0EdZTnKvPsgdYo64TIYnVKp0l3vbV2XBF5ANN9wZt
         kNwPNs7R+5JVWZbeElunHzVsq0z5aovDqX2A1Q6OzV3DdxY3jHh+FTKP8VlAFJNK6mho
         //VBIgq/Iuzb2zt6rB/H8rsvwj0S94fgTAf8keXMwjeC/qTCcrXSqEIjw3nIUelr6zkU
         Nhkj3axIikGhEcJgyihnzrNZIa4kV93ySv3yHnDnplhNa3fs2e8mDslWdRSpCaj5MI20
         jt2Rylah2NNpIRgsAovkdbOhymXBIvFl6Zr9n/nxvBRsafDItwMoDJDdpiMelFbh+jiJ
         E9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R7wsrrOG/moJG3/AyHVAH2nF72RkKaiwNup9jQ+gf28=;
        b=NS+WZbLe5qSEngIzJ4cc5lyy66IwrH+2rF9Mg5Wke6+nNZ1YUxFkglfK82OXAZstYf
         5JSPZAW4ccmByQjsri79nZifmNUglbRH4c4FFs6COMJixvHstjb8EPnFnQPvYjKdYIKS
         M0BjFVzhAAAqN+jUD8dGKdJ6xNhAyFxac54q3Cs2Bbwb/4VeF5QrA3QVAuwS7IQHkU3E
         O9myfCLVHpd6OKb7GMpfMpGu0wt+r+pURG8FrhDAQMKi6U4x7UgoOsEUAFBHwkrG1+pP
         CdjOgLzurze5sjUeLc1yfXPfxzvMkg5yKtT0bZkXG1d7t/HzsRzfo+dg5hoj8EyFvX5/
         M5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlpHo7GU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a37080d000000b0069d75cbbe08si6113477qki.264.2022.06.27.21.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlpHo7GU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6301-0001JP-U1
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jl-0001wY-EP
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jh-0003j6-A3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so11396492pjj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7wsrrOG/moJG3/AyHVAH2nF72RkKaiwNup9jQ+gf28=;
 b=QlpHo7GUMngIANSW8myXBzjun6bvnZiidvTVdH27+9FTJlI5MCPdDC33OPVp7s+QPq
 PR6XlQVs0Wh8+xFzw5OO/jlleFgUErS+i7vcXla3KJwBZtyVGXTMEy8cUbajYDaOGeqa
 Fq057mASlrJo7BC7GdwEEsNd9nw6MY45nMyvKt+zgluuTljcSjxOhH4PE5Ej9hHTtDVj
 muW1cN5jC9gCNqo3conDO396aLRngg9YjlSDr8ygPhGx0KOoKDe+DRY42Sj/C70X9WVN
 873APSxl2kAhevV5nyo+Tl6Kg7QW8DMx4Fml3Zue0TA5fV3SZhaIr+q1GSfcPZ3+RTZW
 LXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7wsrrOG/moJG3/AyHVAH2nF72RkKaiwNup9jQ+gf28=;
 b=k1efdLteTnjm1U5Hhqgt1Eb1wkUncbw1E64ZBGrauCF+nivqZLQU1Iz2ZiCRQXj+MY
 Ci3gRRcXrwuzJTQA5+4OayS4U/TZ+SbQ14vcv6GVi2RnwDbR1UYQetTgbbQwTr+x1tXE
 7ZgR7Luqq1eKYqDZFHJUTmoC3ulDvHvzyDA1AiWMxH2d7biYoHlob2eygjH3vebRuaFL
 +A/+3OnVmoAFeJIzpAkpHyCYx5SIdpKg98v5GandNjS+2m43zLg0CJ++d9J9PkbJp47l
 Jmn6hqurzkeSVYYLl45P96N44PYxzjhxyUlwdSb0AdHEliLCvIQqgs1IlDoQD5Iuvi8W
 CQew==
X-Gm-Message-State: AJIora9jdWxCgQRLE2aCY69Ll3VjP11GZ930mdnJKb0fVEAZO1yY9+4v
 O/qc5iuIF7o/3/kc0tUivjevyjDdsvF32Q==
X-Received: by 2002:a17:90a:8914:b0:1dc:20c0:40f4 with SMTP id
 u20-20020a17090a891400b001dc20c040f4mr24775886pjn.11.1656390118986; 
 Mon, 27 Jun 2022 21:21:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 16/45] target/arm: Handle SME in sve_access_check
Date: Tue, 28 Jun 2022 09:50:48 +0530
Message-Id: <20220628042117.368549-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sEl8mNme+Dmn

The pseudocode for CheckSVEEnabled gains a check for Streaming
SVE mode, and for SME present but SVE absent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b16d81bf19..b7b64f7358 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1183,21 +1183,31 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
-/* Check that SVE access is enabled.  If it is, return true.
+/*
+ * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
+ * This function corresponds to CheckSVEEnabled().
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->sve_excp_el) {
-        assert(!s->sve_access_checked);
-        s->sve_access_checked = true;
-
+    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+        assert(dc_isar_feature(aa64_sme, s));
+        if (!sme_sm_enabled_check(s)) {
+            goto fail_exit;
+        }
+    } else if (s->sve_excp_el) {
         gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        return false;
+        goto fail_exit;
     }
     s->sve_access_checked = true;
     return fp_access_check(s);
+
+ fail_exit:
+    /* Assert that we only raise one exception per instruction. */
+    assert(!s->sve_access_checked);
+    s->sve_access_checked = true;
+    return false;
 }
 
 /*
-- 
2.34.1

