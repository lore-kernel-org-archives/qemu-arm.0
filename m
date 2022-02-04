Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2709376lfk;
        Fri, 4 Feb 2022 09:02:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgYeH+MjVwS2WDcKL9utElY+JSOf0X1bGJBlJfRNagZ54OtIsoKUrbgyyL5IwVTf6h1QMe
X-Received: by 2002:a25:e5c7:: with SMTP id c190mr18420ybh.175.1643994146858;
        Fri, 04 Feb 2022 09:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643994146; cv=none;
        d=google.com; s=arc-20160816;
        b=tjpqef/T5W4SQEan5IzuPHj9eS2KDnBE03kZvvG6YA8jlyRqX660wVVBKofNLmC47w
         0P7l6dDg5ArfCTARBhlX6BbSLYVG8MI9T4tJj7BSjWGkuMHXjK4cVecU9aQ3YllEj8gy
         RdEy3euMrwuNhmhhnG98BhoCaDORUgknogyIytT8WE4m4iHphmQsm1ujAxfkgE4siQ70
         0TWKf3a1kg14sEUsoO8/u+yxH8GAgUf7nCY8a5keA84al7eCfGBe3ZnJelt+oJkb+why
         FMQMpWx9Domp7sfG8FxBIDUd5gJs0mhsV7WaTk92+1f0LCcJ4Esvaw9buE1GaIkMJaVV
         lrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q3lEtc5flDNZqu3pjs5Zh2F0vIL0PpXE6vU56vUELAY=;
        b=sGfEOw8ryFkzCioh2nl9VrkpQYmjoaoVzDbUAdkQwyhBdNFEVuvlCCq0WJIu2Xuu6B
         iDxwpAS4zU8Ajnt6oDs3K+q38Q/LaQOWySF+Ra2Ksd70WwQlCJqsMumefofBWfP9o1sS
         uidIFd3n/B8uf5RR6w1muLtwPLMmvP51dK3IT3ntxv7Qv8jd/utQJJRoHNTiE3NtEk85
         nLN71GlusXaCBq1qKWkVCFwTT2lZHsJtENt/kJkDmbBbVQLtsirSsAl8W/+LsdaKPQ85
         0154Fg9la4QqIWnH4xNJyn5KZg7+/1tIiVE+dghHrgOgt/yJBRv/kPNDk1Log1cKo4vq
         sX7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qMiNaxDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k188si1748521ywb.1.2022.02.04.09.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 09:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qMiNaxDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG1yc-0000P4-8s
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 12:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1s0-0002h5-7f
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:36 -0500
Received: from [2a00:1450:4864:20::434] (port=38561
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rn-0003Ch-Mu
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:34 -0500
Received: by mail-wr1-x434.google.com with SMTP id s10so9900892wra.5
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3lEtc5flDNZqu3pjs5Zh2F0vIL0PpXE6vU56vUELAY=;
 b=qMiNaxDCdLYY+0bp2GFATzDbwVh9oh4no7rnM4RUGCQf9bqIOrLdiRabeI7iSA6RUY
 l21pkwzUHwxks9whV8LWWGDO/mcW94f7WkW+cG4ny82IFsweX6il0f3ZiuJfAQzgUQ25
 rSyK1QNlCgao38UCh55GmWx3KuSjJwjD48EWkm8CBirFdgnIbglwbe1PVLjLM8gj7BjN
 L80gq5T8/4chIVC4iG7wYcMvgZGOaokWygDxKeOrBhWHEPVObG9to7eqNuVW+FrVkuWr
 oPy63lppSGJEbzQHJUG0gynqExMBsU0PpmtLS+vNFYA+RK5DN27xKyrIA5uk/OTo/2BX
 mCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3lEtc5flDNZqu3pjs5Zh2F0vIL0PpXE6vU56vUELAY=;
 b=2dQnIihMpY2LxHXq9GdCin14JMDE+P4vHKdm1sDLjHrQgOUddYLDTWlLU4dnhOZUdT
 UL4Hfv5ZiO/uYmDtc6OTaE7XL6ERfcSE594OMMsYiRuFA3N/2uI9U/XDzeqW6xpos++w
 JS5D6h9f7XdXmvzJVvCpWxQkQH6q+Q19IR2/wbsE+7qJ5+RjuNymjhNsNkdr35FpqOfv
 k9igKgjrsizWrOvxoxLN95xStZZ6eJ6xAXF4A8IdgGuDvaXl8PKGWf3/h/Goc7JD0tae
 pvRlG1ywZVyw/m6ZYen0NSQAp8lS88VKsNGtayb3GBXWdtTaBlSpRfeiIe1TMa5OIeQR
 f11A==
X-Gm-Message-State: AOAM530/bDGgf/CifjDqDcoUtNZdoiCBgHjzS6VxWL6RpB6gLY0zhFHh
 WNUQx8ICgjzKAAzHT2cjhTDxpOvFLzHvdQ==
X-Received: by 2002:a05:6000:184f:: with SMTP id
 c15mr3204888wri.218.1643993710666; 
 Fri, 04 Feb 2022 08:55:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/arm: Make KVM -cpu max exactly like -cpu host
Date: Fri,  4 Feb 2022 16:55:03 +0000
Message-Id: <20220204165506.2846058-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmHeprYppLRv

Currently for KVM the intention is that '-cpu max' and '-cpu host'
are the same thing, but because we did this with two separate
pieces of code they have got a little bit out of sync. Specifically,
'max' has a 'sve-max-vq' property, and 'host' does not.

Bring the two together by having the initfn for 'max' actually
call the initfn for 'host'. This will result in 'max' no longer
exposing the 'sve-max-vq' property when using KVM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 590ac562714..ae2e431247f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,22 +682,22 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void aarch64_host_initfn(Object *obj)
 {
+#if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef CONFIG_KVM
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
     }
-#else
+#elif defined(CONFIG_HVF)
+    ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
+#else
+    g_assert_not_reached();
 #endif
 }
-#endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
@@ -709,7 +709,9 @@ static void aarch64_max_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     if (kvm_enabled()) {
-        kvm_arm_set_cpu_features_from_host(cpu);
+        /* With KVM, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_initfn(obj);
+        return;
     } else {
         uint64_t t;
         uint32_t u;
-- 
2.25.1

