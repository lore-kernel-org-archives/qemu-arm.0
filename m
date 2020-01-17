Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10113588lff;
        Fri, 17 Jan 2020 09:47:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyn1hvzjdGHzCOZrDt8XG9YcL3Y8PJ2hzcVizL/MYrA9E0vZnD9tmGT+yb1fOk2miF0pX+4
X-Received: by 2002:a37:7d01:: with SMTP id y1mr14066632qkc.452.1579283241125;
        Fri, 17 Jan 2020 09:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579283241; cv=none;
        d=google.com; s=arc-20160816;
        b=zxBEmsryDvjhFtYlizRJOajxDoYEqrOYpnCDKDZmJv4iHngLqJUUPRw+s/EaDJjFq7
         BkvHM8DyiXjzKi33NKMd4BD4IE2aK7yIlGmAl7z7z9GeSaVG2JysD/8F5dlgl1uHRX7W
         Kj0K/zE7XmP/dS5B+RYI3GN9r6z8YkMaD2i7lUWYHbyyq6h6TrY9x2B4MZhXAEdbNLjc
         fL900Gfz8i+0iyA6ez/UH6pch2sZ0Q9Ve272e2ONXrb5aa7InKOdLCCd/YR3Dt+vD0wW
         X1NQSdLYAym5ob4uxJ8gnRHe0+N5SFDASOzB4FdNcmDK0YDFEo450lEPgxsgardtariw
         Yugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=EQ7xi/mOPeeUkvyPjHA7kR8Etv9LpWQhMN4lcbbRMLk=;
        b=ax/0hy5i5afxtxwPtipyIcm+ASfAxDF6OKm9fQyOfDhV+IISeyP82e6mo3+TTfXpmr
         vQZfGScBFnQtpw2/qdqVuq59Jl6XEeDSOr9ZqxYIdoXJ2aN4QW8OVPcsiz/kRsvMmNV7
         TpYp8dradtwCm15euvOldYN+GGVtaJsJA+Hz5aDhliFf5E9IUHgGVoC7ps8xRvgikRjZ
         /0I92d38Dy1XMyhLf33zMu4VDD6dpAzi3m8lM5RbEhbhzPFXRUG0szSVtxQqkisj8vPp
         qQ8xAs8BWG1O3giPe31dWr+cb2rLpvlmKRaXSnIhyFwkbJJw+coDDAlkd8+tGX3LViwW
         60fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si14912025qkg.211.2020.01.17.09.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isViK-0002Gb-3B
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVi0-0002G7-UR
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:47:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVhx-0007cb-9m
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:47:00 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58598 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVhw-0007YX-U9; Fri, 17 Jan 2020 12:46:57 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9949E37FDB5A6132F07A;
 Sat, 18 Jan 2020 01:46:51 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sat, 18 Jan 2020 01:46:41 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Date: Fri, 17 Jan 2020 17:45:16 +0000
Message-ID: <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XaLKGIHU5bmN

If ACPI blob length modifications happens after the initial
virt_acpi_build() call, and the changed blob length is within
the PAGE size boundary, then the revised size is not seen by
the firmware on Guest reboot. The is because in the
virt_acpi_build_update() -> acpi_ram_update() -> qemu_ram_resize()
path, qemu_ram_resize() uses used_length (ram_block size which is
aligned to PAGE size) and the "resize callback" to update the size
seen by firmware is not getting invoked.

Hence make sure callback is called if the new size is different
from original requested size.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
Please find the previous discussions on this issue here,
https://patchwork.kernel.org/patch/11174947/

But this one attempts a different solution to fix it by introducing
req_length var to RAMBlock struct. 

---
 exec.c                  | 36 +++++++++++++++++++++++-------------
 include/exec/ram_addr.h |  5 +++--
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/exec.c b/exec.c
index d4b769d0d4..9ce33992f8 100644
--- a/exec.c
+++ b/exec.c
@@ -2123,16 +2123,18 @@ static int memory_try_enable_merging(void *addr, size_t len)
  * resize callback to update device state and/or add assertions to detect
  * misuse, if necessary.
  */
-int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
+int qemu_ram_resize(RAMBlock *block, ram_addr_t size, Error **errp)
 {
-    assert(block);
+    ram_addr_t newsize;
 
-    newsize = HOST_PAGE_ALIGN(newsize);
+    assert(block);
 
-    if (block->used_length == newsize) {
+    if (block->req_length == size) {
         return 0;
     }
 
+    newsize = HOST_PAGE_ALIGN(size);
+
     if (!(block->flags & RAM_RESIZEABLE)) {
         error_setg_errno(errp, EINVAL,
                          "Length mismatch: %s: 0x" RAM_ADDR_FMT
@@ -2149,13 +2151,19 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
         return -EINVAL;
     }
 
-    cpu_physical_memory_clear_dirty_range(block->offset, block->used_length);
-    block->used_length = newsize;
-    cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
-                                        DIRTY_CLIENTS_ALL);
-    memory_region_set_size(block->mr, newsize);
+    block->req_length = size;
+
+    if (newsize != block->used_length) {
+        cpu_physical_memory_clear_dirty_range(block->offset,
+                                              block->used_length);
+        block->used_length = newsize;
+        cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
+                                            DIRTY_CLIENTS_ALL);
+        memory_region_set_size(block->mr, newsize);
+    }
+
     if (block->resized) {
-        block->resized(block->idstr, newsize, block->host);
+        block->resized(block->idstr, block->req_length, block->host);
     }
     return 0;
 }
@@ -2412,16 +2420,18 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
                                   MemoryRegion *mr, Error **errp)
 {
     RAMBlock *new_block;
+    ram_addr_t newsize;
     Error *local_err = NULL;
 
-    size = HOST_PAGE_ALIGN(size);
+    newsize = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
     new_block = g_malloc0(sizeof(*new_block));
     new_block->mr = mr;
     new_block->resized = resized;
-    new_block->used_length = size;
+    new_block->req_length = size;
+    new_block->used_length = newsize;
     new_block->max_length = max_size;
-    assert(max_size >= size);
+    assert(max_size >= newsize);
     new_block->fd = -1;
     new_block->page_size = qemu_real_host_page_size;
     new_block->host = host;
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 5adebb0bc7..fd13082224 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -31,8 +31,9 @@ struct RAMBlock {
     uint8_t *host;
     uint8_t *colo_cache; /* For colo, VM's ram cache */
     ram_addr_t offset;
-    ram_addr_t used_length;
-    ram_addr_t max_length;
+    ram_addr_t req_length; /* Original requested size, used if RAM_RESIZEABLE */
+    ram_addr_t used_length; /* aligned to qemu_host_page_size */
+    ram_addr_t max_length; /*  aligned to qemu_host_page_size */
     void (*resized)(const char*, uint64_t length, void *host);
     uint32_t flags;
     /* Protected by iothread lock.  */
-- 
2.17.1


