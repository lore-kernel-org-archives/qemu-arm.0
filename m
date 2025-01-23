Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485308njk;
        Thu, 23 Jan 2025 15:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYUO8US2ZBkKRAiWa+ITxsihoniOCcn+nGx+7NXuRtLq8iNHO01zv9/IESOSVtLDPf7F8zGJYj1BPlIw==@linaro.org
X-Received: by 2002:a05:600c:cc6:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-438913f153amr279565315e9.15.1737675920194;
        Thu, 23 Jan 2025 15:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675920; cv=none;
        d=google.com; s=arc-20240605;
        b=f2qcFFU5tnuhRQ3LXwp00VzWW96jrEqAf+dRr7GkviHMGInBZvFzn8vKh6ohJ81HSO
         cxN7QxbdzF9mEmIuaBrZTwsmQjlkW2t/kp6vg7gglYqYUIzJne7vHT0nPMHGo4/iNOVT
         YwDGP+VqIaYLLTIhNj4PgGDo3kWeg39Q5VX6YgTcgTDB8G+FQI9g96vd1RdL13Ex1hJV
         YAa67HfW9CXfvUno1UTP+dZ9KQVTtuY67I1PDIqbHXuRDONqgtrXuVXZlKmNqiiw0CNV
         /LfsBEzlH4OERPH4nywSMrjG9yjGyeI2/hPvQjpE+DXnw3JrXdp4Ctm5lasC9+U0Sg2Z
         PRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KLiVQy6/uYr9fS/vE5notUMei/mcFiOsSDRea34SIY0=;
        fh=XS6r6F+Q5pw5FS+x9toA3Qr1sfp2pl4tlH3PPoJgrxg=;
        b=MXXMvzRaNit29sL6wnVkcyWJh039SebLjs4eFbDrLD9mAuWHxTubWpU5alrpnZFASL
         l/nc5Qx381vrBeeBxdkFGFptpWcUMjYPA7jbTd1LONRFLnzG5PF2yk8Jdzo1i5/iHIWy
         UhFYiSL/WZbpBhzVZ5KHgRo52LQ2jWGoaIFKPrhVm6yw/vR5KcQazyM9JbN1fhoFkHAu
         wSUar0Rrx4R5LzYeC+W5XVq82Jr6n0wbAyW7fAs3kfLAXbISyB/4LqAwVreVzOgryA/V
         WqRdmCLTOseqiZDbTf/sR2Is5vurMZx5giZq8LoTskIYPvg8RVVj5cwk4ElTTpG+2vXY
         XiDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8UoaVe9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4a37a8sor2043905e9.4.2025.01.23.15.45.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8UoaVe9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675920; x=1738280720; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLiVQy6/uYr9fS/vE5notUMei/mcFiOsSDRea34SIY0=;
        b=v8UoaVe9dFy3YEkQadbUS2ItS/jeNLRG6qKeGWw0s39/Xg+VLL74/O/Tj+mtoHUQ4O
         m7jw9w1CM3+c4e4Tcpj9s2XQgU4QZxPjtmqbWWC0CtFesMirUmBPUY4GywpvP6f1iO9o
         uMGqCqbjSiqxdIlWrLpCfaFMUFaAurQYmLVc13PC4mPxY6OJxSvbMDg13eTpRXNTvybw
         vbIvhvXplEHHgUbJ0t+sSWWJPjg9w4wAbAXvLemgUU9JLp6KJ5ATcybQ2wvCoOdaSaID
         vj7e1iG2kBIiUIIyYPtGe3ppsIZJfVWXktSA7jwDFD5X+b2mpoIS8rhV8UPSSVigF0PR
         gzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675920; x=1738280720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLiVQy6/uYr9fS/vE5notUMei/mcFiOsSDRea34SIY0=;
        b=Z8KCTAyonYgaAvJHaswXLMxxuo7gY28AN86XvnPMSWZL/inT/vv1LTRRCBUXU+S7+O
         xNmj3mWQiPzuG2MhOZRfd2HOs0yNsNUbzw077OQyrad5u19NkKZsW9WziJK94ByUBjZZ
         bFE3ccwYrfFxFkIu3u/THLJsUSHyG61/HwDYcKRVRDE75CW4X7+fOVXfxio/qkLcjw65
         XXmi4Ep3wFzJD0U6eTxKVUjCf2jkEVZnB0UGGVG81vru5oIavt2rXO2AIlbGMZwS9wWM
         bzIGbTIfwNFKDFdBseNq3d3yAOc1yeJ2lsVvElNCDY7f+ToYjU0hmFNi8oJxk5y4c71Q
         lJwA==
X-Forwarded-Encrypted: i=1; AJvYcCWslHuj6erTqpJmIJ5mkT50nupD4T3BeKfFadyF9p4CirkoYTc1Tnrnvoj/BYh45QBfhgGWmtVM70J0MA==@linaro.org
X-Gm-Message-State: AOJu0YxZOhCnbDNCogYDaeB83DyKYH1+mlVRZvMxgzCS+NMkJ/gYSh5d
	P3VLQsmu7rTJdi/XeLKUt7L5QtQaU72PTga4QJ+XT77863fRUghX/VXvekRnRpoJQw==
