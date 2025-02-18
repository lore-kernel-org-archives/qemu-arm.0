Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp805163njb;
        Tue, 18 Feb 2025 08:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9syHNe1i/cPiyd5duFJHC729Q9XXA0OEP0A1+KxeJT0HqrqsqnQdM519xQi/pkEK4GCIKKZ5pIElsUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGxbE2r6dbXbES7FdpwwjA9A3kWYFeDh5enL358nliRX6wS6QdpYz9GXrZrO6jo4c89X+VM
X-Received: by 2002:a05:6214:2606:b0:6e6:5aa2:4e4a with SMTP id 6a1803df08f44-6e66cd19c42mr217373406d6.28.1739896053684;
        Tue, 18 Feb 2025 08:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739896053; cv=none;
        d=google.com; s=arc-20240605;
        b=A6FTWUVjy8FawXYRtYcZRqWB7Mnfn7jnorE6TjoWDUtBNNif5sZBbZzRpsuDkCb8Bn
         TKiDpr5lyBiyPtTBCmTOZwfULizSfilWvDEPZ6ILVLmcpTYY/d+Vp6fcfYW0RJYrhelT
         gI4IWX4H/LbL6HD8dXjWWInjz+IgAEna+o5SecPbfitQ5j3sKuVmLoJGIOKTDd0Mult2
         j5qLjYRN5xzwcwnxECsywcdkNbEid/G243+K21A/NsXVPljfIoZSnS9XHDILfSYxbZCb
         PBKAyAF0VjfR5bV1JbFgcIA3Uq4e5Axv656c75tqdhwrtFxufR3PfqDKP/7q8ItFWZ+o
         ciWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZEWDgBTGZHQh8hQjrfZA2thbBnd3w2okAGpaFOGJy1M=;
        fh=N4IROflteIS7QTTz0kYrA5BC15UlWWJGk/Fv2C6r1lY=;
        b=gtDg6ZPD936GTzAj+lfXPllq8WDO+0l+bYAcKtoh996jkdxpxXb7eSRVlYN7kqbyq3
         9QaLOT7jCkJQX+NLEQIx0ftraiPsibYHiUV6r16s7ZwAzrJpUGHqP1AEieUTtvDC71MO
         bRoBvY3jqcDDBiD0ocMBElDJhFCptM9o6ZdBBsa27yf0FGgbu3uG9WFtJwJGuBvCNUrk
         6OV1ghvE2DpUjnO2VsSO5GfPKLfFHqyAMXBKGMBt5LzJjVmU2RdgLBQFO5T+WGpUzkiy
         jv4sH4g2DcxSgCWn49dgdCUXrYEUfJjzT6VhHug0SyArW3AhzR16B2h5xA46batp1sxi
         uzdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCvvQdLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d742189si110018756d6.136.2025.02.18.08.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 08:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCvvQdLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkQQt-0004vw-L9; Tue, 18 Feb 2025 11:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQQs-0004vQ-9Z
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:26:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQQq-0000l0-FM
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:26:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-439946a49e1so6551455e9.0
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 08:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739896007; x=1740500807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZEWDgBTGZHQh8hQjrfZA2thbBnd3w2okAGpaFOGJy1M=;
 b=rCvvQdLV3S030l6Z1oSsog4abNdjiFuANzCIySt0DHb909m6qcgdUGAEtjnwsy4RBL
 eWCpL9mVM3mzP7MGzCV/YT4z2i4P/gvBEatD4vjUOKCS98PoWFZSml0qTBodmd358C25
 /UN6vIV3Q1z3ew7E27Qta18rJNlQv/FIR12uXWtDkqDmMxcwNLSMtRAYZvVI+sKCslXo
 T8ANcAOUKpM6j3bTQQBq0R5+LWjLJCatd7H85kS0j+t9ERskvK63A+I68zxBrO5NLWCi
 VHfkMi5UCzKveZKnpmi+LrzWDBKdSQ1In+ohRn8gwvvnUhJr4OMfn7gfidaTvfpOAZGY
 U/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739896007; x=1740500807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZEWDgBTGZHQh8hQjrfZA2thbBnd3w2okAGpaFOGJy1M=;
 b=U8OCBpENlOC/OsFUtXGkAUcjxCR+4j+tEcfMkqRCRbUoRAnaxYdMDkkDK4esY6il0n
 sam5svqHcFErC5L1Qoq+48JAHsljZxbSv/H5n88ojOJyHFKcQNBuLOC5KNQ7tu/3GCZx
 D2Idw+xALfbOGt1YX3e+NPZ7FpCd+Fk1rfD7kfACcwp6+H/qpiaFilatqcZW5db0/eNT
 mhay9W2rNx7i/2+ExMs4Zl6a7UdNXnhXvCHzFsXSoNwDBP5MhkfOyTr57tgh68Zvqsr+
 Pn+Unn2HAWNuNQij3Pb1AEp7C9IJxFD9J5iIxjv/5mQlQVjlc4LTdpqYymaPUUi32E6S
 1KQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz/IXmSjgh+cZBX09HUT8/8c47EnA8+LsW+gzm6dDdMss7gccSU8fGAUJxvf+hyg1466c19IxzyA==@nongnu.org
X-Gm-Message-State: AOJu0YxBDyNyklk39ZJMBGltoH/lLwNdgQS292quYQGa3sgTbtAJ5NNj
 qw5QlKnvrjcCSO9Rj2Gtx/5NwwIAy1dkEV2y6ljPKj7YNNUsL58TVkD1z6V9C/E=
