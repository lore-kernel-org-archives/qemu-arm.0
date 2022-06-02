Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5211864lfh;
        Thu, 2 Jun 2022 15:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtCRv+2X81FCD+PqsNXWf6JJNQixPwFlgy2omsE1GehqxQqErcpDupUKlBjLoXRCGuKJRk
X-Received: by 2002:ac8:5c47:0:b0:302:bc9:6001 with SMTP id j7-20020ac85c47000000b003020bc96001mr5449317qtj.246.1654208492202;
        Thu, 02 Jun 2022 15:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208492; cv=none;
        d=google.com; s=arc-20160816;
        b=nc7ZJiYmHl7o4Z65c9tgRmkdQpWMExiZ5JuTVE11NFnamuc8fAvqHzN2mPC0WPJWlD
         DRFsWROoV7M+VbTsU1w6ey8fl3eae4fXiTrSMk2qexdfE36ccQC4rRB7r0vMLbLPn9mN
         bIJ0wsr5CCICntlErFHxw7lF7kZswdZqAEwdYd2qGKc5dbM1UxXRS3CLyEwNmWFq2tG/
         aVPC2ybAw5c7JafHFyetGSBSHdsZ8J61zhh5IUyE/eT8IiVJLao/sdyQOl3AU2GulQRh
         k6o5Cr16bu9hldvOq4ysmr+bGHUf+0bn6gmxzVrDKaxNU57eWJQEaYsXZdRO3m6AoQ72
         8y5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
        b=FA06a91/iO1mqQk6Bf8Z1ct1cEomhfM12BU8z4SWwc0TXcUfAgP8ZkUsQOsv8DRBum
         jAThjoGcqbLSbuIbbGDg2h+2p7yzo1Y7fYWFpQkSWPH56eX70a7iRViY6IBegas9BpDq
         2tslvgpsMFxXeMySDrMbDBtAV7Whx+S2bgBUcldpX6R3YFIAH7UVxqPMjNBlRD1G9S8j
         11T/PfY7/84d/VGjWX9KohffNAPAmWuRYu3pql5wSjxa29ga9DNKHhoIj8T30HZQV9KN
         TiXII3hTTgXa3Atr1VD3p5eh3b6jdmp6yHRNhwcPRJ9pGEcWv9kf357cchLYAKrfNULx
         DwMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fM7kWSPo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js2-20020a0562142aa200b0046458ce702fsi2431619qvb.468.2022.06.02.15.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fM7kWSPo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtC7-0004o9-Ks
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk5-0001H8-LF
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:36 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk3-0000qT-Pi
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso10614059pjf.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
 b=fM7kWSPoPsOpsNcgXm2pQIidO50rUK9XXznyD7PbsOGHl2ri9C4h932bt2AAdjwJHP
 Pff9LXc5xtJLRLmkqRuHh6eFiD3sr6EgwA5EKLsZB1hojTq5R1CY2P2TSryPF+cjyn6N
 QfUSF0GRm5QkmQ3KrJiUNrQK2PwT4YgFiiczm9kmCGBrpR/MDKzz5tfUSv7wygHwDLbj
 VUYPa3PJnDUJn68f7CxWKg+SNYz6/+a76102ZH8iUst0KUi58rklTh7nkAKkTdpN+vaU
 CG8uDk+a8N3PRiMxO3dIZv9kHHPEE03CE1yFzAdwfFOXhaV2AoZ7qM6Xsf4RW4xhdft/
 bssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
 b=NgmlZ/YDQDCNO/yZHm9XrA5ivabp3l8DXEHtALkoCxrGDkQvulhs0SeskDZIAQhIOX
 5eYNafj2Us4yUZiTAHlevsuEo3cvQvRfLFNcIVNy/nJjHL8n0zZtK0f3S6Aeg0SIAtbb
 CVXXArdZeAPFNnVquUQW8yOw66DyX22fJ/9Cc6ecCVseABrwjbuyigwZ0RQ8nc/0cyNo
 VM4rNWm7+gqB1MT7v5+BB72zexysPO5MYYh5ykN2Xqh6tSmfj+tnJrUoGMQaCmKSWIa9
 P3trnygBJGy5wBs1XRXc2zuttJYklNoMkD5sEmRpYc2o0MjnRjIDxhWNCwZCpAWEI6Qj
 TwSQ==
