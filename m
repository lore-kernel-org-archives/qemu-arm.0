Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083106ejc;
        Tue, 14 Nov 2023 06:39:35 -0800 (PST)
X-Received: by 2002:a17:906:40c5:b0:9e2:d087:86de with SMTP id a5-20020a17090640c500b009e2d08786demr6335011ejk.42.1699972774994;
        Tue, 14 Nov 2023 06:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972774; cv=none;
        d=google.com; s=arc-20160816;
        b=DzOuAUOX9+pP6XyqbE7xE3eMOBdA0J4QpObuhNFP+DHyyhFSBL/CGmmhuemRws2wSZ
         UHjGxUdhta0HTrt4zDDobKthGoBRfyX9cQ1hXXZHZjyHdrvizNZQwM7LstJ+lXBU4kfT
         1nC9c6rr6tthvO7UpY+exfndjtwxsQwHaj4p3FSWfQq/KM1QsZ4btDf5cp2bgNh4HiP2
         dIBb6eei1/U539uIVpvC4Y6DfhuS0g/iY/VVFnKWSV82mY6oTRKECUgETVWe3ccdagJ+
         qTcCxumhSHHuJifZ32dlOahjYlD2xfAAsIrL86LZuQ6+B4t+RXr9pV5SZW8uJmIN19a/
         FUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6XE67RaqwP19rEjPR9cmWaIkbDnma1jGWKj3qDcuG2M=;
        fh=8PS3Hy0DxHmOgUJ3YqzgHibVab/EASfDmwtZOBvIi2A=;
        b=AjZz0ha4+LFqGOYn3uUf96i1RdqpttfSwZeqZvkaSQ19RUXvKRuB0hRsIWKUYgO10v
         wAmtDCGkvBdtbCRN/9P00+kY+eSWaovjVq73S0+s/NSEPjy554y2bbsbCaw+4hipsQqT
         BqtRJP7WzwZBmLpDgHeqZLPhVAD4fDq7NhPU/w6pMQh7SGUHOmhl//Y1ZW1bfAg+zVGR
         pG0phILXYt0rwSeBmPTzLLA2GPl7Sit0VSi+do/DxSAaPR2qyoenCTTovkaLtE8e+Inz
         6moj3XfTiTvenLtUd2KPGgk98zOioWF4MHBIJm3+ZNqKf3PQh7T9kgbh05uQfad5JoaF
         mkjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T3C2HHCH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 21-20020a170906101500b009b927358aabsor1955392ejm.3.2023.11.14.06.39.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T3C2HHCH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972774; x=1700577574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XE67RaqwP19rEjPR9cmWaIkbDnma1jGWKj3qDcuG2M=;
        b=T3C2HHCH/VDNX4tkR0s8qJKE6HapkhXwgAO/DQSRD3k0+WAws1LFy0odB94oFC8n3V
         RXsybWkHT85c6iUCJmqiAF7nXghTOPLGos22GU4FFSLkPMs6VrBcsYgredviRjNlvSVJ
         y43gx6s04gGPHxiD77etS7OMJbCO8kpE8+laAnciP3OrdPzlh5vAxS13VxOdRZf1ONZt
         fsPETcDdoWuZZF7Fbyd/2+m4jLFuZQekeXZkh2ZO8GHtr9A6RvUOYnuQRkdugdGf9q/+
         2BTIbwvknKIWPnSr7GYbfsfwwEErIAQCHzZlT6rofR+gu91oMjjRMYRx3HJRXuT59E/V
         jUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972774; x=1700577574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XE67RaqwP19rEjPR9cmWaIkbDnma1jGWKj3qDcuG2M=;
        b=PqKqKJKzfC0yilYbisd79+H0MxHrWkjG6inCYQKKtn+3TiJR2O3bCOpm8iJ7SsjKX0
         hcm92n6pDgetCe4zWtsaxjMZ6hp/jwBeQZ7iMvgWMaKm4JEbtA9K6SRIuo5cphkFHkWq
         aVTVNQAxBbCrf0TxarKK9tpzaKiiqzFm6TP7x2+NGFCnstKoLDO7BmWCcyZy/SwFfZVS
         uqy0iqY28tC2y94sY/Yt3EsQJYlzhwDvjkMPZa7i1BkGnmwNQKn/z0tDRf1UayLG6gsE
         OBZLVTPqEX9Qm5loUVuI2drMy66SgEqo3C7k8AXMctdU+A2QKKPxX5oke5SEGNI/QBMj
         svGA==
X-Gm-Message-State: AOJu0Ywnm5JEJkM1jbLLAXE6mTxf78tYakfvFXUPx+fkJkBx+IShArRz
	yJOXagM9Jh1VbszVP21Jqu2HPm1R
X-Google-Smtp-Source: AGHT+IH5uADtxqVb0gu9wkOPtm794L9VQ3NjNtPGCuhDFtQMH4f3XXf2p8ohPfBbgEKWHzCsn1iRrg==
X-Received: by 2002:a17:906:899:b0:9df:e457:cef6 with SMTP id n25-20020a170906089900b009dfe457cef6mr5737290eje.77.1699972774671;
        Tue, 14 Nov 2023 06:39:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b0098e34446464sm5684531ejb.25.2023.11.14.06.39.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:34 -0800 (PST)
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
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 v2 11/19] hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
Date: Tue, 14 Nov 2023 15:38:07 +0100
Message-ID: <20231114143816.71079-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: H6wPyXhaXLdV

Use a common 'xen_arch_' prefix for architecture-specific functions.
Rename xen_arch_set_memory() and xen_arch_handle_ioreq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 8a185da193..bf19407879 100644
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
index 1ae943370b..5150984e46 100644
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
index cf4053c9f2..cf6ed11f70 100644
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
