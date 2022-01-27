Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4207744lfk;
        Thu, 27 Jan 2022 08:21:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwDueBiNQMScE3r29JMWYGgb3dF4SBS02ok6UEDxC6DLZXuIf08HFekqNbyEthQhcxe+hu
X-Received: by 2002:a05:6214:27ed:: with SMTP id jt13mr4280465qvb.38.1643300513826;
        Thu, 27 Jan 2022 08:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643300513; cv=none;
        d=google.com; s=arc-20160816;
        b=jy7GDXCpRrucOffZv/H2oXWLRFKzjpgrSgWFzgBdI1KN6BVYGFOoBS8JUoxN89k5lc
         lrzJTDt+kAPVxdjZbTOlo1f+0YOqmxfWmnGMhKf+qS3PJPPwYSbddPj4Arf+NEg6gRen
         KqGiZIp6vg81TPq2CDDd81O/wN2RNEZVAbx9/yMDzuYhqSaRt3JDj/rJzbQBy/GL1/tY
         Hsb1n5Yp8LXtHPGcdqJoUogENBkDQ5CE3PCJBzL6INjdd9Virij4ogAXbJGetcm8aNfB
         FpyY6XJpi9gSGo10zlWVRhanOeuIPbwMjhe1QmVvrj+z771a+4LlPxiOhBekDX1hhoD5
         w3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GkWkS3xp+0M05sMrGQxYgQctujCPIGIetcJubDJCE8Q=;
        b=GiXhikjnX/EC+JhRN7IvLnHsj+xIH9+wUDi/4i3kn+Pq8hI+1a2y66+1IMbx97t27I
         XcvEc4QH6S5FSyahW6Oz+eqYwW3yzwhyXKfjE69Twsw4GCGaXzMoDpZmCjEEZCN96qKp
         Mk+rJrrlZx8LaiZkL78M3K6FvqROl0fHtgrM9qntfJj0bmfqsUQT+JXU5p1JYO2n+2Rt
         QiXaTxlajNbuKR7148bjAHbq1/afJQTB5IyUEzgB9glockHGVGjkUL1Z4X0+pd1uUu88
         fpQ5B6e7qp91Chl7UQDYIsSRuEFO0JA0YjgZcf5uM2EAxD7BHIlK1ZEF8xpcYHTEa+Sa
         AK7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NJk7dZZr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si10691482qkp.342.2022.01.27.08.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NJk7dZZr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7Wy-0002Ho-TA
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6ZW-0005VP-MB
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6ZQ-00040r-Bp
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkWkS3xp+0M05sMrGQxYgQctujCPIGIetcJubDJCE8Q=;
 b=NJk7dZZrEk3yHODNV/+2XOx05W9lev4iwF7NtP5vnlD0OAnZuO8FbUZUx9olB2cALvGx01
 fFFA60A3yDsNZf1P3L0fsm3Gi6BvEqPlmZG6IwnW93oDT54Kv+6Her+3kYEdsl3YJRDUEH
 TXK9P6eT6fPa3tie/SR8NHHJ9d/YJSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-BiLwoEHNOrKdNtrmqryKTg-1; Thu, 27 Jan 2022 10:20:08 -0500
X-MC-Unique: BiLwoEHNOrKdNtrmqryKTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F28DE19253C0;
 Thu, 27 Jan 2022 15:20:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F12EC72FA2;
 Thu, 27 Jan 2022 15:19:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/38] migration: No off-by-one for pss->page update in host
 page size
Date: Thu, 27 Jan 2022 16:05:44 +0100
Message-Id: <20220127150548.20595-35-quintela@redhat.com>
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
 Kunkun Jiang <jiangkunkun@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>,
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
X-TUID: 7POWLpcVehQn

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