X-Gm-Message-State: AOAM532d1rDcuMGTPLtTNIGN1bUNUTUtf6lQiV3EjYWAA5JxNheUI2nM
 jWq2uT9rikgRryk1UGAxzrYjH9fWEJzN9A==
X-Received: by 2002:a17:902:7b8b:b0:166:332f:2490 with SMTP id
 w11-20020a1709027b8b00b00166332f2490mr6853007pll.68.1654206750287; 
 Thu, 02 Jun 2022 14:52:30 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
Date: Thu,  2 Jun 2022 14:48:22 -0700
Message-Id: <20220602214853.496211-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: D7HWfWNNR/+a

We will need these functions in translate-sme.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 ------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dbc917ee65..f0970c6b8c 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -107,6 +107,44 @@ static inline int vec_full_reg_size(DisasContext *s)
     return s->vl;
 }
 
+/*
+ * Return the offset info CPUARMState of the predicate vector register Pn.
+ * Note for this purpose, FFR is P16.
+ */
+static inline int pred_full_reg_offset(DisasContext *s, int regno)
+{
+    return offsetof(CPUARMState, vfp.pregs[regno]);
+}
+
+/* Return the byte size of the whole predicate register, VL / 64.  */
+static inline int pred_full_reg_size(DisasContext *s)
+{
+    return s->vl >> 3;
+}
+
+/*
+ * Round up the size of a register to a size allowed by
+ * the tcg vector infrastructure.  Any operation which uses this
+ * size may assume that the bits above pred_full_reg_size are zero,
+ * and must leave them the same way.
+ *
+ * Note that this is not needed for the vector registers as they
+ * are always properly sized for tcg vectors.
+ */
+static inline int size_for_gvec(int size)
+{
+    if (size <= 8) {
+        return 8;
+    } else {
+        return QEMU_ALIGN_UP(size, 16);
+    }
+}
+
+static inline int pred_gvec_reg_size(DisasContext *s)
+{
+    return size_for_gvec(pred_full_reg_size(s));
+}
+
 bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67761bf2cc..62b5f3040c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -100,42 +100,6 @@ static inline int msz_dtype(DisasContext *s, int msz)
  * Implement all of the translator functions referenced by the decoder.
  */
 
-/* Return the offset info CPUARMState of the predicate vector register Pn.
- * Note for this purpose, FFR is P16.
- */
-static inline int pred_full_reg_offset(DisasContext *s, int regno)
-{
-    return offsetof(CPUARMState, vfp.pregs[regno]);
-}
-
-/* Return the byte size of the whole predicate register, VL / 64.  */
-static inline int pred_full_reg_size(DisasContext *s)
-{
-    return s->vl >> 3;
-}
-
-/* Round up the size of a register to a size allowed by
- * the tcg vector infrastructure.  Any operation which uses this
- * size may assume that the bits above pred_full_reg_size are zero,
- * and must leave them the same way.
- *
- * Note that this is not needed for the vector registers as they
- * are always properly sized for tcg vectors.
- */
-static int size_for_gvec(int size)
-{
-    if (size <= 8) {
-        return 8;
-    } else {
-        return QEMU_ALIGN_UP(size, 16);
-    }
-}
-
-static int pred_gvec_reg_size(DisasContext *s)
-{
-    return size_for_gvec(pred_full_reg_size(s));
-}
-
 /* Invoke an out-of-line helper on 2 Zregs. */
 static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
                             int rd, int rn, int data)
-- 
2.34.1

