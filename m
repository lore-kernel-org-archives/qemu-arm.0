Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1587998lfm;
        Thu, 2 Jul 2020 08:29:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLNtPOYyDQ+RJg+Dmwy9SoW5pRyDmuLHAy+E43QBZ8yq0sAH+7414ae+x45lA9yYZOXnIv
X-Received: by 2002:a05:6902:68b:: with SMTP id i11mr50900028ybt.396.1593703798706;
        Thu, 02 Jul 2020 08:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593703798; cv=none;
        d=google.com; s=arc-20160816;
        b=PK+N8UXKvxrqj+86jKMYMES5Jlc9AaKNPImQPOBnOuiVoYJm4tHc+uvGMZIwemr9aR
         075KaZCBHaLNsSsRfYseQdnKf/5ZSvRp+LrcaOcgA89p7NaLJiVTBmOXS0lvQXabQugk
         jNG26mKzHVPsTLraxbMqVKf0fEOzmX4/MunruXU0CY4oZSDDHbswHn7KC+U3BiX5pTDZ
         8wbkY1PoJd8JfbH5SXi5LjdSva/4myeROd81yEedpo6R+qRRwJD+GxFasRGyOvCgoTqm
         /xk5UmhfieFSOtcw8GPLBbk+S4lEIcxnVyY8n5f2DaPQE0FiMWyg6XPqYVw1whnb7Rd0
         Wu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LDpaYhPZ/FHMcFEBo2iduOx48Ch9dqf1Z0IyUm32XR4=;
        b=md8bFIajRB3Lvd4Lyu6utsuD0G+0ShuU2Pc3TWvaK9Ncsapj38BzSLfLYbNdjS1fv8
         KuP4LYK1yuXbVh+DoHPFApEkQ8ooPTbyw2mfdJPgXwAoPHWvXzCPBqKnAvKEfRqOwWhT
         cewfiWwBGDeVIN8QkPqMbDtE3Qeo38KUrevNfc07aZ5HUMBlOMeWpYlOSrNx22z9R8Ap
         sYv9Vci2HgeTgi8tLWVGw2QGGDzpSaESjThv3AxV3l8XWhkUX0VYlBaemJ+X6kmb1yZv
         R3leyKMM376pDjdTOeISrePwSoe0xsvgjc7+KygGjsLdFVjJhdTgAyGh3rmHgN0vZ9oM
         6bgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KAbszJhx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si9062099ybl.37.2020.07.02.08.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 08:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KAbszJhx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr19y-0004Wb-1X
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 11:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17d-0000hw-1i
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:33 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27668
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17Z-0006K1-BI
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593703648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDpaYhPZ/FHMcFEBo2iduOx48Ch9dqf1Z0IyUm32XR4=;
 b=KAbszJhx8UjpAOBcmHSpCBoZ5w871Z3g63ht1wIW/Q5WDEcnwiyIc06cYJzBxt9+2UGsuP
 atC+AC31XTQXWs3O5PW1Rc0lBDLVsjOqq6CoL7GE4AyvzpxIML1j4Zn30EcdkQxNM9GFFs
 oaYQUV8LWWBWUPxGLV+1Yz0zBgaRaqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-oLbRihpdMoCt7vFd8brXeA-1; Thu, 02 Jul 2020 11:27:24 -0400
X-MC-Unique: oLbRihpdMoCt7vFd8brXeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E925107ACF2;
 Thu,  2 Jul 2020 15:27:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB37C5DC1E;
 Thu,  2 Jul 2020 15:27:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v2 1/9] hw/arm/smmu-common: Factorize some code in
 smmu_ptw_64()
Date: Thu,  2 Jul 2020 17:26:51 +0200
Message-Id: <20200702152659.8522-2-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-1-eric.auger@redhat.com>
References: <20200702152659.8522-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: j4UXUq7KSIxc

Page and block PTE decoding can share some code. Let's
first handle table PTE and factorize some code shared by
page and block PTEs.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

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

