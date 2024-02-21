Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2056479ejb;
        Wed, 21 Feb 2024 09:18:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPHOdCrSU6wP7VGFJomyCoZp0MCufu1DzuwT6rJC4y/TAJdI0FB4NgKS14KkubHi5DICXVlGrqRLemxOU3veDbuFbWxU3H
X-Google-Smtp-Source: AGHT+IE3IHxfa7J12Tz/Vjit5OdDEPEJ/9pPGXhx/j8B0mjMgE9eKCUsLQ4Y+dZiXYBR+jW+KtQc
X-Received: by 2002:ac8:5841:0:b0:42c:4bb3:cb86 with SMTP id h1-20020ac85841000000b0042c4bb3cb86mr25162612qth.5.1708535911231;
        Wed, 21 Feb 2024 09:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708535911; cv=none;
        d=google.com; s=arc-20160816;
        b=FgfYkasAoXdnhVMCdZpT1WmCE5uUew7/n6BkjQObP2IBxInof9fPJH8WyHwSPOFv2R
         ih6MJoMBJgc5zorT2tPPFmexlnSnBq5gdYj4CRX08854Q1Pp6HppVQpYF3JLIZKnXNP/
         OopdR+UYO2j90d9+kIbcoUngGEeRQjUpuuKEymJUmRbJg8Mx51R4/BINF22pRWgyf33C
         LJBrz0lFoRSr0gEB8ochUpsAWi6VIhLnQ64n5TjO1wGtrR2TwkxvxcoMWS46Lix2duMp
         tNYfn0BKWFTd1oSxbHz8nnPO2ZgilqQdk9xOhJvQ/0VgaOaZ/kdo/NxVZnFGpK2LccPo
         +wZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=7LpRySPaP0CHOH79hBVtR1tsWRZD/BKE7TKJiIenQ5A=;
        fh=zNp2EAj9swJofbfdsbnPe/VjGAuGZFd12mWvXxWqB6w=;
        b=s6KI3hhkQx1UoZXVzmlNJRppbYJdA+9EdPjoNXWiGKDtoq6Ss3FSeTW5omLuu+m/Tz
         P3EKT5pNic3G6cTDaOyyy1FnQxzbFcrjwxurEZh/ISrtQXQJlAaX9Kuh9bvRwhkmLp/J
         jJ5pr/UYwrAEdi3szTT+iJDlxSSpHia7vpL+Q4oHgsy66r8FMzKLa0JT1YCgtaXppEDk
         dL6tSg1XvFpbJROkmR7GPlOmQva1trHBUvOpvDDo92eSbWmqmJfCCxEHsoEImRmvnnbr
         5z+7dcAqV4DXuQ7pCl43059/cAD2BEJFYy/0FgiED37mfroL+KgYR4h/2ETesX6l6WO6
         mNhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="EaR/Jenp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd22-20020a05622a269600b0042de85667a7si10538380qtb.335.2024.02.21.09.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 09:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="EaR/Jenp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcqDo-0000Sf-8Z; Wed, 21 Feb 2024 12:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IjDWZQwKCBE4rszyv9Avwr4x55x2v.t537v3B-r83454x4B.58x@flex--nabihestefan.bounces.google.com>)
 id 1rcqDm-0000Or-Gv
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:17:26 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IjDWZQwKCBE4rszyv9Avwr4x55x2v.t537v3B-r83454x4B.58x@flex--nabihestefan.bounces.google.com>)
 id 1rcqDj-0007iq-Vs
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:17:26 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dc6b269686aso10619321276.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 09:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708535842; x=1709140642; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7LpRySPaP0CHOH79hBVtR1tsWRZD/BKE7TKJiIenQ5A=;
 b=EaR/Jenplj9N9FDsmbKtqww0IcMUblXUHo0vdW47/hqHAeP9tFzGj/szxoashm3Xdg
 3f4LED0Wt/eiKrd06x1A+jGYhAGoYyu3dUsX2zOxS1/h9HTOx+lzO8UFzt8dfaDiTobr
 QJpFZy+ihpz+JbH6kNMvuiK9bQESySra52Une+lm2g6w05XWw3pIdzfyBZTvuGRed4Ej
 LDQoR6Eb7kMAd3hglvFOnytpYExIyaF7XemnuDUy/p9WIz09oKPWw976F61DEU6vhOn/
 8URjgM/RvK1wcSw3rX0T/du/nOWGa8Foa0HHgizPAx0GdBZ/j3FK3TfszqI6DDIsft2i
 0esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708535842; x=1709140642;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7LpRySPaP0CHOH79hBVtR1tsWRZD/BKE7TKJiIenQ5A=;
 b=RjS9IJKOX0J6+L+zXs+nT7VurVJ/YlwBUivXZFjE12yc12VNyfy3tQO387aokuUXEK
 xye2yg1ngyfDU1Vs4Dlkpz6Lh2+a5Vqfq05h/fB8NV1yHRWxfPp+eOCQBOjDoLx7fcQW
 tt0LB/9F1jJdmXd/iKFE4BhHzlWb9y6NUKBnuSs0J9XqVrDxHm6IapR8gkZ+eKC/itKw
 Fk0Z74OmSLsjIPB8VsZrCnKEAQkypIqbylpbt+jxGBeAEaiiu9gY66eDjFKYnbRUMZq1
 cqMj8CJ/hADLcY/lXMM38AgNxpsCgyNZLKgh/KBiCTkItyNSSdA3mBS8PUtC4bZg3Mwk
 GtrQ==
