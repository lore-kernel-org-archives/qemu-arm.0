Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4184285lfk;
        Thu, 27 Jan 2022 07:46:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY5UaSg8C6dQRAT18I63s0t7lD9lGxj7sa65oDSfyI1Klao5aQaLgj1PHcMSnSj3Q6V0Uh
X-Received: by 2002:a37:9c01:: with SMTP id f1mr3033913qke.740.1643298382506;
        Thu, 27 Jan 2022 07:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643298382; cv=none;
        d=google.com; s=arc-20160816;
        b=fIMG9woZknlAewM+GoJPklplUI8HQzS2wms55/1D5WT6wQOhJkGtOe3BrRmdBshn3g
         rsrDa8TS8gPjnT01AvrCmQii3vy+rkoBTalMBROozfOxlBBcQ6Po7J4+fpHwlijcyY3d
         1ZrDOMfqasAMQphR9i+bzbU5Y5Y1HhTIlW75bdHV/tqTJtRAdnWZzhSLJcDSRjjbKJb6
         swXnYLf4njTGmP5Z+fhnfHg5I+XBORc6PzvfBR6w4uHUwlcjmRL7YqCCYCZMt3WSvZgz
         MbpUWnvNv3Q8LbKcUoUrf49y4wEvDAIqs6vUxKYIvZS1KSJ4dXB840aK7HaJFK8g2hTi
         U77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZEDHjNn5660tKa3OsoWZdLmqD8eE6Y5+2rpz+s3JKVA=;
        b=b+awEENA5PvMBQVuvpq7YeK0ycjb3D5VRzECb/wU40xVViLUrq4ambkT8s9Lvn145W
         QxThZbREm+TlajVpzcSTVlU1GjnTJQsRPlI3me+MrCZPCg/ip33hddb0Q8hpgAKlcOx3
         YPs01dG5LMXPrPBmGJckmOjcrGVlGIMKjftRpRA6qXYx3GqK2TJFKf7+ds0KzubqYNtD
         m5wF+veZ+M66NWB6lH4q06/BUYkHdLCfc3EwzbAL9T9k+u8D06gFaTi1yMwaFmQIeOCe
         FrizM3kqVQe3q424ORgzPGh53lp6ku/EA+EX/ePqs7xnq8VBVqwtW7IgMaWfEdzhbmGf
         zzVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bzQvD0mH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w81si21868076ybe.797.2022.01.27.07.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:46:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bzQvD0mH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6yb-0004ND-Rx
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Vd-0007ke-S5
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6VT-0003HI-O6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEDHjNn5660tKa3OsoWZdLmqD8eE6Y5+2rpz+s3JKVA=;
 b=bzQvD0mHwu4eBoJgQBDKU6FJM6Su9UA8tbrBt0hcooZXCDiNjHnD3rq3KGd7ZRsnp5HZsD
 3cKvVp1nk6IiRxJCDQHvzD8LzuAJ5RGZqZyA3Elkos5ODUcvbUVhG66YMXlWtJCwJ5Wk4h
 RAdOHXVEQgb16ZfwBdJPCIjXDUmc4WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-BiM2ccHVNXWtFdLhcw7FKg-1; Thu, 27 Jan 2022 10:16:09 -0500
X-MC-Unique: BiM2ccHVNXWtFdLhcw7FKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DBC2814250;
 Thu, 27 Jan 2022 15:16:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16C9270D2D;
 Thu, 27 Jan 2022 15:15:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/38] migration: Drop postcopy_chunk_hostpages()
Date: Thu, 27 Jan 2022 16:05:38 +0100
Message-Id: <20220127150548.20595-29-quintela@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7I/ustbf8TZP

From: Peter Xu <peterx@redhat.com>

This function calls three functions:

  - postcopy_discard_send_init(ms, block->idstr);
  - postcopy_chunk_hostpages_pass(ms, block);
  - postcopy_discard_send_finish(ms);

However only the 2nd function call is meaningful.  It's major role is to make
sure dirty bits are applied in host-page-size granule, so there will be no
partial dirty bits set for a whole host page if huge pages are used.

The 1st/3rd call are for latter when we want to send the disgard ranges.
They're mostly no-op here besides some tracepoints (which are misleading!).

Drop them, then we can directly drop postcopy_chunk_hostpages() as a whole
because we can call postcopy_chunk_hostpages_pass() directly.

There're still some nice comments above postcopy_chunk_hostpages() that explain
what it does.  Copy it over to the caller's site.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c60cf5ad83..91d32002e8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2557,30 +2557,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
     }
 }
 
-/**
- * postcopy_chunk_hostpages: discard any partially sent host page
- *
- * Utility for the outgoing postcopy code.
- *
- * Discard any partially sent host-page size chunks, mark any partially
- * dirty host-page size chunks as all dirty.  In this case the host-page
- * is the host-page for the particular RAMBlock, i.e. it might be a huge page
- *
- * @ms: current migration state
- * @block: block we want to work with
- */
-static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
-{
-    postcopy_discard_send_init(ms, block->idstr);
-
-    /*
-     * Ensure that all partially dirty host pages are made fully dirty.
-     */
-    postcopy_chunk_hostpages_pass(ms, block);
-
-    postcopy_discard_send_finish(ms);
-}
-
 /**
  * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
  *
@@ -2612,8 +2588,13 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_page = 0;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /* Deal with TPS != HPS and huge pages */
-        postcopy_chunk_hostpages(ms, block);
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.34.1

