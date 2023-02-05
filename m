Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3074319ejb;
        Sun, 5 Feb 2023 01:46:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8a5uYzGHbb1sXcbeBnLozz0fjkBmtdlbDx/WD331J+oodTx4/WFm1a46cAwbDB38dHo4Q/
X-Received: by 2002:ac8:5e48:0:b0:3ac:1bd5:b7ad with SMTP id i8-20020ac85e48000000b003ac1bd5b7admr31663780qtx.33.1675590372140;
        Sun, 05 Feb 2023 01:46:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590372; cv=none;
        d=google.com; s=arc-20160816;
        b=y2lrhZ1G751SG7swz3ly00ezL5UacpUay1Tq2Rvh21Qt8I9CkWlZe9e6wyI/zM5UBF
         TNvI2pmPpHBqUOGAHs2/XrHUXuVDizVYmc/wwjoneuNjzKd5RoaorrFRInzXjicogk6r
         ecPphAeNvVwkp1Kjru3j1col73gPv7Rz8GaBa8o655HC9FizZCy0nd76mWT8CrGYYvs3
         Fco5QtXbMiKsGS0OChN31d5aqEifibXf9rAoI1BFBEzVon/IUOCiYrxZE6lrbLqISW/K
         CTEQSGYTBT8sSNBj/eQWeni7zzwQJqA5VqO3zx6VsCffwQ628BAGluILbuZLhcQUI/eL
         P0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=IDX881J6mPSGW5+N+x8YR88zVfkf0HgaxefnSqde+WE=;
        b=D+hi4oZiMMCqQfrLHuB09oc1Un72J9W7QXtoNOxZOTTgDsioSyuurU0zsZ+yNo826b
         SX6RdM3Tcc7K5iNkgBi+gIzHsEkpffuVgP4fCqz4ikLJTDoBF60wiT0Yvf5Lkhv75pE6
         yLrTVQiadFfegW7bUaMp5o/IR2nxm6vN20scSdy8iLQxrxldSDwvqRDcyc1+3oByzIGk
         +lWNaPgwSQVoza3jMHvdQPLPPOfQS84/9yS6UQtvLROVO+q/s/04MVxGY4AtOP2b7XBh
         t5OyseOLC2iRan/gAllSKlSUrkE0u/ciUR+tEqvWJy74BggjnrdPiqXgEhMGZIJhbH79
         dikg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=P0baRfTF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h62-20020a375341000000b0071b3377a4ebsi5351051qkb.594.2023.02.05.01.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:46:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=P0baRfTF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pOba0-0003be-PG; Sun, 05 Feb 2023 04:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l3rfYwgKCDAeYaefMRMSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--smostafa.bounces.google.com>)
 id 1pObZy-0003bJ-NR
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:44:58 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l3rfYwgKCDAeYaefMRMSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--smostafa.bounces.google.com>)
 id 1pObZx-00016K-3G
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:44:58 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso5015205wmb.2
 for <qemu-arm@nongnu.org>; Sun, 05 Feb 2023 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IDX881J6mPSGW5+N+x8YR88zVfkf0HgaxefnSqde+WE=;
 b=P0baRfTFnmkKEfGP2ydl59VRSQl/hC3Wr3l91UzVEdmn3OIGWw39PUjqmG2r8iM05e
 mMlY2m6q1fIN96dGei8fLaOPuhy7m2bxuYVDApizWOjlcFXO4e236BL0jFqWO3yiaWdV
 Zn+weDi3XN2oDB4jbIw7zxTrk/9s7fURl5wzIYs9QfmMRmZXn1ADgg/0B9pvtPe2n+O4
 nVQsYsoGd6sNSKT1ArDhV7guJ9XD/+ZMJRxssxtU3Z3aJEeiDE8Cn71gBGQAhMmFPQFk
 5aQCgjB3ptGtt3F209C/i/KaBCXV2u/CtZb3rMcCSnCRhDidcIhgh5/WvWyDSkDECb2v
 VZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IDX881J6mPSGW5+N+x8YR88zVfkf0HgaxefnSqde+WE=;
 b=SlrOno2b+0+jX1iTFuBwPCrQNOt2XUNWbQhM+vtJzkBBfFT0Mtyc8NPRqAIZ1iKn/C
 uFv0bba1+3ACP9yEXfP5OgKMgXXUx6qS1VHdPTW9eFIkWDLq3YqS07ApSvNomYg3Jt7V
 58NDg+t3R3OGW3ZkVl/1O+fBSWAoiY3mqrLtDAOzkGDbt5Tr5Pc/rox05TlD2Pu+BTeO
 cWMZpnw3CgAVDFpQxiQC3chcIC17YsXlDI790U7l4j+aKbyOR++wk8kNsdQ+XfPNjPwF
 8I/40rAVuDr5tZy/w9U0ua52kh7pJ2VEL1Uk5mipBriMIyGjD1zXMHH5AT1mEwTKjtVC
 G0Iw==
