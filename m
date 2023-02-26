Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4028982ejc;
        Sun, 26 Feb 2023 14:08:28 -0800 (PST)
X-Google-Smtp-Source: AK7set8+xtfjyd3Uy3SwTb1L7TwotanqVeBGF+EUBkWqbxmhVwQaMNWEwrzyWNHl7n6pmK/X+6AE
X-Received: by 2002:ad4:4ee4:0:b0:56e:9986:4fa9 with SMTP id dv4-20020ad44ee4000000b0056e99864fa9mr41780157qvb.7.1677449308108;
        Sun, 26 Feb 2023 14:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449308; cv=none;
        d=google.com; s=arc-20160816;
        b=F/fi/JhWt+6G2ABZN5MlKET449Ihyy+aN2VQqJmQbk9DtGrYq/O8V4dt98+R6xx5Na
         yNl7+W4cwaAF6pLPE0nJ8j2h4ODYIcAQkvb5HRyZLVy1QAnJjJJ9iPJb7MbRxLiaYpBC
         HXIa62N51wH5LMbM9Vx0FCXv0Ffhygj+flqTLYAtCewvOXFpe+vlKnjvEvRfbThONn9v
         bWYr6GTvsMjxmAYAMEpFMoYig+U4g7Dj5R2x+cSOBrdXrFxCY24bCYtkGFdyKjuzDZLO
         2d884dKeOAj4xWSsEh7OeXPadut6vZCDb3SNECiKm0rYCRj9RYb+3LvzUVDLVNtLhbJj
         PmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=7JsPmexuAA9KVUzOd9TgH6d0EGckRDRiNS9iokJg500=;
        b=dsS58XaRNyzz6A+58jqAmqmaCmDIg3YDvkhEAKrkEutnl8NhcgRP1Vc2m4xoOK+ZIk
         0V4Vu6z/R5idY7Eub4HbPEpDIT3DjvPMQ2rKo9baZZQkRsRCCHL4TypJIRoqbygz8ODv
         BVyJw5Zt4gjdGk4GU1AmbPUKPNcRGdm4lEshJHgu+AcOwMWq2nG/PC/rN08ZX0svrxw9
         CwgofUIVHbg1/BpI1KYo6m61o3LvJewxDSYERwTmCfy5YzmCqA6/jJwUsiJM5OLgltOd
         UlHcmED52h+2dM5XwSiT6cEeKZSxXQfDAXoeuAYwPVDCc3m0sBS6HKsthIyq+1blM9oo
         lllg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Zwp7Yavj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a05620a288200b0072c1a0b77e5si5121662qkp.541.2023.02.26.14.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Zwp7Yavj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPB4-0002aU-Vn; Sun, 26 Feb 2023 17:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Htj7YwgKCOMXRTXYFKFLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--smostafa.bounces.google.com>)
 id 1pWPB3-0002ZN-7v
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:29 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Htj7YwgKCOMXRTXYFKFLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--smostafa.bounces.google.com>)
 id 1pWPB1-0003xN-JK
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:29 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536d63d17dbso101437737b3.22
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7JsPmexuAA9KVUzOd9TgH6d0EGckRDRiNS9iokJg500=;
 b=Zwp7YavjE/frjrlSWGTt0I6RZT2O85YDZka1L0zDcaj0r72NDFZ2MOsKu16ESbrl85
 jQRx07Fjq2eFMXvmbJQYEtgy9zxkiHt88hxQTLBRXtXugCGSWKmPgxUs0+2ctVYw/lP/
 nzv/zS9ILl3WNNc5rzkbabgfRA0TZ5wYUpMbtSrTUfzE87Tsj5AjZny1nQ2Iq5VfWvwL
 YAI4KMmpNtILsyoHkxiW+gkWI2uSkVkuTJ+9exbpolIVgAnxqeXZoUqqM9S/jM2iK+T4
 jvd3OY7m37PqNCUtNdDCaWDS9GKHAfG//7P8vM+dWog9istZLUEXDhqVq5h8XWXPLbya
 opyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7JsPmexuAA9KVUzOd9TgH6d0EGckRDRiNS9iokJg500=;
 b=2p3a1absrPFbGyBECsx4iGLYxKQiUbRA8OSZ+g/V1bF0dFySjKALWmZrF37opseqc7
 NhW5+3CgXc+0q3/PEBDFXwcwfANgoefysSsxqj/dbOOsoHajVtx+vuppSC9lbg3Iq/HE
 fDBxB/0u1rXKyOQMHl2O9wZG6TbHqyO7QnjCKnnMEc52TDLqhbO5lL4hTXgpCJmp0ttk
 KjdWThYyp7J/qXMlZxZK41tKgMZ7ZgaMk+EHK6hOs818Ik/E/h+GkfHH4XTf4czJgmQq
 JGwiB1lSpBNk6Pj83s1o8+1B0vPyjfHhdCm2jh4TkKLwBpspD3Vs0vBhfRWi/VA2Excz
 3AIw==
