Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4198662lfk;
        Thu, 27 Jan 2022 08:08:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbDrMYZ0DzbhfiCmfAWgruw44Eh/tfx9UbAkD6NXigL3lrrmhAzqdOotS5hcr3GMJ1bwWt
X-Received: by 2002:a05:622a:248:: with SMTP id c8mr1912048qtx.602.1643299724779;
        Thu, 27 Jan 2022 08:08:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643299724; cv=none;
        d=google.com; s=arc-20160816;
        b=fpXAK2tUBylnoGBpJ1CWzIAQp+QQA97hwjVDTD3lduJTLSoCgVB5aiLRlvAUadR+36
         iKiYAqOuSW0a6peSEgAwJvXX484g6oTu11oGBugYozmqq0rkbe3cIIFiAFrQGKQIVkMc
         7lP/yoThh5zdFKMNgDqOPhRb65/vEsyDhMxmHnHi1kBvjxu4YY22bkSmf3iHBDLwHFEQ
         clbVnVILHA68pl1iSDiu8dm0NcaWB9yu1kC5HdMgruVK5taSlbj5He1sJ9NyouduNjdA
         dl89dgDj1aLV9mJqQHNkOzrJHHq/rzl/A4eJZPbvjKHCEupG14sRxtF3LZDNmx6BJc40
         QfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gDPLBE5SDiRcc3Ih58+8tD1mzhZBQRy31q4QaMFYHQg=;
        b=IaJ55IbOU96zGka/g6k8E5y+X0Z8aY78GbA3+xnHO+mX4rJKfrlEx4UM62mKsLHh+R
         ++2kUDeo8eVyKAeZRCoamJV/fe2naClmpiY1yIRoO1ljzAEdvvjDIswfnNbb5e1Wyep+
         2fzI33V9xOyRc3xVOyKEmcddfTcj1fIVdVGxpy0Ef9AmOL3EhTzyXeRJ1nhjg6ydaf8O
         8wTrSDEa7uAlUOyu8UVs9iOZmQHvsDBRFAB23hkUFEtBecvqxNFffp5b7GweJh++oVnK
         YUDKTz3OMPtzI3bRqqnoEQLaFi0SZKdZeM3B1JIyc/HKGn2CpuX3iVHFJhqyw0AEeqZp
         VaxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AM08qljj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n29si1538947vsl.160.2022.01.27.08.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:08:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AM08qljj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7KF-0001CK-Q2
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6VS-0007iL-Rs
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6VC-0003FM-BU
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDPLBE5SDiRcc3Ih58+8tD1mzhZBQRy31q4QaMFYHQg=;
 b=AM08qljjXTo47xSXVUFMCK8Bq7QkeYwq/hyc1aEO73BHTlTXxCaTIrJfY+ryreFF+LaXQk
 XXmszAWVnivFnfqG2fEZt0cslrvY09xUaD10bo2ORB54m8dmzhFbcKJIFqQE7nWz/eizni
 whcgokl7jxuZLqnDE/yteO4/O3H2EWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-JukUMCaiMZqZNLi0pDnUiA-1; Thu, 27 Jan 2022 10:15:54 -0500
X-MC-Unique: JukUMCaiMZqZNLi0pDnUiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DFAC101F7A3;
 Thu, 27 Jan 2022 15:15:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D3E370D4C;
 Thu, 27 Jan 2022 15:15:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/38] migration: Drop dead code of ram_debug_dump_bitmap()
Date: Thu, 27 Jan 2022 16:05:36 +0100
Message-Id: <20220127150548.20595-27-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
X-TUID: dGqgrZgJEKvd

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

