Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1033286qvl;
        Fri, 28 Jan 2022 11:16:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz16CKZKroS/adBKC3OB8tB0aw/rEltLc0GGUH/a5ghfG1WyFtrGWVe63futh0pTaL5oIpC
X-Received: by 2002:a25:d0c8:: with SMTP id h191mr2270316ybg.316.1643397417701;
        Fri, 28 Jan 2022 11:16:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643397417; cv=none;
        d=google.com; s=arc-20160816;
        b=FKGNjVcxxQvyn7jhM6Ec+p9KjXANiI4JcsNUrLZAvDx2BZDc3hKa8Q4fIkubqJZolm
         rty+sq2DRH7MvBTVO0MJZJpiZxTh2mz1bCLyjMQVZkXog+Nb2K5A+mQCIZp6SMzJ0MNk
         Aw84nTpSdIcEyYzwwO/vrLSwtOX6fW9yHDdKGUitqbnEOtt2nSRX0+aR8CknLn3uSxHK
         ZHF+iEm6H15GhIddfu8kOUsFXayZsCN5Am6iWH8Mi3MQpm+Qv6MEIshhe/7vLCN5xmDf
         cQ2NrAhaKWXWL2jFqZqJ1cAUzrgrlmL7E0bnYf8/X7QtusgPtBvMw+0P6OeGUVDms3uL
         Z3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gDPLBE5SDiRcc3Ih58+8tD1mzhZBQRy31q4QaMFYHQg=;
        b=WXsYUmv7TvHZYakyH3IZgl2Woq9aRuFdukANsdivxqv906XG83dy5qgAO8F/BSroLE
         sojpNp961YfvPMqAwKx7QL084vCHyOsiS2q7KHVnFpABTaS4lqu2uUHa7TWPOMiukGbw
         QDbpQnSXQMdr7EyhWyt85b8CxE4/RPoICG0U459OpQoY93ierB8+jJ6l2TxNh+FaNHgW
         yGIDJ+cz+ZEEPmojZKIS8T/RjbV9DX5CV/xxLue0yYJB82J05SC1b93knHgXKJWWsqD7
         8My9Karj6IpCUdgTbGlniJek03/LqecjAzlR1j6zj4woDlUXQlitRYKiZPxAXsbJA/58
         8MKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RWAFVgee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si25142612ybm.408.2022.01.28.11.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:16:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RWAFVgee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWjx-0006pS-5K
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW94-00018e-19
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW8v-0001qA-7V
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDPLBE5SDiRcc3Ih58+8tD1mzhZBQRy31q4QaMFYHQg=;
 b=RWAFVgeeKvHFx83dw/FdcNqzjsGh9KZI/mbdaKde/Hhd2YI/z+4Bn+7kC2ba7sRhCaOH5p
 ELXuqlUQuDqlSr/AtKTKsL+3woeC1AMT7vR7/VVQRuVDVZFoVRADT0GZAybOU1KhNgqTjE
 Gg42XTIiyvPIXqQUiKly0NwvmLDC5LU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-ZYW1a5KnPmuJEtzU4zNf2A-1; Fri, 28 Jan 2022 13:38:25 -0500
X-MC-Unique: ZYW1a5KnPmuJEtzU4zNf2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C6281091DAA;
 Fri, 28 Jan 2022 18:38:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3112377462;
 Fri, 28 Jan 2022 18:38:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/36] migration: Drop dead code of ram_debug_dump_bitmap()
Date: Fri, 28 Jan 2022 19:30:21 +0100
Message-Id: <20220128183033.31998-25-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
X-TUID: S8l+5NKCSscK

From: Peter Xu <peterx@redhat.com>

I planned to add "#ifdef DEBUG_POSTCOPY" around the function too because
otherwise it'll be compiled into qemu binary even if it'll never be used.  Then
I found that maybe it's easier to just drop it for good..

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h |  2 --
 migration/ram.c | 39 ---------------------------------------
 2 files changed, 41 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index c515396a9a..f543e25765 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -55,8 +55,6 @@ void mig_throttle_counter_reset(void);
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
 void acct_update_position(QEMUFile *f, size_t size, bool zero);
-void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
-                           unsigned long pages);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
 int ram_postcopy_send_discard_bitmap(MigrationState *ms);
diff --git a/migration/ram.c b/migration/ram.c
index b4477b8ee0..9a06ea6dd4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2394,40 +2394,6 @@ static void ram_state_reset(RAMState *rs)
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
 
-/*
- * 'expected' is the value you expect the bitmap mostly to be full
- * of; it won't bother printing lines that are all this value.
- * If 'todump' is null the migration bitmap is dumped.
- */
-void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
-                           unsigned long pages)
-{
-    int64_t cur;
-    int64_t linelen = 128;
-    char linebuf[129];
-
-    for (cur = 0; cur < pages; cur += linelen) {
-        int64_t curb;
-        bool found = false;
-        /*
-         * Last line; catch the case where the line length
-         * is longer than remaining ram
-         */
-        if (cur + linelen > pages) {
-            linelen = pages - cur;
-        }
-        for (curb = 0; curb < linelen; curb++) {
-            bool thisbit = test_bit(cur + curb, todump);
-            linebuf[curb] = thisbit ? '1' : '.';
-            found = found || (thisbit != expected);
-        }
-        if (found) {
-            linebuf[curb] = '\0';
-            fprintf(stderr,  "0x%08" PRIx64 " : %s\n", cur, linebuf);
-        }
-    }
-}
-
 /* **** functions for postcopy ***** */
 
 void ram_postcopy_migrated_memory_release(MigrationState *ms)
@@ -2655,11 +2621,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
         if (ret) {
             return ret;
         }
-
-#ifdef DEBUG_POSTCOPY
-        ram_debug_dump_bitmap(block->bmap, true,
-                              block->used_length >> TARGET_PAGE_BITS);
-#endif
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.34.1

