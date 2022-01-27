Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4157758lfk;
        Thu, 27 Jan 2022 07:06:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw32L7VEg63x7HjKp+GlVWFNzI+2l8XGVRd8YXsUEEMLBvAfdWJK1etHMwbC79NDRowFTfQ
X-Received: by 2002:a05:6e02:184e:: with SMTP id b14mr2718049ilv.40.1643295994057;
        Thu, 27 Jan 2022 07:06:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643295994; cv=none;
        d=google.com; s=arc-20160816;
        b=FLO4ZrxgCZynz2i+bUXJiCBZ4wwg+aIySKsA9sO2gQRHeV9ygS8QC25K0h9sbJhMJv
         P02ymIr1qGRIlcZ2u+BDpMRWXLZAt+/PIeIWg4s5LknCZKIgZKqItGrAGsGWWeYUct1Y
         kgyLW38H3OcftVEcCRBbcEkeocaNaC1TQ6OaHi/6f1iUXXLA1i9S6W3mkH+lP0J4mo/w
         g0ACb0qPC+WdJiEEdySFi/5pLyV2R4jb8vZH+cxLpV210+rM787jqjiXQKVaDjK49qDq
         yaPo+hX2q/Zvu00Ro2T14fB9ZUdhuwO0S9998hcfAIyU5Xz0NAaHSf9o4/JIlTpENR49
         8laA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CQbBtcOQQqTGlmVLcvaCYCTmSqbpaVikGchlkLKdfGo=;
        b=Mnx7tHc2EkKEUFXSJQjufjQo+oFC+kdnPkCXjTmWk4UGx22hBt9uedvD9cqgzGLVe+
         2gN9TqfMp/rhwgcBVGBdfCxS4GaN1OAj4Q0PXUBR1ginzi6i8kw2PjIIJuoNO8TlDT0f
         r+0uOa/fnZRLLFJe1pppjnPiH+ELYyI0KNwcGPL4V230LS6wMiWUvUDA7xx2vTnbJuLJ
         QwBRU3nj0kojDeXe3Bv0JJ26cw+adSGo00rZaM0cdql72/ZG+PpfXPnCZusdR8R85vaT
         3Dc4TND8c/TQYC83oWJYSLcn4L0KvmUWaWZIgRhfEJmisaSoHB6P+3bXNP61o/iWlrbG
         Dgkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CXYfNWrS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si2211380jat.94.2022.01.27.07.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:06:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CXYfNWrS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6M5-0007gB-CE
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Lw-0007a3-Tj
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:06:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Lt-0001aZ-4h
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643295980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQbBtcOQQqTGlmVLcvaCYCTmSqbpaVikGchlkLKdfGo=;
 b=CXYfNWrS6Yn6QfcHVWEe2vAYpCwlX3vnaPtBIBjYJPM7ywxNizIuCwoghVTkwU2DtVhf7L
 YLDyisDUVFMP5lvqwH8ho+KTk9AeMLnWmtE4d5rRGAljQs4a2HORuPFrcu/AFpGm5VjuIB
 14+k9nU1ovLSIoLtAxfR/FZ1CoNyiHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-5auU4XxrNVmq-RYcKB4ZXw-1; Thu, 27 Jan 2022 10:06:16 -0500
X-MC-Unique: 5auU4XxrNVmq-RYcKB4ZXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8028143E5;
 Thu, 27 Jan 2022 15:06:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D37370D2D;
 Thu, 27 Jan 2022 15:06:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/38] migration: We only need last_stage in two places
Date: Thu, 27 Jan 2022 16:05:12 +0100
Message-Id: <20220127150548.20595-3-quintela@redhat.com>
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
X-TUID: Zb4OLVjHfJrX

We only need last_stage in two places and we are passing it all
around.  Just add a field to RAMState that passes it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

