Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4189069lfk;
        Thu, 27 Jan 2022 07:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdbpJ1qcHbjkpSeaI3Aj9h8c+nVbHqO1gbj2TXDr9nexvF0fs/uin3AWU8W/CTy0GQv803
X-Received: by 2002:a25:37d0:: with SMTP id e199mr6463125yba.147.1643298916975;
        Thu, 27 Jan 2022 07:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643298916; cv=none;
        d=google.com; s=arc-20160816;
        b=vKCUd0SdXMeTOFxk78nyU7bFbIdszA4Xh5/MsjwAZUuoS2m3kt44yhrk897i5vIH4N
         8uo0iTaS+uoi0elRuWv/U71949Sv4QQFl6zJkoKIU+BtGMg5UN5RkeWT2UyQBYtt9ZxX
         imUfU0iv9YZ+cAUEinchrk/vREQjMazQyPAmipbT3PfKaNDDe2hPrHRx8NlXiqlf+DT6
         cCQLSp3Uy4cvershzOlXTVPcyvOn6mopGc6+6Tn1sHi60mHKEmk3VRwDS2CuQE7yC6KJ
         m/UmyfvtLKfxWljWyBZDocssvwGa+D5zGW8Se2yFQ4gF2Lj0BVEHGLYI6OeMRwf7M5rG
         4kmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hE2kigmqsLGNbYQ+L1kwrW1aVo1Qr7jSwGoqehKP/b8=;
        b=FNXywjBSCsHELXR0cH1cOPMCnZZtJd+Z5IJBfwi81wWDae+fm8uKlA4hdO3UD4hinj
         5mbLwtCfmtJ9Vu276SxcgZ31kJMYv+uUpWCEdkSgw59cq3efPQULc/dhgFMFsOvvrWU2
         J5LuzYa0c837wLjf3tN5CWxKT5lsRZGCak/GVEwm65nmMbO2xulEeRYaQAlgkpcIeyPH
         QhzeuQnNf0WfcC046YwqT4x8nnXUvGEc/4VhWl36QNewhX7o8+Mz1+OjPjqfhpHSkLnD
         7lz7GcYmza8xXt8p63o7GEuK1BOlXdLLKCOREHjpp4xFPXoEQ0pxKZgujWvQi7QgDxsQ
         IuEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BvQuWzXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si26570584ybv.357.2022.01.27.07.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BvQuWzXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD77E-0002UY-Cm
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6XJ-0003Ez-Ai
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:18:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6XH-0003cB-KQ
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hE2kigmqsLGNbYQ+L1kwrW1aVo1Qr7jSwGoqehKP/b8=;
 b=BvQuWzXKna0Zi87bQZa62KZgDy8YyockstfBXIdWG8SZ6/P1uRBazqwx0gNOBA0AdNKHYS
 lYdKE5nj9UnNYDMvGCsmS3yg+UR32N4Szg8138Pi7vvctpnm6usvqCGuhow9lkHmXJFPZm
 /dOJy5WjHMtHjdg6w/EPojA+KAq7SaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-jHLFZV3SN4CMfHYddAOBkw-1; Thu, 27 Jan 2022 10:17:59 -0500
X-MC-Unique: jHLFZV3SN4CMfHYddAOBkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E4818B62B4;
 Thu, 27 Jan 2022 15:17:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649F970D2D;
 Thu, 27 Jan 2022 15:17:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/38] migration: Don't return for
 postcopy_send_discard_bm_ram()
Date: Thu, 27 Jan 2022 16:05:41 +0100
Message-Id: <20220127150548.20595-32-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGalhgEwe5lT

From: Philippe Mathieu-Daudé <philmd@redhat.com>

postcopy_send_discard_bm_ram() always return zero. Since it can't
fail, simplify and do not return anything.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5489ee3b7a..1771bbdb02 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2419,14 +2419,12 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
 /**
  * postcopy_send_discard_bm_ram: discard a RAMBlock
  *
- * Returns zero on success
- *
  * Callback from postcopy_each_ram_send_discard for each RAMBlock
  *
  * @ms: current migration state
  * @block: RAMBlock to discard
  */
-static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
+static void postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
 {
     unsigned long end = block->used_length >> TARGET_PAGE_BITS;
     unsigned long current;
@@ -2450,8 +2448,6 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
         postcopy_discard_send_range(ms, one, discard_length);
         current = one + discard_length;
     }
-
-    return 0;
 }
 
 static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
-- 
2.34.1

