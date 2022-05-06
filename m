Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1979750lfj;
        Fri, 6 May 2022 11:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7OMS6oENBuCHdxyGrMiyPLPXmmM8wbQ9PjEWm8zt3yE8DX9hKpvvB67OiT3MtZ0h6Kvae
X-Received: by 2002:a05:6214:2388:b0:441:37e5:baec with SMTP id fw8-20020a056214238800b0044137e5baecmr3887231qvb.66.1651860660099;
        Fri, 06 May 2022 11:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860660; cv=none;
        d=google.com; s=arc-20160816;
        b=njv0RTAQpxd9HMTTRWG3R+xKfL3hp1uQmhdtcJakYuZhQSSIFZQheF1qBAM1XzKAf/
         7xGXT+73c7Hpi6dKDIvOSHHviKMKljNIjjNHg/oOWjIkGTVZv0jSdFpdpzZxnYsxNPwK
         XTzgRoOZVAN3xsX5mzVpPCDFFpLJN+h8OvBBJSjw58TxUQqVD4J4WVYXshF3avgTHEWO
         eapPyEoh/z04ldiXh+AlarcWqEM8Q2otsNoVSZsGHMIdfNQD0MnHQQ1wgd7F2IyR5YK0
         AcK69ScAV7wfja13MCHCMg43KgBi+lN6m/fFi+skY2XApRFzCtU7gr7QBXK/yRBOwjQl
         +tAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
        b=EvVyK+5LKZ37HaqbY05y8qdye6ZNmuaN1faVKzafALiN0haQVK/uSm1WKBZDZtTvqK
         Kl1a/wdgtulP8Hwb0t+BjlgE2c6luv9q65mJyyu6ZwSKY8qP65S+MRUed0EeaoSi3bOA
         dx96p7b/6Zf1GM2t/gCO1OCK9irBxBQPfNjXw7io5Q22XdMXIoLj61P+JWyu2Bo1k2RU
         gaaZc0Rj6bGCUJ5E2RlvfLjc/DXeJGvZc4Zhv+FzzYf1MONJKxkLHiCs0XEGYKgH4SZy
         JlFoig+D5gPyo+XsnlbXcoeJHhB+XliFxGVc8xHb4U/D+xIJdssaIqlandSADKEveAis
         5W/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=thPVG18b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a138900b002f379277ce0si3066924qtk.601.2022.05.06.11.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=thPVG18b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Pr-00026O-If
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IC-0005ib-Fg
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:04 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IA-0003rP-T7
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:04 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 z5-20020a9d62c5000000b00606041d11f1so5424820otk.2
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
 b=thPVG18bZksA4Iu3Pgbgd4oHouv8p7dZRJnlJpS9tdBGdtQ14syu3W3EMV5cl8a3Oc
 3auMfcBvNYOrCZFNwR+4m8HS/QwNHKZNreLpaFsifDbhtgQtEUnSxiT2H9Q2nbd6VYe8
 8MzkAUANt5TjiOC+8/DfmWBH8pkQVcj6TACBOYz3VyfOwP1w8gVIlz3S4RKKi05s3CH7
 l7OHZNd36XSKV/1HBWpDlFEoEh3UabHjuEDX9bbwzuxSL0Nzw46ggBYZSa1gitmgG7u8
 QHQmTwnPoEWrxqaBTNSyPvgitpFSyqCgUALd9gaONVnUHhRmlNntQE0zi0LkeB/IDpeK
 8BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
 b=3v0tjw2vmIt/HylE6ja0Cf7LBQBQDS5BGhQ3h2ucNFjE64VnmwETxOZtX6YJsy3FQH
 t/+VVxRSmkDT/pKD3cKTdjFG5z3ZS9uT/C77tVOGKJ2PXTo2zzpg96XPgjv+7jzv+fA2
 6ge7KEKkWpL2h+9E+n6HLMLGpNfb1wcKsd17/E+HjWLXz9d89Fber+YlU/GM/bQXWela
 ZEudEynsTTZgdjdohKvnt8t3/kubUYx0pyh8x8T5rE7nECAd1C5IKpUUbG8HfHSWfJo3
 W9VR9szNDlPijXNpIfTLHG0LFzYlUBSdQ28+9K2ACBE3Wq5UOIeXvnGwYsT8RGJlJD2X
 sHug==
X-Gm-Message-State: AOAM533kDiW2/zUh+mlue4Di646V1PhSE05A2MJQJanUqTb3xPYDp1GG
 fFHuwQY7AIAQbC5wXbl8PXoLXw==
X-Received: by 2002:a9d:74ca:0:b0:606:2168:8b63 with SMTP id
 a10-20020a9d74ca000000b0060621688b63mr1463784otl.249.1651860182218; 
 Fri, 06 May 2022 11:03:02 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 10/24] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Fri,  6 May 2022 13:02:28 -0500
Message-Id: <20220506180242.216785-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
X-TUID: qjW+ucHmH0sC

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 01176b2569..7995ff2712 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1801,11 +1801,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -1836,12 +1838,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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

