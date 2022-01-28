Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp549816lfk;
        Fri, 28 Jan 2022 10:36:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAsf/Z5XWmKJJlAFOTLO7cDNR6iFKX9Q7t8+kOlnxmrgl81wpnpzl/25+O87LRLlj4aiRV
X-Received: by 2002:a05:622a:44c:: with SMTP id o12mr7073382qtx.212.1643394960717;
        Fri, 28 Jan 2022 10:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643394960; cv=none;
        d=google.com; s=arc-20160816;
        b=n8eL8rKeeo1gLBfRb4Q23HzGzCzB1xeCxpXAZOikbfVRHDirYPglHOA6lJ9/I2gM1t
         bKi/eW9LYZAi81JAWY1A7FWogTnGCDjU7/gPj0N97J610upU4OD45wmLWCR2vB+JpolY
         EWpUcjI6dC/oPQpRm906jnQdQCzm6ItKhD61ZHfVtJ7XDplVHAikXQHV8bsCcvrVioMD
         1iNkU0OtbGfeIO7PAzuP+BNzPqbk70wAQUu4tIhscGu20OPJmlfc6kjuiGXoMgi0o698
         7iIXfiDJBR4QfEEzua3jXk82kek/WapqmgDuOY2uPe9DulL4Yt38XHtv9ZWGlYrnEu4x
         4i7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5o5+Uy+nSbU+g6blyt47oDcPek9P+sPcAYJJ1/b41c0=;
        b=tX3fH5jS4ANhhGfLYWsAYpAWKGPm6LT3cCSBSC5zlktUyEKdiPSXpqbz1MesYrVUR+
         SucDFT1xZvRHI6w9x/auJyqDpbVlXP8mzMd9yBTGVnbhWx2JytSyDGclqEJC2bO6/veQ
         amull8al2HJQXkotrFATx+olRb+KSdhk8iFCxI5mA3Lz4FsPwtWXbr5jFQKCf/K3P6Bk
         WCa309wmkIU1ZYkWC0/z1d37lzI/+Ci5o3LY4JzP6BBT1xVGL/l/MbpIDFzSAEvaP6Br
         9pk5BI5WB3vROf6hBM+JaGyBMVac9px2B643HmrrqDVx0rQ6mUZRZUoavp2/4MK+r9Bc
         IIJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IzEH+R2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si3834153qkn.278.2022.01.28.10.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 10:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IzEH+R2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDW6I-00064v-9Z
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 13:35:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW52-00061U-II
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:34:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW50-00011d-Cj
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o5+Uy+nSbU+g6blyt47oDcPek9P+sPcAYJJ1/b41c0=;
 b=IzEH+R2kxqgrmq7+TZ2iWLwaRfoii+2ZfUysU7GqSihi0+d27BUv1CsSYPetjnyJafTXgz
 6mhGCvw+iDXMGzCegBIlvVn6+OgkQwGHByUu6gFn9ZYRzrnv+mrK8VzI7zr6uMMFVGpq2u
 /lhdrq1PK6dhNmvp2DfEtomuetFMpaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-UsE-1SVuNyKpvARn1oZQnQ-1; Fri, 28 Jan 2022 13:34:34 -0500
X-MC-Unique: UsE-1SVuNyKpvARn1oZQnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3380410247B3;
 Fri, 28 Jan 2022 18:34:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65CB077456;
 Fri, 28 Jan 2022 18:34:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/36] migration: Remove masking for compression
Date: Fri, 28 Jan 2022 19:30:01 +0100
Message-Id: <20220128183033.31998-5-quintela@redhat.com>
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
X-TUID: N6bproCCX/+Q

Remove the mask in the call to ram_release_pages().  Nothing else does
it, and if the offset has that bits set, we have a lot of trouble.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 881fe4974e..fa49d22e69 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1340,7 +1340,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf)
 {
     RAMState *rs = ram_state;
-    uint8_t *p = block->host + (offset & TARGET_PAGE_MASK);
+    uint8_t *p = block->host + offset;
     bool zero_page = false;
     int ret;
 
@@ -1365,7 +1365,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     }
 
 exit:
-    ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);
+    ram_release_page(block->idstr, offset);
     return zero_page;
 }
 
-- 
2.34.1

