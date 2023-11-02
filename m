Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp327818eja;
        Thu, 2 Nov 2023 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOvbBet8TV1Tbg+LMk8Yfdcm+pnyLZC7lL3uOUpUN9rJf3I5bMEH6yEITQV/7/E3iXNo8p
X-Received: by 2002:ac2:5185:0:b0:503:7dd:7ebd with SMTP id u5-20020ac25185000000b0050307dd7ebdmr12148119lfi.24.1698926187874;
        Thu, 02 Nov 2023 04:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698926187; cv=none;
        d=google.com; s=arc-20160816;
        b=jG4/i/dTFmD7DHDeYpOcr+zKmHQfTrH0BvBM4dDse3US17Q0n+4rU4hBiybOMd4BIJ
         eubN0CSrBiQOqTzS90F8vZZiq1Y03VK1w/7EmDaTla7yAxWfV4vT/WmfKm4DGh86vCbb
         mE8rZ6/XmS4IiwIqpw1L25JIlkPGwlRLSMGQX3cNDml8TPVLDH+zvGzbqoaM0Xm27EvC
         hh5JRGsvp1N8GPt2OkGTT3DXWNKPLDZBHFE9CsJAp8/zm2z+oj4Hd9DKaDRZTlugxEcK
         rNYY1ZLIc41ZNKtEOCu8QVtCaZyVPBikMTgyZdHabtQ1wnUeI3L1tBoaZMsqwo6OgCbs
         JkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yl0Cs6NY1VQbMa3jjRYU/J74F9V1nMKZ9OMcbMQ4+Fs=;
        fh=ES/vJtI5J5RM9CDwQFbx/OtSpDk18PEyXjfn3CS+k7o=;
        b=Y4s9yq3qqrokjmNetmk+YJl2gSKW5tCfMFdLmWpUb8gPo2xdCxwuEDarDERxTqShq5
         yCAuQS8xv/glgGW784quC3uDOfvK1DrEMTG2MwlOAiUpW/RQOpMI4mmW+busm14enbK4
         ds6VssTxlc5XHF/lqT2vb3wK8Psr6lDitgioZOKUWcG20TyV3PIdB/GUlP7ceRwh+5L7
         92AW+DPs6YkIEqFzkPEyAJnVotRuVNlWWC+BwZnpErlGVFxw63Rbhh6JYICfiEUFtc4Z
         nwvLE1poq8UEe0SvDneuQohjTc0gayG1rC5/OS/+fv+Sld8hCRXh5z8GuJmCsbOa/Pog
         qlsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YM6xTMtP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05600c384300b00407754470b4si1341776wmr.107.2023.11.02.04.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YM6xTMtP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW8X-00077e-H3; Thu, 02 Nov 2023 07:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8Q-0006su-9c
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8M-0006Vk-4n
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yl0Cs6NY1VQbMa3jjRYU/J74F9V1nMKZ9OMcbMQ4+Fs=;
 b=YM6xTMtP+4Qxo0VF5Cfx9fjcHUQzNBUYzsuBmyVfPueEt2DHrJoZA+wgeJpY2bavag9vg5
 48mSb0Q8sDmVuU3YT7W3Vjj3mQrTakuQO/tGA8UnOEU7QKWs3XGSvHl9pVgylfkw9U9WBC
 +GZWGAkGgQS7g6MgixOBVqVwNKDzd7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-8ZUhGCODNVqEZdHB7EOhmQ-1; Thu, 02 Nov 2023 07:45:04 -0400
X-MC-Unique: 8ZUhGCODNVqEZdHB7EOhmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 730A7101A550;
 Thu,  2 Nov 2023 11:45:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E88202026D4C;
 Thu,  2 Nov 2023 11:44:54 +0000 (UTC)
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
 Fam Zheng <fam@euphon.net>, Het Gala <het.gala@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PULL 31/40] migration: convert migration 'uri' into 'MigrateAddress'
Date: Thu,  2 Nov 2023 12:40:45 +0100
Message-ID: <20231102114054.44360-32-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F5pVOy8/YpJu

From: Het Gala <het.gala@nutanix.com>

This patch parses 'migrate' and 'migrate-incoming' QAPI's 'uri'
string containing migration connection related information
and stores them inside well defined 'MigrateAddress' struct.

Fabiano fixed for "file" transport.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231023182053.8711-4-farosas@suse.de>
Message-ID: <20231023182053.8711-5-farosas@suse.de>
---
 migration/exec.h      |  4 +++
 migration/file.h      |  1 +
 migration/exec.c      |  1 -
 migration/file.c      |  2 +-
 migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/migration/exec.h b/migration/exec.h
index b210ffde7a..736cd71028 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -19,6 +19,10 @@
 
 #ifndef QEMU_MIGRATION_EXEC_H
 #define QEMU_MIGRATION_EXEC_H