X-Gm-Message-State: AO0yUKXS5hOE+mY1TCZnkLkAnSZI9EMqAabN41JEIaVJTD89/9gn5CL0
 FeCWhBKE9hK/rBxzblnu2Fad3S2BJ30NgQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:a15:b0:3dc:4548:cc43 with SMTP
 id z21-20020a05600c0a1500b003dc4548cc43mr1096219wmp.103.1675590295778; Sun,
 05 Feb 2023 01:44:55 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:59 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-5-smostafa@google.com>
Subject: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3l3rfYwgKCDAeYaefMRMSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 7zZaMJpnY9pH

Add a new system property for smmuv3 to choose what translation
stages to advertise.

The property added arm-smmuv3.stage can have 3 values:
- "1": Stage-1 is only advertised.
- "2": Stage-2 is only advertised.
- "all": Stage-1 + Stage-2 are supported, which is not implemented in
this patch series.

If not passed or an unsupported value is passed, it will default to
stage-1.

The property is not used in this patch as stage-2 has not been
enabled yet.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  5 +++++
 hw/arm/smmuv3.c          | 28 +++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 170e88c24a..ec64fb43a0 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -329,6 +329,11 @@ enum { /* Command completion notification */
         })
 
 #define SMMU_FEATURE_2LVL_STE (1 << 0)
+#define SMMU_FEATURE_STAGE1   (1 << 1)
+#define SMMU_FEATURE_STAGE2   (1 << 2)
+
+#define STAGE1_SUPPORTED(f)   (f & SMMU_FEATURE_STAGE1)
+#define STAGE2_SUPPORTED(f)   (f & SMMU_FEATURE_STAGE2)
 
 /* Events */
 
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..54dd8e5ec1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "cpu.h"
@@ -238,6 +239,19 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 
 static void smmuv3_init_regs(SMMUv3State *s)
 {
+    /*
+     * Based on system property, the stages supported in smmu will be advertised.
+     * At the moment "all" is not supported.
+     * Default stage is 1.
+     */
+    s->features = SMMU_FEATURE_STAGE1;
+    if (s->stage && !strcmp("2", s->stage)) {
+        s->features = SMMU_FEATURE_STAGE2;
+    } else if (s->stage && !strcmp("all", s->stage)) {
+        qemu_log_mask(LOG_UNIMP,
+                          "SMMUv3 S1 and S2 nesting not supported, defaulting to S1\n");
+    }
+
     /**
      * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
      *       multi-level stream table
@@ -276,7 +290,6 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->eventq.cons = 0;
     s->eventq.entry_size = sizeof(struct Evt);
 
-    s->features = 0;
     s->sid_split = 0;
     s->aidr = 0x1;
     s->cr[0] = 0;
@@ -1514,6 +1527,18 @@ static const VMStateDescription vmstate_smmuv3 = {
     },
 };
 
+static Property smmuv3_properties[] = {
+    /*
+     * Stages of translation advertised.
+     * "1": Stage 1
+     * "2": Stage 2
+     * "all": Stage 1 + Stage 2
+     * Defaults to stage 1
+     */
+    DEFINE_PROP_STRING("stage", SMMUv3State, stage),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void smmuv3_instance_init(Object *obj)
 {
     /* Nothing much to do here as of now */
@@ -1530,6 +1555,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
                                        &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..9b9e1c7baf 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -62,6 +62,7 @@ struct SMMUv3State {
 
     qemu_irq     irq[4];
     QemuMutex mutex;
+    char *stage;
 };
 
 typedef enum {
-- 
2.39.1.519.gcb327c4b5f-goog

