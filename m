Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1277738lfk;
        Sun, 17 Apr 2022 11:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpAijQ/WFXzDAHZzaPx2qnMaf7cGdKodLsEe3Er9fL1WUyb5dptx0kOGym3A8qmKq3AmEA
X-Received: by 2002:a05:622a:6182:b0:2f1:e351:abcf with SMTP id hh2-20020a05622a618200b002f1e351abcfmr5015170qtb.321.1650219690911;
        Sun, 17 Apr 2022 11:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219690; cv=none;
        d=google.com; s=arc-20160816;
        b=e7YPL+vkd73w/UBKKHe/G0zDbDKv/1EOGLZAEO6Tf+77oW+2L5+UliMNYN+w3na9DP
         /iyaO0MRWM48+b7Jc+/DVSMUGWlCCNQxjqyTK4w6ocygxgStYYBinH4ZjOhb+QcJL0VD
         7xHG7BSXKZ/D6Hc1UY8fGDYlEleHLvk932jjW32HBH3lWxm21pPE35bU967aPNxR22YF
         nJ4KteB8KWv9nBymUxMMulBB2AwuWEvY1gpmcmywEIVo7xykQeFAHovTnn8u3pchbBqb
         ZjojAtttvL4bZtmtsuB4N8bMulstBaeI9fwsryFLwm7FymV4bSj8GpHmqtyoUZgy2Uma
         T+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9f+PlxCLNeNyBioSPuOwi62FLmam0QN4BYbQ6xWfffE=;
        b=jzlJxOcpolSIw5/NoA9CbU7kHIJfG57s90kpTfVzB5SIl2jAXBcs13PoRVqo8Up9Y+
         ANf4l8kKZzsPPLHGqD/8JHR2mBhVIFRA9F2psk2KoZI/2Ov7A38GJ/qatZQNOvp8dd1U
         w4MSbC1+UVh6BoM5Wzh2HzrwqoWy1iACxOX9Yiz50Jz1Y7mY9oWqwuCVHisMR2eKeMD+
         iJgVoLhNVW1SraQKLCZEEawlticlPkrGyRx2/Fx68wNehGYKa9kXtJz8RSprl5lVsuma
         lryNOa4gxR/KIug2UONCCALuwEWGYdwAJJO+DLTN8CQ/kadm4MK5k6Ck+Eb2U0CKEzhg
         igNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q5+ie27f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05620a44ce00b0069c03153969si2603412qkp.538.2022.04.17.11.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q5+ie27f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9Wc-0000y5-E8
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90P-0004V7-Sk
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90O-00043K-4G
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:13 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c12so10744597plr.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9f+PlxCLNeNyBioSPuOwi62FLmam0QN4BYbQ6xWfffE=;
 b=Q5+ie27fkjujR7+dLFpBF91AX5F3BvHYwsbkr8De1huyL94ArsSChoJUZmrQXO7LfG
 7lcBEO8PLMVMAxVmSH9VJz0li4YBEmsmLyfC46jQovSyXFbdL+PL4LrBivLjZ2y8aJ1r
 s6TM6ujXsmXQAzJ03mlQ/HjOwONiK+C+D6GAjb7zt/jsfU+VwkyKzfs6Hs3/AODNoHg+
 cfLpUyUQWQY1zetbNN6u50nuQlX3JIf8zGuejP01XQKQQtZ9u8/G+P+cB5WkQXVZvqAi
 VQkuNDMFE3D8pbe+M9yb6OWNHNqXqNKYmDCSyCHGgr/Vp9lkN4+lGH67rmDHXM2v32Pi
 i3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9f+PlxCLNeNyBioSPuOwi62FLmam0QN4BYbQ6xWfffE=;
 b=TvDF0OkUc8r9AMSB7QhgQ9jDH3dUiwtACKs7MogbNSVCM6xQQJLnggL9eXRcXHQqEg
 tHjEkxvIQIb9YC5rHyp9Q79zjviKCnuc5rN9SMZ7MsHdKLu+mqYZPCZeuSyL+QnFkky2
 2VKJ/S58Gh1slYA1ET+VpRMpsj6T2HgJF1p4AXERO5Wh2l+WkLPDvZpx21GszwWyML94
 J/ycslVWTD+E97aQhUw3V6SN1FiRVvF7D782LVGoz0ZLuSAoH27rJQGccc3htYhrKdsv
 zPdF+/9Z4sMs6Yo3IHKbD0QZUd3uE1IEPkRK+WnmF5rbeNWRTaF4ZRoNytf/hTdy7rA5
 8aNg==
X-Gm-Message-State: AOAM533qzoeb+Qv/yy7MW+XmHK3rgsvOiCObY6JPeACEpraV0cYiTsZ3
 OUsD+yq4fZLHo4/hVFHrze4qLYYCXxJppQ==
X-Received: by 2002:a17:902:8217:b0:156:9c4f:90eb with SMTP id
 x23-20020a170902821700b001569c4f90ebmr7423442pln.121.1650217690787; 
 Sun, 17 Apr 2022 10:48:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 47/60] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Sun, 17 Apr 2022 10:44:13 -0700
Message-Id: <20220417174426.711829-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ++b5nWIEEtBO

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 035f7cf9d0..c89c344de1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2003d0a8c9..136590382a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -797,7 +797,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b6fc3752f2..337598e949 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,8 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1

