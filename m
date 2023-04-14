Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp209648ejm;
        Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350blgsmfUBN038f6fUvIpncu5bWya60uAq5GAHTVSgSZEIt1fzOOChdNEjGpPZq4nQFqD/c3
X-Received: by 2002:ac8:59d5:0:b0:3e3:902a:a084 with SMTP id f21-20020ac859d5000000b003e3902aa084mr10990825qtf.6.1681488273827;
        Fri, 14 Apr 2023 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681488273; cv=none;
        d=google.com; s=arc-20160816;
        b=EICIqVKUTP1gjABxDb0ARnRMEkjttAcv6sxsnRSJAGTdAofwY5SpQVz1eH7Zl3Iqe+
         bq7birRuxbDL4JQCnHOSFjDGZaNTDbOVQwptqyFVVk869g5GIq8HIfS9cbWrARKBdbus
         2dTvlhgoslF24SrmpjJi0eVn68IuKpAeX7IJlhOttSzoNTvz+Q0l+GTMA/xRw3gXE81t
         GiDqjP1T3Pr7rmlGprlk5XrmoN3X4AIkY0x6jwSS8eI8YQ7ygfDMoeUVbaE6YXeuPzzs
         xikJPCimPRRF8AuFGBr0W/DqEhzmEue0ISADxavq4LIQUg3ISF7f8PoCeWVl08X+oRRD
         X9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jUHq0yTT6mZpyW8ymPG55BvWQqRfjylp1jFh1uUnshs=;
        b=qhemlySuLvNQmJKh2a3DHrvLbuFW7TcUlcZ35WLMqbaLfnucXrCO2RZ0swiDOpFmEU
         YMST++8sxjIrjMPygadCkQDrIicjI5wU1Yx+x0HCXMO0AE8wAIKGgVaiiTEX721cpJD2
         ry+f40ovpq6bLKqtGYIUYCPVU8PzpMFaWMeXUNDJgizTcqJP8wrDYgpcSBceT1WDtHmh
         /l+P8FpNU11/GGYm5o7TJFeyqrKs0DoPY9CbXA7bAil6ffF4WSpxapBrAe5rCDpbdJAa
         5RvYclpQfWm1P+XQrz811PbDQ2QJTjWs4n97LwrIBXbqXuqvdAZqsxq30tfBJ+fBhCZo
         Y5HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z86cmet/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020ac87dd6000000b003b68d1f3f7fsi2923503qte.660.2023.04.14.09.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Apr 2023 09:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z86cmet/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnLuU-0006Gp-9l; Fri, 14 Apr 2023 12:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuS-0006Bo-KJ
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 12:04:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuN-0007uB-Gm
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 12:04:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id r15so1089734wmo.1
 for <qemu-arm@nongnu.org>; Fri, 14 Apr 2023 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488255; x=1684080255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUHq0yTT6mZpyW8ymPG55BvWQqRfjylp1jFh1uUnshs=;
 b=Z86cmet/oFJLig9vLG0ILm1/FNhYYRfu7A35GrX/shAqhvqcdzEqz52CrVEekTAwIL
 S7vqSxDS293h99upQmb/0f0z6oJfVc/L2jmw7XvlnkJnVpL9w2xY5SdzsJU7oHtBbQ/f
 0ZmHvFaV/D3jn0wRqc1KzHMbywPywnVPFpPM2PauCtRe2tO/TfLoMMEGI8jsOVfXGw16
 lFkYf6rCmx2ERV9/xNB33KmSoSoxio1GY1SD+s0S6ceGCEVAcrKdgq0WyRW0+DMWUu6l
 bkYVsLJrMyVNAJDomEXoHZ0z4matpM6MIIVth4qaVD8kCwVQDDdJGgPIXmYG9QknG3fs
 ABKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488255; x=1684080255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUHq0yTT6mZpyW8ymPG55BvWQqRfjylp1jFh1uUnshs=;
 b=Uy4mIKUeGlkkm5t0Lt/5jMgBhCTtu8nzp4i9KCkqtiRy06XD997KDrNvkxvYClHbLA
 oTDW4NTeHfhDzouU/X2BH/Ny71t6RMk9KwX/irgBvTQuLiueYl4dlO6sBGRoc78+/ehR
 U0kR5o4cK5+gdAuQufVfo1CoDZOhI07vtGXap+80z0pKzfHOBodry2TQVDfNwfWlMbzy
 oWPmu2KEWAybxf/buJUm0nA38ivS4x1xsV6Jkplwe40QRP5QMVKmlPWf5x6BWGapX/gi
 sJ/6oNmxB2Ufop9dI2C32/skXmAqpyhbHkXkpiIlbNPq4e0y+JudgGG8Z5+pocYjQtMV
 CKCg==
X-Gm-Message-State: AAQBX9fTxVfmPmeVlSC1NDGMDByIQDSGRyGRqI6vViFWBX7SJd4pw4sg
 Cz3yuB6jzZ3QaGe758PPWYfiJSOMpHmqFrI2sp0=
X-Received: by 2002:a05:600c:2289:b0:3ee:6161:7d98 with SMTP id
 9-20020a05600c228900b003ee61617d98mr4732437wmf.16.1681488255598; 
 Fri, 14 Apr 2023 09:04:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c22c800b003ef71d541cbsm4673752wmg.1.2023.04.14.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/3] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Date: Fri, 14 Apr 2023 17:04:11 +0100
Message-Id: <20230414160413.549801-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160413.549801-1-peter.maydell@linaro.org>
References: <20230414160413.549801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: TMkrOlzuQarV

Bit 63 in a Table descriptor is only the NSTable bit for stage 1
translations; in stage 2 it is RES0.  We were incorrectly looking at
it all the time.

This causes problems if:
 * the stage 2 table descriptor was incorrectly setting the RES0 bit
 * we are doing a stage 2 translation in Secure address space for
   a NonSecure stage 1 regime -- in this case we would incorrectly
   do an immediate downgrade to NonSecure

A bug elsewhere in the code currently prevents us from getting
to the second situation, but when we fix that it will be possible.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6d72950a795..06865227642 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1403,17 +1403,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddrmask &= ~indexmask_grainsize;
 
     /*
-     * Secure accesses start with the page table in secure memory and
+     * Secure stage 1 accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
+     * Stage 2 never gets this kind of downgrade.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
+    nstable = !regime_is_stage2(mmu_idx) && extract32(tableattrs, 4, 1);
     if (nstable) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-- 
2.34.1

