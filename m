Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6789875lfb;
        Mon, 28 Mar 2022 10:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcuPAAvMAGkO0a1/mfC9vmtpp49aXx6lCiVx/U/sjTq1Npq+DCaejIy0XA8It1AS/AYhEZ
X-Received: by 2002:a25:cbc9:0:b0:633:9eb8:dcfb with SMTP id b192-20020a25cbc9000000b006339eb8dcfbmr24016234ybg.480.1648488816255;
        Mon, 28 Mar 2022 10:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648488816; cv=none;
        d=google.com; s=arc-20160816;
        b=t9ae8UrvsUFJUfBv7HPvXVTeDClUD7NCeh0R+OyBXc+EMeQEtolqo/V9n+l5X85oqZ
         tuLB9sucwKeYQDAscju7F441lTkz2o2IjbYm389tb8DZnwk+p/bWQOavSH6BIo/NZAbn
         7KtehU01dxGIKBKTylTN6a3Bjc9bIznNSl/5J77jMeWvNWQBENTeHS+k12FAHPpfWP0h
         LbwI3xfm7wbGS82NUd5cI4r2Y3nargZTnHGXpf76Y5W15EM6CM9h+lkITwhpyNktVTuZ
         4AYNZTTfE+5OdHn3hq8GZaHJdOSBfGSJ0RIberOLkc8IVYAxYRnmbrWHYuDpaR8pymsv
         Bz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aUL8mAF1Nh9uul/Swmbhw4lkJFH0mCkW+RQxOWD9YQ8=;
        b=quhWCDs9GeD2MBeMnb6ObHiFvdMRbVDtZTj4/y28JmyaVxS/2jHJoU+UoTxJ8qh8+K
         FArOxw0dC9+AyMypgi20ywdAXjaVotr/lmNFt7ElwJ2rMYBe+4uRqYyxPAbN6YWFJ5Tb
         YvfgJVM8dx47ETrlio1TkuFT6o/i+TYNIEKNQ11sqEV8WrbIEPaNJ+zVdBwanWjC4H38
         cEhQ4QItFqGyUtb3eguw3zcV3rim5LVucdg44nUmwGmUwdwo+wmEWRbVGxMVq9TGa5yY
         tXJGihAfqp1QdPK1/f0lLwOBWnUi1cX/V+ARWilJRFXat5OYUIFpw6A22rw0nPskQGUB
         bJzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=WGu83Qb2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a814a06000000b002e65ab16018si14107656ywa.464.2022.03.28.10.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 10:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=WGu83Qb2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYtFH-00044d-Hy
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 13:33:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYtEW-00039m-Eh; Mon, 28 Mar 2022 13:32:48 -0400
Received: from [2a00:1450:4864:20::32d] (port=56105
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYtEU-0004Um-UE; Mon, 28 Mar 2022 13:32:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n35so8817786wms.5;
 Mon, 28 Mar 2022 10:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUL8mAF1Nh9uul/Swmbhw4lkJFH0mCkW+RQxOWD9YQ8=;
 b=WGu83Qb2odTEAULHcvdOr577JfhQnArjAdaQwKCAcv3x07y8gRBdUb6N61muxrVoB/
 qjKipDAGkqWFSujt8Wbo6TkeuvPrN6fKWepB10UrbUI4ORzbKjB8gU1sF7hKlZhKO3Jc
 odVQ4DYkyw1S6H8puBL96ETHBhMOHSnG/Otfkuw49oI+5IAp/YB80MaBQJXuFidKIAev
 /6WF2Eiq3Dq5qEuOephcaHEJa5k1ka7Sy15SHRiz2bXEoM272wXEgvJb7WaWGUxRUSv4
 DVu6C/tXvQZqZ1A3k3T6pX4QzZM0BW9H4IGlLxTZamckiaHCQqPeaMfn8SHMSafMWzfO
 pOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUL8mAF1Nh9uul/Swmbhw4lkJFH0mCkW+RQxOWD9YQ8=;
 b=6Fno4KW5h0pprwYOEpRFp81g+fOfntU1SqGb9Jw4ZMcIa5w/Ykn1yJ3oM6L8a9tqkV
 Gno7ACKR7KytutbXlM7yi9+L5vXfb2OEI0E/pH8T6JOOmF6vuBS1gmsRjwU+zY7eudWG
 U+/CNDg0xmi/t8In4l04FDpB1ljE1KAHUC5NNSrqg8S0Dr1V97njf1SUuoyhSqusWMzg
 Kmt73Ts92sLF/jr5n0iZleKZJvURe62N0SEyJaBoILvLhG/Dp73l+QPqjMLxBZoglRnz
 zX0LtcbcEcpSRMnxlnZpTm3olP9660uO6gNaTzosl4/abZ3EzPApTpnOSbYIOwkB4c/Y
 jRwQ==
X-Gm-Message-State: AOAM533XbqkRQmubfVZIzmQGRQurRYsj/0IQyNLzMc6Jb4HdiXxFa7OB
 j3W0cHlD6VD9+Rukt1mrIYX9+fG1JDMEqQ==
X-Received: by 2002:a1c:3bd5:0:b0:38c:9b9f:1b24 with SMTP id
 i204-20020a1c3bd5000000b0038c9b9f1b24mr302966wma.129.1648488760693; 
 Mon, 28 Mar 2022 10:32:40 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm136871wma.2.2022.03.28.10.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:32:40 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Fix MTE access checks for disabled SEL2
Date: Mon, 28 Mar 2022 20:31:08 +0300
Message-Id: <20220328173107.311267-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ameAGHkUbPPD

While not mentioned anywhere in the actual specification text, the
HCR_EL2.ATA bit is treated as '1' when EL2 is disabled at the current
security state. This can be observed in the psuedo-code implementation
of AArch64.AllocationTagAccessIsEnabled().

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c    | 2 +-
 target/arm/internals.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 16c2628f8f..7d14650615 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7176,7 +7176,7 @@ static CPAccessResult access_mte(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     int el = arm_current_el(env);
 
-    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el < 2 && arm_is_el2_enabled(env)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         if (!(hcr & HCR_ATA) && (!(hcr & HCR_E2H) || !(hcr & HCR_TGE))) {
             return CP_ACCESS_TRAP_EL2;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a34be2e459..7f696cd36a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1094,7 +1094,7 @@ static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
         && !(env->cp15.scr_el3 & SCR_ATA)) {
         return false;
     }
-    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el < 2 && arm_is_el2_enabled(env)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         if (!(hcr & HCR_ATA) && (!(hcr & HCR_E2H) || !(hcr & HCR_TGE))) {
             return false;
-- 
2.35.1

