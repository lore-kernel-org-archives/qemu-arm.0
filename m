Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp598993lfk;
        Fri, 28 Jan 2022 12:09:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtwVKZenLlRkn6TAA0CeIcubb1OH2hDLIIslgkkYg/eqPrzKeQ9vYYvNb0JcPv4oQ5fV3K
X-Received: by 2002:a05:622a:190b:: with SMTP id w11mr7304963qtc.186.1643400572183;
        Fri, 28 Jan 2022 12:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643400572; cv=none;
        d=google.com; s=arc-20160816;
        b=LQPygitcaXTQ9t3rYAFj/I6hTJwDLayQUdPBlqdsO82WcxTMKVhV07yJ4+VDkG100J
         79kVNUBZ0n+yljpuRHzWQBEFewKXH9szunEzqORX5FK2UJZU2iO+vV4MMznl4BWNyQnt
         XX/xJa9Fgr1OZyrH+bsuz9gDNx3J3x2Wwwbw98ghmfbIAZ52i99rVnsJErPKmgu2dC32
         DLaCCbbzfaHn0p/t9qkKr5oiGOyria92F4l4/f1s8IC5XD3b3sJV7KX9gSUdE2ep7s0S
         9rqjjUHN3E/vpPJL1F3/zkAQLVdxSo9DoyMHYWh2cZZdFUh8hN8tvS0beZQsmFYMBtAD
         miZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GkWkS3xp+0M05sMrGQxYgQctujCPIGIetcJubDJCE8Q=;
        b=wXJ0hRSzTTGHUZkBlLNnGGwqTdPRUGI7c3qUVubov9xT8L8Pj+EFKuOAqcgWIX50OK
         u4oJtAMz/jaowGXPGfNRa0JEX/V0LZiDVsoPCgYKJ3mwYgdKThijLnd/c4dXwx9yUuVX
         sObxe22h/HnVsDbPc66XVZy8hsB8oYOUNzEH0G3FfYifcJ9jljGGHVBAsdRyGECkLvC3
         Q4mxXpoKUzH8lLzrERNZwf6Q+BYnFfGVH7/5kGliRUVgO1vuL5kEAxB5XysZV2CMhghW
         F5mjWsSmeR/UJI6XZAtkVcuqk2keiCFeIS6ImPXHKODV7xHrWnbLBqaiqbxhNEiokOXl
         oO4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vlf3S1um;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si5003929qtx.446.2022.01.28.12.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 12:09:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vlf3S1um;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDXYp-000633-I2
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 15:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCw-0001yO-MX
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:42:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCn-0002W1-2b
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkWkS3xp+0M05sMrGQxYgQctujCPIGIetcJubDJCE8Q=;
 b=Vlf3S1umMXchlJTtgORZvfJiP5y4U5aFbBKd902ok4xNtEdu1S/m7gzjMPgxHfajDHCwxk
 0S47pQ7uwHe/qMlhpiLEpvs/qt85uBYscJ6RnCaB00F1xHe/9ET2GTeAXFI4/vvC4skFAj
 Hfjyta18UAFG2Ib6pyfhfjb+lAAc8zI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-FcEUj3VXMKurSAHzPAJz-w-1; Fri, 28 Jan 2022 13:42:24 -0500
X-MC-Unique: FcEUj3VXMKurSAHzPAJz-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9814746860;
 Fri, 28 Jan 2022 18:42:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B36577464;
 Fri, 28 Jan 2022 18:42:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/36] migration: No off-by-one for pss->page update in host
 page size
Date: Fri, 28 Jan 2022 19:30:29 +0100
Message-Id: <20220128183033.31998-33-quintela@redhat.com>
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
 Kunkun Jiang <jiangkunkun@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
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
X-TUID: +fYBE7xMtDl4

From: Peter Xu <peterx@redhat.com>

We used to do off-by-one fixup for pss->page when finished one host huge page
transfer.  That seems to be unnecesary at all.  Drop it.

Cc: Keqian Zhu <zhukeqian1@huawei.com>
Cc: Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ca879c744f..58adcaf430 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1617,7 +1617,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
     /* Check if page is from UFFD-managed region. */
     if (pss->block->flags & RAM_UF_WRITEPROTECT) {
         void *page_address = pss->block->host + (start_page << TARGET_PAGE_BITS);
-        uint64_t run_length = (pss->page - start_page + 1) << TARGET_PAGE_BITS;
+        uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
 
         /* Flush async buffers before un-protect. */
         qemu_fflush(rs->f);
@@ -2230,7 +2230,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
     /* The offset we leave with is the min boundary of host page and block */
-    pss->page = MIN(pss->page, hostpage_boundary) - 1;
+    pss->page = MIN(pss->page, hostpage_boundary);
 
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
-- 
2.34.1

