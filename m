Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp1645373qvb;
        Thu, 15 Apr 2021 05:27:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpjHnleitibiTl+z6KN1nAQfE+VTu7ZW7rpwGMIz9W76YFQJmKL3nzoNxcS16k173hOXwU
X-Received: by 2002:a1f:bf02:: with SMTP id p2mr1694891vkf.20.1618489631960;
        Thu, 15 Apr 2021 05:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618489631; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub8XSGebH4G0cwue9z3GhzIpvn2egvkEaz6VluGl+38EewQ0AmKSlJwsqeL+PcTZv5
         HcR5QjzJHdR2XOIpsvWV2COf1Fuob2QPogTH+NVOKzSLAwpr5DqFQ77Uzw/D+4oJXR/b
         /1ss/xgWyEzULSgQxuqNPk53/dlimhcxxxzfOCag4Qkruof+wCMUL7ztnGb61hJ53WBU
         SiwQbBPc5pLp7JW3kVa+k6jk3Oy0JLA3NpGOunvRIODDLIg6Nr4EY4070d7HDrdzNCt7
         nDajDD80m85IGN7WxbWwgEquOQc8A5UXDbmX1Nd2L8N/GlxabLTKWvqKAoykrK9sUxh7
         qlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oX/D9vzkbuCupVtNwAphnCfZjmK6c7aD/BD5R7Zvb6A=;
        b=r0cDPxqITv5WJmsZb6ZyWo/KPQRxIDZmVpHZhXtyisMgOCwg+vuav6UPa4sXfQsFKO
         cq9IpCQZ0nNil1edghLV1am4lDv7JH5Bv3Cy/p6MM/egb1xOQ9pamAb9bF4sqpx9npG1
         x4D6kGHAx6tZkH90a274a0b0EuxBFfehJqDGIdGlux8DneNyYVaDPwxTLeI73SlsV14X
         XKNakLOFcOyW3sykL6PYZ+6pc4MLc6lvRq3G5ltPECFCjfKov/1PboAwUQlKGKUJDA9H
         0z6OITrTTnyUQKBfDNLSK6OancpKEiXY+Z1e2dtzOc6wiD60UXClCj0co6ZYsPwsecui
         Olzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WgXCIfmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si913336vkg.92.2021.04.15.05.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WgXCIfmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX15T-0002xI-5M
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX159-0002vM-K7
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX156-0005yS-F7
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oX/D9vzkbuCupVtNwAphnCfZjmK6c7aD/BD5R7Zvb6A=;
 b=WgXCIfmAoCHB16Pmkql9bGjs3X66fCrWXGk8gr1zjaU2/CvQniIVAHaMptRKWVVy1tUA+H
 VuQIJXbEEhlp80I6zexNUZ5Q3o0VeDMsP8aqDx+mV0fEbyG/qwdM0luY8f+Utqxa4vtPD4
 Z7A3W9gp0cCi6AVG+ycBWbCzuIOLpYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-b5HnozRWOiWAHmQtdREBxg-1; Thu, 15 Apr 2021 08:26:42 -0400
X-MC-Unique: b5HnozRWOiWAHmQtdREBxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u11-20020a05600c00cbb029012a3f52677dso2831055wmm.8
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 05:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oX/D9vzkbuCupVtNwAphnCfZjmK6c7aD/BD5R7Zvb6A=;
 b=g0d5dUj+BOsQgJTyxJdO32iRg+Y105qQHaXnhFDbrXLjHF+EXfU2lOQw5gshb6p8Lm
 pLce64de/oDt6h2BIGY/HB+ckroTL0WfZPr8PtA5dyaCFw1Hc6adYrD99kaXqRFXfHc4
 qBi/ax8u5U8vtgWNUBXu8oW7vpMVjE775vHOSmIUD+c/dSC0/JSkwNNs7REoUsmUoNqd
 dxv1IpK+B0cJmyh1bfhSQny5grbPBpJEdhJt0NZth51om9jeuGgAUI2NqyMbgOBXQCgM
 ohNBPk9O9mUBgAVjqzYjqnHeOX92cnfPcGylHYG9RMFzc3MAsYNQFGPtdnnGBX586Jv0
 eJaA==
