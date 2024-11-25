Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569236njc;
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVr+J/RdWajtE2UBs7tKbTbdmOixhMZatkGXB/cYisUIYyRupAiihmBKR/N1B/NCM0JWKZwfC4HT1xNWQ==@linaro.org
X-Received: by 2002:a05:6000:144c:b0:382:40ef:4323 with SMTP id ffacd0b85a97d-38260bcaed7mr13004783f8f.45.1732564766310;
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564766; cv=none;
        d=google.com; s=arc-20240605;
        b=XaXVrwlKXjnOipu++KGdmqC68yQHW36TsVJzYC7KuOihNj1UUZnlonl3PBhrHGEdeG
         +CAHIWhQ6N2tx9HYoJkVa0OLi4Tv2Ki6EMA2BcH0BvcvMhQ8hxVjLBh3gO10xBoiyBge
         3qy7R12kc1ldywxD648f63AHvb5B/StjfmIt4pD6WGcVoJKbIY3wxM5tgRbxzJtIGHJc
         2BEluJ4JJXkdnBRQ7RfIfaTsfwQEhIdhIQk99iLYG6xct03VXQf57sC0NkQMu5K7YcDX
         9sKBUtARveHwkdEs0l/+l4upyLUvV50xeHKLJXUgWUYPSkpq8F7BkhwmIQ5jsXvBA/Vg
         zkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yDanRZ41COf9qTLckEjQq0Cl2uY26nz9MVJ4DyeUoVM=;
        fh=TOX/gAvcBNqHpc7rams4+5pbQBPwlEYvvruoN4Iw9bs=;
        b=SoWL+VagulaKztSyjHxBpM6fCvroL6mmOW68ww38wUX0bVdNsinjNwBXVOPflK0cDk
         3eNPUpKsAhrl1bUQ9xk8V4SeH7slfNp5qRPgV2p/YmpbRsGqxzT0ZsMtNGN0J1vPqd7Y
         CVSuW7RaDT5Bw0OBBKeLk3RgSfSKUP0z6J92SHc+jfahtRs1zmGn2RnigO357WTVvx7f
         2HLoII1XU3+nzrrcoWT0l/SF1bCJqJCeUlF7s68lRodknny7RRY+2ul0RZ41WzkgXn75
         goy7Tv0AD0HDWsGv6WTGV7VRF13fWBtWjxJzGSxFJIpuA4wnNJrkltYITl8uwKSIW0AT
         2ftQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQFS+LoH;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd7e5b89sor42125805e9.5.2024.11.25.11.59.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQFS+LoH;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564766; x=1733169566; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDanRZ41COf9qTLckEjQq0Cl2uY26nz9MVJ4DyeUoVM=;
        b=KQFS+LoHTprhGrp8RCzz8JqwGurqNvuCGX0PlIaUhtiVign6m72raoEotdQvIx+hsQ
         lF+1e771/m389v3y5LSzZ3D3tPUFS9MCfp/9O/kzhvxQtQiDeeFUnfjF0ejxnV70MxuV
         CroVWASXjJ+fooqTP/kS3+95W9voyvV6QbiY//hT3Ecjq2nWbZpDUX6jyF1QtSt6f4ja
         I82/ZBm571TJBgvn4Jx3Hvk6vNB3Gj3s86Q0eT4VCl4drScwi94r5sKPE03PmXq/ISDz
         FML3sh3KUyKsoOQXm5UUOs9Pz5dyOfpxMB38JZGl53s2A/JSNQX4TZEkf7EVxJkK/LoB
         KQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564766; x=1733169566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDanRZ41COf9qTLckEjQq0Cl2uY26nz9MVJ4DyeUoVM=;
        b=CYVc7GC5gmPmdCD4Kxsyy8zZ2Vzzlxwnuaxns1qAIt3Mg81W12OZw7+P4rcF9XRpJv
         tOvdhlFcDu1IRfUxantdT2DBN5n4shCq67A7rwyczcfjss0BdpRWjCok8zLyi3FugeDa
         D03yEXnoNKBgA2RSxvX5UG5fdlQzsfpCzF5DpxuynxNtlgqFaTGUdM+gg0HkpO9vLiA6
         k47YDCyb/JhPh92jdrZOT/b31DWX68L8u/FyIH7NxqIUMYrMpMxomriyY65+Kw6XiiJo
         /JU/4YCqUqShYLqIVmso4sC6XtqKROyycHGeB3UpRNZztb6wAbp9YNoMutiKYHMDhyqR
         JySA==
X-Forwarded-Encrypted: i=1; AJvYcCUXHUfUmcvENghOfo5z7U4iwOEDnkyNccckdBpcxwsEN1rSBiClvFTT3dtvSNz+bv/6/zOptY5L8IZ4eQ==@linaro.org
X-Gm-Message-State: AOJu0YxvXSt9rVdyLbINlm96VHp6Djsuptsx4VvWafhwDENyhArSZOob
	/7qJARX0RtumfZQ3swakyQTBo78i+/u9o8QCDmmGA5DNtWl5m8sIo2XLs8N6OFUUf8D+URtsy6p
	qU5w=
X-Gm-Gg: ASbGnctn+58m+fm/67IaK+bPJWEx0FK25MogDSt4lMlDD+umOsK1p86SpJ58rup6163
	ZCzubwzEIoocqNmjVaDJSE9L6tq12QTchXWAAMRrL/Xg2SRvZXTANWQ2IMMEBv3/DfHilP2lm6Q
	uZQ57aHgvVWD1ZNrDDwASRXqpq95q4Trt3IDcLcWm8oxhIHoNEDIvkRsIDem/pSow05aHIlU+Ot
	ZobUYD13g738rn/d3j4DJjH2ydfXbiTKRvXBKhTsV8RMD+mBBI0YqoqvVDmuRF2tMgi
X-Google-Smtp-Source: AGHT+IEKWiu9Gp+Iust03Qntq+lTTn6PE7oIa8qEmxB8CKAOsTRCh9uUchQpL9TfWU7/drGclc4GbQ==
X-Received: by 2002:a05:6000:2d08:b0:382:50d9:bc7c with SMTP id ffacd0b85a97d-38260be6bfamr7331620f8f.58.1732564765799;
        Mon, 25 Nov 2024 11:59:25 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:25 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 02/26] target/arm: Add confidential guest support
Date: Mon, 25 Nov 2024 19:56:01 +0000
Message-ID: <20241125195626.856992-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RTUaSQWQ8Iqj

Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
support the Arm Realm Management Extension (RME). It is instantiated by
passing on the command-line:

  -M virt,confidential-guest-support=<id>
  -object rme-guest,id=<id>[,options...]

This is only the skeleton. Support will be added in following patches.

Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: remove some boilerplate with OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES
---
 docs/system/confidential-guest-support.rst |  1 +
 target/arm/kvm-rme.c                       | 40 ++++++++++++++++++++++
 target/arm/meson.build                     |  7 +++-
 3 files changed, 47 insertions(+), 1 deletion(-)
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
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
new file mode 100644
index 0000000000..67909349c1
--- /dev/null
+++ b/target/arm/kvm-rme.c
@@ -0,0 +1,40 @@
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
+OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
+                                          CONFIDENTIAL_GUEST_SUPPORT,
+                                          { TYPE_USER_CREATABLE }, { })
+
+static void rme_guest_class_init(ObjectClass *oc, void *data)
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
2.47.0
