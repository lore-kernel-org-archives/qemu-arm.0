Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp94663ejc;
        Fri, 13 Jan 2023 19:12:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXva6OHmBCdNiq9h2MW6sAadmM6iTgAa1z2g2mB4s1pgfvufnGtkOUtUl6VBWKy4Kxs3BE68
X-Received: by 2002:ac8:43c6:0:b0:3b0:9e27:ddb2 with SMTP id w6-20020ac843c6000000b003b09e27ddb2mr18064879qtn.3.1673665965473;
        Fri, 13 Jan 2023 19:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673665965; cv=none;
        d=google.com; s=arc-20160816;
        b=FOLTdDrWwRcfRjBpGDp+R1Ma3Wni6BaLWx3oM8r1NtIyErdFo8nS+qxUSzIMSNcXZH
         gFv/TRSX8xh08MhFEd832vaosOlXdfY6u/1Eb6IWiFJuYq+fjYatprtlK5b1+lv2sQpX
         0yv78hURj8N9S8nxxRTXYvtT8rVCIlY1+WUX9vO+ngMSQJgCEof1ET4EM9VKLFlHrnHS
         JuJc9bkPulwAYR/CaKm99daZsflAddRnWCi99HBNWygIrhQn3uIrZtZiCTuyWQt+AZ1I
         OQr41744OKJRTcNeqDqRjKDAnNu4q1HtJDaY3nYUxGwGsIG17wa02eg8TOpc80wC5/XV
         tN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=t7bt1moGaa/vnBd5cAzAfOuxr+X1UUfglkpPnyEpm4w=;
        b=iTIgiUKQ+H/YBczVl0QMV419mFLWxAKGAzV9T61COgXJJqH2RW05Br322gXgPhriQD
         kB81i2SKc/jC6SG/Q3YQjFeMAoKzeOX8Xjqp7j20k9kK7meiWFPCWP9arnxBtuH3PDFa
         8sumxBWA0vREPukRv0Vxx6bd84oc5eRBnramwH9YiGIDOXagrMRq/sLB7i5+63felyix
         k0wsX4eRR2fIAjDW234UwnUC71UegLLuzdHww6MK0jpNWAqHz8q3C3N/lD2lHO+hQBlr
         i8J4K8sejxcKsHYphSaNGxO2hOtEOKy8EEGTHq3hxjxmL202xFbTRA0yQmaeVZuH5wmr
         kL/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mefwG9gn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i189-20020a3754c6000000b007061a0f0e46si2521684qkb.624.2023.01.13.19.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 19:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mefwG9gn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGWxy-0001u5-PM; Fri, 13 Jan 2023 22:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGWxv-0001ti-Rf
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 22:12:21 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGWxu-0006Ye-2L
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 22:12:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso28847422pjt.0
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 19:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t7bt1moGaa/vnBd5cAzAfOuxr+X1UUfglkpPnyEpm4w=;
 b=mefwG9gnXOpTurTFADgvQxF7TEAQR9MK0zcHKuDX/vR/OcyBDa2a+xSGxhPhfuexPf
 +8lwlm2t+asTzNr0lTZlaumavhPoKcDg7UHaTxj1L4uTlkGqT6KU45iaO3OPMw/Dezjk
 bVikELuX+U9korZLyC3YT8eF3xJZhmjmoqqGrMGNH+uLNdNhcbUVGGYAoEBYysNx9wGX
 QBO3brCieIR+GfSNToqBUCZ/FeWQ6gR2ZbziKXcpDovvaPB5+8SjoDfSOtdluwv6M32E
 f9j3l2nGAbOS0iOEEzl5ZiGTi8sa9R2ZI4PAaPedXzNgWNPLkE9flJY2tlOT0VArnoZ/
 uxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7bt1moGaa/vnBd5cAzAfOuxr+X1UUfglkpPnyEpm4w=;
 b=dauTRheeLQ8FjiqIiqK1vsyOEXUTRB0QRZj/kL8gJxOlAQTRS5WLoI6zwQtN8th34h
 zWoRqi4W9EJKPMOiwkiKPuEzMh4W5+CUMAJvp2OnbAbKEvADmFeHLTe3WH64Qo/b5HbF
 caww3PVfkqUinozgPeMZRsYyUk5asJmP6EDu4UyBqKW9/wWIp+Bo1645baQ+PDidd/Ds
 E3WJJglQZHQ2CJOFc/1k0ky77ECaQC1BRz3VcAhJqFeqhEbSB4Ane5VKdoFIJU3L8sGA
 wkOU0grqDMRRGEYj4ZQ27L4v8s36x6MK/KTC82SbGn9gyLrOyT12aFuvrtGXX9RZlGLD
 OwMw==
X-Gm-Message-State: AFqh2kofQsX4EmibTEfRrH2h1uIOf1UjkDVXEeZcjb3ACWa6Q23K33NT
 kN95PhzlsBWs/vvl6q7TyR1S0w==
X-Received: by 2002:a17:903:189:b0:189:ba1f:b178 with SMTP id
 z9-20020a170903018900b00189ba1fb178mr130219151plg.9.1673665936244; 
 Fri, 13 Jan 2023 19:12:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090341c700b00186e34524e3sm14880061ple.136.2023.01.13.19.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 19:12:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Fix physical address resolution for MTE
Date: Fri, 13 Jan 2023 17:12:13 -1000
Message-Id: <20230114031213.2970349-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: MBygYZ47YkHK

Conversion to probe_access_full missed applying the page offset.

Fixes: b8967ddf ("target/arm: Use probe_access_full for MTE")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1416
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 86b3754838..98bcf59c22 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -142,7 +142,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * Remember these values across the second lookup below,
      * which may invalidate this pointer via tlb resize.
      */
-    ptr_paddr = full->phys_addr;
+    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
     attrs = full->attrs;
     full = NULL;
 
-- 
2.34.1

