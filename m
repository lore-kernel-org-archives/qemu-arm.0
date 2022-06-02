Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5231981lfh;
        Thu, 2 Jun 2022 16:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy8FKfTUaxXeyYrZOZSr7IZJxM+9qyjbSfDqBYRZ5TayTKyzLqglXhijQ6HNTDQtXNXtAW
X-Received: by 2002:a05:620a:1712:b0:6a3:abba:697a with SMTP id az18-20020a05620a171200b006a3abba697amr4877861qkb.149.1654211267577;
        Thu, 02 Jun 2022 16:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654211267; cv=none;
        d=google.com; s=arc-20160816;
        b=wJbj5Jp/rhg9vCl5YW1lCygihZ9RP/i62kThexo4ls7RKBq+J3tFOmCqaa6IqkvNBM
         rkTLKtzpxtlK93vmR09WDvsxV2PrwQCuIYUAzD0EN5Pup3vysYCDxdMx5tbosXf/bpr5
         f4NdEUSiSfa1xvb4uLSSMHwqZp1voqgexKoOpN3fDkMoTWTKRo7V4y8yW/mL45ABI7oo
         mHxykx9EYELeSfPPo7nqoZ4Uk55Lsp+4v5+qljlZ0gftz/t3cba01wzrmo/mqKnP9P6q
         z5aMMhKbb8N/sS66jfcpND6nw5BBJRhS1KHQ0EMnXiaWNWUDcoe4nuplxS5Iz52N1AH0
         5pFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
        b=P5LY2J/kGGIQwF2I1c8/aI81svCvb2YnaOIWpDwx7nVnRy75bxLrz3NRapP+9xLuwQ
         XCSQIzE73fapUDrA2bhOBpaqzCQV9PaJ1X6ag9WFHBg0niONB9SZ2Z+ru3/JzooQuATK
         0Kh1cyN2bFxe4YJjSVvoSaxpC+TPrrhA76a7TAARwxHM91Ay53FQAKr9qtlI9L3t3C2f
         HL/t4fGtnx4gwG5YIbDNVnioBecXGdxyy/b6wxFT8a26EGuLLIyG9DN3+yudtoKfUcwP
         C2Fjnfue0JaDqZ92lPK8VBMZnOtuvsmC4Wn9CzaOadHGVV7hCyAgUnTmoYv6awgTLnT8
         Dfwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v6AINVzx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020ac85bd4000000b002f9455d89d3si2837958qtb.722.2022.06.02.16.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 16:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v6AINVzx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtut-0004cJ-4X
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 19:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskU-0001ix-DE
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskS-00010v-UP
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id cx11so6034632pjb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=v6AINVzxBuJPljN/SysCtACzcHObWIaQO/X+pGee1QnopmaCe3p5t9C7TyYxo/430a
 B22A9xXPylrX881YI2Lg8+5/maCylodRbB7gvIHVtQcR1d/MhbROzR3OQz0vjNSwk1DM
 ppVMhErMuvxMLZVXcyQjv5TM0GmGwU7DxieiiPnArQfl3OFjEf2gmygiUjeap7NcskJI
 mCBkVkoZqz3dNftQ/euOXYy8cgKm7IIP5hFR/raHzv7wSQMZlaYmgjuATqvsEqZSk1lt
 Bhl6dC1CBaGHPMExbvNiS/F0re/x66E9y6iM2g2SvhyuRHyWVMIVYBhpW0AQ2l74wYGY
 xR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=MdIMFdoso2pFWsRRYHs74KdoAKV+yg2H3nRhVT7EyBbHB7LKSi7wA+cPHBLYJFBIK+
 R9ioHgzBqILyBbfS3W0J2fC5UQdmdkTOXOv9ilQGqGrcklfk/4tNibqaoqioU/3gQrUs
 XdOI3W1cgAGJ9q8r/tq36mD9lKpYoXLvstFztJqmmwADPSfMZEGlXonIvsPWBQco4b+n
 9u0B2V7YYJfbFayPgUdzMLdYM60Wj2D7pzoXMV/ZISjmqc35oSx63vF/DS3Kx4vkWQIc
 4jTLcYq/PZgd2h8jEmN4HydD01P6nggBo6d12c/L8ufac8Ks7oGaQcWTNx2uEGmVs7nw
 rOgA==
X-Gm-Message-State: AOAM531uhOHpv/LyVFM8IiCp4hxcBtjb+IrHjqDWg6aXOHMSUCxsO46E
 uPR5SQqlXHY3+NVjhbzBRmD6Zf5HF9dwwg==
X-Received: by 2002:a17:902:7004:b0:161:f216:4f3f with SMTP id
 y4-20020a170902700400b00161f2164f3fmr6965131plk.98.1654206775691; 
 Thu, 02 Jun 2022 14:52:55 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 70/71] target/arm: Enable SME for user-only
Date: Thu,  2 Jun 2022 14:48:52 -0700
Message-Id: <20220602214853.496211-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: DimmwE/31aDw

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cb9f9f02c..13b008547e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.34.1

