Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161345ejc;
        Tue, 14 Nov 2023 08:31:52 -0800 (PST)
X-Received: by 2002:a05:6402:40cb:b0:53f:bb1e:ce39 with SMTP id z11-20020a05640240cb00b0053fbb1ece39mr9492889edb.34.1699979512334;
        Tue, 14 Nov 2023 08:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979512; cv=none;
        d=google.com; s=arc-20160816;
        b=DQbO+QprsepxtbShmbRnZ5SX4AuDHFtxxITt3GQbNmtsACMD5mo0GtL3asAar2Z4Ru
         HASuiTpORujjY3cA7VKC5THhOyndHn1LgtSgR8SHN+eLnl7Fy5aXdVpXnxwrKfUwt/on
         fLVmwEsna2ASvmjNQ92RKIAZI7UK8RhoICQgnaAR3dLZGlW28y/jfjUcEvoS0UEJQsZC
         dzK1xD1AS25QP1Wtx4RI4D8Ld3aZEY08Xuox+NzusO2ug9FUzpQhzSyJCzcZmRBqztLZ
         PkaDhABS05paCQNWisauWV8o/gU1kI8rjVpPJ8neHopB6V971+PPdIT+hsdFkOGSaGbz
         dkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hRnzgqjbzRTGqJ5jrYQJxW1BmP5r27YtuyDu1IVzHFA=;
        fh=5lvcVWWZfEaW1el3BGyMdrws/7nl4pTH0ES2/FGtlZo=;
        b=V4bkclUJCBopj1xfMAxqKj/dYIawLsFyg0KY7IfiYjaQVTIdIy1yhGC6paYOqnWuL2
         plTO2Ag5+zSr4xwB0kQsTTfHuh9/4RLBDYgb6DjL1ZyUUGdt4tmaBBgAnCa1FwslL7Ab
         4UqECptwhDSZ31MKBOvnvvenDB6HvHHcftphXvjIrC9V3f4yVcX/ZOaeluNXlso/zmJM
         AEkW9aKlVgbAHnzxmtRKUNkeb9Yjuxq/mOt1Snk9NfdHCt5vNfQxDANadSPrUg07MNKj
         5Se8wmv+atnwQ4u5iFBdiZK0IbvfDuHtYrVZdN8hSDuXVE+ivptC35m/PJ8qe+6nFG7K
         e7iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k22ri0nz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o2-20020a056402444200b005479fc80a5bsor412666edb.0.2023.11.14.08.31.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:31:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k22ri0nz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979512; x=1700584312; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRnzgqjbzRTGqJ5jrYQJxW1BmP5r27YtuyDu1IVzHFA=;
        b=k22ri0nzOYRFd+0/Vs7LigQettvlfWz4k8w0qBNG9k3dzu+0bbTuavkdr5g1o3dxOk
         cvf2EFa26d6ukyHcrpDKiWRL0s7dQ/5yhr4bYPaxWs9R/Sp6UWAyk+pzOJ18jtUEPhhO
         4Xs7gkZ8utKlMoPpyP5Cv4Kz4lVfishmXPzOQRmDpGZ/Nk0mOiSrbyy0Y4stmKWurW4L
         AT+hEhUMtkMfjJR44cSrhryUWCVkqTNBb9SvUbdDCRQm5adqJ2tbnwOj9echk37P1oCj
         dLMP0rj3+c74XQl0E3xvCgNop1LY70Ggc6WlDPGyC9oK6M5/R5I+tONS8ivKLLCYwvKj
         busw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979512; x=1700584312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRnzgqjbzRTGqJ5jrYQJxW1BmP5r27YtuyDu1IVzHFA=;
        b=chQw7A6e6PYJAl+u6ZLURvYOjrrv0DRqscDq87cXhAR+oVwMQGq1U9pQyIUDGdstZs
         D6cvZwjxwmj/gEHsf/JzL+VZzi+wutiibizBJ1EGYK6xAR/SZi8QxdPAr6PIo3+/k70A
         c1dDyZt2BoUXiqf+ERSXCkj7XkmnwBnPgo5qmyj2o6OK70qzwB8wwXNWess31ZGwrltB
         ZT9T5USMg9yoyxf4kE+tgIzWKpkZTeqcSa4lMdDbgcVngV9C4Fm9BPqlxUBet14wp0xm
         RZUgUH/Psk669AhPBXQK9aioAqHvehECNyxNwFxfzp9FW1SwU6+cEz8s6VXe/UiWvchq
         NbfQ==
X-Gm-Message-State: AOJu0YyhDLP/P1QcU46rVtmhnTuG3FvehYDD29AkZ19fUKWX4nvmDsub
	MtJ/T8DCAfypHLtJm8dP2UqjJYfn
X-Google-Smtp-Source: AGHT+IE8/KnAMA1FjOTiA03DDYyTyNl6glp0CwMJ10smYv5ORjVAvozuUmjkzAh9auk1H2jVfOhg2Q==
X-Received: by 2002:a05:6402:3cf:b0:543:70c2:aa8d with SMTP id t15-20020a05640203cf00b0054370c2aa8dmr7379909edw.15.1699979511911;
        Tue, 14 Nov 2023 08:31:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id d17-20020aa7c1d1000000b0052febc781bfsm5327156edp.36.2023.11.14.08.31.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:31:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 4/9] hw/xen/hvm: Expose xen_memory_listener declaration
Date: Tue, 14 Nov 2023 17:31:18 +0100
Message-ID: <20231114163123.74888-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZYw66wlX+BjF

There can only be a single xen_memory_listener definition
in a qemu-system binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 1 +
 hw/arm/xen_arm.c                | 2 +-
 hw/i386/xen/xen-hvm.c           | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 83ed16f425..0fed15ed04 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -18,6 +18,7 @@
 extern MemoryRegion xen_memory;
 extern MemoryListener xen_io_listener;
 extern DeviceListener xen_device_listener;
+extern const MemoryListener xen_memory_listener;
 
 //#define DEBUG_XEN_HVM
 
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index b478d74ea0..39dcd74d07 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -38,7 +38,7 @@
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
 
-static const MemoryListener xen_memory_listener = {
+const MemoryListener xen_memory_listener = {
     .region_add = xen_region_add,
     .region_del = xen_region_del,
     .log_start = NULL,
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index b64204ea94..a65a96f0de 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -469,7 +469,7 @@ static void xen_log_global_stop(MemoryListener *listener)
     xen_in_migration = false;
 }
 
-static const MemoryListener xen_memory_listener = {
+const MemoryListener xen_memory_listener = {
     .name = "xen-memory",
     .region_add = xen_region_add,
     .region_del = xen_region_del,
-- 
2.41.0
