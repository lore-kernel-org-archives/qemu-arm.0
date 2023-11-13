Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408115ejc;
        Mon, 13 Nov 2023 07:21:30 -0800 (PST)
X-Received: by 2002:a17:907:20e5:b0:9e6:3570:bc0d with SMTP id rh5-20020a17090720e500b009e63570bc0dmr5133475ejb.59.1699888890444;
        Mon, 13 Nov 2023 07:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888890; cv=none;
        d=google.com; s=arc-20160816;
        b=fVnUYOB4kH3TE6g2njt90SmlqCZdrOIPqSPHsyaftV5WQanR8afDq3dm9QQ0gWClre
         MvhidMV1krkRSVg/HofTYMkqbHsIxWGmwZTmenOPi8TS9lhxYvKcAs9RW31Rs61QcH5g
         s/7FrOdvCy6C8p9ssb8WtyMwdQ3nSVvnsfoVjHMGnhv19AgOUuR9sAZl8O482WvKOpZ/
         mlvfRTp3bjNwnmB5DWU2L52g4mttSFXrvPgu3BUcgsNoPQ9aYGEY+dPKipXJgjRdSsSs
         fkGayPaHIALisbQsdGBT+6CnjCXLT4FfuyA8YS/5Awf7ZcYfSDmrASrFPGXIfkFMvxLH
         hCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R3bxfGqI5yyGuHTvJ252KdxHxDRKsvIzu9uNKMF+2iI=;
        fh=l0GfR1YsFBV1p/d6Yn0Cy9b7NFKbeuH6aWfu2sQY5rM=;
        b=UQ20opNlaH9qGUiVPV8O5QRnU6qCXQCpsu5i3Yztk9Y4/UfPzZvj8T1sYvCeBvg7Bb
         sHs88q5u5ot9yJxc6R0IeiFp0eoSj+hSnNOv5jfuGBVJGMuMJkf5FvM6XmY5IaYZXUXI
         MygRRcNvNmSGazSaA8lP8MHLlu82m14kO06U4+ZqbXoipk6I/NU7oUfLcqlW3O0h+lRl
         0jKzxnrFZdqKWUzc8hbqpiuvlgOEgk1s3cI3c/RQqdZfsTdkdGpW6bgQ9yVQXN+fM2NM
         f4sGoGzXigsUYFhlhvd0hjyLjjvRki3AeyYg3F7KN4yZFjMoPS+sO6J3DbMMNl7MkHZa
         Eb2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCpuYAYd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dc9-20020a170906c7c900b009ba0a38f2b1sor1212175ejb.20.2023.11.13.07.21.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCpuYAYd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888890; x=1700493690; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3bxfGqI5yyGuHTvJ252KdxHxDRKsvIzu9uNKMF+2iI=;
        b=jCpuYAYdGmAvyKqQPqTq8aVHBkIYz/5Tpimdsnjau/uhPbRKpbiDKIVZr7toBKPgyw
         k5dAli7CE2rG8WTxOQtBvOrNCQ5s/8cSQ91UU6r01eygIaPYxgxlVbwEB37BS/ps8f1k
         1TS8EB76mk6f7iV8R3g/ndckjOP78/jM3FF1gDnV7LmDWa3VrhTyg2adgo27KvcpsIPI
         X6H/7zb7ch+aBJq+w2UAajmpznJf2Wyzj6+IVXKy/tcLhEsd9vmQ4S1lgBF5jTr0ass1
         jLHkNPLdn8cEWmSYtAf6fkNKascr+eEUKo9Ysd2bhnYbRAHAgm6Zdlu++FAQFjpq2IUa
         0yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888890; x=1700493690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3bxfGqI5yyGuHTvJ252KdxHxDRKsvIzu9uNKMF+2iI=;
        b=leiXvfnwRWYd7p4Esxrps7DorkgQCTrCUgPfWc1rMOcNlntVUhRNFvEJQG3Tk3fAPb
         xdGnAGz5aWdRf96uRfdiz3hdRaJTIJl4Hhtr/BOQPPURPreFcaWYVg9dGCbSvP5plVdf
         vUX81SyfDE7N1luRqVNF9O3TGio5GPXctjf3GSoltAXIcPhzZua2jxe9IXDRjcsUMhw3
         fUc4DCls8E6dK/USequ386BJ2wxJ5Cop/Za/AGt6XF72jMD+cgBSy6cTTYSNxFPOYKKX
         kiNZyvzxc7FdR1CDnU8HXNmRfiTeEjXBL2Ypff400Au/M+UdtY4+/aws4cB1nASy03OL
         fKiA==
