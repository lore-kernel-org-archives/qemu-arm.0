Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp323908eja;
        Thu, 2 Nov 2023 04:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1Uskq/F4PLT5ic1qlzTUPtrE3bNQFGJFpkwpoF3ZvFrLIQa6853jEtWM0zERDSb8NHOEq
X-Received: by 2002:a67:c19d:0:b0:45b:ece:21f7 with SMTP id h29-20020a67c19d000000b0045b0ece21f7mr17390136vsj.14.1698925718436;
        Thu, 02 Nov 2023 04:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925718; cv=none;
        d=google.com; s=arc-20160816;
        b=oNUh3zA5nDHiSvBPMfnkzXNMA5/SP5kTcdz/VYvLaS/voo69nvSWMmqV5CsHZkrCbi
         lJS0k+qG5C/chzxnS8x1we/4VghSRWhx3OQA83tIVFEq51cneDCUPdeMzT2X2QkwkN2D
         GqyBw9dJT00cK9GAt/h1cq5YmGcOHogYf4HW3WR5C57oG6sH6bSWtjy8SoZsGF51epuj
         mEMVTNUDUOS3Tl50pGGhfIKVRUaJBesb2LDwTfR4htqpi0+HIj+lNHBACdKsnMgPHBV0
         6NwtXg7yIxQ8t74Yj0M/vaW18fi8nwj1o9UDANyHWwHndpUoIj3dVKPXi16aeT/TZmGo
         zwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rOgbHA1BGBj58uu94eNpRZUsMXvo3CpHBuS02YQfySg=;
        fh=ES/vJtI5J5RM9CDwQFbx/OtSpDk18PEyXjfn3CS+k7o=;
        b=nde74IFOJTO3oqvRHyTIEj2p2vnTUq3GRt7WGs9GZFymfxBz7GzECB4gIgfLrZjrAu
         x5HE1yNFTNIzwvVwENOKKbFoI5a8PnPC87NGsGPrzoF0vQph1+IIGSyNqmCDckdYP9MX
         Tc6v9d/8ck6qvj5wBfJgjTjRguA7qfJyYH1/YnfpOW/9DdNprtpTnKW5nwWYQpsaW6QL
         Eu+GM+l9wJdRAJ3InCv6t6fL+OF4ty5M3tsW1NKWwBt4qF4Q/oXTbZYPTOH4BEgoa9bz
         r3Nx6zepqLthp/sXdXkw0Tht6i62Od/SUc1ePEQriDHUEvofyVGzRd73vGsbKnPTjNrT
         mFFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MXRXHrbe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020a05622a048900b004179da82083si4374474qtx.681.2023.11.02.04.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MXRXHrbe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW9I-0008KM-2x; Thu, 02 Nov 2023 07:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8e-0007Kc-7D
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8Z-0006ba-05
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOgbHA1BGBj58uu94eNpRZUsMXvo3CpHBuS02YQfySg=;
 b=MXRXHrbeXZrcctqzXANle2vp2kixSl9/c1hWFrbeLshLLTFY5P/kHEVyP8HW7vtjkbn1vA
 tfNavcH7DhG0hvpARTKkanp9qQfwISsSOlgkJt6vhdomcAbW5bUYkHH6fyBdtjAWaglGp+
 LN2BOsJyZBSiuw1n1ZomABVtOm1ZAUM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-4wzCPPnkPxGTK9SHIo1x3A-1; Thu,
 02 Nov 2023 07:45:19 -0400
X-MC-Unique: 4wzCPPnkPxGTK9SHIo1x3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 300673C14908;
 Thu,  2 Nov 2023 11:45:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0AD32026D4C;
 Thu,  2 Nov 2023 11:45:10 +0000 (UTC)
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
Subject: [PULL 33/40] migration: convert rdma backend to accept MigrateAddress
Date: Thu,  2 Nov 2023 12:40:47 +0100
Message-ID: <20231102114054.44360-34-quintela@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ral7Q9wcHPQ+

From: Het Gala <het.gala@nutanix.com>

RDMA based transport backend for 'migrate'/'migrate-incoming' QAPIs
accept new wire protocol of MigrateAddress struct.

It is achived by parsing 'uri' string and storing migration parameters
required for RDMA connection into well defined InetSocketAddress struct.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231023182053.8711-7-farosas@suse.de>
---
 migration/rdma.h      |  6 ++++--
 migration/migration.c |  8 ++++----
 migration/rdma.c      | 33 +++++++++++----------------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/migration/rdma.h b/migration/rdma.h
index 30b15b4466..a8d27f33b8 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -14,15 +14,17 @@
  *
  */
 
