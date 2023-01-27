Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232455ejc;
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
X-Received: by 2002:a05:600c:35c1:b0:3db:1424:e781 with SMTP id r1-20020a05600c35c100b003db1424e781mr34544526wmq.23.1674832558093;
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832558; cv=none;
        d=google.com; s=arc-20160816;
        b=UvvZ7hSFOez20VSQgbAQQe33VNwlNLk4LgZ+Rk8X0UFh5a7B0SqIBCUmDKVLwoJJ3H
         PDBoiIP74UqrlgMfGeXMxnaPGxdTFrUveXaeHkROZlZPM08aX/o/ggIMNHujCDrDKQjo
         K2qQdmXhG09NU7rii/1C27O9aauLlXEzCs38kyu9WIxTI8nQnxl++VexmCvVNtOUAGSL
         boxNfr18ITckmAIuqi5nHTcgZkrSUK0Y0i+hSE0U5tWBZHquDlOfivqAYcmEL9v1Ak/b
         IxLh2Rl0deE5kc6YhSoLsqOAqJeDwakeJNG+ZM+s+zwevMnRMom4mt0MidY/b7lgc0x4
         4fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JRh6Zd7yURln8ss/3uCQjhMmHZdDScQS9IWz9tbNtyA=;
        b=TjdwpT/5haiwJ5JdNtcfeQtRqnWV4pzn6ktBcxyinmt7Aj5WVtpJvUp2G7yDBfwKku
         Ub6127u8XtjnHJpYBdaO7k+mYaQW2tLfstiOUiKXjQVXDpT7Evg8bmjoQ5PcYBQNtaPn
         KN4dYtkzAJi/2njWDnaJEAJfxYDrwi2gr6PDIba95K7lRvAe1UaiQtbxukgmDDuf5VsH
         ouQorFW99oQ8NIs5zSD9bUYfoajBIhBw91kEMXW7o9fHmV70QoZCmQrwjosuV12Eg5Ix
         D0sKp20nkQPvhqxU/irfkZ+skIuiXxINuyktRv6wFLnn9ljxB/TauZEv234j2cD8NBk9
         5GfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+rwphML;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n25-20020a05600c3b9900b003daffc3a551sor1645638wms.15.2023.01.27.07.15.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+rwphML;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRh6Zd7yURln8ss/3uCQjhMmHZdDScQS9IWz9tbNtyA=;
        b=i+rwphMLjmk6oKkA4//+2PYmZu1Mp4iB0X/UeXL+mO1j7ppvC3/N5OleZvXaCFpb8Y
         6V+6LplTd7bCbrbbn+Hs7672wVVfFYSVf174UQvJVI1DX/xwPHgT2zCYb9iORRpojyT9
         p1uZ17Sk4wxcROQGWVYiTgYx/sflyph7lrtbT/16n/Df77V4gisFaQpUGpTConkVJbA4
         diFewgZcJ7SWNO3vmT7+xJxcijmqU9SI85lHvzCpO44w4OvSTlUPJSb+KJ0MjSEx4mGx
         9dLzvo706MpLNLZlyO+C/H3Sp1ZxSWl4VnqcS4mtkSxbABfuoYyRHZSzlbH5rR6SGaDw
         GxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRh6Zd7yURln8ss/3uCQjhMmHZdDScQS9IWz9tbNtyA=;
        b=enRVOCki6Grl+q5lBt6n83TEKPjGUsYS5rgiykZ3AW1dw4Vd2aLuuGSzNVMp/hDU0v
         mI95KHzuRD5JFHwgM/tlZ1pK3nZpphvfBm/haMb8nk8klEjP6LO9gDSrPw08M+2vhsrv
         47Hls0M9uEWnoxLfstXrYOs0RZLrHzDFTMBgy6ufezSjnzji/hUz9pQe7sjPgJRItBQd
         L3CuBzqCz3mUWUwCh7XgcfsZjU8Z5HbBkwkt0RU45DCOJ7vHrHBxCp2K2LAy/pfRh/V9
         r5EQoh1cdcp5Ahdvsr0iVK+5r2eatYb8L0N7/FMxAsA+D9ytU2+I/dkM6Dw6SNxsy/Ka
         gpWg==
X-Gm-Message-State: AO0yUKVnOIT/4h75zWG7CC7lh7kdfWdNyTT4ji2aNXj8+/m3kwsv6A1S
	WXsIkK82T+Lunx1ihx1Yh08iVbRA
X-Google-Smtp-Source: AK7set9uZwUVX7qiIlmt/JjGTgC6uHAUHR60SnBlrYfTdSnmscfOfsYbRlCfeYwIpdHCWmo29wOiLw==
X-Received: by 2002:a05:600c:3b82:b0:3dc:37bf:c634 with SMTP id n2-20020a05600c3b8200b003dc37bfc634mr2745999wms.15.1674832557876;
        Fri, 27 Jan 2023 07:15:57 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:15:57 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 02/16] target/arm: Add confidential guest support
Date: Fri, 27 Jan 2023 15:07:15 +0000
Message-Id: <20230127150727.612594-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CNW0fRrvxuKR

Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
support the Arm Realm Management Extension (RME). It is instantiated by
passing on the command-line:

  -M virt,confidential-guest-support=<id>
  -object guest-rme,id=<id>[,options...]

This is only the skeleton. Support will be added in following patches.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 docs/system/confidential-guest-support.rst |  1 +
 qapi/qom.json                              |  3 +-
 target/arm/kvm-rme.c                       | 48 ++++++++++++++++++++++
 target/arm/meson.build                     |  7 +++-
 4 files changed, 57 insertions(+), 2 deletions(-)
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
index 30e76653ad..7ca27bb86c 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -917,7 +917,8 @@
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
index 0000000000..22aa3dc712
--- /dev/null
+++ b/target/arm/kvm-rme.c
@@ -0,0 +1,48 @@
+/*
+ * QEMU Arm RME support
+ *
+ * Copyright Linaro 2022
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
+typedef struct RmeGuest RmeGuest;
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
index 87e911b27f..a2224c0d23 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -40,7 +40,12 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM',
+  if_true: files(
+    'kvm.c',
+    'kvm64.c',
+    'kvm-rme.c'),
+  if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-- 
2.39.0
