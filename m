Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2705036lfk;
        Fri, 4 Feb 2022 08:56:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNEBl8+b04d53X/faCrBDbcFIWSKtwyaMQAOr98DXppzkx/fw33bb2m2ELGjSjMvYnzfO0
X-Received: by 2002:a05:6902:724:: with SMTP id l4mr3653856ybt.427.1643993778666;
        Fri, 04 Feb 2022 08:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643993778; cv=none;
        d=google.com; s=arc-20160816;
        b=g3sH/RaVVvSEadf5Bh7Ou9O/hMlZuP5FZj0fI27sIIiVJzSKFD2I+8p7yP7X6sUmAd
         hlBnIsm060c3f2qRsUJ8qi9x78rp/9urJxXmrwaqdNFTteioZbOSOEkfDqoaKFfmslSd
         J1B1Kc4Jj6g73onDCQtvin3/DyRuE3gJmW6QnUZBgsQgkAFOWuUX30Rc2FUoPXCql17e
         ckyojzHPBa1hLH/qswgbBRkgl5SgX19SwDgpXNk4Rxibyx41tLIk9TTcTI99YtpnNq6y
         yqIDe78t724xMqXWwt2uLtsMk5dMPu6EOpD/zzrLQheij32CCawLL3HwTJhAm4WHdZ67
         ANnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tjcvPV/juuMIi4sRDbbU/TdIgPLoSlWdDbYJe45BCYc=;
        b=pVrySxofmLjjQ/VvHkKqrHLzwL3miF3y7wf5PR3nelNnrPy+Ft5kVjpelsZBvQ2feZ
         awcuCB5xytyO8lvdkREMjE1KD6Q10j12RnsJwCmSKRzw94xe5APZbCjbA4lsL9tPwMuB
         KZ3XoRrhAuU8pIctUR5Xvei7lDDL3TB+YVEsL71cSQrq2EtrXaA08uUU4XCmFzIZVkQR
         ct2zq2HQupxgG/poMLXnSONHwotLLUbOHL/9wpzVK1AM93a6kDA3gV4v8y6tg1QDUxYy
         pePCOcWGkJIWmfIlXeUItYQzlCKqBA/3UU2ou6KjoDO7edNGWuEo3igQV3Dk36wZnddL
         C3Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KxLxce1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si1642239ywu.530.2022.02.04.08.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 08:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KxLxce1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG1sg-0002kE-17
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 11:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1s0-0002j3-EH
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:36 -0500
Received: from [2a00:1450:4864:20::433] (port=42574
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rp-0003BR-GY
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:36 -0500
Received: by mail-wr1-x433.google.com with SMTP id d15so3700871wrb.9
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjcvPV/juuMIi4sRDbbU/TdIgPLoSlWdDbYJe45BCYc=;
 b=KxLxce1+gFmcvFNrRLL2/maGEvJQmt0Hf0OlZuvPiuK1w5Ab3SxyurA45jGZUA/JZI
 Z4EaOa2pN+i5gYFVJloKQwcbED0T94XcGl2AS0YEvm74S4pnJWtX4JSXYN5TUmLe3oY4
 M/JVQ2urRY4NTZ04/5XnCniGrrcvh94IIAJtwLms5cCAiOiNdkbVx3rLbgWVJp6ox82X
 pZLV/LIuNnmvAhzVRWjTw7LLV+SduwyRJC4l63iobRo0PUYiWv8XvxGPTEl8AL8lHm4j
 QuuhLw8UYqke81nz9cJJ2SNbPoTq8206bV3LwI+28b4/u0OGDA82ZlD/3D1/BdKk+oeW
 eD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjcvPV/juuMIi4sRDbbU/TdIgPLoSlWdDbYJe45BCYc=;
 b=LVnPi6Oyj1zUiK3aLE/2TX6UnBCEyuuswKFaVeyibimrFYOTvEDKo02kpGkyfpBNVJ
 vw2LIbgt6nmoihNFeX3+LpeusR7tNSJswpFasV/YMpoFYLStPWVjNigGdn5gg2q4f7gX
 7VFXJJo9BQ7IlvzCcyCnziM0+/0bkWSwEi/RCNAil/exVaT9/DekEfbOBOwBQ332rk8I
 bhvyBaIekGibx7LH8eThCFta6uMEPQXWD594B/4cPn9K9onr78xivF2oq9YhKM+J5lvZ
 xQ1GCLMtca7hWk7NArmaIat8TTRZZJCKwOH8I5RnFTRvHVceOp9f4w48bwQKUsVOXoCk
 E9vw==
X-Gm-Message-State: AOAM53105KDz15mGXLwUbSkZh+HGSNheo3L+iNp9xpQ68L8NhoyKFeCG
 +so40jSuke3e15rrc4/ivmOcU50WHhKoNA==
X-Received: by 2002:a05:6000:1a46:: with SMTP id
 t6mr2359874wry.49.1643993709904; 
 Fri, 04 Feb 2022 08:55:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/arm: Use aarch64_cpu_register() for 'host' CPU type
Date: Fri,  4 Feb 2022 16:55:02 +0000
Message-Id: <20220204165506.2846058-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: UgSJrfWcLjOf

Use the aarch64_cpu_register() machinery to register the 'host' CPU
type.  This doesn't gain us anything functionally, but it does mean
that the code for initializing it looks more like that for the other
CPU types, in that its initfn then doesn't need to call
arm_cpu_post_init() (because aarch64_cpu_instance_init() does that
for it).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 052666b819e..590ac562714 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -683,7 +683,7 @@ void aarch64_add_pauth_properties(Object *obj)
 }
 
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void arm_host_initfn(Object *obj)
+static void aarch64_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
@@ -696,15 +696,7 @@ static void arm_host_initfn(Object *obj)
 #else
     hvf_arm_set_cpu_features_from_host(cpu);
 #endif
-    arm_cpu_post_init(obj);
 }
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
 #endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
@@ -943,6 +935,9 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    { .name = "host",               .initfn = aarch64_host_initfn },
+#endif
 };
 
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -1049,10 +1044,6 @@ static void aarch64_cpu_register_types(void)
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
-
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(aarch64_cpu_register_types)
-- 
2.25.1

