Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4168550lfk;
        Thu, 27 Jan 2022 07:21:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6vae9MRb9KP76LXIY+MUH3gZWgv3U1IuswdwOVWPBpphnCWqHkrfQJBMYPbIv9lX7O52d
X-Received: by 2002:a25:248f:: with SMTP id k137mr6385897ybk.562.1643296906583;
        Thu, 27 Jan 2022 07:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643296906; cv=none;
        d=google.com; s=arc-20160816;
        b=CUYMU6DKkw7oous2bo+zkpf8UVIN4IQdR9dBfW9vpWdqpXrwJb1Au+ZP2f37fly/EA
         7xd3jyY7CphK9rqeGrqkCzVfQQoXPh07Cs6TWiVx2c28lUl5s+cc6R3cWTLWL5T8i5tq
         0+VqPdsQTDdAmUQPb+9qEcDo78/Dd5AcUpMx6sdNa4fxOF3j8tnYjWMuvlLaDVuj8Kz2
         KAW32a+caDHQVo9XgF92W2D+0bDlj6EFOdAdgJn+QVGyeLtOIWMZADjeOIPeLuiYlEhf
         Bc9TvPDVJwu8sdmapJLbj1zP6CeHFHL6v+LvUWGly36ag6e1IDQUobUAMz/xwVDRBLSe
         e8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5o5+Uy+nSbU+g6blyt47oDcPek9P+sPcAYJJ1/b41c0=;
        b=H2h3FmboIew/hYxw7I2YyC6aGJveIIt3vo1mzc+qZNtN7LgeZBciqRldn1W61DsUzX
         qEm9GymNNeXcwtIuJfSrCRWXta3XS1cpskaR9/ZgwW0rlBXp/IzpW+j/I2xnre7zI8gY
         tfudzBhmFh+BxNYSSTN41PsjeqMJqi7ksokmnZy353/8DYJVi91B0wWllMZa6cg7qNHu
         mREb4cWQVAkG0vbcVYMvNjCq2aYm3ZE1TaaibqNQNC4leeomcaDI7DDIzXHptghgh+2W
         dWYXVnknJbC/PG8S/3rEVTp0R3fWVlrqrcjH7C74BAVpKUtehspx0Px6Wa2YCWeXacV0
         C9AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Irf0W0L2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si8449687ybj.65.2022.01.27.07.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Irf0W0L2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6an-0005vS-Vd
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:21:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Mt-0000kb-JV
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:07:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Me-0001l4-MR
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o5+Uy+nSbU+g6blyt47oDcPek9P+sPcAYJJ1/b41c0=;
 b=Irf0W0L2DCrj8ImO8mn6O4kEuCoL2Xwl84HHHvM0DtAN4rbA07MKrM3A24qvtg5iV5hXUl
 SaC8uIx1rWH8wC6NgwzFhLkNuNUeka12sAFi7YnWWp221++RKVQtRd+XCFjlqpz9b9x7PV
 EYbBrYT7ponUDe8IDuKcqR76sNauOhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-1QqxfU1XMvWYBuJhpxkU1g-1; Thu, 27 Jan 2022 10:07:04 -0500
X-MC-Unique: 1QqxfU1XMvWYBuJhpxkU1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B3151084;
 Thu, 27 Jan 2022 15:07:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F298C7E664;
 Thu, 27 Jan 2022 15:06:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/38] migration: Remove masking for compression
Date: Thu, 27 Jan 2022 16:05:14 +0100
Message-Id: <20220127150548.20595-5-quintela@redhat.com>
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
X-TUID: ZweHdJTyrioR

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

