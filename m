Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp574666lfk;
        Fri, 28 Jan 2022 11:22:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO6oBml7Bl2Fff/XHQfuqPVJpqkRYonxlMnukimprwC+vH0umXAS7rsn3+gG6UYgW08lra
X-Received: by 2002:a25:242:: with SMTP id 63mr14222260ybc.452.1643397764768;
        Fri, 28 Jan 2022 11:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643397764; cv=none;
        d=google.com; s=arc-20160816;
        b=iVyEv1RxCgAkqdmRHh0qvUeCy/Egwaa4fJluqw/jpORaIVBg9LVL8wH7vE6plJLgtn
         989tQQFqL71OxbHxhrSl3DdXI06FHVTqg/mSUx4dUwvqlVWxrjMNI+/9QUi6OLrQenyo
         j1HvaVpNQFuwRAflHSAgyCPsLpOGw6BLCy9H+tyzpCeBrHq3DFEvsRfPTuVDluMVrfX/
         gK3tNPcNT6dNf52MT3GzGY1i2sY2jKb+jYQDStZA1MWBtPDObdjFg5UGHqw/dsMozbvt
         /GZ1nJ9LMI3ehkxVLQpE7cUJ39MRvGNlqQij5d2WNHjTrD9+Mh9cke6Y6pCJxHGB5bFL
         nwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MkAbiCYttSVRqU0/R/ggcgebKM7ODj+Bue3CTNACnp8=;
        b=RQ3OGUz5xX717hG2G67naDF5L91FNk2rWXMG8nG3mtqbIlfJf06fpb80pOwJ5tFNFO
         1oVloJZKnkkaeuxyjf7kcJMtU4yWZT7FQlwo7ShRcuGUnur++GsjzGTPNfz8Oam+rDJZ
         1Cv4PlSF8bViBuD56SmPV1FqIm2E3s6WxrzU2AaZVF4G1+GTJ71o8aUJiFTCwfotoU1I
         VRRboBajjKrOuaFdi+91NELb+qZu3bLNYDFBLWwPVJsbTpLNGH3/RWXFyl8A77N2amym
         sZ4nuTYl404UHZjAL0KItnwRe6ael977B2VUelMqgDe2gjU+ZvTwZlzZu+Nofm7LlDyf
         v9Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QAgEk8cv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m73si13186318ybf.56.2022.01.28.11.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QAgEk8cv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWpY-00030e-3h
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW7s-0000cf-Lf
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:37:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW7m-0001iQ-9C
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkAbiCYttSVRqU0/R/ggcgebKM7ODj+Bue3CTNACnp8=;
 b=QAgEk8cvs8EsM4qX/XjCeCF3hWh3khSli9m0n0TH4uc2DmgJ2eBjz/Yz0PuoI8b/4Z4UcY
 TdxrkqnfpoPf1ZjmWP/e0QRVX7pkslq7MOV/t+CjdzdBTyaujK5DTnRNHLzEUucQUGQJiR
 CCGXQX18DqjKyvhMTnfYHqdSprfzspY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-J2fgEbu-MnOZULJXtH4CMA-1; Fri, 28 Jan 2022 13:37:25 -0500
X-MC-Unique: J2fgEbu-MnOZULJXtH4CMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8078E8144E1;
 Fri, 28 Jan 2022 18:37:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE69377456;
 Fri, 28 Jan 2022 18:37:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/36] multifd: recv side only needs the RAMBlock host address
Date: Fri, 28 Jan 2022 19:30:13 +0100
Message-Id: <20220128183033.31998-17-quintela@redhat.com>
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
X-TUID: /aVOon8a8PjO

So we can remove the MultiFDPages.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.h      | 4 ++--
 migration/multifd-zlib.c | 2 +-
 migration/multifd-zstd.c | 2 +-
 migration/multifd.c      | 7 ++-----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 850889c5d8..be460f821b 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -136,8 +136,8 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
-    /* array of pages to receive */
-    MultiFDPages_t *pages;
+    /* ramblock host address */
+    uint8_t *host;
     /* packet allocated len */
     uint32_t packet_len;
     /* pointer to the packet */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 8239c840d3..aba1c88a0c 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -253,7 +253,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         }
 
         zs->avail_out = page_size;
-        zs->next_out = p->pages->block->host + p->normal[i];
+        zs->next_out = p->host + p->normal[i];
 
         /*
          * Welcome to inflate semantics
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index c5ed72ddcd..d788d309f2 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -264,7 +264,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     z->in.pos = 0;
 
     for (i = 0; i < p->normal_num; i++) {
-        z->out.dst = p->pages->block->host + p->normal[i];
+        z->out.dst = p->host + p->normal[i];
         z->out.size = page_size;
         z->out.pos = 0;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index e362b1bb89..b39fef5dfe 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -147,7 +147,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
     for (int i = 0; i < p->normal_num; i++) {
-        p->iov[i].iov_base = p->pages->block->host + p->normal[i];
+        p->iov[i].iov_base = p->host + p->normal[i];
         p->iov[i].iov_len = page_size;
     }
     return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
@@ -340,7 +340,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    p->pages->block = block;
+    p->host = block->host;
     for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
@@ -1007,8 +1007,6 @@ int multifd_load_cleanup(Error **errp)
         qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
-        multifd_pages_clear(p->pages);
-        p->pages = NULL;
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
@@ -1149,7 +1147,6 @@ int multifd_load_setup(Error **errp)
         qemu_sem_init(&p->sem_sync, 0);
         p->quit = false;
         p->id = i;
-        p->pages = multifd_pages_init(page_count);
         p->packet_len = sizeof(MultiFDPacket_t)
                       + sizeof(uint64_t) * page_count;
         p->packet = g_malloc0(p->packet_len);
-- 
2.34.1

