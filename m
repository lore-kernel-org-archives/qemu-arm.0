Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321026eja;
        Thu, 2 Nov 2023 04:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW0kqZvgbg57KMH0Ah1scRTrF8sh0EMYHE1yqV2fEjWH0voXzS6AJpDXi1Z4RQdw7XMMlC
X-Received: by 2002:a54:4794:0:b0:3b2:dd03:12ff with SMTP id o20-20020a544794000000b003b2dd0312ffmr19551662oic.8.1698925389167;
        Thu, 02 Nov 2023 04:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925389; cv=none;
        d=google.com; s=arc-20160816;
        b=bOAReXMNUu3U3VdB0QzUPVSn9I6pVQ+cD0CA6qwzCoWwmA2dUx8ec6zc9FiojZQHwK
         wYcojSxJtMmQLgNsCydrLIPnKCCbksQINECQWmQPucaCZvaNDz38nsg80WracBWm43Uy
         PVkjzq/8+29pw712A4JmbAQpsTxeQjBKTZhQtiM7FUievHnnF1jKQa8vRPM1snyVSs/Y
         5Th7wnTpH2GpkS3uOVWvd30KAOCeW7ANsp9rN1s91W72byF0zcPtsY5JZky0YhvmbyiF
         ftEUmKOP2TyUcdjtkT5aJT80qoYOTON4R2IxRHmUUvNIIS/A/Cgbt5XvYScu5+6+0s2f
         ZAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dTJsFVzWMxcTx8RaEnOML6rvjwsf9n7SjqNHr3G+kgQ=;
        fh=T4EM+6jbLn5eRwObk7JR2S+dK3nM2HMDfFhJxfrmv8w=;
        b=TvGfvHWF/hGZbd2lkhO84z8qSsJoChRFWi5gkoBxEoGwuQsGxiMssNZVxMYF0AW/IW
         xTXEhhCz3Tx/P8/D/QZq8wtTjWlxCw4qVTrW3ZvWr8j2i4i8lqeKe7pfhJA0+vBYuRmV
         rhXZCQKpSSdRWi6aO4UXg7HFJakvu0qNcDiHddrBO8WttOfRJBlXMkI/rJae7r9rkvoH
         iqh0qefm4zJ7cvMqEbhbmIbLWEmQ2n0jXliIVXi6W2f+NPxc1vsv9Jw9YBwUSrRiSd+x
         ZNC64I2Go1k5MG31Dz4PTKaxiCcovYYriKgzyYZPIPuJBYr83atrXfFx3exZqQirYGZ4
         sa+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BrQQ7Tgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a268800b00778916b8652si4458484qkp.536.2023.11.02.04.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BrQQ7Tgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW55-0002KJ-Gn; Thu, 02 Nov 2023 07:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW53-0002IZ-9q
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW51-0004GM-5j
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTJsFVzWMxcTx8RaEnOML6rvjwsf9n7SjqNHr3G+kgQ=;
 b=BrQQ7Tgkd8IUytXnlEOzItEsmpQb1QMn/K7T9p17HMCDI+i5UeyyrfwDoXfDR8VpikY0z7
 plkaMbqB3YILaLsa0EEf8aV1kBMexKSQJZrtgQTmP2YHERpdv6G6aU/qdjT5tODnTGUzYk
 KVx0inzONVLedaKdXZu89rtr/hPRmfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-ckeaTPGOO-eCpusz1XqLIg-1; Thu, 02 Nov 2023 07:41:36 -0400
X-MC-Unique: ckeaTPGOO-eCpusz1XqLIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48DEB185A782;
 Thu,  2 Nov 2023 11:41:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 171132026D4C;
 Thu,  2 Nov 2023 11:41:26 +0000 (UTC)
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
 Fam Zheng <fam@euphon.net>
Subject: [PULL 04/40] hw/s390x/s390-stattrib: Don't call
 register_savevm_live() during instance_init()
Date: Thu,  2 Nov 2023 12:40:18 +0100
Message-ID: <20231102114054.44360-5-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
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
X-TUID: mzBVGt3qlqKX

From: Thomas Huth <thuth@redhat.com>

We must not call register_savevm_live() from an instance_init() function
(since this could be called multiple times during device introspection).
Move this to the realize() function instead.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020150554.664422-4-thuth@redhat.com>
---
 hw/s390x/s390-stattrib.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 4f1ab57437..c483b62a9b 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -331,6 +331,17 @@ static const TypeInfo qemu_s390_stattrib_info = {
 
 /* Generic abstract object: */
 
+static SaveVMHandlers savevm_s390_stattrib_handlers = {
+    .save_setup = cmma_save_setup,
+    .save_live_iterate = cmma_save_iterate,
+    .save_live_complete_precopy = cmma_save_complete,
+    .state_pending_exact = cmma_state_pending,
+    .state_pending_estimate = cmma_state_pending,
+    .save_cleanup = cmma_save_cleanup,
+    .load_state = cmma_load,
+    .is_active = cmma_active,
+};
+
 static void s390_stattrib_realize(DeviceState *dev, Error **errp)
 {
     bool ambiguous = false;
@@ -338,7 +349,11 @@ static void s390_stattrib_realize(DeviceState *dev, Error **errp)
     object_resolve_path_type("", TYPE_S390_STATTRIB, &ambiguous);
     if (ambiguous) {
         error_setg(errp, "storage_attributes device already exists");
+        return;
     }
+
+    register_savevm_live(TYPE_S390_STATTRIB, 0, 0,
+                         &savevm_s390_stattrib_handlers, dev);
 }
 
 static Property s390_stattrib_props[] = {
@@ -356,24 +371,10 @@ static void s390_stattrib_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, s390_stattrib_props);
 }
 
-static SaveVMHandlers savevm_s390_stattrib_handlers = {
-    .save_setup = cmma_save_setup,
-    .save_live_iterate = cmma_save_iterate,
-    .save_live_complete_precopy = cmma_save_complete,
-    .state_pending_exact = cmma_state_pending,
-    .state_pending_estimate = cmma_state_pending,
-    .save_cleanup = cmma_save_cleanup,
-    .load_state = cmma_load,
-    .is_active = cmma_active,
-};
-
 static void s390_stattrib_instance_init(Object *obj)
 {
     S390StAttribState *sas = S390_STATTRIB(obj);
 
-    register_savevm_live(TYPE_S390_STATTRIB, 0, 0,
-                         &savevm_s390_stattrib_handlers, sas);
-
     sas->migration_cur_gfn = 0;
 }
 
-- 
2.41.0

