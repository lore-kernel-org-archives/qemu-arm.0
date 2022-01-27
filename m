Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4173924lfk;
        Thu, 27 Jan 2022 07:30:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUTPzq+raZ12IA9PaBejX3an2H34QoiFaapcoUNUWgpH9/xC9aLtJYYGNSD7MmWIRh3alN
X-Received: by 2002:a25:188a:: with SMTP id 132mr6880055yby.616.1643297400764;
        Thu, 27 Jan 2022 07:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643297400; cv=none;
        d=google.com; s=arc-20160816;
        b=oIn6VWTt8OORg4TyrHcVRPOEk93HEgvrvUpyLMU2QGsoGFRDorm/KzSxvWLhW/8zPq
         8iPz5UF1NCgaboT2GnvGpAERie4yDo4jIlw/6bWddnOgfzPVrQhBV2UAn0AJluMIN8aE
         nTW16Gkba3CLF0isUh00Ljg42uvw5mxPxkQlMdfr0HSbqcSI0S5s8yjqmESZLAuLBVhW
         HEQ4ox9S+lJ/xw/G69yZp9Zww7FJplM+3CR8pObL6UzqHhfqwz8Z3CIWIcoiupXDiptP
         BU3Sqxg4bGfnDsA/ov934heckkZzKfGyG21wMGTARKXiMWAbUyqG722x8pq08IYu3wkS
         4Aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0hmgBIgw2vpYhvjWSpFcJn/+tADW2pBvjmWQdqRJQYc=;
        b=zRG8Dvxl9iqFMt5+YRIE+Z3CCGuO4zDlcYiHMisAkQJCevg+cWH/dQxlOIPqDQR1VN
         3K0/KrPni/ZaBD3elb8myMPcjhSthFM0qhXYq+jlASne4EK7gzqxl7K9mi+8kObQuICy
         VGpCR/Nw2di/Lsml2WapSEco5LxHIENaXGRu/YH3n3ZntMKaNmA3w2QefDu2ErWnjbeb
         /AAOeb4Q+wCdwpOlpIXZpSbWAAeKb+E7DTuJd8/24ZqXTkUIIjQcI/3IK85KDhfQT+Kz
         FtcCKldnMtLC9u8bMdfH93wQsVRpWUNUR5X5q5ilh38M/i48chEg1qtWne8aUnXp+RoV
         xTIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MngCmIR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si8379684ybu.20.2022.01.27.07.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MngCmIR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6im-0000VW-6W
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:30:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Rb-0005Cs-3X
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6RY-0002WR-TJ
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hmgBIgw2vpYhvjWSpFcJn/+tADW2pBvjmWQdqRJQYc=;
 b=MngCmIR6hxOqblooRaBk+lm8OxhOS4r6rBhZ2SOeMSPIxqwNzQIpRP5edmA6qHAHqp2nu1
 F3dP9uhJVFmOqJPkfmsE/GbVAEOQa2C3FoNNvqhKkojLEhrnRvULRvGqjf+/rXHI6ulmB+
 B4tFP3QRFmoUqK2dzu9ZU5H3crTqT8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-_AblB7BWPOarLIbAnTpxhA-1; Thu, 27 Jan 2022 10:12:09 -0500
X-MC-Unique: _AblB7BWPOarLIbAnTpxhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E8886A060;
 Thu, 27 Jan 2022 15:12:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7561772FA2;
 Thu, 27 Jan 2022 15:11:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/38] multifd: Unfold "used" variable by its value
Date: Thu, 27 Jan 2022 16:05:23 +0100
Message-Id: <20220127150548.20595-14-quintela@redhat.com>
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
X-TUID: 56VmKN7+hhFV

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1d4885e1a0..e5b1fa5015 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1062,7 +1062,6 @@ static void *multifd_recv_thread(void *opaque)
     rcu_register_thread();
 
     while (true) {
-        uint32_t used;
         uint32_t flags;
 
         if (p->quit) {
@@ -1085,17 +1084,16 @@ static void *multifd_recv_thread(void *opaque)
             break;
         }
 
-        used = p->pages->num;
         flags = p->flags;
         /* recv methods don't know how to handle the SYNC flag */
         p->flags &= ~MULTIFD_FLAG_SYNC;
-        trace_multifd_recv(p->id, p->packet_num, used, flags,
+        trace_multifd_recv(p->id, p->packet_num, p->pages->num, flags,
                            p->next_packet_size);
         p->num_packets++;
-        p->num_pages += used;
+        p->num_pages += p->pages->num;
         qemu_mutex_unlock(&p->mutex);
 
-        if (used) {
+        if (p->pages->num) {
             ret = multifd_recv_state->ops->recv_pages(p, &local_err);
             if (ret != 0) {
                 break;
-- 
2.34.1