X-Gm-Gg: ASbGncsD+JHJJWGSh6OENR3EsM236o21ibwzVnya4tGhxlcuBCsJCmCa74YhSIudxo6
 rAo8/Ov34PJ1+g4uuvapBIw9HJYOKddTxu+hMGwC6qVnTVunf1c7kCEVbDChtcCHF1Km47sQ8p1
 5VL7sHWDkPEK3BxYI5OcRAui3hRt70W2+h/69WqF7fyH4U+iKWFlk4bkcuA94Ay+jbKgWJwoi6S
 7sbxeq+lZCL/9SVamEnhs0r/y8pAbPdeKk5KMqF93cb9LE0oiGm5cRc6h2eJylibgrHSsH+YKK9
 jsZTp6w96M8Gp1uTX5RDLyeLxp7TvsWmNo7PkxvPOr1NUBglKtc02XN94uMbnUjKkw==
X-Received: by 2002:a05:600c:4e8c:b0:439:9274:81db with SMTP id
 5b1f17b1804b1-43999d76ddcmr3474325e9.5.1739896006891; 
 Tue, 18 Feb 2025 08:26:46 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa2dsm15228567f8f.101.2025.02.18.08.26.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 5/8] hw/xen/xen-hvm: Reduce included headers
Date: Tue, 18 Feb 2025 17:26:15 +0100
Message-ID: <20250218162618.46167-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hzDY0k/IorXA

Have "hw/xen/xen-hvm-common.h" include the bare minimal set
of headers. Adapt sources to avoid errors when refactoring
unrelated headers such:

  include/hw/xen/xen-hvm-common.h:71:5: error: unknown type name ‘xenevtchn_handle’
     71 |     xenevtchn_handle *xce_handle;
        |     ^~~~~~~~~~~~~~~~
  hw/xen/xen-hvm-common.c: In function ‘cpu_get_ioreq’:
  hw/xen/xen-hvm-common.c:227:13: error: implicit declaration of function ‘hw_error’
    227 |             hw_error("Fatal error while trying to get io event!\n");
        |             ^~~~~~~~
        |             herror
  hw/xen/xen-hvm-common.c: In function ‘handle_ioreq’:
  hw/xen/xen-hvm-common.c:446:34: error: ‘target_ulong’ undeclared (first use in this function)
    446 |             (req->size < sizeof (target_ulong))) {
        |                                  ^~~~~~~~~~~~
  hw/i386/xen/xen-hvm.c: In function ‘xen_add_to_physmap’:
  hw/i386/xen/xen-hvm.c:298:22: error: implicit declaration of function ‘xen_replace_cache_entry’
    298 |         uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
        |                      ^~~~~~~~~~~~~~~~~~~~~~~
  hw/i386/xen/xen-hvm.c: In function ‘xen_log_global_start’:
  hw/i386/xen/xen-hvm.c:465:9: error: implicit declaration of function ‘xen_enabled’
    465 |     if (xen_enabled()) {
        |         ^~~~~~~~~~~
  hw/i386/xen/xen-hvm.c: In function ‘regs_to_cpu’:
  hw/i386/xen/xen-hvm.c:487:5: error: unknown type name ‘X86CPU’
    487 |     X86CPU *cpu;
        |     ^~~~~~
  hw/i386/xen/xen-hvm.c:492:15: error: ‘R_EAX’ undeclared (first use in this function)
    492 |     env->regs[R_EAX] = req->data;
        |               ^~~~~
        |               REG_RAX

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 14 +++-----------
 hw/arm/xen-stubs.c              |  5 ++---
 hw/i386/xen/xen-hvm.c           |  5 +++++
 hw/xen/xen-hvm-common.c         |  6 ++++++
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index c1ea2c0d787..19df5600a39 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -1,18 +1,10 @@
 #ifndef HW_XEN_HVM_COMMON_H
 #define HW_XEN_HVM_COMMON_H
 
-#include "qemu/units.h"
-
-#include "cpu.h"
-#include "hw/pci/pci.h"
-#include "hw/hw.h"
+#include "qemu/queue.h"
+#include "exec/hwaddr.h"
 #include "hw/xen/xen_native.h"
-#include "hw/xen/xen-legacy-backend.h"
-#include "system/runstate.h"
-#include "system/system.h"
-#include "system/xen.h"
-#include "system/xen-mapcache.h"
-#include "qemu/error-report.h"
+#include "hw/xen/xen_backend_ops.h"
 #include <xen/hvm/ioreq.h>
 
 extern MemoryRegion xen_memory;
diff --git a/hw/arm/xen-stubs.c b/hw/arm/xen-stubs.c
index 34beb8b08cb..5551584dc20 100644
--- a/hw/arm/xen-stubs.c
+++ b/hw/arm/xen-stubs.c
@@ -5,10 +5,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-commands-migration.h"
-#include "hw/boards.h"
-#include "system/system.h"
+#include "system/xen.h"
+#include "hw/hw.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/arch_hvm.h"
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index d3df488c483..67b7c223aee 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -14,6 +14,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "trace.h"
 
+#include "hw/hw.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/i386/apic-msidef.h"
@@ -24,6 +25,10 @@
 #include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 #include "exec/target_page.h"
+#include "target/i386/cpu.h"
+#include "system/runstate.h"
+#include "system/xen-mapcache.h"
+#include "system/xen.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 7ffbbfea23b..3828105c95e 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,14 +1,20 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "exec/target_long.h"
 #include "exec/target_page.h"
 #include "trace.h"
 
+#include "hw/hw.h"
 #include "hw/pci/pci_host.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
+#include "system/runstate.h"
+#include "system/system.h"
+#include "system/xen.h"
+#include "system/xen-mapcache.h"
 
 MemoryRegion xen_memory, xen_grants;
 
-- 
2.47.1

