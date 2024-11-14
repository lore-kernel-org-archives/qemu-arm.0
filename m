Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp27085njc;
        Wed, 13 Nov 2024 17:16:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5Bpd0oOvc090PcLfurXZXE7keIxmbDm3XOu9drwAQNylI5c1qw6b7O7B2lNe/Y/DtjAJC0uiMZdGVWQ==@linaro.org
X-Received: by 2002:a5d:6482:0:b0:381:f596:767a with SMTP id ffacd0b85a97d-38213fffc48mr1055404f8f.12.1731546985239;
        Wed, 13 Nov 2024 17:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546985; cv=none;
        d=google.com; s=arc-20240605;
        b=EW9U8kzfjOdM4hy6MQ7bw+VKCz2F/ZEOhz+eVp6yF+Lcf1k9RJQYtNyFb1QkxEZjqL
         2ntPJeSZPPHpViYJgOK+houHHYwbEySpMKDocN0ByxCat/K/fdp8C1ox0nlAos8EKsDb
         hhqlFdM5GxnqGGNC8jRKvGxuK31EhOSfI89SzXYfat4MBC+0YNQyA/ChwKcfQZ4holsR
         LmVZSvZTSni7Ycj5w/+h3wiXUvwopvdACVYVA2oRoTy+txiUdfHLrdk5sk5UJidXFUnp
         taWrvhaJg94k0SztvTU2WbV+uak5tGy3QdK/ZZDhB8b1C6EubRYea8+t8PkzUCjSJDhI
         4Zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/i7abgIX+3ynadFwtVOHIgRvjRLqB047FgJOUkSoXwQ=;
        fh=xIoqh62xiUY5N+eHW9+4ElxhUU5HgQfRSYgzYyuNHs0=;
        b=lurtKoS3/9r9E8qR11ob2ugVmgXHQClJgoI/I2a2IYBXX/eysUhe7Og9QSuQVFx9Tq
         xQwoqjBN4EtxCTmpEllgAfePPdunEi3qen59HQvxZEyeKymb2ckm4AMN68KVrbfugv/3
         L03qv62pqtN5Lje+05qVsj6vzyDjhKBHP2/MK2spI3n9a8vzC88INjcE4r6oycwYSiqG
         8JJGyCrVYFUOh917zUm04ixc1If+VJ0UX9fJnYMEnp+OFKAvsk8k3lvoBAk1Wlfm23zb
         AmNVZOO0AH+OevofVndgLXH5LwO/8FDUE/zHdforWaHkmqsRGaZdnGUktjcBznDIPmfI
         YD8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oz01+cPX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3821a826411sor40236f8f.1.2024.11.13.17.16.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oz01+cPX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546985; x=1732151785; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i7abgIX+3ynadFwtVOHIgRvjRLqB047FgJOUkSoXwQ=;
        b=Oz01+cPXm5RrXA2zM3WiZ2fgPsmqlVAm6/Vg/fNodsVkMwmJfrjKaKdFJgVScf6rwm
         fChCfpGYqDXqn6zMsjIs5lmAr4b6WCmyUbEHshzbw+gfmnQ02ngz60Cq3rL8Jb9+mXZ0
         X+0YJJZTGE2Dhh5lNOmGDNmq7RC/mQkQT4pVAt7vimjQwEkDU5TcO5YaN9S1BTnQ+ngg
         atEHUWRhQwOPiZgtjbUZNoM0V3LENyM7rZ3fULOZzo87alVjiLSG3S74mrNMRVGlVWhG
         RkwMGsTy9Lp2NTmLwHZ6IP1j4KvTRXR3Cg6J8ayqR6CKi14gpI0aT2KndZPvk0vmqfQl
         /YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546985; x=1732151785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/i7abgIX+3ynadFwtVOHIgRvjRLqB047FgJOUkSoXwQ=;
        b=TiEILpe5ZKbDG74P4oG16C5/tb6R+tYFbA0mzN6yZqwCmQ075ycYiwxPfIk+wigM3c
         W60zvcqMOt0oYe+h8K6LsReB8l6xhIAz2Itzm6KDqvAHUW9KWUtbJzwjNRC15Ah9BTKd
         K8W3H53hKVHHHHksSBVmIhBALgom7Wqilt7jl9g1Hh4h5rsCecVp70y+b7VBYNWaax4/
         ZK1XSt62EW/ZCan0zYpwGNU3nDfVjOratylfydGFhQVYi+mJ7eSLznqQEJIB4/OCvxPi
         3a9JZhlH+54j1EhBetkcelqNW+i6IrWRXMkh7wtz4eRg+5mMRyPM2kJ0/fweelLey+QP
         p36g==
