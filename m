Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4180825lfk;
        Thu, 27 Jan 2022 07:40:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1lkVyuyhv3JOi6NrfyfbUnXHbtpuSOmewVK5h7OS6xbKrmGMYfpjD66uPfGwT2l9MJfWk
X-Received: by 2002:a05:622a:58a:: with SMTP id c10mr3179842qtb.105.1643298036327;
        Thu, 27 Jan 2022 07:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643298036; cv=none;
        d=google.com; s=arc-20160816;
        b=KxCAUYW3G7L0SxYK4wUvPd69vNhFOJnlPR4j41aP6SUoXDSfa8hxwaGrelRd7DLIVB
         QjgtuxXvnoaBJttxX5JCRimWOX8hbIgYR1BXzfZl4EEG6EPwmua6z7nFpcPy3qdP4M1I
         sIYWr4fqaxyi6cWryGfMHSqdtKN6AswtR9GGt9Hisa90iPcYHt/1KVlua4Zf8rnm7Chq
         uIl/RNAHS+zmLLeydZaxtLFc6PRk72UvG3UYNLiP6xHzExx9zuxvVufdn+V9DBNDxUfe
         vCYLyVv4Bd0ncLrMJBDkEW6BiqUqTReH3Uczoy70sfvSMPpL8wAhwRAiGct6VrHvwPnx
         b2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ESOmsPTxjZbmAe2g1N7ay6d2NzqChH7CCCrDtgiDR1Q=;
        b=CWDvBp30tksHwfhA9DK+KM1hlzK24K6Adsi3TofBWXonqKXJoxRsOwcGa9FsaZ8DGu
         8C1ZoOzjTLaPzCdoIk+gqae2fR7KYsyVRGAxhB42O938kHmOfP26aPlm/IzRjp5xjcfd
         5KP9s8+pTnJl4NHZM2FomnyFPrqt20Bq5Upr+NfqVzHLnvYRo8KAY5B03AwoedO6/5cy
         FRLMIOI8m9A6Bhsh03JQ7sE4Owq8gaLjGP2Hx4I3R/YxVjueKPH/2lPVCXR6F7t5M9Ib
         2w7Y2PFbyBcgejrNFvrI+vy+vCxmB5bYNYN4c9itrKa0gR+8axdrMB9JdHAfhPq/Kefd
         449A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cyy1XmRG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i128si22047409ybc.494.2022.01.27.07.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:40:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cyy1XmRG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6t1-0005jA-OI
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:40:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Tg-0006YC-9m
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:14:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Tc-0002iV-Vh
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESOmsPTxjZbmAe2g1N7ay6d2NzqChH7CCCrDtgiDR1Q=;
 b=cyy1XmRG1n6QSKAdi8D+E2qxHsQgc71oN9HQ3CqYFX6lZJMSwvRx46CrsutmcFAqpg0/VA
 2raUQwXozHPiIX2PZFCLaU/3Q9xJCNJCnvWW8dcdcrxV6t7QjfnGraujfOMHlvenCAEvrW
 7e8QApwakRg4RoW/P0YibmnYmWw+kgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-25kLS2HIO4CpJhdNH0S-ZA-1; Thu, 27 Jan 2022 10:14:18 -0500
X-MC-Unique: 25kLS2HIO4CpJhdNH0S-ZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A90984BA42;
 Thu, 27 Jan 2022 15:14:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FE6070D2D;
 Thu, 27 Jan 2022 15:13:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/38] multifd: Rename pages_used to normal_pages
Date: Thu, 27 Jan 2022 16:05:27 +0100
Message-Id: <20220127150548.20595-18-quintela@redhat.com>
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
X-TUID: tVan0DkHqaai

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.h | 3 ++-
 migration/multifd.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index be460f821b..4dda900a0b 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -44,7 +44,8 @@ typedef struct {
     uint32_t flags;
     /* maximum number of allocated pages */
     uint32_t pages_alloc;
-    uint32_t pages_used;
+    /* non zero pages */
+    uint32_t normal_pages;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     uint64_t packet_num;
diff --git a/migration/multifd.c b/migration/multifd.c
index b39fef5dfe..76b57a7177 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 
     packet->flags = cpu_to_be32(p->flags);
     packet->pages_alloc = cpu_to_be32(p->pages->allocated);
-    packet->pages_used = cpu_to_be32(p->normal_num);
+    packet->normal_pages = cpu_to_be32(p->normal_num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
 
@@ -316,7 +316,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    p->normal_num = be32_to_cpu(packet->pages_used);
+    p->normal_num = be32_to_cpu(packet->normal_pages);
     if (p->normal_num > packet->pages_alloc) {
         error_setg(errp, "multifd: received packet "
                    "with %u pages and expected maximum pages are %u",
-- 
2.34.1

