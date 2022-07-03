Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2441495lft;
        Sun, 3 Jul 2022 01:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vuMdMAg9+OewzmdZcJhAa+nPfnT5tTV6FOQI/RFj8NX1NAarxHAV8oC9GTXRxqiCL3LRPf
X-Received: by 2002:a25:888a:0:b0:669:9661:912 with SMTP id d10-20020a25888a000000b0066996610912mr23826750ybl.348.1656838105707;
        Sun, 03 Jul 2022 01:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838105; cv=none;
        d=google.com; s=arc-20160816;
        b=cwgTNzDLo+bgF1fkLf5CwrIFLqITtGiLQadtgcc55FkEzL5UgiCH+92p2ZnbAew/vf
         0uY+BjXN2M8YsxwWL5k5C0dnvRT7lVnuKIdz7nRYNTDn2oad3JYh966iIVzOfUJvCHSi
         K4vzSQmQ/kaZwKsLMVby1ieuLhdfOAOZxBK8i69QHYTX35yEnqoya3lhisWKGXcc2uph
         4YDxhobwkuKM2jzRitLf5isOOu4XHedyE34jBF+H0WZpUv9KlvRWQdC4COQfUaW1ZVJr
         YSWbWS/x0l2jjcNOEsAoBJJHYW6Hjn04czwI5kBVUf0L23XFdC9he6ubmVCtplTxBjHr
         4x/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GMzc8ik2WaalfDjtAiTiJK+N4oOIk3ZEdYeq0p1CiQs=;
        b=wuQtEzMZj30dcfuKJrk6bGoZrjG5mSptWWT/pDdNbaQVw2Irxh2dcym7q2XfgL2/3A
         NWfYtsMHzHlkU55PqytuKFi3aqSVCF18M8330pQaYtprlYC81BmH6MaSqfLdEpb8qEvW
         NgWxbUj8yh7aOdrItkKroY1FMvQawwPBx0zoIgmXQSHPokAx2kcOffLYhHYsDgWDliN2
         OLnSjBk/K/VkgRkJQbMPyXmhkE1H4RScEuBaLtTP1mt0oYMn8r5MNfMaB8tiZ7FtudVm
         Zu6sR5y/hzOLffdVAuMMtkpgMr3SeRBemDalD1q/5n0FiLnRy49i8ncLUEuro4Brw89l
         lkeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pJZzEUNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d126-20020a25cd84000000b0066e34104991si2047826ybf.590.2022.07.03.01.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pJZzEUNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vHF-00065c-3x
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvA-00081i-RG
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv9-0006AU-B4
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id z1so233779plb.1
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMzc8ik2WaalfDjtAiTiJK+N4oOIk3ZEdYeq0p1CiQs=;
 b=pJZzEUNhu6evPQEA1E/wOE2O9oGgNa/7QzzT0LKPZVcs1zoLgfBwT8/gwYO/GWkxrd
 zXeFd5NLCPx6St5HUOMq13N0XBqo5pAFHQ0ZBSqDcVeGJEibvosPG+skA0r+0VxR5I0N
 hUy/KRJ8bhYMDShS8Xw1OoDeumR+/kfQpToQT5aOZ6S/8hnXdSAccOGKNkua0a3Lb7nK
 eZLyvI/r8oG2vJ3TkqOIPCtgt7S0K8Op5W3aLpj4+8oPyTuLLnRoNuiTIklMqL3kmoiY
 Q4pnz5sQgwcKUTLDN4RDZ1wgnchwo58Xx1Z8rcEeu/Nqw4/OXHRlqgBjGJdegN/sYP74
 jT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMzc8ik2WaalfDjtAiTiJK+N4oOIk3ZEdYeq0p1CiQs=;
 b=3lIzRLlb3W+IzqmLPXGnXvb422rsj0z5hBXRd2CqtZMX3NjH5pDsjHNyyCgsxfpOXK
 Z8x92IYJWDpviAEpJ3S0heUktjDeXWjP9F4qu7Bcg5BGRVaEcd+Ac7dpCVrdP2h7g9y+
 oj3TFQWU23qwR4mnqC9rT61uP75EsNDysL3mGLyCl4AjsvpuSv3B0EsIuexWIR+fM+62
 ggU+rg3KC1hBmaq9I/NpaorxPhiRYPeI86vZBe8MTWksubncH7EtwF5LI31J8GVMmOuL
 M6QfP1MBkBt+welBVSOEfkRaNR8q51kYS2wqWL+rxD85GNxGt5V4KgZRNB3Yaiyt9nQo
 hmaA==
X-Gm-Message-State: AJIora8i3iEdTvkugR5/EJxqoL/go4YLd0flYawRKr5YxFPLEoxdzwqB
 Bm5ol6EJ+FkYgHJe6qLXvjB2hg==
X-Received: by 2002:a17:90b:3b4a:b0:1ed:38a0:d45f with SMTP id
 ot10-20020a17090b3b4a00b001ed38a0d45fmr29549330pjb.87.1656836733988; 
 Sun, 03 Jul 2022 01:25:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/62] target/arm: Add secure parameter to get_phys_addr_pmsav8
Date: Sun,  3 Jul 2022 13:53:39 +0530
Message-Id: <20220703082419.770989-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: sH530FJYFVZg

Remove the use of regime_is_secure from get_phys_addr_pmsav8.
Since we already had a local variable named secure, use that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d424dec729..f7892a0c48 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
 
@@ -2408,7 +2407,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1

