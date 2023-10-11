Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp263769ejc;
        Wed, 11 Oct 2023 10:58:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEshEW2D35tP6v9VrpAKrZjjLAGtTZ+ZLxjXRiLcfKWcCacTFSqSaByU56xdF4TPRNP14fA
X-Received: by 2002:a05:622a:20b:b0:417:b026:7940 with SMTP id b11-20020a05622a020b00b00417b0267940mr22029170qtx.22.1697047080897;
        Wed, 11 Oct 2023 10:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697047080; cv=none;
        d=google.com; s=arc-20160816;
        b=n9ZK9gVyMcHrJEYlOvJOJVKEW8pv+41koxZ52uSnSp9LIJddEOgTIw4/WSXHmNrOTG
         26uN5XKrI4nG7dwcQ01z91Y5oIS7jHJ+PgqrHzssxKXPLFDf+jjuy3T8PAbVDCAxga9o
         0xJtuxQ9Xiq8/ncEfyPVmM9dKo8yS//f3CStXvYU49D81ntJ2Y+jWanPWaoEFqY5Vnxy
         Ss8acHltubKCM48C5ps5zCzO/SwKQD03JJ984PYQCClm0labJBG4o7yyuYhjPJX/kutU
         UiK43Km8Pu0u8jy3hIohdzb9FUjkU3eCNv4IEUEOy8lFfKxttwQdZqsFIkQDZjD5TOgy
         nm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w9aDGjFi1UNChUK+3SWFbcn2xPIqQbPl7OTE3Gk75kI=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=FpsU22oIwItkswYrwgppKhfc9VVxDkFSNzO1Cya0aiGJQK69JZuiyClCxUMtMWO1lE
         xfba1l9Dt/yMr6HPssDiF5N+45U4e8F3EMPPDIZwdgdEPfUn7U5nCujnMdLjjk5yoHCs
         +HUUZdeGp96smxYLUglSlfYCJKx1RZqpZ56VJlGd4WQq1YQcSFLsWOYlpCL1YheI5zzp
         zntUw68AQQej4OZ0UsXZrNjah7PhtAbi+En/LumhgMdp0KCdnDFY7tMqeFMBbzKULM+m
         Ik6YjXK11i8x6BtrCU9Xt6Cnw9hCPHdSI42gODrg/LpdlFwbUI+ruIwiq484RH5aLEAu
         s9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlpWGXjo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020ac87e8e000000b004196273dbbbsi9724616qtj.267.2023.10.11.10.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlpWGXjo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqdRh-0001iL-93; Wed, 11 Oct 2023 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdRJ-0001LU-Fg
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdRG-0006eK-3O
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9aDGjFi1UNChUK+3SWFbcn2xPIqQbPl7OTE3Gk75kI=;
 b=ZlpWGXjoJT/sfHGeDBIHk5eeDxiy556dlPGXWoCwQ2iE3/yfl75kfJf4sh4i6Jb2nxEqDe
 I07ZID3cJVEdX8UBX1cRyCxRzFmhK7+hftHXf8aeT/v4CJVsttLcZsfRp3ja2kJMNwEd8B
 basYR0ui4Rslc7WLmfqz106r1cFh2Ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-c2KwPa_hPIeK5pJtqafHAA-1; Wed, 11 Oct 2023 13:55:53 -0400
X-MC-Unique: c2KwPa_hPIeK5pJtqafHAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECCC3805B29;
 Wed, 11 Oct 2023 17:55:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54ECA492C3E;
 Wed, 11 Oct 2023 17:55:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 06/13] util/reserved-region: Add new ReservedRegion helpers
Date: Wed, 11 Oct 2023 19:52:22 +0200
Message-ID: <20231011175516.541374-7-eric.auger@redhat.com>
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
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
X-TUID: InIPAOGUVG8k

Introduce resv_region_list_insert() helper which inserts
a new ReservedRegion into a sorted list of reserved region.
In case of overlap, the new region has higher priority and
hides the existing overlapped segments. If the overlap is
partial, new regions are created for parts which are not
overlapped. The new region has higher priority independently
on the type of the regions.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

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

