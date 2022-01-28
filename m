Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp579594lfk;
        Fri, 28 Jan 2022 11:32:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEa0dWwgrwnvnnUKaerZviz3wst7kdPd5AxPEbrpUlu3RHt0dzYdr29JKq2WeQB8pVamV9
X-Received: by 2002:a25:94c:: with SMTP id u12mr14377117ybm.29.1643398370352;
        Fri, 28 Jan 2022 11:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643398370; cv=none;
        d=google.com; s=arc-20160816;
        b=yR6ljbnlRR619aaMWU48OJJmJnJEAX9D1tiqEm1RRFGv48C3UovEET4lxcGM4J8RCB
         g+9dgdeiX2SAhjVh1R4VuuSlZZUIp9FUELjPTpnmFwcVsv3udEs1RDg2H/pmX83Rss9R
         C6R+TxBC5y0AgGOWo5CPSsUZ2Jr9Na04EEmusR2l+aHnZNYsuv1CL+QbuNMh6poU7CTD
         742LvOOenFDNGUORLbmS4epiH6XjZpm0q4ugrufqd4l1rp/B7o1p+Biw1l93RS0pGby+
         jey0zGqvuWwcm3173szAqv2zZHs1HulRs8hhwsEO+0n4i0ptppjLfP8a6ZMltQudlLfQ
         Jykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZEDHjNn5660tKa3OsoWZdLmqD8eE6Y5+2rpz+s3JKVA=;
        b=qzvyE15g3u6Xl27MALOuKuJbREx0vhaCNJJ6sSlyDIcmRoPkDu+keakHlnDQsatunj
         NUElOk6UgIbLwc/V1bTqaehRR9MDEh1mhsT1HM+xDZu7EGk2sjH3H/Oac2+RvknGbtd7
         DJpelblGdEuWWNPzukYJWF8KAGOQS1++s7jdlFj6ilHBPn9U+cAACUdQDyCtaasEOG+O
         ALlahb5G3p8F2Xz4Mwacg9RM85x+dPtg956KyoMdxAZmk3N3pcmlBjJmHMWzzISfU+ge
         BntZ574oucA+rSEw4lnlom/jPgPbloZ/jRGv5gP/p2oqlPIJ3DRIU8hLPf6sAcP/Rd9u
         jIyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RlwBfxAv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h38si3485745ybi.337.2022.01.28.11.32.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:32:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RlwBfxAv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWzJ-0001gn-NG
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW9U-0001Fw-SM
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:39:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW9G-0001wE-2O
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEDHjNn5660tKa3OsoWZdLmqD8eE6Y5+2rpz+s3JKVA=;
 b=RlwBfxAvdxB1sP/rBA25NC/ESsKX38ZZxychUQgoBR4NykvVE/v4SCazHwSldoR+ujydQX
 m7M4dVqlju68nlZnAbl1ZENZTZM9imbheYN9b5zljYxRxPvLOxfpwUzKp3LVqMpUmfhX6T
 tcglVvffNLRs2T62Q67aVKnDKaCB/4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-C76gh4zXNIGJu3sBFhUVlA-1; Fri, 28 Jan 2022 13:38:56 -0500
X-MC-Unique: C76gh4zXNIGJu3sBFhUVlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 833431091DA0;
 Fri, 28 Jan 2022 18:38:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82A8812E25;
 Fri, 28 Jan 2022 18:38:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/36] migration: Drop postcopy_chunk_hostpages()
Date: Fri, 28 Jan 2022 19:30:23 +0100
Message-Id: <20220128183033.31998-27-quintela@redhat.com>
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
X-TUID: uttG1B0YueuL

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

