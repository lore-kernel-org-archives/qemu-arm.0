Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2454912lft;
        Sun, 3 Jul 2022 02:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vs5IpHDg83ZiniJ1hhn9dekADftEWTMnkfmDT9AZ+H9vn94edYlA/le0i8oEXbSx3YRsaE
X-Received: by 2002:a81:24c7:0:b0:314:1e60:a885 with SMTP id k190-20020a8124c7000000b003141e60a885mr27095948ywk.301.1656839998071;
        Sun, 03 Jul 2022 02:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839998; cv=none;
        d=google.com; s=arc-20160816;
        b=L9sKEnBF6ySoKrzZpUMsnO/GppXNIy3YzyKxKEKvtaA5FDbAvQKZ50ckJ0TsNgNGWt
         FJb1e3pUryZ58DD8U4RJEU9qxIbk2gV9LL8ksIJSG9dxJ33NMGLx400Jb/aKoZw5LYiL
         QZS9521glNzNK90fS05INNTFW1CThOf1Kh8fc50ejnJGKGxQitTlgY87Wta0FKpGCMmD
         BjPTzfBlKJ9Z3SCCliAx+IByvmQtEL9Yc6aMmIOp2JQVfxiB2ZGtTdX6fgMbzL7mU4xc
         rRdpqPbIvjt2/IsUwFnlMIuLiaY4qYQZH6Cd+Man9HEdgGBIDFvd0+R4pAGK08S/jqqV
         MQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vXjecf38qLWvkQbYd8UNuP/WXCTyajLWLbhxCGCynp8=;
        b=QtZaaEk9PE12beirZNWEMUCvpo1x3odjKYkGigGL1aybk8OT4Q2fjdcHEwHjsq4d8Y
         06pcQpx46hHc+RwsdSxbQHPl845IJmzmBCLFLySlVz/djUdhH8n0S6FQ0Fipf3kcZcJg
         Fj8g+H2g9ePONEo8x7wblFLEtSOGJOwZJbXo4oSExDFslQi9G0Sg3VPzhW53/wB+0k4p
         yfUmsds0ud/x829EYwxVqsLX8u1eORmAmh1wz9gcSYNDNLz8B1+wCiPqIjbdNNnUI8Io
         EGZP9a5hUEvgJPbzFubZZeSt7+GDzKqc5xO1n4eqFxNx/fbFtm60ngIhpnwz7bRIZuSb
         7w0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYIgnSva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a810508000000b0031b94c2fc45si29944644ywf.470.2022.07.03.02.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYIgnSva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vll-00079I-D9
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzb-0001XN-F4
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:15 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzZ-0006ns-Pn
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id fz10so446728pjb.2
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXjecf38qLWvkQbYd8UNuP/WXCTyajLWLbhxCGCynp8=;
 b=IYIgnSvacwaTHg4wwULPKxRTws3J4kTU5tJb+lCIqOoI7RV/TbQoYgc/OsBhlhNfJR
 9sSDc/8jEDxvsZYIEmRcaxmhibC2B2WL/rRNwxAjT3zGNGo9QSC4QNIvIThhars1o/2u
 0QZ1DAjsYLOvJDJt3P8kfVWqW3QHZBJrzsAid5u56s40SPIEAxQE4zgD2kxQ/sLNp51P
 fOzMI9f/1eiwnP6EukzwgjbYk/0r6DDQwo0rljafsMPGoQJ2PmywVYG4piEHzbV+WQS+
 NhYPf6u9otZ3I+czNgS/A787QA7a8PPqEMe3XLyIT1PPWJFFAwe2dYVnXeU7ewmJn9if
 aoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXjecf38qLWvkQbYd8UNuP/WXCTyajLWLbhxCGCynp8=;
 b=YSWKusoeOM3D1L51CbW7K9fP3IlPuhN8pG/5FSFpjC58eewCbngEeCoDTFgtM75u/b
 o+OdHHqYNqxyw1ITAd3u66Db0QCkZT4BL63WRnAn/LwBj72bhZsmWdGfWLcNjaUAc64u
 iy9jMehreCsj6LlCUhw+/Uwy0SAIEVThU/P1NEXAHEOmaiy/ThBFu3M2C5cYwMDeGvRT
 pzqsN+bENPjT1a+XalxKq6h0tzGglImd1t4OBzqlRd+Rv5h5I0S63Id6bYV8YL98N2BF
 3uNe8iQ5ZEArdMjoX0e1GM3zVCNQcTqzxdqWrbl5ACpCtfYO2AB77tJjTlxJ5xFX8xdr
 CQXw==
X-Gm-Message-State: AJIora+xZxwPc/oRwbUfEmsitqkGORKJ5Md1wXNFw+LWaCkNORyT4k7m
 DHdRwYux9dh/h3rIHDZX2JklLJXqnAWQpjWb
X-Received: by 2002:a17:902:6b0b:b0:16a:5c43:9aa6 with SMTP id
 o11-20020a1709026b0b00b0016a5c439aa6mr28885488plk.91.1656837008371; 
 Sun, 03 Jul 2022 01:30:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 53/62] target/arm: Extract HA and HD in aa64_va_parameters
Date: Sun,  3 Jul 2022 13:54:10 +0530
Message-Id: <20220703082419.770989-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: fLNm+TjRdCR5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1bbe4d950e..f2a421972e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1004,6 +1004,8 @@ typedef struct ARMVAParameters {
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 499577f24e..9aea6ad5f4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10626,7 +10626,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
 
@@ -10644,6 +10644,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10668,6 +10670,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10739,6 +10743,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha & hd,
     };
 }
 
-- 
2.34.1

