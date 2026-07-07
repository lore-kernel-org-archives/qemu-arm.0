Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA65C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:46:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVi-0001HX-HF; Tue, 07 Jul 2026 18:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVg-0001Ea-Pf
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVc-000452-Hm
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c9b1edf2bdso1108195ad.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464196; x=1784068996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/EtuxP6qUgKAfe4TZdc89W+i3osoTftywciSv3aaq0s=;
 b=PUcAquOsanYQdx0KGMjkqnmiyUtmQe3HnB9TSMDsEX1H6chFwu5k5XAk66Ohw95D9V
 pa2afuhu3D/ox0WmZnRQwlvbnOgVs7964JFA3Pf69V+uY/7cfzwKr9QXuNJkKAlVtmKx
 p0O3yaPZpxEVkkMmsjIZYE2ftSrnEXg/Ub8/5E2HhhzPcBoCvLGYFE8HlQRETJq0pVK0
 vlZBcKc5m0NtJyXmyN+2UZcewWwNcX8xSBxJV7Ar6GAYuLgZFL53c99FT/YuDL5rv8uR
 4BAhPw4xMXd4B7Sva/XpIVhZfWptnNL9Xuv5kMh1G8J1HftZvVxQ/GVXuVJtSK2JyhfX
 cn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464196; x=1784068996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/EtuxP6qUgKAfe4TZdc89W+i3osoTftywciSv3aaq0s=;
 b=H/cJnOthhjfVQ3olByZV3EJdGMSXRvw1R8Wqcr/kNNai1Rurpg4mCXoT7nzUDCbtUy
 XXS+gi0q4JtOW7aUh+kzi7YWB5ifXM8HJT1PVP6RDH/MD401tr1wx+MYUE59e3szFwp8
 1U0/pSX3Hsy+I4dOlH5OwfytpVdqYHpwcOMdT+d+ulGyKzxLqLMzHq6DMho3smO9AWQI
 h92Gwt1euubrhFexbBO8bydwN7dpR9fkj0jc9xM9sJNX8SvHTOOsQ4NP2Le/7InVRFQn
 9CNY4WDfLTWKOoHnBe1is1dBjXtGCe+KI+UmzGn+wi9P8ll2T8TxBLzTAJ3jTMPWJuQ7
 w6ag==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq96vfXe+mDreg3WKOXb4ItaY4Iwtv5u/RLbR82l3tYLTgm+qexCYdzKWKIdOPMXXDhmorec46bdw==@nongnu.org
X-Gm-Message-State: AOJu0YxAq9VOuRoY5cBEFKBg5PhWGd4+T+E1ZxObUR2CwSlS76Wm+5py
 z2czmjARU6XSLS5CLl1K8S5guTE0YifxWN2bu4sNInStB8a7OhjMS6R/QWFRXPWrguY=
X-Gm-Gg: AfdE7clCekLOp5ook0F2WCS0zfP4wxpV3T4nujpdKfDliIbRz/WDz5SSb1ehNzRc5D/
 Pl54A/WVXnLMw6FUbHfknE7kFfj3Y7JPMsuuy+LVsyuMjMp2b2gHDeMXSryM5qTMSxcViAnLiZX
 BhXUzcZfU45HBKCX0BFpNCB9ZmNYrLkr4lud0xjfSd6LHlRHFd8md++7skm/SVX3pyUTaZqITyF
 QH70EVtxx3UqqoFIbonqV3MI/KtphEp2rvkBfqb2BuHDRd0f3/sAzGcxtsDdSbLYOO6LVmEs1To
 L22Sjl5gBTh1V+fm3nIShQscaPpBWLs+QmeOBlMzMfpxgqa9g2lpyVEQLKZCt8URzSmEmzINMeV
 j62rBpvwnFidpQTNonG3eyTZVqhhGbAx+jS4LGr8NQfhs9ugzcQsG+809qgkOw7bxfG15vEqocK
 ndADcFbl7gOFUqa4EPxlt7PKhsZLyv0olnjBG6GFc=
X-Received: by 2002:a17:903:384c:b0:2cc:90aa:8787 with SMTP id
 d9443c01a7336-2ccbe724a21mr71744795ad.6.1783464195895; 
 Tue, 07 Jul 2026 15:43:15 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:15 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 03/25] target/arm: Add confidential guest support
Date: Tue,  7 Jul 2026 16:42:44 -0600
Message-ID: <20260707224306.1202330-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62c.google.com
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
  -object rme-guest,id=<id>[,options...]

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
index dd45ac1087c3..285d32c2cce3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1241,6 +1241,7 @@
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


