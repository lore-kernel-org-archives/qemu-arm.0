Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4172562lfk;
        Thu, 27 Jan 2022 07:28:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqJuB56hgmPw+Mwwn9zws12yQP+E11p3xHTeeDoznSFg9jSeqvRvQN/p5IBJP00kwRan25
X-Received: by 2002:a05:6214:5293:: with SMTP id kj19mr3597134qvb.36.1643297288926;
        Thu, 27 Jan 2022 07:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643297288; cv=none;
        d=google.com; s=arc-20160816;
        b=nwDVViPMdR2lEGolaRPKgsOEah2C6hgYWwBAtHBvYlY/N81MosujzPKyeLNVSsXMlV
         p7QiGR9Lh/439/kYTvfZWFfHabwQrnzsvhioqXoAWjtvTs96Px8wB/MV2eYZtdgKmm1U
         t0Q6egJSvdw6nqB2Zk5pvdStej3LYKx4IMBoDWSBzq1C2kRbMh6psRq3TXmTtSRqnLT4
         M6MRMBPJKxH4FQYkDLvt+nxTpE8PRO+gAXILe4gyDyoEzfh6xMX4bSwaVZrYjXmwL7eW
         qmpQANxtOUsZaFf13na0np+/WH0V+JtH20+OCCYV5/70GYsK0nU5OI8aC58p3Y0hOhiZ
         N5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gTuNu9HO4jPGub59vmHdns8TqyGd7V+63Di/4oQVtOQ=;
        b=PZjtmkbvIC69d3Ok0SxaJf/ZVIZJS9zLgMrvdyCnUVGuQ8jrQ1qwjO/3bV0IJoEx9T
         2P5Z/MKeo2PGZMow6b6uRfzz5LuoRRc2QkWwRgqxS3S8HF3MxgfuND4DhEinbMtaoHQ9
         VePQsvElq4h285kUKIBimRjQffpWYPdQGheIG0f4HaG73hiDoztET7BFXG7DxNn0crQc
         NmaDHl/eas2/e9LDjqVbN4GtuMkiUPEhXFxi1bRsMRTzro3Di1OGc447rIRwvBkn3SyQ
         dMgWHLkB3QDvdZgmW5FIIRK88jqgeAO7ibMQhB7dyicPO1uohU1xxKGq963ODpNgpuXt
         7dYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d4oU08Gx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si2721127qtu.300.2022.01.27.07.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:28:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d4oU08Gx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6gy-0005ns-9U
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Na-0000tk-QW
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6NU-0001nB-Lu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTuNu9HO4jPGub59vmHdns8TqyGd7V+63Di/4oQVtOQ=;
 b=d4oU08GxcZND8SA9nS3njr8STeRrgoysd17Y0adm+IreiLkxuyQWDnsmvKr6vw0c0Wv4eK
 4GDGYkE/jBL2H5aMk1YLadeRi15Y79l2m6nzPWCD29d+mvVAFCLDwY83xGVWnxXVATo6vo
 uQZqfwbIi+NXpYYlCedypWgX+7F7H84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-K8IGDpG4MzqfQRa6zoUrng-1; Thu, 27 Jan 2022 10:07:33 -0500
X-MC-Unique: K8IGDpG4MzqfQRa6zoUrng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3F2151083;
 Thu, 27 Jan 2022 15:07:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F69F70D45;
 Thu, 27 Jan 2022 15:07:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/38] migration: simplify do_compress_ram_page
Date: Thu, 27 Jan 2022 16:05:15 +0100
Message-Id: <20220127150548.20595-6-quintela@redhat.com>
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
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LH78JOOgP39K

The goto is not needed at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fa49d22e69..422c6bce28 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 {
     RAMState *rs = ram_state;
     uint8_t *p = block->host + offset;
-    bool zero_page = false;
     int ret;
 
     if (save_zero_page_to_file(rs, f, block, offset)) {
-        zero_page = true;
-        goto exit;
+        ram_release_page(block->idstr, offset);
+        return true;
     }
 
     save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
@@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
-        return false;
     }
-
-exit:
-    ram_release_page(block->idstr, offset);
-    return zero_page;
+    return false;
 }
 
 static void
-- 
2.34.1

