Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2282942lff;
        Mon, 14 Jun 2021 13:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxukvf8oBIhOQy26NpyeT4yBHGKo9n2eCgFOD5wCS6tr4fF+L73sJWLo+wMEcq0QB1Pr3wF
X-Received: by 2002:a05:6402:144d:: with SMTP id d13mr18561535edx.288.1623701444027;
        Mon, 14 Jun 2021 13:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623701444; cv=none;
        d=google.com; s=arc-20160816;
        b=wmjmqbJRM84V+3uEGoUkPbZHpKAHtnuzFs2iYFi6N4QMqkmTgwRezphIAWP6pA7wiX
         ScmV5C8z7x0+pO+6/gXJIv+hGdVAfKPLnDWmwGDNBFcv1ToeJNOBxRZ4B8tS7LMTCaEO
         sq5i588Rn95kXyU1QXc5pvlhAxy4vVLEiNP4yLvFdsgrutzvWy3tLOfu+aIds1d+Dofp
         7ZM8V4JI84MTGY+6kSZzuYRa5w8P6f2qkX57EZjCcDgrNWLLnUyMa4cYwhOAGnl5bnsB
         J5jmnXYTmDvuts+2GD+41YwAihEg158lBytyIa4QEkjP8STud/2iWxstaHY4bAZcb1DB
         UJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=983yM9Ivhh0Jdv/knxi7k66F6inZsKoawfPPt/Wd0Sg=;
        b=K1nIjIbqYi1oTQG0M9GkNJ+299e2AbGXPlFl+ApyKxvdaHLlkZU+0xM3yOveyy9Ahq
         sli0yW7SF2SchqwrzjFF2qtlmrI3+5EkBYHMQ2iSCEyH3rUUxxsN39imcWntvDzniU4k
         Zbi0uVwmqwm9gzx7Jei1Wz3wtdwCohxW85KWKKmcManF27xUQdgG6IHALyZr9k4wP6oq
         hhKnZNE9R+iDbxkPu3f9KR/ymNDrtltzv8qsFAJlPtbYbQtik7QiQZOkcmk27+tZxsaI
         TswYN4XYkLZTNPqV6eSUI0Gtkryn4HEg5IbPGOGsYNLyP98ptxt4xBqNHoK877Z50ZLB
         SdTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mg3IeQjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ka11si13018889ejc.367.2021.06.14.13.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mg3IeQjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssuw-00026x-Cp
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuQ-000227-3Q
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuN-00031T-TW
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=983yM9Ivhh0Jdv/knxi7k66F6inZsKoawfPPt/Wd0Sg=;
 b=Mg3IeQjAaEXNt6AIoRDocbPVsfKBXifJ8l7nsYkHcm/QaQRkgnYHWDsQGP5NV4YIaj1jOH
 hvulwSzEEb5QJ4Gdki7CQoF8caq5ytVbDZ3qgHYkMMlq5MGAVLekvL1QqYhopBjbVkOuzi
 FzEhIgHPh4QKDIlKIS9L9w9ADMe03wo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-0tXir73bO2m4dL7hITFvCQ-1; Mon, 14 Jun 2021 16:10:05 -0400
X-MC-Unique: 0tXir73bO2m4dL7hITFvCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so7477075wrm.17
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 13:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=983yM9Ivhh0Jdv/knxi7k66F6inZsKoawfPPt/Wd0Sg=;
 b=czUnVjhqB1ysUDpvYL1EWhE9zmtgk5FI1Jgmq6GgCWX6hgmHs6MFhfWvAXwfK3Fj0S
 NAwORk/pPPrxvX8wOOGlAj/vzybBJINhaio9wU1ktdYDVF9iR3dTIevC3NYFTysQQYTA
 Qrdhc12aYmM6yw6Ek3ftw5AOuaE7SxFXF8dI2rhoSVqIeKI/wMpfgHHZ8wkc4QECDyVs
 uUE/qDN8fWPpUZN7TP0xtlXfmupSPgMqFYQv9w9LbwV/PeRxt6OjAm+zS20y6Gd7wY7P
 EaH16fKRNX4Y929PAcrNn+SSxsAMYggdkwF7KARXavVNLe8iIKT4ed3pyJ5i2/a6Nrcz
 KMSw==
X-Gm-Message-State: AOAM533bhY2r5MHSAaKgDsM40gvdqJ7TSRHawHdZk54oTJ8kki1h9jU0
 rSTelJ9jTpdgWDqlY7NcvTniE0Veu0aEGdVuoawL5Z+V5AvKpOrveaKe61Dg/dEye3VSHe5zsKo
 iW6Iz4q+1Wq1E
X-Received: by 2002:a05:600c:214c:: with SMTP id v12mr7732wml.33.1623701404808; 
 Mon, 14 Jun 2021 13:10:04 -0700 (PDT)
