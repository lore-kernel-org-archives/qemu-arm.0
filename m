Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2039455ejb;
        Tue, 24 Oct 2023 06:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXyYYGtwNRnqC25zHVlFva9p4eL+p0H1/dJp924+LhXGZqR9v4Q9A6LDcrgghqR3py7yRN
X-Received: by 2002:a05:620a:19a4:b0:775:ed1e:2b14 with SMTP id bm36-20020a05620a19a400b00775ed1e2b14mr13213392qkb.54.1698153384869;
        Tue, 24 Oct 2023 06:16:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153384; cv=none;
        d=google.com; s=arc-20160816;
        b=i+V3VH8S30aWr1PsFrt4L5z06lIvRxNgx5DRA3V8Rozmws6NMVjF8eBy1BsUHn59fk
         Hrd7jFQAzkaMFzp6BXMjZQjL0dv+ZJw0WYljiPLeN13Ec7bKLNwZjILR3f75iL7kKNrk
         YU1lCyCCc3J0cfm33PIgh6+ZBeCidzBRBlEU8KCZ/Y0i/VvgdW36iAo0tkeHiEukjb/z
         gSJDZxkhaXCv5Au9N2ithzRtZlTAVpFL/aLaIKgbamrHJcPWXC0QhQ+6FbC/2UnngK2A
         V2VNKaklWmNyQ+4JTWmRK/rn3RPEJ/ggk9jQPfN2ygXOg0KlLjGVEqCthypC4ucgvUid
         kH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kRcRfbT2KHPh4dyaHnHj8XBSylrBtYcV1bXrHlUD1tA=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=zYiIRghHkoz6bnijQzOvvlsLVr8vP/qEdRzKxfed0KiSC7fjZTtw2QoCEYVvxA9uko
         1+ebWu6Jt0fZxeyyLmE9LdfNkonwxCOjMgNfsnSgAi61xtyh/KG7OkIFjLg0XcNcw+18
         lT+iTapN2kW6hwd+gzTVd0mgyApi8rMjlynbIHQFqI9FTKnglX0aLCFlQomo2MCSNjPH
         mo10dCL44MkKawcPL5fkbGlSYMaAXcCc47nqXz/i6j9EAGAGC4x6Oa8A4Bu+M5Q5UoUs
         ZQ0zhDsK4DSUhY3DGhfkl8GjAhZOSXPdA9xkIaOkhXAyLiOwKMI0atq7ZHC2RYkEDfos
         OGbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G1MbACUO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26-20020a05620a091a00b007788b164320si6982599qkv.624.2023.10.24.06.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:16:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G1MbACUO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHFr-0000SG-QQ; Tue, 24 Oct 2023 09:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHFp-00008g-Gf
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHFn-0001iU-LZ
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRcRfbT2KHPh4dyaHnHj8XBSylrBtYcV1bXrHlUD1tA=;
 b=G1MbACUOCA0P2A9zvF50C2or1ygacvfggMRZbE9dWaYIy+5l2LmLgswG2wRUyFbpGAJfgS
 P1VGFV+vMwSLAs8v0Rlc+60RMr6eHbmyJs/iwl3KGv/lwcuvWoEyUAThILX4eiDpdPwiJw
 XTizkRCMGZ9rJzLKR8FdSpSx3Ec3stw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-wpyuCAPcN36idt4x8noRmw-1; Tue, 24 Oct 2023 09:15:23 -0400
X-MC-Unique: wpyuCAPcN36idt4x8noRmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D09373C1E9CC;
 Tue, 24 Oct 2023 13:15:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 837E01C060AE;
 Tue, 24 Oct 2023 13:15:14 +0000 (UTC)
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 19/39] hw/s390x/s390-skeys: Don't call register_savevm_live()
 during instance_init()
Date: Tue, 24 Oct 2023 15:12:45 +0200
Message-ID: <20231024131305.87468-20-quintela@redhat.com>
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
X-TUID: TetlluQlRSJk

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
 hw/s390x/s390-skeys.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 5024faf411..8e9d9e41e8 100644
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
@@ -432,58 +433,38 @@ static int s390_storage_keys_load(QEMUFile *f, void *opaque, int version_id)
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

