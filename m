Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213581ejb;
        Sat, 1 Apr 2023 03:51:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set+tkraR7CjTqcC3kFWTvAt4ecve2KVGIkRXqFjqMJq+JmPPBxV0Of5P6/399mZPkC1/4KkM
X-Received: by 2002:a05:622a:195:b0:3bf:df2e:a494 with SMTP id s21-20020a05622a019500b003bfdf2ea494mr48602200qtw.6.1680346287576;
        Sat, 01 Apr 2023 03:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346287; cv=none;
        d=google.com; s=arc-20160816;
        b=lVb2eJ39SuQx3CFveHPFNqTFlxVGErClZqx6ynpTCZgpf4dV6LYwCNNkYRVrf3e0wa
         e++WwNuOfe7KeFNHQLq4Szo31H8Y7ZlLv8H5KR0gEO2P6hO+38a18FVamoQpXGwM984N
         3km09vUOtS5/KOEkF9dDX0glf46h9mYhspi8xU32P/FGdRjOebjwQo9sg+id3pirRc99
         edHpWyTiVRM7y0NPVFSsn8/9gpcmZe5D1phplw7hUyjHFlUjpStcbGviupbTRySRmHUx
         0Ff/lq0/mN0tQr9ygBN1GLc0iQxqe1wAs5k0Foh4iAthrWHb8+XcxBiYvc1el+4vXRDo
         743w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=3LnacweXtaTHJ6qAN/W+TaByNM8t88vuJX4sTOd7WXM=;
        b=mv0o5CmpFLyIsPprrJ1Ozgc9RxRDxV+OuXNr0BGk4K659qw65/6LuCeuHppwhWn6w6
         LUtvxMfqj3CoWXjvR0Cb8mdXFC211g4hRLsD4eW3LRon+cb9l0omLkgBHH62ZUnN6o1/
         xpcrGFhXorgKNKwOMc5dUVNaKe35SwVncnNhg/0a1+lq3oNlJ7NZyK3Or95Uq2SUHiJf
         0PHqmjQ0nd9o+Nu7qz0c7o/MqUwUMP/4zNgGiHBVZyU8o+z16p/XgOMJRevlqdtnyBO5
         dDPOr9V8dcckhRLVMqQWu+NPXLrw87iLZtwGEHI9u76/AUXhag0X6dwUaWu8anXyG/50
         Ht4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=in7BOcaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26-20020a05622a1a1a00b003b9bb33ef8dsi2964893qtb.432.2023.04.01.03.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=in7BOcaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYof-0000yA-2M; Sat, 01 Apr 2023 06:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3awwoZAgKCEw60267otou22uzs.q204s08-o50121u18.25u@flex--smostafa.bounces.google.com>)
 id 1piYoc-0000ux-7d
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:34 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3awwoZAgKCEw60267otou22uzs.q204s08-o50121u18.25u@flex--smostafa.bounces.google.com>)
 id 1piYoa-0003Gv-EJ
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:33 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 j27-20020a05600c1c1b00b003edd2023418so13331307wms.4
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346219;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3LnacweXtaTHJ6qAN/W+TaByNM8t88vuJX4sTOd7WXM=;
 b=in7BOcaVtwIVeotCmFQ54pUI1TADQ+LGmRUpfNdtGSzz4VGt6pfas0TUu8zzXmuzEE
 vcOpxuXpFDT3Tmf9uaDk/F18aqfWUAuhm0isYt0ytxORH8Py7OJIanerwN0PeUVU2MQw
 MeUzQK+XBU67iQgvEq+ynvujbyOxX+WxN3ito50DeXEJolghnys6Ni5mqrofzaPOUyCz
 J0Z7iwgBN1IIWfqWSU0xFDOjMNRu4Z1o8J+HTktbGPHvJyGWrVIrbubuAFcCIii63Swr
 R9hok/YKhRZ8KJ6DfhlxZVSAxvEEAJ8EVOd86HY6FV4TbQcVHEpDufXxnaGZmTh5BF0D
 j9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346219;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3LnacweXtaTHJ6qAN/W+TaByNM8t88vuJX4sTOd7WXM=;
 b=tcY/6AvT+iJ7Cgd4v41L82P3WFaiYEi32MCJPCJC0JNpiNT+IDXrr+qAbnXKzUliSn
 llP0wQ9UxuYJreA/bkHX0mVS5CfIR8qxh0Qf5SDOxm2fzh58LC+n3d21ecLnlxDNwJEO
 5gZ7JVNJOMeCbBYWA+hVMIHwFdPikpMCDZA31JneR2RkLUKveTXEySx1w1EB2RLDlV4k
 sRoQYhs9gOBK54xKCN65AgqkCJwAMnmc17RA+xZ66lzmVggBEOosuQPfiVzqBQkqgbaQ
 YjqcrJZsDaDnj3JaRvVVz6RgGv+h8P+5IQwqL7jpiWlE404KJasaAsIVkoVGSMspbC6j
 E6HA==
X-Gm-Message-State: AAQBX9cd8rB/zTq03fS6xFIsOvo1QWIj1AOTE/rWwCitj6ZXN/WylQHi
 ogTaumNJz4tu55kQ5BatQuDP0GbBewbm8Q==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:cce:b0:3ee:136f:bce6 with SMTP
 id fk14-20020a05600c0cce00b003ee136fbce6mr4729514wmb.2.1680346219648; Sat, 01
 Apr 2023 03:50:19 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:53 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-11-smostafa@google.com>
Subject: [RFC PATCH v3 10/10] hw/arm/smmuv3: Add knob to choose translation
 stage and enable stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3awwoZAgKCEw60267otou22uzs.q204s08-o50121u18.25u@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 7hVqPVVuImc2

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
index 826aacf8b1..22b5613d4c 100644
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
@@ -248,14 +249,20 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 
 static void smmuv3_init_regs(SMMUv3State *s)
 {
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
@@ -458,10 +465,6 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
         goto bad_ste;
     }
 
-    /* This is still here as stage 2 has not been fully enabled yet. */
-    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-    goto bad_ste;
-
     return 0;
 
 bad_ste:
@@ -740,7 +743,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
         return 0;
     }
 
@@ -1809,6 +1812,18 @@ static const VMStateDescription vmstate_smmuv3 = {
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
@@ -1825,6 +1840,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
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
2.40.0.348.gf938b09366-goog

