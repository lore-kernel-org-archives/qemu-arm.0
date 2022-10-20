Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp646669ejn;
        Thu, 20 Oct 2022 15:43:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Q41AwjHhhLGNXQQnV+dMRuSNU9vfPbtv8NnTET5vdNNyZ3unUw2z7tFvtDWmrRbjOV2E/
X-Received: by 2002:ac8:7f53:0:b0:39c:f1ee:a04d with SMTP id g19-20020ac87f53000000b0039cf1eea04dmr13430030qtk.552.1666305834866;
        Thu, 20 Oct 2022 15:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305834; cv=none;
        d=google.com; s=arc-20160816;
        b=HiOnwqdR60OyMTHUopnSA7YzJYLupOzCQ66C5JNB8L4gk3nrXXdsn40vq/AmGeafMv
         7qUwD2zsu7WJ+htg+/AsvF/IpXwFXwiKOuWrAjTbDqSBDs21dbkEDdyU1WyiOOaoOX9G
         kTCbPqzbm+V19j7hKFNRUDWcNHMLwjE4VLYdEp3RLo0SKPR49DOSdZWvh+Ps3t0eRUpv
         Fy5uz6VOuBuZT17sy31JLn/2Nu4BF+3ma1jfZILg7oFopAGV7YJmlADQ2BgS0gc906q1
         SehZj7GLR61SbjXXd23Yss05MZGu57tyGqIdfZvmc+J+jPrMilJex84Boat+Am1kG7+W
         DMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
        b=lmh7MyNq09SCeSemumGwl7vz65hQSvbW9F/qDKrW6yHUFA7/p8pEZhazHIl0j6yZi5
         ROIzGvZ9JayafWRxNh4qYcbbUtAN+wyufzsCKjWYl+QinctbjC1iehkk+pEaV9qKaKnB
         a4Jb9Nwlj4/cX/ducCc6Kqc8vsQdsN54qrlB8WFBiWqnwlq7IAHAEqbtpO4R/G7jVSSw
         0iQ5hqVkaaCQi32ICvQyaCXiaG1If50AngcSMxUPGi6RbHS0M/vLh8LaE8OVBV8Pc10f
         cLVXj+rOt1WA04yzN6+N/61xFSr/EZfLwwy6nrvL4BLcnVb9wyn1eD6vWEve04kCUzQv
         yWqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGm0TCyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm36-20020a05620a19a400b006e67762cb20si12385108qkb.19.2022.10.20.15.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGm0TCyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleGX-0006Jm-Ih
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:43:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ole9i-0006Z7-OV
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9a-0006KK-C6
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9Y-00010B-Fz
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so1069020pjb.2
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=pGm0TCySJCvXa2I87LP17uizdIRBbscuIK/ASFGTrfMzYhlXEmBit2H2iq47cL0PkH
 qjTYVmutOmPxd+quHE2e8cuOoh/hOWIrED60wwIfQ2y2yHJLKpA04tC0HUQJ+wdlc9vE
 Gafk03Qus3oJmPhNAyWngpWwPsziem0yo8Py0xO7x1bki8lo+nY18tH+1JAdSJMvdqyV
 9L4U3CFsAhRVXItkbePU1g5rKGdJodyTbcw7123tbKgzr6+rSvtaMSXzfQ1n4zBuaR8N
 J0883tcmatOKZgYMxFLPi2robmYY88FY7N9Hba6wTzXCdI3rNBj+9ElgA3HKBlGiXXQh
 yV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=7bl6FzYu4bPzn7Y2eKwgmlq0dJf4+hxms+7tktiv3dRngR60JtOJOFr+6S1ziYNzte
 b3dwfnTl0GuynEtZJvs9VMpiYGEpuG9Q1kuLr/D+w91zBiV3ttmUBGVm5sHeuaer3LRQ
 izCsg9JGIi2q86d3cqjHvIHaTJ0Fa7Ksj8getQLtZReKz64VHRU2l2q5rlchO99C1Hmt
 bVdk2uLFixUusiw6PoZMXb6cwt8txZ4baS9Paej1XJpV9D+2ShRC05Lg+RDemCx0MoH1
 plm6c+0EKxsIJG/zbyWHgiImGlmfe1QCniifgu+ndvg/JG8T3R3T76m1v4ZZjz79u3TB
 iwmg==
X-Gm-Message-State: ACrzQf2y1oaIQ5L9yYRsPRITFNW/m5EnePHFZgfNrdLFrFNMRqsXZu6w
 qJvrNTLLCm+TRDptNiIfUsTUDQ==
X-Received: by 2002:a17:902:d486:b0:181:33f0:f60b with SMTP id
 c6-20020a170902d48600b0018133f0f60bmr16515733plg.174.1666305399160; 
 Thu, 20 Oct 2022 15:36:39 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 04/14] target/arm: Extract HA and HD in aa64_va_parameters
Date: Fri, 21 Oct 2022 08:35:38 +1000
Message-Id: <20221020223548.2310496-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hn1zdUQ+HN5l

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b6889073d..16d7989604 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1046,6 +1046,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cbfaabbc09..6c7a8beed6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10470,7 +10470,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10489,6 +10489,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10510,6 +10512,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10577,6 +10581,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.34.1

