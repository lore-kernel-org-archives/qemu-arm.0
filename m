Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484442ejb;
        Mon, 7 Aug 2023 07:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNSHu04eaasmlgaAqMq5CKNO9nOn9wOmZlnq6de8snUXGWevC5e+tQ5BF5x0UW8elBYds
X-Received: by 2002:a0c:b446:0:b0:63c:e685:ca7f with SMTP id e6-20020a0cb446000000b0063ce685ca7fmr8965140qvf.8.1691417808137;
        Mon, 07 Aug 2023 07:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417808; cv=none;
        d=google.com; s=arc-20160816;
        b=lJp3CwE+bTuGoiBI5VN8hGJJmo1Y3+ATBNaFZLIb+Z2kJoQsOB0XbrpLnilFobiI7Z
         YfC8OR1JOZ1kyuM0nfZJ2hYAaDe4K56VmN8UNMGcswKXXhlUdS7ZSwGYBJFMOGUU7Bmv
         53T8gHAwF2WxfCYuYaph8fq5sMxT6b9Ecsb9yFzw5MZQhY0zBXi9klVV9y2Cv9CWQMif
         UzCrKFuTK5XrroD/olSRGMU/vmT7/nL8K/VtYnvpfD0Syi2hd7Tu00lWB64pufhlUxd0
         zs/OTSoQFFHYbJDQmOl/GitYlAqVwn8E6bLvkmV6j0TR0FayJuC9oiSH5IC2IMtgfN2e
         ytaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uhsYVutNNAS0mc53Ap1xSb7YNraKnHLfqR3rpR5pcZc=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=Sjc7FaEuTU/hr4iA8UyRXAHoi6IZr4IysLrKmycjfa05uq1kV6OUS+3yzBUT+VEnVs
         WVShX9LkC1conuNX7Iy7Z29Fv7c37qTxojo4Svfy5v7Ja86jfp6NV/LGl6qTEzYUErxT
         hZpkg3l9M1Ob2zv63rKdYcIct993yyiD5Ysk7IiHaXSVzPS6JNcI9hR3J0E7e+aUZ1vf
         HfjPVb7zqzaMZL4Il0gCazCnlla5meKwgkiM4hGjO/DCtIMdBm+n5NKoIMGZQTe/J6XH
         wf6JfwAnqsMBhkNyWGxAjMChDIxoxfDiWGlkBHafTWFB3nlIdJcfQrXX9TayYL6GnMom
         jvQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyksu1m+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s66-20020a372c45000000b0076ced1c6090si4564546qkh.759.2023.08.07.07.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyksu1m+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qT11q-0000mZ-8d; Mon, 07 Aug 2023 10:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT116-0000Aa-Pn
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 10:15:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT112-0005Tv-51
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 10:15:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso45446705e9.1
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417721; x=1692022521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uhsYVutNNAS0mc53Ap1xSb7YNraKnHLfqR3rpR5pcZc=;
 b=Xyksu1m+OJW83TSUP9fIJm+C01UOtfx/S7+q4D245uBmjoA6U5CLHr0HnMvFt45B0Z
 M9NoKBiPxtR+hMymlU/dxO8vrz0LWKz6Dkdm2Q1PQ9GnH7AqaJKELpfl8oMpIEDpZ01e
 tuP9WHoO+KC4hTBF8UrWCL76VAO0o+J0h+U8wHKiGlDFFcHGmXtdQlJEdrGviiPySWuD
 Kartl5Abhb+OpntG/QHYp86zrfcSYoEh/zB6jYCiTFa0bRU8tnuYGU9bsORema/nFCv+
 2kxk6OcYqQTg5SCWjZESfLotC/xCkk23b1ahOew0/+6a8RSMk7gzIy0PJO4FHuDyAXEa
 lmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417721; x=1692022521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhsYVutNNAS0mc53Ap1xSb7YNraKnHLfqR3rpR5pcZc=;
 b=Xre7LozrPbfrH+GJ0W4749GDKVCiFA31QfKWQ8WxCzbezTKZtcfonV7JbIQ4ePj7qY
 ozzl9F9G+ZtwE0nI6yeYN2qjkA3HQWicxXCi3nLiOzhP/dYP5dH89B/Bfaa/a+3Fm9Jx
 9d6MD8LU5A9bSQ48W5YJQCg0zbvItxHX+XoaW+Dk9kXG4RSl3s8dLhQjE/zlYvrS+xgH
 kp8niAqNfaaWn6JNlVG5M/ZAPT+911F+1Cjyoj6DuJa4t8lZBo85KyqWDUHNK+Magn1/
 HAttjj64Un0Uhx1bFWVEO5yXim5yxwkI5J2/0M2iAjHihl89Tobpy/ThUN05aUnoHlGG
 J37Q==
X-Gm-Message-State: AOJu0YwARZpurEELFxvmYaGaf0sQMBSSVkcMiInQGJmoqZuK4sbUD9Cx
 EBwRHYPkg/+bs4Qs/ZFovQOGpsbSphNtYreDHNQ=
X-Received: by 2002:a05:600c:2210:b0:3fb:f0ef:4669 with SMTP id
 z16-20020a05600c221000b003fbf0ef4669mr7843307wml.17.1691417721365; 
 Mon, 07 Aug 2023 07:15:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] target/arm/ptw: Remove last uses of ptw->in_secure
Date: Mon,  7 Aug 2023 15:15:08 +0100
Message-Id: <20230807141514.19075-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mP59qBLxmqpw

Replace the last uses of ptw->in_secure with appropriate
checks on ptw->in_space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6e736bacd77..1ca25438c3c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3249,7 +3249,6 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     ARMMMUIdx s1_mmu_idx;
 
     /*
@@ -3257,8 +3256,8 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
      * cannot upgrade a NonSecure translation regime's attributes
      * to Secure or Realm.
      */
-    result->f.attrs.secure = is_secure;
     result->f.attrs.space = ptw->in_space;
+    result->f.attrs.secure = arm_space_is_secure(ptw->in_space);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
@@ -3272,8 +3271,12 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
-        /* First stage lookup uses second stage for ptw. */
-        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+        /*
+         * First stage lookup uses second stage for ptw; only
+         * Secure has both S and NS IPA and starts with Stage2_S.
+         */
+        ptw->in_ptw_idx = (ptw->in_space == ARMSS_Secure) ?
+            ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
         break;
 
     case ARMMMUIdx_Stage2:
-- 
2.34.1

