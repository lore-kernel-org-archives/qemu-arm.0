Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp526194ejb;
        Thu, 19 Oct 2023 06:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYfM256zcn+XCUuw9ypczk1+ZPpWyz+vxE3f9A5Icufq0FILRb+MisSS4GNRGB12afBjwL
X-Received: by 2002:a05:620a:294b:b0:775:9ca1:7490 with SMTP id n11-20020a05620a294b00b007759ca17490mr2350477qkp.6.1697723267567;
        Thu, 19 Oct 2023 06:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723267; cv=none;
        d=google.com; s=arc-20160816;
        b=cWuV92fYTWrcLg49tf2rkZfURXe94/oamRw7JAhhl+mOejBZd4JZ5NEzM0dPyeMvbR
         s3qGUqjhSz/7l35M8vGYCFq2FJxKtxjgmtxmcUDqrv/qzctMPj3OJcVEHhOQMWenFXAt
         yzgZA0LZJwm1UxXtGqWtha/rmqs6edTWGlpeWle+p6+JWixMEb6QOxRcKVl0SOU0iVQT
         3KHGEON2/SgO7IxSyy4lBmsrl4XQvCC9BMieH62RiKk1/fUmP7i1mH3ZTYJGX3oBg1It
         pho2gKdBqJcZp1HxELTePkO6ZL8GZ2m6RqlyDLOabNonDeKWGMRARw8RX2Ns9JsPZFiH
         BQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rZCl+gGtzQi9el+ultRZkl2MAbZZ/O9mKreEVwoqTWU=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=y+Y5HXFGrMRdD5zg1z+avVci0I0Halpo1R2yUFeZ09rzTkfij+Y2JiNZNnUw2suDbT
         tsDuX1J1D5SF1UXlWapRN+W6gnUBOTMVpgYlP/+zrZPkCV4ABUPNIu0xUmDFQlTrMpVp
         GPKnGFjN7NrmMYd9II5ZS3lU4kutcbI82HdL6tZYQzobtkPxnhcO/3yF7bN0qQ1NsS35
         ThWdkOiLFfgJ04SxOfkERtyptrIUN1hm/anONJ/E6RE2JSmoWgKv5MzhxhRNkgO8unAE
         +hg0Iz+15AfwJ0GVOxV4rVjHTtAd4vTtuFtKxs/92+hy1B2u7VKMw40GGGhWWqiR/WN3
         XKnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CNNUbE2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05620a084b00b00773eed09877si1506779qku.589.2023.10.19.06.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CNNUbE2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtTNH-0001WF-GX; Thu, 19 Oct 2023 09:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTMu-0001IY-ON
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTMs-0002vw-MY
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZCl+gGtzQi9el+ultRZkl2MAbZZ/O9mKreEVwoqTWU=;
 b=CNNUbE2+cP2+c9nvKHsKzqWd3PXN2F4uoB/U4MImGmbJkuC0mk2y9uLQmulTR92vz/a8k5
 9glbgOP5+QMdwr9y7v9Mmjsgua9f9OSE2m1w80A8ccUwCZh8Ew3S3TB0C+4+oaO7yqVsI9
 V2dhV+4YORIHvqp4OSnRCdkBcu4DBsw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-vw2dXoPKNCOj6KMUWZKSlQ-1; Thu, 19 Oct 2023 09:47:15 -0400
X-MC-Unique: vw2dXoPKNCOj6KMUWZKSlQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CCEF3C0F457;
 Thu, 19 Oct 2023 13:47:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86E19492BFA;
 Thu, 19 Oct 2023 13:47:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 06/12] util/reserved-region: Add new ReservedRegion helpers
Date: Thu, 19 Oct 2023 15:45:12 +0200
Message-ID: <20231019134651.842175-7-eric.auger@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
References: <20231019134651.842175-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: A0V9ojxgI5o0

Introduce resv_region_list_insert() helper which inserts
a new ReservedRegion into a sorted list of reserved region.
In case of overlap, the new region has higher priority and
hides the existing overlapped segments. If the overlap is
partial, new regions are created for parts which are not
overlapped. The new region has higher priority independently
on the type of the regions.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Yanghang Liu <yanghliu@redhat.com>

---

v2 -> v3:
- use l = prev->next
- Added jean's R-b
---
 include/qemu/reserved-region.h | 32 ++++++++++++
 util/reserved-region.c         | 91 ++++++++++++++++++++++++++++++++++
 util/meson.build               |  1 +
 3 files changed, 124 insertions(+)
 create mode 100644 include/qemu/reserved-region.h
 create mode 100644 util/reserved-region.c

