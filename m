Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4190264lfk;
        Thu, 27 Jan 2022 07:57:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzacmF6Gmk2FZm+9P+Bhpb0PNxOfefa2OZHLE+/etRJbeV95g1G0Em9TGrnNpDBNiLrPfeV
X-Received: by 2002:a25:2d4a:: with SMTP id s10mr6987379ybe.178.1643299055274;
        Thu, 27 Jan 2022 07:57:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643299055; cv=none;
        d=google.com; s=arc-20160816;
        b=dwORYgrsnBcR4A1GyGUBYz9zFvpTfBglluaBafPrEg/1JuJdjLMJNwD2O9GbWdNrNT
         tuAVZJxUCb+wbrXykzqe+/xU3ngE7LJUlOD0nyjfgGanzqvmOhggyfiE8ODSj99S7qtZ
         aOJhSFpUAC0KsZ3raqn1qHUE1TjBEKc1mPUljYNcP97pmnzrFn0dpb/XTu+GOBBYF6Kq
         yaM85hQRn4VTILO7EBnETKriQUzWiUOD+SbY5oLZEXW0n5hhaqdIZ42lnU+0lf2JipWZ
         S+YKK1dTfL08y4x4lMo6HbrapYXfgeg0IFdiIKj3m/xLzdn+HyIZeXPakVv/Id9zZYvL
         ZQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fELfIA00+SijfBjO6U/Yi8hSZd55Ja0ZvrfarrPVN6A=;
        b=dOFWtQ7lSe+ZneERJ4FZaeuanDHSC7rulZIYZphiuhQD7z5sARpdr3GNmrwW9miJCC
         W2c7hok2iZdARFfl+FED2J9pDnYIoTrTEVrfSWYSsPIx+mpLNA+/QY4cOLHbmUVfEiAE
         +hU9Rv+DvEdTCn7Ik9PvoULmqEYiI91wdiAZsURzUgIcHWYa3/JpNHciuE/c4sMocsCA
         y14HHJ7iv1X0zEb6sMMPOCvQyswWSvdr24XgXyWZ9adUSzCSCRN3y7bdFfHoFfAvoPrV
         2NwIEw43LhTwYVhFmvXUiwIRFYKcx+xRoRhawA43gFLqaEPxoYSwuAigAQ8jbbn6xYIm
         4OTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TGp1XTww;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o131si22704676ybc.253.2022.01.27.07.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:57:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TGp1XTww;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD79S-0006Jg-Ls
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6UO-0007C8-Su
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6UM-00031E-3d
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fELfIA00+SijfBjO6U/Yi8hSZd55Ja0ZvrfarrPVN6A=;
 b=TGp1XTwwcYxnl0PEqmC78HPG+uyAosQ+wn1KhKhMBHki8rVX3jV2WPPFmR7TvGQ8GFpaNX
 J4UlHv6sgUmuHUfSwLpVfz/Piu+HdUpY4ucpAD5PPCq8Vcl+BKOuipL+72ANPHI+HUJI/L
 p/+2XSQd5kytXEWV0UaMNxHo/Zjt000=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-4sM3159xPnGFx_Ib8pDPvg-1; Thu, 27 Jan 2022 10:15:02 -0500
X-MC-Unique: 4sM3159xPnGFx_Ib8pDPvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B65101018720;
 Thu, 27 Jan 2022 15:14:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD56E70D2D;
 Thu, 27 Jan 2022 15:14:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/38] migration/migration.c: Add missed default error handler
 for migration state
Date: Thu, 27 Jan 2022 16:05:29 +0100
Message-Id: <20220127150548.20595-20-quintela@redhat.com>
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
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Zhang Chen <chen.zhang@intel.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pl+WARxt/33a

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

