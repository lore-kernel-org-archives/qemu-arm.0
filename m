Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321190eja;
        Thu, 2 Nov 2023 04:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEszIQXTZSVHLaYYoObnvgtwWNchNlHGKTYgCzHNrWVcHcWq3vyTSERFs4EtGGnP791bICO
X-Received: by 2002:a05:6870:364c:b0:1e9:dd4b:d0aa with SMTP id v12-20020a056870364c00b001e9dd4bd0aamr19303170oak.48.1698925406658;
        Thu, 02 Nov 2023 04:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925406; cv=none;
        d=google.com; s=arc-20160816;
        b=QTDzidN42xSUZIMg4ITtb4cOxZC/khiLFNOZHDx22xgWmccLJdNIaVK0yguGxQh7T/
         TVcaSgmIcDtmFQPBXzTILbfDcXV6tDsDo4Idw8PfMZ++Cfgb+DHZzwi/h9Qr5RI/hB6G
         +VlOgtCCzwrzFZNTwMhqAeAe2e+zYehwR4AxYhfBs1mfSE51/5wyT6fM6zCtVKjXwAp7
         yoH2u2ixMTKM9Yh9yAvEiE6Guy1lPw/DGnjPo9u7jxyALoGJBBwFMXDIbBw/VJTBbvrx
         XUfRWbwR5/GaUicwiQnhxOxWWhi5eJplZbXOXmqmoKIf53G2u5eDior7xz6kMb0CTfDq
         fl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+i4gOYlRP3baSzxDdi4/ElMwWEEFCZZG4FX0ANE5zQc=;
        fh=9XEyySFYRp6Olqe53+AU8I52EufRgt7BknvnnkPQpGA=;
        b=ty16duFuJ7FCKXEtE6Oka4yfr1DU0HeMw2yKI/GZOFs6YMa97R6mCMIdri1iJGC6wc
         HGEFmtgr7qLlecKFXiBL/u422n526PxsNsTp+P4t4xubgAkQgWhGhq/s6gNnaUQyt32t
         kGwwXJk173vul+TJekchG9RMBGgV450utqhsBm6EhC3YJbr0ZteO6kgwFL6p48ve8o3F
         Ff9DVNZEcMpLN02//yz++RQNK37uPrgaxMk8gwfIpOl1bYp4xWjHn/3Bm39vnGmHl61e
         z0unil2bp7wNghXKxNrJfQnA8gBGBJmfxnc2gngVbgJsUh2oQdouhGF94z+S09/gs2c8
         NBdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T8Rf/VY3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac87f4d000000b0040f3c2813e2si4164140qtk.166.2023.11.02.04.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T8Rf/VY3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyW63-0003bJ-R2; Thu, 02 Nov 2023 07:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW5h-0002z8-8f
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW5c-0004cZ-Rv
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+i4gOYlRP3baSzxDdi4/ElMwWEEFCZZG4FX0ANE5zQc=;
 b=T8Rf/VY3O+o+ysdIk3SeKDtkyn0gTkL7YGce8EUF48oRPJzYa3J7VcCiII0SR1aTJghiTo
 wRKz9uJZtrgtN8Sp0BQWbtSV5JZFrek/YWkLnpdj3p51SvXGk9Ssdfy9/MSn4htMBmYJyS
 rsbhN88uDgBYj/EGfOVxB9zbkt7D2u0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-36bdSkhOMOuF18QYzJlr_g-1; Thu, 02 Nov 2023 07:42:06 -0400
X-MC-Unique: 36bdSkhOMOuF18QYzJlr_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4FEA831526;
 Thu,  2 Nov 2023 11:42:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9330F2026D4C;
 Thu,  2 Nov 2023 11:41:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 08/40] migration: Use VMSTATE_INSTANCE_ID_ANY for slirp
Date: Thu,  2 Nov 2023 12:40:22 +0100
Message-ID: <20231102114054.44360-9-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0g1bjEkkboWB

Each user network conection create a new slirp instance.  We register
more than one slirp instance for number 0.

qemu-system-x86_64: -netdev user,id=hs1: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=slirp, instance_id=0x0
Broken pipe
../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020090731.28701-6-quintela@redhat.com>
---
 net/slirp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index c33b3e02e7..25b49c4526 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -46,6 +46,7 @@
 #include "qapi/qmp/qdict.h"
 #include "util.h"
 #include "migration/register.h"
+#include "migration/vmstate.h"
 #include "migration/qemu-file-types.h"
 
 static int get_str_sep(char *buf, int buf_size, const char **pp, int sep)
@@ -659,8 +660,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
      * specific version?
      */
     g_assert(slirp_state_version() == 4);
-    register_savevm_live("slirp", 0, slirp_state_version(),
-                         &savevm_slirp_state, s->slirp);
+    register_savevm_live("slirp", VMSTATE_INSTANCE_ID_ANY,
+                         slirp_state_version(), &savevm_slirp_state, s->slirp);
 
     s->poll_notifier.notify = net_slirp_poll_notify;
     main_loop_poll_add_notifier(&s->poll_notifier);
-- 
2.41.0

