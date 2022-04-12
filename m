Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2005921lfq;
        Mon, 11 Apr 2022 17:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOa7b2RikYR4K8KGnfax/Dt+s32lE18DZ6QH3UEp7ayB2KXGCo9dKWtjCGavKKMJSJSSHg
X-Received: by 2002:a05:6902:706:b0:641:5f7d:8ff2 with SMTP id k6-20020a056902070600b006415f7d8ff2mr6047132ybt.80.1649723916187;
        Mon, 11 Apr 2022 17:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649723916; cv=none;
        d=google.com; s=arc-20160816;
        b=d+j/hEEAIL7mVPi4lMBqYOkzf+CDH+ouSK0kpP9buBCQtj6SkfkVkN8NmiXZ81r9iV
         vJwcZrnNKbxOr45UWcGfgiqFUOaFJ2ZPJJvdUzZXHGnePTyiwDzhW9YPtF22gAzJ2SA1
         /znVDKRBabU+pc+WmL5ricXY1FytBH2gfxN122TFdCPsJ0q7jsez83HvQ+a7zEyfzCWy
         EMuBEd9nC94uVjDi5yZ5wIHkUbOQ7NeHesdzWqA0AXuQOlfUx9O3pKafJO/PiHkFj4hP
         mjlhx80hqWsZmfzlHEuW2w7PbXrHHSYd6ayj5MgvSsqY8Nf/ZDq2eR2aSUDrNqsobrd8
         sW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8luVauhihyr0PwbhR6mFW3lQ8iZWOtf74oqGGDI3uYM=;
        b=sp0SDBI3RNp3lvmpMGG6qo8whTUuZVPN+2OkNALZoV5jcxVt6PJnk95VlB77ZV1b6E
         QpR+E9Bo1lcpDXAGr8j72rtJpeiUs8sfk7Ecn1U2aumn80kdtMGBC37ZcIVJiIghnUVU
         8ROVzX3eqv3xC/UbRao/8SAqB2QwyF5Tgp9r5qDpcpDtPdz0y4UC0FUWsS4dXm/HJX+t
         MvSYvL9PVD0YVAIgeFwEwhix72Cn36lQeeD/hGicWXjnkND4DFzstERfaUYIM/ooLXO1
         P0RT//z4lJ/+3xBF3iiA4ZMu75NeSsGAIxT6xtw35GDY3g8qe20b/d3ivdaSf3KEOsaj
         dyYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SMDna9xJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 200-20020a8109d1000000b002e5bb9dcab9si4926323ywj.322.2022.04.11.17.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SMDna9xJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4YF-0000Hw-KE
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TS-0001sM-9K
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:40 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TQ-0001q2-OX
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:38 -0400
Received: by mail-pl1-x632.google.com with SMTP id q3so4066004plg.3
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8luVauhihyr0PwbhR6mFW3lQ8iZWOtf74oqGGDI3uYM=;
 b=SMDna9xJ/wEfmSYqkkoBDDM6t1ZYkikLVsXMS6cUMcErY080AmRZm3dYRZNuQJpKPN
 tW1IYRPRz4olbl8QY4iJwlv9KQz97qdx0GvJxHpgAP6y3Ei7TO0NgymWLrEvv+bgy6Go
 HKo5LvKxiQEPtue8a03vbHP+DuQbReJGwCrOd1s/pt+Fbkt2Wf8X3CMzcEnTkvunUJ3Z
 BKhkcGOXrQifL3FJLQYgnM0GfMPJRVtzrq0Rhi/QZVI8Au/XEFPtQg3atf2iDA+29BOZ
 5etx7vIMDPoHSaTBJhJ2jyKLH+KWY1e229PAg2bo+EeTUrsUvkm61Lfvd4jxJQ4WmXzP
 awAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8luVauhihyr0PwbhR6mFW3lQ8iZWOtf74oqGGDI3uYM=;
 b=bmXPLYyZ0xAJakhX1S0cQMtY/297xE9FpwYQbQThEBU1LCW4+zWSR9zyIVrjfcDcXI
 pMnkgKxl0at6FJ3MtKZgCX8rgq4POIailfLmvyMWnhWiSo32y1Y8NWROkUTmV/9YuO4z
 gM8a9gcBHmkv+OkASwpnYT3TXuXY+Dxo7MnV0D9xmoototKioj3SlnIy9xAjahdvfzCh
 8JmQmBEWX89yynrFByoXa8MN2vwAay9l778HCVSYf9H78FTgreC104uR6+y4Fk1dxI7L
 TjGqVT/pXIFSgfYmKZeQR3eZ+KTbwO+PucqwuDculElp91vzHaqOSI4EjhQJWHqlQWp6
 JeqA==
X-Gm-Message-State: AOAM531JEiURYbhnK8jHJeOVIuKCqwZ+jGqgSHqDG6/ZJPihQetJfxU8
 SbUtJhDZWQsDEZXkAQwSaJR58w==
X-Received: by 2002:a17:902:70cc:b0:154:1cc8:9df8 with SMTP id
 l12-20020a17090270cc00b001541cc89df8mr35322752plt.32.1649723615480; 
 Mon, 11 Apr 2022 17:33:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Mon, 11 Apr 2022 17:33:10 -0700
Message-Id: <20220412003326.588530-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: pG31C68aNYA5

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a227..6521f350f9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1795,11 +1795,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -1830,12 +1832,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
2.25.1

