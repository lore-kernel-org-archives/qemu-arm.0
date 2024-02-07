Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp126634eji;
        Tue, 6 Feb 2024 18:52:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi6MBfyQwRjDXsCESMqTBaeEXhF83putNIzQloeBM+SCMeFv86xs78Y9UfZqMKDNplSidZ
X-Received: by 2002:a05:620a:2991:b0:785:8da3:5f37 with SMTP id r17-20020a05620a299100b007858da35f37mr4916443qkp.14.1707274376458;
        Tue, 06 Feb 2024 18:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707274376; cv=none;
        d=google.com; s=arc-20160816;
        b=XWgHiTZTaJyol66Ndpe17+yxYG3FclNxUzSy2WRmm/swtgQyqMmN5uqXoBmvf9G769
         2KTbHdQo1eeMv+ZdM907pLIMKchYZfV+1RJo9tK7EqoSowa5niSOcXTTmXfnet036Mqr
         /4eUOj6z24vuZL+c8wTPSyxOEcyGI8d9DsDvzxfqnFjZQXtHAiMuvZaBenQgqh7/VNqM
         +BWGEJrpVAhr2bpk2GesT/IXzhvwnMNEyyEpUa4Rtbe2o3dq9773+uBe06AP06kjhLoV
         5FgUQzuCcPMhlfsdYnZO9enz0yq6JREr2M+d36m5TPsvA20M9fkNnta0DU4rzi8IVKK3
         mkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EwSkPSHiupn05u+RAeWRJRNLnJ0SRDTtyOincwirVhY=;
        fh=eK70UtR+b+Q4wfXU6CidpaIhleavKcsoli7Xn/h5hAA=;
        b=Ygw21pqAjRdDWdEIoxVAXye2RXUnmF3tvRIk2vEAvXwQnbwa7l/uoqDheBfoA44mrU
         MhXWWh/yLZZdmA2M8+OAtJpagp9mNi8W7sTOR2lVxAH27t3GQj0/sKHZZIo9nNSda0EU
         Jzh3EaCcxJ9wJMWrgFoa8pep6+ui9ljx1axUJ0pyw4aZ7C4XWuGuvQdn/D8D/lB67NGo
         Ezn4JVnG4KUbiwdF5BWHR3I7MyIXh9Tm6EHDA8UaL49W/WWGYX/VDGMDcag3cZqA9/1a
         RYqJPhp/qxKEkTrkOAC1G9DLp3h7xMuRYEK5Tr83jadqDVoXA/ecvZMvpkirTMdwDom7
         LIQg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DetoBs8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCVu1nU3TMyr6ZztOeQkpwUTQos9jGRNyGq8Np1R6/0BSjzn9WX6I1yA0ED2ZH94BJekzgyEEBTgeWUFVWZJE9h2s8C2uQ0+
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05622a04cb00b0042c3e9ed49bsi285240qtx.567.2024.02.06.18.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DetoBs8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXY3J-0003KG-OL; Tue, 06 Feb 2024 21:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY3J-0003Jv-09
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:45 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY3H-0000iE-H3
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:44 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d934c8f8f7so1699885ad.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707274362; x=1707879162; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwSkPSHiupn05u+RAeWRJRNLnJ0SRDTtyOincwirVhY=;
 b=DetoBs8CegDJzKFU3S775vQUiF8ehTIKfeHtS8JBOdpGcRSyzvTsmeAZcH/s4t6yA5
 1U8RYkfjJnZov1+RW0DQKQ9OjW4fCaplcIMDxbxR0vBK7fyoyFNO0MBk3WSZt8zhkTvr
 fB6YowJfe80IMJ7qgh1KSILUdRPce3N3Hd8chB4WyoSP12lKMtrMVy+EPPyosrO6mES+
 eagMF0lnuRvPX+UjUkJ2PYnfIxEtXf3xB6hJbbageDTT6HEMN9G/NxOgL8avSMJJsZ+E
 ytsIv6iiCHKzDImFNQ92yWWA5doy8m0kwSmjJWcJaFxzRNX6U+h/UJeBd4V+MhCRJVd/
 eIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707274362; x=1707879162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EwSkPSHiupn05u+RAeWRJRNLnJ0SRDTtyOincwirVhY=;
 b=BU1DikUMCrV2p1m4b2PWsziiFtGGajo0mWD0eyl7s0yQAdlLpVuCUbsR3WjlfkUEye
 FGFW+eth3dcFj1YvGQkqGdk2Ui33we4rXcmOBbJD7/k6mBlrUc8K1DYJCA3KKNb5ltLw
 fi4CL/KBcVB+qOYF2WYmCepNv908pjoa803XGopJ/o0Q32GRkrcpu5I2oPl8rdXo7jZq
 EZJ8nwcywU43q6mveo+LoRscKQuKH3UPTY1Fk/CoH5JBFeCf1KL8TehmCBryW31tTpBR
 367R/56PjaUtifS1RjI1E3iBKX9MIxNqiCqOG1MlWQPaecA6EYy6cebPPYCp3xwTR1+3
 gJcw==
X-Gm-Message-State: AOJu0YyBcXWwJF1fJ6Gw6aJlqy3ePq/THHQZZdDmpDJMUlzP3GIoFxBS
 xlU5hsmsazc8MCMZab7sE2aZwQQoqDYGDneth8JQsowdjCNECPsr7HnkBeBkq7A=
X-Received: by 2002:a17:903:442:b0:1d9:624e:126d with SMTP id
 iw2-20020a170903044200b001d9624e126dmr3298272plb.62.1707274362305; 
 Tue, 06 Feb 2024 18:52:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdM8CBAqet6sXU+v4XakJHPz2Xo7DnrAF6LFex+GVd1xuy/EAvBj995Jarghp1JVDN8kwpq1tBOyWW2x6v4oSzZ8JhR27Jx5AVbEFGZ/Zs/SFLoTWR44zvfkb+aaEL7fHCZkOIFPE8mQ0SatPHswFQgoj8JiRWQvUWIN4=
Received: from stoup.. (60-242-98-186.static.tpgi.com.au. [60.242.98.186])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d8ef97de4asm255435plb.38.2024.02.06.18.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:52:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 6/6] target/arm: Fix SVE/SME gross MTE suppression checks
Date: Wed,  7 Feb 2024 12:52:10 +1000
Message-Id: <20240207025210.8837-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207025210.8837-1-richard.henderson@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: edDLGj7Ej2iD

The TBI and TCMA bits are located within mtedesc, not desc.

Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c |  8 ++++----
 target/arm/tcg/sve_helper.c | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 1ee2690ceb..904bfdac43 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -573,8 +573,8 @@ void sme_ld1_mte(CPUARMState *env, void *za, uint64_t *vg,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
@@ -750,8 +750,8 @@ void sme_st1_mte(CPUARMState *env, void *za, uint64_t *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index bce4295d28..6853f58c19 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5800,8 +5800,8 @@ void sve_ldN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
@@ -6156,8 +6156,8 @@ void sve_ldnfff1_r_mte(CPUARMState *env, void *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
@@ -6410,8 +6410,8 @@ void sve_stN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
-- 
2.34.1

