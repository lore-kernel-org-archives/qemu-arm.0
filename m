Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp582822lfk;
        Fri, 28 Jan 2022 11:38:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZhCtSMr1HmON3rRZ9tK7QY2svAiQ8dcdU6zUoFxoOWkgAbQI0mxE5lKPZ0xHC/cJhYofI
X-Received: by 2002:a25:781:: with SMTP id 123mr13972840ybh.189.1643398729595;
        Fri, 28 Jan 2022 11:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643398729; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJ3MPHuj9j0i9oYDt8lkrjDqaSX7TyQro5q6fBsPLfivb/4rjR4I3KsX+lqibhqRec
         tesIoQ7PweIT44JE/In228xUoangfXWRnlTV+S2NhqH+nW/3HqW0pRjzF2QKLohhQW71
         eQ6A4sAIl2cM3ixL6esW0J1t06b3fXeFoDG7ZbRLv5WlepQKLvSQ/MuQ0fKyjbFhTNJR
         XnLwJECjOmly0eGvVSjDKceh7pUO9j5UA1KyPQ7/1x0vQKM568IPXZV7KMVSpXYKVROb
         FJm79yWqSAgFGExmSefKBUrC07OM4jf5hQogSWY5xrgx7SBf8QY6U6ueLfMQA2rOCw4l
         vycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vopd49TCz+wjUPFGxCVUDJUhTwkiZxNTMIqVcxx9ykc=;
        b=iX3O2wAmDs8qjUKhud8KF8qvYVOYUqFZbcBBRFEGDzpVe6qlkObrEheHz5AY3OE4sT
         KGnUeHQ26IY4nubkAjyhfyWDAqkAS3vG59Opp0NasCWrEBs06LOMjV8pXxQee/1gi2lN
         5+br1pCoixhCt9uX/QAjGSGWb8SUe2+2Y8Ym/P3BRXb6NeV3lJzpDXxxAc1byKjgaA23
         BDry+kfAsupwwxJEqwrthpE62pnrOwbllUFX9/EU08ROtx3x7eAatJT8dNWLpPfhTxDw
         Y4jFoCaHEkyYnSQkux1ABAL38JDndYrvzXElfnWwZbYThbUx4LmvF6Xv4YoLJ40agc0T
         4QwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Y/0eIv8s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x189si26884859yba.565.2022.01.28.11.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:38:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Y/0eIv8s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDX56-0008KX-SJ
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:38:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWAk-0001Qv-Hd
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWAa-0001yN-Sm
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vopd49TCz+wjUPFGxCVUDJUhTwkiZxNTMIqVcxx9ykc=;
 b=Y/0eIv8sc9Q+ywsAA4/FmkLOvz5jcloOiBZBmL2CkpBAnemTio9dnUPCxRaN9+vx2X+lv6
 SmqokYv7IO45DIast2PmyN/jS5tmMu0SfTHsT4hBLLT3NYtpogIfOEtRn54khh/tfOE41l
 AxPxlUhdKIA6nPTtSKn57GiSeF4t3B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-f2m5mYzOMsq2_6bnTT-n6A-1; Fri, 28 Jan 2022 13:39:26 -0500
X-MC-Unique: f2m5mYzOMsq2_6bnTT-n6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBDBF1923B83;
 Fri, 28 Jan 2022 18:39:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCAD212E25;
 Fri, 28 Jan 2022 18:38:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/36] migration: Do chunk page in
 postcopy_each_ram_send_discard()
Date: Fri, 28 Jan 2022 19:30:24 +0100
Message-Id: <20220128183033.31998-28-quintela@redhat.com>
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
X-TUID: /P6OHsW45QTT

From: Peter Xu <peterx@redhat.com>

Right now we loop ramblocks for twice, the 1st time chunk the dirty bits with
huge page information; the 2nd time we send the discard ranges.  That's not
necessary - we can do them in a single loop.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 91d32002e8..d74a8c04b6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2454,6 +2454,8 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
     return 0;
 }
 
+static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
+
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
@@ -2475,6 +2477,14 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         postcopy_discard_send_init(ms, block->idstr);
 
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
+
         /*
          * Postcopy sends chunks of bitmap over the wire, but it
          * just needs indexes at this point, avoids it having
@@ -2575,7 +2585,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
-    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2587,15 +2596,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /*
-         * Deal with TPS != HPS and huge pages.  It discard any partially sent
-         * host-page size chunks, mark any partially dirty host-page size
-         * chunks as all dirty.  In this case the host-page is the host-page
-         * for the particular RAMBlock, i.e. it might be a huge page.
-         */
-        postcopy_chunk_hostpages_pass(ms, block);
-    }
     trace_ram_postcopy_send_discard_bitmap();
 
     return postcopy_each_ram_send_discard(ms);
-- 
2.34.1

