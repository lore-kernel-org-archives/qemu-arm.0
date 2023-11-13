Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408646ejc;
        Mon, 13 Nov 2023 07:22:20 -0800 (PST)
X-Received: by 2002:a17:906:7149:b0:9da:f391:409a with SMTP id z9-20020a170906714900b009daf391409amr5683277ejj.26.1699888940467;
        Mon, 13 Nov 2023 07:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888940; cv=none;
        d=google.com; s=arc-20160816;
        b=Avn0zb0kZ5sgVsm6aedrYbh05aJcbzilyK1ItwsISeXO+awlxeY+IpxnFJnLd3tVVL
         qkDA7uCYmjcxJnzaupu8R3MaIq0lXzI7shNgyPVgsXIurGX6ebFEGIgMVVVmaRGmQDsU
         +zD4qib9kxq2J/xwi+zrHnYpOHo8FmQ7HjgnqabtiQR2iYQoDL3PnajJGB1uME+96NCM
         Vypakz82EAHiKi4uTgDV06UYvBfVQVJvrmaBf2TWlqAjk1M4Z6vDJ9lF1uiFCIyRaxxP
         q0NJfxNe7VgSmFMbhYTYkMp1TCcjIOouKc1hiGNZLB2g6YWhumqFDVzq9ksBLoMkjjeS
         YzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z2PpOM4WQ+uf4xck1acJwuABeC89nz7da2f3K2pGLBg=;
        fh=5R7Ays+lXy3R6eYmiUDvJwvlg9KwyY0eR9TFqtpjY3w=;
        b=af7jfNOuFEkGG7BRCZdYcfc2oOPegv2XC0SPXtOQjxqqVf8ug1ZWdgdAIaOBCqQVga
         JntGqMSIIhMRYYH/zupfUFOVojhZtnlto9xAxLB+KbPab4pw9BZO1Nsmtx60JvVcwFRm
         eugdBrB3byr5diXvJRA8se6X9M/sMkOovnqAGtky6BopwPpJFCRqy/trywrjH2V8McVU
         g1/xce4OXVNZYZykPgn/L1ur692T/9A8V23og8lLI/8utF+BgB7vNCjjFhSMGSmJNIsd
         djTO1yFftb40kKimrUUVQElaylmBWYk6tEvEgH/fnQSphZKOc0EuqCm6kIHwx4mJynVL
         NI5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqkhysCC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x8-20020a170906440800b009d877d4c303sor1194959ejo.9.2023.11.13.07.22.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:22:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqkhysCC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888940; x=1700493740; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2PpOM4WQ+uf4xck1acJwuABeC89nz7da2f3K2pGLBg=;
        b=kqkhysCCDGYbSXSbvtOqWkm5/B2jmjoLNKZZv/UlQob6HW3x5ATwd/Cc9ZpN0yowH/
         HheYxx9UdR02NZoeUSNUWxCZ1fLNkCQUte98U6m8VQu+MeikNlkMInpmxV445ry5pahI
         INhRzsHKijMp3cNw+ksR5AAGnL3ei37kC+X6op5OsY+X0fGBRubioORpf+at/ijqLxf6
         uUl+d9F/qvTn5ZHytCoEgwjF7hV5JAoMA5ZnSIw2wikzCkFsYHrDvcQ8x7wuozw22CeP
         AB0CgEur0zOsG6QNFc+qVkSBA/MLcOLAx83kQjjj6oemNsqAjKZivuaH3L4KBG43JBY+
         bW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888940; x=1700493740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2PpOM4WQ+uf4xck1acJwuABeC89nz7da2f3K2pGLBg=;
        b=aewBU56Tn30VlRYOf2AKeo40CW9sMbfe8uMHqyyooT1eI9KTBQM6RMISIH8oMjSIlL
         d5aEfoIFJSub0L35cpV6w05RJMnqE7ATbQaf+6eVrtkBzdnR7mYChFHc1WwbVDws2XnV
         /Mud7FkuqTcEDIzoo7dGoFOX1KPb7vfBT/00ivAg5oSUMUBwLsa5qfUMctCTMjrPExun
         M6NIR/qsFD3LrPcnzwI46nNhghyVZX2xFzz2wCXyXhCmZ8k5FK7iKCf/VSs0ShO3PYFa
         WH1/MUfVfFeNJ3rbcSVn30qE1zVQsY1gNZkvPqkSQn63lbF5pZm+ut8L60KLxiVmMJCY
         EGPA==
X-Gm-Message-State: AOJu0YxQByAU/Tx7tXFl9hytbg2lBu/Y4K9tCjXNMw4huP71IJstRwrf
	yiiZ6lgnuddr3ALvZzOte3s2Rq7x
X-Google-Smtp-Source: AGHT+IFN0oQYvnRoNATsOZJ25LMlTXynSPofCu2en/Z0LYSJQyfcBbtJzfmWQwHuJeMUC7biyDShHw==
X-Received: by 2002:a17:906:f2c3:b0:9bd:a738:2bfe with SMTP id gz3-20020a170906f2c300b009bda7382bfemr5045867ejb.38.1699888940071;
        Mon, 13 Nov 2023 07:22:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id lw27-20020a170906bcdb00b009de11bcbbcasm4238875ejb.175.2023.11.13.07.22.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:22:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-9.0 10/10] hw/xen: Have most of Xen files become target-agnostic
Date: Mon, 13 Nov 2023 16:21:13 +0100
Message-ID: <20231113152114.47916-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 01eMjyI5DYy1

Previous commits re-organized the target-specific bits
from Xen files. We can now build the common files once
instead of per-target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/xen/meson.build          |  2 +-
 hw/block/dataplane/meson.build |  2 +-
 hw/xen/meson.build             | 13 ++++---------
 3 files changed, 6 insertions(+), 11 deletions(-)

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
index d887fa9ba4..29adfadd1c 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -9,15 +9,12 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
 
 system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
+  'xen-hvm-common.c',
+  'xen-mapcache.c',
 ))
 
-xen_specific_ss = ss.source_set()
-xen_specific_ss.add(files(
-  'xen-mapcache.c',
-  'xen-hvm-common.c',
-))
 if have_xen_pci_passthrough
-  xen_specific_ss.add(files(
+  system_ss.add(files(
     'xen-host-pci-device.c',
     'xen_pt.c',
     'xen_pt_config_init.c',
@@ -26,7 +23,5 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add(files('xen_pt_stub.c'))
+  system_ss.add(files('xen_pt_stub.c'))
 endif
-
-specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.41.0
