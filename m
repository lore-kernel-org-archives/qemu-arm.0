Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp502460ejb;
        Wed, 2 Aug 2023 10:03:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEIIIR7ln79n5xNhiqKRoqzn/1n36NQuak9grN+1iRi4KR3nQ40j5uwCuBp7Q1PWUHt3Omt
X-Received: by 2002:a05:622a:1182:b0:3fd:e6c3:be0c with SMTP id m2-20020a05622a118200b003fde6c3be0cmr19643773qtk.30.1690995820664;
        Wed, 02 Aug 2023 10:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690995820; cv=none;
        d=google.com; s=arc-20160816;
        b=EQ/nMNsAGkOwY1Yr/ZBDG+6JJj0Kn9j2AllR2AdyjaH3CiIXQlb3or0TPqjg2+znR2
         WPCHvZzEN0EunJaqNds6xqjsBkpl3ATus57rP1xoicBkHP3ZN47Jcq6le17TQi6kmbIm
         LYBFM4jFVMVc34aJo2LbbuO2Z0ma9m5mxKPAl6XdmY71/aik90HPlJqW9nbP1t/AVJx1
         I/Zv+k/EXhlkitwBeqAPfkUNcRUGiy25f/QT/LbOZToU0CGYuv61Pq9pbyBSNPgO0rht
         R6ds8vdUkg85VMM9EhXQyAi+w5Y55tyQX0q6Tn5jk0/poViICBXrZ2a30J88OIB91UyO
         gUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bCTx3e049Pk+oNC5PLbeMgmbnCi39mZL9Wa/yLsQHW8=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=cmxvqL62cuwhZvl8i75yq0R8FlMlf3qWSt63cTP566Gqo6+7QTGPG+c3SsqmJzF9Em
         VOdOCAGm+0MHU92TCbIdDipuYWKYufLTt9IlUTUvGVxyd5qXwJ0UYipOqLpYwEe43Dgz
         03MXP77bQ4U8ZAl/w+snFnfhUNHD+g56uT51kpAazvBYA5qTT7IJBacR9iw7gjewYjib
         o37tR3k+n1NZdhhmbkSibNkLj8YvbJqsaYDRPOjRBOIN3ogFdjwyBEX990njW5pXFGYm
         AJV4d/JeLT9ir1Dunzzdy22Q4TO+KBMqP7Jf4cjBjqv72umgdar1UhF8K36dYxKFJTg9
         p9Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoykvEdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020a05620a414900b0076cb16bad8asi4639753qko.387.2023.08.02.10.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 10:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoykvEdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRFEi-0000Q7-Go; Wed, 02 Aug 2023 13:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEg-0000NS-2i
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEd-0003U0-6r
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe1e1142caso1018495e9.0
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690995725; x=1691600525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCTx3e049Pk+oNC5PLbeMgmbnCi39mZL9Wa/yLsQHW8=;
 b=WoykvEdwJkkaEbmRs8lP161neexyMuDQhPMgL/jFgM/+2tB4anrXeBOjO7ZiMod1aJ
 6T5RpszWvkzQWOISyT4npZribk69Frsw0uouxMGfNBFLz38P9/6TiqzKxcDTKSwxs9k3
 4vPgQXyCp+fdKPnivSA1v7ehPfRHQi8PUOQPDoxP0YYc1WctFpj2MWENW9YCAMVPzsBg
 glhbSJV1Gim44WiTpuUVkysRjQTAFE5fjULCtOuix30nJJH2YNRufrwseTP1JDOZ5Oje
 34R42BJXVHF3fMUzTALFXR9xprIxSpooTAfnhUGGLp6zOHzQjycnYU5FuX35Ocu2Rvf4
 qDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690995725; x=1691600525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCTx3e049Pk+oNC5PLbeMgmbnCi39mZL9Wa/yLsQHW8=;
 b=KO4h3h1a6hy++UasPLLUdnK/S2SSluLdN9GeAAs1gdS6GgOk8OqetJ/rINNu2ej6y4
 JBkEd/uutKWcenMSanZ3FXLRe0aEbBsAT08slEDnouAptsux1xNLGOwnBpbXg3wU6i4M
 QjCi7SyI0kz276HEUrixnn1frKpzZZOLT8kMEhd1DiKUTnxKpK92V63yohG2wSv3VKYt
 KbsfsjhtMBMz2MFjnk9qEj6iwdaq1sR3amwL8gCBS65xuA+3aRDBo70YKOlHAoSa+EC+
 lyfNMTXjH1oNrNj86HwFPk/jjj8Jg0Nc/IiKMtEIZgbh+KfxFkrKa6YqQMLFzIzuo7vp
 9frA==
X-Gm-Message-State: ABy/qLbBxl26ZAFH49VzzHag26JmW1q+96UOb5uz6s6SGIFNtHjBi6Am
 fVuryt7QmIB7k+fysc7MEzxVpg==
X-Received: by 2002:a1c:4b0b:0:b0:3f8:c70e:7ed1 with SMTP id
 y11-20020a1c4b0b000000b003f8c70e7ed1mr5670748wma.20.1690995724755; 
 Wed, 02 Aug 2023 10:02:04 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm2149081wmq.8.2023.08.02.10.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 10:02:04 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 1/6] target/arm/ptw: Load stage-2 tables from realm
 physical space
Date: Wed,  2 Aug 2023 18:01:52 +0100
Message-ID: <20230802170157.401491-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802170157.401491-1-jean-philippe@linaro.org>
References: <20230802170157.401491-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bjtHQfznWTok

In realm state, stage-2 translation tables are fetched from the realm
physical address space (R_PGRQD).

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/ptw.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d1de934702..063adbd84a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -157,22 +157,32 @@ static ARMMMUIdx ptw_idx_for_stage_2(CPUARMState *env, ARMMMUIdx stage2idx)
 
     /*
      * We're OK to check the current state of the CPU here because
-     * (1) we always invalidate all TLBs when the SCR_EL3.NS bit changes
+     * (1) we always invalidate all TLBs when the SCR_EL3.NS or SCR_EL3.NSE bit
+     * changes.
      * (2) there's no way to do a lookup that cares about Stage 2 for a
      * different security state to the current one for AArch64, and AArch32
      * never has a secure EL2. (AArch32 ATS12NSO[UP][RW] allow EL3 to do
      * an NS stage 1+2 lookup while the NS bit is 0.)
      */
-    if (!arm_is_secure_below_el3(env) || !arm_el_is_aa64(env, 3)) {
+    if (!arm_el_is_aa64(env, 3)) {
         return ARMMMUIdx_Phys_NS;
     }
-    if (stage2idx == ARMMMUIdx_Stage2_S) {
-        s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-    } else {
-        s2walk_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-    }
-    return s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
 
+    switch (arm_security_space_below_el3(env)) {
+    case ARMSS_NonSecure:
+        return ARMMMUIdx_Phys_NS;
+    case ARMSS_Realm:
+        return ARMMMUIdx_Phys_Realm;
+    case ARMSS_Secure:
+        if (stage2idx == ARMMMUIdx_Stage2_S) {
+            s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+        } else {
+            s2walk_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+        }
+        return s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
-- 
2.41.0

