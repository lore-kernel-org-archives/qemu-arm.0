Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408371ejc;
        Mon, 13 Nov 2023 07:21:55 -0800 (PST)
X-Received: by 2002:a17:906:aed3:b0:9c3:7510:e522 with SMTP id me19-20020a170906aed300b009c37510e522mr5336154ejb.63.1699888915462;
        Mon, 13 Nov 2023 07:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888915; cv=none;
        d=google.com; s=arc-20160816;
        b=0WLozJ/SKh/CVKtFhrRFxYJeZ3DQkF07UCk0yR9LRW29+B+iHAKZ7y4PL+xuqC/dng
         URqRdTKstBYjGvJJtCPdRI0X1+GMvdIiLp9+k7twYev1/as1PXXPW41ghOpI/XQr5Gen
         O+8xVYMtYTk314Pws7F6GkorolQlxgCkXj/UtzDdHa89k4cl+zOAvpBX+Ob2zTqILNH6
         Q9qn65puUB9Jx0/QXzzkPXMtZp3/N8tURx2UiWAgBw/bJnM3Ex0nTIpcPKoKgkB3UiTR
         fLj930SOoeY0IoEB6L70aCmyc6wnelz5rBMnFxmLW1hf/141+P4CZaDheo09XDhpp0UC
         YpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iaPh59FgiGsmC+pCYaCOTA7yQ1Mp2MwkOCCJHlQNKqo=;
        fh=l0GfR1YsFBV1p/d6Yn0Cy9b7NFKbeuH6aWfu2sQY5rM=;
        b=0wpn9qDA3IgN2NoO1ac4mA+CwwOxrt8NCDfFrkTYBxcch8YS0j/dNoHxSQjLPxPH4Z
         +TMipcHCZupKy5j+qIwncyAejhRnPGTdbU34qbsDBgpD5GGrSPIUiqv6cMFLeXceVDG/
         4Z/ztJ8Po3xB95UEQv0zuUgz0+UUzKPIBQfm0BfoxfBHjoENoZev1ojNpgcpfQC8uKfx
         pRJ924AzMbv8AZruNqH/iLnNDNaohIdXejlRGmBuEq4/FJ1ldz50M4E/XxQIPa2JL5Yx
         V/2dXIAKKKGGzOuyx8xkTL8KBEvUwijvKLnOZKy5MIYRMfhkZzMR1LiO0LVgzjhLqUm6
         m1dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jt1LNISP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y20-20020a170906519400b009e3f98abdfdsor1199911ejk.4.2023.11.13.07.21.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jt1LNISP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888915; x=1700493715; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaPh59FgiGsmC+pCYaCOTA7yQ1Mp2MwkOCCJHlQNKqo=;
        b=jt1LNISP8Z0xqwpi3rhVQ8skd7mdFKdjobwb4IWizXzFQ4hvKwaY9SnC5RQR5hee9/
         Y0f3PYSGK/ZJMtw+gXMMfzN8UhHFuMabrzK72X3Fs0aKDd54MNmfWxH6wPS6zKVgDWQB
         BkZa+nxZgSE+Sd66esv5WvHh+opekn1j1SnD7XzjNM+H+a+o1fmySeL266z+Z6UjH0JB
         6NTczTQyEF+MCANa1y69s+m9QdR7QuW82l9bfqUMdIY/f5B4bDhO0wHXqYDd9dFOQqsk
         tAcgv9NYWfRZMhyLlWm7nTsjR0PEmKoKjQfv2x+F/AlE7ggWscKQ18DAipQl94ehhOt+
         iUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888915; x=1700493715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaPh59FgiGsmC+pCYaCOTA7yQ1Mp2MwkOCCJHlQNKqo=;
        b=JZJRdMbvt51JZbC7iAaWDzf7Lz9s9cLIXzJe0PX7GPotLFoTwCP9s8mNSBO+CgncZQ
         XaYEgb04bmEaRXZ3Qm1ADq48KKlvFDy0iPCvKCTns1bP/+1oUrnd80ge8tO5PkoPrEDm
         zXzsPRtd3UwhNJZKkof/wn+DQgTqs1KK1Cesw6cBHG0oAaxQv0IlBjNbE1gqh56nVevA
         5AkuVSZP3fup3ELCMTVq9Y3lOLGyWDVgwPtQBjgdMtIXf3FEnctoagzqnJoFefOxD9WJ
         J9f91TUznU6GtH5Yov/6PVcaUjwx7Ogtz8iMOQ1AKYbAXFpIaOjadu8l0f+oFcFXp4CK
         x2Yw==
X-Gm-Message-State: AOJu0YwyWJjkHHMCxoNsHf64Kv2wG6qIGh1BFjwcpYqO2Qe9rTpTq7/w
	xp9YOqHoh5A+hcR/8XHIDzSTykNN
X-Google-Smtp-Source: AGHT+IH3RjReylXfRQh/wsJfTu2jHnqkMqs+PQHcbPoh+QyiOeqF9Xb3+QdjFCNga0xDu80xIHTeww==
X-Received: by 2002:a17:906:fb8b:b0:9e6:59d5:8228 with SMTP id lr11-20020a170906fb8b00b009e659d58228mr4946396ejb.27.1699888915206;
        Mon, 13 Nov 2023 07:21:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id e22-20020a1709062c1600b009de11cc12d2sm4197707ejh.55.2023.11.13.07.21.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:54 -0800 (PST)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 06/10] hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
Date: Mon, 13 Nov 2023 16:21:09 +0100
Message-ID: <20231113152114.47916-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6Z9hO3RNbwog

We rarely need to include "cpu.h" in headers. Including it
'taint' headers to be target-specific. Here only the i386/arm
implementations requires "cpu.h", so include it there and
remove from the "hw/xen/xen-hvm-common.h" *common* header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 1 -
 hw/arm/xen_arm.c                | 1 +
 hw/i386/xen/xen-hvm.c           | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 734bfa3183..ca941fd3eb 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -4,7 +4,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
-#include "cpu.h"
 #include "hw/pci/pci.h"
 #include "hw/hw.h"
 #include "hw/xen/xen_native.h"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index c646fd70d0..2c97d6adc8 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
+#include "cpu.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index aff5c5b81d..369d738b50 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 
 #include "hw/xen/xen-hvm-common.h"
 #include <xen/hvm/e820.h>
+#include "cpu.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
-- 
2.41.0