+#include "qemu/sockets.h"
+
 #ifndef QEMU_MIGRATION_RDMA_H
 #define QEMU_MIGRATION_RDMA_H
 
 #include "exec/memory.h"
 
-void rdma_start_outgoing_migration(void *opaque, const char *host_port,
+void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *host_port,
                                    Error **errp);
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp);
+void rdma_start_incoming_migration(InetSocketAddress *host_port, Error **errp);
 
 /*
  * Constants used by rdma return codes
diff --git a/migration/migration.c b/migration/migration.c
index 846877135a..8c26672630 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -534,7 +534,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
             fd_start_incoming_migration(saddr->u.fd.str, errp);
         }
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
+    } else if (channel->transport == MIGRATION_ADDRESS_TYPE_RDMA) {
         if (migrate_compress()) {
             error_setg(errp, "RDMA and compression can't be used together");
             return;
@@ -547,7 +547,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
             error_setg(errp, "RDMA and multifd can't be used together");
             return;
         }
-        rdma_start_incoming_migration(p, errp);
+        rdma_start_incoming_migration(&channel->u.rdma, errp);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
         exec_start_incoming_migration(p, errp);
@@ -1935,8 +1935,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
             fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
         }
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
+    } else if (channel->transport == MIGRATION_ADDRESS_TYPE_RDMA) {
+        rdma_start_outgoing_migration(s, &channel->u.rdma, &local_err);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
         exec_start_outgoing_migration(s, p, &local_err);
diff --git a/migration/rdma.c b/migration/rdma.c
index 2938db4f64..6a29e53daf 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -289,7 +289,6 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
-    char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2431,9 +2430,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma->channel = NULL;
     }
     g_free(rdma->host);
-    g_free(rdma->host_port);
     rdma->host = NULL;
-    rdma->host_port = NULL;
 }
 
 
@@ -2723,28 +2720,16 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
     rdma_return_path->is_return_path = true;
 }
 
-static RDMAContext *qemu_rdma_data_init(const char *host_port, Error **errp)
+static RDMAContext *qemu_rdma_data_init(InetSocketAddress *saddr, Error **errp)
 {
     RDMAContext *rdma = NULL;
-    InetSocketAddress *addr;
 
     rdma = g_new0(RDMAContext, 1);
     rdma->current_index = -1;
     rdma->current_chunk = -1;
 
-    addr = g_new(InetSocketAddress, 1);
-    if (!inet_parse(addr, host_port, NULL)) {
-        rdma->port = atoi(addr->port);
-        rdma->host = g_strdup(addr->host);
-        rdma->host_port = g_strdup(host_port);
-    } else {
-        error_setg(errp, "RDMA ERROR: bad RDMA migration address '%s'",
-                   host_port);
-        g_free(rdma);
-        rdma = NULL;
-    }
-
-    qapi_free_InetSocketAddress(addr);
+    rdma->host = g_strdup(saddr->host);
+    rdma->port = atoi(saddr->port);
     return rdma;
 }
 
@@ -3353,6 +3338,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data_len = sizeof(cap),
                                          };
     RDMAContext *rdma_return_path = NULL;
+    g_autoptr(InetSocketAddress) isock = g_new0(InetSocketAddress, 1);
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret;
@@ -3367,13 +3353,16 @@ static int qemu_rdma_accept(RDMAContext *rdma)
         goto err_rdma_dest_wait;
     }
 
+    isock->host = rdma->host;
+    isock->port = g_strdup_printf("%d", rdma->port);
+
     /*
      * initialize the RDMAContext for return path for postcopy after first
      * connection request reached.
      */
     if ((migrate_postcopy() || migrate_return_path())
         && !rdma->is_return_path) {
-        rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
+        rdma_return_path = qemu_rdma_data_init(isock, NULL);
         if (rdma_return_path == NULL) {
             rdma_ack_cm_event(cm_event);
             goto err_rdma_dest_wait;
@@ -4074,7 +4063,8 @@ static void rdma_accept_incoming_migration(void *opaque)
     }
 }
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp)
+void rdma_start_incoming_migration(InetSocketAddress *host_port,
+                                   Error **errp)
 {
     MigrationState *s = migrate_get_current();
     int ret;
@@ -4118,13 +4108,12 @@ cleanup_rdma:
 err:
     if (rdma) {
         g_free(rdma->host);
-        g_free(rdma->host_port);
     }
     g_free(rdma);
 }
 
 void rdma_start_outgoing_migration(void *opaque,
-                            const char *host_port, Error **errp)
+                            InetSocketAddress *host_port, Error **errp)
 {
     MigrationState *s = opaque;
     RDMAContext *rdma_return_path = NULL;
-- 
2.41.0

