Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp678246lfy;
        Tue, 28 Jul 2020 08:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxztOlKAFHe8PDM0Iegfg8LvQ/9CPTI3dKO8f2Leg6kPjw5W6TOiZuvHEdEAxeIW7TQc6Y7
X-Received: by 2002:a25:ca83:: with SMTP id a125mr23022438ybg.513.1595948929954;
        Tue, 28 Jul 2020 08:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595948929; cv=none;
        d=google.com; s=arc-20160816;
        b=ClqNGFNW5dKk3uoQ5eYd30KUDhXAJCe6hYYtMC4Q5AXVPapz40m9NgabCX2Za0/v+y
         KF+i0FJ4Ae7QqdJJByoo0Ik/mNlfVLBDhcA7tw/J6iJQvN6gtWx/hFDN79d3aTbLbi7b
         wJpgVns2dGTyMoRhqBNdrj9uPM5NrtYAoKEgiO4qi99Y2ktfa1xBZfHYQYbzwUCnEYLa
         Kykf5y86tauR/JuagLn/YPG2Qo8wSLAAk3OVcTE5HKR9lAxb4P9jE7gXd31874UAHXdl
         cjljWU0BbFOpLXa7inDQmLp/0+A4DtJyiErIcinjX0bs5WTrOlykIKLhR/2Cf2u3t/KC
         2lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t2J/dGXSqZTmczEuwos+55juIcoJHUZyz7xpoeeau2M=;
        b=QBOknL2UYIIr1JtcKIkwaErGzJotpTZpiQR1Rd9gk7Zr88zp0Y8sCjFsrjjJtKNJ4h
         2kI66Wpm4olIMy7fEJDY3AMKlWHHAUR0su5NzNAYDsa0SKqkCZ9RqLi5yTp8w6iHpOmv
         H8hkHxc5zAxXPnHf56fIrK4WMZlB77RYXmuzrKs37Sv0RTwZxMPKcxmW+4NiP/un74KQ
         Ssbi28XkbiE1lAzg0YCgikjB65KuauwjrR9Z7Y2kXCKtztVDptSrICRPcARMn8y0FgkR
         RjFq68LY70mRR4evEjCu+aKTeFVzn6radNlTvRjvyInF15D8CMHzMHerE1sjjUATOrq4
         1vkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Jeiqf/67";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si4677728ybn.122.2020.07.28.08.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Jeiqf/67";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RDl-0004gq-AM
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RDX-0004bn-OE
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:08:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38222
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RDV-0007YN-AV
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595948912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2J/dGXSqZTmczEuwos+55juIcoJHUZyz7xpoeeau2M=;
 b=Jeiqf/67cUVK6N2F+6gzWLIi6uTn+INNhyXqoP1D7tv/4f1Hq/thV9ZYs4A1MQ9T22mo2W
 cypLBCXt8iO9hmg7zNqE47/fTGjcv5IM7Ay0eHZLIDFRf8MSB4r9X3bvlF3+vyQFtNwamV
 WGciH95M7J0t+F6C7Q1v9oTZ4oMgcNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-5zB67anWObKM8nU0D3Qa5Q-1; Tue, 28 Jul 2020 11:08:30 -0400
X-MC-Unique: 5zB67anWObKM8nU0D3Qa5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB1E28CE862;
 Tue, 28 Jul 2020 15:08:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16285C1BD;
 Tue, 28 Jul 2020 15:08:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 01/11] hw/arm/smmu-common: Factorize some code in
 smmu_ptw_64()
Date: Tue, 28 Jul 2020 17:08:05 +0200
Message-Id: <20200728150815.11446-2-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Jb1LOWIUUxcZ

Page and block PTE decoding can share some code. Let's
first handle table PTE and factorize some code shared by
page and block PTEs.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v1 -> v2:
- restore goto error in case get_pte() fails
---
 hw/arm/smmu-common.c | 48 ++++++++++++++++----------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e13a5f4a7c..a3f9e47398 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -186,7 +186,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
         uint64_t mask = subpage_size - 1;
         uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
-        uint64_t pte;
+        uint64_t pte, gpa;
         dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
         uint8_t ap;
 
@@ -199,56 +199,42 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
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
-    }
 
+        tlbe->translated_addr = gpa + (iova & mask);
+        tlbe->perm = PTE_AP_TO_PERM(ap);
+        return 0;
+    }
     info->type = SMMU_PTW_ERR_TRANSLATION;
 
 error:
-- 
2.21.3

