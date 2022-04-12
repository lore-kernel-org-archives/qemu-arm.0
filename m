Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2006578lfq;
        Mon, 11 Apr 2022 17:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJE+hdZ2gsTSO4n5X4OqnfUUbFSFI2DbhIf8VE/g2QkYvc64+rml8Esl6CEzCNkANPWHWi
X-Received: by 2002:a25:c00a:0:b0:633:95d3:e2b with SMTP id c10-20020a25c00a000000b0063395d30e2bmr24587596ybf.366.1649724007073;
        Mon, 11 Apr 2022 17:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724007; cv=none;
        d=google.com; s=arc-20160816;
        b=XOhuHOdxRHfs8ZfR3uMPAuKFbQG4NjBlttpo02p2nhvcRvnGXQLL6S+KVkUojXYABR
         nPQTgbzAFfDIJoViw7PHnAPEnO/Ybg2Ca7goXpZ1dOoEJ83gPtlSY3S2RHJEsP6cRISD
         ylUHnZDKoM4qNKRLQWO4eCYDfabomcPNjRDRtw4cPoIpABrCWvVCYwC6xBMLQGSnQsjE
         AUE/fvwl1WSaVYBjkfziZf5l6IwYCbGnk5nU2o+0Tb2E7Rl8mc0h0VbnVKPBJfXE6h5x
         1vyU2qb8yV+k9Th/uUDx4W7AQDBxLvCQ2rbDOu41bgHkwboZhTCQToLve05Iv1MyzIw4
         UbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iu/nk65R8C0cFFrefP1P5ddg1mxr43JuiZQtJemOhVo=;
        b=bOAJEsELxXEMgLnCPwDUXWbBs0GWQSc1Quqdas+QXzt5LA+8sxNLSiLwBWPup9pZVd
         fhdmaeQCgS7Qexegg8rgyCO1JxnM+pXZvRWYTmlNpO3Ove5hLFptjQnEUBdt0Y1AypqG
         Lk3770vqdIzk+EbhLZHuXQCy23IiexsMd1wWagMfE5uhf79hvjX5pXWfBc5Q4B+AsAQo
         ySihuYunmeNe5J2FsPFdQs0eSROXsN75v6qxUkqHHkT0wy0V3sSDFsQ0zIsOiiyUF1Ir
         R2PiCWBlOZrC5UjqSQ4LS6n+7tFYoQTFYwoI0CKUpit+kSTC2DSQLRvuJfv3xjNwmbGt
         bpwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YNT5+kX+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c76-20020a25c04f000000b0063e796616e4si5097932ybf.422.2022.04.11.17.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YNT5+kX+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4Zi-0002ZW-Gs
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TQ-0001sA-3B
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TO-0001ns-1M
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:35 -0400
Received: by mail-pg1-x533.google.com with SMTP id r66so15649135pgr.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iu/nk65R8C0cFFrefP1P5ddg1mxr43JuiZQtJemOhVo=;
 b=YNT5+kX+OCdnuotux99K0OAuuIKN9wLbhrVeH4zOyc91ovHyZi+LAcri3t6Hvyl+Ww
 b9vypa7OKDYJFGYcnVo5gp1G3WUIsN8wwb4vR+udukYDNAxRyGZ+7DyJEFsUfItLOavp
 Q5Yy6b5fblxws0eCXulhVfMAbNaHCCC3Qf4mAPdJXllDOCIl0H7bi4Mdmic4sVwdgKtX
 tSNED6d6wgbLfjPQ6bquH0y9A70t+n3DosvI24yWjlJEpJA0YSTcUUKzKCFo0bOPiRcq
 LZrsE34nEqv2JoAK7M20miEcJwvv70XODkZkccQhsXdvgx+jjhUczVK14EpG3g0K9iyT
 tBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iu/nk65R8C0cFFrefP1P5ddg1mxr43JuiZQtJemOhVo=;
 b=WNEenUgB9WDqzUoPpvWhSEEpztWi6DGcd6DBCseUGoBVJmlo8HmToW7i9Xy6W+N/Fn
 MC+Q9VHxcgPnfzA1H6+mdi+v51ibYPeKFIPzSjFVhKrF0d1d1SWjaBccs+ftqlTiFB4t
 wTYfsuewKd3no1zPtypqQcqylnD0tTTF5dXRaoSz21Cw4is8/UGYpD73E3faxDLzqgy5
 Ez3/TWlDs4WojkTqM6HuiJrIvH5i9fNRe83oPv4j/Kdey0V24CjAIQe/Kt3gnuw1Fcow
 pmzaksoB97iF/zVbruEnB6LSbYxgaLbQthmlF6GHhGrsTSg8eGEcjsCNvKEp5tSlZZHy
 DF+g==
X-Gm-Message-State: AOAM530DwbhgnENeBJRpQiXHOYq6b4x82/klqAK/LJYRsAa8pucYIb98
 a0fwBH1DUph92wz4qART0IbIqNSCMfOcAA==
X-Received: by 2002:a63:485d:0:b0:39d:8ebf:9acf with SMTP id
 x29-20020a63485d000000b0039d8ebf9acfmr1203212pgk.351.1649723612776; 
 Mon, 11 Apr 2022 17:33:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Mon, 11 Apr 2022 17:33:07 -0700
Message-Id: <20220412003326.588530-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWIkMCbQkl5x

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b7cb3a6cb3..ac782531a7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1088,6 +1088,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.25.1

