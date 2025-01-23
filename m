Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485634njk;
        Thu, 23 Jan 2025 15:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLv5++Py1JwbnC7vntTswYeT1ZZvNy8QzMd4XErXiiYsirns0i8+1hK70jV225ouPgYhOwhZcGkeHDfg==@linaro.org
X-Received: by 2002:a05:600c:1da6:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-438913ef340mr262172775e9.17.1737675959707;
        Thu, 23 Jan 2025 15:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675959; cv=none;
        d=google.com; s=arc-20240605;
        b=kX9doixiLZpPwe2/WTyTp3fXWduFbdppvQhTVk5TtiVfPnzEblAXG/X2cTeYxPHW6n
         W+yi1GucnhYu4KdYKJU6M5ooOsQCkzRVoRu/L7qzicHKryfQrAWPviB9zmdc6rGjMjDT
         ajITh916KoA8RpxiGsi/T8FTeu7U/Ce+bHj5jXsRuTW+clcyO9ECmnfQWJPu8lujVR2D
         NP1waXDv6QWFxtu6Zm3wxGBCpshc5JvzDwcyOmuu2IlZJMymAoPzVM4lzTdGuU6qBJ83
         mP+lRrgsK6tVfwhMDwS/mcwv/P6wI277waG4oLfZAih5Vd3EMfKDbLJO2kgYdLxj4MAx
         lasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
        fh=dj61YW5CDUTCt7RIQBsBlI3eBRKlSJURK22PN/1AyDg=;
        b=YYIp//wIxVqx0sYNpxU5oEnP3+rdtdSzAtrJnFKPZBYRzV/501yulMUNWp3C5qui8R
         0Thu4puiXpgZp2Ujjlzfg2Yx8BweQGGt23/MMiw+qSnczZeCI4NrHAbpV/za5oEzQXf7
         f3oAxlOLHCWQs0s82xRsDiDRXU0Fz26zJemD+FNhFRYR/3OL6CMGFgX23PXRy17Z9cJP
         GXtMRF56VIoTXE5BQX3OvY7KwSo9A3qU8RRe48RGqdBB8K16C74rH7HvOF9VX5qZmpxA
         tvwar7txhupHPdnBd/Rwr2vJaKqNGnGx84mSooJAVh+kVx3A2wsczh5rAyyDEXMRciYM
         egEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFtZwbNe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4f4d9fsor3080985e9.7.2025.01.23.15.45.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFtZwbNe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675959; x=1738280759; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
        b=XFtZwbNeXE+Wu1IqzIgW/er95TRX6nQZTiqv1/kxSoAU8lZlx8smPCghr5KMDbFNcI
         2sxK0vybyT0pXX7m/yvrsP+JnGiPjgrHouVdpXtO9zH2aHB1Q5JCd9JYdIJeAlw+LEzu
         MqbnhYG1MC190hGPtJP0Ua+VyAxOZ12vOSV0f8n1MYyFDgH3Xgo/FdwsGGrvyKXso/pJ
         uJUpgsQIlWfMxX/X+QZSjHlp1l+7VFD888d8DXY6JDs8TSm1sFEkP4oPtT6TetESOglY
         YX0eX2owDdpEfrimUJpkJ7hylJNOxitTqlAhXjh/0CAsgMsm9i6Yl0u9+XA5SzgcHjz3
         k7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675959; x=1738280759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
        b=kq0GdZ/gxJjXMcs/Cjb4nOz5qSrL9Aqt3TV4wx9swGe76wpWVUTiBuxuEi2kpgWVtn
         NvYXqJM6hG8pXxbRzipxOG9E24EUQs/0LT7QLOPXsEjKJAZD9UfHxiFGv+LofhOPH+cS
         J5G6DjePs10g0Kr6eBXkSYdyd3TEtcVFv4CtAh8KlCMzGH8snrfNLRk2p8LeSxrCtYCt
         fg/ZUntet8fvPiMMr6Un02GyCQh3Ip86gLB45PU8xHUcUcPEAeh0jYDi6FifI8bbZuo0
         ojgkdz9tJv9Tkmg9wHNfEAm6OO5f7knH2NIa+reLO4smdKYfLg645Nl23PSsDzdMxL4w
         ZzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2AAmuDdCO3Qcx/xclebAZkp4samhZVdAzvWluUKNkjPH/PWSVq0Cn60ceJz62JujKUTl+0RhqsKpvzw==@linaro.org
