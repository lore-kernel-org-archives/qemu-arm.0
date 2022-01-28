Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1030867qvl;
        Fri, 28 Jan 2022 11:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyti3vdeRRgyZ5JFpE0Z+opPeivfiT8+WU+XE8N1+6c5t7WiKU+f85mnBss+1i9Vc8se3bi
X-Received: by 2002:a25:7384:: with SMTP id o126mr14597445ybc.38.1643397202291;
        Fri, 28 Jan 2022 11:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643397202; cv=none;
        d=google.com; s=arc-20160816;
        b=ezsglAl3Uwy9asjsj1FiRDUoSkEiuahcxNmPDmrzy/8pzNU3SXHXctem0SVYD/5m/W
         CbRKfcXamUeqByqpn6eoaXhVOddeZKDewAUZMY8TyVZ+zyzHCn/AT3SBzHliuGW1cc8+
         FZDpe4ITus2Pc7Me0MA44hU/ZHJQAbK0SIyFkOZEscovgIGW8lBLCEVuvtx6+M8E1vt5
         mVErF0EJ7xn8gb3NiBQw97g1WQDUTVxjBWJVG7wKqSibgjKUHBxGKDLwhbuTWfDHQEpn
         D8v4pQN3cwl9AEmZyVdfAEhsTNVM8L0Yps8lOd+pi20gShnlP/CH3oVKXpPWpqiFNQLp
         3oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yTQ4I0ZcTmklehXGFG8JWS5ZQcOuFKPVBWjAxpcMXkI=;
        b=QJdqh6ytfnkUgufs8ywJGSoXmNJ2r4Xj5Ip8ds3M/Wd0muCpW/wvg2vbHgP0zvtWSL
         b8/xlTiCrbO6EMyXtzG2SlxEGR+cQlHH0R2rl5jPTLNfRh9A5elyHfJjHLjYJZQMATjE
         JIwCJzOn5Rq4finkuXOO+T49ZRjagKwoqQE85zboonsTwV+Ezgi+AegB+Etm8l/jqwyx
         lLcDJMyElJoTjLwJz3VMMLHFsHXePC8AnHc1aQWeJI6lu7NhuMMSmV6Hl49LJ8R5/eWA
         mGviDl/22IklWhv3ZhJp58Y3HpS10Vq8vgFW3YPYY16AooVKFRBXU9Qzh2mz5/Y3Yogt
         2vKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cMP7MSx/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si28669144ybf.760.2022.01.28.11.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cMP7MSx/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWgT-0003Qk-OJ
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:13:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW94-00018d-0h
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW8w-0001re-Vu
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTQ4I0ZcTmklehXGFG8JWS5ZQcOuFKPVBWjAxpcMXkI=;
 b=cMP7MSx/j/QXznGjPNnEJ64BRfym5AlKlEZfIcyddHIexq4LmV5/Ka6qHJpiieHOI1TZh/
 xh3u2m0yQVYSv7GjFnFHJBm1CBuYSow2Nrz0yaLF6lM/C15PRFW8PupFBDrilBPuJ7U+ss
 CbNXQVnweu7d/wDeScewqrMtOaKm25o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-qVXYq7pkPRqAcMXjTGFNlQ-1; Fri, 28 Jan 2022 13:38:33 -0500
X-MC-Unique: qVXYq7pkPRqAcMXjTGFNlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 215931923B83;
 Fri, 28 Jan 2022 18:38:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD88077461;
 Fri, 28 Jan 2022 18:38:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/36] migration: Don't return for postcopy_chunk_hostpages()
Date: Fri, 28 Jan 2022 19:30:22 +0100
Message-Id: <20220128183033.31998-26-quintela@redhat.com>
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
X-TUID: SqQ2bA4XCq5c

From: Peter Xu <peterx@redhat.com>

It always return zero, because it just can't go wrong so far.  Simplify the
code with no functional change.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9a06ea6dd4..c60cf5ad83 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2566,12 +2566,10 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
  * dirty host-page size chunks as all dirty.  In this case the host-page
  * is the host-page for the particular RAMBlock, i.e. it might be a huge page
  *
- * Returns zero on success
- *
  * @ms: current migration state
  * @block: block we want to work with
  */
-static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
+static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
 {
     postcopy_discard_send_init(ms, block->idstr);
 
@@ -2581,7 +2579,6 @@ static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
     postcopy_chunk_hostpages_pass(ms, block);
 
     postcopy_discard_send_finish(ms);
-    return 0;
 }
 
 /**
@@ -2603,7 +2600,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
     RAMBlock *block;
-    int ret;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2617,10 +2613,7 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         /* Deal with TPS != HPS and huge pages */
-        ret = postcopy_chunk_hostpages(ms, block);
-        if (ret) {
-            return ret;
-        }
+        postcopy_chunk_hostpages(ms, block);
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.34.1

