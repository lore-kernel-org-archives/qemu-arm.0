Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497926ejd;
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9Q75PSyKY8ELJeHGRN8Bnq5TH/ECQXL7PoZMyUnACXfmuMFM62x/OztTZsSQ1vQp7Fo2+E16xvP2TRZuiAVlT97/vg2W8
X-Received: by 2002:a05:600c:3148:b0:418:f307:4b99 with SMTP id h8-20020a05600c314800b00418f3074b99mr1784626wmo.9.1713542388715;
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542388; cv=none;
        d=google.com; s=arc-20160816;
        b=ewwUiLu1yQ8BoOOm0nSRmnGYspolCppdxR5jWN/5pNvmdMN3SUsvI3zvWQv5jsCDik
         u7OmeNDB5Cm3b9OpfIda4/bwXuN3vXXekPDnixTzFLVMoputJl8NQ11WcfbmFTG4ufBv
         HsndBobdi/yzREQ2cLNj133v85AQe4q49Te78cuKu2lYZiNTRFH2oUCe3hnAgemQY/Ai
         HsO1qECInn5S2GgDDVaRaqHmmLvE5CtJr3reQ4YrjuWYdcxhNIEBgCQ8r/SiNZGjBeKZ
         2IiiyH7m+j3MavqZ+V6hlJW/9RYzHhXgJSKzUVWw7uomqjynMAIAD7JRG/FuQAxi2R0w
         aXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WHJ237dkf2kJpaGwj/VrUeZKq0pv4D2ZIu3Md4Bu1Kw=;
        fh=xRkvvHCsnjHUDEMtugSUloGR/3woN3tDEYpABGzJcHk=;
        b=glK6fTE0B5xersj2uNR5ynmej7ssm5cyF5qEVkF3FK/mX4t3Vz6oNe6aQjITw8ggBg
         3BbFHbQNJENjKz4SH0dI/J9o1xbvMyYqCNF8Z5GIgU/qB6FeQcjCRWH88dE0otzDYcoN
         VSVijIFY3t4ttKWzu1OsDn1MHPsO9DKFO/pyVCd/E2DF4ZZtZ+b/rtJ9Xe1tYzMpmgs+
         GA1dWN5xgmJxr7+QvyqE0oIRARCl+yD98S1XUxvBNTPU1bBH7RYWUmmX7koLzLLPowNS
         zpjpokUu/Oik6GjHFuR6sTHjlAghuvzTBl26Oz796Y9/xj1lYaimTiRsrgw/KwejmmMe
         HN0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIr7GnSo;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz11-20020a05600c580b00b00416626c400fsor1323412wmb.1.2024.04.19.08.59.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIr7GnSo;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542388; x=1714147188; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJ237dkf2kJpaGwj/VrUeZKq0pv4D2ZIu3Md4Bu1Kw=;
        b=YIr7GnSoLMR8xXv++beJhY2Opf+EDW3tjuUWG63AKMReDx3Qa+Y5Gm0XEg5miFEqUU
         dGSlVsLMz3Lpho0UMbdwID6Qgx23EFFrBdf2XpXZzy37q4/sCwCyoGL3V3JjcHkyev2Z
         yX8xMMGdRCOK33kFwMRDJVG/Mq5oKXqcx2u0i1QE47OOJqM8NUD7aNGNkzxONeQHw1g/
         ZDewLyO9G5cSfnPLPnYxA6MKIymGsmvkHfjHKQpO6xX8fVGo1cR3BGAQqzIQLiKBBpmh
         YZlrRfkn/Ic+Be4WWwrNcGhIfOtkXfAybox+ZYFLzdKDXsYFe9uOA9xffTfztBCXU7mL
         HG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542388; x=1714147188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJ237dkf2kJpaGwj/VrUeZKq0pv4D2ZIu3Md4Bu1Kw=;
        b=IbVsXxYr+TumVlD+65sBrIRNG1gYeboO4od2oHoJs/3far0lCYo2ouIsT2cHtc9lw5
         xZPvL3Ae7KhdYt5cc8MmhqkP4HoRmFyQYRqR58AK+12UZ5JVps8zaMqq8oybhz96MDnm
         SyB78f4RKqziOuavwrUWuLvW8cvxz2OZo2nqTj5mOADLenRtpfKe0OPpQW4tYdKfBa5v
         TI+MqaiJgOSuG56XGZpou9ZIQoToeKM3B/rlF709ucBmwDs1yFQqjwCWeCIh91ktJW7x
         THFUqgZ6lXnsoQYZow714O3Ms0fzG+TsscZQeScD0E6l7WxUWbvLGFICmeztFZUz5TQV
         wZtg==
