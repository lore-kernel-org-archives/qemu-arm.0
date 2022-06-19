Received: by 2002:ac2:46e6:0:0:0:0:0 with SMTP id q6csp130069lfo;
        Sat, 18 Jun 2022 17:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scqKmhXn/AHkWo4TLj5+xrahk759fHUDlnZtczgvLXx5xsTcA3qaO8qmNLDeDmu1kK5dyV
X-Received: by 2002:a05:6214:5985:b0:464:6b45:f24d with SMTP id ll5-20020a056214598500b004646b45f24dmr14150719qvb.61.1655597876271;
        Sat, 18 Jun 2022 17:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655597876; cv=none;
        d=google.com; s=arc-20160816;
        b=Vlo6hns5kn4kUSVCQyXf3Zd2HP1lBKFSzDByJbqyERH/ojDY0CC8DjgjzK8y7V1pwc
         nOK8hyV1Al0TXc5VebGzjga/5OqeHacd/bJPOYOKNcy0anY45zMUF5Bt7Vq5rwMwKCDZ
         Mw3WaxVp12KhD5WbLNlodwh2Pr/eA80oDHR1qPomJcMHAucTpCOKsouDW1MF0QiESOVf
         KrBUHfmYNWKKJ55klaCc1VBB/hUf6E38AeOKeYw262ijxXVLEsoMqwixydEyBcmcfHVI
         NMdxd2tzgHmoUGxQixYOSnb0nivIhnkWZ5S2B1qteNz1NsxxxnWepWUr24E8onbdQ1wE
         Khpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cQ3LSmMq/PEbxO4xqtFc8lNO19/pPJ0Q5K0mnc2j/gw=;
        b=SRiqkC69UpoXH+9j6Js6sHPs9BLtxRpU6SmX9I/91WU5uuDc6B8DZFtugNlLY24hS1
         je3WTiN9Rb642YzdqG2Z5QxmPRpYNukR2C8EX9ButVnHIFJLTZPaQ6AhvTI5SDXJ0hx2
         3ZRL8PVtq5cehA1t5vFPu5lJo8nADz3bGZClJGF713ur/rcoMOZmJzHcL9oh5JXyTy98
         lb0CLoS70HUXka3FoSaxd4WfGt7aFkNu6ddAoWJRzpftZZtdYCWePwsZIkmgMPtFeG4k
         /G7RqJcZe7Ie22hCqkuF4bCkCEWNNpRTv4ifooq2RE57vnAIfANcleXaUrzv7OdYBPkq
         f/OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSH7Eh6d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05620a0d8600b006a79714a811si6166254qkl.361.2022.06.18.17.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jun 2022 17:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSH7Eh6d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2idW-00020k-Os
	for alex.bennee@linaro.org; Sat, 18 Jun 2022 20:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibf-0007XM-Id
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:15:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibR-0001xB-SK
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:15:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i15so6807982plr.1
 for <qemu-devel@nongnu.org>; Sat, 18 Jun 2022 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQ3LSmMq/PEbxO4xqtFc8lNO19/pPJ0Q5K0mnc2j/gw=;
 b=aSH7Eh6dEq3QXFoaoAqNIvWxq4x/l7/ouqdQhkaZG1eTwCkFzEG4kVXo4OIjTuI9Xz
 gGT7qY7bKNMCoa3o4dDr7/kpQeH//7yvNLkgVz5bpCZyp9G8KEEbLWy3BjwKWYZ/UNZV
 z6IVo7Yh8JFFsSa1jN5o1olOXdbVOL/hkJg21a5kiHNHBTf0S41SuSFc3NXkai/zQlrx
 WK/ptP1/GMp3Qzl5FoicebpFBdTQmXauyFdvyo3b/y11a+6Xb2atlVkBflprOPfa4vtb
 BtHfgjrBmfAM48XGZj5So5rHw6cbwcllDwwIxrsEwjFzLlXRQegE10HWv1JSWcGCcBKv
 G2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQ3LSmMq/PEbxO4xqtFc8lNO19/pPJ0Q5K0mnc2j/gw=;
 b=ErBlkI7Djg4aUYOvOYHwZXvdX2D1Cevgx3u28uALSFVdoD2mOnkyVNWxByJJ60KJyO
 6JPQO3XhgMJTbpxuEW8dmi4hescHD7GS2DgXnU8yw8sZMWXFP/My8JF7fUw60+M7fMsm
 avJxLaxd54MGdt4VgZQS4nrAFUDZ11bvuU+Vp8ypCPN1yq9NqeRvdyOjEjvq9oMsNtJ2
 Ros2dGbwkzJiP7zKVgNPK0AJW2Ka4xfF6ToFYzkUOXUobmwLH6a7ZMJHrj3uTHuXAoRF
 +70c/VvDHQeBPvWomQp+nAlPId7M1OffC9YTPi8Z/ldxS0RAUmdRynmtqGVzbpoh88/R
 UwLw==
X-Gm-Message-State: AJIora9ALYW5y8/PYXgJy/zu4U6HONne4uLf1GTo+lgzL41qYYlVuPFG
 ke+OLLBBeuOSK9fhECVo59wYKs1L1FWgXQ==
X-Received: by 2002:a17:90b:4ac1:b0:1e6:7c82:9aee with SMTP id
 mh1-20020a17090b4ac100b001e67c829aeemr29260148pjb.234.1655597744476; 
 Sat, 18 Jun 2022 17:15:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:848a:b814:8a9c:88d6])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090a5d1100b001e0d4169365sm7790724pji.17.2022.06.18.17.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 17:15:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Check V7VE as well as LPAE in arm_pamax
Date: Sat, 18 Jun 2022 17:15:41 -0700
Message-Id: <20220619001541.131672-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220619001541.131672-1-richard.henderson@linaro.org>
References: <20220619001541.131672-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kg0H/sN2j0R/

In machvirt_init we create a cpu but do not fully initialize it.
Thus the propagation of V7VE to LPAE has not been done, and we
compute the wrong value for some v7 cpus, e.g. cortex-a15.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1078
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 07f7a21861..da478104f0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -47,7 +47,13 @@ unsigned int arm_pamax(ARMCPU *cpu)
         assert(parange < ARRAY_SIZE(pamax_map));
         return pamax_map[parange];
     }
-    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+
+    /*
+     * In machvirt_init, we call arm_pamax on a cpu that is not fully
+     * initialized, so we can't rely on the propagation done in realize.
+     */
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
+        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
         /* v7 with LPAE */
         return 40;
     }
-- 
2.34.1

