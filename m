Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2043680ejb;
        Tue, 24 Oct 2023 06:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErdvZ0Jm+3TVqS33aBwqa20JwJd2g5t6UR7NHDjSrquOSbuRmHMFybtAtlNJ6rp6jsdnUQ
X-Received: by 2002:a05:622a:14c:b0:41a:b68:54d5 with SMTP id v12-20020a05622a014c00b0041a0b6854d5mr15985121qtw.0.1698153764445;
        Tue, 24 Oct 2023 06:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153764; cv=none;
        d=google.com; s=arc-20160816;
        b=dNt/2oU6+yxnb4bUOytyVte9EMkJkYIPGPyjSBZXGPLAoGb3iz37IB2f53jubXN3cF
         bohVquXen7BNVq7/LuaHhvntNyP1nMZfFQXOOAmFlXk5IM4F2mpfkQOJ0BM0UM22GEkt
         cmsCGUpijD3yHhORu3KfCW4QEz8covKRzYSaLNXtZnMNXdYCZ9knIJvah7/BWVDLl1WW
         lTgG6zy34+yKDpHtu2skKsuDQwxx/o0u7TDcG77tPZUdpuQIDRJXV8HTTLkH6y0e4+NH
         Eguu5nigIYLIux99YrMxmfvKuEGdDcdov262+Qx+q+BlsfFGBGbVe5GYRrXr7cleYX+x
         SYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+i4gOYlRP3baSzxDdi4/ElMwWEEFCZZG4FX0ANE5zQc=;
        fh=opDjDdl13S8XzsjQawtiYU7uNvQllAuUSK4RvD1fxCk=;
        b=w/w9TyQOjPmyxQxPFLzfBZhXMEr/+mR8pEx8HsgkEY74RE4FsgnHWXm6PwtEc9Xv1e
         MEqEyMikcoZ5kXy16aqpufhsrNIkgF6BXBS0SuwTGDvNT842DVQlxQSp0/pDmCVP55s6
         TXEAsszOzHaASaZaZmlfG+VjKfF8fSOsjzcT+FM4NmnUYDuP39i+82mm2yFeb+1NMoFa
         A/kFn6uKbap2Re8wwSC5v13FSXEgfPafYIkoMGWxLUSd4k9VmhMsN2bVRCKYyN7ywdZH
         ZCvhpxbUugCuqvlPINPMdVcLYp1uZNkDQ5eloO4EXiyGLCQi+8nKMP1cGhKCL/LBspNE
         b/tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qr1HzHXE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05622a100300b004197d6eff80si6966081qte.588.2023.10.24.06.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qr1HzHXE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvHK2-0001Gv-Aa; Tue, 24 Oct 2023 09:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHHa-0004tb-TP
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHHW-00028Y-At
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+i4gOYlRP3baSzxDdi4/ElMwWEEFCZZG4FX0ANE5zQc=;
 b=Qr1HzHXEqjbE9btMWZ3Cryve0bmcj8Z7r0RdJM5CMNJb+qlB8ga3bxLpC9w1lhEs5dD+1K
 dumtsEvp3tIvK2Nh1ql1RYGPdhRLZTU1ahE5BQqrbHiK44eBSamrUFDNGjLyVaa8QKqrff
 0rQxfpONTOZcJdBESYO7Rshz+YYMkqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-BCIgGP1kOd23zR9gj1lw-Q-1; Tue, 24 Oct 2023 09:16:27 -0400
X-MC-Unique: BCIgGP1kOd23zR9gj1lw-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CBC811E94;
 Tue, 24 Oct 2023 13:16:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ADBB1C060AE;
 Tue, 24 Oct 2023 13:16:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 28/39] migration: Use VMSTATE_INSTANCE_ID_ANY for slirp
Date: Tue, 24 Oct 2023 15:12:54 +0200
Message-ID: <20231024131305.87468-29-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GhfVqKtlzyou

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

