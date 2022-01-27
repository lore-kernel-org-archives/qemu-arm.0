Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4208917lfk;
        Thu, 27 Jan 2022 08:23:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxZbN6fzJDQOqm5doK7eJy67eiUFe3DVnS2zbSocyt+FVFXTyXh9OEAYYsSdh0Kz2EEQE2
X-Received: by 2002:a05:6214:2306:: with SMTP id gc6mr3912525qvb.113.1643300608705;
        Thu, 27 Jan 2022 08:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643300608; cv=none;
        d=google.com; s=arc-20160816;
        b=mKWzr4olZkwl+2UgS7c772LKxBLlXlV2fGFxb+mfHdi8anx/cHlPR2HUcMmJZV53Pz
         wgaOi4iSl1kcq3+P8667Y181IYs/e62JTxrSqI+AQZn8M1x1jrMZLvt54LG1bGX0Io6D
         gbY81CE734NPTWdMNP8o4VtR067pbM1+XKhLKIk79QCB6+l90HXX+VV2quYnr8HffSAm
         sSdnRCizzKSPN8WTPH9rqhU+V8A/N2z29K+UQ7j4cqpwxSvqCjQ0sMP54YC7z978V2x8
         pE07p81Soms+iox6Lxa8/AF04RvborHybtb4HP7HDHnr8pEXuEazv85U3iZo2Ocfkg11
         /OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TS6gx8Hyh/qhvZFYSgScu0p5q+84OON1lKmnMJrgHoY=;
        b=GrQT61S9n8z6rRbBOoSHb8vk7FW9nYis7zjPOYG8MyaaysjS4snJgVWvAZAiGPJb6N
         Z68ZNHGwktKu2al47YoIUuPbfB3d3A58zv7hn9aLoNBCoFSFKdzyVVpEXOuMm6pA5gDr
         Yup8ylyaKUAbcxhY+6UvWJPTf1WbQvP9Vw+5RulsgnjWx+J6jmjHiLrBQJE101Qu852J
         EKhtFnIBaqj8/kItzyrFgn3i7bZ9yMu7cLjzNIBMtZfBalpO+Hj5JUTveVOa7kqSRUxY
         VUDJMJJKiTBkiUvAuI5v7nKlVN2UGIO9ieLxChR1qSgV9neQSeRRYcno0Vm5YtT060Ot
         7ihg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R8uEG+pN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si12401320qkp.261.2022.01.27.08.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:23:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R8uEG+pN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7YW-00044f-1C
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:23:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6b3-0007RC-Qy
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:22:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6b1-0004L2-Vc
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TS6gx8Hyh/qhvZFYSgScu0p5q+84OON1lKmnMJrgHoY=;
 b=R8uEG+pNYIDaHNOiwPnTpOI9K3Cb5sO0xJAbMRm6UO6pr8KuU0Fu/rbi7Xz8srbiTLCSR4
 GtipbNImPdFPT4W3dPH2HygiYPMRyNZ0nxCD8dI+dC7R9L5f+r0n1JB3raeoq766eODTng
 LEZpp+bKnjCKC3w/8Tg7ossV5osF46M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-9uejBX0cPtSFZMhedaP3Hw-1; Thu, 27 Jan 2022 10:21:56 -0500
X-MC-Unique: 9uejBX0cPtSFZMhedaP3Hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8508C83DD1F;
 Thu, 27 Jan 2022 15:21:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4111972FA2;
 Thu, 27 Jan 2022 15:21:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/38] migration: Add postcopy_has_request()
Date: Thu, 27 Jan 2022 16:05:46 +0100
Message-Id: <20220127150548.20595-37-quintela@redhat.com>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
X-TUID: RDMTgh/zRzen

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

