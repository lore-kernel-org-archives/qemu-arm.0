Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4165309lfk;
        Thu, 27 Jan 2022 07:16:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD+ndL5ftkj0N3c6a/MeohI60H7TqDHEDou1GaGCErDPNrKPXTwp0VCz6OfgUx/2s4U30j
X-Received: by 2002:a05:620a:854:: with SMTP id u20mr2926140qku.716.1643296618222;
        Thu, 27 Jan 2022 07:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643296618; cv=none;
        d=google.com; s=arc-20160816;
        b=KACBX69tQwuAaFwEUsymCC9JbuAdn7unUu96yfDeV5YQvEtr6GPjlsulsB1ppS8hxQ
         gWUGSeABvmA/DuRAnO+kf3g4LcC9k5hkDDhLyjuoVJ8IjvhwdOUZCkpTx1gSrJ3eNCHr
         r2nqk+f9/kcVQd/5miOxzUBOfVDHM7BjmqHiIISx0C6HFgBagX9pjUQ11KAjL4hfYPj5
         irDbXYinFs/bEdP853O6OJpPlkX7aFgfP1PgOCS+M3IyY88vOy+5x3BNjJxgLF/Is/aV
         CglBCH53apex1IEJ5Bxx36PzPPTKcWrtMIva/NELR2RZmKBjAqdXNdAA9mnLHhTqbK3l
         U7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=syFXxyGdhAjBvrZKloq+h67n4Bh70w3cQDix8C8UCRo=;
        b=i4dH0NFF1bfdH8f5Ovpy8iYalba2NL2UAwSjHfaFa2nPaMw7c/7b0QyFvQFl7UPR6A
         aITSo0217Hv042lrJ/ZHdWvQN5PXwwmU4J12GCLTKCTizR93G8Wx3FXTEQ6XfO/SvdWV
         dAkyixW1mntmi9U+6j+8TPspibv1i1RMxIpGtLzSzVRWXHhf87qPCJiUDA0Ek22RwRPG
         zAz3DdmMimJRvIM6WH+rPwybFcHhoXOdPDA9k0qtITJCyjJmdnLf3u9GBMpXGCn4JNF+
         t3XJBafDE22PxoHyOdKzww9PBieHyD+ztCk2YMRQvSZqYWx9hoSbmNkvM7b7HXPL9S9W
         D23w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J180sJb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj12si1101879qvb.15.2022.01.27.07.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J180sJb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6W9-0008JA-J0
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6M2-0007oF-Tp
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:06:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6M1-0001fZ-6e
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643295988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syFXxyGdhAjBvrZKloq+h67n4Bh70w3cQDix8C8UCRo=;
 b=J180sJb7G+xNJZWlsC6xabdoPtajuYCujBdr0tXv06+nv+55V8EkCBFajxVYtu0qitEx7L
 4Aj2HpwzOzwgW2sfZJsR43uJYEKJiE2gXo+l5+arddz/3nGnqQJ5HskNERChq7kRpr6T5D
 SO+Eejs/7V2v+ePRF6cnUVNqOlYHTg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-1pyCSQHsOaezAYE25G5whg-1; Thu, 27 Jan 2022 10:06:25 -0500
X-MC-Unique: 1pyCSQHsOaezAYE25G5whg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A2E446860;
 Thu, 27 Jan 2022 15:06:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 575C970D2D;
 Thu, 27 Jan 2022 15:06:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/38] migration: ram_release_pages() always receive 1 page as
 argument
Date: Thu, 27 Jan 2022 16:05:13 +0100
Message-Id: <20220127150548.20595-4-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HOmfeAKhZPTc

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

