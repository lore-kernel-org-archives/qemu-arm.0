Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp478784lfu;
        Sat, 30 Apr 2022 23:33:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFSMQZu0K9E6yd0rU6nAdN3Bs4XCI+rIa28m2L9WimgZJy8N/JjhwRoxlWPOyjK8X1+VC6
X-Received: by 2002:ae9:dc01:0:b0:69c:7c3d:aba0 with SMTP id q1-20020ae9dc01000000b0069c7c3daba0mr4787234qkf.368.1651386803865;
        Sat, 30 Apr 2022 23:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651386803; cv=none;
        d=google.com; s=arc-20160816;
        b=VBwue/g7sLukizQ7ob/cGYMNUrpBse8WOl5bM0adAPC0sgVaTgNmcc4OpTx58DzA2g
         4AyL1qDjgC54XbrtLfrdRDrGSk/wDpjifsdOoED/5wK3B3rDq4mQ1mow3FlnOplWZisW
         yhPaCw/CfaLNNQ2xM8CP8uVKsTxRstrsds0IidxzM/+jFqtdCC1ehktTCWIXYv56SavT
         XYjb5M05gRWDVZbdFZOFXAnKIJntCEydm03QSi310ovQAoD4c5dZtCFUpDCpm4BPyY7E
         9ZHynK2RSSU4pAYrF+kRYh801bv+7mDbbCvyLYs8Ex6xK+ChUWWacRe08bAQsTZXpnzi
         hUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qbh2KrYpsf5bd2gq07XULYnsZ3c1pnWPBFUbrKfWACk=;
        b=WvxbSTD8TVng4YIqnMQR0E2umTi0TMF4sUT0LVoLlk/mUAzUWlfPsTHW0WEJZDGGQz
         cSylGiEaT5NhcQiMP5Yzx49OM5OzpVny8LhicV7Rk3TYkBxAhV4MqwQyvk9q/BCjl11F
         IA0N44xUjjXwZg4DA0ASCjpAbOwqa8Ajts2uyUHAwOvBcZBfQsPx67U1Ju2U2a+9McpU
         BtQZsJ9nNfZDp0ItufFb/kIywTX8h0kX9CW7x10ZS23bpymAQcVuBr0UAIZvSIRjl1V3
         JeStg446SYaCBkaGDdEVww2/F59DYz+Yi90xoTCj6k2Y6PLzvY7gqxGGlJDySrXHkL+V
         0uNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GfYoNQGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a37f905000000b0069ee38b7019si4636723qkj.231.2022.04.30.23.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GfYoNQGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl391-0004Jz-Bp
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U2-00071N-89
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:08 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U0-0001Ms-AK
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so13756264pju.2
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbh2KrYpsf5bd2gq07XULYnsZ3c1pnWPBFUbrKfWACk=;
 b=GfYoNQGYhO9BREdXE5ZBliAovdNBBuUSGrf4ggj/sjXsGD/DGXDM7FfNZYvMqRgzNw
 0M/N4JijmUhN1eDqvGC59bcoGCsw032ufa/QQMRrQthmK3lC4uduqYVA/tPoUAf5HAxt
 VmtC76oe0vCtVFW8NE/MV1ZXCNhhTfEEcoPKFw6T5cn5kiIvDbRyxSukQW/Pr5MwzO8K
 G62g/CTAd6e6QOWfi/Grw2IS8sgI4fthtBl89rhXz9Of4BM9AegXKV1mhk2My4DSKVKH
 c8JdxPHlMoD5dW4r2/ZUxAaI6ZeswVNHQi2EXK7idlHkUstWnxCxzqQmDspmMcNHYV35
 Uycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbh2KrYpsf5bd2gq07XULYnsZ3c1pnWPBFUbrKfWACk=;
 b=4OdcDZo2WPxh0RX33CRa5czseB5ZkSP9JA9yvBQwG3LpTg7mqZgzoIX2Z0lSGnCHQR
 q5E5kXyXFEsgVC0zrDzbf4BmCHsPcZGmueEwKnLp0xlPHRh/Zu+den3AEeQLDQhgwUpo
 7o4YsqveSg45bXvmfw5Mo7MHZx4QeBvDzpa96MQu8NjniLZAdJJjaS3+MbK2O0q7Vsqc
 afH0qqzAnPXNp7QWh7hrT8o3yrP7kYo5C86Dvcs+/rCzs5p4D4s/+DfCZKigmouv99Rn
 HdxbMCqxeCXQTtN+w/X+1Q+nUeNOKezWJwMDxTDwqI2yACXt+Hw7yxpgpwqYozWpmXzG
 NagQ==
X-Gm-Message-State: AOAM531xu/z2WxmmsmSdB9oP4UepLd6FnG+6tycsBi832JTiMKETer1u
 SUI7Za33nT0ITSjVFqWm4KRGXg==
X-Received: by 2002:a17:902:d48a:b0:15e:a142:a9e8 with SMTP id
 c10-20020a170902d48a00b0015ea142a9e8mr552466plg.129.1651384259104; 
 Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/45] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Sat, 30 Apr 2022 22:50:12 -0700
Message-Id: <20220501055028.646596-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WSb4eTQUhNGs

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6e8b39dc9e..1b509bbd2a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1799,11 +1799,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1834,12 +1836,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1

