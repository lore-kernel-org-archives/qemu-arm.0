Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp424606ejy;
        Tue, 13 Sep 2022 07:08:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7HJoeQ5KDd7hY5XgS6yJ/0WLvfVdF7+waPcsOTLBjbPJRe3HErE+4H2PBqG4kfIGSNYW6K
X-Received: by 2002:a05:620a:290d:b0:6b5:cecc:1cab with SMTP id m13-20020a05620a290d00b006b5cecc1cabmr22104832qkp.465.1663078103955;
        Tue, 13 Sep 2022 07:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663078103; cv=none;
        d=google.com; s=arc-20160816;
        b=gXE9kstet+v0wVOQdFDVyAITkRWC+nVKKI6sBYwVc1Sinj2nBkFcuUm0csE0jgE2DU
         psHMFyB5oKgGTE+KTK1VO/O3pBCaHbNlhmntlD07OPV94Muk/JfkfXAcqFp3AMVmVzr7
         HJZSBYSM6pJ2cxUlBlCezf+CSaMlSo+4qtuA0m2DdF+OpYzsRPlGeQLFE/PIZFIJXoC+
         FS8e9hgQfztsaOTrdXD9vHy/NA3MYnevjz3n0FQ7XXrGVYCEc+tRrvQfLmEyu8T5/3lw
         ys0Q2E3h9YtR9l1Ub5Dr4NC9CqLRrMIralcL2KRELavvjeJXaa7mRBj3OygaQpkhFu3m
         bcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NBOJBU3uTy29unfDpsY/Py5xF2DVleNieOaSmiuGjF0=;
        b=riE7PfzVaPu+zixawJnAthzqm/+QqBcc1ma5doytauP6wRR8r5lApeYBb006TncL7o
         dirZsTnS81UbSQ9i2wWMPdV6M07Jjv1JA57TaT7aVhPfeZI/63HHN8uG/IyMpUAe8xXM
         1NY6d6iDVH40u1pv7e6iBGPcvgOC3QE4wLzXUM0S6He0flIr28bxIbcSVHR2+QUkMoPA
         IVylc9l8EBt2PB7myUiS+YwrsxHO3gP7l+ieK8ZHhGEsQwCSGAjWDVaVbhVMhceHY6q3
         d/Moker8Ebi1Tx1SLMEyhtq9GXpxUEkqIsqaxrvqa3/pMBJOh0mQQ2OteongrLBXz59c
         25/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wxfOTj9c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a05620a0e9000b006ce70ef8bd2si691689qkm.124.2022.09.13.07.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 07:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wxfOTj9c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oY6aN-0005jp-ET
	for alex.bennee@linaro.org; Tue, 13 Sep 2022 10:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6RC-00087Y-Uy
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:58:55 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6RB-0001e8-5b
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:58:54 -0400
Received: by mail-io1-xd36.google.com with SMTP id h194so7845387iof.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NBOJBU3uTy29unfDpsY/Py5xF2DVleNieOaSmiuGjF0=;
 b=wxfOTj9cg6IeyM7lu6aCd73wj7VKtCIUIJ51FLbbDFN78NK0XQZRIheF+4JxoxLcTv
 nhj7qQhoPQRSBC6dESny5AsRzUS2YGy84egrstsR2CagMPdLuRK0IbbQmxVuBWwSCQ0g
 Kh0XWwzzpzfUttq/SQ0AWtT29SKyVGI/aQDHYeKqpDoDVHpUQNRpyZwAmU7xW4bKqNyN
 6FngEC/1LUhGvbNMg1gg7WHLeKaPM3Lu19tWn6NXtqNzCGqUOMDdXzHkmbqNBzPUl0W9
 lYmXVARR4HPobG2W3OfDWqYzgp81uTJhvTybl8eXYoBtwc/JDumGQpLfHNFb2pRQNcIR
 KyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NBOJBU3uTy29unfDpsY/Py5xF2DVleNieOaSmiuGjF0=;
 b=WZd1RQOLir0gxaTIkNpow4caQq+SvG8rc/Q+JQfA9DEGnCt8u10Vp+gHbfihEnG3ST
 qXd7D7xPeqxyN5/Kxb3Oly7OpQO6Waf3YLe9Ve2QxbQ9TOSrhnl/iX41kSQJDIIaa3R5
 OoJVTB9nv23OLi5MQY2mB2zMVL01vLyo4cyf7MUgJ03H/qhnmfX4zuEMLwmU86Bn0roU
 va4u2bfj/Ec4Ln+QxkH723vsm09mUraCgFlwmgmFF0E/U4VVewaH/taXtKUsEiBPCL3V
 0vCfWSrXJR1naugMwZhtNIUlSxdDg5fB0dgRTXbPcavw7lv8TWeDMgx5rsQnAKZA2u58
 joUQ==
X-Gm-Message-State: ACgBeo3dX6EZ8sOWrBy5k7a29O+BkZL1T+VXy1Qks7OzyKkzxqpztBru
 6RPOsO8HdePaG/1m/TAu2GDFsSJVdGkRtaug
X-Received: by 2002:a5e:c316:0:b0:6a1:4c40:4574 with SMTP id
 a22-20020a5ec316000000b006a14c404574mr3676850iok.58.1663077531978; 
 Tue, 13 Sep 2022 06:58:51 -0700 (PDT)
Received: from stoup.. ([172.102.14.188]) by smtp.gmail.com with ESMTPSA id
 q16-20020a05663810d000b00358322b32a3sm5579070jad.70.2022.09.13.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 06:58:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH] target/arm: Use the max page size in a 2-stage ptw
Date: Tue, 13 Sep 2022 14:56:43 +0100
Message-Id: <20220913135643.55728-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
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
X-TUID: HWIfwvzJwTxm

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Hi Mark, I think this will fix the issue that you mentioned on Monday.
It certainly appears to fit the bill vs the described symptoms.

This is based on my ptw.c rewrite, full tree at

    https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-rme

Based-on: 20220822152741.1617527-1-richard.henderson@linaro.org
("[PATCH v2 00/66] target/arm: Implement FEAT_HAFDBS")


r~

---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c81c51f60c..510939fc89 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2509,7 +2509,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2550,6 +2550,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
      * prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2565,6 +2566,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.34.1

