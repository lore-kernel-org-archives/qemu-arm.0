Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2293462ejb;
        Fri, 10 Feb 2023 14:21:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9G48XxRQUMEGpSRp36VgiAQEZtjqdt8Cgj94Gi7TRDXb9L0DPdE12QWMQzoHAtwk/dg7rg
X-Received: by 2002:ac8:5948:0:b0:3b9:bf7f:66ff with SMTP id 8-20020ac85948000000b003b9bf7f66ffmr26337599qtz.67.1676067661414;
        Fri, 10 Feb 2023 14:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676067661; cv=none;
        d=google.com; s=arc-20160816;
        b=vZkfC7NhJGt9GAe/vfhsCOyc+HsIAU2qO1q8APS56Exk5yeCKNz2pavTjnZehJnq6Y
         kcoySgJ/s3P6wmrdjeVMVIVOZHiVL+VCvm4fvk0ZD/4vWGtDRQGNdl4mBoMC0q4pghgC
         3GEQ3PWB51QbQaXwBYunFKUhKaycHhpOOpyNFoLPtXnIOioGNNtSc1GlwVrnZ4kXnwD+
         71jWUU+3fM4JEdEggClQMWqtL4BDRqDxr0yXZNHDVhA78lhyDPVjpq+ObwSir4rFFNyk
         EY4DBQSmr27REprUnG1RF/GFWrEC3qhVi/nrhsJsNZDUENzH3zOvCF4kuBY/82K+iQ60
         MKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=kyOTwLxfjuVIc4ncSJ1ZzRdaWZjeOJjMhwe2CnX5qIw=;
        b=e1ilqnm64k4Vt1MjLMVYodBCiYJ6dIZiQk692QDvIKlYFkdfAvRLo2TyCbUgUZr/ME
         +KqH6phznPsolxDYozf2ZnHqBI1gx09D/bn8EkMg6fCPT5Qj04OWn+RjIhviJpCmsKj1
         VUgA8gKUC4lU/YEtZc0Jce7vPFsQN4mwgju9oaRzVmrTp9x8/CVlTUbh5Bopolw1hOI6
         KaxMEEhPRiA12brIeqMNCr6rWz8j7LI37CXTPA8MfChYc+tLuLX/sH4BlYEID5Enb2s5
         s7QNQI9kjOM+vPoTIePtGVqEmY8P3FGY0uCncvTDSyfOVdHz1/FBcgTKdL8aM5wXrBro
         xspA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Y1seynmE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020a372f01000000b0071f1898832dsi4065278qkh.734.2023.02.10.14.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 14:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Y1seynmE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQbky-0000e3-73; Fri, 10 Feb 2023 17:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LcPmYwgKCHQkegklSXSYggYdW.UgeiWem-SjefgfYfm.gjY@flex--smostafa.bounces.google.com>)
 id 1pQbkw-0000dm-Pu
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 17:20:34 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LcPmYwgKCHQkegklSXSYggYdW.UgeiWem-SjefgfYfm.gjY@flex--smostafa.bounces.google.com>)
 id 1pQbku-0004eu-Ti
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 17:20:34 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso5249744wms.8
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 14:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kyOTwLxfjuVIc4ncSJ1ZzRdaWZjeOJjMhwe2CnX5qIw=;
 b=Y1seynmEV01WN2hlst6x0YjKvnIhUHIKOKKEtPHVbZ3HHMhMpDt3yZ0FRmpDDpGGxT
 LhjxmYnJtFwFX24NY3sN+OFFF5m1VUCvlK8psck3obPcMcbr9P0aFW90ji3kHFvtofPa
 pCIoKzUZe1Di2/5/uC3WZ4g8lLGblHUcJItw+S6MZKWO9OgnqdGf5u7D+hBOJX5JBpdv
 T8k2shT1n9JiEwU7QxM1y54C1iv5QXAkwjhpAITVC3CrBz937Ttjp1yo3o0EreBNjO2b
 Wut6/A0vRwb66LM/k3DCPy3P4EtyQ4tk7vGiQ1cP94Q1G2aOg9h+Q7e5B8rjsUcNPl4c
 Ljyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kyOTwLxfjuVIc4ncSJ1ZzRdaWZjeOJjMhwe2CnX5qIw=;
 b=ZN0JblYNL1bNPSLlpjMjk62CtExbTfdUq5x9OagNlEmzS59e8BS1r/Mt9Mv7sur6oa
 +iN7BH5XDJTJ+JlmkWTo07esXiy3YoSOCx4GPScBCVyfKHe2ep3++GX/c/dZplhWAOSA
 7KFJzWIYckddXw0r2lwqyXxREWvYFlo4v6eIRBX8MPfSAVrrOpo/0L9+v6k68rW6UGWx
 zl0+2n+Dk1Hj+yZBZ50DkuUc0DIIzUcM+dpOiqFQk3tdjpHGwbw9SdCiWYZ8FxeCqtC2
 B+8EVdQOkaOAJO74eXocuokk25D0bkhtwx9VRFrS8nzeh9LvwA38Lbs6soDsXSEmHwlr
 SRCQ==
