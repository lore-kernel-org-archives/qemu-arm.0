Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2743553qvm;
        Mon, 20 Jan 2020 02:58:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqw68P5n/LXSHpvgHmae/+CSrMRjjBN5KkmOpf/gnjsfMPs7OAXhb1F+48rRGg/tXcUZGNNN
X-Received: by 2002:a37:6704:: with SMTP id b4mr51447685qkc.32.1579517891652;
        Mon, 20 Jan 2020 02:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579517891; cv=none;
        d=google.com; s=arc-20160816;
        b=zKz/o+rO03PjNC1nk6ONTDX16bYrJXOa9QVIIfDgAUhYDvFjGr2lMkFrfFsC7gy6wQ
         XQO/Vb7ZQlLm3sA7Rum58Ztd53gaesis3po1Ax5cNHESK7mJYNgkwvT9bvc8mBUROeFY
         GLt/U9ert6I6l0zuAi+FOqWJLLtDRy9MkXvEt6TbVWWxYmlabGpu/ISY/RbhNctalaCL
         mHtieZmEcUl8qY1apXFeVEfN2Etxb8E18Uadwh8Tnbqmk+Ms/VdPvFfpuxa0rFgh+4Ex
         DGaLBMuAsqzB+syYTBgAkmV9Hq/cIJi8WrF7TgN/6dz14MW2WEXrQOSHpY6zBdpkfUcU
         zMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8bUpSs16sfRN2CEtPjACS0gftqpvp1N70X+Vg3Et2BU=;
        b=umIyVo4cSCP7HENevSywoK8UvjOHh/UMGRKnt4ZzbexnmISLlgpxQHdbrIHW7qqAUq
         +Q56RRg9H3Vs9jF0UwxqsKOYh8j6aUv4NviLM3O2+dHI2EvrBKT3CaRLNzdED6MRnARA
         5ini0KWI7eOPIJeGWQEWYmttp4UXcJ5epJTuRNJfKftnMXpWwjheHf04ZyhVPW0L8u6u
         RJAAnMhJDib1MkWQr3mVQOCvi7+xhK6NhjtrnSDyDF1tbW1CRZ7Hc7gmkehjopY+wTi2
         QpW6+Kjhi76shAAiQKoeiC8XR+yLapykDirtvivOqcfiVMMyskpFW0Ib1xicN2mZlGRb
         23Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="WrNrd8a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si19131925qtp.49.2020.01.20.02.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="WrNrd8a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUl0-0002VG-Hx
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUQl-0007ej-Ut
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUQk-00038I-K6
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:37:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39406
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUQk-000381-Fo
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bUpSs16sfRN2CEtPjACS0gftqpvp1N70X+Vg3Et2BU=;
 b=WrNrd8a/XMChJ1uWNwGLHEJcLlgI0znil1nPi8Br0GseT2KFKcZJ5Nm10xSeiceBZChq8i
 GAhtvxUpbJCcWnai/ZxXP8tJ+mwQhyYQwKWcEl2aLFeMW9pSsToZtN6Vq9mavJreXIBz4N
 0/lg8xSdq61rMVJ3hxJYTRmJjhL1ito=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-DlAqWDejOi2cdXXdTux-Wg-1; Mon, 20 Jan 2020 05:37:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71702107ACCC;
 Mon, 20 Jan 2020 10:37:10 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAD20860E9;
 Mon, 20 Jan 2020 10:37:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] Bug #1829242 correction.
Date: Mon, 20 Jan 2020 11:33:35 +0100
Message-Id: <20200120103340.25118-25-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: DlAqWDejOi2cdXXdTux-Wg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Alexey Romko <nevilad@yahoo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KZ4ZoTT+Q6u/

From: Alexey Romko <nevilad@yahoo.com>

Added type conversions to ram_addr_t before all left shifts of page
indexes to TARGET_PAGE_BITS, to correct overflows when the page
address was 4Gb and more.

