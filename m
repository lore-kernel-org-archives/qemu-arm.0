Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7812064wrx;
        Thu, 7 Mar 2019 17:42:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqze8PbimXDnrgF6yITZyGDqfoBoyE7vKC9/s46oF9mFc+BGC3RcSsdfugzAec62SChtY3k7
X-Received: by 2002:a81:99c9:: with SMTP id q192mr12838034ywg.84.1552009322162;
        Thu, 07 Mar 2019 17:42:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009322; cv=none;
        d=google.com; s=arc-20160816;
        b=LKnqmsL9rGbWEUC/pVX1JhwWQpkFt7nbgZW1xifrIUklsE8RlaQSbvK32CcXIID7PG
         385j2lYJWffRvGVYy0vBntQUQHaxMSfAcHr1YdVnT7Me0FmrrM5MBlYVrrHWQC7FkHSj
         JjGvBOKyH1sB/YFyuJi+uHGdljN7w/LTYNfOu2svtxEZTt+21V88SFQbc0OnkdXvTy8q
         M3PW0aJ3620Bj1O6zLsrrHvmsqyuElpXgjpr8tzU1w39jLHmOlCAbspMHeGpz3wPjf+I
         u5jC1S9rbEUR8tho1aEX4Q3CC4Muu/gZJepGXVvdpBQh6KVjT6OAouNlGaAQUw5rGZHs
         jehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qP65pUVJAX6AzRqzYH/aCNNJ2Hk09BPpUWh8LXSa3kA=;
        b=Q3VYQ67pCyiUH6usF5FgdFiEJHGgvnlb1Juu5c2xjQ9neFXfJwUfMAMDnhSXUPnHEB
         N516BQ6N9oXfI8ltkVXK7C+YN/UnlnUUCuqRtRm+ou8e7KMB+DqVXoc3P7w4cp6wEmK+
         q6JSUnnErX1uF+RZZqQWRsxBkjr0E4/1auKDann/sj2gwWRhssHMqPcMQdZ4/8q0I0i7
         lCVALvJwcQFN6a5ML1xKwV3pA50RG03ozeVJsmzM8MqnuFNGehckSlgvrIfmR8YK8PQT
         HyplGOxkHZv2OZ/eZ+BIgcfcbnhr4uW++U5XKGTT3OCJ3gYsQonQPCjZOa47FlD0iXKX
         ZF6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si1963063ybk.423.2019.03.07.17.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:42:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24WP-0001fk-I2
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:42:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Q1-00045h-Hy
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:35:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Pz-0002xX-GQ
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:35:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Pv-0002q2-KT; Thu, 07 Mar 2019 20:35:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DDA9B0ADA;
	Fri,  8 Mar 2019 01:35:15 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 300FD60BE5;
	Fri,  8 Mar 2019 01:35:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:17 +0100
Message-Id: <20190308013222.12524-14-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 08 Mar 2019 01:35:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 13/18] hw/nvram/fw_cfg: Add QMP 'info fw_cfg'
 command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7nsqfBJkSI4I

When debugging a paravirtualized guest firmware, it results very
useful to dump the fw_cfg table.
Add a QMP command which returns the most useful fields.
Since the QMP protocol is not designed for passing stream data,
we don't display a fw_cfg item data, only it's size:

{ "execute": "query-fw_cfg-items" }
{
    "return": [
        {
            "architecture_specific": false,
            "key": 0,
            "writeable": false,
            "size": 4,
            "keyname": "signature"
        },
        {
            "architecture_specific": false,
            "key": 1,
            "writeable": false,
            "size": 4,
            "keyname": "id"
        },
        {
            "architecture_specific": false,
            "key": 2,
            "writeable": false,
            "size": 16,
            "keyname": "uuid"
        },
        ...
        {
            "order": 40,
            "architecture_specific": false,
            "key": 36,
            "writeable": false,
            "path": "etc/e820",
            "size": 20,
            "keyname": "file"
        },
        {
            "order": 30,
            "architecture_specific": false,
            "key": 37,
            "writeable": false,
            "path": "etc/smbios/smbios-anchor",
            "size": 31,
            "keyname": "file"
        },
        ...
        {
            "architecture_specific": true,
            "key": 3,
            "writeable": false,
            "size": 324,
            "keyname": "e820_tables"
        },
        {
            "architecture_specific": true,
            "key": 4,
            "writeable": false,
            "size": 121,
            "keyname": "hpet"
        }
    ]
}

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: New commit, asked by Eric/Michael, using Laszlo suggestions
---
 hw/nvram/fw_cfg.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json    | 44 +++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index fc392cb7e0..2a8d69ba07 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -35,6 +35,7 @@
 #include "qemu/config-file.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
