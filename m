Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BADC61DC6
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzD2-0003ba-HR; Tue, 25 Aug 2026 18:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCk-00035o-2z
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:14 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCi-0001DE-C7
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ccf2360620so3623685ad.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695271; x=1788300071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uun+UuCnOruy+78T99P3n2q7fn+cAO6lGcRn4VnJwcI=;
 b=xVKOi2ycy+TlvFWrqKotSiGNIfrV921hLUnbhs6bJaOoliLbyj/jmV+lvR/eRvWSwz
 qwX28FiXRa/imT2YQoT5qJh3fAD1eYEbcDm1bVIr16ARnPonAuoCuAPetYcHY0omNmZB
 ICTlysmPYsLza8TfMwKMARuC+5TJugdKmgs4dmthnDmrRgI3k81ExfBtfzzP4baAN7rb
 P8zJhDgj6yJoOBq+HGHSBpdK1EweOnamHZBoKYDy9QvNv9nrRa+0k/0vHx/pTPVCEu55
 sql+QWAx8sqoTDXhd2KnJwVYYJUL23yBlb/bx/U0fE47CRVMb1fshOj1mEvjNc58+ZXX
 cApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695271; x=1788300071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uun+UuCnOruy+78T99P3n2q7fn+cAO6lGcRn4VnJwcI=;
 b=oHF/H4StSpovOVFy1fzvmXfRzAPkNXLd1qgbppWvpdanx8ehpb5vqUSZyBZPE9+BO+
 HOTMZj4ohNwTUIk0pm19vwSLCI+ZFK8o0m8FvWWFtlc2IYZbKRH3Bxle5IBys1da85yx
 gWAFVH5dFM/ftEuzIjGNkPX/heKXGrqwOjjMVNQiE5akG9lmAgTr94Uh6CgpGn2mZ4Bx
 gXRTZp7l0FoqZ8/f/52bhFVazMrc9BJUIWiAQij2Pag8GM3zg4b1Q7fcUFvziLIRGCW5
 R+XW6DVppdKVNRtn5b5q0lENenBG9gHKHXcNcKZHlnWExmxW2oG/s+Kq9B6hAbQcY4tv
 Zw5Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRRwx+19DK5AjpSF2WXggj+Yt3loC5Wqj/32X/yxRWWpeJkJUZ9tICYGmXytyCco6jY0oMCxL/9g==@nongnu.org
X-Gm-Message-State: AFuF++n7tYXd2ZJ8McT2IoO7MXEgEq1HhgAVDAV+tqHqkxkjsSuBlx8t
 1vUzjMSEGI4PWf8oTF1gKIncAtDDKgaPTUN/fRR1VmzbQhs0WUQVmHCfN8nTnF7u5AI=
X-Gm-Gg: AR+sD13g7+KnSyUrE0a0bn2FN6QOUoWQdC9D+f+84bcxEk0qm0vt1q+o8Xs+jwBCyBs
 iCgwHPqPYSNLabCfDHc7fayUr1ItSbOm1InqwM8SmRphnTLA7i0UCbc+EzDhMx5Uf3stomf7DoC
 Ov59N2KcTW3/IBb9stxV+49Y03tPds/u9k0L/ZhfGHCPzkA7/KXbyCh0UBLKf7OMhJ2JAhXLQ/o
 E7yjNBaCspDJpFOahQWE3pI/n/2s/kjDwFoFAtc2j/4yFZGGQumra0GKkFhODCKaw/GPxZ+7k5+
 q/xMfDrMftELrI4cL4ySqgaMmqQgUrZPaicQUAtTQxwXwy6zSXPWkcBJZOm0CE8NmeHQJn+Lkyr
 MptzUc+UjvCWXVkz7MHaWyVItMZ84jdHmivC1c48CyIZvXIyHV+4W/V7FF5c3nblXXCrNCpKaKO
 A6Ar/l935+58ax7nI48AfoEcHXe0sIwd9Cp4X42cS2vrmmSP0uZtZs3jeuxBXZGIDy/ZlnFQ0UI
 Jnvj5IfLaOutMNO
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id
 98e67ed59e1d1-3966d13a242mr4229936a91.1.1787695270354; 
 Tue, 25 Aug 2026 15:01:10 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:09 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 03/24] target/arm: Add confidential guest support
Date: Tue, 25 Aug 2026 16:00:40 -0600
Message-ID: <20260825220101.3443954-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62e.google.com
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
index 037c07879986..edc902c88c36 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1216,6 +1216,17 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestProperties:
+#
+# Properties for rme-guest objects.
+#
+# Since: 11.0
+##
+{ 'struct': 'RmeGuestProperties',
+  'base': 'ConfidentialGuestSupportProperties',
+  'data': {} }
+
 ##
 # @ObjectType:
 #
@@ -1272,6 +1283,7 @@
     { 'name': 'pr-manager-helper',
       'if': 'CONFIG_LINUX' },
     'qtest',
+    'rme-guest',
     'rng-builtin',
     'rng-egd',
     { 'name': 'rng-random',
@@ -1351,6 +1363,7 @@
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
index 4723f9f170ad..544df5c84d79 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -20,7 +20,10 @@ arm_common_ss.add(files(
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


