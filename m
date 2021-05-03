Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006606lfg;
        Mon, 3 May 2021 14:10:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV6cEcZpJ3lNSyF6cMeM8cNSELWJdVmEohIJ/qiFiH0Y3G6oZe9Ymsq5gV0HoDPNDQDdMC
X-Received: by 2002:a17:906:28d4:: with SMTP id p20mr18915959ejd.552.1620076236727;
        Mon, 03 May 2021 14:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076236; cv=none;
        d=google.com; s=arc-20160816;
        b=kvZUunKhfbvYe/H2W4s0PuDNM+/SClLczRmgUiNOqd55zGY3fousjd9XdCVBWrNtpU
         XV0PA7KSkz5o3ZrF4ScLhXwlRqrD9HYAGSMkS8ihBJrg5LPQ/YTlH5J7Q7/dXZT7tIyF
         xZwNRiZ0YTzmojbgtd537JtWQNk4b/nCJsdCiMcxm5IzXh/es/YI56XDou+rmRzQdgtg
         2r6zQnhZys7TQfyyOKgbQAGzPj8l3XbGBM1gyRkmLi/IXSmLHmY3JuMzU4HQljm1S9BN
         FDab6RtL2k/YDLx6DFx4ctEuz9PEhzdWwCkbCczJl40Ls+t3qlYUkZkVWuB811PdaAFw
         JzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
        b=JPUukAhDq9dnE+qa1/iowIQoik2gI7xAG5nJNMTWIbeGIgjQ3v3XUPNPxxEykXjW+m
         6dk6uUxRzhUetOxZyJrA6ohA2i4jFjDBrO2F5x81JXRDjhUPJRWvQ4O9IWqfuKtwgMtZ
         hnR2zFK37Y4Gj7ejl8PNnuWxTbDL8+lxgRpJobsn6c6qV9Pvdn9smPGMRju2pyGg8wPO
         hkcEk66J92nOQLR/KKSwDNkdEfL5eeEoxua4M/GG/wIFb5+Lsj3bKekSTXQMmj4cSn85
         KNR/oG7fc4aF43xoxyPBkOQcnqQkGQdq7fuJophB54IzMcTSdiE/eQ6FZ02ykth4ASZk
         qVbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SsRd0xJp;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c7si9836519edv.323.2021.05.03.14.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SsRd0xJp;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
	b=SsRd0xJpSMuxl9QWf0XyYcqSzgL7Ou79kcuV/0x13y7MzLDF7vyGo2fALZX4gdVATjksxQ
	bM8awBfasp7uH0ydJeSTmKS92SsfccOPiEYp1XVry++AO3Er6aDTNJoWijJloKsUjauCUO
	OX3JJuHJfF3PGcwWSIiMBO0vZIdld7g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-XxPmLLHQP2alMEWgICTNig-1; Mon, 03 May 2021 17:10:34 -0400
X-MC-Unique: XxPmLLHQP2alMEWgICTNig-1
Received: by mail-wm1-f72.google.com with SMTP id r10-20020a05600c2c4ab029014b601975e1so65849wmg.0
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
        b=svMIrIHuGcd08OMA8Sm4jf8bYBJVz7UaS1PqUIywvJGBTuflA5R4B85KcpiLhCTtck
         7MR6O8B/7j/o59chcFJaBleA5yzQT8ZRPJbmJbY0dGoxCkQqLJ+NxM2+HCg8ruvsI5RE
         teKO4l4M9ZLyQ0gPTToQjyfToWf+VrCcEc5T+QsAQxl768E6e9UEyoHjY9/PZlfDo+QE
         dc79tzWjSUWO9HoPUeRI7j1x/sD1ejpHF0l/29sBaFbyjV1j0d95HFMIeLaO/80Z7QNt
         ZrJPIUzR2OVJTdNOgB2l2bAa45iPg5hykQp1IN0ItNo7evIEWYkWh0yLVJ+zz9vPt7l+
         9+Dw==
X-Gm-Message-State: AOAM5301QujSeJRNBe0KFrU322uTg+Vvqk/PBAtA7kMSKy/WV7BlTp37
	2JQcF/HkBvUrg3wq1hbb1s5tlBIH0C1qDazen7YfmTXeiGyt8L5RbSpb1DdgYt4bLMsF9wHOJRg
	ZfnYWBjSffQBHnyuu
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr504249wmq.133.1620076233053;
        Mon, 03 May 2021 14:10:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr504226wmq.133.1620076232859;
        Mon, 03 May 2021 14:10:32 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id o17sm14529602wrs.48.2021.05.03.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 02/12] accel: Introduce 'query-accels' QMP command
Date: Mon,  3 May 2021 23:10:10 +0200
Message-Id: <20210503211020.894589-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: du3ukLJXLgpq

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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 47 +++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc9..6dd3b765248 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,50 @@
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
+  'data': [ 'hax', 'hvf', 'kvm', 'qtest', 'tcg', 'whpx', 'xen' ] }
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
+{ 'struct': 'AcceleratorInfo',
+  'data': { 'name': 'Accelerator' } }
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
