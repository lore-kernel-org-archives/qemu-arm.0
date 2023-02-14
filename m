Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1076670ejb;
        Tue, 14 Feb 2023 01:40:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8vI14iH5JqWo/r/YgMZGc5o66SboXJpkG6cJVR66Xw5nxJI1/yDc7KM6Aul3c5tdRsRIbp
X-Received: by 2002:ad4:5cad:0:b0:53c:c2d1:e3da with SMTP id q13-20020ad45cad000000b0053cc2d1e3damr4472220qvh.2.1676367650403;
        Tue, 14 Feb 2023 01:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676367650; cv=none;
        d=google.com; s=arc-20160816;
        b=ELWS3PN8Nxh7JUdtTF/hve7lFlNk7+kxVPaFI34IcOtT9UH+3cXmF8SwquCAeUf4Ql
         KhmZrNJ3+TdPhGE7r5K/6vIbMGiK7iQ+3I7nlTx78YoGhcjKnGdBvGYEmY8rByemGcoG
         nvP0Zw2P46JsrmXMynyFHmAktCSucuyNAZGEuMo+yYaFPEskmfTzkeNoMEZIdg1XRxvA
         vx5CZSskU+DFmF7DDG7nwA143BWvtHx7zQessAs795Ogo39O7uxwSqvBFMgTwwZ1J2sU
         aQ3HrLuBjWVFHZ0WeC3uEFtI5Xk04Y7083Wo7g4RRQGAVVW4gwMEmdlt2sHTxeDNfpoT
         365Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=Neh8flrNSW6kKtEV2rgeV8if+ORYQQ/9RHHh84hh50E=;
        b=OYsVbeTFQU1Wfp7eDZb/ZjNY26Scaf0zJEM0oXqkh5EykCO+7mEduKbWbLpzC4YC3v
         B0RlO2TDJBDdyznyJhZyFBHtVg9w9NIyDxTUkwywY4V3RptZuh1jb+5O0t6W8gFR3J8p
         rZxVK8L4Bpb8ruWDVDf7ZE/0l6PknA3aJQ6UqwXSdAbF9bma8qXwMSn+96HaZnfh+EEn
         jqzaI8W8mhKYNKnyr2JEFtjsCKYZ5jRzksyGX5wcYuFBBtRSu54vEY9u3ppRsAdCN4ro
         fRO0vaKn4P4oMOGJqDebMxUKjS9udwO6cUBBJeHKaxNP1FzvZCCZQjuui8L8GBiSTzDE
         /+Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="mDdc45/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e62-20020a378241000000b007259df947f8si11246941qkd.504.2023.02.14.01.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 01:40:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="mDdc45/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRrnh-0001Z2-1K; Tue, 14 Feb 2023 04:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ClfrYwgKCIs71378pupv33v0t.r315t19-p61232v29.36v@flex--smostafa.bounces.google.com>)
 id 1pRrnc-0001Ws-68
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 04:40:32 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ClfrYwgKCIs71378pupv33v0t.r315t19-p61232v29.36v@flex--smostafa.bounces.google.com>)
 id 1pRrnZ-0003HJ-9S
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 04:40:30 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 x188-20020a2531c5000000b00716de19d76bso15244446ybx.19
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Neh8flrNSW6kKtEV2rgeV8if+ORYQQ/9RHHh84hh50E=;
 b=mDdc45/eyiEN4QReTJ7j7y2NqKj6Vlefpj9JUqgIHMrC62aq2eH+RL8r4qqSvFyJHX
 RXgcMBETM1HqpxTibLg4BIa4Xllt+tH5hBXUAqn/vEQz2PpRGCpBk7CBlJ5zleW3dhHc
 eWq/TB6hM9zPd1gLSXD+UQuAeM1bnd69Vpjj9OZ4JA/U+KeUfK0OqwlzPBNnh/rY9Rnq
 36WWXM1TiS3x33EFcwWoYVIrdr/e8d73vYq8xXuAZf4xT728mZ+s6csJ9yIbBVv0moZn
 VtarewL/Xm4oJKzADI3ottWDleauVbN/Hsk/oytSRrSlo2nGUBEXt4LVzRc3r7+X9fQt
 xD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Neh8flrNSW6kKtEV2rgeV8if+ORYQQ/9RHHh84hh50E=;
 b=ngJRU79uwxWg67fpAhXaxFaFLFfOF6Ll3MtQ3h69Sq1eLvUkL7fiFgQb3Lob/Raznk
 iLiPfb6o6/DrVN/puUCiqpylLJAj9EzZUXFNHgA3YRHJn0vW9WegUFOiYEq7aP9RsVzO
 H/pv+3Whkq3Wk/OdwcRW8XeDw7odW0pU0X+MNaekQ+wOs10eK+JO02dYRZpejq7mEki/
 96ts1kCocTGZKrbaraol0WAGRbZX3eUBTB5k7rjrLGXE6XLbR9b7aaCxHvvuZbgZ2Yre
 1X7ORMBpvbWdF40H688u9g8IOrSEzMxtnZhtRH3mkIQEYbHpajGCGnBuoztlx5qZ5O2w
 vdtg==
X-Gm-Message-State: AO0yUKX3yEffn2Ff/PunfikUzl7U/F53KjDSrh16wVvb6nDC/ea1uC6s
 Cg/Kx3aSmDLl9HEqP/mK/QUfuKIkuMlrcQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a81:5f45:0:b0:52e:c57e:7f28 with SMTP id
 t66-20020a815f45000000b0052ec57e7f28mr117956ywb.333.1676367626572; Tue, 14
 Feb 2023 01:40:26 -0800 (PST)
Date: Tue, 14 Feb 2023 09:40:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230214094009.2445653-1-smostafa@google.com>
Subject: [PATCH v5] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ClfrYwgKCIs71378pupv33v0t.r315t19-p61232v29.36v@flex--smostafa.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: 2udtTWFxHGNZ

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v5:
- Simplify needed migration function for GBPA.
- Collected Reviewed-by tags.

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
 hw/arm/smmuv3-internal.h |  7 +++++++
 hw/arm/smmuv3.c          | 43 +++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 50 insertions(+), 1 deletion(-)

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
index 955b89c8d5..270c80b665 100644
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
@@ -1482,6 +1500,25 @@ static const VMStateDescription vmstate_smmuv3_queue = {
     },
 };
 
+static bool smmuv3_gbpa_needed(void *opaque)
+{
+    SMMUv3State *s = opaque;
+
+    /* Only migrate GBPA if it has different reset value. */
+    return s->gbpa != SMMU_GBPA_RESET_VAL;
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
@@ -1512,6 +1549,10 @@ static const VMStateDescription vmstate_smmuv3 = {
 
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