X-Forwarded-Encrypted: i=1; AJvYcCUsk2wvJ1cy3hQ9fDwod3bmo9KvS++UAW4phUkBK+pejwhcWhdqWGh2dQ25+fTsdMU/K+Ij1GUg+tJ6TQ==@linaro.org
X-Gm-Message-State: AOJu0YwN3sTjbqPBnFrcC0Hhsb+cOHCy3XipSv2blN3tX7miDWd6jRiL
	+pAkJx/fZl0mSjRUKKixP7BKh6XmfScDEPiJWH/HFDZsI8+ZanCBM/mXoyft9WWgBA==
X-Google-Smtp-Source: AGHT+IFCBCAt12OLqgLDDZHzh68q86+ysDJJZpWlHumLNgL12t17vmSl5EE0M1zOwpQgowR0MbnrnA==
X-Received: by 2002:a05:6000:2a3:b0:371:6fc7:d45d with SMTP id ffacd0b85a97d-38213ff978fmr981104f8f.2.1731546984697;
        Wed, 13 Nov 2024 17:16:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda137dbsm19426371f8f.110.2024.11.13.17.16.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:16:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 24/24] exec: Move 'ram_addr.h' header under sysemu/ namespace
Date: Thu, 14 Nov 2024 02:13:09 +0100
Message-ID: <20241114011310.3615-25-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j4pyCXOAox8e

"ram_addr.h" contains declarations specific to system emulation,
move it under the sysemu/ directory to clarify the API namespace.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                         | 2 +-
 include/exec/cpu-common.h           | 2 +-
 include/exec/memory.h               | 2 +-
 include/exec/translation-block.h    | 2 +-
 include/sysemu/physmem-target.h     | 2 +-
 include/{exec => sysemu}/ram_addr.h | 0
 accel/kvm/kvm-all.c                 | 2 +-
 accel/tcg/cputlb.c                  | 2 +-
 accel/tcg/translate-all.c           | 2 +-
 hw/ppc/spapr.c                      | 2 +-
 hw/ppc/spapr_caps.c                 | 2 +-
 hw/ppc/spapr_pci.c                  | 2 +-
 hw/remote/memory.c                  | 2 +-
 hw/remote/proxy-memory-listener.c   | 2 +-
 hw/s390x/s390-stattrib-kvm.c        | 2 +-
 hw/s390x/s390-stattrib.c            | 2 +-
 hw/s390x/s390-virtio-ccw.c          | 2 +-
 hw/vfio/common.c                    | 2 +-
 hw/vfio/container.c                 | 2 +-
 hw/vfio/iommufd.c                   | 2 +-
 hw/vfio/migration.c                 | 2 +-
 hw/vfio/spapr.c                     | 2 +-
 hw/virtio/virtio-mem.c              | 2 +-
 migration/ram.c                     | 2 +-
 plugins/api.c                       | 2 +-
 system/memory.c                     | 2 +-
 system/physmem.c                    | 2 +-
 target/arm/tcg/mte_helper.c         | 2 +-
 target/ppc/kvm.c                    | 2 +-
 target/s390x/kvm/kvm.c              | 2 +-
 30 files changed, 29 insertions(+), 29 deletions(-)
 rename include/{exec => sysemu}/ram_addr.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0027e56fa5..f303f73534 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3024,10 +3024,10 @@ S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
 F: include/exec/memory.h
-F: include/exec/ram_addr.h
 F: include/exec/ramblock.h
 F: include/sysemu/memory_mapping.h
 F: include/sysemu/physmem-target.h