=20
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
=20
@@ -1229,3 +1230,78 @@ static void fw_cfg_register_types(void)
 }
=20
 type_init(fw_cfg_register_types)
+
+static FirmwareConfigurationItem *create_qmp_fw_cfg_item(FWCfgState *s,
+                                                         FWCfgEntry *e,
+                                                         bool is_arch_sp=
ecific,
+                                                         uint16_t key,
+                                                         size_t hex_leng=
th)
+{
+    FirmwareConfigurationItem *item =3D g_malloc0(sizeof(*item));
+
+    item->key =3D key;
+    item->writeable =3D e->allow_write;
+    item->architecture_specific =3D is_arch_specific;
+    item->size =3D e->len;
+    if (hex_length) {
+        item->has_data =3D true;
+        item->data =3D qemu_strdup_hexlify(e->data, hex_length);
+    }
+
+    if (!is_arch_specific && key >=3D FW_CFG_FILE_FIRST) {
+        int id =3D key - FW_CFG_FILE_FIRST;
+        const char *path =3D s->files->f[id].name;
+
+        item->has_keyname =3D true;
+        item->keyname =3D g_strdup("file");
+        item->has_order =3D true;
+        item->order =3D get_fw_cfg_order(s, path);
+        item->has_path =3D true;
+        item->path =3D g_strdup(path);
+    } else {
+        const char *name;
+
+        if (is_arch_specific) {
+            key |=3D FW_CFG_ARCH_LOCAL;
+        }
+        name =3D key_name(key);
+        if (name) {
+            item->has_keyname =3D true;
+            item->keyname =3D g_strdup(name);
+        }
+    }
+    return item;
+}
+
+FirmwareConfigurationItemList *qmp_query_fw_cfg_items(Error **errp)
+{
+    FirmwareConfigurationItemList *item_list =3D NULL;
+    uint32_t max_entries;
+    int arch, key;
+    FWCfgState *s =3D fw_cfg_find();
+
+    if (s =3D=3D NULL) {
+        return NULL;
+    }
+
+    max_entries =3D fw_cfg_max_entry(s);
+    for (arch =3D ARRAY_SIZE(s->entries) - 1; arch >=3D 0 ; --arch) {
+        for (key =3D max_entries - 1; key >=3D 0; --key) {
+            FirmwareConfigurationItemList *info;
+            FWCfgEntry *e =3D &s->entries[arch][key];
+            size_t qmp_hex_length =3D 0;
+
+            if (!e->len) {
+                continue;
+            }
+
+            info =3D g_malloc0(sizeof(*info));
+            info->value =3D create_qmp_fw_cfg_item(s, e, arch, key,
+                                                 qmp_hex_length);
+            info->next =3D item_list;
+            item_list =3D info;
+        }
+    }
+
+    return item_list;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..9d1da7c766 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -3051,3 +3051,47 @@
   'data': 'NumaOptions',
   'allow-preconfig': true
 }
+
+##
+# @FirmwareConfigurationItem:
+#
+# Firmware Configuration (fw_cfg) item.
+#
+# @key: The uint16 selector key.
+# @keyname: The stringified name if the selector refers to a well-known
+#           numerically defined item.
+# @architecture_specific: Indicates whether the configuration setting is
+#                         architecture specific.
+#                  false: The item is a generic configuration item.
+#                  true:  The item is specific to a particular architect=
ure.
+# @writeable: Indicates whether the configuration setting is writeable b=
y
+#             the guest.
+# @size: The length of @data associated with the item.
+# @data: A string representating the firmware configuration data.
+#        Note: This field is currently not used.
+# @path: If the key is a 'file', the named file path.
+# @order: If the key is a 'file', the named file order.
+#
+# Since 4.0
+##
+{ 'struct': 'FirmwareConfigurationItem',
+  'data': { 'key': 'uint16',
+            '*keyname': 'str',
+            'architecture_specific': 'bool',
+            'writeable': 'bool',
+            '*data': 'str',
+            'size': 'int',
+            '*path': 'str',
+            '*order': 'int' } }
+
+
+##
+# @query-fw_cfg-items:
+#
+# Returns the list of Firmware Configuration items.
+#
+# Returns: A list of @FirmwareConfigurationItem for each entry.
+#
+# Since 4.0
+##
+{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfigurationIte=
m']}
--=20
2.20.1

