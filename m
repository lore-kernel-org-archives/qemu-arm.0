Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp814564lfc;
        Wed, 26 Aug 2020 07:38:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOBDCSdnfLLnPJAflZHxIm9JH/kXwbPwfcP8Ug+za6E6JHdZhtRF4GlRl+nl5tL7Ufri18
X-Received: by 2002:a25:e406:: with SMTP id b6mr20666633ybh.211.1598452739627;
        Wed, 26 Aug 2020 07:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598452739; cv=none;
        d=google.com; s=arc-20160816;
        b=CBwAarokzVUdRU7B222VczNZeq7WaqHcCwU6hFs02+ip/QE0INV6xX7RwJbG96qNml
         K5KYa2UzFxqT0wFWvfWuApNFwArauNa2ANDSr2x0ZP1RJu5p+/xD4baXhcwphHO0HW5O
         zPAHqu68uhhBcpV5gxJBACAtERpWMirOd/yl93yZyJmDDR6Af/G83OADgo2Pe9YETNFE
         uAxssaYft4Vu+z4nI9DwR8f6geaTBfWt8WjbvM1U1SlhNIVhNv5v+CvLifVdUZKzJR6K
         FnwX7Y6HSeU+DVjXgKrqt1gQWjDKsDQ4/rVjgakYa7YbQltn0Jp9QVQ4kUo606yFW+8+
         CoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rIhye1UWNZiZ/pCD75LUBoe0Ew+5jSd3Ovk1fJqErkE=;
        b=IGMSYrP+B7mqO52jFN8CmaSksXWQebvEUjiDD/MsB1xy4Mq83QgwUbviuSM3VwGhmL
         YW3z3DkywY3/ctkRETfYePhR0mlMVwUOAaU9uvI/lFDec+etd+4DLu4/eBo8fmb+8RAt
         DoCtv6tLsGrVctVnJ7eUOdYFjiLnxBV2iigrl67pm+DPa1D5UDcBlG/UQHbwJJhE2Z7X
         HGmGmQRFUXfhJtz/xWZrytplS3uIk8R5FBbOdEc4RqxifrBtj7o575wU86ARRTau9vyo
         p3BqrH4+rwPWPvGHqxFYog/hz783l0hgEQX7DLHo9o4CdS1x3+suzOQ/Mb9XxD4jyZgS
         KC5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wrx/1haD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m196si2290469ybm.384.2020.08.26.07.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wrx/1haD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwZm-0007G4-To
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwYs-0005bT-W1
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:38:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57341
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwYr-0006F1-C5
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598452680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIhye1UWNZiZ/pCD75LUBoe0Ew+5jSd3Ovk1fJqErkE=;
 b=Wrx/1haDd6H/bVF44lUAgmic7XA/VcEj8lQIVnjuKYGIiEkEAqSQEdXA0dm9zrhoJT4DcT
 03u627h/GcE1ltSHSui/GMahaIl6/FsyAeQM8iGZol4gBvedZ4PfWdzIiQ7roZ2CKLgEFr
 0KCbgt173UeVNDgOio01b334koKK+vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-j7lRtsR5N_GzUkHzB7zVQA-1; Wed, 26 Aug 2020 10:37:59 -0400
X-MC-Unique: j7lRtsR5N_GzUkHzB7zVQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFCB81CAFA;
 Wed, 26 Aug 2020 14:37:57 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-59.ams2.redhat.com [10.36.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED08676E00;
 Wed, 26 Aug 2020 14:37:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v6 04/13] amd_iommu: Mark all IOMMUTLBEntry as IOMMU_IOTLB_NONE
 type
Date: Wed, 26 Aug 2020 16:36:42 +0200
Message-Id: <20200826143651.7915-5-eperezma@redhat.com>
In-Reply-To: <20200826143651.7915-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:16:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cRWA8wIP+LnS

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/i386/amd_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 087f601666..c2607e9e91 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -946,6 +946,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
         ret->translated_addr = (pte & AMDVI_DEV_PT_ROOT_MASK) & page_mask;
         ret->addr_mask = ~page_mask;
         ret->perm = amdvi_get_perms(pte);
+        ret->type = IOMMU_IOTLB_NONE;
         return;
     }
 no_remap:
@@ -953,6 +954,7 @@ no_remap:
     ret->translated_addr = addr & AMDVI_PAGE_MASK_4K;
     ret->addr_mask = ~AMDVI_PAGE_MASK_4K;
     ret->perm = amdvi_get_perms(pte);
+    ret->type = IOMMU_IOTLB_NONE;
 }
 
 static void amdvi_do_translate(AMDVIAddressSpace *as, hwaddr addr,
@@ -970,6 +972,7 @@ static void amdvi_do_translate(AMDVIAddressSpace *as, hwaddr addr,
         ret->translated_addr = iotlb_entry->translated_addr;
         ret->addr_mask = iotlb_entry->page_mask;
         ret->perm = iotlb_entry->perms;
+        ret->type = IOMMU_IOTLB_NONE;
         return;
     }
 
@@ -994,6 +997,7 @@ out:
     ret->translated_addr = addr & AMDVI_PAGE_MASK_4K;
     ret->addr_mask = ~AMDVI_PAGE_MASK_4K;
     ret->perm = IOMMU_RW;
+    ret->type = IOMMU_IOTLB_NONE;
 }
 
 static inline bool amdvi_is_interrupt_addr(hwaddr addr)
@@ -1011,7 +1015,8 @@ static IOMMUTLBEntry amdvi_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
         .iova = addr,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
-        .perm = IOMMU_NONE
+        .perm = IOMMU_NONE,
+        .type = IOMMU_IOTLB_NONE
     };
 
     if (!s->enabled) {
-- 
2.18.1