+
+#ifdef WIN32
+const char *exec_get_cmd_path(void);
+#endif
 void exec_start_incoming_migration(const char *host_port, Error **errp);
 
 void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
diff --git a/migration/file.h b/migration/file.h
index 90fa4849e0..3888a57105 100644
--- a/migration/file.h
+++ b/migration/file.h
@@ -11,4 +11,5 @@ void file_start_incoming_migration(const char *filename, Error **errp);
 
 void file_start_outgoing_migration(MigrationState *s, const char *filename,
                                    Error **errp);
+int file_parse_offset(char *filespec, uint64_t *offsetp, Error **errp);
 #endif
diff --git a/migration/exec.c b/migration/exec.c
index 2bf882bbe1..32f5143dfd 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -27,7 +27,6 @@
 #include "qemu/cutils.h"
 
 #ifdef WIN32
-const char *exec_get_cmd_path(void);
 const char *exec_get_cmd_path(void)
 {
     g_autofree char *detected_path = g_new(char, MAX_PATH);
diff --git a/migration/file.c b/migration/file.c
index cf5b1bf365..ec069ef329 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -19,7 +19,7 @@
 
 /* Remove the offset option from @filespec and return it in @offsetp. */
 
-static int file_parse_offset(char *filespec, uint64_t *offsetp, Error **errp)
+int file_parse_offset(char *filespec, uint64_t *offsetp, Error **errp)
 {
     char *option = strstr(filespec, OFFSET_OPTION);
     int ret;
diff --git a/migration/migration.c b/migration/migration.c
index ce9b7692ad..a1bace259e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -66,6 +66,7 @@
 #include "sysemu/qtest.h"
 #include "options.h"
 #include "sysemu/dirtylimit.h"
+#include "qemu/sockets.h"
 
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
@@ -453,9 +454,62 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+static bool migrate_uri_parse(const char *uri,
+                              MigrationAddress **channel,
+                              Error **errp)
+{
+    g_autoptr(MigrationAddress) addr = g_new0(MigrationAddress, 1);
+    SocketAddress *saddr = NULL;
+    InetSocketAddress *isock = &addr->u.rdma;
+    strList **tail = &addr->u.exec.args;
+
+    if (strstart(uri, "exec:", NULL)) {
+        addr->transport = MIGRATION_ADDRESS_TYPE_EXEC;
+#ifdef WIN32
+        QAPI_LIST_APPEND(tail, g_strdup(exec_get_cmd_path()));
+        QAPI_LIST_APPEND(tail, g_strdup("/c"));
+#else
+        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
+        QAPI_LIST_APPEND(tail, g_strdup("-c"));
+#endif
+        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
+    } else if (strstart(uri, "rdma:", NULL)) {
+        if (inet_parse(isock, uri + strlen("rdma:"), errp)) {
+            qapi_free_InetSocketAddress(isock);
+            return false;
+        }
+        addr->transport = MIGRATION_ADDRESS_TYPE_RDMA;
+    } else if (strstart(uri, "tcp:", NULL) ||
+                strstart(uri, "unix:", NULL) ||
+                strstart(uri, "vsock:", NULL) ||
+                strstart(uri, "fd:", NULL)) {
+        addr->transport = MIGRATION_ADDRESS_TYPE_SOCKET;
+        saddr = socket_parse(uri, errp);
+        if (!saddr) {
+            return false;
+        }
+        addr->u.socket.type = saddr->type;
+        addr->u.socket.u = saddr->u;
+    } else if (strstart(uri, "file:", NULL)) {
+        addr->transport = MIGRATION_ADDRESS_TYPE_FILE;
+        addr->u.file.filename = g_strdup(uri + strlen("file:"));
+        if (file_parse_offset(addr->u.file.filename, &addr->u.file.offset,
+                              errp)) {
+            return false;
+        }
+    } else {
+        error_setg(errp, "unknown migration protocol: %s", uri);
+        return false;
+    }
+
+    *channel = g_steal_pointer(&addr);
+    return true;
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
+    g_autoptr(MigrationAddress) channel = NULL;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     /* URI is not suitable for migration? */
@@ -463,6 +517,10 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         return;
     }
 
+    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
+        return;
+    }
+
     migrate_set_state(&mis->state, MIGRATION_STATUS_NONE,
                       MIGRATION_STATUS_SETUP);
 
@@ -1840,12 +1898,17 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
     const char *p = NULL;
+    g_autoptr(MigrationAddress) channel = NULL;
 
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
         return;
     }
 
+    if (!migrate_uri_parse(uri, &channel, errp)) {
+        return;
+    }
+
     resume_requested = has_resume && resume;
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          resume_requested, errp)) {
-- 
2.41.0