X-Forwarded-Encrypted: i=1; AJvYcCUNZ038sUM1UhJ79p7K/aCQot9krwe2/+F5dLl2usHsrTgb5MX70BRNkuJAiJfspV/LmI4xO/RIpWLGznZGBuz3rav7pYxB
X-Gm-Message-State: AOJu0YwoulqyZA5+snpaKpOxrO66ZgSo6I8qLMUGFWJmzjwpDaFZZlxo
	cTKKdoaW9X4sBayT4yhTChNCyOPT6E2s9WEOMfdUEdFNrPMfIoXrjXqdZvxMOxcPcw==
X-Google-Smtp-Source: AGHT+IGlBA950nDjW7CG1uLSn0MBVse+OwbjPv7C46uF3Gal/NNnyKNA4TJwKZ9Al41bcIAubUbBHA==
X-Received: by 2002:a05:6000:114f:b0:34a:19d0:d907 with SMTP id d15-20020a056000114f00b0034a19d0d907mr1645758wrx.37.1713542388388;
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 02/22] target/arm: Add confidential guest support
Date: Fri, 19 Apr 2024 16:56:50 +0100
Message-ID: <20240419155709.318866-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mDgoJd8dfFau

Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
support the Arm Realm Management Extension (RME). It is instantiated by
passing on the command-line:

  -M virt,confidential-guest-support=<id>
  -object guest-rme,id=<id>[,options...]

This is only the skeleton. Support will be added in following patches.

Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 docs/system/confidential-guest-support.rst |  1 +
 qapi/qom.json                              |  3 +-
 target/arm/kvm-rme.c                       | 46 ++++++++++++++++++++++
 target/arm/meson.build                     |  7 +++-
 4 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
index 0c490dbda2..acf46d8856 100644
--- a/docs/system/confidential-guest-support.rst
+++ b/docs/system/confidential-guest-support.rst
@@ -40,5 +40,6 @@ Currently supported confidential guest mechanisms are:
 * AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-encryption`)
 * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
 * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
+* Arm Realm Management Extension (RME)
 
 Other mechanisms may be supported in future.
diff --git a/qapi/qom.json b/qapi/qom.json
index 85e6b4f84a..623ec8071f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -996,7 +996,8 @@
     'tls-creds-x509',
     'tls-cipher-suites',
     { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
-    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] },
+    'rme-guest'
   ] }
 
 ##
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
new file mode 100644
index 0000000000..960dd75608
--- /dev/null
+++ b/target/arm/kvm-rme.c
@@ -0,0 +1,46 @@
+/*
+ * QEMU Arm RME support
+ *
+ * Copyright Linaro 2024
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/confidential-guest-support.h"
+#include "hw/boards.h"
+#include "hw/core/cpu.h"
+#include "kvm_arm.h"
+#include "migration/blocker.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/kvm.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_RME_GUEST "rme-guest"
+OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
+
+struct RmeGuest {
+    ConfidentialGuestSupport parent_obj;
+};
+
+static void rme_guest_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static const TypeInfo rme_guest_info = {
+    .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
+    .name = TYPE_RME_GUEST,
+    .instance_size = sizeof(struct RmeGuest),
+    .class_init = rme_guest_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void rme_register_types(void)
+{
+    type_register_static(&rme_guest_info);
+}
+
+type_init(rme_register_types);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2e10464dbb..c610c078f7 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -8,7 +8,12 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM',
+  if_true: files(
+    'hyp_gdbstub.c',
+    'kvm.c',
+    'kvm-rme.c'),
+  if_false: files('kvm-stub.c'))
 arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-- 
2.44.0