X-Gm-Message-State: AOJu0YwVYubQm/7QO+gpnG7IjlHubj2o3MUfOrjlTp9ijuIbnsXrXXG/
	b1Y/tUiUehXOKaR3Gtop8lofBhMRzkeSXVlIAeT6bqWywsFI+Ujy9IeFH5eCC1fRlw==
X-Gm-Gg: ASbGncssUD6iAm5H3v672lXuCKlfHPmuHcysFTDupXaPIc+nysu6hqghScN/x+e4GeJ
	OPqflOBLNoLlnQTw6ChWC2Rjo5M+PpteFSqme7VzBssZWQrJhx0Nxl8EVTlJAFdunJt81rcjmct
	Ftqg9pvmeYpcOiXpst5DDJFtNR2ZrMNgte7cwAwnyNkbFlr0YW0mKbiMbv9TBEizQnc6ytqARYf
	1aqRmWtJc3pH4Yh0+QoTrbh/vD6QTY+FzunSC4OIMtg4b5/sPeBqArKGKgEjqYmW5I9ki7aL8dv
	2FL8BvsUROkr7j/6w9aMYRAO3av+9bWh8W4pVdVgKaEaGj/godxc8WQ=
X-Google-Smtp-Source: AGHT+IFkrF3nSiyRp86eT1OfDhljZaIiOgfPlVgQgIeU90j7M027ZvrIkgirhKCWekxtCJUAZQHWLg==
X-Received: by 2002:a05:600c:4f48:b0:434:fd15:3adc with SMTP id 5b1f17b1804b1-43891431319mr209632555e9.25.1737675959187;
        Thu, 23 Jan 2025 15:45:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d79csm1009152f8f.39.2025.01.23.15.45.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/20] cpus: Have cpu_exec_initfn() per user / system emulation
Date: Fri, 24 Jan 2025 00:44:12 +0100
Message-ID: <20250123234415.59850-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CH3xr8C21B2z

Slighly simplify cpu-target.c again by extracting cpu_exec_initfn()
to cpu-{system,user}.c, adding an empty stub for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Good enough for now...
---
 cpu-target.c         | 9 ---------
 hw/core/cpu-system.c | 7 +++++++
 hw/core/cpu-user.c   | 5 +++++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index dff8c0747f9..3d33d20b8c8 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -24,7 +24,6 @@
 #include "migration/vmstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
-#include "exec/address-spaces.h"
 #endif
 #include "system/accel-ops.h"
 #include "system/cpus.h"
@@ -176,14 +175,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     accel_cpu_common_unrealize(cpu);
 }
 
-void cpu_exec_initfn(CPUState *cpu)
-{
-#ifndef CONFIG_USER_ONLY
-    cpu->memory = get_system_memory();
-    object_ref(OBJECT(cpu->memory));
-#endif
-}
-
 char *cpu_model_from_type(const char *typename)
 {
     const char *suffix = "-" CPU_RESOLVING_TYPE;
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index c63c984a803..0520c362db4 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
 #include "hw/qdev-core.h"
@@ -182,3 +183,9 @@ void cpu_class_init_props(DeviceClass *dc)
 
     device_class_set_props(dc, cpu_system_props);
 }
+
+void cpu_exec_initfn(CPUState *cpu)
+{
+    cpu->memory = get_system_memory();
+    object_ref(OBJECT(cpu->memory));
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index e5ccf6bf13a..cdd8de2fefa 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -25,3 +25,8 @@ void cpu_class_init_props(DeviceClass *dc)
 {
     device_class_set_props(dc, cpu_user_props);
 }
+
+void cpu_exec_initfn(CPUState *cpu)
+{
+    /* nothing to do */
+}
-- 
2.47.1
