Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp588329lfk;
        Fri, 28 Jan 2022 11:49:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCiHKtAF2Sh0KYb5UDdi1qA0cMaP+rS6zckSzZsID8Nh+jKXnGlkfHJBw8D1/VFkuSW6Nb
X-Received: by 2002:a05:6e02:1561:: with SMTP id k1mr7450582ilu.146.1643399384035;
        Fri, 28 Jan 2022 11:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643399384; cv=none;
        d=google.com; s=arc-20160816;
        b=vr1z5s4pClZ0CKxcsvisENaraM7ZUfbIfjlRsWy+SCSeBE/9ngteIhYKpBlLeKTfY7
         LIFZ2GFrbJZ7NW1Y9YNSd+bkG9AUWlNMGD3rJLejC1TKfDw+LtVin2KLwMtobBaQ01UC
         BR6qFFFnUHqrKSx0TksJLxz8oRqmThGR6If9zccTpIHqY8UdAngOQ/HyTHmnzYKCb5LZ
         cT7M53WKX0PN0kdoJGTKObjzDMEjAzUmrpY+vBvkJKe46EbxrB/Yj8dtI/YrIp4dUFnU
         SlGbpFKl98T3Tyo9UI4XXB64oq3siOyBBm7bBRoc/pa3J3qDrk7pso/qD6+I9wwTwmAv
         tNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DUtLJ3E/Ba4f1f0VyVY15aJnRzdGGlTSP4JV0rpYGRw=;
        b=JM8xYob9vBnbdzad7BmZLISZloHI53AsMMNrdn+PBt2NiAo56Jvs9c+5IPsiP1kzav
         exHMUWilQpL9Pwj6h9gpkZizgITw9GyU9F42yIcSNR+UV4CLmM6akrGWF7j1fhPsg5CN
         ni6nCQ+e81Ai83SVJQceb+DLhewOxa7JKHJxY49cDcUpztJgLxIUitRorahnsUT1/Tmy
         ngq+8xIbAOEb/qi2Hw7dac8Oc5LRTA/ypHVHSdWS6D0rNfSJfN54V/4ByisfLqv4PwDn
         4z69SUydPXHMutNi7axZ5QNHVRAvoT7GHLNJoT8ERaZdh8/YifRHoQlm2IHwpk3qK+qj
         lruQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Q1UXYS/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si4302675ila.105.2022.01.28.11.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Q1UXYS/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDXFf-0004tt-Cv
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW8w-00015x-DA
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW8h-0001ou-GO
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUtLJ3E/Ba4f1f0VyVY15aJnRzdGGlTSP4JV0rpYGRw=;
 b=Q1UXYS/6gKXyLo6A14Y2TijTqK+Vhh6gGfRgSPLip7TlfDnOTghD3RY3cOQrY0KTCZfcE/
 a5j695km3v3HAyjbcumapqNA8KB+RKIYB0GkfMD+bMeOWnXg8kHC07q0mzOL+d0SrFAcmu
 czdUr3n1cLb5z7cVNQpm/O5zqfUOUQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-0wdi2zUuM8i51xAhb9vHxQ-1; Fri, 28 Jan 2022 13:38:10 -0500
X-MC-Unique: 0wdi2zUuM8i51xAhb9vHxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 101D394DC6;
 Fri, 28 Jan 2022 18:38:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F9612E25;
 Fri, 28 Jan 2022 18:37:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] migration: Report the error returned when
 save_live_iterate fails
Date: Fri, 28 Jan 2022 19:30:19 +0100
Message-Id: <20220128183033.31998-23-quintela@redhat.com>
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
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TpiOVeuS2p2Q

From: David Edmondson <david.edmondson@oracle.com>

Should qemu_savevm_state_iterate() encounter a failure when calling a
particular save_live_iterate function, report the error code returned
by the function.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031acb..1599b02fbc 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1298,8 +1298,9 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         save_section_footer(f, se);
 
         if (ret < 0) {
-            error_report("failed to save SaveStateEntry with id(name): %d(%s)",
-                         se->section_id, se->idstr);
+            error_report("failed to save SaveStateEntry with id(name): "
+                         "%d(%s): %d",
+                         se->section_id, se->idstr, ret);
             qemu_file_set_error(f, ret);
         }
         if (ret <= 0) {
-- 
2.34.1

