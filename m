Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4208361lfk;
        Thu, 27 Jan 2022 08:22:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5dXbBLifPdoY3IThgkaw+OZWuUdpVj0AsLmd2y6nTiFo4M3RXMhnZUiJ+YQcacmHCHQjY
X-Received: by 2002:ac8:59c6:: with SMTP id f6mr55234qtf.343.1643300570177;
        Thu, 27 Jan 2022 08:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643300570; cv=none;
        d=google.com; s=arc-20160816;
        b=LPYthgc/TJKar2ieYmBGxD8zp7FbZ9nsTg2aMOPlgLz0CmoyW8IVwnwFjdFM0qPIvG
         Ar/rWCOF+CLOHboDFge9yrHKqC2DyHihxqiMMuLC2YgwwXeMOv5eIDFH+T/wDuEALzZr
         XVDhPMmwGc2v9vnofbutnB5q5lfQ132cU3z/VBqD8ZOzxUw9GAZ55ZfLERag4sZXlt+q
         KHB8ZcNXZA8kWpwn4LYHPOipXme8sslBcvqnjj89UFk/31Y48GMeiNhs2/zDRNKTCOue
         wu3K0OILxpCHbWeKXeufbCCwHsOp+CP8dS1teb2jvOgftxvs1OhzNfBqWgYpgplfy3NY
         lbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WqBDQpUHEZjJ9CbMmxkFKgKY9VLv0LHeqJmfi5UhxQ4=;
        b=X41LmLsSDt7ddFtcgENvawW7yjtaCR0B6uIscBW2N9dHOCuakC6Y7562TaRxLIlkoX
         6461TXS5plsPWo7VSUGkC+L2yX+SH2i5rDr0w2hpW2z/hLaTvqG+uyc0VOej9oSygd25
         nIETlpuXDgb3wXyyDxYxQBa5Y22RYvR+5aZO9jzfsAF+0C/nFHj6eXZcay0Z7uSUB8BR
         dFG4MVFrZXkOBRlDM5HdfKzeI0rvAy1Dkxg9+jpZ+kjYeRWN8KZkWbCAhU1AoQmy2jCX
         kwAOi54OB0ZlJ4eupAmeXkBBjiKdkArq09LtBWJS8IjNgJRr2bEd926vhD0QJ9BFEsFK
         O3Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhhM9+N8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si1276920qvx.358.2022.01.27.08.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:22:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhhM9+N8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7Xs-0003Av-0M
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:22:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6as-0006pj-6s
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6aq-0004It-Kt
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqBDQpUHEZjJ9CbMmxkFKgKY9VLv0LHeqJmfi5UhxQ4=;
 b=RhhM9+N8zKfCDyaiwOBVT3zhWnsb5EScDjSSIcqAgBGgkxbU0ptMPvu91HVCQV4/eIop62
 UNyfoXzTPpL5e6N2mGH9kdA7iqzYw9WZND3tGosVjZaXKPd21qLZA2bU6v/mempBs16krw
 u6Jf0Otrk/cZHdEbIeE/Pg6IX1TEAto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-oHIjCABTOPSA9Oexzcz24A-1; Thu, 27 Jan 2022 10:21:45 -0500
X-MC-Unique: oHIjCABTOPSA9Oexzcz24A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB72580F051;
 Thu, 27 Jan 2022 15:21:41 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57EF870D5B;
 Thu, 27 Jan 2022 15:20:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/38] migration: Enable UFFD_FEATURE_THREAD_ID even without
 blocktime feat
Date: Thu, 27 Jan 2022 16:05:45 +0100
Message-Id: <20220127150548.20595-36-quintela@redhat.com>
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
X-TUID: sWL00vVqczdT

From: Peter Xu <peterx@redhat.com>

This patch allows us to read the tid even without blocktime feature enabled.
It's useful when tracing postcopy fault thread on faulted pages to show thread
id too with the address.

Remove the comments - they're merely not helpful at all.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d18b5d05b2..2176ed68a5 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -283,15 +283,13 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
     }
 
 #ifdef UFFD_FEATURE_THREAD_ID
-    if (migrate_postcopy_blocktime() && mis &&
-        UFFD_FEATURE_THREAD_ID & supported_features) {
-        /* kernel supports that feature */
-        /* don't create blocktime_context if it exists */
-        if (!mis->blocktime_ctx) {
-            mis->blocktime_ctx = blocktime_context_new();
-        }
-
+    if (UFFD_FEATURE_THREAD_ID & supported_features) {
         asked_features |= UFFD_FEATURE_THREAD_ID;
+        if (migrate_postcopy_blocktime()) {
+            if (!mis->blocktime_ctx) {
+                mis->blocktime_ctx = blocktime_context_new();
+            }
+        }
     }
 #endif
 
-- 
2.34.1

