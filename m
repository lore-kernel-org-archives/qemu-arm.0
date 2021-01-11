Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3061214lfq;
        Mon, 11 Jan 2021 15:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQzMaGxCW/6vK0cKRgXz1uXRK3WwxHWuwHfT+8e1WVmp1O6Bw7MxMCCAZnrESkQsk1wznK
X-Received: by 2002:a25:c74e:: with SMTP id w75mr3019140ybe.520.1610406703722;
        Mon, 11 Jan 2021 15:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610406703; cv=none;
        d=google.com; s=arc-20160816;
        b=f6dCtgTU4YQAuHlIMgixwCTRzHfJiS+uQuwJ2WcO4mrhFOo9/w1xiQq8p8TgS1necj
         7YkAaFdXxV116jS8gsPCBkNcISjgbMr9BVHNUYb8tcys1oDiwYWDQC8wlECuukyVXfMc
         +/KWh/RwSgH9JBoni0lchsNtwetq4NtAMEbQxmCYhN/hyoXCupjFY3O+1OnoG9g0mCtv
         pKnK4g1pdznNTDLXnm3Ri6NxCNma/Sczp0CBGpHp6p36CjRLAjexNtC/OvYwKXdwRD5P
         PCHbNWEv0Wx17aroH28gnVRAZJ/WSRrDiTFc/U0yB5MQVqZ54N/AhTMaRWTFD/umr7ue
         KZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
        b=f+8lHtgehlT1jtsWyMyNGr9+f9DJjMzbG/DqPd/cBdc1q0qg74eMWPYqHznyEizZpf
         pFBssk0yesTx+3un+wyVUSOls6gi3PkKLNvaFsi6drxxCoYtxfYqkaHwr11AIMIANF8P
         mhv2jtUopvBFirgJI2x2Diw+bMzK/Y+1RoTiZL/d6chdtFCp5TwNzSFwUBDyF36PWCPq
         IssESNgUeZeSWvoSfz9es52u9c9l6Rg5S1LiXgy1bO+vng07Cv0UtEayaJLGeDIQHUz4
         /Kz3m/xHzitl+gD0xUy5KmlLqfai97EXxcfoYvSxOsld+C1FY44JNVaRR49dJAbYvxfv
         Xm5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LoZfIxoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m133si1135274ybf.192.2021.01.11.15.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 15:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LoZfIxoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz6Lf-00059X-4Y
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 18:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LL-0004hI-LO
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:11:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LG-0006Ce-Gu
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:11:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id n3so607749pjm.1
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=LoZfIxoD7Nz1tDre55zbWQu0XPFcB8AXj6EfmE950Jsx0jdtFtFVexhVD2cFyLyRYH
 vFOAjSmRX1AhFRNCVURM1mU5FsQ4OMZyDRVj1sR9Rs6cY2S+WwXVZR2OIzwkncgxF14u
 96y8wWqLUYYV8N/Bw182BX8p08yjRnYYi1eGN8j4oQAp603PSZVr4aiIHyA9HmduQrnk
 YmKnFOuOa2jCtXCxQYjBHPNmuM7bZx0Ue+uPi8I4Bay6tasdvjTPK/LELM16OaOTQbn4
 MS7RxXO3uE9swpV03k5g/C6jA6bxhVfCKh3JHeW+aUFO2Pnpmi1KfnHyaNYoiJq2pWB1
 02PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=t/fCr3TtctVwzcVtXuhT3q6mYH/4kRz0rgSYH3Gm0qT3NXO7batJb46UH0l2/OUDIB
 UOtgXb7MqSejIdC8Mx/Dr/yDZ8r04aT6YnWy5mcvhxxGqsPPOBH6zrFZGhakmQYjx8NC
 kgmF50EERkyHk74ekMKxvsPuS/MTPhytB29ax0aYVIrc2vGPxVQadECfSflqNFgrBJUH
 NOyZMZK05xCflxcWY2HqZAU9IkU1MZpnoJ8MDOtM5Teiuu+Zjnh+OTbco/352lik+5KE
 PrQC7ulKPW3Z3KXwb7Wsibb17QL06Ljfe0aj+1E30HIx7CjSEhDbBwAGzC/ocySDZSsk
 obDA==
X-Gm-Message-State: AOAM533RUXJDgqfR/23wjpInBjBS9ZoVlqi+Clqw76BK589kY2ff+Dhb
 223QFQUvsHZ88yLMthCaRx1PFA==
X-Received: by 2002:a17:90a:c082:: with SMTP id
 o2mr1211934pjs.197.1610406677218; 
 Mon, 11 Jan 2021 15:11:17 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm658105pfb.196.2021.01.11.15.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:11:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/3] target/arm: Use object_property_add_bool for "sve"
 property
Date: Mon, 11 Jan 2021 13:11:08 -1000
Message-Id: <20210111231108.461088-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111231108.461088-1-richard.henderson@linaro.org>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dduIfKeroXOP

The interface for object_property_add_bool is simpler,
making the code easier to understand.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d9feaa9cdb..8e1fad00bb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -488,6 +488,12 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
     cpu->sve_max_vq = max_vq;
 }
 
+/*
+ * Note that cpu_arm_get/set_sve_vq cannot use the simpler
+ * object_property_add_bool interface because they make use
+ * of the contents of "name" to determine which bit on which
+ * to operate.
+ */
 static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
@@ -529,26 +535,17 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
     set_bit(vq - 1, cpu->sve_vq_init);
 }
 
-static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static bool cpu_arm_get_sve(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value = cpu_isar_feature(aa64_sve, cpu);
-
-    visit_type_bool(v, name, &value, errp);
+    return cpu_isar_feature(aa64_sve, cpu);
 }
 
-static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value;
     uint64_t t;
 
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
     if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
         error_setg(errp, "'sve' feature not supported by KVM on this host");
         return;
@@ -563,8 +560,7 @@ void aarch64_add_sve_properties(Object *obj)
 {
     uint32_t vq;
 
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL);
+    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
-- 
2.25.1

