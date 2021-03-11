Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp714973lfg;
        Thu, 11 Mar 2021 15:13:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAQbq//yk+jkLsEYJRSpBsUx+x83wKrW6ndb3bfxHIBnZ85VjWo0d3bPL8/0enm1NPO04x
X-Received: by 2002:a5d:8617:: with SMTP id f23mr8099562iol.90.1615504386621;
        Thu, 11 Mar 2021 15:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615504386; cv=none;
        d=google.com; s=arc-20160816;
        b=eTjfdSNok5sSi87wzrraFSdtMVZ2TLMxZulM0CrM9ITlLmIROb6a0RHL2ZkLG5QLLV
         eNu/bnc1+FZDJX8KxHAgNoNJSij6ZjqMdkgSC5UUC80DYquhmZEVNgYuCUq4i2flyzc1
         k2pQj8BlA1aRvWLh+D4QXXfQNy1uqMjjSR5MRJVKz5uo3anSEGR6suYLBVqILCj/V/sv
         zWmL0TlvUwfgKUJAESqXrYBzCRIl5P/j5PUwRWyhX1X5EWJuiNfjBi1k/q2sp4bmPTJ8
         1R+YoId6PCzkK6iUJdY4BMJct56awX/wBomqxoDCJ9FCYdlXCVLyUSIo6tFthgL5D7i6
         BD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+9/A/riDh/u3/RZyU2QEb9TC3+IuIFZua1rs0ajVdzA=;
        b=ziHq+uq+9/LoKizXnfIcXQ8AH3DOSJAmW4sKV4ng7erg03Ml6yK2cX5BqlqwolI5H0
         X9rWmhYA2BHggb6PcmZHgi6x4i7/ZCEMJsG0zxuo9yB/fDEktMzU9lhVKXKohDatfeSX
         Y0IpUbRjN78LiWWFd+lflMtWUknUZ8JEKkcS/LTxvrotA4lhQ1v6/6wlup2agxa+qRYp
         Im75osu2PfExTjmOIzrDKKRYE2eI6kH8JMGA1we/kxL/3L7dJwsCgPTLiDwhRskz7dwV
         7dpr/aYsWy/sJIt4ktxdncBKgVFDJeecc8YCV7lniawSf1+PDpZMRA+G/wwppGECzLB7
         kCXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aI1y3sql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si3827367ioi.68.2021.03.11.15.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 15:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aI1y3sql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKUUL-0001jk-RN
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 18:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTh-0001iA-Aa
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 18:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTZ-00050z-UB
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 18:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9/A/riDh/u3/RZyU2QEb9TC3+IuIFZua1rs0ajVdzA=;
 b=aI1y3sqljVqhlKxjD2D6biHqhcZ7VmYpRd/N5wX5YklHd0gtBfGrOnz7+vuOoN+86mm5E1
 aNXsZ4LoIBU5MONXLRuouNR3gML55IHdxMFFK9U8gF8YXgsJ9Nny3oWMDqaJ8tEy1DI4lj
 Qz5gGMenIzGXFwCdbjr1E6jAKhoXts4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-MERt4Y9kO7WmYGcHDPyf5Q-1; Thu, 11 Mar 2021 18:12:12 -0500
X-MC-Unique: MERt4Y9kO7WmYGcHDPyf5Q-1
Received: by mail-wr1-f71.google.com with SMTP id e13so10225299wrg.4
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 15:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9/A/riDh/u3/RZyU2QEb9TC3+IuIFZua1rs0ajVdzA=;
 b=gNwlZlziz6Ye/wEbK6lWna92vwe1hghjk7BGsSUlFL2SAefjSPmJaAP50ZmzbJmP/B
 gb2yiMzJx76sC/ZpIDXJsdpTDI8MHkRcKw1KrB5Djsv9o+lqyoQFWYyTDgfbnKSVF7q4
 sYxujlnw05+jCq1Is8RPnmbW0uWADKi8j7t/OUhSTMG7cTnXxiRk9oCkzojPbLxiRrJn
 5JBtTQ7bZR94qsKU4LZdF0A6JMTPuuSEyxZMmfCubRXIvE5UzLKhLDr29Z3GuCTFRPe6
 rYL0tetAzWSjHTKcBV6FErkTkfMnnXlHDPAIJ3bT/+zhZHU5mio2fdiv1CWtPUO1UXIX
 tjCQ==
X-Gm-Message-State: AOAM533NHo9A/bDt5dTPJp4lYxEExTJCllDFv5oujnLn6BRznGk5W9WP
 2rJI8480gAMYwt8P+E/hAM/uviOi3Ad89UmxiNAUYoutK/hfd6fOwvnFg6Su02Wwy2r+0Q7WNG/
 SowGun5acGIBS
X-Received: by 2002:a5d:6406:: with SMTP id z6mr11075611wru.264.1615504330812; 
 Thu, 11 Mar 2021 15:12:10 -0800 (PST)
X-Received: by 2002:a5d:6406:: with SMTP id z6mr11075596wru.264.1615504330632; 
 Thu, 11 Mar 2021 15:12:10 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s11sm276284wme.22.2021.03.11.15.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Date: Fri, 12 Mar 2021 00:11:57 +0100
Message-Id: <20210311231202.1536040-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rtnVfzx+XW/B

Introduce the 'query-accels' QMP command which returns a list
of built-in accelerators names.

- Accelerator is an QAPI enum of all existing accelerators,

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
                "type": "qtest"
            },
            {
                "type": "kvm"
            }
        ]
    }

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 47 ++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 330189efe3d..ffbf28e5d50 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1471,3 +1471,58 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.0
+##
+{ 'enum': 'Accelerator',
+  'data': [ { 'name': 'qtest' },
+            { 'name': 'tcg' },
+            { 'name': 'kvm' },
+            { 'name': 'hax' },
+            { 'name': 'hvf' },
+            { 'name': 'whpx' },
+            { 'name': 'xen' } ] }
+
+##
+# @AcceleratorInfo:
+#
+# Accelerator information.
+#
+# @name: The accelerator name.
+#
+# Since: 6.0
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
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "query-accels" }
+# <- { "return": [
+#        {
+#            "type": "qtest"
+#        },
+#        {
+#            "type": "kvm"
+#        }
+#    ] }
+#
+##
+{ 'command': 'query-accels',
+  'returns': ['AcceleratorInfo'] }
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
new file mode 100644
index 00000000000..f16e49b8956
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,47 @@
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
+static const Accelerator accel_list[] = {
+    ACCELERATOR_QTEST,
+#ifdef CONFIG_TCG
+    ACCELERATOR_TCG,
+#endif
+#ifdef CONFIG_KVM
+    ACCELERATOR_KVM,
+#endif
+#ifdef CONFIG_HAX
+    ACCELERATOR_HAX,
+#endif
+#ifdef CONFIG_HVF
+    ACCELERATOR_HVF,
+#endif
+#ifdef CONFIG_WHPX
+    ACCELERATOR_WHPX,
+#endif
+#ifdef CONFIG_XEN_BACKEND
+    ACCELERATOR_XEN,
+#endif
+};
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (unsigned i = 0; i < ARRAY_SIZE(accel_list); i++) {
+        AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
+
+        info->name = accel_list[i];
+
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
2.26.2

