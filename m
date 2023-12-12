Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865291ejo;
        Tue, 12 Dec 2023 04:35:52 -0800 (PST)
X-Received: by 2002:aa7:d714:0:b0:54c:4837:81f0 with SMTP id t20-20020aa7d714000000b0054c483781f0mr3118119edq.65.1702384551969;
        Tue, 12 Dec 2023 04:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384551; cv=none;
        d=google.com; s=arc-20160816;
        b=KCbfTD10vZ3nwsMykIgt1O4/ZC0t/cmSE8eFq7+ti1oNFzG/98Ed88d3ogJkUla2Rj
         R10B+/7mQ/dVi1wzSbZDeMK41xBOOOMVRjFuKf9MDZGayKzRNvq20exaBnh3h1K9+d1i
         agOVuUqCNyZHjePVL/KwbOovRSGoqQF6xch3UuKPUjjumrEosZ1LXRKFWLpz5YymQePr
         +kFPVYb2PhdE1r5rTgtENOQWg78GqzWxTgw9KukUm5Lp11SSR2WFknRuS9dOUyBIxSof
         ZCbMrD+n8Zu2DDsqGp328V0NvOYj+oJIgsrEcNZRiEquUZLtl0rBMAsoQYtmAdO/RhUE
         hGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LKqz8+rrRr+9OnCGqaF5kY8vCRVBvOcgtedefIMaXhg=;
        fh=zFh10cOfJXxh05dYupUjqn/R0oZQPEp3aMoWWRcpFb0=;
        b=0MKdd7J/N3ADKG84kF2Dfn11mlofh4ng+qYErFCC30O9B3U3Ucg9EdmlyHHhdhGMsM
         3thf9Q31j5Wbzaja3uJ0wYLi9FBg9W/sCy/36gX5H8sWNNdGUstuXrlfrNHLXzcq44Pw
         r5gVpmU0B+C3XTZEGpyM+CgzALr+v12o9xIkxbclQg1CQV4gTskUjC5CAWUlmjlcdKJ7
         cwd26sd2L1tMkhMAT0ecNGdrY+a95wRpKbyoSmzbz0z4nLq8/8lExN+hefneZMhx86F+
         jbhWTnXG4DbZ/FL/Ec79VJ7QWHMJm8QkHfDB1WBtjOdvCtEprlzIoSGR8KAd7wQZ4SvL
         Vr/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMCASdin;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dg7-20020a0564021d0700b0054c77ce2560sor1845455edb.4.2023.12.12.04.35.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMCASdin;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384551; x=1702989351; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKqz8+rrRr+9OnCGqaF5kY8vCRVBvOcgtedefIMaXhg=;
        b=NMCASdinuFC/qK2H/MOgsOfRP6A9h9S4/MhDyU/QK3o2+RQVdyrQJfUkZ2tWaMOx+r
         468O8wftcklcgvG0AmW+YbcQrkZBuZg9tlkDSSN0e4dnklZMQc2RZsDS+DYBZWh91wDS
         S67m7wP0/3b8o69kylDYL6VGfYoBpWbHQIlAcJit8dmO5IUzWFp2FjKkSoui9ElHPUP2
         4n1LHHv56gDw9qGb7PQ47he60qgOv+ayyE8vf0AnwrvDMcgm6Hw+C1oFthaiNjmuVZfu
         pH5C3k92W7CaUeBA1wT95czSgRva76t0lwRvx2Qn9C5r/SLXA5qNEMHx9O2a7zlogDJb
         Ku8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384551; x=1702989351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKqz8+rrRr+9OnCGqaF5kY8vCRVBvOcgtedefIMaXhg=;
        b=dgLdv6s8WBLQE4arEcTvc2Bw1h1HWnK4I1Wwm/urJ0uxG6wkhRCkTjRNpP/z/Hnxoj
         ZGvKPJQzFM4ui6nkYl+5CbqsotGyGRo+nQQuFK0MFPLGCpvyoLKQpTfdYTQxl1+XvaOT
         03O7q0ErJtInyxkCJv09Q6bo76wDu37yVbC5xJow+iSBbOT8Lo8kEag2Y5ms0ZiTLhb6
         C4zmeaBmEGvB8Q63Fielb8GqZSdtAuWF6drRteWwSkF0zkDZt9xKPOi6SwXr1Yf9UCVW
         gmIPqfKSpUm6b6qCoGpKu9jsMPQBjp1AboS3Q21jwiPrCuiSWxjVqX9UzKukXZ+x1WtW
         YwZw==
