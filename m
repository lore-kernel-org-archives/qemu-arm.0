Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp557487lfk;
        Fri, 28 Jan 2022 10:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8mmX5ry99wZzeYAUHQie+8wf0wj5WWsQqm+6PjbGM/VxMDH0/ZIA7e9T1eu3YyHP5ipKJ
X-Received: by 2002:a05:6902:120e:: with SMTP id s14mr14478790ybu.359.1643395861822;
        Fri, 28 Jan 2022 10:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643395861; cv=none;
        d=google.com; s=arc-20160816;
        b=cdpjJ7eUQI1rO//5BR9Y3VMyO/wVV/ypq+0WYA3r8u6zJrt9kqNbU/U4vgSRtjsuah
         TT4v2eExNqHznaTRBGYEMK5Y7bOIWNPe7ZP1W57jJZIA7QNyjbYXnWWyUtfPAiHMZPtA
         vhXff5fWbMNnSJZFJgwJzk7tgelVS+aa1DW4WpCgnLL//Kg4OhJwD9C4TF39ci4VgWW0
         /euAuJqREnPKX+S+IS9XDr5xKFhz6tZBS1j61WyspDz1roHvFivuhjj5GLztri1QYZel
         XLtH5yGXL4mQGidn9s1t2nnYsTP+Vfwg4DbNtzDlKUyeDHrgSU/+f3sbsr9HWEbuoIVm
         7ZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0CZMF9+tpdeRtWvtbyvdKiZL5iLIO8LIWlWaxsgFtQI=;
        b=RPaYqfnxujZuYInx7DFf96IgM24Aa8Hon8IofY03Qga4UmZ0cSD//GGQjbkJIdlhn4
         RYvpodRFhPXw88NS0eKZU+gmhfvWUb1yNe6tpMFloxFo8WR2JYPZ6+jHMgRXdbfOoUBw
         M7xD3hTwhuK0YXW+lAJ7exX9Lv66ZLUUkrLk1Izj4YVDcZTkHyL1CZRhNoT3M2IiIfoS
         seLztvcftoeWjWsCDh+LYLehOQWe2GbI+bn7NZtwSMlKXc0aQmEZHxL1RuD0Y+dJRaL0
         amtOEW54CtAQ2U5GP1fnm+gk6yXQOdmNLdUMF0FaBzur4BpD2BH7ZKASiRRLZ4rnkll4
         DZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IPyL2nKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e126si26580219yba.434.2022.01.28.10.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 10:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IPyL2nKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWKr-0004dU-20
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 13:51:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6V-0007Lc-Fl
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:36:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6M-0001OA-Nm
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CZMF9+tpdeRtWvtbyvdKiZL5iLIO8LIWlWaxsgFtQI=;
 b=IPyL2nKfzMHTn8yGsMFgUa80zj6ZcR5LxdxD7kinTygk7VUQgkFNNx20BFfY0aP3tcnG0R
 jIe2bAh1il19i8aTaCt/v9z7L5pXoYLZr9lj142ut1LWFwbmAVzbXV6P0CFLsZT/Ymac8+
 /f9NSD9x5iR1tLPYqd9CWtNWoxCa/qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-fS64lChHP4CiB-J8NN6UGA-1; Fri, 28 Jan 2022 13:35:31 -0500
X-MC-Unique: fS64lChHP4CiB-J8NN6UGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C946B63C76;
 Fri, 28 Jan 2022 18:35:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 140B077456;
 Fri, 28 Jan 2022 18:35:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] multifd: Use a single writev on the send side
Date: Fri, 28 Jan 2022 19:30:09 +0100
Message-Id: <20220128183033.31998-13-quintela@redhat.com>
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
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2j9sa8ZTshr

Until now, we wrote the packet header with write(), and the rest of the
pages with writev().  Just increase the size of the iovec and do a
single writev().

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 96b9cc0d8b..1d4885e1a0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -646,7 +646,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->iovs_num = 0;
+            p->iovs_num = 1;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
@@ -666,20 +666,15 @@ static void *multifd_send_thread(void *opaque)
             trace_multifd_send(p->id, packet_num, used, flags,
                                p->next_packet_size);
 
-            ret = qio_channel_write_all(p->c, (void *)p->packet,
-                                        p->packet_len, &local_err);
+            p->iov[0].iov_len = p->packet_len;
+            p->iov[0].iov_base = p->packet;
+
+            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
+                                         &local_err);
             if (ret != 0) {
                 break;
             }
 
-            if (used) {
-                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
-                                             &local_err);
-                if (ret != 0) {
-                    break;
-                }
-            }
-
             qemu_mutex_lock(&p->mutex);
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
@@ -916,7 +911,8 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
-        p->iov = g_new0(struct iovec, page_count);
+        /* We need one extra place for the packet header */
+        p->iov = g_new0(struct iovec, page_count + 1);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
-- 
2.34.1

