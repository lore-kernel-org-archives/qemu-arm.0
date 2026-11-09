Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346B606A332
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqt0G6ZQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXu5-0005KS-B5; Mon, 09 Nov 2026 17:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtb-0005BZ-Cr
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:27 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtW-0003mk-EQ
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:22 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8a06e79e152so736644b3a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263477; x=1794868277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b1idv5Llys8jErTecMkb9GaJ9uep/EhQy4rAz/RX7Cg=;
 b=pqt0G6ZQEikFSGi//GiBc3uYmMQQz8j8o3Jo2/ZsuRVVLPneM14JkEtHdI+5fCpF3/
 mkf9eLpQ336JNvu0L0F0XnAqEANHfKLN0bcsTyaqVeDfhEPDNaeZejwTXu+Jf3xSYqzd
 kESo5tGPhq1y1aGokeGdjw9MX9A/sV5b6V/QrHcV10lwrfUzwTQuPQzRA7DQb5nvKs4c
 59/LhqXPCs/EyLxkDTihP/IgxYPYq7QpNNyEDw5JwVqmRO+0/x+DCNLaul62NMtt45Pf
 2cW+8xjs/E2CXUWVr7t6li/cdioxA1V3N0XY7qPNyew2xLEb4srDpprl7tqfmVY/swmu
 x87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263477; x=1794868277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b1idv5Llys8jErTecMkb9GaJ9uep/EhQy4rAz/RX7Cg=;
 b=UHLbyH8rmN0ZdkF0cgyu4aEQI23Ar4ae0mMt3CSgU/9ZLSrdmvo1D+caoybXlZipzD
 XXjVxdCefI8lHlc//YEPva8XleZ3UnBxF8uwX2wG077knBM3TaRX1IcjI+0/TF4q6hp2
 pE5TZE3MuHY4+D3UqCA5lrKgwl00YBrzr0voeEQPk7qs9D2T4gdJ4JnkzLMMeN1Y1Ej5
 XsypQfYO0CGYJ+5KPT91WrTHLWXX1oRsTzByqpw/FWOSVoGu0fkt0eCqPnKNRKnw+RhY
 BVnyLE3JcEZrwDz2nYgfGurbEiCreu/0pRB/USa7pMkfR3l2KXj1PPQi6+0IxdZk67r6
 tNkQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFU+cyhiMPzu3zRcFloPieqG6eyPy4J/IgKByXOeBioUbzrtgn56No3s2b8xxpfuu/twpCthYnSyw==@nongnu.org
X-Gm-Message-State: APuU4Z9lmHHz0LYoUJpT7ceQk+iPbBQo0EdIihfxP9cimZ1QHzB2otPz
 8RdMEtl05rjCXg3xbmg3in44gdPU0ycPspbEuIWDKaKrUxVKxlfopMD8pXK0O3M4dqk=
X-Gm-Gg: AYBFou1/+vuRLyZKt9Wth/hNAJoJQDlOQ9kgZeX6coJm7ypcRKhPbPvmiOX2E1/TIFv
 xl++zyA8V609AUvKAmQsaZL899ypREFIUQzrhSdeNhWuuswSDgJsz2SoP9rz4XbShCEvNLkrxoM
 ZTbESYT3iQpZSF4VpXisDAzwi0+vO4gp4b4gsmY+azYYIktzFWob/kdFLIA5z4CZXqfLtsrHz81
 QxbEGZ81BfQMGRo2KDj9RZdL/0Bfit8eMHpL5IgL85MzCbh8NwgIzvj1UsQaHNgHbgc/KWh5ppW
 3SlW+8ZAYcxAm4ZllUAzukK+jv+5spw0i3VPI20xZNAaAj4SaA+f1cHoljobLBPEFwWPzz+VroG
 bJ8ZFq8AlYZenWykstJ/wDOgQpRCBwtNTgtgUPusD8acxsT1zAfZYYEQwKh8U/cQcULgMvo8vHU
 oaTHGpJqJnqL5dnVxhKEgd/gdSKw6v9d708OaEeQw03am2UvlR/Mb+93mtkQmXCJsDj0yhXqA//
 peKVvmu4lj2bixjSiI72oAaxcRFb8naXjEf3dzQNyGAKpGI1nm4c5DNhaXjfL7Pw7sP+wEkdSmp
 eWYnUmGObx8wj3EqNjSRo1Kq41qmBgxR36z3+kRu7eYWqvs3860y9A==
X-Received: by 2002:a05:6a00:4f87:b0:8b6:4eec:f501 with SMTP id
 d2e1a72fcca58-8ba885c7a7dmr901188b3a.14.1794263477020; 
 Mon, 09 Nov 2026 14:31:17 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:15 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 02/23] target/arm: Add confidential guest support
Date: Mon,  9 Nov 2026 16:30:49 -0600
Message-ID: <20261109223110.1619504-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
support the Arm Realm Management Extension (RME). It is instantiated by
passing on the command-line:

  -M virt,confidential-guest-support=<id>
  -object rme-guest,id=<id>

This is only the skeleton. Support will be added in following patches.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/system/confidential-guest-support.rst |  1 +
 qapi/qom.json                              |  1 +
 target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
 target/arm/meson.build                     |  5 ++-
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/kvm-rme.c

diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
index 58732d658f95..2d0b5c1b2654 100644
--- a/docs/system/confidential-guest-support.rst
+++ b/docs/system/confidential-guest-support.rst
@@ -44,5 +44,6 @@ Currently supported confidential guest mechanisms are:
 * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
 * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
 * AWS Nitro Enclaves (see :doc:`nitro`)
+* Arm Realm Management Extension (RME)
 
 Other mechanisms may be supported in future.
diff --git a/qapi/qom.json b/qapi/qom.json
index 7fffc949d3c7..18c1d88b4cc4 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1298,6 +1298,7 @@
     { 'name': 'pr-manager-helper',
       'if': 'CONFIG_LINUX' },
     'qtest',
+    'rme-guest',
     'rng-builtin',
     'rng-egd',
     { 'name': 'rng-random',
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
new file mode 100644
index 000000000000..42e1d1e7b859
--- /dev/null
+++ b/target/arm/kvm-rme.c
@@ -0,0 +1,42 @@
+/*
+ * QEMU Arm RME support
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright Linaro 2026
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/core/boards.h"
+#include "hw/core/cpu.h"
+#include "kvm_arm.h"
+#include "migration/blocker.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "system/confidential-guest-support.h"
+#include "system/kvm.h"
+#include "system/runstate.h"
+
+#define TYPE_RME_GUEST "rme-guest"
+OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
+
+struct RmeGuest {
+    ConfidentialGuestSupport parent_obj;
+};
+
+OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
+                                          CONFIDENTIAL_GUEST_SUPPORT,
+                                          { TYPE_USER_CREATABLE }, { })
+
+static void rme_guest_class_init(ObjectClass *oc, const void *data)
+{
+}
+
+static void rme_guest_init(Object *obj)
+{
+}
+
+static void rme_guest_finalize(Object *obj)
+{
+}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0369f96b4cc6..9d322a7aad28 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -31,7 +31,10 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'hyp_gdbstub.c',
+  'kvm.c',
+  'kvm-rme.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss.add(files('cpu.c'))
-- 
2.53.0


