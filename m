Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5204418lfh;
        Thu, 2 Jun 2022 15:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHeae3XCnZA5JBtSKtiWVYXmygtz6bIzU3Xxw5/H3JuXjkswEDlRSmNJV01c1OTGds5Gss
X-Received: by 2002:ac8:5813:0:b0:304:b74c:22ec with SMTP id g19-20020ac85813000000b00304b74c22ecmr5300329qtg.460.1654207612968;
        Thu, 02 Jun 2022 15:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207612; cv=none;
        d=google.com; s=arc-20160816;
        b=tlSi+1xG44V4AXuBB8pebthz05V41LOVDH4/ckaKgAacXADjFAIYQVmAikbQx3X0RD
         7H0faV4DpjfYuOWWv3ExVq5YTC5gF9L2Z+7yk4DG4vWFhYNBm+GXVJJVF16M0wFMCykE
         at60wokFxxQcTcU9HRIa0c0VHTlIiGV2qPeScDmKhVzxVMKKaJ7Nz2Fm/hLGgxj11fi3
         imwTiJVsYc5HTqz13KmhHXPieAoNmNwc3aSelE40miLsYrJtuhcaCIhrqRPV519+25f2
         OMVyjHpomVB8nmCg9AjcUhjujYzcKQwIGi+YVxmfS/g/fOvGI7GOD0truQQb6uFQvIrB
         Z3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wdmw1yZnvA+hHeQ/W/SOHIyofz1vGsnPTS9QtN7as88=;
        b=fsTekpZhsTz9TgvpKBLLIlfqaRLY+dU4p46lRc4okAfI6qa1MJb2bh9PJu8ht3ZUSJ
         7Ny9qnQvEhNNxRckY9D6ZHBYHad33KTWRyZ92BcICyUKEFwB8+iImNBa1udGM+/zTPU+
         sfLyo0y2yyno7X3AcC5oUU+IKoU9zrDnc6gfg72KQE7Du45Z1WOgUfN/BLXAx8iBbQGa
         fnqmvnwtjdnG5tpGlxFoQgGs0BRQi5+U2f6OgZx3CaRqwRVqhmMSEsNmwVEvCeaL62m1
         Lznt3oIx0Q5wnyEuf9Kvgd2svZicE2kOsczQ6GaEH1Mw3Udky/d4OmZE6LT6wLcx6VhM
         6sJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yrBi8/HO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr10-20020a05621423ca00b004562e7c8272si2509822qvb.425.2022.06.02.15.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yrBi8/HO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsxv-0005UP-IQ
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgm-0004d5-IH
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:08 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgj-000059-ML
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:08 -0400
Received: by mail-pf1-x42f.google.com with SMTP id bo5so5798726pfb.4
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdmw1yZnvA+hHeQ/W/SOHIyofz1vGsnPTS9QtN7as88=;
 b=yrBi8/HOIzwuYuwb3tsIBKPlLlv4ge6+TAx7ctt8P+ZhZyKbL87/APHr8HDXPfRftX
 O9ogNZKIXwn52SyHNdaoui/53O1zN3zB0V2ZRK+hxU7NtZzrNgvuSgtXiclMviy4JR8n
 k+VSn+EHwsrrbtePViwGaia+noLkrQKj9pXHfqlSvwaNObjhN9F5zPL9SzZCBgav9Xdi
 PhUCc7wDlsQ7BXEP8NSF9Rl+tvRYM0CxjrP/4vx278HnFf3Z4GRuj+lloneqSHBoZWDW
 Kh8uH+5HHn5WCDNfxTf6SZJenJTr1JI/pMboTWvnDR7IKo63CpdtOkTdlO9bOilm9Ct/
 rRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdmw1yZnvA+hHeQ/W/SOHIyofz1vGsnPTS9QtN7as88=;
 b=DWla/4n22HYOdEqLe5vnFlMiekDlvK0DbKS6IlsRd+UbP3i5yYT12V4/ES+1cfagxV
 xRToCRh+r9jH5jNjNKaW8xLTkaRb9Pmi+aXjY3C8pk79YKXzG8YIvSB/NV45Ar6qlQgA
 H5ZpbRiDJv7PWkFiPhFU600i4LCYZOwY+OPPVNrsU+XScblzl7NGzuCb8q0Qf3oIKJDd
 ACGfjAeaKl/8JeAkmDACfMbcGR8UzhCTP2QmAHf27cZ2N/XyennK3SKRGy4VdVy4DhEL
 5YwICNA7VZPQcU9yBMwucQYx4iahTAKcarVESu1ohABHR9mCMlKOPpC5txOh69f4la//
 mJVA==
X-Gm-Message-State: AOAM531a7+u4Jh6eLLfAc5SMDH/P2YUU2yrStm14pRu99yUO/jkrg+TS
 SUJzv4VqKKtzj0jcIMzV6Bx5Sg==
X-Received: by 2002:a63:91ca:0:b0:3fc:9077:c7c7 with SMTP id
 l193-20020a6391ca000000b003fc9077c7c7mr6000905pge.201.1654206543279; 
 Thu, 02 Jun 2022 14:49:03 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/71] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Thu,  2 Jun 2022 14:47:52 -0700
Message-Id: <20220602214853.496211-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZtOwj82i3G3

This function is used only once, and will need modification
for Streaming SVE mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a73f2a94c5..4dcdca918b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -189,17 +189,6 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-/**
- * aarch64_sve_zcr_get_valid_len:
- * @cpu: cpu context
- * @start_len: maximum len to consider
- *
- * Return the maximum supported sve vector length <= @start_len.
- * Note that both @start_len and the return value are in units
- * of ZCR_ELx.LEN, so the vector bit length is (x + 1) * 128.
- */
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
-
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc8f1e44cc..e84d30e5fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6222,39 +6222,31 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    start_len = MIN(start_len, ARM_MAX_VQ - 1);
-    end_len = start_len;
-
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
+    uint32_t len = cpu->sve_max_vq - 1;
+    uint32_t end_len;
 
     if (el <= 1 && !el_is_in_host(env, el)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
+    end_len = len;
+    if (!test_bit(len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, len);
+        assert(end_len < len);
+    }
+    return end_len;
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1

