Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5179114gdb;
        Wed, 14 Sep 2022 05:29:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR47nmLISCwL+hCD/v5OaX5F9Qb2RWTWg9oUlkBC3MR2wCFKQoLH4mf6AKiLnv7rfSPjcixc
X-Received: by 2002:ad4:5c8b:0:b0:4aa:8a44:8810 with SMTP id o11-20020ad45c8b000000b004aa8a448810mr31942894qvh.4.1663158550897;
        Wed, 14 Sep 2022 05:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663158550; cv=none;
        d=google.com; s=arc-20160816;
        b=gMVUJ9lxH8tpDbgNZ3ZKI/sk2xbfhBSd7wTx9z8ZTZmgQhmXSMY5+1S2lULS+1oMJB
         vwXazbRSS6xEsoqcxPfdQuHPf0e7TgtFsiC0nHPRlRrcjlhcxAI58SrfN/h+W5kpe88p
         2/QVfjaVEXcEfnIFji9MRkCNDzLhyuwezhwbiv8+MkeQ3a1jqly1vndqmQ0Jnw6d6kQk
         IHbvQAUgHxK26nCn7wnkPsBjFlkHK9bbDzxhT21om2zdsbjMPOxcspDU02ps81n82PUa
         1B72LaliZwgum8FFSrjZribpVuWtnxrrokhrIXaYe8OQ+Ji/TuNacQ62Xk0NNj9RUtUK
         hM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PkomJ9lGCe9l0kTq7cdHjcXwr1BTefxDkf2qRWjzl8Y=;
        b=q0jxvS5xPrMQhP7CIt6P6JN4WGAZ4Kso0f0EImrm+uiCLw3BMAQFZcU2bSHK3RxBGA
         dI6owKWFypcan7gApmFbs+cKM7cdvZ2QrdNG4unwej5SwotInwDA2TsByc6HWvPTqOoc
         eN8wqjXrrDh1T4UcmHfcWnZ6DQQ2XnwGa7xM3aTYOLcRKGwEI2ZFSTT69b4KYBteiWM5
         GVXWm3zz9QGMNzrQ/XpuSlSzFoZzHIqDlCIsi1Jjh2VcJEgdT+PcE3n7Fz9sCoiH4OO/
         ceghzlWNyiFEuumeu3Y/DBVoY/S3tVGULnuKutKItcwntsgAZpEBYtE2lDFd8PO1li8n
         25aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyJHL6vy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a05620a244800b006bba055ab53si1431283qkn.20.2022.09.14.05.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyJHL6vy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRVu-0001fV-BZ
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-0000AR-MC
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwK-0008VX-Pc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id bj14so25257434wrb.12
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PkomJ9lGCe9l0kTq7cdHjcXwr1BTefxDkf2qRWjzl8Y=;
 b=yyJHL6vyFNuXQj2QA5EumAffnqPA/PpN4AsjgC14X1UCinTMuUa4wk5ECJBaOeWNE6
 u2nnTHqA2lKxUkS8fjTYlFo7gibeQqtYqWUG2EsxmcCqS7AwQJsLarQjHRTbmoRswVuF
 cZ+X9QmqcBC6SiJBhXUmwZy2bjTJZM2WKJXrgjgZ9b7pO9ZstIpxEm0UuXk99DEiAqSI
 NXokTUgzNZlK2mbf/H9Y6mW0nVRuLqTnsiLXAz2X07sX3UpK1ijpwitvNEaMnd5I1DsW
 msEgOZcj4N01PPeFoJtEi2oQBUMPb+1s+EKYyCtcVzc3XPTa97MXu+dlADFGE7CdT/lp
 druQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PkomJ9lGCe9l0kTq7cdHjcXwr1BTefxDkf2qRWjzl8Y=;
 b=sCoTD91sGVcNdJQcY6gProSFhZiuuFBC6kic1bHS5fk91O7l/UvwpB3GEESEnf1gw9
 tL+6S4QOCukbT9wQdkSU1VE70rrBtF3ov/V2avgMmQWIh3LmUlilhb3hwUj+n8k/xrva
 NcMnaiHrpLs7/IEBjtV671w9gsaN1Uiz/PhxDyTUlMgaeFFyeZgyac1rZVuOBDFY4SL+
 I7Bxx7TdJk5E7o5GRT9HcI75u2O8l06QsihqnFabdTYV3QiNFnC7x+S4vBHEiNhCmRKq
 13A/KoTT0cmIooGK74mNkjmUgwvGicknF60kF6HqK76GmJ/T2POQ88RgLB/IwwXnfrdx
 zC2Q==
X-Gm-Message-State: ACgBeo2m24qcZ8CE2j+V3SHZVik2+4GhPuw+CgL4W1T91Tituu1sy1Nj
 gf4K6Vo9ecpA4PpxoNtTIHCM1qdEv1EXUk7G
X-Received: by 2002:a5d:5273:0:b0:228:b382:8ea0 with SMTP id
 l19-20020a5d5273000000b00228b3828ea0mr20603640wrc.347.1663156343284; 
 Wed, 14 Sep 2022 04:52:23 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/20] target/arm: Sort KVM reads of AArch32 ID registers into
 encoding order
Date: Wed, 14 Sep 2022 12:52:01 +0100
Message-Id: <20220914115217.117532-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0u/Mn/V01oY

From: Peter Maydell <peter.maydell@linaro.org>

The code that reads the AArch32 ID registers from KVM in
kvm_arm_get_host_cpu_features() does so almost but not quite in
encoding order.  Move the read of ID_PFR2 down so it's really in
encoding order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-3-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9b9dd46d78..84c4c85f40 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -608,8 +608,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 1, 0));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
                               ARM64_SYS_REG(3, 0, 0, 1, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
-                              ARM64_SYS_REG(3, 0, 0, 3, 4));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
@@ -643,6 +641,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 1));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 4));
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
-- 
2.34.1

