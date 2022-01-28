Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp563407lfk;
        Fri, 28 Jan 2022 11:02:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypVr/MLsu+tnc5jTn+N1NdjR6b8C4L8S+94U2CJKO/oLQw+a5GHldsdnJoHBG88zar8vaj
X-Received: by 2002:a05:6214:19ed:: with SMTP id q13mr8521511qvc.58.1643396530507;
        Fri, 28 Jan 2022 11:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643396530; cv=none;
        d=google.com; s=arc-20160816;
        b=K69wQcEcqd5jqAPWi15X7eEcqmZy5gYAuwonZNSX8TQoy/yT3LJl2Qyiu/f74u7nMB
         0/AAsjsG0mEgW0QyI0xgjxSD5XbgsGw7uz3kmdOJ9oEfwkfOxryWIrUHjx3yFOkWHuVh
         Ghxoq6PAtk2Vj0U5ykAVeJbGfE19Si3O5afnfuZIhaHYbETQytfsCJ1rFjqlR2gZWCZ8
         /k3oeqBojwAZcKHp0vK7ZPcSZHrYA5XUC7v8HmeoPnc2L008ApK5zymt+cSr9oOMG/WI
         89e25JqrPrBpqTiuzGggmwA0Vx16LcSyU3hz50F77lnUjO2jvM4pHXrcyg4pztufG0GZ
         L9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fELfIA00+SijfBjO6U/Yi8hSZd55Ja0ZvrfarrPVN6A=;
        b=g59LF5YX3uoOjt2K1u7O1MIFzj7OiDeJ/+tgPFyFC8sruuYxsmLANk76KCFW4QCrbL
         CMoSH5FmZu12sOu4/xU1Y5NZPJXUEvSjW396AbCtpgrt8jlw09KBZAnd1faXBHNfXBnz
         0DTu3HbI7d+6N6tx/2goZyr2i/OYz7PncBtC0gdItt3N/l0LDwTKhdWZX0A2+7VlulgT
         kxhlgnD4lGMV0v50ZpeWcTskrsuexG6eh94EHaNSq53gxnn0n5uHwL9YMNtZa9VU+2Xz
         oCKp0MnDelxcCPLBzNG1xGvdUbSBXwHL6ioAV3SzvvBBVsWs+KCzHI+YsbGulMzHSIiy
         6+PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TTeyARRH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si12330520qtz.570.2022.01.28.11.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:02:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TTeyARRH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWVd-0006Nx-JY
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:02:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW8O-0000nU-9x
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:38:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW8F-0001mA-Ft
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fELfIA00+SijfBjO6U/Yi8hSZd55Ja0ZvrfarrPVN6A=;
 b=TTeyARRHqdrv80vE7NovbyVG8nFV/6/9qd+IIz1ToQgDop8chJ92F9yMlsWXXzynt9Uq0W
 RE39PHHJXcGX72Wp4S1eAGYO9xNLPHOcGBMO2/T+Hf6AHh7/MrINGN71BoIMV6NY6S2n0x
 sGDZ590a1qCRalsf4NUVNFNBAeREypc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-5eB-jDByONGEhIpS8DCYpg-1; Fri, 28 Jan 2022 13:37:47 -0500
X-MC-Unique: 5eB-jDByONGEhIpS8DCYpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 906A3100CD02;
 Fri, 28 Jan 2022 18:37:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7A977456;
 Fri, 28 Jan 2022 18:37:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/36] migration/migration.c: Add missed default error handler
 for migration state
Date: Fri, 28 Jan 2022 19:30:16 +0100
Message-Id: <20220128183033.31998-20-quintela@redhat.com>
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
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Zhang Chen <chen.zhang@intel.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KATL3MOjWo8n

From: Zhang Chen <chen.zhang@intel.com>

In the migration_completion() no other status is expected, for
example MIGRATION_STATUS_CANCELLING, MIGRATION_STATUS_CANCELLED, etc.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0652165610..2afa77da03 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3205,7 +3205,7 @@ static void migration_completion(MigrationState *s)
         qemu_mutex_unlock_iothread();
 
         trace_migration_completion_postcopy_end_after_complete();
-    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
+    } else {
         goto fail;
     }
 
-- 
2.34.1

