Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp843499njj;
        Fri, 2 May 2025 06:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOm4kMdvmLM4fMtGj204hMjZ0BHpB6JVylpljIFJ4WSn7iIwl6k08m4LUbCTkIa1uMzkmZw4q/SNTgDQ==@linaro.org
X-Received: by 2002:a05:6402:1e8e:b0:5f6:d53f:cb9d with SMTP id 4fb4d7f45d1cf-5fa7891a94emr2344620a12.30.1746192285628;
        Fri, 02 May 2025 06:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746192285; cv=none;
        d=google.com; s=arc-20240605;
        b=lqRqeyGASnRYaFRil6wEsL+hOts8/U3VcVrlU18tezZLVAsQk8QgT2RE6lMeZSO14i
         zkWK/xwUxwCDloX2rJXNHJYIB+3eQN2wcqqUS0MTtRQ47oIK7Z29nOEGcURhYbOA293s
         IcEvzVgV67tGVOk+sQS7njNNgS+5O5KHQ9x/CKlvdiLgstX3VLApbXktfa3hT5yFJ/yg
         kunecbkXFNueO9j/+tsjalGUqss0itdsomZOntT7xaNThv3Qiv3o1/s/GkjLADg+WDt7
         QAGx/daVqVKwHqIjo0M9P3Pz4lFn9E+6TXLKNxLqm+yLA+QsnZHkSxWN4aBXR/fQGcm1
         BdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LYAUx9DJ6xKy5d584zL5N/phNdMDhpbOBcPpyre3rSg=;
        fh=xd4zemizN3yr83AYUBtd+9+8SdUn/WPOeioxh0ECf20=;
        b=WxExEAUpx0iDOmFiW1O0sFCeZGMljPF89lDLOVoqQHRvKQwBOvWwJ61ZytYNUn0Bmo
         wLjihzcYxit8KlxmyER1m1fFaTCF0Lz+e13L+GyirPGt760uz8idzsbBopMKcdx7rO6N
         pQVE0LA2y6MaLby9HozUZcu5Duo0jLX7Dp4p9Swt6T9P6DJwubDeDjAfgSQb4pkvwYgD
         NdO+C/vfUZ9SjS+ZapI4OmF60H6sY8rqnr9rhv2MJNdCJ8C9CaxqW2Ad30ND+cBLpyRr
         We8HEnUpZuw/YQYKbZUEoTkkeDIxwbhNhdlnQnzZehav3D1p7ImEged9s31NEizqHwB3
         05eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDEMwAca;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5f92febf206sor1131444a12.8.2025.05.02.06.24.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 May 2025 06:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDEMwAca;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746192285; x=1746797085; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYAUx9DJ6xKy5d584zL5N/phNdMDhpbOBcPpyre3rSg=;
        b=hDEMwAca2j/JGEtNIgg9JqVS7dTI1Ql6GwcO/5MI9In/yFW6ZQwJBE2BrqYV5HsFHA
         20iDemb9ocoAsjwFqPhsUk396z7rs3Me0r1amZST4ABGHbn+eIS3yTT+QDM3QGHrbXB7
         i331uQYdQkqe7F1mQMw6FN1YmdTW2/kJ4FE/9yRUtWouF0fpx0cevemdkNAfRSDNgZzV
         gJjBDrAg6+0H6kQ1xHYc3+3DnObaUN+beXSClNb9yWM22loH7eyhdgvsivCD9S5e/oD3
         BfO5ExihvZiP+ZkW1LuW9zJrJk9ZUFCbL4EqTK3IOp8i8TsYUALjRdM67BBoPUO5unHl
         G/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192285; x=1746797085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYAUx9DJ6xKy5d584zL5N/phNdMDhpbOBcPpyre3rSg=;
        b=RwbYGrrucdiCSxD8oE3S8ZmedF3CprRDd7rkKHr944RClckAYO3XheuiIxzOtD8zqa
         nUQtVIjuupLDXwDp2BECCPsOlEgIMJdAPLZgIouyDXUwGmbo52VcXeRyDn/mkYJ5kKja
         mkLweSeB08eDKFCUOfjl3atB2lFNzLOv1SEvvOIc9dUW8ejHmDERYazQAsm6LO07pTl3
         Qfad9eo8nypDNpKxhLRPqS3dIzFhc/9mRWQgETovjzabZ6N8WhSHh7c64ONXrwXyHKOe
         sgNbAxSVDfY9nSDjFN1NWdZwTM6xnkfMSrzRaOJKLFiDpv9yg901VQvKUybKStGkW2Pa
         dwZg==
