Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp579129lfk;
        Fri, 28 Jan 2022 11:32:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzekxCI3k/SbniLdxtWMDBLIJU4ZrZzYDFnmDV9bvSlvdRZCnb3WOKx4ARojcsAbKjEnkna
X-Received: by 2002:a05:6e02:15c4:: with SMTP id q4mr7313369ilu.15.1643398327830;
        Fri, 28 Jan 2022 11:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643398327; cv=none;
        d=google.com; s=arc-20160816;
        b=PAGE6e/wWoiEHfENINL3BpFEOejJWZznHlUaNMCL6kpndmN5Uib+eo2UR/Huodzgep
         K0TLcggnLKCgjx+/BQ1X/y63PzZnZfqMj5o9gerJDf/XWYejaf0DX9jVyF0KFCylDOhV
         PGj7axRF9hDOQUsn8B2HARgYKsvP+xyDLz5rlSpmvWvzgQhHp0LKFq/rKPUY112Mu1F5
         HB2YdkSnl0pn3XKRVy5iaF2hvTJyjjZooe/ppnwOYd74n5+MRMWQLKxxfWxI0DkwAlyt
         8ZMBzHdO4741rYNKF6EHEwMSk3ZaWqPe/XoNkQfEywhMy5YlIhQODArfh5okDT+plxK3
         DsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TS6gx8Hyh/qhvZFYSgScu0p5q+84OON1lKmnMJrgHoY=;
        b=L8LhDoEpmu7+t7TFxzMfagWpkPl9IYBmUBRvPjjo8sLtAOnRAJPuqXmAN9ZxPaz+Nt
         X24403DVNbZSsF1z8xVflzb7g1/Q6V0PBuCN5l10Af0N6AMESg4rpgduej5C/BvMRDGS
         cxyz0c3HMeWtdX3qY2BumxxRNJjvjyr55F6NkvFUn1ibjzU6r+qbgMCgkKS8PLWFTQv5
         eCLrCdlvOu1WtSFYpQyZxriqUPRl10keVCP5WIL5Oyt5vSlGS9VZLRoSNrSxlJQz4JoI
         XySnogoxQmUmAV8EJ3toJcl8/9yzLzfkEsuDDV/7G1kv6WkY5NG1G6vnfsDx3ZbMgsD/
         +p6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VP9ehslX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si6876701ioq.75.2022.01.28.11.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VP9ehslX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWyd-000885-2z
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:32:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWDG-00024C-Pm
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:43:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCr-0002Xo-9R
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TS6gx8Hyh/qhvZFYSgScu0p5q+84OON1lKmnMJrgHoY=;
 b=VP9ehslX/FFbzOdtZmJD8bGGBVf9D5NeNYaLM2kf07G42oRF7j/EInSrrvH8R3pfvZ1Ap8
 82z54hdahXLyYmHcrJHI1ggwsRWiqmi6tMqpatyvZDOXh3smCZ1sp7uY9yI/GXPqDa0sZB
 iuwKX84Wt7u76Cr0xNuepoEMLqOrnY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-b_xV7t4SPpiKLMID18CrkQ-1; Fri, 28 Jan 2022 13:42:38 -0500
X-MC-Unique: b_xV7t4SPpiKLMID18CrkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E98EF46864;
 Fri, 28 Jan 2022 18:42:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30FC012E25;
 Fri, 28 Jan 2022 18:42:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/36] migration: Add postcopy_has_request()
Date: Fri, 28 Jan 2022 19:30:31 +0100
Message-Id: <20220128183033.31998-35-quintela@redhat.com>
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
X-TUID: nqQFydQ9rFKI

From: Peter Xu <peterx@redhat.com>

Add a helper to detect whether postcopy has pending request.

Since at it, cleanup the code a bit, e.g. in unqueue_page() we shouldn't need
to check it again on queue empty because we're the only one (besides cleanup
code, which should never run during this process) that will take a request off
the list, so the request list can only grow but not shrink under the hood.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 58adcaf430..eb9db4f777 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -355,6 +355,12 @@ static RAMState *ram_state;
 
 static NotifierWithReturnList precopy_notifier_list;
 
+/* Whether postcopy has queued requests? */
+static bool postcopy_has_request(RAMState *rs)
+{
+    return !QSIMPLEQ_EMPTY_ATOMIC(&rs->src_page_requests);
+}
+
 void precopy_infrastructure_init(void)
 {
     notifier_with_return_list_init(&precopy_notifier_list);
@@ -1539,28 +1545,33 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
  */
 static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
 {
+    struct RAMSrcPageRequest *entry;
     RAMBlock *block = NULL;
 
-    if (QSIMPLEQ_EMPTY_ATOMIC(&rs->src_page_requests)) {
+    if (!postcopy_has_request(rs)) {
         return NULL;
     }
 
     QEMU_LOCK_GUARD(&rs->src_page_req_mutex);
-    if (!QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
-        struct RAMSrcPageRequest *entry =
-                                QSIMPLEQ_FIRST(&rs->src_page_requests);
-        block = entry->rb;
-        *offset = entry->offset;
 
-        if (entry->len > TARGET_PAGE_SIZE) {
-            entry->len -= TARGET_PAGE_SIZE;
-            entry->offset += TARGET_PAGE_SIZE;
-        } else {
-            memory_region_unref(block->mr);
-            QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
-            g_free(entry);
-            migration_consume_urgent_request();
-        }
+    /*
+     * This should _never_ change even after we take the lock, because no one
+     * should be taking anything off the request list other than us.
+     */
+    assert(postcopy_has_request(rs));
+
+    entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
+    block = entry->rb;
+    *offset = entry->offset;
+
+    if (entry->len > TARGET_PAGE_SIZE) {
+        entry->len -= TARGET_PAGE_SIZE;
+        entry->offset += TARGET_PAGE_SIZE;
+    } else {
+        memory_region_unref(block->mr);
+        QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
+        g_free(entry);
+        migration_consume_urgent_request();
     }
 
     return block;
@@ -2992,7 +3003,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         t0 = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
         i = 0;
         while ((ret = qemu_file_rate_limit(f)) == 0 ||
-                !QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
+               postcopy_has_request(rs)) {
             int pages;
 
             if (qemu_file_get_error(f)) {
-- 
2.34.1

