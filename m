Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5409252lff;
        Tue, 14 Jan 2020 03:58:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqycLo6tnU1d1u0h6OuHU7y8Fhu1S0i/59SE9x3InYnxi9uKU7TeQ+1h3oeVLTxHesQr4bKr
X-Received: by 2002:a50:c352:: with SMTP id q18mr23285653edb.158.1579003085779;
        Tue, 14 Jan 2020 03:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579003085; cv=none;
        d=google.com; s=arc-20160816;
        b=rOU6Usz5JDkfsLWu1EfXT9ZMfkU7gwV6XUDiG3an/XHGGpX9PiGmpz8/kkwCrN5lQS
         HeDOmukhKjGA8LX/eOYZYtagNZ/iUjT3vV+pubtVT4HQZoQKsHPmPYT2VnkemwP0dd2g
         GMXngsX3WmEA9mIkY5GHdy0AxvSyWK92Rfp+/sKZWXUwHsyAVo48iIhmv0ggorx2IavE
         Jn5/uxCfKHY9BaB/6UdsyqpwNrK8WwkDH54rGr6ma1yHI3Ezjsbt9vGSd7ev2xD0yPi8
         HMEycZME2d4u5Eyl5v2gmGUPiRA4s5eufXpjB3Rc2ha8I+FBO/XNInBLbk7yR7irhOU0
         azrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Yr1WVaAouDj40R39IdfVYwIhtLx/Le0jqD+NYulh5As=;
        b=Wq5sjhgfjScJwIwQ0wTRCx4xYEkoVf4apuU3rRK/BZlphvPGPp9Lb364fJ0edz5Rua
         lRizJK9GaQlzH/FyuUz6g8jwgTDnpyQEph8agYR22fD3o3t7JBFW017bCOnfFhN+h7Jf
         JCFeC+GX/sIC6WwA2f5MIB4gYiDU2czeZh1+v/FyO0PgH24a080slbBV9yHgKQSr23DO
         sSDD2CNHLKAy0Zgy2oJdtJtRN4JJ69PRVrO8ia+T8+PypmQF86nEYQd9w7+hSIMlhbZn
         Db+IiF+zojNK9fCpagIiihTzdtQshLr+GGwTRml0zIh3pjTWuBWoKfBpWrrGlTbZVFew
         xHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a9ggM3+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si9092152ejz.241.2020.01.14.03.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:58:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a9ggM3+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKpf-0002JU-RQ
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKaH-0007T7-Cf
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKaD-0003bT-Ks
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:42:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56553
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKaD-0003bC-Hi
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yr1WVaAouDj40R39IdfVYwIhtLx/Le0jqD+NYulh5As=;
 b=a9ggM3+usCSaVNdTRf/LX9oK2LB2LJtg4XcSurexQimOQcxOO1OQYdG760pEelPHkR1dbw
 e9PUgD7+4AWMrKepkwptly4pUuatohQTrn+QKzwnVOj7FHYn9XEpQVD1+NKDArB1nBHhHa
 D7ne8lHMOwC5l41mHq7yUnFwoOElUnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-5y4jJZAaM5uK8KsK5iYFzw-1; Tue, 14 Jan 2020 06:42:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2EC1801E7B;
 Tue, 14 Jan 2020 11:42:01 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 826995DA70;
 Tue, 14 Jan 2020 11:41:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] migration/postcopy: enable compress during postcopy
Date: Tue, 14 Jan 2020 12:39:16 +0100
Message-Id: <20200114113926.3556-21-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 5y4jJZAaM5uK8KsK5iYFzw-1
X-Mimecast-Spam-Score: 0
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wyLm4Zi+CFp0

From: Wei Yang <richardw.yang@linux.intel.com>

postcopy requires to place a whole host page, while migration thread
migrate memory in target page size. This makes postcopy need to collect
all target pages in one host page before placing via userfaultfd.

To enable compress during postcopy, there are two problems to solve:

    1. Random order for target page arrival
    2. Target pages in one host page arrives without interrupt by target
       page from other host page

The first one is handled by previous cleanup patch.

This patch handles the second one by:

    1. Flush compress thread for each host page
    2. Wait for decompress thread for before placing host page

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 11 -----------
 migration/ram.c       | 28 +++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e55edee606..990bff00c0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1005,17 +1005,6 @@ static bool migrate_caps_check(bool *cap_list,
 #endif
=20
     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
-        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
-            /* The decompression threads asynchronously write into RAM
-             * rather than use the atomic copies needed to avoid
-             * userfaulting.  It should be possible to fix the decompressi=
on
-             * threads for compatibility in future.
-             */
-            error_setg(errp, "Postcopy is not currently compatible "
-                       "with compression");
-            return false;
-        }
-
         /* This check is reasonably expensive, so only when it's being
          * set the first time, also it's only the destination that needs
          * special support.
diff --git a/migration/ram.c b/migration/ram.c
index a7414170e5..5f20c3d15d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3469,6 +3469,14 @@ static int ram_save_iterate(QEMUFile *f, void *opaqu=
e)
=20
             rs->target_page_count +=3D pages;
=20
+            /*
+             * During postcopy, it is necessary to make sure one whole hos=
t
+             * page is sent in one chunk.
+             */
+            if (migrate_postcopy_ram()) {
+                flush_compressed_data(rs);
+            }
+
             /*
              * we want to check in the 1st loop, just in case it was the 1=
st
              * time and we had to sync the dirty bitmap.
@@ -4061,6 +4069,7 @@ static int ram_load_postcopy(QEMUFile *f)
         void *place_source =3D NULL;
         RAMBlock *block =3D NULL;
         uint8_t ch;
+        int len;
=20
         addr =3D qemu_get_be64(f);
=20
@@ -4078,7 +4087,8 @@ static int ram_load_postcopy(QEMUFile *f)
=20
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         place_needed =3D false;
-        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE)) {
+        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
+                     RAM_SAVE_FLAG_COMPRESS_PAGE)) {
             block =3D ram_block_from_stream(f, flags);
=20
             host =3D host_from_ram_block_offset(block, addr);
@@ -4161,6 +4171,17 @@ static int ram_load_postcopy(QEMUFile *f)
                                          TARGET_PAGE_SIZE);
             }
             break;
+        case RAM_SAVE_FLAG_COMPRESS_PAGE:
+            all_zero =3D false;
+            len =3D qemu_get_be32(f);
+            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+                error_report("Invalid compressed data length: %d", len);
+                ret =3D -EINVAL;
+                break;
+            }
+            decompress_data_with_multi_threads(f, page_buffer, len);
+            break;
+
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             multifd_recv_sync_main();
@@ -4172,6 +4193,11 @@ static int ram_load_postcopy(QEMUFile *f)
             break;
         }
=20
+        /* Got the whole host page, wait for decompress before placing. */
+        if (place_needed) {
+            ret |=3D wait_for_decompress_done();
+        }
+
         /* Detect for any possible file errors */
         if (!ret && qemu_file_get_error(f)) {
             ret =3D qemu_file_get_error(f);
--=20
2.24.1