+F: include/sysemu/ram_addr.h
 F: system/dma-helpers.c
 F: system/ioport.c
 F: system/memory.c
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index b790202c56..27f047b13b 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -54,7 +54,7 @@ enum device_endian {
 #define DEVICE_HOST_ENDIAN DEVICE_LITTLE_ENDIAN
 #endif
 
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 
 /**
  * cpu_address_space_init:
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 58faa3eb08..b2e2d4590a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -28,7 +28,7 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 #include "qemu/rcu.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
 
diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 9c4757882c..b72fcbbb18 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -8,7 +8,7 @@
 #define EXEC_TRANSLATION_BLOCK_H
 
 #include "qemu/thread.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "exec/vaddr.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu/interval-tree.h"
diff --git a/include/sysemu/physmem-target.h b/include/sysemu/physmem-target.h
index b30c42da60..32efaf80b6 100644
--- a/include/sysemu/physmem-target.h
+++ b/include/sysemu/physmem-target.h
@@ -23,7 +23,7 @@
 #include "sysemu/xen.h"
 #include "sysemu/tcg.h"
 #include "exec/cputlb.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "qemu/rcu.h"
diff --git a/include/exec/ram_addr.h b/include/sysemu/ram_addr.h
similarity index 100%
rename from include/exec/ram_addr.h
rename to include/sysemu/ram_addr.h
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index a80547006b..1ec73400a7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -34,7 +34,7 @@
 #include "sysemu/accel-blocker.h"
 #include "qemu/bswap.h"
 #include "exec/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qemu/event_notifier.h"
 #include "qemu/main-loop.h"
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d4b381641c..46f35ddd59 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -27,7 +27,7 @@
 #include "exec/cputlb.h"
 #include "exec/tb-flush.h"
 #include "exec/memory-internal.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "exec/mmu-access-type.h"
 #include "exec/tlb-common.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 48015be829..6d165fded6 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -40,7 +40,7 @@
 #endif
 #endif
 #else
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #endif
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a9833530c7..ac9ab5986a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -74,7 +74,7 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost-scsi-common.h"
 
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/usb.h"
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 5eef7475c1..1d9ad3d6fc 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -27,7 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/hw_accel.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "target/ppc/cpu.h"
 #include "target/ppc/mmu-hash64.h"
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index a91fea1304..f6b2cb7396 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -34,7 +34,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/ppc/spapr.h"
 #include "hw/pci-host/spapr.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include <libfdt.h>
 #include "trace.h"
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 0af2a2f3fe..23df49099a 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 
 #include "hw/remote/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qapi/error.h"
 
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 3948751ed7..0baf145016 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -12,7 +12,7 @@
 #include "qemu/range.h"
 #include "exec/memory.h"
 #include "exec/cpu-common.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/hw/s390x/s390-stattrib-kvm.c b/hw/s390x/s390-stattrib-kvm.c
index b495d81296..48fd8e56cc 100644
--- a/hw/s390x/s390-stattrib-kvm.c
+++ b/hw/s390x/s390-stattrib-kvm.c
@@ -15,7 +15,7 @@
 #include "hw/s390x/storage-attributes.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "kvm/kvm_s390x.h"
 #include "qapi/error.h"
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index fe7945e856..5bad70ae5c 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -16,7 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/storage-attributes.h"
 #include "qemu/error-report.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 5b6fe1a18a..823a45cdec 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/boards.h"
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2e7a02cd4b..01aae36194 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -29,7 +29,7 @@
 #include "hw/vfio/pci.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "hw/hw.h"
 #include "qemu/error-report.h"
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index f0bc9e8c2b..fe2254962b 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -25,7 +25,7 @@
 #include "hw/vfio/vfio-common.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qemu/error-report.h"
 #include "qemu/range.h"
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 120c82f3de..0b539cd55a 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -25,7 +25,7 @@
 #include "qemu/cutils.h"
 #include "qemu/chardev_open.h"
 #include "pci.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 
 static int iommufd_cdev_map(const VFIOContainerBase *bcontainer, hwaddr iova,
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index f5698eeae0..a057034e2a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -26,7 +26,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-vfio.h"
 #include "exec/ramlist.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "pci.h"
 #include "trace.h"
diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
index 980147338a..7b4159948f 100644
--- a/hw/vfio/spapr.c
+++ b/hw/vfio/spapr.c
@@ -19,7 +19,7 @@
 
 #include "hw/vfio/vfio-common.h"
 #include "hw/hw.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index dae94dbbde..1cccec24c3 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -24,7 +24,7 @@
 #include "hw/virtio/virtio-mem.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "migration/misc.h"
 #include "hw/boards.h"
diff --git a/migration/ram.c b/migration/ram.c
index 82c44e8213..5da14601c1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -48,7 +48,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qmp/qerror.h"
 #include "trace.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "exec/target_page.h"
 #include "qemu/rcu_queue.h"
diff --git a/plugins/api.c b/plugins/api.c
index 77b55cff74..24bf31804f 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -49,7 +49,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "qapi/error.h"
 #include "migration/blocker.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "qemu/plugin-memory.h"
 #include "hw/boards.h"
diff --git a/system/memory.c b/system/memory.c
index 7eae1bbda7..281f3c94e1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -26,7 +26,7 @@
 #include "trace.h"
 
 #include "exec/memory-internal.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
diff --git a/system/physmem.c b/system/physmem.c
index 26cfb84454..d856c77d8b 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -66,7 +66,7 @@
 #include "sysemu/replay.h"
 
 #include "exec/memory-internal.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 
 #include "qemu/pmem.h"
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 0950a1c6f1..c401a0981c 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -24,7 +24,7 @@
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #ifndef CONFIG_USER_ONLY
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #endif
 #include "exec/cpu_ldst.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index f764931426..f9dc722f3f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -41,7 +41,7 @@
 #include "trace.h"
 #include "gdbstub/enums.h"
 #include "exec/memattrs.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "sysemu/hostmem.h"
 #include "qemu/cutils.h"
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index c8045d873c..7dd4e403aa 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -41,7 +41,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/device_tree.h"
 #include "gdbstub/enums.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/physmem-target.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-inst.h"
-- 
2.45.2
