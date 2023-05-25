Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788014ejb;
        Thu, 25 May 2023 16:27:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76v9HChiVD/2E/FLlhoFi9bZOxSOfg9v9dZliXY8TSYwxibExZi67/u/BtdoxgqvzTehjW
X-Received: by 2002:a05:620a:27d1:b0:75c:9b36:4aac with SMTP id i17-20020a05620a27d100b0075c9b364aacmr4364094qkp.17.1685057228359;
        Thu, 25 May 2023 16:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057228; cv=none;
        d=google.com; s=arc-20160816;
        b=exQSlRicCdyypISyLEr7UGY9ONlN3rflLhj6Ek7Tat/xFF4c488AaXwGkXOsrReqSq
         kGay4wUeFmXlVrIFQA7KAA8ZfLvbQgrHAvOsrrd628Z6jIHrhqkKVujVtVevRj735GQ1
         RPtkOW+tYig43vKPYMzJxU/k2fSyLIh9u5cYBBJlc9xRqjjBRdwCFI8qN1r1Kp+KCEFA
         oFXFyZZQXBmTdPmycU83ethar8MoAqDjZvVM16QkomSuil952/x8lUxENL/6uV/H+bH9
         hVaA3fT1yqts291WWIw/yBajWX3I/8TNMcuYNvlixcY6BEVYHbGUIaRrvBsQDYt7uWUt
         u7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5jZpc4ui8pytrAOHBcN47e2TS8aNKppKYujWBst2xkI=;
        b=y7RxAXPErRhSylKjWitummZoaFv7d5LCGo0X/ZCSkBPOF4khBFkfmNzN8M8rKiA5wp
         FRqH1zew5/xilXAR8F/Il3FVrxXxLlHPlK6nryqLjqvjcBSVne7LcGJ7MmSlqYVuOt3A
         ZQt1ZeVK4N32xVzsPvvSFZ27C8z3+4Fi1NMBY9AqVeuoFTJj9DgnNGge71/8d1PyGPAh
         NZZcS5v7PjY9N342pfLj9lOJewhVcXf61Ng675KajS88Z/rssO0lGz7k76TdpeHNiCX2
         k7AmU8BJSf3zwKEerey7D1fDKsJnFgcKwVxVVOUgACLbPBNtUd7pgIhbY7eHosE2laPw
         S6fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3VNenc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi42-20020a05620a37aa00b0075b299b1980si936293qkn.384.2023.05.25.16.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3VNenc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2KLm-00062W-8k; Thu, 25 May 2023 19:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLd-0005v1-EY
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:24 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLX-0005q8-FS
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5289cf35eeaso1154895a12.1
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057174; x=1687649174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jZpc4ui8pytrAOHBcN47e2TS8aNKppKYujWBst2xkI=;
 b=a3VNenc59ZwfkPdbQlygo1lA3JV7RStXarxjq1Ev7kG684eT2geLvMt3sFkPjct1uJ
 M6C22JdR957+IM9U5p8xuYvppADAxuMJrBH5B5So4OIrQgsz5XuTN3YOByKsWFB1UOEY
 3pop/LsJqfcI9e6Nuz7N27blfei3Qde6gsmVOP8bguhnj+yvkt0Ao2ZdUmHq3J2nkist
 KsxgNFglI3vAfljj580x9bPwGDMv6ii33sdux/ubji6lV0HFKDs3QoMspUPNjBEzx3Wp
 HVORmL6LlDgXkXcLzKkEA5Mx2fRQW8eAetL9YxtL12pVvIkaCY5nSuM9O+Iv76oNIquK
 0NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057174; x=1687649174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jZpc4ui8pytrAOHBcN47e2TS8aNKppKYujWBst2xkI=;
 b=Hz62MuniD9UhbNZcgPY8I+IT2Ow53zdPE8j63n+eMXtOxGpGMTHqsBDMq34acH0RBh
 Uaj3x4DWPufoC3a6tQt45TCmkwiz3if70VgjEhLcMoFZiQ1TBcQDlQco/JeH7ZQ4iJ3t
 NlpUyFldfMPAOw7/P1y6Z+OpuEB+tmBSG+buvfTCuHjC2m0xarcrIAEaP4o8bHTHwfVh
 Zfb3vmDcDoNz7hRmy/sDy3z7xrJff9x2fFPgkUvGqgxCT5fA7S/x8TZULqB52o/ZIR2b
 8IICswUJ4f5+7VdgnTuEYaff0iw4DfAgnds/O026/r2Etox9qb3ljHR8Onsxaj8x775N
 06zw==
X-Gm-Message-State: AC+VfDyGaR+NgdnTS3OxI2qEa6+TTX4+hN78vrgQSP8np5M6iZ47/UJK
 agI420B5kjaqAnBDuV4DB8aHvQrFcpFMiVCndm4=
X-Received: by 2002:a17:902:7289:b0:1af:bfb0:e80b with SMTP id
 d9-20020a170902728900b001afbfb0e80bmr2945900pll.31.1685057174029; 
 Thu, 25 May 2023 16:26:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 18/20] tests/tcg/aarch64: Use stz2g in mte-7.c
Date: Thu, 25 May 2023 16:25:56 -0700
Message-Id: <20230525232558.1758967-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9WH6OQg1i+9n

We have many other instances of stg in the testsuite;
change these to provide an instance of stz2g.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-7.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
index a981de62d4..04974f9ebb 100644
--- a/tests/tcg/aarch64/mte-7.c
+++ b/tests/tcg/aarch64/mte-7.c
@@ -19,8 +19,7 @@ int main(int ac, char **av)
     p = (void *)((unsigned long)p | (1ul << 56));
 
     /* Store tag in sequential granules. */
-    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
-    asm("stg %0, [%0]" : : "r"(p + 0x1000));
+    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
 
     /*
      * Perform an unaligned store with tag 1 crossing the pages.
-- 
2.34.1

