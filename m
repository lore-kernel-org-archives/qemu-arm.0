Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp579244lfk;
        Fri, 28 Jan 2022 11:32:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnrOGRh6ratdWtt/TtiVGpSPu1bC7NDUs+2EPjP2o66Yb1YHmaHlT7V1Xcmim1P8JzL/8e
X-Received: by 2002:a25:5185:: with SMTP id f127mr13741676ybb.396.1643398340161;
        Fri, 28 Jan 2022 11:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643398340; cv=none;
        d=google.com; s=arc-20160816;
        b=WRQp2ulo+92IT9W+P7kejNrGR+hzmTWPPVBHpwq2yic77RHkL5x4LK5Xz+5y2rNW5t
         tc5U27GsKsIuz9TFNbjHRsgIKUJIsQTng6XZZGSVEwXhrvk9Za3ug3GesCK45jPngZvw
         YVtRiQ87Nd/OKrxnQL/RfR2dj0ijzkNKXGN+HQWD7CkVMxzmZTICKsB3x7cZf7jFRe+i
         bLM3YFe5Eylvja0pMCexp7sorbWA3Ywcy/wYtCRC97kWzYvVR1fmkadj/2x0pUfC/z3X
         EmpcXvQQ3DsCNRlnmjD7y81zZUQ5zU2aEVnpLu+wF7dJvFUkw/0pDd3+pvM2krQFJYIa
         oMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ESOmsPTxjZbmAe2g1N7ay6d2NzqChH7CCCrDtgiDR1Q=;
        b=PTj8ChvSvG1qc2rAqNQmh9lTZ+0iSoLGJ/Jxk1NgYKYuBCtrKTD4wQNoImcUaJS3+t
         YnIPaFlPB/aNXwIu6mHEmxbiyYDPkFCieMjBBSo799pNVEf0zZ7COo1KflDrU0E51PKA
         jAkOu1lkig9YzA3JEXS8p+voovfJ8gPDyP23Lgnsg4niZc7ead1LCCs33quxLjCKdgdh
         bWs93+Fz4qv+v+s1x6ccLoj+3XsSUSa73phOQ95UdODc9Eu78hoIn7Mqtn5LpZ7EWuxG
         zghsmELZFxotfdqJu7CATWUHeL/Y1ZTKYoUa8sh55DNk2GnrpQuJxR4G7GxKtIKADHl2
         Slkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L3RQUW8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z204si29373204ybb.550.2022.01.28.11.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L3RQUW8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWyp-0000vj-J0
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW82-0000fe-Fa
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW7s-0001jD-Ck
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESOmsPTxjZbmAe2g1N7ay6d2NzqChH7CCCrDtgiDR1Q=;
 b=L3RQUW8h3J9CkyzQy5aLR8KyAlGcItqVRvLUz2ZCNOmiLbPzA0MLd5eynaC2qO+4UpjvFc
 bMTw9mcDNtDoTYG1YNbaOsK37TuUQ+NHQSTHgV+69+Z+2RkD+0HgzRwKqGEMQwiy7pqMXd
 ZBp2muI+t8FBmBHW9VgMC/G5pZqMBfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-vrv_VeCYPeeTZfI-tMtjyA-1; Fri, 28 Jan 2022 13:37:32 -0500
X-MC-Unique: vrv_VeCYPeeTZfI-tMtjyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4BE1091DA1;
 Fri, 28 Jan 2022 18:37:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0AFF77462;
 Fri, 28 Jan 2022 18:37:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] multifd: Rename pages_used to normal_pages
Date: Fri, 28 Jan 2022 19:30:14 +0100
Message-Id: <20220128183033.31998-18-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
X-TUID: zLvmeOeMfR/C

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

