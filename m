Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp661362ejq;
        Tue, 16 May 2023 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5JS5lt8RR+GvstHC0yD1RDJwyXw58XuXc3y4lmPF8bUwRrkKIij0lTCnLQQLKk7Bw91s6f
X-Received: by 2002:a05:6214:21aa:b0:600:5dbc:c31a with SMTP id t10-20020a05621421aa00b006005dbcc31amr61762385qvc.7.1684269374778;
        Tue, 16 May 2023 13:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684269374; cv=none;
        d=google.com; s=arc-20160816;
        b=zA6HKa5W4tjmaBzZ4fKfrDbeLr5mowDLsGWtEupytgAz8+vVplqR1bAtO6iIhlKAmf
         HO7mvQnbERwHcUUr6ZDF3x3Aw9ts7CtzSngqC1T98RHVchj5U3fpY3xlshFSi6+iX/nU
         /Xu0BcxJwTIvNrniYntvTRe4sKCy85y05dGOjPLb3qSH2fvL5hKMo4Bytfb+LVPMo14Y
         DumUUstXzvCXPaiG1G2kex/J8qcUvJygnJUpVlgQdN3p9RZ7HfaI/t35qdTRHQENoCgP
         RWDbPIbQnYiDwZ9edRtQouyoVpH5waVWcshH+1PoriPldmSLRF74haBXXMSaXEfA0zFh
         2Tkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=WGWbmO7v6vcXx/XoMWesDE1+ZZN+mE03VIOoYYtnJYY=;
        b=yCyCt9TccIKVsw9lH2kzbDt2kcuydhjZNh2/0OdEzk7HPe1j5o4tLN3XsSOL3bW2sa
         NaGFrBXST3OkjzpiUuvc1J0HVWyDOyP+P1iOrXQO7R5yi3feSj6b3/Fj3TTlpKVGxvNy
         xxFrl8lS+M3OchK710TdZYroZzWmRak4s18ulpd46/wti0fIxFUsxMqLf2ragruiVwhk
         eS3sfYsJiI9joXrYtDN9sLvDHi40VzgK5PwT4gu36j6vveRj3UGCQgqa+qodgZgDetAl
         jMLA/mjEzMItlMpQlV7eYqeqlErhSLJVOnFL5JedxNe5iQjGk7BrwEim+etMX8KO0F6Y
         cLjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=GOfkB8Gs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020a05620a137800b0075953937580si298789qkl.169.2023.05.16.13.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 13:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=GOfkB8Gs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pz1NE-0006EW-O3; Tue, 16 May 2023 16:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x-hjZAgKCFIC68CDuzu08805y.w86Ay6E-uB678707E.8B0@flex--smostafa.bounces.google.com>)
 id 1pz1ND-0006Cc-DR
 for qemu-arm@nongnu.org; Tue, 16 May 2023 16:34:19 -0400
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x-hjZAgKCFIC68CDuzu08805y.w86Ay6E-uB678707E.8B0@flex--smostafa.bounces.google.com>)
 id 1pz1NB-0006ix-F3
 for qemu-arm@nongnu.org; Tue, 16 May 2023 16:34:19 -0400
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-3093b0cf714so274399f8f.2
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684269255; x=1686861255;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WGWbmO7v6vcXx/XoMWesDE1+ZZN+mE03VIOoYYtnJYY=;
 b=GOfkB8GsPL+HJOkOfNKLTDHgH85c/cbmVNJKSehYNiIy5Zzahvrh5AqOhVSR6egIGW
 BaSDE2vrzuegec+fOdt4QWUUmXtAhkI7VfEC03kXRWnhPuDyUzGPp8vevdP7+0V5OZv4
 YlOWV2pAozih9yAHtlNUjgMVS34uEMaa+cuyUGj9g08QgEl7459kDJ+MpamXJN061X5L
 U7MXd/sCysjXyBaM4m+5FDd1OiWxcD1ETx3Mr1Pz0zUPYDvxJa3BNerIt5OJJ2ZWKTws
 iakikptg6pcq5koI+xIHVkdwfBlvp0nebobqJJ5iUmg+Lo0eez4r+N2Rv/vPgYXAEQ6B
 I5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684269255; x=1686861255;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGWbmO7v6vcXx/XoMWesDE1+ZZN+mE03VIOoYYtnJYY=;
 b=F5BPeeTox9t++sgmXZ5Jf0Ve4A1esnJ/JZ8cNhBBYorPbzekAUaOAEW/YD4J73XhGJ
 QmrmeCfxBSoX/mMpPEHfix3rDWfAnbBbNWih6BsTvPYnFFqg8sSC/7r/jrqqA8w8/D6b
 9QGZZj4jq2V/lUGI1l0HIKcGvwQr+KHF6XT8n+hXtKNFLSItVSqrA1OABh9gkf/DIr6t
 UUh60+Nj0WYgaC1moO+5qrgFq3MJj1aZEjbTEQNFcRRTOxIWRRap2K3ZnTh28qTaJ9kO
 8gLt3G7DDUujuq5L2iIP0x2osZa/LAukXa3jULTqw8vW/VQ9PYpvnkXC892WR3W/YMfS
 GGfQ==
