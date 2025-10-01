Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10EDCCA471
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:58:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4140-0002kH-AE; Wed, 01 Oct 2025 13:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413a-0002Gf-Q1
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4137-000138-C7
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e501a9034so387155e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341324; x=1759946124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aokqeion6vg/XBK7zMSfidbyVnYpQrHhaMRTyeMkDMQ=;
 b=ZBU9Lr4SAacljZ5A6FC3HGsMdbjhrrjuoQkfQ2QQ6phMbVB0QJLTgVDxTWqNxqhwgZ
 gnp6VzkrPjIByNKQ15LjmV7X5dtj5N7AAXCzppSsJxu9iUzT+KteZRB4WyECYUwHxSZ0
 WUsuiQ8be+nZdT1SKYk9/2NciFYf66Z7PJjAG21z9OezKBYrzwx6rQ1PWeGzeJDzZL9t
 umiEPasOvGs+tZwl1VxfZCeC2ywhsOV8k77Bjz7X0cF+ar5OHdtgWgoEwS1A8ONqWnf+
 g6wOK9qUrfKD1z71s7n2URCL6TxgbB/hDOKWlrsSpMGx+CUFyB6K4CQ4YSWgex1xlQ3r
 taIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341324; x=1759946124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aokqeion6vg/XBK7zMSfidbyVnYpQrHhaMRTyeMkDMQ=;
 b=LchXtwl3mTkYHBnXrTYMhAOmURacbdpowPWFsDcozWR0XgmAeqhpE5DsZLMoJiGOQP
 HBONyupWqoWLH9M9/YGN4z1LDvWWaD036yPT2CkdI2Jx3ETj4cFmNiYKtIsa7cckpbkz
 NH5NQxGfCpukjXu1V78zqDVmyXO1bsXzkkqEJuLbHX8+ojLn/MP5wPfhxXG/gmGaVRbL
 3lBdzuomcxTRjlrhHDavSU82bE6hOiUJ8ub64YTPRBniIl6ftQsAoCbjhKgpkMg5WvBK
 CRsZIWOxWpZtU3fUMKUtX4LTlWAzhFJdmghChWDHdVfjeO6Q2RGa7ykHNiyYDRQ+0LGD
 NQXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG3H3mHazafkvOHTyRFlfZY3BMZPEhy1XBPGFUqVgkmului8qgOiXb7O1YIiPsankJDhamlhpcCw==@nongnu.org
X-Gm-Message-State: AOJu0YweDO96KmhadOjEpJC72eYKCHw+21xkXo/9Ke03XX9HaI/cYLyl
 LA6YTr2fIHZ1aCO9ngTxEwY2Bk7ZIxJomIXrvY5PcGNWWlPc7UakTCKFuGaZZRSS8EQ=
X-Gm-Gg: ASbGncuGw57qFSMF7WPK4GUu7gcnq4CQh+Jazbxe9pgsf9+32TRwEz6NLnLlWg5+bZa
 /53yMpx8NxfdzcQIqaaJVNGQHtO99J6ZleeyZ9bm6s3Rrnnb+KCkIMx4WtvldG+2wWmSv1T1cGj
 jBMYX6m6bxIaEi03dOJ7frDpEm3lleuUuaBn3022VvBBEWxmtvc4R0Vio8mecGfofP68CniqcAz
 1dHVjfHVhWnJ2zstXJu8bIun0p+cEVglMtJv4u2pOk8lrV76viU5z33qle82qDT9u931YYI1UdQ
 u2ckifoO9+j9MISroDghuGQNk7cOqNM0BVGfSGc1MJzZe5+D1yukwdvk1Hw/4ldNU2zWKWiBi6W
 /8UkGx9pYtfJXO+/CIcREZjmPrOqq8Eep8Yye8BGvIoZIdrw/bui+9t0hrTxty2gQr9YnjUp4Ef
 LcpN8ZCqTr3YQXRhleKxrQ4MwG/g==
X-Google-Smtp-Source: AGHT+IGTdM+ShrsSYsYPJCqJA4n0otn39Exzcd9EGo7lsVQICK9Ecvf0H7UF6pHszRiQWBgo2Y4+Cw==
X-Received: by 2002:a05:6000:240a:b0:3e7:6197:9947 with SMTP id
 ffacd0b85a97d-42557a15b6fmr3507602f8f.53.1759341323415; 
 Wed, 01 Oct 2025 10:55:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c49sm143400f8f.3.2025.10.01.10.55.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 06/18] hw: Remove unnecessary 'system/ram_addr.h' header
Date: Wed,  1 Oct 2025 19:54:35 +0200
Message-ID: <20251001175448.18933-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

None of these files require definition exposed by "system/ram_addr.h",
remove its inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/spapr.c                    | 1 -
 hw/ppc/spapr_caps.c               | 1 -
 hw/ppc/spapr_pci.c                | 1 -
 hw/remote/memory.c                | 1 -
 hw/remote/proxy-memory-listener.c | 1 -
 hw/s390x/s390-virtio-ccw.c        | 1 -
 hw/vfio/spapr.c                   | 1 -
 hw/virtio/virtio-mem.c            | 1 -
 8 files changed, 8 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 82fb23beaa8..97ab6bebd25 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -77,7 +77,6 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost-scsi-common.h"
 
-#include "system/ram_addr.h"
 #include "system/confidential-guest-support.h"
 #include "hw/usb.h"
 #include "qemu/config-file.h"
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index f2f5722d8ad..0f94c192fd4 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -27,7 +27,6 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "system/hw_accel.h"
-#include "system/ram_addr.h"
 #include "target/ppc/cpu.h"
 #include "target/ppc/mmu-hash64.h"
 #include "cpu-models.h"
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 1ac1185825e..f9095552e86 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -34,7 +34,6 @@
 #include "hw/pci/pci_host.h"
 #include "hw/ppc/spapr.h"
 #include "hw/pci-host/spapr.h"
-#include "system/ram_addr.h"
 #include <libfdt.h>
 #include "trace.h"
 #include "qemu/error-report.h"
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 00193a552fa..8195aa5fb83 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -11,7 +11,6 @@
 #include "qemu/osdep.h"
 
 #include "hw/remote/memory.h"
-#include "system/ram_addr.h"
 #include "qapi/error.h"
 
 static void remote_sysmem_reset(void)
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 30ac74961dd..e1a52d24f0b 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -12,7 +12,6 @@
 #include "qemu/range.h"
 #include "system/memory.h"
 #include "exec/cpu-common.h"
-#include "system/ram_addr.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/remote/mpqemu-link.h"
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index d0c6e80cb05..ad2c48188a8 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "system/ram_addr.h"
 #include "system/confidential-guest-support.h"
 #include "hw/boards.h"
 #include "hw/s390x/sclp.h"
diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
index 8d9d68da4ec..0f23681a3f9 100644
--- a/hw/vfio/spapr.c
+++ b/hw/vfio/spapr.c
@@ -17,7 +17,6 @@
 
 #include "hw/vfio/vfio-container-legacy.h"
 #include "hw/hw.h"
-#include "system/ram_addr.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "trace.h"
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 1de2d3de521..15ba6799f22 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -25,7 +25,6 @@
 #include "hw/virtio/virtio-mem.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "system/ram_addr.h"
 #include "migration/misc.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-- 
2.51.0


