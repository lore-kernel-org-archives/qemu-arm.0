Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083659ejc;
        Tue, 14 Nov 2023 06:40:29 -0800 (PST)
X-Received: by 2002:a17:906:28db:b0:9dd:add6:4c12 with SMTP id p27-20020a17090628db00b009ddadd64c12mr5948205ejd.77.1699972829287;
        Tue, 14 Nov 2023 06:40:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972829; cv=none;
        d=google.com; s=arc-20160816;
        b=NxP9vXJhfUBHOc8Q+0ZLE9jFewfD2r3bmXPrZg7pFPm7uhqEbHaGfYG2QEkVg/lCDm
         1P4IkfYsJPHjcuV0de5bkwQaXNI/MA+5RWo/S1ePce6WpAofjxo59fASIUuZ9d84PrSM
         tjKvMr1NPG5Vq+iSSETCaQmsOMB8N3pXKlHKIZTS6xT++Z6ZwMU7uQ0pFf2y/7vob3Uw
         nDknBNc6oLLGRvR+kdzjIixVFsLD35hZTLXsfF3BRHb/a17lEDIVhdNt4vgjBwoI2lon
         A4EsRy4nO4CM+5kzdbxsA37HDS78vuPCS+VZnSTB7aE5JqeGKU4lIpUfPWdya4dTbGHO
         FACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=85224ACu16xcahxMJd73na2pr08geUP2BaqK8DQk41g=;
        fh=DQdBwVL0njkjrcmiitPQkWwX/pS9hKiR9dqdA4zWvmw=;
        b=C9EeHTGNjudj/syWexPK06qynkOc8/kUEs4amPmknrQhTaTJvPWokFsH5O5AeQ4L+L
         xR20SrKjHqshiKkM9VwTZ/aApjUAHjAW+F4Hj5Cz6RSvbhvAWQLjyOeh3lBdRTaFtNwg
         DN1qNf8vCeJM3EOUZUwCxV0xHguwFLpWrFvk5/SmHsIm2oOc2Tf4rWmSMRr8gGeJjH0h
         QypuQYuwp9//CJC342Uulaxr2aNGlq55aaJfFUynZMas5hGhREyFV7U3VYA+e7890Uwj
         oy6xJP3BeoN1/hYiBNCH5oV2mT2ly4HjzgaPz2xE7cMEJLHmooLd4dkZ1Eh2QYDdhWX3
         EG7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loucTBTe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n13-20020a17090673cd00b009de467a25d9sor1926937ejl.6.2023.11.14.06.40.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:40:29 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loucTBTe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972829; x=1700577629; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85224ACu16xcahxMJd73na2pr08geUP2BaqK8DQk41g=;
        b=loucTBTeJJC0TqBuDIcuM/kaSPuM26x+y3fWFKSMcw9JBF9awGB6y82Pygf+L8O0Cu
         g5kG1dglcgedkshs0SOQU0YkRcd/0cE/SfYBjzrhTQbTJFnxKjyaf2ry4Q3XMbvevRJV
         clQytFGtpRBHPPkywq2zWq+Dsb2TLBKfn5l07SoQVe4qt+E9wPaUCH7VO76rFsczJU/n
         i+5Ae0p/jNsiKlrADKmb2bAbfacXvExma9wd/FvgFELxVHtMdeP8j83eikzk9y/Jrrsj
         w4GYrkJmZ84ll6s30V4dZysn1ZOAoQIN9zx9X9bNQWiph8p5nBicmEQwai5WRByH9oQP
         dQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972829; x=1700577629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85224ACu16xcahxMJd73na2pr08geUP2BaqK8DQk41g=;
        b=XWXHr+TI3RjOOCyGVBMCiiAWRz63R7bisGXq/4i7k1UyT6ZRUkMTSACxXRzQ7afYu/
         jt7QM8NYKfUlKY6fxAUw33Hvou7VgJgLX6W6gG/bxCHN+OarxNokneYK5m0SQrqk7nsU
         ei11kVN2AaTnGD/b2ckDtfircj5yP3s7XcDuZeLRZP74+jMMj+P9c0T0EUDEHMXPrwhK
         xv34MDg7UuBcJTJlIgxhzFfAsEybAhUDO143bgmOibK3DssNDGXS7LUiur3MosFqBuXX
         BbftgKZ3Rt+m+NBoAJKg/8o+TguBg9ERKTElvYigmtf8SS7dWHAWQF+/Y7UkcnsIS2u4
         oVUw==
X-Gm-Message-State: AOJu0YzK1xIdbMf2dHlAq7rk210CyW/TrnrqsqIO5Tdp0M6SKu+JgWY4
	lE9pCoMycs/ynuwgPk5SF7XcSfnq
X-Google-Smtp-Source: AGHT+IE4fe4f8bleIo+ydEdJnHpXElyEFzfSvfuN7IjKmK4sPC2Xb+6oIBNsyuQ4jtW9IDSYhgY52Q==
X-Received: by 2002:a17:907:969f:b0:9eb:af0e:39da with SMTP id hd31-20020a170907969f00b009ebaf0e39damr3096379ejc.46.1699972828864;
        Tue, 14 Nov 2023 06:40:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id t25-20020a1709066bd900b0099c53c4407dsm5561943ejs.78.2023.11.14.06.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:40:28 -0800 (PST)
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
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-9.0 v2 19/19] hw/xen: Have most of Xen files become target-agnostic
Date: Tue, 14 Nov 2023 15:38:15 +0100
Message-ID: <20231114143816.71079-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uTSQssnelsvi

Previous commits re-organized the target-specific bits
from Xen files. We can now build the common files once
instead of per-target.

Only 4 files call libxen API (thus its CPPFLAGS):
- xen-hvm-common.c,
- xen_pt.c, xen_pt_graphics.c, xen_pt_msi.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Reworked since v1 so dropping David's R-b tag.
---
 accel/xen/meson.build          |  2 +-
 hw/block/dataplane/meson.build |  2 +-
 hw/xen/meson.build             | 21 ++++++++++-----------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/accel/xen/meson.build b/accel/xen/meson.build
index 002bdb03c6..455ad5d6be 100644
--- a/accel/xen/meson.build
+++ b/accel/xen/meson.build
@@ -1 +1 @@
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
+system_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
index 025b3b061b..4d8bcb0bb9 100644
--- a/hw/block/dataplane/meson.build
+++ b/hw/block/dataplane/meson.build
@@ -1,2 +1,2 @@
 system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
+system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index d887fa9ba4..403cab49cf 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -7,26 +7,25 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen_pvdev.c',
 ))
 
-system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+system_ss.add(when: ['CONFIG_XEN'], if_true: files(
   'xen-operations.c',
-))
-
-xen_specific_ss = ss.source_set()
-xen_specific_ss.add(files(
   'xen-mapcache.c',
+))
+system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-hvm-common.c',
 ))
+
 if have_xen_pci_passthrough
-  xen_specific_ss.add(files(
+  system_ss.add(when: ['CONFIG_XEN'], if_true: files(
     'xen-host-pci-device.c',
-    'xen_pt.c',
     'xen_pt_config_init.c',
-    'xen_pt_graphics.c',
     'xen_pt_load_rom.c',
+  ))
+  system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+    'xen_pt.c',
+    'xen_pt_graphics.c',
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add(files('xen_pt_stub.c'))
+  system_ss.add(when: ['CONFIG_XEN'], if_true: files('xen_pt_stub.c'))
 endif
-
-specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.41.0