X-Gm-Message-State: AC+VfDzPXsahVkUCuwZ1NzjU8eDsxBILbYz974lUOosxWJHYlnzyyI8+
 VtiotQPHgRixAjS7hwP/HuDb/2Fm958BXg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:44cd:0:b0:2e5:756b:8e77 with SMTP id
 z13-20020a5d44cd000000b002e5756b8e77mr5088312wrr.11.1684269255749; Tue, 16
 May 2023 13:34:15 -0700 (PDT)
Date: Tue, 16 May 2023 20:33:17 +0000
In-Reply-To: <20230516203327.2051088-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230516203327.2051088-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230516203327.2051088-11-smostafa@google.com>
Subject: [PATCH v4 10/10] hw/arm/smmuv3: Add knob to choose translation stage
 and enable stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::44a;
 envelope-from=3x-hjZAgKCFIC68CDuzu08805y.w86Ay6E-uB678707E.8B0@flex--smostafa.bounces.google.com;
 helo=mail-wr1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: cXx4DzoAxjwB

As everything is in place, we can use a new system property to
advertise which stage is supported and remove bad_ste from STE
stage2 config.

The property added arm-smmuv3.stage can have 3 values:
- "1": Stage-1 only is advertised.
- "2": Stage-2 only is advertised.

If not passed or an unsupported value is passed, it will default to
stage-1.

Advertise VMID16.

Don't try to decode CD, if stage-2 is configured.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v4:
- Collected Reviewed-by tag
- Remove references to "all" stages.
Changes in v2:
- Squash knob patch with stage-2 enable patch.
- Don't try to decode CD, if stage-2 is configured.
---
 hw/arm/smmuv3.c         | 32 ++++++++++++++++++++++----------
 include/hw/arm/smmuv3.h |  1 +
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 17e1359be4..5c598c8428 100644
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
@@ -241,14 +242,17 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 
 static void smmuv3_init_regs(SMMUv3State *s)
 {
-    /**
-     * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
-     *       multi-level stream table
-     */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
+    /* Based on sys property, the stages supported in smmu will be advertised.*/
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
@@ -451,10 +455,6 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
         goto bad_ste;
     }
 
-    /* This is still here as stage 2 has not been fully enabled yet. */
-    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
-    goto bad_ste;
-
     return 0;
 
 bad_ste:
@@ -733,7 +733,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
         return 0;
     }
 
@@ -1804,6 +1804,17 @@ static const VMStateDescription vmstate_smmuv3 = {
     }
 };
 
+static Property smmuv3_properties[] = {
+    /*
+     * Stages of translation advertised.
+     * "1": Stage 1
+     * "2": Stage 2
+     * Defaults to stage 1
+     */
+    DEFINE_PROP_STRING("stage", SMMUv3State, stage),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void smmuv3_instance_init(Object *obj)
 {
     /* Nothing much to do here as of now */
@@ -1820,6 +1831,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
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
2.40.1.606.ga4b1b128d6-goog

