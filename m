Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp556628lfk;
        Fri, 28 Jan 2022 10:49:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx821jlkeTOhL/om1A1A4wBIcbXP3qiH6Uqn3O4oahkaLRL5se80Mqil9TkRM2SGTpblAOV
X-Received: by 2002:a6b:dd02:: with SMTP id f2mr6003556ioc.127.1643395760478;
        Fri, 28 Jan 2022 10:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643395760; cv=none;
        d=google.com; s=arc-20160816;
        b=zo4LxZS4l+0HDlKfuObksmLnlSJ0r1sf2zsUI7B590+6bJvOd7CsI5jOl9I9wOiQjY
         cFBtScnrXy4dRynBYSHjBLs1qbP1t1EWzJqpTd58Gn3Qejeoer5VMl3nLjv71TGElYr2
         0Rq6Y/Pp/cZ53v4Qh8N+67jImVbPjeAQUE21gqPsDy1xVW7LmuBZTi2/SSktO52d9n+G
         xZhQo2IopsmUeOa6C3VEmxH5zH3WxKmHtBCXhNNl+/ZZ8xcP7CK6jCDu5LYRiL/f9EuG
         sJ6bSVdvqsChDqK8dK6+bZ1UWZs2jPOn85xjYL7p8UKJCf8x2VkiCCHMP60+CgjUNchx
         RYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bsKREreB4LgJFdMcSyHUcfhSCbtvvI69hXnQz2Aotak=;
        b=c08+90r94ygMZPFWHeGYKUw09XKjN4Q58f+QyLA+8OgIP/jPUUQf0VMbmZnPDpS0LX
         OnQRGWPHOSVqP7AlrqqwE0DFgzrWvrqOBRqlF8wOyGl+hkcCpwz1LvJikip21OKWqNoK
         MyXHIkxR7C2MIjfanmItdSN5qHZr6ps7ZImw8vLKRtnlD6ErnWqn8d1woCHZWKQPDSVX
         at6ikn+k8e9YVsx6+L2+fRnOh1KuXj3iRVemsxx7MjENkr8kgpiaUmGfmQ+c1Afm9IUu
         gjEAzQFjyjZHJhj/tIy1hbxjCl3Mm6V4kGGvBKWMHrLAOfmEm73strt6C3E4vUN+AgwS
         CRXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UmuPeXzu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j28si5690461ila.160.2022.01.28.10.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 10:49:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UmuPeXzu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWJC-0003qC-M2
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 13:49:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6T-0007Ep-0a
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:36:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6L-0001J7-7c
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsKREreB4LgJFdMcSyHUcfhSCbtvvI69hXnQz2Aotak=;
 b=UmuPeXzuuGu0Z+X3nULzyorI0dhVwi1FlLtgGnqVLF8XmeRopR3VSyQczXTGiywaLv8+vB
 ZOTWqeKY5XpV5E6lTfbRfqFj1gFgpt7LxVNolehmFOotvJnFivZNQHcnIOy9HR66hDgpvM
 OSIyF6/j9C2/9xxHA4qSq73rvkbq4+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202--1BV6RxBNb69LHY8LjrVqA-1; Fri, 28 Jan 2022 13:35:10 -0500
X-MC-Unique: -1BV6RxBNb69LHY8LjrVqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D4B18B613A;
 Fri, 28 Jan 2022 18:35:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83C1C77456;
 Fri, 28 Jan 2022 18:35:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/36] multifd: Make zlib use iov's
Date: Fri, 28 Jan 2022 19:30:06 +0100
Message-Id: <20220128183033.31998-10-quintela@redhat.com>
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
X-TUID: 6WK8xrttJ9PY

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zlib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index a2fec4d01d..71480c82bb 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -143,6 +143,9 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
         }
         out_size += available - zs->avail_out;
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = out_size;
+    p->iovs_num++;
     p->next_packet_size = out_size;
     p->flags |= MULTIFD_FLAG_ZLIB;
 
@@ -162,10 +165,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zlib_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.34.1

