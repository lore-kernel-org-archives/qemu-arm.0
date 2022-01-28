Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp592572lfk;
        Fri, 28 Jan 2022 11:59:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE2BklNY0rgWxM5vbGFxBYOMq4LvGopvJ4jcW121m5HwOH+HnDobFvfmbx0YE5eT73eslM
X-Received: by 2002:a25:188a:: with SMTP id 132mr16399607yby.616.1643399959370;
        Fri, 28 Jan 2022 11:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643399959; cv=none;
        d=google.com; s=arc-20160816;
        b=qeOuHhFJtz0bE26qdxQub1XqubsaciM1eOMInGfQ7pVceGctJZeGkxHTYzOdny0Lar
         OwO3geWYI7qNTAMR5UktLot1cpC8x/sloDA7wTdcX/7SaA09m9/M3rNKwEsNMhh/sjac
         JtVo5xheYy0yHyBWLxJvVdkMra9Mp5lAuy+GuPGk1J3kGM/4tfHdtzDkfsxKF7FmGIr4
         22ookkWgwZAnHjWPXjzIBBXQUXIIjNKnfwcSkpGDpYgT/E/5HxJOTUUItVOXhfvsidZO
         khwmDkLW/sm1TMqrKooOxlEkdlixjlVAivixWZqjgBg+bYkIz3B2+XH6/j6nLJyOOQ1x
         iC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NS9i5KtB9MDi6NvLNSXtcUhnOuwhJtpHaixEEDN6Yyo=;
        b=oIeGho+jrUpXOgNqNnd7YCy1i1ZXOXsD/XgKAKM2F57y3yzWMyX9ZlE3jbpp8m8pnd
         mTVvgld/EMyMTRDQ0lnommk2VjFrbyRGeGjCegAMg5cnX51GbqIzcWy0UMR9grm/GR04
         OlQB179cPPEGg6sUQewXwe23HMvi2BxfeWRvKcyPkXfkwA7RtgEjS1RzykLLce2thJ+O
         8Wfi+0PonXT4qsyQ+1K5c0ACPnVJZlPJ+ioDdFui6FxhbWxh/f6eVh2aIhca9K1u+igg
         XEnKGyZk4+UfQWM5zlkXOtU1k4B36svNbB603TMMMKI6ZVZDIKLXuXNK7Ypc6k9M50OS
         Q4zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mr6bQv3K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o198si28662162yba.385.2022.01.28.11.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mr6bQv3K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDXOs-00066p-Ck
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWDQ-00027Y-Fb
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:43:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCw-0002aE-75
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NS9i5KtB9MDi6NvLNSXtcUhnOuwhJtpHaixEEDN6Yyo=;
 b=Mr6bQv3K0SkAs0+ajHUCczoavgWTOTJjI23SFjFsDopHiC6soFJd/kGgrQSrZu+vTND+hG
 GK2WWKbKjtuABxM9hH+xz61Fcb0LIsFPN37pm35D7gXpT8mJYNAMTdozbQmOMA8DdlDPmw
 CVgelXZTeuWVccRdq8aju/MMZ0DuqYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-VoiAfaznPzS3aNo2Y--2eg-1; Fri, 28 Jan 2022 13:42:46 -0500
X-MC-Unique: VoiAfaznPzS3aNo2Y--2eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1583A814245;
 Fri, 28 Jan 2022 18:42:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5676712E25;
 Fri, 28 Jan 2022 18:42:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] migration: Simplify unqueue_page()
Date: Fri, 28 Jan 2022 19:30:32 +0100
Message-Id: <20220128183033.31998-36-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URG_BIZ=0.573 autolearn=unavailable autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x/kbBrkSG+rM

From: Peter Xu <peterx@redhat.com>

This patch simplifies unqueue_page() on both sides of it (itself, and caller).

Firstly, due to the fact that right after unqueue_page() returned true, we'll
definitely send a huge page (see ram_save_huge_page() call - it will _never_
exit before finish sending that huge page), so unqueue_page() does not need to
jump in small page size if huge page is enabled on the ramblock.  IOW, it's
destined that only the 1st 4K page will be valid, when unqueue the 2nd+ time
we'll notice the whole huge page has already been sent anyway.  Switching to
operating on huge page reduces a lot of the loops of redundant unqueue_page().

Meanwhile, drop the dirty check.  It's not helpful to call test_bit() every
time to jump over clean pages, as ram_save_host_page() has already done so,
while in a faster way (see commit ba1b7c812c ("migration/ram: Optimize
ram_save_host_page()", 2021-05-13)).  So that's not necessary too.

Drop the two tracepoints along the way - based on above analysis it's very
possible that no one is really using it..

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c        | 37 +++++++++++--------------------------
 migration/trace-events |  3 +--
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index eb9db4f777..91ca743ac8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1547,6 +1547,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
 {
     struct RAMSrcPageRequest *entry;
     RAMBlock *block = NULL;
+    size_t page_size;
 
     if (!postcopy_has_request(rs)) {
         return NULL;
@@ -1563,10 +1564,13 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
     entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
     block = entry->rb;
     *offset = entry->offset;
+    page_size = qemu_ram_pagesize(block);
+    /* Each page request should only be multiple page size of the ramblock */
+    assert((entry->len % page_size) == 0);
 
-    if (entry->len > TARGET_PAGE_SIZE) {
-        entry->len -= TARGET_PAGE_SIZE;
-        entry->offset += TARGET_PAGE_SIZE;
+    if (entry->len > page_size) {
+        entry->len -= page_size;
+        entry->offset += page_size;
     } else {
         memory_region_unref(block->mr);
         QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
@@ -1574,6 +1578,9 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
         migration_consume_urgent_request();
     }
 
+    trace_unqueue_page(block->idstr, *offset,
+                       test_bit((*offset >> TARGET_PAGE_BITS), block->bmap));
+
     return block;
 }
 
@@ -1948,30 +1955,8 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock  *block;
     ram_addr_t offset;
-    bool dirty;
 
-    do {
-        block = unqueue_page(rs, &offset);
-        /*
-         * We're sending this page, and since it's postcopy nothing else
-         * will dirty it, and we must make sure it doesn't get sent again
-         * even if this queue request was received after the background
-         * search already sent it.
-         */
-        if (block) {
-            unsigned long page;
-
-            page = offset >> TARGET_PAGE_BITS;
-            dirty = test_bit(page, block->bmap);
-            if (!dirty) {
-                trace_get_queued_page_not_dirty(block->idstr, (uint64_t)offset,
-                                                page);
-            } else {
-                trace_get_queued_page(block->idstr, (uint64_t)offset, page);
-            }
-        }
-
-    } while (block && !dirty);
+    block = unqueue_page(rs, &offset);
 
     if (!block) {
         /*
diff --git a/migration/trace-events b/migration/trace-events
index 171a83a55d..48aa7b10ee 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -86,8 +86,6 @@ put_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
 qemu_file_fclose(void) ""
 
 # ram.c
-get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
-get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
 migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
@@ -113,6 +111,7 @@ ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRI
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
 ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
+unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %u"
-- 
2.34.1

