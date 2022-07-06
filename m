Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4590845lft;
        Wed, 6 Jul 2022 03:06:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1suCYITLCLi6IxZPFmlM7MV8QNYZHhxrva9HeTcb8Tq9g/Uk0o9qkw1DJQ0wpgnDVxnKF7A
X-Received: by 2002:a05:620a:2847:b0:6aa:cdf8:f71e with SMTP id h7-20020a05620a284700b006aacdf8f71emr26191878qkp.598.1657101991179;
        Wed, 06 Jul 2022 03:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657101991; cv=none;
        d=google.com; s=arc-20160816;
        b=E5V0ac4WXpiZ4hY4KdrB1QWBPa+n2s7T7eLLd3bA66EwvcB3BvR3+afOKtmXlq0mn8
         6OtgwLgW8Z/8CYBHjwh6WFhkja2PEL8ednG2U/ZPAt1ErhqiAfEXvzrgy2E6H1J3zn+m
         2r6HKWfd3caar/v2TMZqRSKJ5bByjVBaEuiOdxMQM6Tl40L8KNMUVAFewvlcn/abpbdL
         LnCjImp9EJXjZTqudnBQGzu4m5/HdQLQHlxB9/HbHsnxYB3i27inmOTgqMGro5yM+R4V
         PdRvElpgUZA3a3lyKKSYfN8YAqjl0ijXw+TUxTJ533eVx+xTPEKjbTmqBBi7rE/z/tP0
         CYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
        b=KM1pDylnFgoRpsRntvTSlsCFp+Y7MdynOMGTbSJkP3RHehgBhxlsbqVLR7qT+kNC7y
         12IR81NyxNpc3vN/tErPFthdaYYlnmDW6PcZ6SgkIc7SX/GdE+AktrozTTL69M1LdpIH
         /VPecXT9FUK4zP5v+OXgT+TAa4UKlEgggilk2eEvV263kh8n1F+xFFjV8YXKWAbr1s6n
         zNKT1yQbcN/fjWMJoWIXatmVjfgGpTfWsjnS/PbaCEcnqKnKgCKG+h4XJamZHoJHU4Vd
         oDqZjEFNb/SWT0sFI3cCD4CaPzAmLAGQG9A70yoGTFw8Myk+SGOJz6Im9QRjkx35Yk1t
         eMdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aOGczq1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a05620a445000b006a6b850dc2esi26209955qkp.179.2022.07.06.03.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 03:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aOGczq1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91vS-0006ZC-Mh
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 06:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PQ-0000jI-8M
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:29:20 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PN-0001Er-Vt
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:29:19 -0400
Received: by mail-pf1-x429.google.com with SMTP id e16so969150pfm.11
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
 b=aOGczq1tt/UVP71V0gMVKd0nMKXqN+C/p5LVs6C9iwibSN388/y4P1lP67oi3eqniB
 6m9H2voeLZcxd5AUURcXYyTanWYVRhZDkFDKWB+/R1+qIeDmO/35TIQMQ/tSEX9/oz86
 YfM7ddoMNyYyFIn3z8hnvJwf3xBiFWUYgbkMT/WR/WiJgQC43GsJdBoibkVEimdJSDHB
 KZ4VzI1zDuA6PjpbHDZQYAfqpJ99wmC/dQ5Mr4TVbjsIdLOtPnDf7GOmviG3HhzjEN9A
 GN6rTXIvf0H6ofBTl+AcxMLezzkjmdRJP3l60bV2ok4cvzZgkL7RRj/sGYwa4BMDIohD
 vHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
 b=D0bs8Dd6AdxVAwJyHpqfMnVtj31MIApJAxqMkCiVXMh2kl6GIvqaCFYxxU3UEUGjm/
 OjXh8qiTGph29wMNHYM3teg57VtsxURg0bVoP6kb8M+6Tv3KwapqfzfrKL3bwYhAc299
 1K6Qg2oCi54JaUF3uHh/fFR0I774boQ1cfdVu1tvhrVwbnbDMuUkjGxiOPNM/9HBqnTv
 TijNv7PRgb6oeo43M6SCzZBRw0AWKowLqHl4ssyFyVi4jvjiy1+NVbtHsF2F1jskJtOZ
 iJ4ZmeYhPaKLngYshmK7svNQi/Lrvgfk0iTRX+kqGi/CiHTqiR87lnGdg7SycbEMnDRH
 XDvw==
X-Gm-Message-State: AJIora92A07a+ZQQObfeN6KwO+deHU9j4UEl1jarhYiDiQ38AOJKTXg5
 rTvbgh1wUu7RqFfcgodHSRkBZS1RzXPezd0E
X-Received: by 2002:a05:6a00:2356:b0:525:7c6e:1dca with SMTP id
 j22-20020a056a00235600b005257c6e1dcamr45796713pfj.28.1657096156221; 
 Wed, 06 Jul 2022 01:29:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 43/45] target/arm: Only set ZEN in reset if SVE present
Date: Wed,  6 Jul 2022 13:54:09 +0530
Message-Id: <20220706082411.1664825-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: SbyRYt4cdT2D

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9c58be8b14..9b54443843 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,11 +204,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1