X-Gm-Message-State: AOAM533ifsnm5Cb4SLrMUuzArwa8PgQGHW5otlGDOstXddnb+hUNqWQP
 PIszZfjv1GbBWtxWOr3xM19zY4Xc/dEB8lSS774WubIuTvdjEqrBkzad3lQD/SrGOxxciEGC8uR
 pfzTc8yTCvkZv
X-Received: by 2002:a1c:64c6:: with SMTP id y189mr3010400wmb.36.1618489601316; 
 Thu, 15 Apr 2021 05:26:41 -0700 (PDT)
X-Received: by 2002:a1c:64c6:: with SMTP id y189mr3010375wmb.36.1618489601179; 
 Thu, 15 Apr 2021 05:26:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x8sm2812348wru.70.2021.04.15.05.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:26:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] accel: Introduce 'query-accels' QMP command
Date: Thu, 15 Apr 2021 14:26:28 +0200
Message-Id: <20210415122633.4054644-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R9SUb8emulir

Introduce the 'query-accels' QMP command which returns a list
of built-in accelerator names.

- Accelerator is a QAPI enum of all existing accelerators,

- AcceleratorInfo is a QAPI structure providing accelerator
  specific information. Currently the common structure base
  provides the name of the accelerator, while the specific
  part is empty, but each accelerator can expand it.

- 'query-accels' QMP command returns a list of @AcceleratorInfo

For example on a KVM-only build we get:

    { "execute": "query-accels" }
    {
        "return": [
            {
                "name": "qtest"
            },
            {
                "name": "kvm"
            }
        ]
    }

Note that we can't make the enum values or union branches conditional
because of target-specific poisoning of accelerator definitions.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v2: @since 6.0 -> 6.1, added note (Eric)
Since v1: 'type' -> 'name' in comments
---
 qapi/machine.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc9..4babc06f8b0 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,52 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.1
+##
+{ 'enum': 'Accelerator',
+  'data': [ 'qtest', 'tcg', 'kvm', 'hax', 'hvf', 'whpx', 'xen' ] }
+
+##
+# @AcceleratorInfo:
+#
+# Accelerator information.
+#
+# @name: The accelerator name.
+#
+# Since: 6.1
+##
+{ 'union': 'AcceleratorInfo',
+  'base': {'name': 'Accelerator'},
+  'discriminator': 'name',
+  'data': { } }
+
+##
+# @query-accels:
+#
+# Get a list of AcceleratorInfo for all built-in accelerators.
+#
+# Returns: a list of @AcceleratorInfo describing each accelerator.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "query-accels" }
+# <- { "return": [
+#        {
+#            "name": "qtest"
+#        },
+#        {
+#            "name": "kvm"
+#        }
+#    ] }
+#
+##
+{ 'command': 'query-accels',
+  'returns': ['AcceleratorInfo'] }
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
new file mode 100644
index 00000000000..426737b3f9a
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,49 @@
+/*
+ * QEMU accelerators, QMP commands
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-machine.h"
+
+static const bool accel_builtin_list[ACCELERATOR__MAX] = {
+    [ACCELERATOR_QTEST] = true,
+#ifdef CONFIG_TCG
+    [ACCELERATOR_TCG] = true,
+#endif
+#ifdef CONFIG_KVM
+    [ACCELERATOR_KVM] = true,
+#endif
+#ifdef CONFIG_HAX
+    [ACCELERATOR_HAX] = true,
+#endif
+#ifdef CONFIG_HVF
+    [ACCELERATOR_HVF] = true,
+#endif
+#ifdef CONFIG_WHPX
+    [ACCELERATOR_WHPX] = true,
+#endif
+#ifdef CONFIG_XEN_BACKEND
+    [ACCELERATOR_XEN] = true,
+#endif
+};
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (Accelerator accel = 0; accel < ACCELERATOR__MAX; accel++) {
+        if (accel_builtin_list[accel]) {
+            AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
+
+            info->name = accel;
+
+            QAPI_LIST_APPEND(tail, info);
+        }
+    }
+
+    return list;
+}
diff --git a/accel/meson.build b/accel/meson.build
index b44ba30c864..7a48f6d568d 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(files('accel-common.c'))
+specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-- 
2.26.3

