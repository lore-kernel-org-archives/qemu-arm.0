Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1024830qvl;
        Fri, 28 Jan 2022 11:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLy84DfOYcJ15pKTITnUDu87rbvReDqaOCQ8Dvz2qdLr3YUQBE6nqIZl14uh7O0h/n/BCI
X-Received: by 2002:a05:6214:e8c:: with SMTP id hf12mr8634759qvb.48.1643396664689;
        Fri, 28 Jan 2022 11:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643396664; cv=none;
        d=google.com; s=arc-20160816;
        b=ni0fBzNkefnVNFfUaOgZADf1zUb2j5VyoWLZ/A/S1WtlBYnYvKW1r2Ydxafp8bbWIp
         /uLYPUTJS+NYbuJkkFbhF1tXhfj2KViGv7D+6FQEPc6H5VHegIZV8iDZyGU+jSgjSi8f
         N8x766gXtHWcKE6KBJFGxxDNYmSJ6kNhetAC077OdzHif4SNAfKXvNLBm6XB3FaRUjc9
         2uC+aA4ZT33KXjzcWQwGQL+AB5LGJmgg4IyaMD2nrpLeBiQoPL6rIA0zNN1DELvrJi1I
         RktlnIyOz1Sw2UP89G+YY14z+Gcw5GYAAbNEXf1PXkh/vf1QkcLKEhlSAd4EVtD0YMAp
         LWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ne+AnRV+/8FiQY8PQ0j8bn06mRqfAQEOP3LFhuiF/pQ=;
        b=KG4pzowQZugnopc8Dmz8fe8V7brytZfO8CiaZX8brKpsihcSyyc4yZzwjJrqwtHFU7
         IUWBKCirA4oQS9/Z947cGtJq5gvSJdOUgSIoRDxVtJHbqPfSbVY7DJ8mQ+cALSKrhOyr
         ybe8EeUYyRC2q2RK/Jon1fmIFXSxLrR8yBXqVO2TnqW3Rn6o9wOyCcEVoNRyMfIcz4FT
         S1635z+moN46iXGpgBvwS0BGMZkFx/SYhZNaT10jpgBSXKre8qtPdvoIMtT/Cmh5CIJV
         G5sGE0vC1D/IAkJlj1tGTNlX34mNv9XyxPC0qB0vqxj1+UgI6lDMm/xnv2u3VhI1xnXG
         Q5GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hw3NSxx6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv14si2392353qvb.84.2022.01.28.11.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hw3NSxx6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWXm-0001N1-Oh
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:04:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6W-0007NJ-7z
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6O-0001KX-QR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ne+AnRV+/8FiQY8PQ0j8bn06mRqfAQEOP3LFhuiF/pQ=;
 b=Hw3NSxx6JeODvbD5V8+RqoCCohIj0aR8GXmgyt7EFmQnH2YW3IPspJRhoiiqpbcErgYm+Q
 E8v+Uzzno/HKocM9uFqwLomCfMNCP1gPoI4mxiR8NTq7ajfFiCOQcknzlEuLaiB4u9oZJ9
 MR5Ywq2xo2vsZ39aSSiEYd1S1TYQaDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-d4u0Zks-PdiBRpxPn5uWtw-1; Fri, 28 Jan 2022 13:35:17 -0500
X-MC-Unique: d4u0Zks-PdiBRpxPn5uWtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6776910247B5;
 Fri, 28 Jan 2022 18:35:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A65E577462;
 Fri, 28 Jan 2022 18:35:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/36] multifd: Make zstd use iov's
Date: Fri, 28 Jan 2022 19:30:07 +0100
Message-Id: <20220128183033.31998-11-quintela@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
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
X-TUID: 7ITsQxmB5Xl7

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zstd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 97c08367d0..bd393aee0d 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -154,6 +154,9 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
             return -1;
         }
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = z->out.pos;
+    p->iovs_num++;
     p->next_packet_size = z->out.pos;
     p->flags |= MULTIFD_FLAG_ZSTD;
 
@@ -173,10 +176,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zstd_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.34.1

