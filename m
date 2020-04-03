Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp470030lfi;
        Fri, 3 Apr 2020 03:20:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKP87pRdW100x9sRTgc/t7ZDs5HeEmrYmOs4vjtzdypesU3uhmOuxPlabW669eRYEq9m+IM
X-Received: by 2002:a37:e115:: with SMTP id c21mr7151298qkm.249.1585909206451;
        Fri, 03 Apr 2020 03:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585909206; cv=none;
        d=google.com; s=arc-20160816;
        b=oph3lHn7weMe5mzAoZ+sOfBWb30M/HvM4onBsNl5OuJrRXfOpYUZR5lPfu8U+19IDB
         KSz+j118z+1ZcwTdacYeNeNDeQz1jn9QK0zZ4WfCU+oY1gHKLzqAvVFKpKtD4UDA8zJN
         gZJ0WbtYjYsEpZKEH9p2xHedjyvfGkb5M8t6BkH47IRN3sHyxG9AECodaMGBx4G6JKmR
         QrJDSjCrhpYKzpVWdTXLWFtk+VgEr64hsnKcisMCbhbwhrSvtbDA7EtzPhAgIRPQ0y+s
         qaWPmNWqpHEn0ColuSbtNEBM69J0YNPteD1ks7bNCQixl6scyxWVAw5LW3uLhBd5pXNS
         34ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=iFUpAzeliQFHgW5uVlrZOFQswa0SqmFF2uG4ZCQ1Crs=;
        b=oa0nplKCLYqNfXAnM4KWbrfJssg+aVv5IWWjt6xupcT/iNS1PT/0ZfmK0Tr4qbvbsF
         C43NJbZO3xWpjCHOK5g1/TMaUbUqSa3uK0GRIrkjvVospgT6jTLt9QKpdCcRzDjtw9ci
         5cTly9Qb6GUFeK/Cbd+Pkb6dj6GyrcRnlvEpj9Ca7luDIcB8/qubr068roVufh+9y5bn
         p3hCEXBwkN7yryJ6RN8iMcdG0eY4+o8EJ929OcI7KSV8mYIaEZB/1EIv1gw3sqeXIW07
         sWHTiBuS0ZgSD2g/57Oi15YVBMMVjB7TvL2PzE8S7jI0roVXf71zbyrWaERpi/cRMTDP
         6M1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si5203025qta.328.2020.04.03.03.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 03:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKJQj-0003Wc-Sp
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 06:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQW-0003S6-VL
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQV-0001v5-PY
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:19:52 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50482 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQV-0001tp-Ei; Fri, 03 Apr 2020 06:19:51 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 761F4107A88BBB4C1FF1;
 Fri,  3 Apr 2020 18:19:49 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.24.31) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Apr 2020 18:19:41 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 v2 3/3] exec: Fix for qemu_ram_resize() callback
Date: Fri, 3 Apr 2020 11:18:27 +0100
Message-ID: <20200403101827.30664-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
References: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.24.31]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, dgilbert@redhat.com, xuwei5@hisilicon.com, linuxarm@huawei.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGjcNuCy07BM

From: David Hildenbrand <david@redhat.com>

Summarizing the issue:
1. Memory regions contain ram blocks with a different size,  if the
   size is  not properly aligned. While memory regions can have an
   unaligned size, ram blocks can't. This is true when creating
   resizable memory region with  an unaligned size.
2. When resizing a ram block/memory region, the size of the memory
   region  is set to the aligned size. The callback is called with
   the aligned size. The unaligned piece is lost.

Because of the above, if ACPI blob length modifications happens
after the initial virt_acpi_build() call, and the changed blob
length is within the PAGE size boundary, then the revised size
is not seen by the firmware on Guest reboot.

Hence make sure callback is called if memory region size is changed,
irrespective of aligned or not.

Signed-off-by: David Hildenbrand <david@redhat.com>
[Shameer: added commit log]
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
Please find previous discussion here,
https://patchwork.kernel.org/patch/11432375/#23216751
---
 exec.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index de9d949902..2874bb5088 100644
--- a/exec.c
+++ b/exec.c
@@ -2074,11 +2074,23 @@ static int memory_try_enable_merging(void *addr, size_t len)
  */
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
 {
+    const ram_addr_t unaligned_size = newsize;
+
     assert(block);
 
     newsize = HOST_PAGE_ALIGN(newsize);
 
     if (block->used_length == newsize) {
+        /*
+         * We don't have to resize the ram block (which only knows aligned
+         * sizes), however, we have to notify if the unaligned size changed.
+         */
+        if (unaligned_size != memory_region_size(block->mr)) {
+            memory_region_set_size(block->mr, unaligned_size);
+            if (block->resized) {
+                block->resized(block->idstr, unaligned_size, block->host);
+            }
+        }
         return 0;
     }
 
@@ -2102,9 +2114,9 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
     block->used_length = newsize;
     cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
                                         DIRTY_CLIENTS_ALL);
-    memory_region_set_size(block->mr, newsize);
+    memory_region_set_size(block->mr, unaligned_size);
     if (block->resized) {
-        block->resized(block->idstr, newsize, block->host);
+        block->resized(block->idstr, unaligned_size, block->host);
     }
     return 0;
 }
-- 
2.17.1