X-Gm-Gg: ASbGncuei2pAkiJByrPGcO7TL6at1CZIpIYjZxHmnxFz5camPiiJ9OHErL02/36oGI6
	F8KzsV433NXdzKnMLf7ghtkB22wy0xSdZWSwD6OmF6d7FCg7x/W6bgdT06cZ4/OvRINnqEf2vvn
	fNpuCZbExPTiQwN1M/k6JTZcHiJFR0lhVsVx5C1CfyVxXhAntT3Sz2Jg0FP1I4GyGeAVkZxELIX
	ubXaffw59cfFFwwK1/1PIeieHgy9UFEyrcMWsir8PTw9RlID7P8Vc9rCDSAUBl+V3WIPY39xg6o
	3mbYGRg56upMzCAk7G5UMYamMMevsHBh48eS9qg3fRde0CTX6MHtcsg=
X-Google-Smtp-Source: AGHT+IHCUhXEKn4F81kx6ZpXqs9faqGpJN5W9Mj/EUJJpXYvZE3+gYqYLTjnf0hJ5kDL6XLUxlFm9g==
X-Received: by 2002:a05:600c:1913:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43891453fa7mr280858325e9.29.1737675919693;
        Thu, 23 Jan 2025 15:45:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54c0f7sm6499935e9.28.2025.01.23.15.45.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:18 -0800 (PST)
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
Subject: [PATCH 11/20] accel: Rename 'hw/core/accel-cpu.h' -> 'accel/accel-cpu-target.h'
Date: Fri, 24 Jan 2025 00:44:05 +0100
Message-ID: <20250123234415.59850-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NLexGYq2mi7J

AccelCPUClass is for accelerator to initialize target specific
features of a vCPU. Not really related to hardware emulation,
rename "hw/core/accel-cpu.h" as "accel/accel-cpu-target.h"
(using the explicit -target suffix).

More importantly, target specific header often access the
target specific definitions which are in each target/FOO/cpu.h
header, usually included generically as "cpu.h" relative to
target/FOO/. However, there is already a "cpu.h" in hw/core/
which takes precedence. This change allows "accel-cpu-target.h"
to include a target "cpu.h".

Mechanical change doing:

 $  git mv include/hw/core/accel-cpu.h \
           include/accel/accel-cpu-target.h
 $  sed -i -e 's,hw/core/accel-cpu.h,accel/accel-cpu-target.h,' \
   $(git grep -l hw/core/accel-cpu.h)

and renaming header guard 'ACCEL_CPU_TARGET_H'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                               | 2 +-
 include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} | 4 ++--
 accel/accel-target.c                                      | 2 +-
 cpu-target.c                                              | 2 +-
 target/i386/hvf/hvf-cpu.c                                 | 2 +-
 target/i386/kvm/kvm-cpu.c                                 | 2 +-
 target/i386/tcg/tcg-cpu.c                                 | 2 +-
 target/ppc/kvm.c                                          | 2 +-
 target/riscv/kvm/kvm-cpu.c                                | 2 +-
 target/riscv/tcg/tcg-cpu.c                                | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
 rename include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} (95%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa46d077d30..e4521852519 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -499,7 +499,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
 F: include/system/accel-*.h
-F: include/hw/core/accel-cpu.h
+F: include/accel/accel-cpu-target.h
 F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
diff --git a/include/hw/core/accel-cpu.h b/include/accel/accel-cpu-target.h
similarity index 95%
rename from include/hw/core/accel-cpu.h
rename to include/accel/accel-cpu-target.h
index 24dad45ab9e..0a8e518600d 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/accel/accel-cpu-target.h
@@ -8,8 +8,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef ACCEL_CPU_H
-#define ACCEL_CPU_H
+#ifndef ACCEL_CPU_TARGET_H
+#define ACCEL_CPU_TARGET_H
 
 /*
  * This header is used to define new accelerator-specific target-specific
diff --git a/accel/accel-target.c b/accel/accel-target.c
index 08626c00c2d..09c1e1053e0 100644
--- a/accel/accel-target.c
+++ b/accel/accel-target.c
@@ -27,7 +27,7 @@
 #include "qemu/accel.h"
 
 #include "cpu.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 
 #ifndef CONFIG_USER_ONLY
 #include "accel-system.h"
diff --git a/cpu-target.c b/cpu-target.c
index 75501a909df..f97f3a14751 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -44,7 +44,7 @@
 #include "exec/tb-flush.h"
 #include "exec/translation-block.h"
 #include "exec/log.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
 
diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
index 560b5a05940..b5f4c80028f 100644
--- a/target/i386/hvf/hvf-cpu.c
+++ b/target/i386/hvf/hvf-cpu.c
@@ -14,7 +14,7 @@
 #include "system/system.h"
 #include "hw/boards.h"
 #include "system/hvf.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "hvf-i386.h"
 
 static void hvf_cpu_max_instance_init(X86CPU *cpu)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 1bda403f88b..6269fa80452 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -15,7 +15,7 @@
 #include "hw/boards.h"
 
 #include "kvm_i386.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 
 static void kvm_set_guest_phys_bits(CPUState *cs)
 {
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index f09ee813ac9..b8aff825eec 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "helper-tcg.h"
 #include "qemu/accel.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "exec/translation-block.h"
 
 #include "tcg-cpu.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 966c2c65723..216638dee40 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -49,7 +49,7 @@
 #include "elf.h"
 #include "system/kvm_int.h"
 #include "system/kvm.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 
 #include CONFIG_DEVICES
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 23ce7793594..7e4443c5bda 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -32,7 +32,7 @@
 #include "system/kvm_int.h"
 #include "cpu.h"
 #include "trace.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index e40c8e85b26..79345e4b89d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -30,7 +30,7 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
 #ifndef CONFIG_USER_ONLY
-- 
2.47.1
