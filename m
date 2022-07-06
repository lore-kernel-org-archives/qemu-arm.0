Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4570645lft;
        Wed, 6 Jul 2022 02:32:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2MX/XdtsBlHfFjn+v4D5pI9ROt4oqcsvV1gZxdWLJL0vRjrY1ZGxyPrBOzdpNql/hl2UC
X-Received: by 2002:a05:6902:1242:b0:66e:8928:e67a with SMTP id t2-20020a056902124200b0066e8928e67amr5660325ybu.384.1657099925868;
        Wed, 06 Jul 2022 02:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657099925; cv=none;
        d=google.com; s=arc-20160816;
        b=P0Bm0eGwsros9T6wTdowqvQMeo+GsNH20sfoG/bd/KYeHa0+FbcUDwgFRUY8LgvuqJ
         eeuv4YeNdZc4r9JR55Tz5j7rQLvOfeh9uy7xXkxm+gH60MaYUzroX9SjqPAsfejutZSa
         bckgwlHXoFUhxVufuqhCV4pE12iGrB0gXJKyb3rOMiLcgchh35eqbM4g1JjlZ585PlcK
         hmaDIYuothzAeObO0Be5WZsgkub0kRhC8tYpDrQ+uJlB6AEWjJIb7tMpOssXWx3EsrPT
         PsvMlUH58fj1sU375p9uX7Yai8kGpl9GHaEoneIPSz2/YELKi12biQjkbg3xBXQdlhe0
         +KtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
        b=sRzVXhPo2H3BilRxYikZ9f91RMlZsX7e2WxSRBws7YU84Ig5dEclgAUYQ2lD9SgEVI
         cnf04A3VBPzfTi8ZgLDxv+Iin6fVHnqtDocVQm7w4X1Ei5hbHUhQmGWOf6s6ZfCYKgiT
         yY9fNZKQTGIt22mPNIJXWVpe63RI8fzV5Bc0ept9hqcjpaG4LLfbjV8baM6xnSlMr/7u
         Yy3H09BpWL2nFEYxSZBlqf3WgWvmenuLcM8QPW1LCMeUBdCKGjskrvkgEAdsZrZKS2qA
         PrlU68Ng1hgi3mE3BkTqOvQmvHwkRV6xUSaVRHFpHEKEukcepFQj8T+lITjJgepZOzOR
         Rpnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELVQxAkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64-20020a255e43000000b0066e8b576124si3422744ybb.38.2022.07.06.02.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELVQxAkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91O9-0004Su-4Z
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M7-0006sO-2X
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:55 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M5-0000dg-Fe
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id z14so13505289pgh.0
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=ELVQxAkwUONMK0N33AvX6XnGRdvzFCuJTCFPymZ3//wepfj99RXyrI7OqhoxBm8rKC
 4+fZ9I2HWa00sNbxp1MygpF6Wu9/VbHjV0MtiAeTfvrfSTUkH0XDqaLQPUOGy78+oC02
 HPNBtMobtIduXpBVR4yTZaTAFINNIENbunXIhly0SPUWGDdJxvhVkN17JSII1uc50t4y
 MNZkfLV6K3dITp4/8qE0n5N3k26oLB7Bi/mhpn4Mh2/4sSPs1Mllq1n4kUoMfeuAqxGI
 UyfNSAWEK8o1NmJtBc0cwIf739datNSRB4VRwwvu/gD2jxfav5/Vh3uaFbU87LfDf19w
 YwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=6W0z3Ax3C2BddIvYkSZZDR17AVN0boNF+3lmbPIwWjjrNzpeTJGdkJXWp8PaWWlmMn
 bS08kwc6BpqS26dAvRzhq7Oh4dMVpvx+t9Ju8iCFlQWSOfJ5niYVeO62ceyTaokRXF4v
 cUASEasUu8ZkKc1clijwMEV1e0tfp3bv7Dqvl+j4pUDprsO8rh77sG5qEr22QckGrplE
 TL1/G/D8BBGXepm/zqSrwH0DAuHD2esRj4cWSX5O6dBgcNiJgtX4gd5hFswGq+xhhzot
 mpAE8l57SVJCfxEerA6mBSbzBzVKNeYyWzWaVLjd90la/i7GXaqgWB+gl2cjhu3RB3YU
 7dtw==
X-Gm-Message-State: AJIora+Osu/wIhfk1Hh1TdFtuFXuKWJNDCAu9zK5DtSLZrFiVRoMPaov
 dN+GaRSXxUtgCzCsgkqQeQ02oP9Mrl8lOPI5
X-Received: by 2002:a65:49c5:0:b0:412:6e3e:bd91 with SMTP id
 t5-20020a6549c5000000b004126e3ebd91mr7555829pgs.221.1657095952247; 
 Wed, 06 Jul 2022 01:25:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 35/45] linux-user/aarch64: Add SM bit to SVE signal context
Date: Wed,  6 Jul 2022 13:54:01 +0530
Message-Id: <20220706082411.1664825-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-TUID: L8bqFB4bG3iG

Make sure to zero the currently reserved fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7da0e36c6d..3cef2f44cf 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,8 @@ struct target_extra_context {
 struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
-    uint16_t reserved[3];
+    uint16_t flags;
+    uint16_t reserved[2];
     /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
@@ -101,6 +102,8 @@ struct target_sve_context {
 #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
     (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
 
+#define TARGET_SVE_SIG_FLAG_SM  1
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
 {
     int i, j;
 
+    memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
     __put_user(size, &sve->head.size);
     __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
+    }
 
     /* Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian store
-- 
2.34.1

