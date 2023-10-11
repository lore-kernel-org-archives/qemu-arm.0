Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp263115ejc;
        Wed, 11 Oct 2023 10:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ2liH2YjxtJ6caUuC+BEHsYVQ+zvk4R6f26ZWE9Tt66jLfpmliAXuO6GEUCXHuwE5hKb1
X-Received: by 2002:a05:6214:2dc4:b0:65b:821:58c1 with SMTP id nc4-20020a0562142dc400b0065b082158c1mr22490159qvb.57.1697046991403;
        Wed, 11 Oct 2023 10:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697046991; cv=none;
        d=google.com; s=arc-20160816;
        b=jJ91P2r8dOrVsxlXfm7TmZiok3h1OhwqIDbAZqVLDlwCqYbcQDSqtL4ILpsEQCZblD
         xtry1carEPPQ1iHeFWtXl/CCiTDSA3b5uBBA9kIJpvuXSYKCSJOUfdfTDMtprsXMrKEB
         GrMYQ9mV3YaGcg9j+Uo0v3VzPfSKtj+a6SPDQALXizhzTBOqNQJtmJq3rDSSdQxnsY6e
         9m6sThQTsZHQT8/U6woAQ3FivS/f+3tlpft4wdc+fgJwF2rNPSR1m7eX8SSvg5fRZXI/
         DVcvM3ZLBAsGSgJYWW1dm7o1nSespd9yXBOXsQkQv3zKUybuCQWVJEjH7HE4B2fe38r+
         +41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7TTaW7Wy0upl/zpDug/TXHfRt22PzstRGTGjza28yyQ=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=coRaPBxQjKSau3oDjlzdi6gUGm1LSNJ4S755tgeNq9lfUlpI9rmrU+xH/7R22LvM5x
         yIfbRrhuMQW9T5kX76+701ZAfZv/3KGIxSn3MQywA9U1R3CtZGK3ZihICMnIGsJyZvJX
         N9YismkE67ckRo0PX8BnBv91dox1mBvNuEGCooT7MJ14dfA8Y82nXlCyKuyDGPPaDDC4
         2+78IWPa1HOgaBbebMwkkVAur/4gpFysVMSKrKEjSu0wmTh9pGAnFb6TsCzLv7XAqx0g
         lhNMUBeexrr7+cYcV381jH+0WVuu6uW7Aj77QLsUlEOmCVWgGZBrlsoU4oKa7qNFaVIw
         qFlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPAYqA5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020a0caa4f000000b0064f3b7ec231si9514149qvb.131.2023.10.11.10.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPAYqA5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqdR0-0001Dt-1t; Wed, 11 Oct 2023 13:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdQw-0001DM-IE
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdQu-0006VJ-76
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TTaW7Wy0upl/zpDug/TXHfRt22PzstRGTGjza28yyQ=;
 b=XPAYqA5ufW0eNQsEtH/cK6GnB32iP5LDvmYB4Y0y/InNrIEmc7fGpMXIUiH07UCqh5QIWw
 ll0axK1bNxxu0Lpo54QCi78Z3EDmfdlFaUGdegKLe0FhC6l4ga6iXMtcXLAo5+bcYSZJvQ
 NR6W3mnJsMCo2+UwJxV04zwv7BX4CGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-iffdDzv-PZm-B2e90psbgg-1; Wed, 11 Oct 2023 13:55:39 -0400
X-MC-Unique: iffdDzv-PZm-B2e90psbgg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C02385828D;
 Wed, 11 Oct 2023 17:55:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7267492C3E;
 Wed, 11 Oct 2023 17:55:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 01/13] memory: Let ReservedRegion use Range
Date: Wed, 11 Oct 2023 19:52:17 +0200
Message-ID: <20231011175516.541374-2-eric.auger@redhat.com>
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: S4ihR0yOWzNK

A reserved region is a range tagged with a type. Let's directly use
the Range type in the prospect to reuse some of the library helpers
shipped with the Range type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>

---

v2 -> v3:
- added Cedric's R-b

v1 -> v2:
- Added Philippe and David's R-b
---
 include/exec/memory.h            | 4 ++--
 hw/core/qdev-properties-system.c | 9 ++++++---
 hw/virtio/virtio-iommu.c         | 6 +++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c99842d2fc..0d83f83d6d 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -24,6 +24,7 @@
 #include "qemu/bswap.h"
 #include "qemu/queue.h"
 #include "qemu/int128.h"
+#include "qemu/range.h"
 #include "qemu/notify.h"
 #include "qom/object.h"
 #include "qemu/rcu.h"
@@ -79,8 +80,7 @@ extern unsigned int global_dirty_tracking;
 typedef struct MemoryRegionOps MemoryRegionOps;
 
 struct ReservedRegion {
-    hwaddr low;
-    hwaddr high;
+    Range range;
     unsigned type;
 };
 
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 688340610e..07ac2f8f20 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -691,7 +691,7 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
     int rc;
 
     rc = snprintf(buffer, sizeof(buffer), "0x%"PRIx64":0x%"PRIx64":%u",
-                  rr->low, rr->high, rr->type);
+                  range_lob(&rr->range), range_upb(&rr->range), rr->type);
     assert(rc < sizeof(buffer));
 
     visit_type_str(v, name, &p, errp);
@@ -703,6 +703,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     ReservedRegion *rr = object_field_prop_ptr(obj, prop);
     const char *endptr;
+    uint64_t lob, upb;
     char *str;
     int ret;
 
@@ -710,7 +711,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    ret = qemu_strtou64(str, &endptr, 16, &rr->low);
+    ret = qemu_strtou64(str, &endptr, 16, &lob);
     if (ret) {
         error_setg(errp, "start address of '%s'"
                    " must be a hexadecimal integer", name);
@@ -720,7 +721,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
         goto separator_error;
     }
 
-    ret = qemu_strtou64(endptr + 1, &endptr, 16, &rr->high);
+    ret = qemu_strtou64(endptr + 1, &endptr, 16, &upb);
     if (ret) {
         error_setg(errp, "end address of '%s'"
                    " must be a hexadecimal integer", name);
@@ -730,6 +731,8 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
         goto separator_error;
     }
 
+    range_set_bounds(&rr->range, lob, upb);
+
     ret = qemu_strtoui(endptr + 1, &endptr, 10, &rr->type);
     if (ret) {
         error_setg(errp, "type of '%s'"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index be51635895..e5e46e1b55 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -645,8 +645,8 @@ static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
         prop.head.type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM);
         prop.head.length = cpu_to_le16(length);
         prop.subtype = subtype;
-        prop.start = cpu_to_le64(s->reserved_regions[i].low);
-        prop.end = cpu_to_le64(s->reserved_regions[i].high);
+        prop.start = cpu_to_le64(range_lob(&s->reserved_regions[i].range));
+        prop.end = cpu_to_le64(range_upb(&s->reserved_regions[i].range));
 
         memcpy(buf, &prop, size);
 
@@ -897,7 +897,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     for (i = 0; i < s->nb_reserved_regions; i++) {
         ReservedRegion *reg = &s->reserved_regions[i];
 
-        if (addr >= reg->low && addr <= reg->high) {
+        if (range_contains(&reg->range, addr)) {
             switch (reg->type) {
             case VIRTIO_IOMMU_RESV_MEM_T_MSI:
                 entry.perm = flag;
-- 
2.41.0