diff --git a/include/qemu/reserved-region.h b/include/qemu/reserved-region.h
new file mode 100644
index 0000000000..8e6f0a97e2
--- /dev/null
+++ b/include/qemu/reserved-region.h
@@ -0,0 +1,32 @@
+/*
+ * QEMU ReservedRegion helpers
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_RESERVED_REGION_H
+#define QEMU_RESERVED_REGION_H
+
+#include "exec/memory.h"
+
+/*
+ * Insert a new region into a sorted list of reserved regions. In case
+ * there is overlap with existing regions, the new added region has
+ * higher priority and replaces the overlapped segment.
+ */
+GList *resv_region_list_insert(GList *list, ReservedRegion *reg);
+
+#endif
diff --git a/util/reserved-region.c b/util/reserved-region.c
new file mode 100644
index 0000000000..18f83eb4c6
--- /dev/null
+++ b/util/reserved-region.c
@@ -0,0 +1,91 @@
+/*
+ * QEMU ReservedRegion helpers
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/range.h"
+#include "qemu/reserved-region.h"
+
+GList *resv_region_list_insert(GList *list, ReservedRegion *reg)
+{
+    ReservedRegion *resv_iter, *new_reg;
+    Range *r = &reg->range;
+    Range *range_iter;
+    GList *l;
+
+    for (l = list; l ; ) {
+        resv_iter = (ReservedRegion *)l->data;
+        range_iter = &resv_iter->range;
+
+        /* Skip all list elements strictly less than range to add */
+        if (range_compare(range_iter, r) < 0) {
+            l = l->next;
+        } else if (range_compare(range_iter, r) > 0) {
+            return g_list_insert_before(list, l, reg);
+        } else { /* there is an overlap */
+            if (range_contains_range(r, range_iter)) {
+                /* new range contains current item, simply remove this latter */
+                GList *prev = l->prev;
+                g_free(l->data);
+                list = g_list_delete_link(list, l);
+                if (prev) {
+                    l = prev->next;
+                } else {
+                    l = list;
+                }
+            } else if (range_contains_range(range_iter, r)) {
+                /* new region is included in the current region */
+                if (range_lob(range_iter) == range_lob(r)) {
+                    /* adjacent on the left side, derives into 2 regions */
+                    range_set_bounds(range_iter, range_upb(r) + 1,
+                                     range_upb(range_iter));
+                    return g_list_insert_before(list, l, reg);
+                } else if (range_upb(range_iter) == range_upb(r)) {
+                    /* adjacent on the right side, derives into 2 regions */
+                    range_set_bounds(range_iter, range_lob(range_iter),
+                                     range_lob(r) - 1);
+                    l = l->next;
+                } else {
+                    uint64_t lob = range_lob(range_iter);
+                    /*
+                     * the new range is in the middle of an existing one,
+                     * split this latter into 3 regs instead
+                     */
+                    range_set_bounds(range_iter, range_upb(r) + 1,
+                                     range_upb(range_iter));
+                    new_reg = g_new0(ReservedRegion, 1);
+                    new_reg->type = resv_iter->type;
+                    range_set_bounds(&new_reg->range,
+                                     lob, range_lob(r) - 1);
+                    list = g_list_insert_before(list, l, new_reg);
+                    return g_list_insert_before(list, l, reg);
+                }
+            } else if (range_lob(r) < range_lob(range_iter)) {
+                range_set_bounds(range_iter, range_upb(r) + 1,
+                                 range_upb(range_iter));
+                return g_list_insert_before(list, l, reg);
+            } else { /* intersection on the upper range */
+                range_set_bounds(range_iter, range_lob(range_iter),
+                                 range_lob(r) - 1);
+                l = l->next;
+            }
+        } /* overlap */
+    }
+    return g_list_append(list, reg);
+}
+
diff --git a/util/meson.build b/util/meson.build
index c4827fd70a..eb677b40c2 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -51,6 +51,7 @@ util_ss.add(files('qdist.c'))
 util_ss.add(files('qht.c'))
 util_ss.add(files('qsp.c'))
 util_ss.add(files('range.c'))
+util_ss.add(files('reserved-region.c'))
 util_ss.add(files('stats64.c'))
 util_ss.add(files('systemd.c'))
 util_ss.add(files('transactions.c'))
-- 
2.41.0

