Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286516njm;
        Mon, 1 Jul 2024 04:03:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLCgt4IdoEKOqlZafRB4aDsROR/tdTYBRcG+N5ee7ksFevs3R9/BJP9iePc4Ku0gKpFSI6GKRyiL+bUv5EdiImrNbDqxur
X-Received: by 2002:a05:690c:281:b0:62c:e6c0:e887 with SMTP id 00721157ae682-64c7123d5a4mr54384627b3.9.1719831817819;
        Mon, 01 Jul 2024 04:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831817; cv=none;
        d=google.com; s=arc-20160816;
        b=nS+OFp+JFWHe8CDfhBYcsSt547mAQ1NACDoph8Nx6a6au83xPbtXK6VPbxEcmZ7jRW
         jvSyAjjHeMhTjdQV/qDC6BIQhWLuhD0shdmMJNtfwAN615UMb0XE/7Sp3UrO8P80YTLq
         7Zk4tD4o30cX1mW/mbd+fnaTdcOsq8WY2NIbkWPEeJ9QXBQW43TL5QnXxMrudgOJuWMS
         PjKievXQ6JnlEHNtlS6LaxbfjZCBwgCQNJWUhNd5sUmPO+wM5SuLlpTwsx5cgNRg6b4O
         UMTzuZpxKzDheIHqpG6kF56yZzjdBnhXgZtpQWmH1dJtctg73RQMAoQKRF6sCfJeT5CC
         kEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=5LSDXnoSPQ2MeCK2bUawg9m+cInschyHMnQt6fM6A24=;
        fh=KZoJHdS+9GGVXnE+vwY/8wZFkapfufmNKEBeSf/P4BA=;
        b=vAMelJoH48NTFOSD0t5+67PUmr70HcKQm33/hwmjo/FPruL9sa8XuMmUEXbjHEfXQz
         UEBwtlrngof+PvZuRAjiTZteCodfP7alPYf0MBUiFBaKIKDFzJYwyPs0pxp+wajNByc5
         p59shNrm7kkFwdH6I8qV9ovbLWOge2qpsnnS5ZX+xfGbiH9HEuimiYjYFRGtQSpYAZgA
         QrNtiAl9ej1obqOKucmerZoRcOyGpbwvFUvAMEEjbrjLiZ+BkEizFVSpUFykGi77Zq7J
         tWzoePVRlMvezkhzuKcpK5/MV0ectY6z2zysjWwAnVBro95++XFxy//+Bs9LpgmFmh9w
         Zr6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="p6/VM81C";
       spf=pass (google.com: domain of 3cy2czggkc2gysuyzglgmuumrk.iusgrkd.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3CY2CZggKC2gYSUYZGLGMUUMRK.IUSGRKd.HKTTKKROTGXU.UXM@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3CY2CZggKC2gYSUYZGLGMUUMRK.IUSGRKd.HKTTKKROTGXU.UXM@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-64a9c120f26sor36082007b3.18.2024.07.01.04.03.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3cy2czggkc2gysuyzglgmuumrk.iusgrkd.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="p6/VM81C";
       spf=pass (google.com: domain of 3cy2czggkc2gysuyzglgmuumrk.iusgrkd.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3CY2CZggKC2gYSUYZGLGMUUMRK.IUSGRKd.HKTTKKROTGXU.UXM@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831817; x=1720436617; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LSDXnoSPQ2MeCK2bUawg9m+cInschyHMnQt6fM6A24=;
        b=p6/VM81CNodvkTkJT//83XgwRvJPHimvIWeB4oQa9VRtjoIjnhofUOGh432JUx4Wzw
         g9D+AeEjhgAkQT5igJO6rZI8DsKHF+znHCbBOCnLZ4eorCw4eNscFCJXJusgzCKsgfOv
         eW15qEIOqy1yYgf/cTPb5i63kTOLoJMjasb28evFNENhyZYCcc/g/FuJkm600vLefULD
         JR1YcNYJ52gtYWYPe9xXVFe/IIi8hXaS9lAiZ2jrYxrMVxkdRInYyVYBJRU+5a9r3xNw
         CzGEYKOxbFePfi7MhAnAVvdgwtkCB0DJ1rlulXN0ucJDQU6TaV51i+UB4AMTgp+OZimZ
         J6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831817; x=1720436617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LSDXnoSPQ2MeCK2bUawg9m+cInschyHMnQt6fM6A24=;
        b=pyd55WPx1WwSt9vHy+rtzxqn76LgafY2HrB8RpVQqcaiIOlMgY3lkxYW/uovATDVu/
         jbId/WksWc/h+TBtY/278g2uqiAO8l75prWJa7OdXtZCN23roB45kUw+Ei++BhVj/Pq/
         lg0+0g2VrFEf0WKR8PQrQlrBPI0uf/GIMIrAiyBM1SoIWiaCppwxoJx0VB8JSvzVYemr
         9CZqY+glEjTnSMuXpfPaWkqWJLxsx8gDjJGVaXnLcx1WuhJKPS5m0DmM9KU8H7+eQ7ny
         F2C/KtMvR3k82FEGpjze7PZ763veSOpiNt43CWDZIUZ3ijYbJoL5n9C6bB4mbM7qYO5P
         krWw==
X-Forwarded-Encrypted: i=1; AJvYcCV5FcrOLY+VcP0+cmnUc32PZzZewXo/Vql25vgnxW+cfzZAKTSQUC7d9z4YH0hqdq35Hobe13kHooCW21etVsQ5kYPWAAMn
X-Gm-Message-State: AOJu0YyiBcXxNrWoCOIqI26qzkgmr6xp46JjJv5tIm7OuFyrf2SqXUPz
	lyHKqMYgT7trW02REON1gfHVIveJIPj4ibbglxY0fiq9LEIzjfrMubUUP1g7ocMTN61jZvChnOK
	SlHPaBTwqTw==
X-Google-Smtp-Source: AGHT+IG7I4C3dt0U1Z5kYgElyEilH4iD8Mt5db6kKuV8FdnmOnPAFKQ80uePpfbG/YpN+i9hI0/PQSLc1zCeaQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:eb84:0:b0:61b:e8a2:6f4a with SMTP id
 00721157ae682-64c7258b7a2mr205927b3.0.1719831817139; Mon, 01 Jul 2024
 04:03:37 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:35 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-14-smostafa@google.com>
Subject: [PATCH v4 13/19] hw/arm/smmu: Introduce smmu_iotlb_inv_asid_vmid
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: j4IMExDLX/ha

Soon, Instead of doing TLB invalidation by ASID only, VMID will be
also required.
Add smmu_iotlb_inv_asid_vmid() which invalidates by both ASID and VMID.

However, at the moment this function is only used in SMMU_CMD_TLBI_NH_ASID
which is a stage-1 command, so passing VMID = -1 keeps the original
behaviour.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 20 +++++++++++++-------
 hw/arm/smmuv3.c              |  2 +-
 include/hw/arm/smmu-common.h |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 5bf9eadeff..d0309a95b2 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -159,13 +159,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
     g_hash_table_remove_all(s->iotlb);
 }
 
-static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
-                                         gpointer user_data)
+static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
+                                              gpointer user_data)
 {
-    int asid = *(int *)user_data;
+    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
     SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
 
-    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
+    return (SMMU_IOTLB_ASID(*iotlb_key) == info->asid) &&
+           (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid);
 }
 
 static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
@@ -270,10 +271,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
                                 &info);
 }
 
-void smmu_iotlb_inv_asid(SMMUState *s, int asid)
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid)
 {
-    trace_smmu_iotlb_inv_asid(asid);
-    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
+    SMMUIOTLBPageInvInfo info = {
+        .asid = asid,
+        .vmid = vmid,
+    };
+
+    trace_smmu_iotlb_inv_asid_vmid(asid, vmid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &info);
 }
 
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e5ecd93258..928f125523 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1329,7 +1329,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index de032fdfd1..2bc9a03d47 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -212,7 +212,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
 SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
-void smmu_iotlb_inv_asid(SMMUState *s, int asid);
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
-- 
2.45.2.803.g4e1b14247a-goog