X-Gm-Message-State: AOJu0Yx9aEYnKADFtdGmvi6fjbmd1qkJ032pwyABKzWGN8H/sfkTBUaY
 EWxunnyww8DIElN3sxTpsUmzrIL44+bsRXCynmWgpZLKk07lwzk/x9i99eQAI9NGkNfFaxUtqUm
 Th1mwEt+wUfYotlzx8i1AivROdw==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1001:b0:dcc:79ab:e522 with
 SMTP id w1-20020a056902100100b00dcc79abe522mr778978ybt.11.1708535842359; Wed,
 21 Feb 2024 09:17:22 -0800 (PST)
Date: Wed, 21 Feb 2024 17:17:16 +0000
In-Reply-To: <20240221171716.1260192-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240221171716.1260192-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221171716.1260192-3-nabihestefan@google.com>
Subject: [PATCH 2/2] hw/arm/smmu-common: Create virtual function for
 implementation defined StreamID
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, eric.auger@redhat.com, 
 roqueh@google.com, nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3IjDWZQwKCBE4rszyv9Avwr4x55x2v.t537v3B-r83454x4B.58x@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: 5RaLN4IS/epE

From: Roque Arcudia Hernandez <roqueh@google.com>

According to the SMMU specification the StreamID construction and size is
IMPLEMENTATION DEFINED, the size being between 0 and 32 bits.

This patch creates virtual functions get_sid and get_iommu_mr to allow different
implementations of how the StreamID is constructed via inheritance. The default
implementation of these functions will match the current ones where the BDF is
used directly as StreamID.

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/smmu-common.c         | 12 ++++++++++++
 include/hw/arm/smmu-common.h | 16 +++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 4caedb4998..14b3240a88 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -621,6 +621,11 @@ static const PCIIOMMUOps smmu_ops = {
 };
 
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
+{
+    return ARM_SMMU_GET_CLASS(s)->get_iommu_mr(s, sid);
+}
+
+static IOMMUMemoryRegion *smmu_base_iommu_mr(SMMUState *s, uint32_t sid)
 {
     uint8_t bus_n, devfn;
     SMMUPciBus *smmu_bus;
@@ -659,6 +664,11 @@ void smmu_inv_notifiers_all(SMMUState *s)
     }
 }
 
+static uint32_t smmu_base_get_sid(SMMUDevice *sdev)
+{
+    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+}
+
 static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
@@ -709,6 +719,8 @@ static void smmu_base_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_realize(dc, smmu_base_realize,
                                     &sbc->parent_realize);
     rc->phases.hold = smmu_base_reset_hold;
+    sbc->get_sid = smmu_base_get_sid;
+    sbc->get_iommu_mr = smmu_base_iommu_mr;
 }
 
 static const TypeInfo smmu_base_info = {
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 5ec2e6c1a4..d53121fe37 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -131,6 +131,9 @@ typedef struct SMMUIOTLBKey {
     uint8_t level;
 } SMMUIOTLBKey;
 
+#define TYPE_ARM_SMMU "arm-smmu"
+OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
+
 struct SMMUState {
     /* <private> */
     SysBusDevice  dev;
@@ -147,6 +150,9 @@ struct SMMUState {
     PCIBus *primary_bus;
 };
 
+typedef uint32_t GetSidFunc(SMMUDevice *obj);
+typedef IOMMUMemoryRegion *GetIommuMr(SMMUState *s, uint32_t sid);
+
 struct SMMUBaseClass {
     /* <private> */
     SysBusDeviceClass parent_class;
@@ -154,19 +160,19 @@ struct SMMUBaseClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
+    GetSidFunc *get_sid;
+    GetIommuMr *get_iommu_mr;
 
 };
 
-#define TYPE_ARM_SMMU "arm-smmu"
-OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
-
 /* Return the SMMUPciBus handle associated to a PCI bus number */
 SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
 
 /* Return the stream ID of an SMMU device */
-static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+static inline uint32_t smmu_get_sid(SMMUDevice *sdev)
 {
-    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    SMMUState *s = sdev->smmu;
+    return ARM_SMMU_GET_CLASS(s)->get_sid(sdev);
 }
 
 /**
-- 
2.44.0.rc0.258.g7320e95886-goog

