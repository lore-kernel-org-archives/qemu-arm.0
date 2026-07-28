Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB22C54F54
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonRz-00033v-6b; Tue, 28 Jul 2026 15:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRr-0002us-VF
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:46 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRq-0001Mk-5k
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso257165a91.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266800; x=1785871600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+snw93O5L4IikZGAmaWl2HAz0eSkR4e2CEsA4s4dMC8=;
 b=Gsd/AbUJe7VuYVRvlkW8dfbTkwHkb8DlMkKZDmLb9tQnPLfpGogbl3s2H0IsDt9EQF
 0YfSBPpTmNt5hnj9h4jmQasb2zuCc47Q8asUp++VwpGZWJd6ujS4VAshsyJS8C+J/sMe
 fpNL2GMeXX78pVdHuhsY3oCJR4TE9AXVyuA42hc2ft8879vYKGNQk/IeMxdpL96rUr66
 CYhTRePO7m1UL5LjjpgGamf1NffENM7jeoFv/p/gxoAS9pAENI5Je6+h2v6PCn+Yul0N
 yBMro7K/q1xALYTAlJRzsUKNPc/uO/zYPKi6y38fddA5KVV1avaAfFVidW6CUTelSg9b
 +InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266800; x=1785871600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+snw93O5L4IikZGAmaWl2HAz0eSkR4e2CEsA4s4dMC8=;
 b=FQQtw2CFVz6RVubKoaniOPt/45LjZ0cny7ftHUMngF0nntx6puP2MtrdeCz/jde6d2
 JPwzNFk5MkjMTGxjBJb9RisEX0Iab0NEJohnAi/jstYjlSl51vS4PN7Uuzb8/JsKVoME
 TR8I8tseiI8ILOre4Q+AUZZU9d2RvSVjrwlw+zaV+FvxPd+BrmcxGOu65fnNajnb1zqx
 GeWPESWQcyO6qgcGcsCp925iIbcK2hddjT/CVVP/BMulVXoDmLzqVuvvXHPm4VeMBi74
 knb7QtbfQg1ua92lUJuGHTj8rmoeLvtND3EMXw2xvcIOH03/BATqf+D1awq7bMX9Flpe
 x2nQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqtwW+N4/xekIMzZEF1yQ6Z/lpOIl8ifTvPVHTso+VSBAGQX6kEqmlcy7oHR/pg5YrcAKjJWnPrhg==@nongnu.org
X-Gm-Message-State: AOJu0YzXwuZRcu/wDYIe7uT+NLdb3IIJ1fwxnvKfru6wpV9xqBkyVqzr
 PjqUo1i+CmYhBMOJkSibveGIfJELMCL63o2IAUi/m2YOQJYRDpb/CR8ag8LjK/8dPDE=
X-Gm-Gg: AR+sD1012qv2AKq9gBZb2lJzF9Fy7OkJ1aJEZ4GZYCHfvTVJBq/bfMaYGGSsyq4SOmV
 +zDS1qWi4m50ekY5kL2xQoBbRsU+BL/CgStYc5+FFE8jvpGqy4xER1gVyIG2OVKVhnkBakDR+Jn
 z7MlHggTm/2PN9iBwCzVL+BVwqngNUeBJafix/FSA8PdnSi+zsabzsRJZDv1WQke9qHQhz/IH9s
 aSeU9wxpRyHQ59RVo5YAq8nUeZy79Rzkmz2ay6NXuIRrgeTxencBtsFh063O5xrz3kjZK8z+0T2
 R0vI07sVutVY/rejtdKHxnh8SrHkCs+TMULkHJ6m903z5+uLQaZawkTomg0kmgzBzo0mSSBDrUU
 P4wZTZIo1ecxjtkNGHvj6K+IrJeCZH2j3WqXxuPBbcwLxQzyOcVlC8ea1Bh5weKaLCXz7aYWkk4
 osABuBb0ewWuTF8OiKq1FwbzYLQ5DTGh997rlMVjA=
X-Received: by 2002:a17:90b:582e:b0:36d:b424:4f17 with SMTP id
 98e67ed59e1d1-38f6a3d55f4mr3991157a91.1.1785266799926; 
 Tue, 28 Jul 2026 12:26:39 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:26:39 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 03/24] target/arm: Add confidential guest support
Date: Tue, 28 Jul 2026 13:26:09 -0600
Message-ID: <20260728192630.240375-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

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
index 562a7c3c2852..abb56923ad13 100644
--- a/docs/system/confidential-guest-support.rst
+++ b/docs/system/confidential-guest-support.rst
@@ -42,5 +42,6 @@ Currently supported confidential guest mechanisms are:
 * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
 * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
 * AWS Nitro Enclaves (see :doc:`nitro`)
+* Arm Realm Management Extension (RME)
 
 Other mechanisms may be supported in future.
diff --git a/qapi/qom.json b/qapi/qom.json
index c55776af7d35..68de12c37c01 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1302,6 +1302,7 @@
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
index 4412fde065f2..aff52a3f6eeb 100644
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
2.43.0