X-Gm-Message-State: AOJu0YwjR+MZvmSmkEnq6Q0dgo/cKGDoH3QzdOZa5blYAMJKImud+r7N
	j/JomWOwPG5oe9sPMdibo5cuiVxw
X-Google-Smtp-Source: AGHT+IF709HFmNxhzIc8XnNuz+a2oAKUrEHD5dHSaR8itUuUqXulXss7tknv1cuy4PMkZKxP4RsDmw==
X-Received: by 2002:a17:906:3049:b0:9bd:f155:eb54 with SMTP id d9-20020a170906304900b009bdf155eb54mr4125199ejd.6.1699888890200;
        Mon, 13 Nov 2023 07:21:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090611d700b009829d2e892csm4243243eja.15.2023.11.13.07.21.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:29 -0800 (PST)
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
Subject: [PATCH-for-9.0 02/10] hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
Date: Mon, 13 Nov 2023 16:21:05 +0100
Message-ID: <20231113152114.47916-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pFuZiG3elVgs

Use a common 'xen_arch_' prefix for architecture-specific functions.
Rename xen_arch_set_memory() and xen_arch_handle_ioreq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xen_arch_hvm.h  | 4 ++--
 include/hw/i386/xen_arch_hvm.h | 4 ++--
 hw/arm/xen_arm.c               | 4 ++--
 hw/i386/xen/xen-hvm.c          | 6 +++---
 hw/xen/xen-hvm-common.c        | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
index 8fd645e723..6a974f2020 100644
--- a/include/hw/arm/xen_arch_hvm.h
+++ b/include/hw/arm/xen_arch_hvm.h
@@ -2,8 +2,8 @@
 #define HW_XEN_ARCH_ARM_HVM_H
 
 #include <xen/hvm/ioreq.h>
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void arch_xen_set_memory(XenIOState *state,
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
                          bool add);
 #endif
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
index 1000f8f543..2822304955 100644
--- a/include/hw/i386/xen_arch_hvm.h
+++ b/include/hw/i386/xen_arch_hvm.h
@@ -4,8 +4,8 @@
 #include <xen/hvm/ioreq.h>
 #include "hw/xen/xen-hvm-common.h"
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void arch_xen_set_memory(XenIOState *state,
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
                          bool add);
 #endif
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index a5631529d0..28d790f4ce 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -129,14 +129,14 @@ static void xen_init_ram(MachineState *machine)
     }
 }
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
 
     return;
 }
 
-void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
                          bool add)
 {
 }
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f42621e674..ffa95e3c3d 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -659,8 +659,8 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
     }
 }
 
-void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
-                                bool add)
+void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
+                         bool add)
 {
     hwaddr start_addr = section->offset_within_address_space;
     ram_addr_t size = int128_get64(section->size);
@@ -700,7 +700,7 @@ void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
     }
 }
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     switch (req->type) {
     case IOREQ_TYPE_VMWARE_PORT:
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 565dc39c8f..1d8bd9aea7 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -65,7 +65,7 @@ static void xen_set_memory(struct MemoryListener *listener,
         }
     }
 
-    arch_xen_set_memory(state, section, add);
+    xen_arch_set_memory(state, section, add);
 }
 
 void xen_region_add(MemoryListener *listener,
@@ -452,7 +452,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
             cpu_ioreq_config(state, req);
             break;
         default:
-            arch_handle_ioreq(state, req);
+            xen_arch_handle_ioreq(state, req);
     }
     if (req->dir == IOREQ_READ) {
         trace_handle_ioreq_read(req, req->type, req->df, req->data_is_ptr,
-- 
2.41.0
