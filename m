Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408170ejc;
        Mon, 13 Nov 2023 07:21:37 -0800 (PST)
X-Received: by 2002:a17:906:25d:b0:9a1:f1b2:9f2e with SMTP id 29-20020a170906025d00b009a1f1b29f2emr6446471ejl.2.1699888896818;
        Mon, 13 Nov 2023 07:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888896; cv=none;
        d=google.com; s=arc-20160816;
        b=tvHYPyp+AUPdTh7irait7LQgvLDMCCGPu+NTG2DAZkzgH654gUz3w8iGBS8JUIoI+u
         HVJMpBaRlUMODYrnIAotQS8vz1hAz1ji4fIz2Rugbu/3A4E9oapMBlFXAwPXdhqENHa8
         kt/UKP7hCAe9aIklpUkF/+KhEPgNs7enHe4qnJbYSHzdeKMH24YBq6PZIQ4nfJdYN7vR
         Tl7Xz3YlAWjHOPoCrG940WdoSEML18/mpwk2Ww+rN6d6hVM1og1k+xnTsMohUJaI4nGv
         UhljWb9Cbx3wffTerSvKY/bpdamP1NrR4cp7koJIIHSq7pYsWrXRdvhiuPyda2sLjk4H
         xB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dMhWA/NoPTBRWdKt+DCwjQph3Exp2cV0GiTpIObeWaI=;
        fh=5eGtCgBHL34nDkwLndgRZ3Ma4iHTMPx0sRxXrx6dijw=;
        b=FiUOR5GJS4hJIzG/IRbrc6a3WFmTMrcOaCPY38f6NQb3P9No6tyr+PRgEFdh7xD6Fz
         SE4a0aX6fYijTvdrSwOga6OiWPjOnLx8haAUsNM+hHOs+cgJV0B8Tg60t01Ob0Mc/v8z
         eOGIasmxqsvQ2g7WaJsIqkXfNIcCMnB0sjDhBdhDJo9juCWUiUL4GY7v5rgRBrzrtI9Y
         2fceiTyDrMUO3YPbdzWcx3SfE8g3aegh3Fqcu9ZnQbcAPwq0127A9crOZSvJ0p3Jg/Zo
         EMEal/CTqmueS0++gBjgikf+1Q7BtDuafSh/uzCmCsVVMvmPgRRq6wwrIBUzIcwPJVox
         fK9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p12d3wml;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hs14-20020a1709073e8e00b009e6da4050c6sor1567743ejc.1.2023.11.13.07.21.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p12d3wml;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888896; x=1700493696; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMhWA/NoPTBRWdKt+DCwjQph3Exp2cV0GiTpIObeWaI=;
        b=p12d3wmldLj7jkkngBNVo4CAQf52ZrYmQvbjRr5nJl1wVmM8XnZHM7SOZ/nEI04i0M
         TsYQ1N1ENoErLHnq6TwQ2zfAZAFc45BBU7XGr7JbslJFuhTan/6TB+XP6cy030Jqg2Sc
         ie07HKFmT1csrRlg14+ENXoFgkUYg1yTStprm4mTOD6dYgnO+ksGwBbJjVmayIKD1ut3
         4AQm5jRgu0y+AwR4VkKzU5tXx9Ls8zPiScvRY3Qy42oxR7+UeeXfElPF9lPI9Emj31FD
         O6DzVMWWCdM5L8WOq7jFHur+a4g5BmhJopTFtxK3KNQdEwJlEyeBLJpm8jVC4w/XhJ3i
         d6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888896; x=1700493696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMhWA/NoPTBRWdKt+DCwjQph3Exp2cV0GiTpIObeWaI=;
        b=cpzstS4xDBTQbhH+LCF3wxLQJsB3wlR46Gy31PgX/S2ClE9KLJV+hXKGs3kSEuYnHg
         WGktopkR5CG9YcVDriHaHTc4EOmycuiPGKfOkcyt7paASflhhIXqZhYSMfdPkJVIcs1s
         ZzFa+16yzHkOWxIbo57nvdDyYk8FfY3/80McoFuOWdO+qsxjvRPufQtL4dRXoDQQkF+O
         ktM/SGIhEM6V9lHPdO/u7rDoEkIWShu3CCh8VkVRcHo8utJ7LE1vv6HcQDjy/zqfjjoS
         PkZo7AxREgjlDvxud4dSpkB+pexcEkqd1eXmgZvHiLx7Dz+92FAgWc6zwD75y5g2ADaM
         ymPg==
