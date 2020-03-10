Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp500109lfc;
        Tue, 10 Mar 2020 02:19:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuMNeZLsYuQl2PnD3s5Tzcb4IGrOHxJXsm771L/5u7OuCSuyxMCa1xZrlFflL0MljFRMdyW
X-Received: by 2002:a0c:fa03:: with SMTP id q3mr1477302qvn.228.1583831985687;
        Tue, 10 Mar 2020 02:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583831985; cv=none;
        d=google.com; s=arc-20160816;
        b=ERdVfQcSIa/GRd0fI8A0CjgY0XlFpAHSC5c+BAw6rst+fkwj5P2T70ZWaCElPOmsEr
         oWr6rA0jET5GUGbDGojcrt0KKh6H4cmk5YlvRw+XFWyUQvHgtiAVhOhKqneuAzFAoohv
         76jNJNvuU5mZhe/9P1Q3ffesnmm6x6HhBtXalfHJxrFisv9/Em7S2toj8toL/ye2TsGl
         zmTsiOiF941w6la2rZ582QhOhqruLPvj67GlJy7bk90ZzeivJyPkqytTKJHLpiXXigBO
         C66z4fZla9LTV1RRD0cqd9dlh8pGis2djeQlooaO0XMmVmWNSUMXM1+IsMmgkwNZN2fx
         hawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=FK+haxzUA06DO7rGgwpajrWZiXXMklajLbEYs4yThOM=;
        b=fR4ZswTI5IB2q6yGnP/6g5NyVh/R4B8YAO5qVtzQV+4WWcZnXyTP4qaXdYIUnXMOfw
         1pjxCXTQbUSZFZfSOw2sE/u0Rxd4seqN4plqKMp4/nu0nNtRfhKcO0tzzyYO0fQSWzpL
         cYnxnD/j4KrHhvoJteMjsbevWQk36e+rXf5/zQjwumHrQxvs1XbwP1eTVQVLVjyLwjsD
         aUBTtP7v0/gZfQ6T0ul9VajYskWdVgWy5px/LuMzUwVW2fmUfcSx453MW7WAkOY2Di5h
         ZU84biPDMKg4TeGRf4e4doyxb75cFqcIa2ZhUKI/wVytRtOVbT4suWrH2T5wHhuKPzo5
         YcZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z67si7358721qka.219.2020.03.10.02.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 02:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBb3B-00029E-6V
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 05:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jBb2r-0001lH-7X
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 05:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jBb2q-0005xH-3V
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 05:19:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3269 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jBb2p-0005ih-N1; Tue, 10 Mar 2020 05:19:24 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3DD00CAF2E97E0FBE086;
 Tue, 10 Mar 2020 17:19:19 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Mar 2020 17:19:09 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/2] memory: Introduce start_global variable in dirty
 bitmap sync
Date: Tue, 10 Mar 2020 17:17:03 +0800
Message-ID: <20200310091704.42340-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200310091704.42340-1-zhukeqian1@huawei.com>
References: <20200310091704.42340-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsocD3lQz86f

In the cpu_physical_memory_sync_dirty_bitmap func, use start_global
variable to make code more clear. And the addr variable is only used
in slow path, so move it to slow path.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 include/exec/ram_addr.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 5e59a3d8d7..8311efb7bc 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -445,14 +445,13 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMB=
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
     /* start address and length is aligned at the start of a word? */
-    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) =3D=3D
-         (start + rb->offset) &&
+    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) =3D=3D start_global=
 &&
         !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
         int k;
         int nr =3D BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
@@ -495,11 +494,11 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMB=
lock *rb,
             memory_region_clear_dirty_bitmap(rb->mr, start, length);
         }
     } else {
-        ram_addr_t offset =3D rb->offset;
+        ram_addr_t addr;
=20
         for (addr =3D 0; addr < length; addr +=3D TARGET_PAGE_SIZE) {
             if (cpu_physical_memory_test_and_clear_dirty(
-                        start + addr + offset,
+                        start_global + addr,
                         TARGET_PAGE_SIZE,
                         DIRTY_MEMORY_MIGRATION)) {
                 *real_dirty_pages +=3D 1;
--=20
2.19.1

