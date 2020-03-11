Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1025739lfc;
        Wed, 11 Mar 2020 10:23:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtD0y4mgf/M/Rmkyt6AJ5N5OzgcBjH3loY7Z4wLV21OiKgXdYc0nK6lK/Lg+RK9qlZgtRQk
X-Received: by 2002:ac8:6957:: with SMTP id n23mr3655627qtr.79.1583947438516;
        Wed, 11 Mar 2020 10:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947438; cv=none;
        d=google.com; s=arc-20160816;
        b=hPNxlNYDriwhfVocesqLeJfEvTbDuoSz4hkyJRvX2VGTwQqNsrH/7rUiIwpaHIh6UJ
         hV/pQFVjIziPNunuWm/GpruzRMzgFhZyq7w8RY8SvHf/B0ig1yPRCvwID8Ai437kHUBY
         Glc+HnHh+MvS01KF2OoQG6zeSvtxt00YdXcOtPwNbyDwDH87xM2Kpy+mhI5MJRQ+pu82
         tY/F1dVm2ZsMq82Jdp4dNX9daH7PC4m845uvCiS2p2DkwyWxb+YTiOY/g86ttw593RrX
         nubTIfxyj5v2R+31+2IwNx/zh0MdeUDF/g1c5hQ227NMHar5CGAxJbrm0/YjubT1bxRw
         dVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=9c4IQBvzRkufAwdC9dSxucGO0wye5J6f1toNwDioFWU=;
        b=cHePMjmTVgkfvVQjyE+E48YoaGIp5OXZ2sc5iWlbmEgX7unezejKMBo9/4ZOyawEp+
         ZZnBevCjN5qLzlSpWuiCLTi7Qdw/vh1SNL1h/3b3rtzwtbJb6M9ZgqC5lZNc68CsGtT1
         dXYk4wglcPYgYsYyGrECwcebr4OBAdn1Bt2vA4BS8sAW2nzJ/Du1EsJ81XbeadgtN+sj
         VC5X5ehZzglSB0JisSK/okYDswnp8Q3iSbyljHuVzRb/PYVQRbGawaSl/MeXh6mrHUFF
         gFgL0Cd/spWhVhFDDcaM+Cv7PYlO09pMwN5Twi5AjlsjaFpSqalN7sw9ja0iLyKNGoMd
         zfyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si1142854qvo.119.2020.03.11.10.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56205 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC55J-0002H3-SS
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC552-0001r4-5a
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC550-0003d0-Pl
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3277 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC550-0003Zv-CB; Wed, 11 Mar 2020 13:23:38 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B1DB18F36637FA53CF75;
 Thu, 12 Mar 2020 01:23:34 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:24 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 03/10] exec: Fix for qemu_ram_resize() callback
Date: Wed, 11 Mar 2020 17:20:07 +0000
Message-ID: <20200311172014.33052-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3VeacLhX0A9A

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
---
Please find the discussion here,
https://patchwork.kernel.org/patch/11339591/
---
 exec.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 0cc500d53a..f8974cd303 100644
--- a/exec.c
+++ b/exec.c
@@ -2073,11 +2073,21 @@ static int memory_try_enable_merging(void *addr, size_t len)
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
+        if (block->resized && unaligned_size != memory_region_size(block->mr)) {
+            block->resized(block->idstr, unaligned_size, block->host);
+            memory_region_set_size(block->mr, unaligned_size);
+        }
         return 0;
     }
 
@@ -2101,9 +2111,9 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
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