X-Gm-Message-State: AOJu0Yyfp6diy3oqo8oACgggSN71It4grr2aR48jx0jwhlb2fHjuk6FQ
	wLBbH34gCoYJ9P2KLa0mbt5okxA8
X-Google-Smtp-Source: AGHT+IGc2vVbLMMmJTrJzN8L348x5fFie1XMuffaYHScqr/mEvB+nkKPvDnad4c+cU6PUAspz7oR2w==
X-Received: by 2002:a05:6402:2553:b0:533:5d3d:7efe with SMTP id l19-20020a056402255300b005335d3d7efemr9304050edb.6.1699888896473;
        Mon, 13 Nov 2023 07:21:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id 11-20020a50874b000000b0053e2a64b5f8sm3913912edv.14.2023.11.13.07.21.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 03/10] hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
Date: Mon, 13 Nov 2023 16:21:06 +0100
Message-ID: <20231113152114.47916-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NFJeMkpkFjPM

We don't need a target-specific header for common target-specific
prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
in "hw/xen/xen-hvm-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xen_arch_hvm.h   |  9 ---------
 include/hw/i386/xen_arch_hvm.h  | 11 -----------
 include/hw/xen/arch_hvm.h       |  5 -----
 include/hw/xen/xen-hvm-common.h |  6 ++++++
 hw/arm/xen_arm.c                |  1 -
 hw/i386/xen/xen-hvm.c           |  1 -
 hw/xen/xen-hvm-common.c         |  1 -
 7 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h
 delete mode 100644 include/hw/xen/arch_hvm.h

diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
deleted file mode 100644
index 6a974f2020..0000000000
--- a/include/hw/arm/xen_arch_hvm.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef HW_XEN_ARCH_ARM_HVM_H
-#define HW_XEN_ARCH_ARM_HVM_H
-
-#include <xen/hvm/ioreq.h>
-void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void xen_arch_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
-#endif
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
deleted file mode 100644
index 2822304955..0000000000
--- a/include/hw/i386/xen_arch_hvm.h
+++ /dev/null
@@ -1,11 +0,0 @@
-#ifndef HW_XEN_ARCH_I386_HVM_H
-#define HW_XEN_ARCH_I386_HVM_H
-
-#include <xen/hvm/ioreq.h>
-#include "hw/xen/xen-hvm-common.h"
-
-void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void xen_arch_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
-#endif
diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
deleted file mode 100644
index c7c515220d..0000000000
--- a/include/hw/xen/arch_hvm.h
+++ /dev/null
@@ -1,5 +0,0 @@
-#if defined(TARGET_I386) || defined(TARGET_X86_64)
-#include "hw/i386/xen_arch_hvm.h"
-#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
-#include "hw/arm/xen_arch_hvm.h"
-#endif
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 4e9904f1a6..27e938d268 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -96,4 +96,10 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
                         const MemoryListener *xen_memory_listener);
 
 void cpu_ioreq_pio(ioreq_t *req);
+
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void xen_arch_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
+
 #endif /* HW_XEN_HVM_COMMON_H */
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 28d790f4ce..6a1d7719e9 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -33,7 +33,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
-#include "hw/xen/arch_hvm.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index ffa95e3c3d..f8a195270a 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -21,7 +21,6 @@
 #include "qemu/range.h"
 
 #include "hw/xen/xen-hvm-common.h"
-#include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 1d8bd9aea7..c028c1b541 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -7,7 +7,6 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
-#include "hw/xen/arch_hvm.h"
 
 MemoryRegion ram_memory;
 
-- 
2.41.0
