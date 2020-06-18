Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1280756lfm;
        Wed, 17 Jun 2020 22:03:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJct2Uy/MFuUrz/Qa+BsYKw/KPmOnQYEbKpU0fLuYGAWWk3ljhCGoLJzDrzEfrf8dmhLee
X-Received: by 2002:a25:d8cd:: with SMTP id p196mr3880621ybg.55.1592456607126;
        Wed, 17 Jun 2020 22:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456607; cv=none;
        d=google.com; s=arc-20160816;
        b=nV6+KMpLpUnGXwEeNr9zQf/ogEJ759vn0Thd9NFh9S34YyEU0X5ReF2rNL7Cro2bDP
         rrVXjkXFESEfZsqvLcScm1+o0vD77oK3xLD5Y2dVk/EkEmLlC9EI4DFjF5kkd30pFD1L
         4uuEsJ+RNv6/X5zxelkIHT/Tua4JmBEDmxdyA/zbURcBNFs/0wCp6W3H6/r6/dRnNAuc
         pufKLaP5ZiqCrXZ9mltUy9MTVmRHLg+myV2Tf3z7FFzmZ5cgMSh50rtgnehZtYxJFi4L
         BQyzmkj2txhAEAeHOaE4gU7SG+Py+L1r3cR75VTDlOE0SC0qNbI38krqi+Ux8GrnWkqL
         Kypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sbIRSfBXy8STM04dECtWnQvP46LbKwMWsMmZFP6hP68=;
        b=cK6TNwfT7MnvVMGDNEaDha7UAVH7DM1RG/5AzZF2i6/wXEbroKelL8mcX7sMbJeBXB
         +Py+hWFkBakeiatqQTCUxIGadiBX/3R5821AJHEBNu6L8SsSwoZ7lJ6FSziKAAvaNCmM
         JFGVgbrkrSI6SpzfbX30+IUpBGKB+JGbtp3ldhUBzqb4wQdmu+wSd07/6SnykGNc0NWk
         661is01LPdwn+fRarhjNBhQU0qM1q9WxvLCLKADBYeComOAArjhamYabyX+PzqfUSgUG
         phfARvzh1AEWrvlNo4vFMAVHA0ueS47M/rRYiFvxeFupR1yABTvEkhEYDugmxfVEKcdU
         4YXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Js0UNPOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si1480274ybd.490.2020.06.17.22.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Js0UNPOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmhy-0002Ki-En
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCw-0003RR-Cb
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:22 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCu-0003L3-MT
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id v24so1910645plo.6
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbIRSfBXy8STM04dECtWnQvP46LbKwMWsMmZFP6hP68=;
 b=Js0UNPOzX/EsnAy+hcoRAOHo5Ei1XfgwmXDxu836/YMRZOfKClZaWjCRvY3AARTEa1
 Z3rJoNG2nIs/tXoLjcZlXM0b1w+8mZ/IHsA4YUGSAxhzERt5BacOFy6ggoGZpV5Ex89U
 1X50JXPpBSjmZFDzCYh6xrPVFX34A9yibl8+Jd+l0oZg9KwCtqttLZHODz6pP1GRhtsC
 rlewrrXtTwwTPy33Nnz3q8M5WCHJVt/YsofRlzXFhaE3dGwi6om1lEJIN4FKbfPsq+Zh
 F+K9v94kISOuksP3BN/tX25DxzefBJhlDO7lcewhFvr0jJ4X23Yt58MiZDRLyeSb3rqf
 Opng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbIRSfBXy8STM04dECtWnQvP46LbKwMWsMmZFP6hP68=;
 b=umpexQDfdSfJJGJgrR51nGmVPS9RkpQgbA/Q8sckA3bxTLW+LnM8IvEdZMrgc0QQfc
 H9YNsdQRWjPSCnbk5MMg0ODW4GYjxU2ZK8DaISh124LExdIhuQ8KxtHbkeNNEDZp89OM
 mBLHLWkyOzXO01BtNQadjsSWEEP0AWfj4bhwtx9nK+PdiWsKCeWjhXhUj3Y/c/Pcpxji
 2+dwCIPkMULCaC96/oeW3PVTYoGYsp4LD0wcO0zBjtNqhlZdEI3f+w3rp8jpjw4PDQyX
 zGNub/HmhX1RxzOighz0qBgQB2sKtMxae1nYljb6DW5SB4UcKcchRPqE3NzhTpBuNbzd
 7Cog==
X-Gm-Message-State: AOAM530+uFCyMGuydwyuCW3b1A4laFCrEZYO3+sDQIehYBenHMQ5OwhB
 IGzy+oBgRZIlGvY4RlTD65lqIQ==
X-Received: by 2002:a17:902:768b:: with SMTP id
 m11mr2169751pll.136.1592454679386; 
 Wed, 17 Jun 2020 21:31:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 066/100] target/arm: Fix sve_punpk_p vs odd vector lengths
Date: Wed, 17 Jun 2020 21:26:10 -0700
Message-Id: <20200618042644.1685561-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lFJI8ho1j0vG

Wrote too much with punpk1 with vl % 512 != 0.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dc23a9b3e0..24c733fea1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3137,11 +3137,11 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 d[i] = expand_bits(nn, 0);
             }
-- 
2.25.1

