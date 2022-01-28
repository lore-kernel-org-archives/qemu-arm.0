Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp560566lfk;
        Fri, 28 Jan 2022 10:57:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmEXOPHUZKHmUByypOjWT9zWfH0KbC/WkU3ghsREF7422Y7Gx9OIu2f1KdP0E7FTyyBnCC
X-Received: by 2002:a25:1904:: with SMTP id 4mr14833352ybz.463.1643396229032;
        Fri, 28 Jan 2022 10:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643396229; cv=none;
        d=google.com; s=arc-20160816;
        b=dP/rHNMYvqje6Ffd/JlsSLU48cyY3ni902eC4uqav2b8m9z2sug9I4P8TutQYUOF2/
         uo9S3haNpGhwA5lgcM9hbrKgg5amm7/vHsPjX1uITR/qm9yKev9GEoeC0TAR8oN/bE3v
         U+NJ5F1zsoGdpAEnIJyWTyz025e6RGD/9Lfgyu7g0fiW78OitI7ME/yd9koXjbKPm08e
         i9U5jzvpdxZWxdlCy2jalAGy/2XuqchllYasOm5AuCNGY0pglOyG6yBfskUEWG2i9Ur9
         HHtkd1iGpFgIL5ChB9M1Oe+Dbyo12+foV2hN9yqOFLfLvCunHRahRnf8YlTs/c+NAV/I
         r0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=syFXxyGdhAjBvrZKloq+h67n4Bh70w3cQDix8C8UCRo=;
        b=w7fF1RsjT8u0NlEAgjiP5XbWov48vyTCjNmTtngsJhUmVH4cF8ISGzdI6wzNTWDmeW
         LsM5FaZuMO8RF1pgkQoIPm9nLwYprxLx4PcaTWbwcv9kA8xXO3Hqm2DcLz6vzGtTX4Jv
         SUudm/1sRh1TE+t6WC/4mlB9FgizM1c6dgvs/Wp0JkSmF13QrqQd8SL3FmOofDwLaoRT
         1yAZGON3nbl47VuYzgX7L07RaBZek+ClcK9cz7iQSOmaSfiTkkw4mghvIc6ehBczR3tz
         sVJPgzwQzeBSU8F6ULj+jSV63uXWoJMcVH7nKLPQtP0MSwk/9B/1uyRk0uY6ZVubjeLE
         /41g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QcHlmfZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v185si27374593yba.825.2022.01.28.10.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 10:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QcHlmfZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWQl-0000Gg-TB
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 13:57:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW50-00061G-Nt
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW4u-0000zr-8l
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syFXxyGdhAjBvrZKloq+h67n4Bh70w3cQDix8C8UCRo=;
 b=QcHlmfZJQtkyI2VsVtI0RAo1WTrBgFPbYIP27V2Wbgka3zbFRQ9HXtgfy/ELeR2DV9wQzn
 RL6j6n0tn1zyn0LFXZeNnrujb6eboAXjn0NSE5JkjQPPmZPsbkYuzid8cUut5Bj5lspkSB
 sewLhuODJEDv9t9dLvVMEm1QLhfvwV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-GfER6vquOru4fY8i6hW3bw-1; Fri, 28 Jan 2022 13:34:27 -0500
X-MC-Unique: GfER6vquOru4fY8i6hW3bw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEFD08145E3;
 Fri, 28 Jan 2022 18:34:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D36577456;
 Fri, 28 Jan 2022 18:33:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/36] migration: ram_release_pages() always receive 1 page as
 argument
Date: Fri, 28 Jan 2022 19:30:00 +0100
Message-Id: <20220128183033.31998-4-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gozvsF0yxWOy

Remove the pages argument. And s/pages/page/

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

- Use 1LL instead of casts (philmd)
- Change the whole 1ULL for TARGET_PAGE_SIZE
---
 migration/ram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7223b0d8ca..881fe4974e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1204,13 +1204,13 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     return -1;
 }
 
-static void ram_release_pages(const char *rbname, uint64_t offset, int pages)
+static void ram_release_page(const char *rbname, uint64_t offset)
 {
     if (!migrate_release_ram() || !migration_in_postcopy()) {
         return;
     }
 
-    ram_discard_range(rbname, offset, ((ram_addr_t)pages) << TARGET_PAGE_BITS);
+    ram_discard_range(rbname, offset, TARGET_PAGE_SIZE);
 }
 
 /*
@@ -1365,7 +1365,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     }
 
 exit:
-    ram_release_pages(block->idstr, offset & TARGET_PAGE_MASK, 1);
+    ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);
     return zero_page;
 }
 
@@ -2153,7 +2153,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
         }
-        ram_release_pages(block->idstr, offset, res);
+        ram_release_page(block->idstr, offset);
         return res;
     }
 
-- 
2.34.1