Repeat subject (philmd suggestion)
---
 migration/ram.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..7223b0d8ca 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -325,7 +325,8 @@ struct RAMState {
     uint64_t xbzrle_bytes_prev;
     /* Start using XBZRLE (e.g., after the first round). */
     bool xbzrle_enabled;
-
+    /* Are we on the last stage of migration */
+    bool last_stage;
     /* compression statistics since the beginning of the period */
     /* amount of count that no free thread to compress data */
     uint64_t compress_thread_busy_prev;
@@ -683,11 +684,10 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  * @current_addr: addr of the page
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
- * @last_stage: if we are at the completion stage
  */
 static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
                             ram_addr_t current_addr, RAMBlock *block,
-                            ram_addr_t offset, bool last_stage)
+                            ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
@@ -695,7 +695,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     if (!cache_is_cached(XBZRLE.cache, current_addr,
                          ram_counters.dirty_sync_count)) {
         xbzrle_counters.cache_miss++;
-        if (!last_stage) {
+        if (!rs->last_stage) {
             if (cache_insert(XBZRLE.cache, current_addr, *current_data,
                              ram_counters.dirty_sync_count) == -1) {
                 return -1;
@@ -734,7 +734,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
      * Update the cache contents, so that it corresponds to the data
      * sent, in all cases except where we skip the page.
      */
-    if (!last_stage && encoded_len != 0) {
+    if (!rs->last_stage && encoded_len != 0) {
         memcpy(prev_cached_page, XBZRLE.current_buf, TARGET_PAGE_SIZE);
         /*
          * In the case where we couldn't compress, ensure that the caller
@@ -1290,9 +1290,8 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
  * @rs: current RAM state
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
- * @last_stage: if we are at the completion stage
  */
-static int ram_save_page(RAMState *rs, PageSearchStatus *pss, bool last_stage)
+static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 {
     int pages = -1;
     uint8_t *p;
@@ -1307,8 +1306,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss, bool last_stage)
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
         pages = save_xbzrle_page(rs, &p, current_addr, block,
-                                 offset, last_stage);
-        if (!last_stage) {
+                                 offset);
+        if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
              * might get updated before it gets to the wire
              */
@@ -2129,10 +2128,8 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
  *
  * @rs: current RAM state
  * @pss: data about the page we want to send
- * @last_stage: if we are at the completion stage
  */
-static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
-                                bool last_stage)
+static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock *block = pss->block;
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
@@ -2171,7 +2168,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
         return ram_save_multifd_page(rs, block, offset);
     }
 
-    return ram_save_page(rs, pss, last_stage);
+    return ram_save_page(rs, pss);
 }
 
 /**
@@ -2190,10 +2187,8 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
  * @rs: current RAM state
  * @ms: current migration state
  * @pss: data about the page we want to send
- * @last_stage: if we are at the completion stage
  */
-static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
-                              bool last_stage)
+static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
     int tmppages, pages = 0;
     size_t pagesize_bits =
@@ -2211,7 +2206,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     do {
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss, last_stage);
+            tmppages = ram_save_target_page(rs, pss);
             if (tmppages < 0) {
                 return tmppages;
             }
@@ -2245,13 +2240,11 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
  * or negative on error
  *
  * @rs: current RAM state
- * @last_stage: if we are at the completion stage
  *
  * On systems where host-page-size > target-page-size it will send all the
  * pages in a host page that are dirty.
  */
-
-static int ram_find_and_save_block(RAMState *rs, bool last_stage)
+static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus pss;
     int pages = 0;
@@ -2280,7 +2273,7 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         }
 
         if (found) {
-            pages = ram_save_host_page(rs, &pss, last_stage);
+            pages = ram_save_host_page(rs, &pss);
         }
     } while (!pages && again);
 
@@ -3080,7 +3073,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
                 break;
             }
 
-            pages = ram_find_and_save_block(rs, false);
+            pages = ram_find_and_save_block(rs);
             /* no more pages to sent */
             if (pages == 0) {
                 done = 1;
@@ -3160,6 +3153,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     RAMState *rs = *temp;
     int ret = 0;
 
+    rs->last_stage = !migration_in_colo_state();
+
     WITH_RCU_READ_LOCK_GUARD() {
         if (!migration_in_postcopy()) {
             migration_bitmap_sync_precopy(rs);
@@ -3173,7 +3168,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         while (true) {
             int pages;
 
-            pages = ram_find_and_save_block(rs, !migration_in_colo_state());
+            pages = ram_find_and_save_block(rs);
             /* no more blocks to sent */
             if (pages == 0) {
                 break;
-- 
2.34.1

