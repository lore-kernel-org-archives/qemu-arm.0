Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1378552lfb;
        Thu, 21 May 2020 02:11:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzQeJO3HGWo9hD0Yhmbx5kg/Jqmm+OH95pOeaXAoMzq9UDU3Tje1rkvA0dDxz4R8PulHHc
X-Received: by 2002:a0c:fc4e:: with SMTP id w14mr8923538qvp.147.1590052296137;
        Thu, 21 May 2020 02:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590052296; cv=none;
        d=google.com; s=arc-20160816;
        b=lomDbFhYe23D+K83xvOdBPbZgSXP7yuqrVVR/HsfBJK6TOgqHJ0ngko9fwrHweQ0bE
         d9bIN9L9IpYc0yyAR9qdmXMMxtDpdHScmS3VGCmDe0XREvgsoqI3eCvmw4FW0TP4Xx/D
         8H33/3HThWiyLzvxTSnxd500ws6NoKxFgBRWGgBJJ5fWfpkTFHajqC5g/e0M/NXuGiDS
         GE9eUo9nmo9GOBOQvh4XmyC20l1HsvpsgsyFLQbA5iJZhJjl02c71W4zKDH/CVnYl1Po
         qtZhDwUjzlxlb9PMP9UkmS1QNZIEXrS+UKICi/SQLZJQ9OWnHhE9aJKeK3dksSrV8hGJ
         fpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kd60isijc7N93R5SBt36LCkpor0G13KGJpP9vjfXfyA=;
        b=ajwnCQNJ3l+/JVi8nkBtD449wOyA9Es6nMBdWbxjCl5rOHrIvkk4aoThxw6ppaWf4k
         jgFwWZpO63cpGWLvzD6kMPnUnf+wEtpsFfEfypmq16827fSeBJKPikgCXecBm0D0KKXA
         aWsimoMi6FNDgSXSoMsdbx/R9X20yFXdIE+tXTWU5QVPiAW98h5rw0jsxe5m6PLXl102
         AsOYlt9jcLnxJhVJgseA5+LW1MnpHQO9sLTrDmUFEH+aQWSdAg8CdkoNqaRQDXc7EhXY
         RUfqLgbko4WE8ByI5F1G9jDGl5OSpB4oqwfy282tKR0b/ag/CJjLZdg4nt/NWZ9PbRm1
         KJKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WQzEGohn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si2919663qvq.178.2020.05.21.02.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 02:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WQzEGohn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbhEl-00047Z-KC
	for alex.bennee@linaro.org; Thu, 21 May 2020 05:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhEg-00046p-1Q
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:11:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59239
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhEe-0005JP-Jn
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590052287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kd60isijc7N93R5SBt36LCkpor0G13KGJpP9vjfXfyA=;
 b=WQzEGohn96wxZmQSYgiOgQR7IDwy5uBkCglM+km5ffjGqiTqAiGZk1xLSRRPRtkGbpTBLt
 dfzhy5ftSfWnntubrerwGt6N7Rck72qUPK01gsy9+NHtqGnGr5G5wmFIIPYFjtRaDAKBij
 vPQkyXFRoL8pl0e6yFs2/uZNjEYs9N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-dKprUG8KNtahSmXsp-dHDg-1; Thu, 21 May 2020 05:11:26 -0400
X-MC-Unique: dKprUG8KNtahSmXsp-dHDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0DD718CA274;
 Thu, 21 May 2020 09:11:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8F2B5D9C9;
 Thu, 21 May 2020 09:11:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH 1/9] hw/arm/smmu-common: Factorize some code in smmu_ptw_64()
Date: Thu, 21 May 2020 11:10:51 +0200
Message-Id: <20200521091059.9453-2-eric.auger@redhat.com>
In-Reply-To: <20200521091059.9453-1-eric.auger@redhat.com>
References: <20200521091059.9453-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f4/MhoSnRZJr

Page and block PTE decoding can share some code. Let's
first handle table PTE and factorize some code shared by
page and block PTEs.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 51 ++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e13a5f4a7c..f2de2be527 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -186,12 +186,12 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
         uint64_t mask = subpage_size - 1;
         uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
-        uint64_t pte;
+        uint64_t pte, gpa;
         dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
         uint8_t ap;
 
         if (get_pte(baseaddr, offset, &pte, info)) {
-                goto error;
+            break;
         }
         trace_smmu_ptw_level(level, iova, subpage_size,
                              baseaddr, offset, pte);
@@ -199,58 +199,43 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
             trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
                                        pte_addr, offset, pte);
-            info->type = SMMU_PTW_ERR_TRANSLATION;
-            goto error;
+            break;
         }
 
-        if (is_page_pte(pte, level)) {
-            uint64_t gpa = get_page_pte_address(pte, granule_sz);
+        if (is_table_pte(pte, level)) {
+            ap = PTE_APTABLE(pte);
 
-            ap = PTE_AP(pte);
             if (is_permission_fault(ap, perm)) {
                 info->type = SMMU_PTW_ERR_PERMISSION;
                 goto error;
             }
-
-            tlbe->translated_addr = gpa + (iova & mask);
-            tlbe->perm = PTE_AP_TO_PERM(ap);
+            baseaddr = get_table_pte_address(pte, granule_sz);
+            level++;
+            continue;
+        } else if (is_page_pte(pte, level)) {
+            gpa = get_page_pte_address(pte, granule_sz);
             trace_smmu_ptw_page_pte(stage, level, iova,
                                     baseaddr, pte_addr, pte, gpa);
-            return 0;
-        }
-        if (is_block_pte(pte, level)) {
+        } else {
             uint64_t block_size;
-            hwaddr gpa = get_block_pte_address(pte, level, granule_sz,
-                                               &block_size);
-
-            ap = PTE_AP(pte);
-            if (is_permission_fault(ap, perm)) {
-                info->type = SMMU_PTW_ERR_PERMISSION;
-                goto error;
-            }
 
+            gpa = get_block_pte_address(pte, level, granule_sz,
+                                        &block_size);
             trace_smmu_ptw_block_pte(stage, level, baseaddr,
                                      pte_addr, pte, iova, gpa,
                                      block_size >> 20);
-
-            tlbe->translated_addr = gpa + (iova & mask);
-            tlbe->perm = PTE_AP_TO_PERM(ap);
-            return 0;
         }
-
-        /* table pte */
-        ap = PTE_APTABLE(pte);
-
+        ap = PTE_AP(pte);
         if (is_permission_fault(ap, perm)) {
             info->type = SMMU_PTW_ERR_PERMISSION;
             goto error;
         }
-        baseaddr = get_table_pte_address(pte, granule_sz);
-        level++;
+
+        tlbe->translated_addr = gpa + (iova & mask);
+        tlbe->perm = PTE_AP_TO_PERM(ap);
+        return 0;
     }
-
     info->type = SMMU_PTW_ERR_TRANSLATION;
-
 error:
     tlbe->perm = IOMMU_NONE;
     return -EINVAL;
-- 
2.20.1

