Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4132608eje;
        Fri, 14 Jul 2023 08:47:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGsJT7TTy/BtwOTTVGgpBAn2CGlYiwT4QGj5nFTirCgF5NYiziVDkFwT54Ub2adiBm5jlGD
X-Received: by 2002:ac8:7dd6:0:b0:3f8:6eaa:dcce with SMTP id c22-20020ac87dd6000000b003f86eaadccemr7101160qte.27.1689349635627;
        Fri, 14 Jul 2023 08:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349635; cv=none;
        d=google.com; s=arc-20160816;
        b=oNJiC+GX0xps8QLx4ECiUodJM4YhZuaw6mEuxm15eHaN97JYaBFdcqa+3tkdzJiIRK
         sxKmPh451dijU+7TzvsYMAqU1c68nfCVUzt9YWoxRoZDIPpKaTdixHPiqaXBR3uWqzHM
         AFNoAKPH54ULiUwP5zpd3hwA6/l1brngek+a3fsPt2sxz6ZC/A+jfLDuGn3jF7g8sfpo
         TxQiZq07djqBBlHPVOXl82qKg1dIVl+iXL0Xt0nAbzSN5vtRtcTRN7NmFXWsrsk/PTPL
         H8f9qS1UhJtGQIcXKGrMGgpIjJfxyjgzPerz7FtHHBo4/02ANlhLTz45SIHkoJ6ywJpU
         yR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MCCxEvnOoEn5P3Xa8BG9DaZmOIjYscf+/hErEQPjuEY=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=dykGoEfGQEbnheZ4/1BnxHcokLxJiYkAImaNo8Y1Riyktua6M7tker29bmGsUZ+LT3
         ifpUE+RPGXSsVIGBWpUjXp4aR8IL7NO0QKRBJ/nu08aAv1AmQCz/SNplNCwGAHab3mD+
         32i5oFtBuvd6SwxVj1sfZzG8T6kTmI08SUzMP0MONGi85UUlaPphvlwdF1RWSTdovCjB
         nR76zkJbi5tnsvyoC29dSdoJB0Afsdt6cFnvneTbJf/Tks29vNFmwaQM3S8jJNVyDn2Q
         n6wA1VLn0DOyxHN98XVbfPXQ5Seka4AaVlpQALJQuZJiHoJzbd/6jqHEG2H18m/U2NIq
         ID0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bVKjxHGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020ac8578a000000b0040399b07d9fsi4764836qta.605.2023.07.14.08.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bVKjxHGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0f-0007NH-Rs; Fri, 14 Jul 2023 11:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0c-0007Kv-Oe
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0U-00077i-LE
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3142ee41fd2so2107078f8f.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349617; x=1691941617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MCCxEvnOoEn5P3Xa8BG9DaZmOIjYscf+/hErEQPjuEY=;
 b=bVKjxHGjIpP1w+t7vzEtqfJ1o6HgEgP2gN/rGsnUY8dD0cvEANTv8WDTXs05iNPM0I
 q2xzu+qZRqHziqUBGPPQ3EuuSayZozHOZCwGmr/lOXYynCiMvGqFhwcRusAG2Y0TCyK1
 kjUNX2lyk9Kh3+8LW+TR8rdsiHHEz3j+VBP74yUEZWjNeOdIP1gjRwbVknZtYCb9CPi0
 OHFJWyhdSgGjD6nJ+k8kIsOfzvHBPDkY2MI7T/wwWJpkbocYzbKqtMuY5HdHoSZaBuww
 NAyOaEpsJ4PqlwsG3x2/lVlWt5Ihddduui+GxyLbqH28EMYSiHxZBAuFRyGC08H9r44j
 +fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349617; x=1691941617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCCxEvnOoEn5P3Xa8BG9DaZmOIjYscf+/hErEQPjuEY=;
 b=YMIXy5E3+rvDzZUFL7r6qxRz5Cy/6560RSKJbbfqTQutybTcrD9GdD9iLSLtVbieyX
 iMKO/N/AXq+trtYe46yTYhoLo8L9hKitY9CCZRUltltx4boK/vVy4VHRZnWiwyATJGh6
 Hq057/ir15+YWiK/1JecxKgx/UGzRZq1Dagnph23y3Dz7oP8UMe2FGUrF/Ug+mFNaiIw
 lMKyF27nZWtDWML+PIy6Bjcv+UqpaYJ1ZpiGM/3P3CvfehehTrC+P+JhI68L0e3VadQF
 37YcmUdjWJDo+idWXskqDl1nUY+uLPKytKuHINwYy4DPFV/wuNBIDFrGDBRypW5ba7B3
 iXzg==
X-Gm-Message-State: ABy/qLYGPJUpx0uHijSifBpaqOhqQWVZUomhkwZSJQj/Muav3EtfuLar
 Pco/8fugRgHIsfy6qWXpL2N3NxqIy6IoKHN+2VE=
X-Received: by 2002:a05:6000:1081:b0:30f:c5b1:23ef with SMTP id
 y1-20020a056000108100b0030fc5b123efmr4186750wrw.41.1689349617371; 
 Fri, 14 Jul 2023 08:46:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/14] target/arm/ptw: Report stage 2 fault level for stage 2
 faults on stage 1 ptw
Date: Fri, 14 Jul 2023 16:46:47 +0100
Message-Id: <20230714154648.327466-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: /eHvj3A++ztO

When we report faults due to stage 2 faults during a stage 1
page table walk, the 'level' parameter should be the level
of the walk in stage 2 that faulted, not the level of the
walk in stage 1. Correct the reporting of these faults.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ed46bb82a75..d1de934702d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2046,9 +2046,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
  do_translation_fault:
     fi->type = ARMFault_Translation;
  do_fault:
-    fi->level = level;
-    /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
+    if (fi->s1ptw) {
+        /* Retain the existing stage 2 fi->level */
+        assert(fi->stage2);
+    } else {
+        fi->level = level;
+        fi->stage2 = regime_is_stage2(mmu_idx);
+    }
     fi->s1ns = fault_s1ns(ptw->in_space, mmu_idx);
     return true;
 }
-- 
2.34.1

