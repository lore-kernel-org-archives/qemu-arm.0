Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp668926lfp;
        Thu, 14 Jul 2022 06:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLwtJKbukCQm7MdIZO+9gyxA+ZJ60iJ2SW9wVtne5oLIgEHx8fyEYac4SkzOsfFYPW8FJX
X-Received: by 2002:a05:6214:260b:b0:473:6ef4:491b with SMTP id gu11-20020a056214260b00b004736ef4491bmr7683284qvb.34.1657805359740;
        Thu, 14 Jul 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657805359; cv=none;
        d=google.com; s=arc-20160816;
        b=zGJXtEgnAgXVtlLyFmb0Pz8difEJkwTpttQp9jvp80lBRUUeMpZQO25EdodIpsFBhe
         vul23pfbqs/rAEkkYrKT9dcd+4sfoflSPQDF24sq35YKbf6YywYqgFTVvmFfvJS5e6BJ
         vcIju20dgOQcTAQFXepNAbr1I4grVgOqDx0YsAi4+DVKolfB7iIO5aVHLMJETkrhiMky
         kh/3eSbwodYzD2Al3tiXDynkJ8om1rfD04mcB0wd9daJKwmkdkEoqrdr26WrWTgnmkYi
         jgdYeWy3TN4CdmGuiTKzSquH4W8q1Ph6DcAy293eD3/S7N2U2wFiwsOIFihgrhNLRSeW
         wRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7fzrSUgKfikFHeNFkh9/TCh+g92276JL8XDKKltgm70=;
        b=OboDr53BxXEDWVDVBSYK32LbQvr4SvhyIUYuHh+OIXru6BwLljqO+IMs/7hpGgm+hW
         Zsa2RMmSmY6vJhz14s27E+CtLZ4ibDQh7TmJ9uRQKRGV8jVuQ1kehHurNzDLh5HV3oJF
         nAgqngyMOpvJb/1aWwKUGZ9D8m6eVt4ulF01iujekTBDN3o6vX7VxNbK1EaP8ovRwK8Q
         5Zp0mByvf83gIkjnrmWiEG60nO+k6mqOcczTTh/TCFNjl9foZwN0BctdqPljNkK5XXJf
         G5+xJjqQRbv+YrdLkNqM3nPaPiM8kz+lDPk8PpU9E4r1da4diEm/8EZoH0ExVA/h/4uq
         IZEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkbNBOPc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a0562140c8400b004733a9de0basi861423qvr.242.2022.07.14.06.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkbNBOPc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oByu7-0005Ec-84
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoA-0002BZ-OE
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo9-0004oK-5b
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id r14so2575997wrg.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7fzrSUgKfikFHeNFkh9/TCh+g92276JL8XDKKltgm70=;
 b=fkbNBOPc7mP/VK9xdZU8F3BO+d1w6JTnZoYVjmgahER7FgebSBBX/wMsiJ0VyK5g/u
 aJ4F8HdZ7jFPW73PMRb0TvzCC+pWSDlFf1C10itfaFs3xtvLP86W6Wtzhr9NbBo4cvLt
 vpGAf/NFYyopFed7HEdFG/kxQq++MbtHN3GjvCNYEmzfy7An7ApyRySuy5sFZxtaZER5
 Cn9eDOjPU/ilgI6gfvFWC6BVnxOa3k8dru77KNHjui8KW/O7ZUL5EBbLEbUcQaJHk8wp
 5GwDz6+AbDxdV9j5xlDc3HE47aS2m1XHns/Crwvr3EEDFBrJ918X84Cxci63fjed9L7A
 g9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7fzrSUgKfikFHeNFkh9/TCh+g92276JL8XDKKltgm70=;
 b=1gzWz876dlxGM7tVq4GzJ+QEn2jvsOGgmKFDSy16+X3u53PH5UKNk85WggW3T5NYXv
 DpCt4X+7BmjQrsAwK2cIKUK2iWTolyyLZdambbu7Z0+tyCKaj0STyV4cT21aOkwMs2Ml
 ZIeCJVWUnaZ133AOAt+Sx4R86owtQKOjDD05E1czETdFausuXupb4ktjGeX/yTD+aGJn
 aj8/2yHVXV34SreametQeuh8KwJpmFIkLIo/N7J/U3wLRUnspIARu7dxiWG/ebntvHLw
 334molgwl7m3hF5N2MskXrEa5bGF16dDpA5DiZwdxjhiO4afyrtFbSKFNhOVEE6yytoa
 kfMA==
X-Gm-Message-State: AJIora8svNBTLjdgExys8xx+Zx+MZdfBtpULKdBbScCfuooKdmnRw8tj
 v62Y7pfrGc2q9xVgfvsH/75oAkRcC1mFDg==
X-Received: by 2002:a05:6000:885:b0:21b:a423:172c with SMTP id
 ca5-20020a056000088500b0021ba423172cmr8323973wrb.98.1657804987582; 
 Thu, 14 Jul 2022 06:23:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 2/7] target/arm: Calculate mask/base_mask in
 get_level1_table_address()
Date: Thu, 14 Jul 2022 14:22:58 +0100
Message-Id: <20220714132303.1287193-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: t3Sgck97ApYR

In get_level1_table_address(), instead of using precalculated values
of mask and base_mask from the TCR struct, calculate them directly
(in the same way we currently do in vmsa_ttbcr_raw_write() to
populate the TCR struct fields).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0d7e8ffa41b..16226d14233 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -315,20 +315,24 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
     /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
-    TCR *tcr = regime_tcr(env, mmu_idx);
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    int maskshift = extract32(tcr, 0, 3);
+    uint32_t mask = ~(((uint32_t)0xffffffffu) >> maskshift);
+    uint32_t base_mask;
 
-    if (address & tcr->mask) {
-        if (tcr->raw_tcr & TTBCR_PD1) {
+    if (address & mask) {
+        if (tcr & TTBCR_PD1) {
             /* Translation table walk disabled for TTBR1 */
             return false;
         }
         *table = regime_ttbr(env, mmu_idx, 1) & 0xffffc000;
     } else {
-        if (tcr->raw_tcr & TTBCR_PD0) {
+        if (tcr & TTBCR_PD0) {
             /* Translation table walk disabled for TTBR0 */
             return false;
         }
-        *table = regime_ttbr(env, mmu_idx, 0) & tcr->base_mask;
+        base_mask = ~((uint32_t)0x3fffu >> maskshift);
+        *table = regime_ttbr(env, mmu_idx, 0) & base_mask;
     }
     *table |= (address >> 18) & 0x3ffc;
     return true;
-- 
2.25.1

