Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp908236ejc;
        Mon, 22 Aug 2022 06:24:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5b4ipoaXEXA+Q7mkdkVGgISryKsjMqv3utRbfjj44mjCsHsGoGgpAwqRKZma/Gp7C7m406
X-Received: by 2002:a05:6214:aca:b0:496:eb80:e420 with SMTP id g10-20020a0562140aca00b00496eb80e420mr2122020qvi.22.1661174664451;
        Mon, 22 Aug 2022 06:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661174664; cv=none;
        d=google.com; s=arc-20160816;
        b=ZceXQwOxcRHGvZ9xyM1jDhxC1maDw8HeMamFhSrybT6sR0EWxw2BoRiUR7I5Sdfksd
         0lKH8otY5EYX7lbEwIazIL4FFQ4ZpX/2+eqrVjRyoDLzFjvXrS8P03Wi4Ds/LYXCNtOK
         RNQKiIF+ZsYDqxTiKVfyOyD/5CpmMqek8oTLT11Q2r2+Yq6IRKttrzBospG5sbp4pzJW
         GvUpBxDrL3/Tysk051+zEM0IngdxLTOH9BYz5gWfPdfg8FwLpmspM5RmEhD0wnArp4o7
         Qq62QoicLYGmDSOTiOhfOgiAXJaP6g9lriY9YqSHz1sNJFWca5buQz8WKkhPsTGrNNDU
         uS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6876aucf7V//qP9FMCQSiTLY5Lo8nlXr95EXwywYwmM=;
        b=APrrxpAOR/f3NVrGMTB0mmlkEd3T+JqX5Pc9eWVXIBN7PpJxUv24DmOREmtdUku79C
         sSz2jszXwTB1oP3CLpNKsPWa5t/G20GuvWec1mKqJ7hBDEu2al/kSwhU/Nxv5uhPKDFP
         rDqHfehgsyEFUNHW0FhnUf43fdCJbEbant1KfpUxCt/PVYFZLIWc5KW6c2iecSrIzu8V
         ENDeqEBCyKBLZOPPzqJ1t5eJo76md9BoME8FxssKB9FLh3oF7KZCpbSQWY+JCXz/CF3U
         Wo2px5aFYp+b5Rr9pSNhg3lSB5A1DXEMl2Om/ZCwjFpoI01ZItA2hT2TwwIvSEJ6qNig
         YQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hmp1kUo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020ad4574e000000b00476858db2f9si4690530qvx.308.2022.08.22.06.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hmp1kUo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7Pj-0005ts-HS
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PR-0005qh-JD
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PP-0001e2-VC
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id u5so5391821wrt.11
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6876aucf7V//qP9FMCQSiTLY5Lo8nlXr95EXwywYwmM=;
 b=hmp1kUo1DEBShuQMVFNeOqYPCUGGpHyJ4O5vqoau1rHR1XqfL3Lo1cZbkhFmPP4Ief
 w9mWytI8QPceKENwe6qRHLok5zw1QRvA3iDR1Tw1NnpGtN6qm43EdLPmQ7ZXQdu3T8ez
 95t5XZ72Os4DuGPqpv07SJFtmiIWH/SacE6pKY71pfY3SwR5TyWyaUCLmBPTgAf+I8bg
 T7sSY5mSMJZsqddTxTTQLSp3AT0Jq0tyEgvM/VbAV175lLco9jHczsvU65VBn7IwelYf
 7dOeo4Nq8sNa0dWmOfdgTlJ+MCTlVNAxd1FuEStFQ9GwuhWmZVvjspA+6CipL7WMYwTf
 24SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6876aucf7V//qP9FMCQSiTLY5Lo8nlXr95EXwywYwmM=;
 b=EmWAORkzzt5Si7XTI4bmV0QFRmQ4PwZdR+1mjjfta743QWYOlJPTEVFXQ3SXtuqY/o
 ijNW/aHYVO1sGNc+qGqZ6XKTCR44cdxnHkC4V11W2aK2MvY8GH82qs4hLqBEOs8b89w6
 Kmy+4ox1JZUnjgoGwimLf9k2H80g75SCSQ/bnqW1W8bX1elpvLLbcOZozkJWN2QOQXZb
 +6j8+IRRy0AhA21VtEFUxEgFY8+32brxnqK9fvNtFH+evmon28AOX0Y6XNMez8GSfg6w
 El0Dl5jW+tY9RKP4/64HPjZtLBb/WfzcXVW5xBXEYXG1x6pcGghJkSxQehuX4FtCtVmu
 EsYQ==
X-Gm-Message-State: ACgBeo3v2J/c4jhF9fqZxCVoBdI3D/vzIh4UC5achAoo+zwv9lI8Dhv8
 YyEQfKLF0vbAITz5HW0JXeTVCJbs5VuPMA==
X-Received: by 2002:a5d:4ad2:0:b0:225:285e:3ec1 with SMTP id
 y18-20020a5d4ad2000000b00225285e3ec1mr10865744wrs.24.1661174642608; 
 Mon, 22 Aug 2022 06:24:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 02/10] target/arm: Correct value returned by
 pmu_counter_mask()
Date: Mon, 22 Aug 2022 14:23:50 +0100
Message-Id: <20220822132358.3524971-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: apsLXdE4CLRD

pmu_counter_mask() accidentally returns a value with bits [63:32]
set, because the expression it returns is evaluated as a signed value
that gets sign-extended to 64 bits.  Force the whole expression to be
evaluated with 64-bit arithmetic with ULL suffixes.

The main effect of this bug was that a guest could write to the bits
in the high half of registers like PMCNTENSET_EL0 that are supposed
to be RES0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b8fefdff675..83526166de0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1296,7 +1296,7 @@ static inline uint32_t pmu_num_counters(CPUARMState *env)
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 static inline uint64_t pmu_counter_mask(CPUARMState *env)
 {
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+  return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
 }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1

