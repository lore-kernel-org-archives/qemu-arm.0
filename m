Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827476ejb;
        Tue, 21 Feb 2023 18:35:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9gXXMiaqWh/l2wvdYh0c/u9vH8wj/xrAN4KbAVmc1Z5rOssUgt7Pe2sQs5vMhDrdM8+N5C
X-Received: by 2002:a05:622a:4d:b0:3b0:e83e:4331 with SMTP id y13-20020a05622a004d00b003b0e83e4331mr12404272qtw.44.1677033332367;
        Tue, 21 Feb 2023 18:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033332; cv=none;
        d=google.com; s=arc-20160816;
        b=QCK1kUzH4hdt2U9kFr/+SV1wm5K11iJjYZ4p93fk1la9gIYnX2stDxwlRTctLDkHGG
         OpNzpr6VqWBdVRzN/WGebo1OAIzMRV6SW18k1vQGZJclA1Q8kExzfW2PdjYpb+ODkrLd
         6n365laQWoxGJCB0BpjijuonvyFgYn+ZRqHXhmUtoNQKMbKlGJHfjJBsLrQJPSokLVeI
         piOheZOiFqRVY1Ik+MDJBr46nWu+m8Tq00eI8RKtkYOp58ii64gG5ltTX3W6hN79YqcS
         NwXhFjdWUkEZfOMWV1BfMGh56bjFJprX0huXokVzEecUeAHA3b/Nc7Vxke5BKOIcj13F
         0vvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PhxQ9e9pVV9RyCPmKQ2M0WUBfbr0akWOWFlqn9fFR48=;
        b=hmL5C1B++2IGPemk2CzStqHHqPQUQ/4JEMDEmu1nIIgP95YNhvqcAUuosadKYh/Ree
         FStsp8lbD38w6RlaimQ9QMkcu9RHkiE4vmFWUlOqiyRXdd/JMB+ba/D0vKgYWl75+Mo6
         wU9+mN1Z/DTI6GoD01vE4Ts9fqy9+wxkmDVuafMbo41d3dZ5IvRl3wZsVybzkBvy0L6v
         RpTeOXsOwirWQDJtgmutxfX0PrTsc4bpmv2VsjaX30I+Em/sfU+uy++mf/lgEOtXAn99
         OCvelvnh1KsAR/ylCadL3fKsPUPYl7ZSgMd4NfmQQB/GDeSim1XO3V3tkXFtrojLjVAl
         A29g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ElH/lQgU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a14d200b003b631307872si728618qtx.693.2023.02.21.18.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:35:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ElH/lQgU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexV-0007iJ-4E; Tue, 21 Feb 2023 21:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexP-0007Zg-Mm
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexM-0001Xg-5h
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ko13so7849015plb.13
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhxQ9e9pVV9RyCPmKQ2M0WUBfbr0akWOWFlqn9fFR48=;
 b=ElH/lQgU1lUWROxso2hhGUR7CpV70Htl3OQkwUrxntluMvqtXu1LEXdAgvT7zKyLRX
 /MlM1+ziqlBbBW/h+IEW81iHMA9xey0wm2VmmfS6puPIooLD8ntrnmBtwZpkYRlXO3Yt
 g4olycpluVe2VZBc7VJCVgq3NeEQ+mYsfQk8N8h2Y9HRGybbMgjlc1VKPd6PtTc8R+H2
 mX+hMFn+Q4qe6neYvl4w9bUKEm4RC4rzsFaoMAVM9xM0yh88dQa8zcL7dM00M1q7lrTG
 pZl3YIEAOflwR2kX/qchxoHxiYyg5McGWiBsEbn6yZLSA1pG7Rtn75drpf+VTxYvL1nx
 izHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhxQ9e9pVV9RyCPmKQ2M0WUBfbr0akWOWFlqn9fFR48=;
 b=EuRTX5p1oBVJWwlNTYwGrLs91GSe4H60NxENHSyFaxJiCzwFq9YxDTZuKheoDmhFQ/
 lXKCj8ExanNJ+/Qae8M9nF+3Fa0F5btJBE2OtgYqtbFV0TSzCOA1Y4/jOm7XWlgHoXEm
 Xq56WYlkRBJjdDIdJpblfv+7Y4fEShXuBViNnNnt3mBNe1eiA4EVCbNbsBES/qVWtl1G
 ITh4KaoWQCzFyFnAN/3iMi4AOEgIwZCtn29iNwRBEwTD0a//c8fnanqyUrVTMmdgAzjS
 WccsGaRHed8YkAF+vDYzxMOB11qMEb6jrprT+ll5yJj/BWntVVTnEPQEtRjLnbP7c/27
 Eu6Q==
X-Gm-Message-State: AO0yUKUIkO1t/t6Zwoo7cx5guYGRBlpkOSNVe177zqKujgDdQiNY/+eg
 PqFTGBovc3jWAjN9tD8BtGMvrA==
X-Received: by 2002:a17:903:2345:b0:196:3feb:1f1e with SMTP id
 c5-20020a170903234500b001963feb1f1emr9489627plh.47.1677033247402; 
 Tue, 21 Feb 2023 18:34:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 20/25] target/arm: Use get_phys_addr_with_struct for stage2
Date: Tue, 21 Feb 2023 16:33:31 -1000
Message-Id: <20230222023336.915045-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dt7V2U0bOoij

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6fa3d33a4e..7e1aa34d24 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,10 +37,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address, MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2859,12 +2855,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1

