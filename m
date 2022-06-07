Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2409295lfb;
        Tue, 7 Jun 2022 13:51:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKshay9p1cS3yOnuAvtAHi1jBqqN8kBz354oCGMmyylxcQN2fe2rh70HXzD5uJlGpPcK8l
X-Received: by 2002:a05:620a:424a:b0:67e:8860:55b7 with SMTP id w10-20020a05620a424a00b0067e886055b7mr21129704qko.26.1654635068388;
        Tue, 07 Jun 2022 13:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635068; cv=none;
        d=google.com; s=arc-20160816;
        b=NrwktVOWl6Lv6X+f1jJLfpRPClkFUoE0Cz4bV2Lf3oZ/HCV/xMh68cWxV1//ETKP1s
         Sb4SeybkMKOmtZz7jfvMK68e5kLg1xHwwInr8PYoJpvdsutFJJOw78JTrXmqXlHi7Wpt
         Z8DNb/f+xc9/Vn9/Qvyj94DeMK5p9Ki0OrG8tIj4TbSSB/mdKW2P/b4m7JyA9Wn2L1lC
         mciCI99/uBmlZ+nrpqf3BPgIRng8p5pK4Je18F4fsayPm43EZx5u9y5w+LiQG57CCTHX
         VcqQB70ytSVRpqeBY2TblwaNSl8x1pp4xFckeBcuF249KS7AO4dPWpSKxGGXgRwQtSNu
         o8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
        b=uJvWC4a1P87dXN9yT0oKwFnv6Ai1MOk64U4CK3zMhjkNI+kWyWvtThJRFH7/ec2XUY
         XCQwNd/wjy3VUgJPnRrS1UJ7xgG/y9LH2ZZIOc7RLx6HaCrvBmyRa58vfiqBOFx7mQ95
         vNzuqSsWNMM/JwUDdnjv1KaNdcX+dZcVMYSG5DK8K6m4jvcPAUFUzIX6BDhPGkhVjONz
         gKzhaJe99X1abCSsWgVPFTVzbHTOQ6Uykuc/DrjpkKGhQFxnuBUGVdKc05S+RGj3VgdP
         Isl0mcoBL+vSJthL2spSszrNTs8+w3Ro0iYUxHwTWOuNISJ2YOQsTCXxjlZEb3/Ex06m
         cniA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ydQEcJ8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020a05620a01e800b006a69637f15esi529592qkn.433.2022.06.07.13.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ydQEcJ8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygAN-0007AS-SE
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftL-0007ns-0p
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:31 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftE-0007ER-M9
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: by mail-pg1-x531.google.com with SMTP id c14so16914111pgu.13
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=ydQEcJ8kR/nWHdKxUHvA1eS0cLEJux68nK0R87iL0PFiG7n7QFk9S9l0itLuX2T1/2
 AWMm0ytL0I8Y5KtokC03ywP3To38aHqkgrRA92Rl94cgpiGybaB1WsjwTW1eoQh3R8zf
 5Az2plQ5GnFHO8USy3h/zxtM9mzSTT1JeJ5iyz7WwGtZx4xB0HLQCRh38RlEblTRCIQ7
 VC51k9yiw5Vy1kD3MovaTsZ6obeuBqhBHh2XmkFOiHqd3WYDrZx1Ayw8tUVtKFmcGJWS
 GcWTlcB3vHCG/sdLUv00mIc6TDgRGoCfVV60R5F4ICK3ibY29GP3DbYWq0xO5TJEg0th
 5PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=uk1EtzRi12mN3q8o+Mrdfm+cHfSOMWfGfoafDeInMBmuKSYvX2f6xJ+Vkkl8p6+AaZ
 OmyfddVOMmY1Y12DHTI8p6NqxsR6L3fzkZc4K+cQd18HcvFAg9Sivzr80ZK0y4EIvkgD
 uyCciy1FcmJDcfV4NOS8sr27ARIVvUfXwdxm5FyJRwdWt6W3ZZ7UlpW0wqecypLjgXr5
 9C+XRqv/BQbNgqFrLF7rhLYNhrL/J2aOM5Tg7o9xRrc4oJHl8jNJK7l9QdT12cEJ72rs
 54PtbKUxOX3twP4FIf3iscwyqd4WU6ZxyRxQHrZG2LakirmpUlCIwfImyRoqhOCEqlob
 CPBA==
X-Gm-Message-State: AOAM530F8K9be3NXG2PoNtgyDZuOkKQiiO2HKSljLGjr47NvmUl56Du3
 DKh7P8Kd2RrbeasCo6ZwhW/HnQ==
X-Received: by 2002:a63:6c81:0:b0:3fd:4be3:8ee9 with SMTP id
 h123-20020a636c81000000b003fd4be38ee9mr17866421pgc.188.1654634003931; 
 Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 18/71] target/arm: Export bfdotadd from vec_helper.c
Date: Tue,  7 Jun 2022 13:32:13 -0700
Message-Id: <20220607203306.657998-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: h7GFZRAKOOGZ

We will need this over in sme_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 13 +++++++++++++
 target/arm/vec_helper.c   |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 1d527fadac..1f4ed80ff7 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -230,4 +230,17 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
+/**
+ * bfdotadd:
+ * @sum: addend
+ * @e1, @e2: multiplicand vectors
+ *
+ * BFloat16 2-way dot product of @e1 & @e2, accumulating with @sum.
+ * The @e1 and @e2 operands correspond to the 32-bit source vector
+ * slots and contain two Bfloat16 values each.
+ *
+ * Corresponds to the ARM pseudocode function BFDotAdd.
+ */
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 26c373e522..9a9c034e36 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2557,7 +2557,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
  * BFloat16 Dot Product
  */
 
-static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
 {
     /* FPCR is ignored for BFDOT and BFMMLA. */
     float_status bf_status = {
-- 
2.34.1