X-Gm-Message-State: AOJu0YytSUDZ4Zmdq/cmyTclNUuc8cxbFCJIaCKfT5MLFKU2bQqKhvHP
	04cm/I0OrmGR0+Or4Y6biA4i0Nvm
X-Google-Smtp-Source: AGHT+IGdDBxwOjO3s57fwqNR4JkxK+RE/jCphEdV6BIZvfrVWSyPEmapbhmFWj4HyfkEWxLwnIJvJQ==
X-Received: by 2002:a50:9515:0:b0:54c:6386:a1a3 with SMTP id u21-20020a509515000000b0054c6386a1a3mr3554851eda.15.1702384551619;
        Tue, 12 Dec 2023 04:35:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id n8-20020a50cc48000000b0054c9df4317dsm4657860edi.7.2023.12.12.04.35.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 15/23] exec: Declare target_words_bigendian() in 'exec/tswap.h'
Date: Tue, 12 Dec 2023 13:33:51 +0100
Message-ID: <20231212123401.37493-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XMu2b3JQiojH

We usually check target endianess before swapping values,
so target_words_bigendian() declaration makes sense in
"exec/tswap.h" with the target swapping helpers.

Remove "hw/core/cpu.h" when it was only included to get
the target_words_bigendian() declaration.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/tswap.h     | 12 +++++++++++-
 include/hw/core/cpu.h    | 11 -----------
 cpu-target.c             |  1 +
 disas/disas.c            |  1 +
 hw/audio/virtio-snd.c    |  2 +-
 hw/core/cpu-sysemu.c     |  2 +-
 hw/core/generic-loader.c |  2 +-
 hw/display/vga.c         |  2 +-
 hw/virtio/virtio.c       |  1 +
 9 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 68944a880b..77954bbc2b 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -8,9 +8,19 @@
 #ifndef TSWAP_H
 #define TSWAP_H
 
-#include "hw/core/cpu.h"
 #include "qemu/bswap.h"
 
+/**
+ * target_words_bigendian:
+ * Returns true if the (default) endianness of the target is big endian,
+ * false otherwise. Note that in target-specific code, you can use
+ * TARGET_BIG_ENDIAN directly instead. On the other hand, common
+ * code should normally never need to know about the endianness of the
+ * target, so please do *not* use this function unless you know very well
+ * what you are doing!
+ */
+bool target_words_bigendian(void);
+
 /*
  * If we're in target-specific code, we can hard-code the swapping
  * condition, otherwise we have to do (slower) run-time checks.
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3208b938f7..d6b077da71 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1153,17 +1153,6 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 void cpu_exec_reset_hold(CPUState *cpu);
 
-/**
- * target_words_bigendian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
- */
-bool target_words_bigendian(void);
-
 const char *target_name(void);
 
 void page_size_init(void);
diff --git a/cpu-target.c b/cpu-target.c
index 997ca2e846..4c1e19ca81 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -33,6 +33,7 @@
 #endif
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
+#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
diff --git a/disas/disas.c b/disas/disas.c
index 0d2d06c2ec..89a1e7d767 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -6,6 +6,7 @@
 #include "disas/disas.h"
 #include "disas/capstone.h"
 #include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "exec/memory.h"
 
 /* Filled in by elfload.c.  Simplistic, but will do for now. */
diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 137fa77a01..a80f23aa71 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -20,11 +20,11 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "include/qemu/lockable.h"
+#include "exec/tswap.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "hw/audio/virtio-snd.h"
-#include "hw/core/cpu.h"
 
 #define VIRTIO_SOUND_VM_VERSION 1
 #define VIRTIO_SOUND_JACK_DEFAULT 0
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index d0d6a910f9..2a9a2a4eb5 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
 bool cpu_paging_enabled(const CPUState *cpu)
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index d4b5c501d8..ea8628b892 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -31,7 +31,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 37557c3442..d11a30a785 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -26,7 +26,7 @@
 #include "qemu/units.h"
 #include "sysemu/reset.h"
 #include "qapi/error.h"
-#include "hw/core/cpu.h"
+#include "exec/tswap.h"
 #include "hw/display/vga.h"
 #include "hw/i386/x86.h"
 #include "hw/pci/pci.h"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3a160f86ed..28dc1f4c15 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -20,6 +20,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "exec/tswap.h"
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
-- 
2.41.0
