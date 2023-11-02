Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp320262eja;
        Thu, 2 Nov 2023 04:41:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEJhn+sijekZh38IrE35AZomzkLMN+pjqiiCbxWzrQ8j8OYWGnweLH3+ViJfQ354Vw1O7S
X-Received: by 2002:a81:ed0b:0:b0:5a7:ccf3:7163 with SMTP id k11-20020a81ed0b000000b005a7ccf37163mr16474967ywm.15.1698925295590;
        Thu, 02 Nov 2023 04:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925295; cv=none;
        d=google.com; s=arc-20160816;
        b=zImdAedlpTalw4YiwFna53YI3HqZP8XAJPDNA7uhdXPraq1OX3wt9353Rqlf736fb6
         pl+IHbpHnep5YxIIrOg9Rkleado4O1ZFFnE13PEXbce1pRKiXYWSLjM7G7A6fOGYsTcD
         eUHS2C2OdeT5WfzBKiMGLxvxhiz4eAN+P0VTLa8soVNhz26XzCdTwJHO26RWOBmTUDGZ
         MokbXGfMDKAeHMioDFlMzcz2vYRSGEMDj/27wPrk3rvpeF8R/6lsKxqHBgXS2a6p+uAS
         KEZKTEHuBtjENp8KspBEdf8rmAJIv4N7jk+9AAR3zBa1symwjGfSp2c9PRXlFsnfL+hG
         Dkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aU/oAyiEYTQ199GlSYyGpGmZ5amU/+oK4ZEr9qSAJIo=;
        fh=T4EM+6jbLn5eRwObk7JR2S+dK3nM2HMDfFhJxfrmv8w=;
        b=is225hUXwNUMqwltnC/rr/b2xm+hMqMH/uqEkGI0u2eWI9WN5ot7CvShiHTXfBvKgA
         t/uQq5wl7rUiVU99QQO3P3Fmjlg/AuMuHvEJzeTvq4dCxwDvEv96bR5o9Dyw93NcOzIu
         Ee1Ke1DHLYw04Up0dSZ7j8hvNXhx4n3f157AbTUwQGygUIzk/AA3xY0H0nIuMbz367QY
         MECWmQ1K2zA0pIALHyfdsdhmuP//nRKV0Ps6k4+6opFosNFjKcZ3hQuD6PTMkWyKBwHI
         GGfSkX4OFhs1ddXDwdTZ/m6YeF6v6B9oRFHwKUOB4CrItW3ET11VXDG0f/PMuZjF2E9T
         nSuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JqY6+HcW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020ad44b6b000000b0065afaec84b5si4149480qvx.355.2023.11.02.04.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JqY6+HcW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW4q-00029m-Rk; Thu, 02 Nov 2023 07:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW4p-00027h-6I
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW4n-00048x-I6
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aU/oAyiEYTQ199GlSYyGpGmZ5amU/+oK4ZEr9qSAJIo=;
 b=JqY6+HcWgvAwaj3dXF8mXLmB11/abc9S83WdKvnDI1fJR1rVuyGEt32NNLzOeY4o5BN/og
 jBVaQ2h1OruuErlX5mQIiFtlw+Rt8JPiyGLGMgE7qQafNkauCvLAEug6+cliXw5LPv7fCr
 LP8JIFcySFZ7L/SIlRMNJPoKR9JY49Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-alZolWBdOYubRik3lIQ4Ag-1; Thu, 02 Nov 2023 07:41:20 -0400
X-MC-Unique: alZolWBdOYubRik3lIQ4Ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C806101A529;
 Thu,  2 Nov 2023 11:41:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B93D82026D4C;
 Thu,  2 Nov 2023 11:41:11 +0000 (UTC)
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
Subject: [PULL 02/40] hw/s390x/s390-skeys: Don't call register_savevm_live()
 during instance_init()
Date: Thu,  2 Nov 2023 12:40:16 +0100
Message-ID: <20231102114054.44360-3-quintela@redhat.com>
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
X-TUID: fUDsjdF/tZrl

From: Thomas Huth <thuth@redhat.com>

Since the instance_init() function immediately tries to set the
property to "true", the s390_skeys_set_migration_enabled() tries
to register a savevm handler during instance_init(). However,
instance_init() functions can be called multiple times, e.g. for
introspection of devices. That means multiple instances of devices
can be created during runtime (which is fine as long as they all
don't get realized, too), so the "Prevent double registration of
savevm handler" check in the s390_skeys_set_migration_enabled()
function does not work at all as expected (since there could be
more than one instance).

Thus we must not call register_savevm_live() from an instance_init()
function at all. Move this to the realize() function instead. This
way we can also get rid of the property getter and setter functions
completely, simplifying the code along the way quite a bit.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Acked-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020150554.664422-2-thuth@redhat.com>
---
 hw/s390x/s390-skeys.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 5024faf411..8f5159d85d 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/boards.h"
+#include "hw/qdev-properties.h"
 #include "hw/s390x/storage-keys.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
@@ -432,58 +433,39 @@ static int s390_storage_keys_load(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
-static inline bool s390_skeys_get_migration_enabled(Object *obj, Error **errp)
-{
-    S390SKeysState *ss = S390_SKEYS(obj);
-
-    return ss->migration_enabled;
-}
-
 static SaveVMHandlers savevm_s390_storage_keys = {
     .save_state = s390_storage_keys_save,
     .load_state = s390_storage_keys_load,
 };
 
-static inline void s390_skeys_set_migration_enabled(Object *obj, bool value,
-                                            Error **errp)
+static void s390_skeys_realize(DeviceState *dev, Error **errp)
 {
-    S390SKeysState *ss = S390_SKEYS(obj);
-
-    /* Prevent double registration of savevm handler */
-    if (ss->migration_enabled == value) {
-        return;
-    }
-
-    ss->migration_enabled = value;
+    S390SKeysState *ss = S390_SKEYS(dev);
 
     if (ss->migration_enabled) {
         register_savevm_live(TYPE_S390_SKEYS, 0, 1,
                              &savevm_s390_storage_keys, ss);
-    } else {
-        unregister_savevm(VMSTATE_IF(ss), TYPE_S390_SKEYS, ss);
     }
 }
 
-static void s390_skeys_instance_init(Object *obj)
-{
-    object_property_add_bool(obj, "migration-enabled",
-                             s390_skeys_get_migration_enabled,
-                             s390_skeys_set_migration_enabled);
-    object_property_set_bool(obj, "migration-enabled", true, NULL);
-}
+static Property s390_skeys_props[] = {
+    DEFINE_PROP_BOOL("migration-enabled", S390SKeysState, migration_enabled, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
 static void s390_skeys_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->hotpluggable = false;
+    dc->realize = s390_skeys_realize;
+    device_class_set_props(dc, s390_skeys_props);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo s390_skeys_info = {
     .name          = TYPE_S390_SKEYS,
     .parent        = TYPE_DEVICE,
-    .instance_init = s390_skeys_instance_init,
     .instance_size = sizeof(S390SKeysState),
     .class_init    = s390_skeys_class_init,
     .class_size    = sizeof(S390SKeysClass),
-- 
2.41.0

