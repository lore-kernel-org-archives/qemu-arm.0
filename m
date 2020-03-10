Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp500044lfc;
        Tue, 10 Mar 2020 02:19:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsKuIqWVtGTrJF9IJox6YP2TSgUyYXTxNAkYhH32CXLUznyITvrYn5jUM1s2Y6CXaSRZxLl
X-Received: by 2002:ac8:4c89:: with SMTP id j9mr3343566qtv.68.1583831980413;
        Tue, 10 Mar 2020 02:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583831980; cv=none;
        d=google.com; s=arc-20160816;
        b=g0aDEIkD8gg5phFy316LYA/+uJVWLC1riRlcBLfnZ86QRkZBYbk4Nt/dBH87NDYiKT
         JGXN2fOFFT7SvV2zMbavs1ShJ+xoMPOMrGvvnoyTWfuIo9rwjqT1Ve4Lbi/5hhQLBb/P
         CXX6XCU4t8Wh7ufgj4BBsAqBzlzPRh7pSc0yq3gZPcRAqAx1a5UprsN1WzTVp3jU/r1Q
         lvyhhSGuJkXZOoGZeJcDA15QsdW0lnXEiuq4oySu5uX5N5KklE/rSNgt/LKEZiSZn8TM
         VSR+eqEW5/qrICMn2Xf/i4uqn/y9WWchDEXFItRmmC0v1g8pM6Z+O+c0oUsP+n1aitdw
         p7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1KVjrOiJBzpYu6wFG7eRLdZ5gjtvAMB3xaIKi6oWDFM=;
        b=LjazZVmZIqqNdIPiLOfYX7IBlZwfrSt+w8Bp7Lo5KL6suISvrCpGOSOmLeZsEpV+2r
         EItlTDG6dzEsUENUJvadwE4NzGnnT8TyQrlKzGqmVPldCKLVf5Up0qOf9IGcAe04DeP+
         Tpxk3ZAnl3zRB/Tga+ElqGkNeB7g8qPgiA8logHvU0FMw6qX045TLve/G+m3SNLrqvqs
         EFaGWIGa97KLyX9ASrdMt0MZ3SdKT1laGay/XOWh0VhUCeeqXmw88x7f1QMfxnghuTZw
         cyukqMMTC8LVCncpWVapbCnctTGBD+J2lp+ISF2ur31denKFAso+7vlC6sm3fwsX1ORy
         gTYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a124si7653856qkg.135.2020.03.10.02.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 02:19:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBb35-0001w0-P7
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 05:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jBb2r-0001lG-7d
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 05:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jBb2q-0005xJ-3I
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 05:19:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3270 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jBb2p-0005io-N7; Tue, 10 Mar 2020 05:19:24 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 42AA56A27B560642CA2B;
 Tue, 10 Mar 2020 17:19:19 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Mar 2020 17:19:11 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] migration: not require length align when choose fast
 dirty sync path
Date: Tue, 10 Mar 2020 17:17:04 +0800
Message-ID: <20200310091704.42340-3-zhukeqian1@huawei.com>
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
X-TUID: fytbnXeLi2+V

In commit aa777e297c84 ("cpu_physical_memory_sync_dirty_bitmap: Another
alignment fix"), ramblock length is required to align word pages when
we choose the fast dirty sync path. The reason is that "If the Ramblock
is less than 64 pages in length that long can contain bits representing
two different RAMBlocks, but the code will update the bmap belinging to
the 1st RAMBlock only while having updated the total dirty page count
for both."

This is right before commit 801110ab22be ("find_ram_offset: Align
ram_addr_t allocation on long boundaries"), which align ram_addr_t
allocation on long boundaries. So currently we wont "updated the total
dirty page count for both".

By removing the alignment constraint of length in fast path, we can alway=
s
use fast dirty sync path if start_global is aligned to word page.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 include/exec/ram_addr.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 8311efb7bc..57b3edf376 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -450,9 +450,8 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlo=
ck *rb,
     uint64_t num_dirty =3D 0;
     unsigned long *dest =3D rb->bmap;
=20
-    /* start address and length is aligned at the start of a word? */
-    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) =3D=3D start_global=
 &&
-        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
+    /* start address is aligned at the start of a word? */
+    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) =3D=3D start_global=
) {
         int k;
         int nr =3D BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
         unsigned long * const *src;
--=20
2.19.1

