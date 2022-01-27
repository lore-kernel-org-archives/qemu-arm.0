Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4168612lfk;
        Thu, 27 Jan 2022 07:21:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+mDcq8EkOGIXcwwKFpnvZpAHscCzcVrXZ3s02OMS/8sSw0mYMePlUDgK6t8zPGKSk/5N+
X-Received: by 2002:a05:6e02:164c:: with SMTP id v12mr2738331ilu.306.1643296913065;
        Thu, 27 Jan 2022 07:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643296913; cv=none;
        d=google.com; s=arc-20160816;
        b=AFvhy7/BxrFwRc0a6EmgDBZ4RXLuthFCU+ihMX6X9wzI6NYLUVF1+GycunqML/cjd/
         00hm+jIvaEWypvze5kCf6PstDQgDYTmulft1kBbsgiRHSozqcxtC4UIhKXfcbUVyP0F3
         3RG+cJ0AVUhjwMNOif9UyKG/yeLMESHcbJn0HDcg+q/6F/PGaPUkrbv4p3dVEEEYEu1Z
         4Y/qFSJFJzEEehXmPJMz/oegPE/DRP4sB4BHijlpiQAsqhK0rhIgXrOFNYfvY2btKmUW
         nXxMnwi6ZZ1JS5I5NPA2/MuJJLMmk1rnvd6xasdbr3fB84qzN4xJ2kMNzDDyHYHLr+iJ
         qpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1khIyfNNFWc9VNX4/2nGIMdiIvZ8naJgz6DXohUCbMM=;
        b=LRDhN/Bu4u5MPW1jolnEM8JHhntMS/mCNjmPYjW91juBHdvUsI/GmlGGcsYgQnnaD+
         pQhZxB+mbFtz4f3brjPly669llMGu1NXqEr/1q65hsIXXu8qW9k9rjzy/7KChLYbI9rI
         Gr7ywJ1b3O1hVWvplfrOWZKTM6jzdIw7OSttYAGP5uujesiP4SWvF9s9Gz/NUkKzXfna
         U6qGZ0YE3B/7lagOL2TFnQiPHhZWT6DxwO6rfvfsLTJpMCOewKt5VqmHoYw3/YqqH6G5
         /ZNnRTT7Hi7xmgOC3bzKucJ9yzjzpJI6JWmafKHzfDIo6S+Qwm5A3tILCFrSyLvju0rv
         +9BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mold2vSU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si1482639iox.18.2022.01.27.07.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mold2vSU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6au-0006gn-Dz
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Nv-0001AK-24
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:08:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Nt-0001rY-HE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1khIyfNNFWc9VNX4/2nGIMdiIvZ8naJgz6DXohUCbMM=;
 b=Mold2vSU/ue7jo8RPoET4yoGpp2zGG0EsP9v6d/P0xtYXM/Ppq53KIKaDKkJFmZ32Ry7TT
 0choAtLHvzzo6fOeEt6ivbPx8ZSV1RSBkZIgnY/H1P3b3xh5xHlwmGEZ73GD74BZLNRiNM
 NB0utNo9tlAZqAm4gmDmf7WQAJ2lITY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-Nfkie0gcPrmd_Erkuokx9g-1; Thu, 27 Jan 2022 10:08:23 -0500
X-MC-Unique: Nfkie0gcPrmd_Erkuokx9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA8651083;
 Thu, 27 Jan 2022 15:08:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F8E70D45;
 Thu, 27 Jan 2022 15:07:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/38] migration: Move ram_release_pages() call to
 save_zero_page_to_file()
Date: Thu, 27 Jan 2022 16:05:16 +0100
Message-Id: <20220127150548.20595-7-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdaiOIgJ8i4D

We always need to call it when we find a zero page, so put it in a
single place.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 422c6bce28..e9dcd3ca4e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1158,6 +1158,15 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
+static void ram_release_page(const char *rbname, uint64_t offset)
+{
+    if (!migrate_release_ram() || !migration_in_postcopy()) {
+        return;
+    }
+
+    ram_discard_range(rbname, offset, TARGET_PAGE_SIZE);
+}
+
 /**
  * save_zero_page_to_file: send the zero page to the file
  *
@@ -1179,6 +1188,7 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
         len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
+        ram_release_page(block->idstr, offset);
     }
     return len;
 }
@@ -1204,15 +1214,6 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     return -1;
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
-{
-    if (!migrate_release_ram() || !migration_in_postcopy()) {
-        return;
-    }
-
-    ram_discard_range(rbname, offset, TARGET_PAGE_SIZE);
-}
-
 /*
  * @pages: the number of pages written by the control path,
  *        < 0 - error
@@ -1344,7 +1345,6 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     int ret;
 
     if (save_zero_page_to_file(rs, f, block, offset)) {
-        ram_release_page(block->idstr, offset);
         return true;
     }
 
@@ -2148,7 +2148,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
         }
-        ram_release_page(block->idstr, offset);
         return res;
     }
 
-- 
2.34.1

