Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2453617lft;
        Sun, 3 Jul 2022 02:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vv8fzImn58/nMhynk/cjdWWSpUxCw0htz/+6FqbFUHZt8mmg/DjL8IxaYPMvnZOKkJfuSr
X-Received: by 2002:a25:41d1:0:b0:66d:cd17:7d68 with SMTP id o200-20020a2541d1000000b0066dcd177d68mr16523159yba.285.1656839822708;
        Sun, 03 Jul 2022 02:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839822; cv=none;
        d=google.com; s=arc-20160816;
        b=s13gdUt02XF6JBrmbrNdftpr/7G/2yGQ8YgHScA2/vlFZihD/fd+PsLCGP/z2Itw1q
         yPG4F2ux2S8CIZk70qOqE+0I8If+i6s99JRjwtN8AFcsRKwMKZePzayHmuZFa7VW8s53
         btQpyN5fzJ4WPBVeGJeXukOfoe9r1zzYmXmfJzszoFEgKq1YrGrXEk2khjWot+6LS3W1
         z0lUWijB2Kb5t/YDj3iqWrViR6boHOE0MPJoWHHJLDcf41dmonds9X6KlyqlSxGQfrRQ
         VePBhu8YZNkMLVZMGQET4wE8bKpieUmY+E3zArHFm0sHLaECco6Kwl9ZGwiaARnR+dlK
         BU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0aCiSl53YzA2hANru329Wrf7w6Qosp+yjx/RWCF2Qxk=;
        b=f4EYYagp3BQ1b41pTmkp9QYVweKDQtE1e81SQzx8OrN3JZyzFj+5AiXBNej0IUTfN9
         H9aOCdzPpkmV5pDpWiBTz5ZbC+jdK9qvGHk/qTHFJnvJXbJ/nNOO5qED3WiEQtRrSgt1
         Pxc4u3YpwYXqIwVVxEr2qaDbRnjZk+NmPjNfqfuyUOHoV0eY5DSfsLDVtXyA79ZDNzBl
         IpYhRidKkq5YIuB3/tux3fNf1AL2MtLjeooWM7zUJfVls6AUGD1LS2YGePxHb6DH13jB
         2rGvzP5D/Ea89H8geoGa0o+X6xpHysLgeT2aVF6+Q6W249UKeru4k+6GDjI7yMK3VS2R
         PvKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RjDNJ84/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70-20020a811549000000b0031c874d82a1si3002889ywv.489.2022.07.03.02.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RjDNJ84/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7viw-0000HR-3x
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzE-0000Tz-AS
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzC-0006gc-Ls
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:48 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so6702966pji.4
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0aCiSl53YzA2hANru329Wrf7w6Qosp+yjx/RWCF2Qxk=;
 b=RjDNJ84/oT+RIj6bE3cPaxWgDBf5aQnV0NQLNhnSnDp5DEB9+yKNIqgRyBWXP5bvA2
 twHiXNYzHCBm7vjl0t3Q8BnlZTXmgP8d+XNndOJ0ZvmSLDRRk6DQCmiECyiaAa94nxgC
 pklIVVQurxAuIa2AWoPh0Int1yTUye/F/iRYYTRYZ3jSsMAVyb/5yhqKl+NQhpjwf3pq
 UgtKPWoY7RJk63G3HkAAVrR8Z7LBkufoHfALV+UlxrEtOhGWiTWE5HtBy6v/Hxkh5Fge
 XIZgDdlpLrRptlM0bQtpdkbqvNvjyDM99Vm2OvSYaZge6JKnThY5EyU48hHtR+ny60qr
 Fl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0aCiSl53YzA2hANru329Wrf7w6Qosp+yjx/RWCF2Qxk=;
 b=RBiJMxbA7vOMAfuZJrLXGNNSOX1ha6k/99fGtPuWTCEFnjcap8al2B2NAcnAxZZpcG
 rAcfVoAxAP/W7+wLApxqhUaJzLlNspk/ee5PDBbC6unputG7oJX917F/Jd1A71MNfGii
 cAu2zHLekTcivXspUwF/Kdws7ZmLwWtu0YPNDUbS4uxrDbqkW5vjkTq8Be1zflJF83qa
 nTjE/EDnyF0i7TvhkkF5nfzU7NJ9qVBTcVrCVQ3g+ylQCtZnzfdaXKtce3fKCCFXA9lD
 oNTOR1qcQioi//d17SBhzlBVzaA5GxPw4PVr8E+REPiC6FTxMvocIT5GuumsI5bhWVA8
 qgvw==
X-Gm-Message-State: AJIora/Vi5pSqY+wFSQAd2ZuSONZu9fha1cmoccsJ4sAzgINBSswNCZ7
 thcGrRPfgV/wzUPb0rE7JndbQQ==
X-Received: by 2002:a17:90b:e95:b0:1ef:825f:cb40 with SMTP id
 fv21-20020a17090b0e9500b001ef825fcb40mr1621102pjb.29.1656836985406; 
 Sun, 03 Jul 2022 01:29:45 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 45/62] target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
Date: Sun,  3 Jul 2022 13:54:02 +0530
Message-Id: <20220703082419.770989-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q6ZPskModXN6

We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
Flush the tlb when invalidating stage 1+2 translations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 20 +++++++++++---------
 target/arm/helper.c    |  4 +++-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 931808f2e7..ddbb2db1b9 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@ struct PageEntryExtra {
 };
 #endif
 
-#define NB_MMU_MODES 10
+#define NB_MMU_MODES 12
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c5aec164ba..8ea9f08511 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2938,6 +2938,15 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
     ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
 
+    /*
+     * Used for second stage of an S12 page table walk, or for descriptor
+     * loads during first stage of an S1 page table walk.  Note that both
+     * are in use simultaneously for SecureEL2: the security state for
+     * the S2 ptw is selected by the NS bit from the S1 ptw.
+     */
+    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
@@ -2945,15 +2954,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    /*
-     * Not allocated a TLB: used only for second stage of an S12 page
-     * table walk, or for descriptor loads during first stage of an S1
-     * page table walk. Note that if we ever want to have a TLB for this
-     * then various TLB flush insns which currently are no-ops or flush
-     * only stage 1 MMU indexes will need to change to flush stage 2.
-     */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -2984,6 +2984,8 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
     TO_CORE_BIT(E3),
+    TO_CORE_BIT(Stage2),
+    TO_CORE_BIT(Stage2_S),
 
     TO_CORE_BIT(MUser),
     TO_CORE_BIT(MPriv),
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 176be48c46..499577f24e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4332,7 +4332,9 @@ static int alle1_tlbmask(CPUARMState *env)
      */
     return (ARMMMUIdxBit_E10_1 |
             ARMMMUIdxBit_E10_1_PAN |
-            ARMMMUIdxBit_E10_0);
+            ARMMMUIdxBit_E10_0 |
+            ARMMMUIdxBit_Stage2 |
+            ARMMMUIdxBit_Stage2_S);
 }
 
 static int e2_tlbmask(CPUARMState *env)
-- 
2.34.1

