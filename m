Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F461C61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:41:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEZ-0001K8-IH; Thu, 03 Sep 2026 15:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEV-0001GV-G6
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DET-00046u-5a
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d9004f39d3so2769055ad.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464179; x=1789068979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5FLJuLA46SDmJixQDc3xXINwsQvKq769fvjo0KX4+Uw=;
 b=cEHWwK8QCA1sU+/CoMD7axBtE+DW1KeXP3WmsLahcSaoHfxE12Gu0YEFWjkJdTQtJB
 Drqq3R6tjSdkFL/89QU1Kb0UEWN/2Ys+bUTuFTr0giJ2wUpJ3f+j53rJmCELf7aufpjs
 +6wiUjxxOzC1qsxSfyNtpMFx+6GvybZFgsgC8wQ6vLq343iAVJd/iaxMGadtRHZg2fED
 EVOr0kj9riQeei1DyzDsWo68jzEdmzRbH4ALGvuwyjSMaU6zomNDfog31EJGyQvZMunu
 +dUO5j220O4tFK7iYaYr7HINPdUUGgTnN9Vhw/t/c1fJxdgCSiv6ZpFWBspJFUY4vVT8
 7zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464179; x=1789068979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5FLJuLA46SDmJixQDc3xXINwsQvKq769fvjo0KX4+Uw=;
 b=fZbr+iEoeKczsQszHm++Lv1keHpMkp3hbH6aW7KDtN6d9b4MW1b80L5It5LYVrtuVE
 kfc+9wUok+T4WTjSjk0kWJCzSKgyoVEhUPaPcfLu47eygVu8fzMepros63qHnOD8tDGp
 B2moK/2wD0tRAeyGea7CKAdWidycQOTEeGTMlfBGsxsixPEa9nM9eDikAEEk5eyQDiCI
 /Uum9qykrwcFf+egQlySE2mbjwnkA08GwaaU1sejvFwn9zgstqsW4wBiFOtVZKvhh5Kv
 yAV5wvnGP/wvqiws/dC07q2WlPwVHV+XtsFPQEQIbYYqjnJ6iHgyNxLKo5a9txE8KYos
 2mAw==
X-Forwarded-Encrypted: i=1;
 AKwUvByLyY7qFQab7IgDxLAlgLodNQWVzJjdtdqZt1e8P8OEM71TtOSofxEs63mxOXtvSuMatw+6JiG0lA==@nongnu.org
X-Gm-Message-State: AFuF++m86UAZtnkx/P1JwclI2BohxESK2ijitdVb72cTW6QYyg1Np4un
 kPpnQKtnUqbOHFwWHJ6ahzT9LyeuKy5UJWYw3jJ57v+OGRAzHMg/4ErYAJf5fJHIy30=
X-Gm-Gg: AYBFou1F0xzxdc925v3aVeMOHguLR4ETXTFxlGRhBLmNFr4xYrLrhlcwA5kkpWLCOo8
 H4+WeQtFCeZK7WZta+2BuByi4rbWtOQ+r/Qaq+a+dOH6TeMKlgXw/SrpU/Bct2qK1ImRbsQevff
 sPPiv3qOtYMGJtE40x32iSlCEIX5z8UUeXnVFLNivUK+QZ1sRtpuXy0wz15ZtF8EGkQ9JhZphEm
 qMZ98jGgqhT8VRcyrqsDok9TzQm/0+svonpHpZB0SvkCvr/x6DCW6vNdAXx8xgf4OQ0wOOloJhs
 MxWV8im0uA9daFY4vIk9szwxhZ1RGFmvIQiNngiK3OyYfoIO6stTfZKXpAp1am/+n1GJ8AWlIAD
 XoCBQvhCAf9jFkifLARFZg17bB99h44OIEbG10txePEKbDXQat2iFuY+2L+/egP79+CyBEnAUSt
 x5Wd4JzY6DEyO/MKzBSuhkusYl2Lro2nc9yxKcgTmCK3eDsk0GZ4B5DUYhYm0cIUhQssUVsUUmO
 0n/+RcBqxjfu9x26HsvzefZYgc=
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id
 98e67ed59e1d1-39b2616ef8amr1085128a91.11.1788464178684; 
 Thu, 03 Sep 2026 12:36:18 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:18 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 03/24] target/arm: Add confidential guest support
Date: Thu,  3 Sep 2026 13:35:50 -0600
Message-ID: <20260903193611.1058589-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62a.google.com
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
 qapi/qom.json                              | 13 +++++++
 target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
 target/arm/meson.build                     |  5 ++-
 4 files changed, 60 insertions(+), 1 deletion(-)
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
index 776b13027fd8..52997c29a32d 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1288,6 +1288,17 @@
   'data': { '*pretty': 'bool',
             '*close-action': 'MonitorQMPCloseAction' } }
 
+##
+# @RmeGuestProperties:
+#
+# Properties for rme-guest objects.
+#
+# Since: 11.1
+##
+{ 'struct': 'RmeGuestProperties',
+  'base': 'ConfidentialGuestSupportProperties',
+  'data': {} }
+
 ##
 # @ObjectType:
 #
@@ -1346,6 +1357,7 @@
     { 'name': 'pr-manager-helper',
       'if': 'CONFIG_LINUX' },
     'qtest',
+    'rme-guest',
     'rng-builtin',
     'rng-egd',
     { 'name': 'rng-random',
@@ -1427,6 +1439,7 @@
       'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
                                       'if': 'CONFIG_LINUX' },
       'qtest':                      'QtestProperties',
+      'rme-guest':                  'RmeGuestProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 { 'type': 'RngRandomProperties',
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
2.43.0


