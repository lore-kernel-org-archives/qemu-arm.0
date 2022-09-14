Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5198925gdb;
        Wed, 14 Sep 2022 05:56:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ckrnFxnsXo9p/ZpsxI2lDJQ1Wkq9xLJhTWIQBiCamC2WZ63VIHq5lt4bLarIxCSJI9I6d
X-Received: by 2002:a0c:9cc2:0:b0:4ac:d5ec:cd5a with SMTP id j2-20020a0c9cc2000000b004acd5eccd5amr4917265qvf.131.1663160217768;
        Wed, 14 Sep 2022 05:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663160217; cv=none;
        d=google.com; s=arc-20160816;
        b=xYUdldIcmCzEnqNbrEDhNb7/bDgnYjzhsXdTkjABToTW+vMbW0ZPYYSRDRN6jIkS1s
         T0KLPJ8EF/mOLQGnSmS1xHmyJIqYCIJrYOLD+fUqTeRCCzSdENxaHD6/Z9FJYNDFGWK2
         yGXiRI2ZFnCL1cDpFdGpG9tKgenU/1iQx5MZ+uwiIL3qT6OyzbtI58citGbtPuHDAJSf
         7LycZwUh/RaDcJpB2KOTP9BU3NOyvE3rJK+UOsLjadDJuVWpLC40bWMCZXt4PH/+N85V
         7hVDVVrHRdZVFRfqOrDFhYB4qMk0JOutLRpYe22FStLvNmnSv++hAshSS2EauFSZlX9Q
         b1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bjUDZtR1TEqJoK1ajVIqvV6K5hZ6P+TSty5uBuxcqTk=;
        b=GF4qZlD44fqBHdRjVqT0S67enyigs4sPpqjd3zBi2H087AHXlX9he3gmfsKSMzz3eh
         XbgBe2dYJob/IpipYJM+uixPfqldQRmia2bfQBILO5LIrzxvFDadIVsC7lK3U4I98Sq0
         z0JisXBRVksABjoHH2fSIAf/FDkgTtObvfG4m0EzMlXhuF6J01ieXku6ihZcjTDNwZAr
         BZz5wsXIsH6pvAOYo5Hz0xeTtStSvXaJVnlhyl21GmntZtVM/9hUz/8bjTnZRC7/pbYh
         dC44wfuMKfHjo2mvNeLPOWivl1+MQbEGGKjydoxuGqDwIPhNApUq4y1zzam3f+XBkaoS
         zngQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8dUPC2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05622a08c300b0035ba54332absi1225574qte.520.2022.09.14.05.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8dUPC2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRwn-0000OQ-BH
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwg-0000ht-99
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwX-00008M-Re
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id k9so25355590wri.0
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bjUDZtR1TEqJoK1ajVIqvV6K5hZ6P+TSty5uBuxcqTk=;
 b=U8dUPC2tbC6DSycDksnWUdvwscrMBO1nfqhj6F0PMpeJPyv4QtQBMBbqWiVM38GSEy
 uEzjpeZHMpZ9HHT5RLoil8y0ReJvpyHjiNyydSLK7jO3MndeL8WFKnJ/ob0dHGayo1YT
 snSysGA/wY99UE16zLNRURdXrC+LImIrd3dRM2ofFauXIgAAo8tTRHyqtaYEUziymqTw
 MA2UEgoVp4Np6v4km43VaMw31lG8LMB4doi8EXIg4F7DxbyR1LJRkPQ3pP2IxW8JBwKc
 6QR5nZrgRZJCKaARDLDwgoHl8YRplt57nJPMAd1YUa+dSOwHwfPmG3bEoMsXyobGhoo4
 TzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bjUDZtR1TEqJoK1ajVIqvV6K5hZ6P+TSty5uBuxcqTk=;
 b=AafATeWx0lO6iNS4sfW6H1uEaNAAlVNSfm1Cx3Sr0wUxYOK+uw43VD1gcFcdYAZggm
 Sd/eEhNk1PyXZ6k+yjrDg7CRmPn+VhV+LLhHHgo+JK5Y6qFep5HTd9Vwb1DXu24GvHqY
 FrD4UL1o6Jrv0Uj3Q4DkmgeB233rlwL6Zh3cd+jl5NXxKuHqnxem3tNS7DpzGomI7H2N
 5aO/+GtnovW+MnOhLcSU85jMVwpe3aVh9X3Ml7v1Vcz9M/LludYfcyNBGgHqteaAg42O
 WmmpprdZaxowrATvbZXm9uyGsq97KD0Xa9eZjIAhSWqCY9mbnyg/UN9x11cjyfUNciZE
 ID9A==
X-Gm-Message-State: ACgBeo0Z0FrNQe1P1ezt3cZJxiFOh1e55WNnwch/F+fWP/W6rVJIFBgi
 lukCYSAQuD2ElSXw4o76laxm6A==
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id
 bp29-20020a5d5a9d000000b002252783d6f1mr21874077wrb.385.1663156356355; 
 Wed, 14 Sep 2022 04:52:36 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/20] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Date: Wed, 14 Sep 2022 12:52:15 +0100
Message-Id: <20220914115217.117532-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: h+q9jDC0KwpA

From: Peter Maydell <peter.maydell@linaro.org>

Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
compliant PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-11-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 811358fd0a..be7bbffe59 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -53,6 +53,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_PMUv3p5 (PMU Extensions v3.5)
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3ac5e197a7..e6314e86d2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1152,7 +1152,7 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     cpu->isar.id_aa64dfr0 = t;
 
     t = cpu->isar.id_aa64smfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b714c61d94..98b5ba2160 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -85,7 +85,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = cpu->isar.id_dfr0;
     t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
     cpu->isar.id_dfr0 = t;
 }
 
-- 
2.34.1

