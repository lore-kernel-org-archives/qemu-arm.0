Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3704906lfi;
        Thu, 5 Mar 2020 19:43:38 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsbqBp2H6kg3h4jJVq2GPObvbdyN7n6SyK0EpHqDAdBxxpu37vyOo8KQoPMr+4/ZuzOJRCn
X-Received: by 2002:a05:620a:16cb:: with SMTP id a11mr1097561qkn.281.1583466218201;
        Thu, 05 Mar 2020 19:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583466218; cv=none;
        d=google.com; s=arc-20160816;
        b=Cascerz4pJ8+dV3m697nmCjJOxNmkX0jAdU52+em0Kimuk7PtIh3qRZ4blYaVRG87T
         npj/PooTkv+IUrC4bdVmx6+DvaccqcT9JI8Zpw3z1uqLfcY8eY5d4ctAiog5NJWBTT2b
         BqUp9gwCsap2vKCksl0NxIXLedr/bQ8FSim5mCRZFWhFES3+OPb8E7kAFWwcoNpgV7qY
         eI4EApHKsOthO0qillZiS+Ei2ZMPZrRL9dTKp057eppe72fB0Nb8TKWbmMh5+Cf1oIHB
         fii7Q5yDjPc/ZnsrZQDP9HdaOia/rpIF6TbPJ1iw8+pW9Whq2kFk48XIefwsKw7P5iOR
         VRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=+F04Pv06pMtyMpOQsY7R3qRBgWE44QdoK01Krqd1hLk=;
        b=b4/sJgRg/2V2T8BirqAwVw2GbXGcpzMV3Nt63amZEP45BzOUqV4PsKsug4X5Qs79Ap
         47s6Br0ftDS7Z65HcwxRG/MaU+aM2vITQ0KwQHF2Qi7dznru5tRvcC9gX+OHzkmaQF5G
         0vDaeTkGkcfAbHs1AtZ1Ye9w0nBNoPUrsVZBSC/CQfzhb/2DhLhWteEBQY7ht/94B/Ny
         tyYrSo5vMmc6MNR91iiQjptm/yKAKV6mbW0wrMnSmLwh/akuPs+XI3fYFSbiDScQeVdY
         EHI/kYVLNDsfhvgk/NaDWI5GnxWTSNje0P+lh3LQmuWIDZVAeGtqQ0/6xtzJ2YPPhtgU
         AXRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u62si5740qtd.25.2020.03.05.19.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 19:43:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jA3th-0001vZ-LZ
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 22:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jA3ta-0001vE-Ok
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 22:43:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jA3tZ-0005Wy-FU
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 22:43:30 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:46942 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jA3tZ-0005C6-4K; Thu, 05 Mar 2020 22:43:29 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 11F153F6A4A8244704DB;
 Fri,  6 Mar 2020 11:43:20 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Mar 2020 11:43:13 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] migration: not require length align when choose fast dirty
 sync path
Date: Fri, 6 Mar 2020 11:41:09 +0800
Message-ID: <20200306034109.19992-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ujl+SIGRKfn

In aa777e297c840, ramblock length is required to align word pages
when we choose the fast dirty sync path. The reason is that "If the
Ramblock is less than 64 pages in length that long can contain bits
representing two different RAMBlocks, but the code will update the
bmap belinging to the 1st RAMBlock only while having updated the total
dirty page count for both."

This is right before 801110ab22be1ef2, which align ram_addr_t allocation
on long boundaries. So currently we wont "updated the total dirty page
count for both".

Remove the alignment constraint of length and we can always use fast
dirty sync path.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/exec/ram_addr.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 5e59a3d8d7..40fd89e1cd 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -445,15 +445,13 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMB=
lock *rb,
                                                ram_addr_t length,
                                                uint64_t *real_dirty_page=
s)
 {
-    ram_addr_t addr;
-    unsigned long word =3D BIT_WORD((start + rb->offset) >> TARGET_PAGE_=
BITS);
+    ram_addr_t start_global =3D start + rb->offset;
+    unsigned long word =3D BIT_WORD(start_global >> TARGET_PAGE_BITS);
     uint64_t num_dirty =3D 0;
     unsigned long *dest =3D rb->bmap;
=20
-    /* start address and length is aligned at the start of a word? */
-    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) =3D=3D
-         (start + rb->offset) &&
-        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
+    /* start address is aligned at the start of a word? */
+    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) =3D=3D start_global=
) {
         int k;
         int nr =3D BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
         unsigned long * const *src;
@@ -495,11 +493,10 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMB=
lock *rb,
             memory_region_clear_dirty_bitmap(rb->mr, start, length);
         }
     } else {
-        ram_addr_t offset =3D rb->offset;
-
+        ram_addr_t addr;
         for (addr =3D 0; addr < length; addr +=3D TARGET_PAGE_SIZE) {
             if (cpu_physical_memory_test_and_clear_dirty(
-                        start + addr + offset,
+                        start_global + addr,
                         TARGET_PAGE_SIZE,
                         DIRTY_MEMORY_MIGRATION)) {
                 *real_dirty_pages +=3D 1;
--=20
2.19.1

