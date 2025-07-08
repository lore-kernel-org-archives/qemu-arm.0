Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49B6C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:12:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZGXG-0007vl-QW; Tue, 08 Jul 2025 18:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGGO-0001Qa-0j
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:54:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGGM-0003RH-8N
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:54:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453643020bdso38236415e9.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011645; x=1752616445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qoh+8dqxlT0ZYBwoM39/O4GOENzlLmIR6TyBNNrriVw=;
 b=uaat15DjDZz+jroBYOJIJ64ftvjAuK/f2zwdIYR4lWgk6yV4D8SgtuKM8pB7PnBIh0
 gdy2zefcKjwGzTQbZSYoqpwX7Bg0wukjLtIpLKEEXtEyMqqfJH/nP76Tc628WcrbSdue
 kI1SSStOyMAkv+be0hZUYTyOYNaJ1WaIkQ+zUoOpiofj7Wvp9KEsLVIC1PHTiKGHsN5T
 /lTxHSkqloIfKENF/mIYaCBf24ubaLcv4Yci2FmQHjuq61/95wB21efCduWXWdu1X4lf
 kAN5Jhgea7p2rxCKjMq70NOX8jN0Ie9ZFJIWgN4B/Sc7HCFY4bxkwngnrG/teFKyZBv7
 iZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011645; x=1752616445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qoh+8dqxlT0ZYBwoM39/O4GOENzlLmIR6TyBNNrriVw=;
 b=aTyWHTDcMneKciJV8Z0mEmP6ncxHt9EzdcqSUBn2deZ8O9EVieqCvHyc9WtIVe4Phu
 d5u5uian5iCQxoxenSSLzy7dy33uCMuB/skyl1rAO78gBP0p2t4tsHfrWR0E4ycdX8Uq
 cwhopU8FjqUU0gZWvqzG4RAj6apQcUO4aDZhCbkarhRV+pYZzyEQYzsqo6bDng+lK1Yx
 j3V/UU5h7tFOnCPpccCHYnF8MGv5ceWE2Zoo4Jlp4OuKyC+g3rBxK6qXgmvZSVx8Vf1C
 xE4AtiUkTPO1B4THmjmRr0UpG4PDx6i+lMpkz2wwGZ7Hi64IkdGcSSR9RAvM+IsMDzuR
 HM1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrvexixRyZSZJDRaOWBw3+Op93QhbkJzxX3W74UrQtoIidI0PjVPiKDSWfxa+xyaxLkTFy4yOYrg==@nongnu.org
X-Gm-Message-State: AOJu0Yx69ORYN2IwZFwNPoBkdOclEuYp2elg3sQ1jcPBWSSoCpavh5Lx
 6sTa7U4/Nf8w0pWN0fiSeGq0fCRyc+Y4cx0JyA6pO1Jm7+n7KcKNIDQBY1nhSVSX3FY=
X-Gm-Gg: ASbGnctMGkUvHevVtr6nP41+1DjKcn6AM6BQBQgenZruSrU5KuwgSNPrTTKqL0Va06O
 G+sRAVxjfMFjIaWWuhC3rzfpLXl20R8aMCQ7bqxs1myePhwlv8FYc1d6jA+PTkI0ROfSNgq5fQ6
 0s+S1NEahK7hO7WrgGkGqORLG0fNInx75JdYFYWN1+ctmFqrymzt3ITDc4fcD4dJUYiTnJ4Vdzw
 mgSeRMMPBqaEw8zEPoLPfOTpBG2nDUJtt+s0vCqPlBRNfEoCHhCokUfYcHqXryv+qYsooKHSQk/
 JJaGnNNsSMYe1quyXZJgEi3d7t3OL4q082YMrNcLB18KhSF9zYIwNpGh69mNKk3PcUdrKe6hhyS
 wN3SqsaxDccDCZGts46OSiXvPFeXQo01uf3pl1eJXaQ==
X-Google-Smtp-Source: AGHT+IFa1+vUgnBYCiG3UCfP9XSLXt3QlGLqHgRmPXtuSBhGY4XE1sm2P52+dh4vRQ4ucCsO4KZKhw==
X-Received: by 2002:a05:6000:2c0f:b0:3a6:c923:bc5f with SMTP id
 ffacd0b85a97d-3b5e2fec609mr1003608f8f.17.1752011644784; 
 Tue, 08 Jul 2025 14:54:04 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0a5csm13783800f8f.29.2025.07.08.14.54.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:54:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-10.1 RESEND v8 8/8] hw/virtio: Build various files once
Date: Tue,  8 Jul 2025 23:53:19 +0200
Message-ID: <20250708215320.70426-9-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708215320.70426-1-philmd@linaro.org>
References: <20250708215320.70426-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now that various VirtIO files don't use target specific
API anymore, we can move them to the system_ss[] source
set to build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/virtio/virtio-config-io.c |  1 -
 hw/block/meson.build         |  6 ++++--
 hw/virtio/meson.build        | 20 +++++++++++---------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/virtio-config-io.c b/hw/virtio/virtio-config-io.c
index ad78e0b9bc5..f58d90b6e31 100644
--- a/hw/virtio/virtio-config-io.c
+++ b/hw/virtio/virtio-config-io.c
@@ -11,7 +11,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio.h"
-#include "cpu.h"
 
 uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
 {
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 655704471a5..43ed296cf47 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -13,7 +13,9 @@ system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
 system_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
 
-specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
+specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk-common.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
+system_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('virtio-blk-common.c'))
 
 subdir('dataplane')
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 164f6fd995a..3ea7b3cec83 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -1,6 +1,7 @@
 system_virtio_ss = ss.source_set()
 system_virtio_ss.add(files('virtio-bus.c'))
 system_virtio_ss.add(files('iothread-vq-mapping.c'))
+system_virtio_ss.add(files('virtio-config-io.c'))
 system_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virtio-pci.c'))
 system_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'))
 system_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
@@ -10,11 +11,11 @@ system_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c')
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
-specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
+specific_virtio_ss.add(files('virtio-qmp.c'))
 
 if have_vhost
   system_virtio_ss.add(files('vhost.c'))
-  specific_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
+  system_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
   if have_vhost_user
     # fixme - this really should be generic
     specific_virtio_ss.add(files('vhost-user.c'))
@@ -43,22 +44,22 @@ if have_vhost
   endif
   if have_vhost_vdpa
     system_virtio_ss.add(files('vhost-vdpa.c'))
-    specific_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
+    system_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
   endif
 else
   system_virtio_ss.add(files('vhost-stub.c'))
 endif
+system_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c'))
+system_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
 specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('virtio-nsm.c', 'cbor-helpers.c'), libcbor])
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi.c'))
-specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_SCMI'], if_true: files('vhost-user-scmi-pci.c'))
+system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: files('virtio-nsm.c'))
+system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('cbor-helpers.c'), libcbor])
+system_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -67,6 +68,7 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi-pci.c'))
 
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
@@ -85,7 +87,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MD', if_true: files('virtio-md-pci.c'))
 
-specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
+system_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
 system_ss.add_all(when: 'CONFIG_VIRTIO', if_true: system_virtio_ss)
 system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
-- 
2.49.0