X-Gm-Message-State: AO0yUKXFTetGaZXyB6EHZip0xmLM/A6q2Yy5lLX8aEWYCD7+8vFPQyof
 DjUwFSituyszW7DysabWwK3mHkp21qo6sg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a1c:f203:0:b0:3dc:4333:a0b0 with SMTP id
 s3-20020a1cf203000000b003dc4333a0b0mr17312wmc.0.1676067629949; Fri, 10 Feb
 2023 14:20:29 -0800 (PST)
Date: Fri, 10 Feb 2023 22:19:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230210221951.1298668-1-smostafa@google.com>
Subject: [PATCH v4] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3LcPmYwgKCHQkegklSXSYggYdW.UgeiWem-SjefgfYfm.gjY@flex--smostafa.bounces.google.com;
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
X-TUID: yMk/Wil4yr3m

GBPA register can be used to globally abort all
transactions.

It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
be zero(Do not abort incoming transactions).

Other fields have default values of Use Incoming.

If UPDATE is not set, the write is ignored. This is the only permitted
behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)

As this patch adds a new state to the SMMU (GBPA), it is added
in a new subsection for forward migration compatibility.
GBPA is only migrated if its value is different from the reset value.
It does this to be backward migration compatible if SW didn't write
the register.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v4:
- Migrate if GBPA is different from reset value, not only ABORT bit.

Changes in v3:
- Remove migrate_gbpa property as it was unnecessary.

Changes in v2:
- GBPA is effective only when SMMU is not enabled.
- Ignore GBPA write when UPDATE is not set.
- Default value for SHCFG is "Use Incoming".
- Support migration.
---
 hw/arm/smmuv3-internal.h |  7 ++++++
 hw/arm/smmuv3.c          | 47 +++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..e8f0ebf25e 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -79,6 +79,13 @@ REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
 REG32(STATUSR,             0x40)
+REG32(GBPA,                0x44)
+    FIELD(GBPA, ABORT,        20, 1)
+    FIELD(GBPA, UPDATE,       31, 1)
+
+/* Use incoming. */
+#define SMMU_GBPA_RESET_VAL 0x1000
+
 REG32(IRQ_CTRL,            0x50)
     FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
     FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..ddd37f233b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->gerror = 0;
     s->gerrorn = 0;
     s->statusr = 0;
+    s->gbpa = SMMU_GBPA_RESET_VAL;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -659,7 +660,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     qemu_mutex_lock(&s->mutex);
 
     if (!smmu_enabled(s)) {
-        status = SMMU_TRANS_DISABLE;
+        if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
+            status = SMMU_TRANS_ABORT;
+        } else {
+            status = SMMU_TRANS_DISABLE;
+        }
         goto epilogue;
     }
 
@@ -1170,6 +1175,16 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
     case A_GERROR_IRQ_CFG2:
         s->gerror_irq_cfg2 = data;
         return MEMTX_OK;
+    case A_GBPA:
+        /*
+         * If UPDATE is not set, the write is ignored. This is the only
+         * permitted behavior in SMMUv3.2 and later.
+         */
+        if (data & R_GBPA_UPDATE_MASK) {
+            /* Ignore update bit as write is synchronous. */
+            s->gbpa = data & ~R_GBPA_UPDATE_MASK;
+        }
+        return MEMTX_OK;
     case A_STRTAB_BASE: /* 64b */
         s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
         return MEMTX_OK;
@@ -1318,6 +1333,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_STATUSR:
         *data = s->statusr;
         return MEMTX_OK;
+    case A_GBPA:
+        *data = s->gbpa;
+        return MEMTX_OK;
     case A_IRQ_CTRL:
     case A_IRQ_CTRL_ACK:
         *data = s->irq_ctrl;
@@ -1482,6 +1500,29 @@ static const VMStateDescription vmstate_smmuv3_queue = {
     },
 };
 
+static bool smmuv3_gbpa_needed(void *opaque)
+{
+    SMMUv3State *s = opaque;
+
+    /* Only migrate GBPA if it has different reset value. */
+    if (s->gbpa != SMMU_GBPA_RESET_VAL) {
+        return true;
+    }
+
+    return false;
+}
+
+static const VMStateDescription vmstate_gbpa = {
+    .name = "smmuv3/gbpa",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = smmuv3_gbpa_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(gbpa, SMMUv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_smmuv3 = {
     .name = "smmuv3",
     .version_id = 1,
@@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
 
         VMSTATE_END_OF_LIST(),
     },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gbpa,
+        NULL
+    }
 };
 
 static void smmuv3_instance_init(Object *obj)
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..9899fa1860 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -46,6 +46,7 @@ struct SMMUv3State {
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
+    uint32_t gbpa;
     uint32_t irq_ctrl;
     uint32_t gerror;
     uint32_t gerrorn;
-- 
2.39.1.581.gbfd45094c4-goog

