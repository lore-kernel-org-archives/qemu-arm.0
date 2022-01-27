Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4194036lfk;
        Thu, 27 Jan 2022 08:02:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhyKhTBRwC+1aYZGUzK6sm8VHmcYxrDfMNPh3bTMN4aHxNASCSzY1kgZ8rMbnvEdrATV48
X-Received: by 2002:a9d:8ed:: with SMTP id 100mr2476099otf.235.1643299375068;
        Thu, 27 Jan 2022 08:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643299375; cv=none;
        d=google.com; s=arc-20160816;
        b=vAZfoCaABmjfc01Y2J0LboBDQ+EIYSpO0l1CMAZ9h8KyU48bijbM9D0z68Rrlzbgs9
         P3R3wuyItiTg+fFRLZ43yBSI3kpr4HhpVsSlglsewB7KEAaBEnfIY+6IJMPLCk6oocTH
         zN4fmRPQTPrFujIuz+4chb0BpFAcFkdp4fUZKMIyEEgYU6LQDbKJQDRDFKofOja3pKsm
         m95sHY04pZmwJgGPxaaU2NfbXNdUWSiVL/SDYW6QQF6ffkdceXSN7J92tuHXxpKPne1Q
         gthgKPIqODQ1YvZecPdRsPJoNcE+g9OKss4G2ZLSbKOTrIzVItMYS1l1uPiDSoyovQOz
         WXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=onvaER+t0TraC7NXwJgnvw5i2u41yAbEjBFVmIygZSU=;
        b=UJzMMULn18HNFIWr2oL59cnYA20fcH5Ufyfx8ftbDrfXi7+/DqTLYD40eZc8t62Obr
         VLIO7PU1BL6g9fXmPXYDD7Zb2WMKSaaoFWoNK9ngVa73hu9o1R40rKoaom1nVGHTJysN
         9uLdPsb5yKNIbLF7zxyg6w8g4cRQ6d3msQYkg62THIOJvhWyh6N2AMN/MKvkKo5iUZwo
         ivAG8kfBBNZzuhKHk+amCC2MDtkJGa2rav/GxlxjDPoB2bO0VLM45qOWilJ5adwhbHsb
         eiZU+1fKj1+SEzm3ToYTcBWTq7uPjjE4ACpi2zaq7vp4BA27oNhTf4CTTMOBhBqFcesh
         gagg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mo+HX8qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si367294vsj.538.2022.01.27.08.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mo+HX8qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7Ec-00057I-6X
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Up-0007SL-2C
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6UT-00033A-AW
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onvaER+t0TraC7NXwJgnvw5i2u41yAbEjBFVmIygZSU=;
 b=Mo+HX8qkIgH3GeFi1XLJqOvVbs7ZDN8KTGp1KV1Zoclx5T9p6Mcj5Dkn7DYTAqOYp0o4FU
 72wHltejpOm9R/vSlqfky5ekby639Von3aLoUe9CUp8AU4FdLXCofcuRG4kE1qvDp712pA
 gc4n1Q+hICkALsl+he7Zkf5/UC+uxzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-fBnmYJvoNp6f6miyyFZnJw-1; Thu, 27 Jan 2022 10:15:09 -0500
X-MC-Unique: fBnmYJvoNp6f6miyyFZnJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CBD984DA43;
 Thu, 27 Jan 2022 15:15:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ADEE70D2D;
 Thu, 27 Jan 2022 15:14:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/38] migration/migration.c: Avoid COLO boot in postcopy
 migration
Date: Thu, 27 Jan 2022 16:05:30 +0100
Message-Id: <20220127150548.20595-21-quintela@redhat.com>
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
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Zhang Chen <chen.zhang@intel.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjqAXQaGs7y+

From: Zhang Chen <chen.zhang@intel.com>

COLO dose not support postcopy migration and remove the Fixme.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2afa77da03..5b2e3c66d1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3230,7 +3230,11 @@ static void migration_completion(MigrationState *s)
         goto fail_invalidate;
     }
 
-    if (!migrate_colo_enabled()) {
+    if (migrate_colo_enabled() && s->state == MIGRATION_STATUS_ACTIVE) {
+        /* COLO does not support postcopy */
+        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
+                          MIGRATION_STATUS_COLO);
+    } else {
         migrate_set_state(&s->state, current_active_state,
                           MIGRATION_STATUS_COMPLETED);
     }
@@ -3621,10 +3625,6 @@ static void migration_iteration_finish(MigrationState *s)
                          "COLO enabled", __func__);
         }
         migrate_start_colo_process(s);
-        /*
-         * Fixme: we will run VM in COLO no matter its old running state.
-         * After exited COLO, we will keep running.
-         */
          /* Fallthrough */
     case MIGRATION_STATUS_ACTIVE:
         /*
-- 
2.34.1

