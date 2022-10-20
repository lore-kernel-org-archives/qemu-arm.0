Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp648879ejn;
        Thu, 20 Oct 2022 15:48:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FEE79NcLrqN1wyS27CL8LDQyTwP5uJeC65Wza7UOVk14ZLPRsE+7aeUod5592VlCkVN0O
X-Received: by 2002:a05:620a:2848:b0:6af:6c3f:7141 with SMTP id h8-20020a05620a284800b006af6c3f7141mr11318412qkp.548.1666306107201;
        Thu, 20 Oct 2022 15:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666306107; cv=none;
        d=google.com; s=arc-20160816;
        b=fA2JRu+94qY8S4hjblVFkqX3IaSjMRgQo4VUGkyKwVlhzoJGZLWLfyUV/zFCHz4fut
         tm9lbIZeWfE3qn/mD5izf5ochj/Bl4rnKrl1pufi9BsdsjEz2SUDXrAmLkUsHedqKPnR
         xMYPtBTGyseR57d25imlRlfxhX2ShijpGTA6rHu0WrQUzkyuDSBTdGoOLK8IonsRGAWP
         2ubgajDK31lRhZ9/2ZvTtyUXmUvkm/DBM4zWtQnCawfcQM2EqfrYsNLWIidHLYBvW/Rl
         tNbWRK1fP0Ze5zUceJVnGu0KWYcQacreg127aWDsMgkJpWtMzbTGtDvIvIkNb3v/wUdO
         6fwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=baaju4aj7L4HzLV2vbLThQkoFij3/vaMLp/lMiDo+UM=;
        b=cDTlHWo+cpro58aiyXTiPe3lp2YpWyH/v1tI6+AhQrtgyjiW5E13H3Ww2Veir3vCx+
         hb41RbEfCM43Vl4bo79LivY9pTUcmuQQtwTJUAreGVzjkUYnpGpF/fmc/YfF/96wo3Z5
         +WUPI221woHoFq+1pKPKGsC5Svre3Lvd74t/yJKTN9YL17npByQZqjGDWCuf7Gli4ZGp
         Rzkj5zmC8jbEkFc7K5UgH5HxmyajobEpT2Q4H0py0f4hCREmZofTjs3uRz2pjhC01AFU
         7f89gJQm030WyVklFroLBYK+Yd6S7kEP5c1pxRVcER0ZDYD3yGA7nV6bjbQfrW2pJlPz
         I80A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lA9UPzaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b188-20020a3799c5000000b006ec28e572eesi10910953qke.206.2022.10.20.15.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lA9UPzaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleKw-0005it-KU
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:48:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleA6-0008Aa-Le
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA4-00084C-Sk
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:37:12 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA2-000176-Fg
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:37:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id j12so631836plj.5
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baaju4aj7L4HzLV2vbLThQkoFij3/vaMLp/lMiDo+UM=;
 b=lA9UPzaDusMswbXBHfTAZfhirWX/cdO35kvUE8CeI7KJ9UvxjLcR61C2v9zF1NB6WD
 4zJv0GpgGA2JoiCrowGx/dLUCFvmqyVnHN9cjYe4g2rCNd3T/j/tbIuxzAVJYs7s7MjY
 h+3lqjR37YtHmFNth/4KzR3GC9lz5jhAHRuAvr8hS7XESfZZ5hIi8bDsp/Vs6AeaR6lL
 WNoRI4Oi2bv4pWG39T3qC0iv+69hFiUP9KnjnnIiyIbpyd2DOJNy/XXPBxmBO9tkwd5Z
 0iXRVPtE6ZM3fUwi0nKJhSfms1oxD9DO+sFIaVJ9vEAuqLz+dK0lFkwPuPN2tO5QnTRO
 oHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baaju4aj7L4HzLV2vbLThQkoFij3/vaMLp/lMiDo+UM=;
 b=nSKlTcPOKMrpnBkXM20GbwBXGfVxzXxgW6sIGTezCShqHp8oszFEt9VKbUDv6QKf4+
 PTI8eMnBzz+ZAUvmOnl0u71JE98KHzkVxDJHD1yggnxWWqsDpciRzzU8IQ8c7eVTLgfW
 NiFO7l5lRcPcG5s3vV1JFdk6TwoGAOLaYkiMnmmBk0vNIb7V3+lJAM0xm/xRsloSqBdD
 /v3cJ5rEp+6CIa9/XM9KSz4RMSCIJX1P8/SBczxPaX40WRTiOJgiYLYZDtMGIEvVPrEt
 hTsIRmIVdeZCRG8Was3Xl3IfxnjdZW2kjpUvVry4hNlDhP4un3KMZjzEtago2LQpJAYJ
 drPw==
X-Gm-Message-State: ACrzQf1QHA7B1b3klEok/q79J5xvaF8+MQTThMtS2lJLR2sDU49SwJyl
 AwjPNSIHzyxhBy9qeKEehN8tpFzSa0nLwLMu
X-Received: by 2002:a17:90a:4ec6:b0:20a:96cd:2a46 with SMTP id
 v6-20020a17090a4ec600b0020a96cd2a46mr18876074pjl.171.1666305429062; 
 Thu, 20 Oct 2022 15:37:09 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:37:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 13/14] target/arm: Implement FEAT_HAFDBS, dirty bit portion
Date: Fri, 21 Oct 2022 08:35:47 +1000
Message-Id: <20221020223548.2310496-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FDXaOQhqXG+O

Perform the atomic update for hardware management of the dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Move the DB update before attributes are extracted and merged.
---
 target/arm/cpu64.c |  2 +-
 target/arm/ptw.c   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fe1369fe96..0732796559 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 209ea7024b..1c1f0bfa1a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1463,6 +1463,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                 goto do_fault;
             }
         }
+
+        /*
+         * Dirty Bit.
+         * If HD is enabled, pre-emptively set/clear the appropriate AP/S2AP
+         * bit for writeback. The actual write protection test may still be
+         * overridden by tableattrs, to be merged below.
+         */
+        if (param.hd
+            && extract64(descriptor, 51, 1)  /* DBM */
+            && access_type == MMU_DATA_STORE) {
+            if (regime_is_stage2(mmu_idx)) {
+                new_descriptor |= 1ull << 7;    /* set S2AP[1] */
+            } else {
+                new_descriptor &= ~(1ull << 7); /* clear AP[2] */
+            }
+        }
     }
 
     /*
-- 
2.34.1