X-Forwarded-Encrypted: i=1; AJvYcCWtUJ5fuSiJvU+9p2kozEZHBv9p3d1nHaGcWg6J6MjxB/t2gI07bsT/dcmr5a8B2t5jqQqo6IKyP1suvw==@linaro.org
X-Gm-Message-State: AOJu0Yyhp8s1de+HOmNFEK/uRhGko6Wt07hBtnuz/ao4rCHrdYp19BcM
	8djt/vs/2dEV70gEfUnR7oZsoue2kfFmztRnakZ1N9zAJ0J/z9EqRYwhtxxldi4GpQ==
X-Gm-Gg: ASbGncvPMFg1gV6Fln/GFywirfOic/LwFhqtet19S90dPnQNeDiWnz/52e/DA7G+JIu
	t+5JkkzSYtLfZIgoSPeaKhHJN7wilaf5zhRQhjIwx15+AQ/0Y4k0f/qb0/oLOB0fIQ2kuj+2385
	plgfu/0znubHcgAtkZ5Ed8u2W8VIZymFy1NhKXopJNOcrxEml6OJUf2+ac+0CfIknomz7mFkzDZ
	dinZxFnY/qv4dHGEJEQHozizUZ5UzK8wZsxPBxEbNB9CaEoTM7z2T9OqyNqFhmUrktIYckm2H4p
	0Od0m91spahgOpcLKHAZGhLKuzrqvu29hAtaqb1Zq7EjyZ37OHVpe0ju9hQ5ZLke7ot/HtGG6Jr
	WxWK3JU3iLyXp6sY=
X-Google-Smtp-Source: AGHT+IHZP86Pk/cWePeuc+ChNq3UewIyPTncUnZWBpQMeMMMROeNkB0WO7L4GdyAjsvKlxmFvmFdNA==
X-Received: by 2002:a05:6402:4408:b0:5f0:9eb3:8e71 with SMTP id 4fb4d7f45d1cf-5fa788c0b0dmr2326404a12.27.1746192285025;
        Fri, 02 May 2025 06:24:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756206sm1236041a12.3.2025.05.02.06.24.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 May 2025 06:24:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jonah Palmer <jonah.palmer@oracle.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable legacy support
Date: Fri,  2 May 2025 15:24:41 +0200
Message-ID: <20250502132441.64723-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KeRY07Jm3zmp

Legacy VirtIO devices don't have their endianness clearly defined.
QEMU infers it taking the endianness of the (target) binary, or,
when a target support switching endianness at runtime, taking the
endianness of the vCPU accessing the device.

Devices modelling shouldn't really change depending on a property
of a CPU accessing it.

For heterogeneous systems, it is simpler to break such dev <-> cpu
dependency, only allowing generic device models, with no knowledge
of CPU (or DMA controller) accesses.

Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
current default (enabled).
New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
the VirtIO version 1 spec.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-access.h | 5 ++++-
 hw/virtio/virtio.c                | 8 ++++++++
 target/arm/cpu.c                  | 5 +++++
 target/ppc/cpu_init.c             | 5 +++++
 hw/virtio/Kconfig                 | 5 +++++
 5 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 07aae69042a..b5b471711a6 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -20,7 +20,10 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-bus.h"
 