X-Received: by 2002:a05:600c:214c:: with SMTP id v12mr7711wml.33.1623701404620; 
 Mon, 14 Jun 2021 13:10:04 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r3sm13478975wmq.8.2021.06.14.13.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:10:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tpm: Return QMP error when TPM is disabled in build
Date: Mon, 14 Jun 2021 22:09:40 +0200
Message-Id: <20210614200940.2056770-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LrOK433Jg0cC

When the management layer queries a binary built using --disable-tpm
for TPM devices, it gets confused by getting empty responses:

  { "execute": "query-tpm" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-types" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-models" }
  {
      "return": [
      ]
  }

To make it clearer by returning an error:
- Make the TPM QAPI schema conditional
- Adapt the HMP command
- Remove stubs which became unnecessary

The management layer now gets a 'CommandNotFound' error:

  { "execute": "query-tpm" }
  {
      "error": {
          "class": "CommandNotFound",
          "desc": "The command query-tpm has not been found"
      }
  }

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/tpm.json      | 28 +++++++++++++++++++---------
 monitor/hmp-cmds.c |  4 ++++
 stubs/tpm.c        | 25 -------------------------
 stubs/meson.build  |  1 -
 4 files changed, 23 insertions(+), 35 deletions(-)
 delete mode 100644 stubs/tpm.c

diff --git a/qapi/tpm.json b/qapi/tpm.json
index 6a10c9ed8d2..75590979fde 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -17,7 +17,9 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
+{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
+  'if': 'defined(CONFIG_TPM)' }
+
 ##
 # @query-tpm-models:
 #
@@ -33,7 +35,8 @@
 # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
 #
 ##
-{ 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
+{ 'command': 'query-tpm-models', 'returns': ['TpmModel'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmType:
@@ -46,7 +49,8 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm-types:
@@ -63,7 +67,8 @@
 # <- { "return": [ "passthrough", "emulator" ] }
 #
 ##
-{ 'command': 'query-tpm-types', 'returns': ['TpmType'] }
+{ 'command': 'query-tpm-types', 'returns': ['TpmType'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMPassthroughOptions:
@@ -79,7 +84,8 @@
 ##
 { 'struct': 'TPMPassthroughOptions',
   'data': { '*path': 'str',
-            '*cancel-path': 'str' } }
+            '*cancel-path': 'str' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMEmulatorOptions:
@@ -90,7 +96,8 @@
 #
 # Since: 2.11
 ##
-{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' } }
+{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmTypeOptions:
@@ -104,7 +111,8 @@
 ##
 { 'union': 'TpmTypeOptions',
    'data': { 'passthrough' : 'TPMPassthroughOptions',
-             'emulator': 'TPMEmulatorOptions' } }
+             'emulator': 'TPMEmulatorOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMInfo:
@@ -122,7 +130,8 @@
 { 'struct': 'TPMInfo',
   'data': {'id': 'str',
            'model': 'TpmModel',
-           'options': 'TpmTypeOptions' } }
+           'options': 'TpmTypeOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm:
@@ -152,4 +161,5 @@
 #    }
 #
 ##
-{ 'command': 'query-tpm', 'returns': ['TPMInfo'] }
+{ 'command': 'query-tpm', 'returns': ['TPMInfo'],
+  'if': 'defined(CONFIG_TPM)' }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d10ee141109..f6cadede40f 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -901,6 +901,9 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
 
 void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 {
+#ifndef CONFIG_TPM
+    monitor_printf(mon, "TPM device not supported\n");
+#else
     TPMInfoList *info_list, *info;
     Error *err = NULL;
     unsigned int c = 0;
@@ -946,6 +949,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
         c++;
     }
     qapi_free_TPMInfoList(info_list);
+#endif /* CONFIG_TPM */
 }
 
 void hmp_quit(Monitor *mon, const QDict *qdict)
diff --git a/stubs/tpm.c b/stubs/tpm.c
deleted file mode 100644
index e79bd2a6c2d..00000000000
--- a/stubs/tpm.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * TPM stubs
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/qapi-commands-tpm.h"
-#include "hw/acpi/tpm.h"
-
-TPMInfoList *qmp_query_tpm(Error **errp)
-{
-    return NULL;
-}
-
-TpmTypeList *qmp_query_tpm_types(Error **errp)
-{
-    return NULL;
-}
-
-TpmModelList *qmp_query_tpm_models(Error **errp)
-{
-    return NULL;
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index 65c22c0568c..d4e9549dc99 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -38,7 +38,6 @@
 stub_ss.add(files('sysbus.c'))
 stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
-stub_ss.add(files('tpm.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
 stub_ss.add(files('vmgenid.c'))
-- 
2.31.1

