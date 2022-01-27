Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4192296lfk;
        Thu, 27 Jan 2022 08:00:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrAXstw5cZ8fwS19JTYnSunXuEE6K6+lOy937ZzW2PU5OvFrnRgxoYhfLGiBvDIqGoltRz
X-Received: by 2002:a05:6214:508e:: with SMTP id kk14mr4078215qvb.51.1643299249926;
        Thu, 27 Jan 2022 08:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643299249; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgwgiXmsHJzQ5eZnZp8Y7gbMgGv5YW6TFNawpLCyNrAlNm8KHX8HQMWLsKHBKhyWj3
         svp5dh7Wb7D6xNl49ynSzx2lvYZUicb0wvV0WVCVCzEKIgXW/jL2TLwTtBNsOOYG/Wb+
         w488AHq2RjAYEcDZrLYfNtlJi3ct6EKYMYryefHDoie7lN3XTU8pITkGq22oRLsHn7E2
         3Rye6HgXbX5hkxhq4WuEED1Ayww7BPIDEydE0UqF06F94OhdCPzzKca5J7DdLWDkiJAj
         E32iFjU0v/u/3DIP7qWLFS5kMKC3IYoy6Ga9xuzgMhR4GIjVeyrNUG2310twHOUl2ShA
         2+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MkAbiCYttSVRqU0/R/ggcgebKM7ODj+Bue3CTNACnp8=;
        b=p2aMC+0Px8aiKRrV8kXNRp2gnTzrlZHu+eSbPl1OTuioTchHLnkZgghPIta6RR2DoW
         w8nSg1Y6HpHDosgczAE+sfciSvFoE8yB0M3ESGlnaHX5xkVCOT0iq6yQpmMoKwliA5iH
         llD+wro+gPa3hQbQEI4WuMpeuZnJCj19Jdvt4Ez2K1Dt+I+Y1FKs2jxhXBusaLAhamew
         w1Avv/tOyL+dnxwu3amd+YOV8yz904J4NjB9CoSRAZVqSOIOH5KAV4UtIwuZrIZn44Xg
         cTvS9nKvmAxX/vQtFt6R63A4aBatVbp5/7QmZG9+E9wbs9RX614SxYf+CmMKdcZCmjCU
         y9CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XGs0HUBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si383895qte.677.2022.01.27.08.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:00:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XGs0HUBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7Cb-0002A3-6a
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:00:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6TF-0006Dm-Mu
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6TA-0002e2-QI
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkAbiCYttSVRqU0/R/ggcgebKM7ODj+Bue3CTNACnp8=;
 b=XGs0HUBEuEGEIDBVlr1Y2ZJ3CF+tfTK0eSnWNBCP489XVSuMATbgAqxtsPauOAD0zfHqP4
 euD5ROmz30J2HZx6GwyhjOqCRHnNPgzQ3iWSHO86qyuI34/xu1TtksVb3AT5rnlmiUziPm
 dlTZ6Gx5zjBpc/Q1OXWvnKhsqn//mFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-t3fof3xhPd-4-w1Z9qZNsA-1; Thu, 27 Jan 2022 10:13:47 -0500
X-MC-Unique: t3fof3xhPd-4-w1Z9qZNsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8CEF1858E16;
 Thu, 27 Jan 2022 15:13:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5FE70D2D;
 Thu, 27 Jan 2022 15:13:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/38] multifd: recv side only needs the RAMBlock host address
Date: Thu, 27 Jan 2022 16:05:26 +0100
Message-Id: <20220127150548.20595-17-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gvSS+pucotW0

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

