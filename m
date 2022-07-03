Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2439380lft;
        Sun, 3 Jul 2022 01:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1suhUGCsPakXyodHfk4bAmmuYHnH3DnlPn8o9YGI+f9Q+Qe8qrJL1Y808jS5UWJai9+H8ik
X-Received: by 2002:a5b:54e:0:b0:66d:840e:1690 with SMTP id r14-20020a5b054e000000b0066d840e1690mr21459377ybp.610.1656837734059;
        Sun, 03 Jul 2022 01:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837734; cv=none;
        d=google.com; s=arc-20160816;
        b=nnItsQQvYienJvW7Nc0s1QQZTcIMipt3EsQqTUQwHcN0GiZNA0+a0Oxm9kmb1cNwIH
         GbVBYHvdjnDSaRHpBVsCkPyBKsjeVSxcvDxC3hCXnA/dsNHjKo5lWZgDVFDlTCwZgvtL
         wAuVN4161TK4Lu9QA6bi7gBm78x28IVdr4t8DNN8syqeynXXLkhzIwYU2xaegw5uDKnq
         ulynI7hVPXJ2q3LcM/7D4oMd1bM4KCfrMYbLHTL9LzAjddPXFrnwQrzRQrC7/WBKY6dc
         qerusaMb08xMZnGS8CwWN3yr59sORMMaf/tLPMMMWOLjMT3mIieiE7uXQOJWwJIgWOGk
         beBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TKxPLdADuP+9Wny++zRwM0SIOJMxWQvaLP+5vkpY9No=;
        b=nDYikrF1WNL89ntuyuH9im+qU9v18QaC1h2W/cHNT8r5a+gQVy9XpNYgULxjBiQGa4
         z0OdbujEzXr/iyF82yZWwTQpk4tUbm0EqoJOlwhEYM8OQsW0Grp/+qV2h0wsS0hL2ZgE
         4iHxzVzqyAvXvMPshGX6xFJgCXenFgzea6xFIX/FSNZJIR/o7Xorkpr8scg6B1rM9nZW
         cYMa7NrNguQKuK3nh6ylrsrAomm4JQHYOB/5wXG4k2Xmg6guYjs6BE5cD3DlMlNQWekg
         mAXEFSjKGJN/fLvwuQ+VZe8D8K02QGMfj7Hf0KLDcMd36Tdk5m/ESqLAgIXxp8weAsHA
         i/4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9pIIYQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a81130d000000b0031838b0fe0csi35487370ywt.102.2022.07.03.01.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9pIIYQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vBF-0003aW-FJ
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvI-00087f-MB
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:44 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvH-0006Be-5e
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:44 -0400
Received: by mail-pg1-x532.google.com with SMTP id 9so6247301pgd.7
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKxPLdADuP+9Wny++zRwM0SIOJMxWQvaLP+5vkpY9No=;
 b=b9pIIYQVgizkZFuPY7R9iz9m/b+NrgzmZ13vHVVS1TsFeblNOzZUnMY0ZDo6Yx11ZY
 +zawq54DqhU0UpYE7UJNEIX5qzT3OH3zUZChIOto8r67ocyLmd27UtWokh8Ly5eZytD/
 mGtr1ozqLKHRCbhNsZWdjroa8RrXH6cYoxClTAFktP6Wy4HjF9aZiEPAqW0O/FLR2uA0
 F2us+XTTpPpIp7Xl/iA9ITbNCAv6WFgWQFwrot6ffgefOfDpSvN5ulqAY1uHNBWCuYny
 Yb6g3fWRs3y2DzvL1w3R+K01GfCWpo0mDvO/WsClzv1j1r3juTqwSSisoLrbtpPopO8l
 W98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKxPLdADuP+9Wny++zRwM0SIOJMxWQvaLP+5vkpY9No=;
 b=2FoLpBaq7dQwGULI0o7gt+z++o4iNcpGIr9Ev1yEkmukhi8g4luXOcnnEtqBSTuZ+a
 OEdokEGHBmSZQHSS+/QLLArshLfJikIQlY4t/VTy+kqW/j7DVnRJ91shQfLLJkPX779p
 8zhlzAwgBJXANKdL38uXySrluqU7ilRF5mybiCiSfV7b5WNjFkPEEMBtlKxs25EF/D1q
 DuEP937g19/XbIUC1cEIcB1NsqF2lPwuj82JPmToQWKTeQArkRSvFVVdJe0ZiQnTy/t5
 VDEAzoHDIPTgMK6udutXRC2g5jd+z8YMH+m2jOJ6/PKO5LwftwQX2piVGdjdIsKtBIPN
 79Hg==
X-Gm-Message-State: AJIora+MW2rfUGMaKqJ/ly+0Vc+JmY/4MHWJ/Vh9S/841qukRjOIU9CC
 x5cd5gayrZiA5abwUgel2X6IbI5Hmx471XW/
X-Received: by 2002:a63:4759:0:b0:412:434a:1192 with SMTP id
 w25-20020a634759000000b00412434a1192mr75732pgk.602.1656836741856; 
 Sun, 03 Jul 2022 01:25:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/62] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav7
Date: Sun,  3 Jul 2022 13:53:42 +0530
Message-Id: <20220703082419.770989-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-TUID: uxMqwkm2ClB0

Remove the use of regime_is_secure from get_phys_addr_pmsav7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b883826643..33fa8f094b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1506,12 +1506,11 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
-    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -2411,7 +2410,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.34.1

