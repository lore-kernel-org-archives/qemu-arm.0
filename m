Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp51042ejb;
        Fri, 26 Jan 2024 11:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdHN6NxnsSB949R+F/C5j5cxztRo0W7vsEoMDZuoqFI5iHTBmIKpSLdnB49WwxMW1uzd8+
X-Received: by 2002:a05:6214:20ec:b0:681:2fe6:6dcd with SMTP id 12-20020a05621420ec00b006812fe66dcdmr376466qvk.120.1706297703951;
        Fri, 26 Jan 2024 11:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706297703; cv=none;
        d=google.com; s=arc-20160816;
        b=yAQ2ilHgNVrUBX7wWVCKK4vH9HTHZvPWrTspEoAaVBNlIt1xiAXo2MGBeBSnx19c2m
         Pyv/0S+lKbw3qf+fdV276JPgU3slh2qGIKACWEUzc0BzLEkc2vRPb6PgwkP+5oGXF1Sg
         I1zl+ie2ju/mVzlRW7v1VZNJw4VwI/GEaowbTekPH0l5as70mZhX2jGgyhvXmuA5GIPY
         88e6vNbwEnPv4yA2jvKgqEJ75GlXlin6Qda0b8Dcb307cVRgxcvK4sqskst5WZMr+mYJ
         ETlYzqp4OZCVCE+dMeXAOxO/OxlvFbJA5tXdeGfSzbRAGhFrUWXOamVwrP184gyA5QxW
         C4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0TeAfcJDcGJDZye+r/25zW/L60aexsAJdtgh4QaVcLo=;
        fh=hUomQLa/s/gogr0u8ti5kBXrK7ipncypvawHBv3V55c=;
        b=yTpVbNm2hCF/lYs3al2W584yM02wC8CyeXW9nPQqhT1CeWoy2wLGlDuzFKVbzc0HP/
         of/oPSpSQowoyukBx2VKKQad+zKnrSGt+uafqyjEcCi1ddj8wluTId/m7no0WuE6Inyl
         +FPeXSgmXS+7aVEXimfNE5AyBjFeyT5I/f7Vb8w7eBS8q/aEP4HKnIqI47iRXvsvJzq8
         SerYpRUToPy11IlwLumGYCh91D1OONpRgwLhjzyjB1f3S17HqL4PzesJ5Ed92HLCJRwk
         x2V9mq6JdG4SDxwlRfveW60jXpf7+n3jT3l/xhF4F/GTXxEoE3XW8r9MIsHrP8sgFGuf
         AxDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKr+0W2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp7-20020ad45f87000000b00681977533b3si1927334qvb.510.2024.01.26.11.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 11:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKr+0W2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTRyS-0001We-8d; Fri, 26 Jan 2024 14:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTRyK-0001WB-9j
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 14:34:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTRyG-0002uq-KD
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 14:34:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40ee6ff0c7dso12145045e9.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 11:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706297674; x=1706902474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0TeAfcJDcGJDZye+r/25zW/L60aexsAJdtgh4QaVcLo=;
 b=RKr+0W2xM2CiSxZZc1M55Rq2RMCfGYsNBWunBMbAA+ZQSXCeavRleGZRlgKRZeVGqF
 NnowFL0GK4ntrYk0hLVvTBggVWotbRg1R811Ov4DGqSsD0mjquNj4azQPbwFw3UJesFP
 AAjXzlr5BIwDlr6Vegdrr96GeERDxltYrDlF+avIqtvr6KLtRCIEVAQxYSTAv4cr43YW
 G9TTF6kfRj5bVi3+MCRqzXSIY6zqLjHapqaowwM0YRP4QwaiGIgqnbg7hUZBQThHmxnB
 W2zTDw1l8cV+rnsECKPRWKiHfRTibyh2plvSh61TepBSiOVCbwlm8bVjgfnXF32T/N0U
 1pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706297674; x=1706902474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TeAfcJDcGJDZye+r/25zW/L60aexsAJdtgh4QaVcLo=;
 b=JybP6ISsN2To6rodimnhUvlxMKl1aCfQeR1z3L8ocgCWdWmbavJbPk7TqSPckA6sjs
 ou6qr+Y0HKArt0ki67rZDPJHVuVqhCacOkz9jyQgRcY7J9/Od1Iw/2cekRBAQ8TiBDyr
 6Zws8Vxtl5zaWTIJAPUJq20XuvW38fzgnYLCkoC4vG+2G9GiCU4aL+T0y/Dfp75aRcdH
 Nhhk6T24gKJLa3Jmj4mla7UhObzo8Lt28CXHyuNquO8ap+A7MY8soRfbtCICUGe+SKNf
 WVL4v0YriclU0IrqO6bl7nPg4ZNJThRBlUGDxRn2O9KyalqItRzu05MCtULvDZ6rSajc
 5Zug==
X-Gm-Message-State: AOJu0Yxf34BFCK8L1cNUy/BuVQPZKIl0lLF9w3+pbfr71NOZp7Zz2HUT
 n32pXS41TWxY/186xNK3uY0uPNh0FWdwqHhEaF8HaYuR/GPAbPMrnhnX0UTtVTVyxc1G0rY6fMm
 A
X-Received: by 2002:a05:600c:ad4:b0:40e:44a9:c2be with SMTP id
 c20-20020a05600c0ad400b0040e44a9c2bemr164051wmr.201.1706297674529; 
 Fri, 26 Jan 2024 11:34:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 he9-20020a05600c540900b0040ed1df542bsm2676611wmb.20.2024.01.26.11.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 11:34:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Reinstate "vfp" property on AArch32 CPUs
Date: Fri, 26 Jan 2024 19:34:32 +0000
Message-Id: <20240126193432.2210558-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: kdd1uDA6Ta7r

In commit 4315f7c614743 we restructured the logic for creating the
VFP related properties to avoid testing the aa32_simd_r32 feature on
AArch64 CPUs.  However in the process we accidentally stopped
exposing the "vfp" QOM property on AArch32 TCG CPUs.

This mostly hasn't had any ill effects because not many people want
to disable VFP, but it wasn't intentional.  Reinstate the property.

Cc: qemu-stable@nongnu.org
Fixes: 4315f7c614743 ("target/arm: Restructure has_vfp_d32 test")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2098
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 593695b4247..2bed5987619 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1620,6 +1620,10 @@ void arm_cpu_post_init(Object *obj)
         }
     } else if (cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
+        if (tcg_enabled() || qtest_enabled()) {
+            qdev_property_add_static(DEVICE(obj),
+                                     &arm_cpu_has_vfp_property);
+        }
         if (cpu_isar_feature(aa32_simd_r32, cpu)) {
             cpu->has_vfp_d32 = true;
             /*
-- 
2.34.1

