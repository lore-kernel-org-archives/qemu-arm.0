Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp629745lft;
        Mon, 20 Jun 2022 11:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uSAkaqsrCZtya1WVb+L+WSWWjrH47EtG3Whlqbwv1zmOL6kmihW6rPFGhU1XeMyyq5XAR5
X-Received: by 2002:ac8:5803:0:b0:305:2f14:269a with SMTP id g3-20020ac85803000000b003052f14269amr21076716qtg.290.1655751521384;
        Mon, 20 Jun 2022 11:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655751521; cv=none;
        d=google.com; s=arc-20160816;
        b=lFjsGJLyREumjzy9D5qhpgxfkHs+8XZp7Iuv/e42cABV6vbCfG1TUtAUSbrvarZKIg
         7VlTpWVvlWEoBAJ6eixGMQiqVU0IqTTsEuMH3fC/iLpX66uVz8nqbZ2o5yR3Vqxzf74v
         Gg7xCVGFh5m2Hy/6Rv4evTzltu5+CptLG/wCMy54PsDKNltvar1f8kX/wZkJ6z3SWefk
         apkegR4b6cBfGQekIjT9KDNT321YgFvGy+vWqkLIE38iYsd6NmbnoaU3xdLqwM3vGTNB
         /pPKP77uQmGRykXm3gx+xWSlTgAMjcQnOi0za5wxlAl1JeyuK6dmBB1ksohD5jlu0qku
         U4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
        b=KRXZyAg/6GyhhpADm/lms+9nPONsNZJb37IYnyWjsh1Fqy8EOeVzxSE0VWTUqn53h1
         TgURK2pxzNBMmMDIRY7bHJizn4T8B1iU7G0u2MYZ/jI/h0hmFwMf4q/SIUNfk/DKam3/
         0vynkcayufN3hqcKa2ooaKdiIWmKUjib+MllAZ+TqsyqzS73B6psOKo7WYfG1fy/c2pi
         6dQ0clTyr7CC4ax4sr/fqvHbFKrCYrw4D8y/etF37IF7+knU3c9bCai340ETHm4RwvgD
         U9uZPHxGlgSP9/lE4uF+VkxhIu1tz0dEazH4V3LecCHsLqgx+RfK0Nl9AxtgopUGfKKx
         k/0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gkt5/kSJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf7-20020a0562142a4700b0047034825b39si4815314qvb.346.2022.06.20.11.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gkt5/kSJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Mbg-0007OR-Qg
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdU-0002wc-A0
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:29 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdO-000237-BA
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:25 -0400
Received: by mail-pg1-x532.google.com with SMTP id h192so10903987pgc.4
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=gkt5/kSJZ0gFBHQ0oNSnpk2jSqZcFw/BdcwRL0CRZnkTyd8dHafTXchy+lcB++L2xK
 C7Map+Fg3L8X2a9Jg2Xkt9Hcpox4iRNHmGBf68JmtgpDgVph/VR/z60OzjnIBCgFbPi8
 om1gtsg398AMQcH38EtXXtU1ATQTNaf0A04r7HB78FDiUN2HJcsINph4J5X1UICas8Gf
 KlYXk2ZrTSkg0vo0tyYIURp7L/MCfpsCQppaVrmrGffrjeGGEG+AMHY61HDrafSts2ld
 HXHPTW33oemBQAX5HH76tpAJgrUGxKEYsq01/H70QGbkIhBwy6tQRst6c60vCHxytws5
 PA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=HjMCjmP7hbn5A8vhzS1jFNkLQmBKYX2Oz7R6rZA0iD+FPNP8t/pHOAYjh55UC8XNyV
 IxCjRpr7xIoN6oy59dseY7JsjrtKHqpXmknEyFH9F4PZ+sUDr4jtrzq3PB8xVOhOeeU5
 Evouf4B0k8uY0S09LlC5yKTiGLJopNZqBsY4yP7EkpceUG5Jur+jzkZ8W6yMi02AMTZN
 uq5XHhuEjhzGLpAdL8gBcoJr37aUg5C0E7QxVWOpMDBJRmUEy6mj60Qdq0RlM4+KgR23
 zV3jUF/k5CHgVZwbW1UG0G3JtamLDAitcNPw5tfYQr0JDz7NGmeCqvJmGf+NJkH2hCsf
 44aQ==
X-Gm-Message-State: AJIora8Ev+zJ/hBOOtQscSPTybdFQYajsI8M5rY4ubkSE3e+TUJTBTXW
 9JioAbQHi3k51NmxlhGaWEnCJw==
X-Received: by 2002:a05:6a00:13a3:b0:51b:d440:b047 with SMTP id
 t35-20020a056a0013a300b0051bd440b047mr25675865pfg.54.1655747780399; 
 Mon, 20 Jun 2022 10:56:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 50/51] target/arm: Enable SME for user-only
Date: Mon, 20 Jun 2022 10:52:34 -0700
Message-Id: <20220620175235.60881-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EcM6xdCBJWaH

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

