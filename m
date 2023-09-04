Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1175425ejb;
        Mon, 4 Sep 2023 01:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEES4XKqM2YLZn/0glfGBJ9r3YhDKaY9Ze0rzyNdDS+puyB5fbm00C1Uaof/4qDnd1MW5CM
X-Received: by 2002:a0c:f892:0:b0:64f:7fb2:f17c with SMTP id u18-20020a0cf892000000b0064f7fb2f17cmr9218135qvn.54.1693814805525;
        Mon, 04 Sep 2023 01:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814805; cv=none;
        d=google.com; s=arc-20160816;
        b=zS2QqJzYYveS0s6f2MkAtB55GxgK8hkH4UqwAeUAnmjw+gqJCYhK9kZC4TsTqL8rNQ
         EagxKjdPvfmJdljhI6avjltw4yMIzSrlosKL2KaiH0h6+YMj74ukzjjFu2itiNbFwFBz
         ZEbT3PGtV8YlIGA0dYdrUZ+bvkZjX2apcMwIPW8rLuzoTKpQKTzArLAjL+uc/VtQgxGP
         fy0WOG4kazEIP2ZaDfgNkGV3Q9gDvbYataHgxgIHD9yQsyUPq5harKqijyP9qEmi5IB+
         r51jfPcfN1+R3ClsODpbVJ4d1cSRpVOS/RAITYetv/H0OakZBcp264Mrvyq3rR94OLvV
         wPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BF3aZ5m8bDKQ/gf/crA7TPaevSIkblan+m/xnqK2smE=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=bOUOhJYFCFcZVbdBbqbE8UUhLdMGz9aQ6N/f0DEz1xvWazcXT4RfnkaK6+c0NfOFw/
         6MPPvS4c1VvDzg9+a2QLGzKRQsqr2hza0eSWhy0zeI3MpM/MYuof7uqPp71cUJ69djFn
         sI/mSim/8JpinVVxPR1pZz4SWHd2efiuGvRyNwkrCbJaKmXsVJwMB51Ilv7YpAdoDYSq
         MyDKJqS1bKzLGaM4aO/R6IHrjE54318S8FJ7y1H/FpXOs1yiNlx1Pbt3XlVls5g8Q5ye
         +MV2o0/ABX/g+jdJtQDq2hSXwPB0s2rt241gfUqL1MeIkfNgzDMQEfZ9kQZN6XXJsEMe
         bBYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hWm1BHwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a0cf193000000b0064f364f3585si6020311qvl.16.2023.09.04.01.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hWm1BHwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd4b9-0000v1-Hv; Mon, 04 Sep 2023 04:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4b7-0000u9-Ll
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4b1-00066n-OL
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BF3aZ5m8bDKQ/gf/crA7TPaevSIkblan+m/xnqK2smE=;
 b=hWm1BHwPw2WIX3qZp3gB4jQeWmnhAQ4eOEzV2nwhOuPQvgS7ghBiSONgX9oFGVmBd32JcX
 Ev9nzIk6gVCLcJHWSACyLeeK7LWs905SWfHuVUMymZSFrrk1cVdWFxdM2jLOlmMjass+Pn
 3DP4EmKhZfTFCxsf43wfhVo7kHCKDb4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-1nJkZsFYNKaracu66GZSZQ-1; Mon, 04 Sep 2023 04:04:59 -0400
X-MC-Unique: 1nJkZsFYNKaracu66GZSZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A46029AB3FD;
 Mon,  4 Sep 2023 08:04:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A81140ED412;
 Mon,  4 Sep 2023 08:04:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 01/13] memory: Let ReservedRegion use Range
Date: Mon,  4 Sep 2023 10:03:44 +0200
Message-ID: <20230904080451.424731-2-eric.auger@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: mZOKqYLzWmPc

A reserved region is a range tagged with a type. Let's directly use
the Range type in the prospect to reuse some of the library helpers
shipped with the Range type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h            | 4 ++--
 hw/core/qdev-properties-system.c | 9 ++++++---
 hw/virtio/virtio-iommu.c         | 6 +++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 68284428f8..184cb3a01b 100644
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
index 6d5d43eda2..8d486eeefd 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -699,7 +699,7 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
     int rc;
 
     rc = snprintf(buffer, sizeof(buffer), "0x%"PRIx64":0x%"PRIx64":%u",
-                  rr->low, rr->high, rr->type);
+                  range_lob(&rr->range), range_upb(&rr->range), rr->type);
     assert(rc < sizeof(buffer));
 
     visit_type_str(v, name, &p, errp);
@@ -711,6 +711,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     ReservedRegion *rr = object_field_prop_ptr(obj, prop);
     const char *endptr;
+    uint64_t lob, upb;
     char *str;
     int ret;
 
@@ -718,7 +719,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    ret = qemu_strtou64(str, &endptr, 16, &rr->low);
+    ret = qemu_strtou64(str, &endptr, 16, &lob);
     if (ret) {
         error_setg(errp, "start address of '%s'"
                    " must be a hexadecimal integer", name);
@@ -728,7 +729,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
         goto separator_error;
     }
 
-    ret = qemu_strtou64(endptr + 1, &endptr, 16, &rr->high);
+    ret = qemu_strtou64(endptr + 1, &endptr, 16, &upb);
     if (ret) {
         error_setg(errp, "end address of '%s'"
                    " must be a hexadecimal integer", name);
@@ -738,6 +739,8 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
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