Signed-off-by: Alexey Romko <nevilad@yahoo.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7221f54139..d0940387d1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1768,7 +1768,7 @@ static inline bool migration_bitmap_clear_dirty(RAMSt=
ate *rs,
     if (rb->clear_bmap && clear_bmap_test_and_clear(rb, page)) {
         uint8_t shift =3D rb->clear_bmap_shift;
         hwaddr size =3D 1ULL << (TARGET_PAGE_BITS + shift);
-        hwaddr start =3D (page << TARGET_PAGE_BITS) & (-size);
+        hwaddr start =3D (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size=
);
=20
         /*
          * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
@@ -2005,7 +2005,7 @@ static void ram_release_pages(const char *rbname, uin=
t64_t offset, int pages)
         return;
     }
=20
-    ram_discard_range(rbname, offset, pages << TARGET_PAGE_BITS);
+    ram_discard_range(rbname, offset, ((ram_addr_t)pages) << TARGET_PAGE_B=
ITS);
 }
=20
 /*
@@ -2093,7 +2093,7 @@ static int ram_save_page(RAMState *rs, PageSearchStat=
us *pss, bool last_stage)
     uint8_t *p;
     bool send_async =3D true;
     RAMBlock *block =3D pss->block;
-    ram_addr_t offset =3D pss->page << TARGET_PAGE_BITS;
+    ram_addr_t offset =3D ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
     ram_addr_t current_addr =3D block->offset + offset;
=20
     p =3D block->host + offset;
@@ -2280,7 +2280,8 @@ static bool find_dirty_block(RAMState *rs, PageSearch=
Status *pss, bool *again)
         *again =3D false;
         return false;
     }
-    if ((pss->page << TARGET_PAGE_BITS) >=3D pss->block->used_length) {
+    if ((((ram_addr_t)pss->page) << TARGET_PAGE_BITS)
+        >=3D pss->block->used_length) {
         /* Didn't find anything in this RAM Block */
         pss->page =3D 0;
         pss->block =3D QLIST_NEXT_RCU(pss->block, next);
@@ -2571,7 +2572,7 @@ static int ram_save_target_page(RAMState *rs, PageSea=
rchStatus *pss,
                                 bool last_stage)
 {
     RAMBlock *block =3D pss->block;
-    ram_addr_t offset =3D pss->page << TARGET_PAGE_BITS;
+    ram_addr_t offset =3D ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
     int res;
=20
     if (control_save_page(rs, block, offset, &res)) {
@@ -2657,7 +2658,8 @@ static int ram_save_host_page(RAMState *rs, PageSearc=
hStatus *pss,
         /* Allow rate limiting to happen in the middle of huge pages */
         migration_rate_limit();
     } while ((pss->page & (pagesize_bits - 1)) &&
-             offset_in_ramblock(pss->block, pss->page << TARGET_PAGE_BITS)=
);
+             offset_in_ramblock(pss->block,
+                                ((ram_addr_t)pss->page) << TARGET_PAGE_BIT=
S));
=20
     /* The offset we leave with is the last one we looked at */
     pss->page--;
@@ -2874,8 +2876,10 @@ void ram_postcopy_migrated_memory_release(MigrationS=
tate *ms)
=20
         while (run_start < range) {
             unsigned long run_end =3D find_next_bit(bitmap, range, run_sta=
rt + 1);
-            ram_discard_range(block->idstr, run_start << TARGET_PAGE_BITS,
-                              (run_end - run_start) << TARGET_PAGE_BITS);
+            ram_discard_range(block->idstr,
+                              ((ram_addr_t)run_start) << TARGET_PAGE_BITS,
+                              ((ram_addr_t)(run_end - run_start))
+                                << TARGET_PAGE_BITS);
             run_start =3D find_next_zero_bit(bitmap, range, run_end + 1);
         }
     }
@@ -4273,13 +4277,16 @@ static void colo_flush_ram_cache(void)
         while (block) {
             offset =3D migration_bitmap_find_dirty(ram_state, block, offse=
t);
=20
-            if (offset << TARGET_PAGE_BITS >=3D block->used_length) {
+            if (((ram_addr_t)offset) << TARGET_PAGE_BITS
+                >=3D block->used_length) {
                 offset =3D 0;
                 block =3D QLIST_NEXT_RCU(block, next);
             } else {
                 migration_bitmap_clear_dirty(ram_state, block, offset);
-                dst_host =3D block->host + (offset << TARGET_PAGE_BITS);
-                src_host =3D block->colo_cache + (offset << TARGET_PAGE_BI=
TS);
+                dst_host =3D block->host
+                         + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
+                src_host =3D block->colo_cache
+                         + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
                 memcpy(dst_host, src_host, TARGET_PAGE_SIZE);
             }
         }
--=20
2.24.1

