Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5615416lfm;
        Wed, 26 May 2021 10:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0Hkv34l8YUSAFJaKlIAw2W3MFzs8Gp2B2jlYb42j4g0zftulB/7b2XhPqbe8IvNif866Q
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr38542464edc.65.1622048704398;
        Wed, 26 May 2021 10:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048704; cv=none;
        d=google.com; s=arc-20160816;
        b=q0S4ROoWX8NbcCaS8CF3V5vVWgrn5QyYbx5vWVTxhfi+e8XF2PdoWc/oSA0XvQn/Wl
         tMgB01Pza1Ej1w+3+BnNuvYuOJ9gokP6xgqGPIXwy0ri1dQn7+MEA5c6BPQgMfBrs3Oj
         jWDYl9IXaxUiQVJ5SXJHIRo9BQAfNmfCguFpp2rcXdZKVwrUJ88+dcRHQLSrJQvKCKue
         5T1IHl+vHeSL+9dMFe1pxfN4K1U8VFZjOjcjcvIxv9uwhvJiuHeQ9nPa0Bp0w4p+yI3A
         WFaVBIYg/0TW4GUjQNI8pt3xawgiPUzG4c7myDnoVf4o+78sBh62qKhWafgZHAX2O8Au
         Jn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3uXX+K1GXf7TrWdaqri3KbXM16p7ZXQ8jRKVT3E8l+g=;
        b=afb8lzx4Uq0GvOkyYzsydsjqGAH1Cravi8bQ2XDwszzT2dwUJZcAD+uDW+J/C3eZxV
         DRq9Q3mLRjvZmYmSDVVJMTpoGyvR7QCqHnxtuiTjT8NOQUXIFoJ+C075DMf+Nwril6Vf
         qKojs5nAht15YfrRdmxHZ9/hvEJn6A+lCt8F4/hgh3qNMhuBnpNoxESRRZ7zl4SuBqsy
         C2PZZmf1zd71EK+5cV7bQMTIl5oQjmYzyefRfZCmSiEWFqKHULcC+7uckp15wwAk9gGf
         E+srcK8mw85DwftWvQyGBJ62bDE5sSzYl7vOeeIzrNF+RlauzuQZV5xeYFJdf2BGh4me
         9s/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bxCt2pBd;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id l23si20172944ejb.573.2021.05.26.10.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bxCt2pBd;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uXX+K1GXf7TrWdaqri3KbXM16p7ZXQ8jRKVT3E8l+g=;
	b=bxCt2pBd0QCWaoAnqM4iMi0sUllWiQRFTygb4d3ufYbZnZbbJi+qHhEmLS8AyMISqgVK1Q
	P78P9bjitLNkZbZSEKGuE1lq4Qm4iOKvSxRo2ddZBzMIjvx6LbOvOwWgz1TD2KPysx0CoL
	vy6n98XVyySNRt4+ieb24BuaW9tE1PE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-Ek_CjHZ-P-eizUTfTgAvJQ-1; Wed, 26 May 2021 13:05:02 -0400
X-MC-Unique: Ek_CjHZ-P-eizUTfTgAvJQ-1
Received: by mail-wr1-f72.google.com with SMTP id g3-20020adfd1e30000b02901122a4b850aso588503wrd.20
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3uXX+K1GXf7TrWdaqri3KbXM16p7ZXQ8jRKVT3E8l+g=;
        b=VHECx9qy/3+zJvLSD0EavtuSsvmOz2bKH/HkomwBFL3rYMw++63Eqr6oUxORXpHJXG
         +JsVHHDbyjZSBujBl5T0kO2ezQfxvQUwEZ5ufCByaO9NsisbgVungfHmIrLwhp7ATrHK
         1RHlNRTtJdLQgivOr0baAgOw1UI0eZ/h6I06OA9jzc1LIkywzIeq1ikAiYvPTwRmgFqF
         yqKjIxy43dfDxcuORnPNERx3IMpPL+XOzPC3d0ij34xb49ZyTpQUQBLlo2dx3GYDeCNF
         Jy4027NyyP+CHIwHwneOZtOy21vDg4PWhDw6ybUIJMG+IH4/jOO+Q7S7zfovi1z090KW
         ABtQ==
X-Gm-Message-State: AOAM530C8WTz5XFMzLtCGOFnyvjHQWY9XUzCIc0YjQHEXYD9dQmKPkWR
	6NUUzk0N5opxHrOIQXQ7TNZOu3oeaW3FA1nLDBkpiLlTHtLvHMW2+Iz6e4CW4kU3HPtI+nTmv3X
	cufkoXReolzF3WY4L
X-Received: by 2002:adf:fa42:: with SMTP id y2mr33945025wrr.12.1622048699867;
        Wed, 26 May 2021 10:04:59 -0700 (PDT)
X-Received: by 2002:adf:fa42:: with SMTP id y2mr33945011wrr.12.1622048699726;
        Wed, 26 May 2021 10:04:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id w12sm20326986wrt.16.2021.05.26.10.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:04:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
Date: Wed, 26 May 2021 19:04:22 +0200
Message-Id: <20210526170432.343588-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qFwPdAilBtFR

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

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v8:
- Include code snippet from Markus adding to machine-target.json
  to be able to use enum values or union branches conditional.
- Use accel_find() on enum to be sure the accelerator is enabled
  at runtime (chat with jsnow / eblake).

Cc: Eric Blake <eblake@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
 accel/meson.build        |  2 +-
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b72..586a61b5d99 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,57 @@
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.1
+##
+{ 'enum': 'Accelerator',
+  'data': [
+      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
+      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
+      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
+      { 'name': 'qtest' },
+      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
+      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
+      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
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
index 00000000000..0098297caa5
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,32 @@
+/*
+ * QEMU accelerators, QMP commands
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/accel.h"
+#include "qapi/qapi-types-machine-target.h"
+#include "qapi/qapi-commands-machine-target.h"
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (Accelerator accel = 0; accel < ACCELERATOR__MAX; accel++) {
+        AcceleratorInfo *info;
+
+        if (!accel_find(Accelerator_str(accel))) {
+            /* Accelerator available at build time but not at runtime. */
+            continue;
+        }
+
+        info = g_new0(AcceleratorInfo, 1);
+        info->name = accel;
+        QAPI_LIST_APPEND(tail, info);
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
