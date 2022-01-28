Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1033780qvl;
        Fri, 28 Jan 2022 11:17:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycELp+kj3pND5qQYo+Osg6v0DedWD5JCmTG7AQzHT7R9piGOuQ6oLgAD1hT6xGEb9ki1aE
X-Received: by 2002:a25:4108:: with SMTP id o8mr14719618yba.426.1643397468558;
        Fri, 28 Jan 2022 11:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643397468; cv=none;
        d=google.com; s=arc-20160816;
        b=qv+Mpi1qz/GR8clLvZeqnVCuD+6l7M2s8tJkTft+Vu58hkFwPU/hyxkykWLHPbU6sv
         RseLvg9d4GJwbi2W9Cx0njHTWsWYklujohO53rkHm986HrBiad7LQz3YCGVlvVdBMtn1
         lF/clEUh7qSCfJ4nez6gciAb4yEYoDOtmdWaDOjTYmp6c/kB6lZnZyVWODO729RfSF4p
         VHiuY2hERAiLNnlcnhco6CDk2p06XlyybJIDWotBs0XgCP8bzpKDoq91f6wJZumPtzpK
         3E3mQxptQzwT0wqnoYOqR3n5ggh6OexmvXdl0UqPrgSJBiXMpH/M7V/zeGcXbpvRuH9X
         lSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hE2kigmqsLGNbYQ+L1kwrW1aVo1Qr7jSwGoqehKP/b8=;
        b=YWKMN7tx2NghJRYj8oiDqk5VImzqHJMOIVLuC2tKoYQykvwV3VYgN4/qA+oSy074Ue
         /ug9Lza0chMqRINlXhI7hDA44vvaT6Vx8qWBMc/ST8LsvNMs9Rg9tBoR4uNUKuGYOvGY
         5lbMI6DM4mmkf+g290z0D/ElncAgkhNPOYj4uSZsVKbfIWGec7ifh1iBeKmaH8m0d/Kh
         eBWjTgMUurX5515G6JkfzwwDl4BDaybvat2dZJOUGdVT+7xbR9TH63CHSNl53aIcrBFe
         +w0H+I90X/50hIKY13anoW2m2/4ak5I372NU9BGhytehB+bWZvqqfe97HhpFMRw+K0lT
         aTQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VsBwvd3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si24050234ybs.127.2022.01.28.11.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VsBwvd3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWkl-0007AZ-6r
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCt-0001w2-9z
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCX-0002QX-AF
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hE2kigmqsLGNbYQ+L1kwrW1aVo1Qr7jSwGoqehKP/b8=;
 b=VsBwvd3REq4W06wFeUcObHOPuzJMycFEibc1YQ0jS81k5kV2nCtHiz3gkFEi60KzXXmI5c
 8T4r7Y8+8a8BM8Nj85zFbaGl6albmM8L5RpJgClTPVjOh3I1/SV965Y3/Onsyv2GRMs2ub
 /v/bHqnN5gHYaFp6JORYBTfzw+h6rBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-xc3CMPNYNoOh9ey7OmlowQ-1; Fri, 28 Jan 2022 13:41:20 -0500
X-MC-Unique: xc3CMPNYNoOh9ey7OmlowQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEEA119251A1;
 Fri, 28 Jan 2022 18:41:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225D812E25;
 Fri, 28 Jan 2022 18:40:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/36] migration: Don't return for
 postcopy_send_discard_bm_ram()
Date: Fri, 28 Jan 2022 19:30:26 +0100
Message-Id: <20220128183033.31998-30-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jHEOs1i7kE5i

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