X-Gm-Message-State: AO0yUKWsrZzVuDa9GRZEHr6kpBLtvgtWgThaW4iQfbDScRSeIHf239Zz
 7ljYyaU3jZcQf2VOKoyocMQf1R/O8PDLUQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:101:b0:886:7517:31a5 with SMTP
 id o1-20020a056902010100b00886751731a5mr1011117ybh.404.1677449246099; Sun, 26
 Feb 2023 14:07:26 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:50 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-12-smostafa@google.com>
Subject: [RFC PATCH v2 11/11] hw/arm/smmuv3: Add knob to choose translation
 stage and enable stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3Htj7YwgKCOMXRTXYFKFLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: KaJBI/+8w6s4

As everything is in place, we can use a new system property to
advertise which stage is supported and remove bad_ste from STE
stage2 config.

The property added arm-smmuv3.stage can have 3 values:
- "1": Stage-1 only is advertised.
- "2": Stage-2 only is advertised.
- "all": Stage-1 + Stage-2 are supported, which is not implemented in
this patch series.

If not passed or an unsupported value is passed, it will default to
stage-1.

Advertise VMID16.

Don't try to decode CD, if stage-2 is configured.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- Squash knob patch with stage-2 enable patch.
- Don't try to decode CD, if stage-2 is configured.
---
 hw/arm/smmuv3.c         | 34 +++++++++++++++++++++++++---------
 include/hw/arm/smmuv3.h |  1 +
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bc4ec202f4..ebffc7e5f5 100644
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
@@ -245,14 +246,20 @@ static void smmuv3_init_regs(SMMUv3State *s)
     ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
     uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
 
-    /**
-     * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
-     *       multi-level stream table
+    /*
+     * Based on sys property, the stages supported in smmu will be advertised.
+     * At the moment "all" is not supported and default to stage-1.
      */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
+    if (s->stage && !strcmp("2", s->stage)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
+    } else {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
+    }
+
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
+    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, VMID16, 1); /* 16-bit VMID */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
     s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
     /* terminated transaction will always be aborted/error returned */
@@ -508,10 +515,6 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
             qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
             goto bad_ste;
         }
-
-        /* This is still here as stage 2 has not been fully enabled yet. */
-        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-        goto bad_ste;
     }
 
     if (STE_S1CDMAX(ste) != 0) {
@@ -739,7 +742,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
         return 0;
     }
 
@@ -1801,6 +1804,18 @@ static const VMStateDescription vmstate_smmuv3 = {
     }
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
@@ -1817,6 +1832,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
                                        &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 6031d7d325..d183a62766 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -62,6 +62,7 @@ struct SMMUv3State {
 
     qemu_irq     irq[4];
     QemuMutex mutex;
+    char *stage;
 };
 
 typedef enum {
-- 
2.39.2.637.g21b0678d19-goog

