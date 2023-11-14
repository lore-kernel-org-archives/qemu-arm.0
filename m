Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083174ejc;
        Tue, 14 Nov 2023 06:39:42 -0800 (PST)
X-Received: by 2002:a05:6402:896:b0:53e:81f6:8060 with SMTP id e22-20020a056402089600b0053e81f68060mr7294537edy.14.1699972782259;
        Tue, 14 Nov 2023 06:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972782; cv=none;
        d=google.com; s=arc-20160816;
        b=Dg9hD2yn6JlDGjALXI6CN+otkYE0O6B9JuhVnKLoyAvsctPy2VFuM7YMiVrTM+mIER
         oXx+0SH7e4O1C95KCKWWzTDZ6k+I50xhqWt7QAF0RuQVCA/bCFH3DvxS76I91WGGAyG3
         JFnB+3DycWPHpZRu1T/Ak9PrYtRZJE6G/AHBagb0Woqw9KgUyhhcYbvrv/Zozerkkf97
         dRPYhWL1EDntomjTdXiRHxea4Gn3/tfoXY/D+/ENDX3WVC8dmCmjClBLkHFQg3Q0T0DZ
         bI20seV1bUwlV9jz4T9OERN2hYN+LXqDcftEhkPiuoqYIIE0eFQbSm1djBvb0jP28JND
         LbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jzmBSObK1PNYaVxHm2kQdQrWhNegSVRCuy1/LpCCkxs=;
        fh=1nz8wG6UuYay2KL0jZBUp30jkEi8Ayfk1emV35/PTDM=;
        b=yS8k9UCtQY8jmmL3AoFiJgC37Pno1WNmzODchNAIR1Xy0GuKg0DMtWxNEFXOhTdwmb
         Ur4XQRNvoWHKPgTR9gOx/nSVxSGoFfdmD7iyNzv8s59oLb8zmdD9gd35cTWsiRCmB1jt
         HZ2d6VgoJAXl2N3Kmp+y9PGGa41lzAt3wFEtNS6mwFBNXOFLRdnWT2uPOpNOKZTTO3AD
         FXrI0havYBn8QpH5xs8tDSIDoAJAlYG1GVzz2UFCDthRPh6LxZX2lBdqNojWjJ3RIwFD
         HeYluE8udAqFrNd+CK9bcBpozc6Sqi4qRKUTfexUIc76TGznkgIN24C5jm5b2eBR+ctP
         OhDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPaVcoCm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w18-20020a50d792000000b00543abb0f9d5sor1720515edi.0.2023.11.14.06.39.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPaVcoCm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972782; x=1700577582; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzmBSObK1PNYaVxHm2kQdQrWhNegSVRCuy1/LpCCkxs=;
        b=wPaVcoCmf9cjaez06mTBDUqmyxzDoPHrzLKROOGFyD+HigNk8uKoSwrkbBaV1QSHnS
         vDotXPgiMjVg0/pPtrYtzWDkGYQwiouqa6UttO0IS6hOZq1dUxEIWI3PuHBG/mAbE5t4
         XsgUxsQrT6rEStnU420Y/EVWWLA0+PA91xSMlwG8WfuHLKbPSVbUhAE+bEhZhssRfK5B
         BiLlrE6tNLUyimWqGcQDTyJmTJcF9odIfyrlmlGuEBEB7kh6uuJ13SRZlJNrVIyvLFpL
         ZACH3P5fQ9cv9fL1GLrDqxAAo62Kc5C5fKdJZXWkoR1ZpXV5Fxmnjxu6EnzsWaH2IdhD
         S5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972782; x=1700577582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzmBSObK1PNYaVxHm2kQdQrWhNegSVRCuy1/LpCCkxs=;
        b=doeRopJzje/Uza65C3u2ExcGVspfHhokWdIWbCMvJ1U72SmzZA7TS3xWKqmQ0DPDT1
         tqszP1bnGgsXcVzf7YbJmx2WUbqUb1Kx6buFvm7VGwXMWspjj47ATRfb9YRl+KyoymUl
         YSFB1LkwJr8LB721QD45szDw2j6TClZu4rRogw7HVParrBACRErBXaIngJNZacsmHSPC
         raEUw+2LCvYZyMUeVS1PSbQ4iHoObRjw/4zgOmwnQ3PwW/2p/KqswG7RBunvlFeIJnL/
         4TJBMYJXweHqqre65dje9Qz21vNtJjiXAuP8Tk5N00AM0yY8hihq6PwPsXfLopFZVfjd
         x6MA==
X-Gm-Message-State: AOJu0Yy0hj6JJW8ubOV+uCOEsN5/NzXeqGWlD8m05PByNyez9M06FISF
	KHDbSC1qP3YlyD3M+z0GKiIQzw0q
X-Google-Smtp-Source: AGHT+IExeFq34FYS8TGI99eGSAGJR2PT8yf3hsSWiq8DkOxV7jzDuNfy8kK0Izfgi0PzWhH+ZoIHKg==
X-Received: by 2002:aa7:d050:0:b0:540:3286:d2e8 with SMTP id n16-20020aa7d050000000b005403286d2e8mr7060069edo.18.1699972781909;
        Tue, 14 Nov 2023 06:39:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id k25-20020aa7c059000000b0053dd8898f75sm5155063edo.81.2023.11.14.06.39.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 12/19] hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
Date: Tue, 14 Nov 2023 15:38:08 +0100
Message-ID: <20231114143816.71079-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gFPLbrUaoMeF

We don't need a target-specific header for common target-specific
prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
in "hw/xen/xen-hvm-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index d3fa5ed29b..8934033eaa 100644
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
index bf19407879..6b0e396502 100644
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
index 5150984e46..0fbe720c8f 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -21,7 +21,6 @@
 #include "qemu/range.h"
 
 #include "hw/xen/xen-hvm-common.h"
-#include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index cf6ed11f70..bb3cfb200c 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -7,7 +7,6 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
-#include "hw/xen/arch_hvm.h"
 
 MemoryRegion xen_memory;
 
-- 
2.41.0
