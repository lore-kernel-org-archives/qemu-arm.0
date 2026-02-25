Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5909CF5544C
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 03:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv5P1-0000ng-C7; Tue, 24 Feb 2026 22:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Oz-0000n9-Sw
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Oy-00037v-BV
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so37663735e9.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771989447; x=1772594247; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZyFoJ14S6oW3srTeQcVGkbUM0aXn2EkRu3cSSx5I2ts=;
 b=gc2zw4UNIC3fQcR+5wvNF4i/z4PJiPESvwLWuaNU7GzaYK7Lp2bfkkqIvQePgQdEuT
 2qVByURNujs3Ugvqj9PB5HMNb/AXeGS+muvO7dJM4Km+vMU7pFypfI5px4B+KGg0aTgg
 1gHmLARRQ7iSgeZxOVtlbbFbGszKii7q32taJcWG94fltos9NFOo6+ezPSLVvfOFIGw+
 j9jAos93Je0VWSXgsBLQ5tQUyypQe9/RYVfmQj3gYukFKoQHkf63iPIUWOr7vAfxY3oZ
 GJ+s0DhP25zUBO6qC/gUb1TB6sY0PW8rI4GBhGkiF2EwqefD5Ji65i+SUsTzc0Sod0BN
 e+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771989447; x=1772594247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZyFoJ14S6oW3srTeQcVGkbUM0aXn2EkRu3cSSx5I2ts=;
 b=gPnu6dBvIupVJOTOFD5xai2rdG0yFI/8EFGodpcFZb6GP6ZzVUQR3+M+ya7qtYmDE4
 y6p7wdvxvLOEBkEop6fBUwRvKaBaewU3eB9MtYY1gVp7HouIHWYaHgB2XQRSvZEBLW1R
 L88LG2J9zJyzdqgDIc945vdEHCHYaCIQIBg89d5RalnmZZxEUowbc2nEXT8WsR0x1S8E
 hQplsBtcbqsZpMy/wzEYvdHjTuz09eYqAuw8I9pbgLIT6NSgn0/vV30/i3ScbIuR4uG+
 +DnxehWXkhi5eo9RRlaiaUEyIq5Mdq36687eLhND6wCLUGYh71VkEPehiVAGFhfHcQv4
 +Vug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSfLIvE4hj+0jSv5zNFR24FRjSUUtK5esF2R40m6xfqEezIA7ED0sonc00RfS+vlqJeN1YwXaBWg==@nongnu.org
X-Gm-Message-State: AOJu0YwMx/k5podTZBIhKpI2fcK16WAF+dzuXDaJ3RUsFvTnVWEVi0zW
 Nx1HVZVgpbAKZ712Jl0JED/fWR/qxj16Q5+jrgnIeatYlpCEN5RloAypfyZlYz02rAQ=
X-Gm-Gg: ATEYQzycGZyBCCbhiAx7IcYSd+AWRaj8qmWeTSoTz0r3ifR2V2w0hMVVmLm3F1wDoeG
 xLXUg7Mxu9UUnHa/jPaYbRCiKYIkgPPw2EwXetQsLaFH8SFWwcMVmkKyZ8SdQ4rjnhxyVutSu1r
 OM3tieVqUjgmDXWsEoFDd6IIcBlNXjlSskFQh0P+soe0Kq63CEkaWl4IykcCTP+6FmdET025UyV
 2EPbAW/nlkYhY5jFwADer8960RD9yboLySG55KfIrWJog0+VpEBq/ipwXVBQ3PzQqEgwEBjaxFh
 d4mBcm+GE9KmiYDwwffNKha6lcptA6exJfEa5T3+SGz1EE8h3WVFsVRHRjEatpCPJH6aBfTdp4N
 aM+IjMSSbQCxwMlthGt5cFKPnZu5Vte0dzQckyKukEYIbshoZPD22PH/XqTgMIOHHIcMC8HXbFR
 faq2G62w8u9MOBdJbk1lkB78t1ioqg51s8lo6hTorgdEwPN6FiVYYKRaDAEd1JEFfckP0v96cJ
X-Received: by 2002:a05:600c:1f93:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-483bef53c8emr13729355e9.18.1771989446939; 
 Tue, 24 Feb 2026 19:17:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb87067sm935425e9.12.2026.02.24.19.17.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 19:17:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>
Subject: [PATCH 3/3] hw/s390x/s390-pci-vfio: Avoid including CONFIG_DEVICES in
 hw/ header
Date: Wed, 25 Feb 2026 04:16:58 +0100
Message-ID: <20260225031658.32095-4-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225031658.32095-1-philmd@linaro.org>
References: <20260225031658.32095-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

By inlinining the stubs we can avoid the use of target-specific
CONFIG_DEVICES include in a hw/ header, allowing to build the
source files including it as common objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/s390x/s390-pci-vfio.h | 20 --------------------
 hw/s390x/s390-pci-vfio-stubs.c   | 32 ++++++++++++++++++++++++++++++++
 hw/s390x/meson.build             |  1 +
 3 files changed, 33 insertions(+), 20 deletions(-)
 create mode 100644 hw/s390x/s390-pci-vfio-stubs.c

diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index ae1b126ff70..f7d6149daf6 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -13,32 +13,12 @@
 #define HW_S390_PCI_VFIO_H
 
 #include "hw/s390x/s390-pci-bus.h"
-#include CONFIG_DEVICES
 
-#ifdef CONFIG_VFIO
 bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
 S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
                                           S390PCIBusDevice *pbdev);
 void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
 bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh);
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
-#else
-static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
-{
-    return false;
-}
-static inline S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
-                                                        S390PCIBusDevice *pbdev)
-{
-    return NULL;
-}
-static inline void s390_pci_end_dma_count(S390pciState *s,
-                                          S390PCIDMACount *cnt) { }
-static inline bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
-{
-    return false;
-}
-static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
-#endif
 
 #endif
diff --git a/hw/s390x/s390-pci-vfio-stubs.c b/hw/s390x/s390-pci-vfio-stubs.c
new file mode 100644
index 00000000000..d9882b7aad0
--- /dev/null
+++ b/hw/s390x/s390-pci-vfio-stubs.c
@@ -0,0 +1,32 @@
+/*
+ * s390 vfio-pci stubs
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/s390x/s390-pci-vfio.h"
+
+bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
+{
+    return false;
+}
+
+S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
+                                          S390PCIBusDevice *pbdev)
+{
+    return NULL;
+}
+
+void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt)
+{
+}
+
+bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
+{
+    return false;
+}
+
+void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
+{
+}
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 1bc85837996..57cc2a6be3d 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -34,6 +34,7 @@ s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files(
 ))
 s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
 s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
+stub_ss.add(files('s390-pci-vfio-stubs.c'))
 s390x_ss.add(when: 'CONFIG_VFIO_AP', if_false: files('ap-stub.c'))
 
 virtio_ss = ss.source_set()
-- 
2.52.0


