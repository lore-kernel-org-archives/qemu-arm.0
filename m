Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp154998lfb;
        Tue, 24 Nov 2020 20:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7o+PG6P9xpXdu4OLI+KF+ms/HYmh42dwZQcbALSUEfG+z2JAw3EHbJn/6GxhPoueuzqaW
X-Received: by 2002:a5b:341:: with SMTP id q1mr2361956ybp.516.1606277396416;
        Tue, 24 Nov 2020 20:09:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277396; cv=none;
        d=google.com; s=arc-20160816;
        b=tB4oghFn3SpFCw/CnEy9X/3LeeKc4yRsPhQp2PinDzqoye2w6ynKWlPlImQZKOqW94
         iQWNEtL28/ogSJ+RrjyN/tH3REvf+JRkc6fO+ERVlSMyJjHsG0OAKHWwupEGTtxrNaHS
         QBhFSfbfXPe5cFnPrwEsnE+LjXEtmbCD09r8ndPB10I4oCnVNJaTTJPd9vcNBj7K3mmH
         2O1sGN4jOleoJAz47orFmx+EcNUVp73XtrVnDfk2BhnWDeIIWT16NUC6A47l1OlxAHOU
         fEJ43KPLAAJAijlZQIcQc34MLn7mCteaOaw9QBQmJCHZAYE9/iX1RRoxv04Ih388BhsZ
         cfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CeRrpuz8AyToTR5rNqSx2nYuSkShEOKR3hSvhU0d5PE=;
        b=uipG0wP2pdrjrhURmPJqcg67JNHcON3aJ2PkNsgefOs+0knrNQCdgPckhnd9D+ih89
         0Gytg4bxrORUQ1keYuGG0mV7klVnjm0InmjKFpCNiPTymhFaCv1kswsL1FmyzuFWKC+R
         U/Lpmielra0Dy7w865YqpiaEe3J2B3otBtgSDc/x/2y+MBCkocZzKGIOCkXVMalAvT2k
         oo/VGaQY+p0sHQKv91ZkdvtpGEAXaz6vIzhzoSB8NnMWEDvWJGzMNWloZ76z+DznaoeX
         gCyBD+bMAxEava/7s9UxdQ0sPC3TuSj+iMFdR/feLytxjuu4ANOtc2aGTAJA9se2ImQF
         VN6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="acPV/Ah4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si911445ybr.109.2020.11.24.20.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:09:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="acPV/Ah4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm7v-0000na-MR
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4x-0004iR-UX
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:51 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4w-00061y-Dd
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:51 -0500
Received: by mail-pf1-x444.google.com with SMTP id t8so1084386pfg.8
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CeRrpuz8AyToTR5rNqSx2nYuSkShEOKR3hSvhU0d5PE=;
 b=acPV/Ah429b3YcECViVoxv+ryYJKhc4SL5NQI6ZIKrNgoT0izAyAnTe9Z2/k1s1fsD
 1I80CcVYJmvnok+Rmxy5CfieRDTamaUC4n6eKvBQgKYw1hXzwNG/J1hP8sKv5ccsS1A8
 iwB+rN4+lSHA8+vq9pvqAI75Nllva5kV+zI66MiKDwfH4U7a6vIR6fHE67cOjMzuYLe7
 U76WjTTF/bVBvtWFwuSwj/TCCrGUxcoHKyRXU66TfVFnLVCx+ZYZ+x8drKtGdrTGbv/Y
 gXVRcZShWsWcqkes0oZoOcL3p30KJeTP/EYcotZpWJK4Kc7id5vZAN0O2jWY9OMOHey0
 V8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CeRrpuz8AyToTR5rNqSx2nYuSkShEOKR3hSvhU0d5PE=;
 b=CCHfj8SHkD31YxnIsKSxmxEoFJBg5/WEPewq+aTzA7sHmxYPFso669X2iOuCsP4QYX
 D+pMtBnPtYRphMgpFRMMF8S7m9PuUXT1rfC4/9pwgCxi9akHm9PCvbRnyVIRuAj0zgSD
 eqNrI6HCDd9YdDvLAYg33NTuIpOUnUYrknbl+JOu/YMzmQFyP2ckNQGzVxvBheb/CLoB
 yU0XHg1+NsIYC9hp4M/2hVNLjPRQjb3ur2BPJvU3D6DzK2cPnSpqV0azNtqk3TCkdiez
 XT1E2RT94vkc5zFlolhTCr6nhJpPEdw5GAp4+Xs3zHhIPR8DE5yrmia8Lo4AB1ZZJSw5
 mSFQ==
X-Gm-Message-State: AOAM5323P7INSFl5dE1yUJUIziGbzHounYdGMuywsKGb2S+vu4ANUbbW
 hiVwCyMimihG3dg+i5DlCLwqncQ3JATn1A==
X-Received: by 2002:a17:90a:5d0e:: with SMTP id
 s14mr1843248pji.53.1606277209110; 
 Tue, 24 Nov 2020 20:06:49 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] target/arm: Enforce alignment for LDM/STM
Date: Tue, 24 Nov 2020 20:06:34 -0800
Message-Id: <20201125040642.2339476-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pQ8Med+aM7kZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 73b3d8cbbf..fe4400fa6c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7814,7 +7814,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN | s->be_data);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7889,7 +7889,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN | s->be_data);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1

