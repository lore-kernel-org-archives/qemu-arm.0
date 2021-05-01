Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373634lfg;
        Sat, 1 May 2021 15:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyXdFBl0OIHq0H4cs9NHZnbcK8EffZeKGP/Npn507TFa24+xQIsC8oJ9hUzuzgAj1FO+FL
X-Received: by 2002:a50:eb0d:: with SMTP id y13mr12749103edp.326.1619908614751;
        Sat, 01 May 2021 15:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908614; cv=none;
        d=google.com; s=arc-20160816;
        b=Vvutp95rFpjR5Dwlal1qsfiHHvIm+D0DVxapnoDpd/5gW4ZrKHsXC/EhfhmbSZhIvm
         T0fQ+Ycci3Uf6LVxnzkP1xQ98ktgfn6gdPOjDhlsER/ojdySV/ZID8HeYdpqCLm5kNLw
         wP1AzwO32JX7TJYITFgBxPJ7ip90Oe17q9dpCY+l1fxbfiV5djBbaez9ZmhmlJEWwPQk
         vB3zJLQv4VIeeQb1qkYiLBpBgaF+QnoSvsa5BB6Jqn677/w6UyIwX2X6lT+kEFoEdcbM
         UAPS0FZrOnWhins0b1xoT2cBaQMJgwIuKKyELT6iWAj7wgbT9hJjbbv7NVSn88v1HNMd
         M5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
        b=hr8TXpTH7C407MKvBra5cZLguI3wZYW4RL6C355NPBI7MWYOz4XhS6STGQenfmt+Do
         RIbXDSTJokOMeP+SNGkkYf6Rabp3PeZ4TOwleki3un9Aq55vM93do1nKZD9Tce6CSuD/
         +EkbDSDQ35QtxmOjFrJIAye5pgSqjSQKNZXlDjm9UzdRtvuPfq0RJMbattnaURp5mD3A
         zmuIHWzH6Ao6jy4SbzhV3buUxqNfZHYWJqCngjE5gTdHmBStrZla7wP9hq29zcL7m0I4
         EK0rstApOchz1HaVGBGnXM9keCso1gOV9Mt0ddAXRsGLoVlo13ReU9l3TMgpCmS7+2Qm
         o7hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hD8/sTsM";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cx22si5204112edb.175.2021.05.01.15.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hD8/sTsM";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
	b=hD8/sTsMzM6w6BlcGs9qHF6TQ10h9/8DIKCBiTVJ+gejDaToRxU/Xrpk6ZARAxHtq2eIx6
	xlCIQH+Iz4qSGlrx6eX8ntudxjvxKDTXVFwz409UYIVIXwJKEB5zFudW4f2yDKt/OoWRiQ
	YdMjlizht0kToQjeVpvpyn/f/QgOTW0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-8pK_PEM7MV-L0TGzOgW62Q-1; Sat, 01 May 2021 18:36:52 -0400
X-MC-Unique: 8pK_PEM7MV-L0TGzOgW62Q-1
Received: by mail-wr1-f72.google.com with SMTP id 93-20020adf80e60000b0290106fab45006so1276156wrl.20
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/JwIaYRijlIKIuvZy1yv4gicsUV0JiEB0BppIoUwQc=;
        b=C+cVkUp35PKIsO4WuXemP51nsBdVl4Ok9j15Lfvr9WaT7blaomokNGrRs5LASCunlM
         Pdbl2HfjCT7wyWLIYrFAwxa+z8xg7p6y4fOEah6rAOQD3JBfOPNTEiWz+gq5nX8tUHnu
         m5HMpzQXTE/SRhwRT9AmXlIC4+aMx9/N+5HneIHXu1MiUIEnBQ4Jg/oKgj4sRPhYewsY
         m3Rdh+yWKx+YlN+/Ck7fvPdCtgIFWWtnLzlMfVqCK+I8npdPVtCQ0S5GeQZ3HOOxYp0V
         gZM5szi1d+qwVN29fV+kbcrC2N4e3+yMq4NtVNmWLQxFzQf+yFiuqDw6EYqUUUy5RJ9O
         IJXg==
X-Gm-Message-State: AOAM532dHOZjYrCoxXgGyW4Ih5Uy+bj4xNhzGwN0oK8TbqAItAIcIl+t
	fFYgUSQxqSV18DbAsDGIZwvFyTn+wti307GbtZfVtoaIs4XKviC2lBWomZSIr27QLKjfuqKBmVN
	R/mM/aa/hDYaOGlQt
X-Received: by 2002:adf:e412:: with SMTP id g18mr16077734wrm.205.1619908610995;
        Sat, 01 May 2021 15:36:50 -0700 (PDT)
X-Received: by 2002:adf:e412:: with SMTP id g18mr16077724wrm.205.1619908610815;
        Sat, 01 May 2021 15:36:50 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id l14sm6220149wmq.4.2021.05.01.15.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:36:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
Date: Sun,  2 May 2021 00:36:30 +0200
Message-Id: <20210501223638.510712-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SxbpCvRif+fc

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
