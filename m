Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1307177lfj;
        Thu, 5 May 2022 12:29:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvXvGUMmLv18XiW+G//LSPZwZSwmqQVX4rdM4X1G+e4sgt4SzzSfEUc6fryTjXAMLXLwGi
X-Received: by 2002:ac8:5bc3:0:b0:2f3:c0e0:f778 with SMTP id b3-20020ac85bc3000000b002f3c0e0f778mr2615053qtb.271.1651778968508;
        Thu, 05 May 2022 12:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778968; cv=none;
        d=google.com; s=arc-20160816;
        b=w2Y9Ag8JbsWTgVCeX+DA3T3N0m+47WAVlVlSc0XT5du9rnCK2UmJA3iWyLEv29yF/m
         6p13sFmBGCsfgPvcGqMaqDcHTQb8dzgvTnw+yh26+QdK+ddnRjHwRMYfWE1KrEHVq7I4
         ihODNZdPKmrdoiXBYj6dkV8Ruu/jiLjCm72YIEnshVVSHrIJkuaTk81BWjSHDcjxQcRS
         325v4NTwswKgww7eRVZquY8DSMfczAt1iqxQ7HTKgvfKHKqLIZs44Ibbu3acjtEwdUIj
         jAyiuyXfQ9FgvBoRiqJgPFpJUesmCjg6Xkg8wWim/MgAgGbzfGxsggtl9sk0rnUV+4jx
         NpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
        b=iZnrOmbg9GSvOJTRrilJM+qyJNvMu6nSBkfwvi3VWvE9MH+dcwFjAaOS6Hh7y9hu/J
         MlIcOHs5aqKoSgxdmQ0+3M6WMZLwzSijutyMjXIS88UnP4FPHksE/MqlrePZ9ATs7RD5
         caxOsmV6uLzT1DNzF9DZ3+5ay1niW8JlVWeWG42XCBC8Ag2M6qYJ8uMD6+qZOenMfEbM
         NF+jKMQI9HjV7FvWxi6fUgiAYVHiFx3PcRb7uFZIAKMvai/0vEQ5wEFP82GKDraxfQfr
         K7FlVUdKdROWWX86YGWIXAnRSaMQU5Pdw9s3EC3TAzXoVQ000ba8I33ukKCIh0Jx0sHz
         wS7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODboB47e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05621412a600b00443dc39dd06si1181234qvu.395.2022.05.05.12.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODboB47e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhAF-0001uo-WB
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYc-0002yc-6e
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:34 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYY-0004Ud-6Z
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:33 -0400
Received: by mail-oi1-x231.google.com with SMTP id m25so5264230oih.2
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=ODboB47elzHbFGhqcg3AWVleBGCY8jjgBT2XBluDCsb4CY5egSXZAeNdoADIEghqIL
 27MGi7uN1bBPtJ4xTnR+ZkyqptQ5F7Li/wUQgfJ4JS00c9rRKzu1nMLU4nzEB28Bd+5m
 g+ta7mK9ddGHEy6vJHxJImHMnNJVIPFhMMsMPUkXh7LP7Bw+smN+p6XPJBdin6LB0akK
 22uSiMKA2vdpjtMF20GaorvVm4Dv0pT5unWL7KgTLTvVW5IcpMwZpjk5p391yMd+qKaY
 0Ak0ZrYnLQwaqVtHOzwaRX1O5aHDWrk8JvEehMeIS5jpme+Cvhycp3Ye4Krby4cD2nyR
 tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=8BpZBAA3HABz5m3V9Ln9t8YlFWxucgmE0CnQvhzy09nU2AUjLmkB6pAqtrlNt2Gm/H
 o73G5U+VCXMQ4rwAwpi1tq9u/xrvoy2VluPGYWFE57gSY+wc5UMEPIyeoOPWaIaHL2Hu
 7+fYexdSqstCNu4NZl80whsbiz6Ev7HB0SGNPDtK6HbkpWnXdlMtq+bFV6cns3qnMcmJ
 HjQfo/GZI0hiVRO/ChirdM2QAeuuzW9suRdJlZF8sojq195xyQDLSE3jAylyxF6tsTRu
 i0mlC85epJgzquEhjKoHY809wA16ZuBuoi7dAWeWWnRL1iVLlUJ9x7aghmJ+SJAOf21f
 h63Q==
X-Gm-Message-State: AOAM531906nIxEOhraUbPhdvgoUpv+C++IhQOfBIF63o7jeGY4xcVoCC
 YpjvdezYYPU6E5k3Lu1Ghj6KzrvgYTNwFfBD
X-Received: by 2002:a05:6808:124f:b0:321:855d:5b19 with SMTP id
 o15-20020a056808124f00b00321855d5b19mr3304292oiv.30.1651776629041; 
 Thu, 05 May 2022 11:50:29 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 14/24] target/arm: Enable SCR and HCR bits for RAS
Date: Thu,  5 May 2022 13:49:56 -0500
Message-Id: <20220505185006.200555-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
X-TUID: ZE0iubF76tA4

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37c5e42bc0..b6faebf4a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1769,6 +1772,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5126,6 +5132,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.34.1