-#if defined(TARGET_PPC64) || defined(TARGET_ARM)
+#include CONFIG_DEVICES
+
+#if defined(CONFIG_VIRTIO_LEGACY) && \
+    (defined(TARGET_PPC64) || defined(TARGET_ARM))
 #define LEGACY_VIRTIO_IS_BIENDIAN 1
 #endif
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 480c2e50365..659ab3cb969 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -47,6 +47,8 @@
 #include "standard-headers/linux/virtio_mem.h"
 #include "standard-headers/linux/virtio_vsock.h"
 
+#include CONFIG_DEVICES
+
 /*
  * Maximum size of virtio device config space
  */
@@ -3502,6 +3504,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 bool virtio_legacy_allowed(VirtIODevice *vdev)
 {
     switch (vdev->device_id) {
+#ifdef CONFIG_VIRTIO_LEGACY
     case VIRTIO_ID_NET:
     case VIRTIO_ID_BLOCK:
     case VIRTIO_ID_CONSOLE:
@@ -3513,6 +3516,7 @@ bool virtio_legacy_allowed(VirtIODevice *vdev)
     case VIRTIO_ID_RPROC_SERIAL:
     case VIRTIO_ID_CAIF:
         return true;
+#endif
     default:
         return false;
     }
@@ -4014,8 +4018,10 @@ static const Property virtio_properties[] = {
     DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features),
     DEFINE_PROP_BOOL("use-started", VirtIODevice, use_started, true),
     DEFINE_PROP_BOOL("use-disabled-flag", VirtIODevice, use_disabled_flag, true),
+#ifdef CONFIG_VIRTIO_LEGACY
     DEFINE_PROP_BOOL("x-disable-legacy-check", VirtIODevice,
                      disable_legacy_check, false),
+#endif
 };
 
 static int virtio_device_start_ioeventfd_impl(VirtIODevice *vdev)
@@ -4151,7 +4157,9 @@ static void virtio_device_class_init(ObjectClass *klass, const void *data)
     vdc->start_ioeventfd = virtio_device_start_ioeventfd_impl;
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
+#ifdef CONFIG_VIRTIO_LEGACY
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+#endif
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5e951675c60..d01fcb9fd1a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include CONFIG_DEVICES
 #ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
 #endif /* CONFIG_TCG */
@@ -1130,6 +1131,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
 #endif
 }
 
+#ifdef CONFIG_VIRTIO_LEGACY
 static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1138,6 +1140,7 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
     cpu_synchronize_state(cs);
     return arm_cpu_data_is_big_endian(env);
 }
+#endif
 
 #ifdef CONFIG_TCG
 bool arm_cpu_exec_halt(CPUState *cs)
@@ -2681,7 +2684,9 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
+#ifdef CONFIG_VIRTIO_LEGACY
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
+#endif
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b0973b6df95..4b6c347bda8 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -50,6 +50,7 @@
 #include "hw/boards.h"
 #include "hw/intc/intc.h"
 #include "kvm_ppc.h"
+#include CONFIG_DEVICES
 #endif
 
 #include "cpu_init.h"
@@ -7352,12 +7353,14 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
 
 #ifndef CONFIG_USER_ONLY
 
+#ifdef CONFIG_VIRTIO_LEGACY
 static bool ppc_cpu_is_big_endian(CPUState *cs)
 {
     cpu_synchronize_state(cs);
 
     return !FIELD_EX64(cpu_env(cs)->msr, MSR, LE);
 }
+#endif
 
 static bool ppc_get_irq_stats(InterruptStatsProvider *obj,
                               uint64_t **irq_counts, unsigned int *nb_irqs)
@@ -7470,7 +7473,9 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
     .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
     .write_elf32_note = ppc32_cpu_write_elf32_note,
     .write_elf64_note = ppc64_cpu_write_elf64_note,
+#ifdef CONFIG_VIRTIO_LEGACY
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
+#endif
     .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 7648a2d68da..314185f0016 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -1,6 +1,11 @@
 config VIRTIO
     bool
 
+config VIRTIO_LEGACY
+    bool
+    default y
+    depends on VIRTIO
+
 config VIRTIO_RNG
     bool
     default y
-- 
2.47.1
