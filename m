Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1008599ejc;
        Mon, 22 Aug 2022 09:23:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4MFxvfEx17O1P9fTSTdg2tFoKNcgPCOvJVZfF7MO/eAZiGiqkghNpFR4AdxnOQqZ2IEZeE
X-Received: by 2002:a05:620a:25e:b0:6bb:2bb1:dd3a with SMTP id q30-20020a05620a025e00b006bb2bb1dd3amr13177671qkn.236.1661185396140;
        Mon, 22 Aug 2022 09:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661185396; cv=none;
        d=google.com; s=arc-20160816;
        b=LilMqxxVmEn5WUjUsINJ6gMiN3o8ERcZfPIZ/pD+sK30FSfEozyFxHn/bnO0gLNFgU
         FoSAhfByAykMu6VT4Kc39e+0CwRzHQjxs9zif82ljo6K3LeyngIA4kRbwkcOY3ePrbRO
         NfROnR+v50/FFTQCMn1ThdDSaZyshLsOgVPFaazLJ2Hi0Cxrsv6fia0utesk2SVcT/4O
         1oQomQDirXz2SkW6EkzzqeNQkc+9vAv4KYqQJJZQHLLcqA6gv7bostxuRedMNPuhZFVZ
         n4nFEawbnV26OV6qbh/50DxQCAUGm9v6lsCYn+H9XE6+8NBI+3xZuPCwjHVfyXHT4B5I
         JcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r2s4x+bZJOY5/giT1jRp8us14Aquo3FqXDJ1E/9NmhQ=;
        b=BwYAyYIuGEmsXuwIH7iuBFSNDLuf0Mv46t5JmEbYXR5ByZDEjxAHQqyva0JQuKgXr8
         HYScmPwShLzSUEhwYldL06/KFbUouaijy6C6P2RxfgSQnkFPT4qUxKZBGepcU5U0qVWg
         6LkbHskyQTRhfpchZ2o3nY0xZDk/ji/jxSYMoYkbkn1fnHZin9UzY9uLl/odgquVZzsf
         3vo19u+2JDks5HV9w+3v7RFX8FZtFYOTdKoJXs3VWzdL7lWgdigbXOegOXl4ZJNVINAw
         cVfRYf1Mdw8sqchj95a7TiR4TRlL3i+810I8AkDqs6fZrDbwz8NiRz9iEt7gtIyCGfSs
         tR8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohq2sb2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl18-20020a05620a1a9200b006bb9b8a4228si4777124qkb.751.2022.08.22.09.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohq2sb2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQACp-0007rl-J8
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lm-0000EX-Tf
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LW-0000q6-5x
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 20so10226438plo.10
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=r2s4x+bZJOY5/giT1jRp8us14Aquo3FqXDJ1E/9NmhQ=;
 b=ohq2sb2ouf5s7iCm7STCUZ7jD7GI/JbnAn8Uuar98848AM9CBHWznKj+61xbvnY1G0
 UMC4kHp6AicUdlf8UDtGtPq5VUk9gn7LFEvaynedFDe4qGyYXIpu5plgBsOyLM4e2GQP
 Oa5aNC0+Md4uuLvtyrr3EKXtlfagdFXpLsrfpMtK+FAwPRaOqp+yVPbqoMmELYVG7OTJ
 EPLu1NzZq1OU7cqhVHmoO5SY2xXI7GbJcZj1KHqooqWl9IublyZ4t8v57svtOrEa/N6X
 OUvl0bPQEc92zCLfdY70Y1Ac1ymtJWfWvho9Sn6UX6J/nST3XKaOWCqME4NXUQUQmoNU
 kt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=r2s4x+bZJOY5/giT1jRp8us14Aquo3FqXDJ1E/9NmhQ=;
 b=pkUIJN8ege4rh/TqMAletxqSamcHFr60XfIS+l4HdkaUfG5rZpft+7H8eO5Gm5HUTJ
 jUTAHcM7Od9R1hqkhuvYHG15hmtS1ta6T5VpVwnM3fNVcuhz5lqsLnPJhTHblkOPHPz2
 +irLuVsdlKPHTklJVz74rOPBKtT+BjbFVMbGg+tlk79a2+PvuQCDoLv3YBK1+8AMnEDr
 N5KOOy/imlgW/uaaZb9JVSlR72nU7fOIAFbgSuH9pyZZ3Qx4N8vQoWIHBQlQxBRBbu8T
 3FdL24KI98KvhtrgrzdKVUjcdf/hO3BcqDkqRVeQMvNHDOpTb1zlU82qeIE3QA3NNOrW
 0fZQ==
X-Gm-Message-State: ACgBeo3D3YfmsID99saVfnCUt4abE7tmU6HpWpWxouPGxZTdhNX4b6fp
 R3gWVeUrswz5NqYExHYHsJW0L0sY5jehgA==
X-Received: by 2002:a17:902:dac6:b0:172:e3c6:2b39 with SMTP id
 q6-20020a170902dac600b00172e3c62b39mr6979175plx.84.1661182088068; 
 Mon, 22 Aug 2022 08:28:08 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 31/66] target/arm: Fix S2 disabled check in S1_ptw_translate
Date: Mon, 22 Aug 2022 08:27:06 -0700
Message-Id: <20220822152741.1617527-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KLotcpHhDpjY

Pass the correct stage2 mmu_idx to regime_translation_disabled,
which we computed afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dbe5852af6..680139b478 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -211,11 +211,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
+    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
-        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
-                                         : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
-- 
2.34.1

