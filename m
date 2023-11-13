Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408297ejc;
        Mon, 13 Nov 2023 07:21:49 -0800 (PST)
X-Received: by 2002:ac2:4c38:0:b0:4f3:9136:9cd0 with SMTP id u24-20020ac24c38000000b004f391369cd0mr4422249lfq.44.1699888909226;
        Mon, 13 Nov 2023 07:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888909; cv=none;
        d=google.com; s=arc-20160816;
        b=iqWBv1fZk+vcWaRN/kFViWn5Ha1V6hUfJRFQx1B5/OTTQbwOnxTJ5INnFHKVGVIJEi
         FkU8ambR9X3pdAXywTdbLCg4/NCYuf0iNcmb/mKuHAV/xzhHt0TtbWtruDpE+djHKrq6
         P60v+8u4v7cxrDvk9FXZ4/E3ud1a1uDMeeetBU6NdwaHS9HQ1F0zCDe9j3y2WPGHzISy
         G/rtJDQkqUdxHEs8vkUI0pAButhFUntfX0nLmtPCIFikgPTu4FkCEY428yyaT4fSYYHB
         ewD0POmH+pDpClpVg9t+ck4Mo8ZdGq+01gjikUwRuFrx+GOXNetQeXBVTkaCT2QMhFVp
         9Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hC1GyuSTm1pIOLAiq1jl6VtM1wTJGGJIerTVB/FTO70=;
        fh=E0jvqUTVnbyPitMGLtsCjS/srUbMS2WTNKk9XEDC2rY=;
        b=DvAX/XGFfTCEM7sKRusOB0RdfakuTdHjb5yoIi8h3z1rlDO0p8ikRooO7oJQKCDK48
         0a/be56wdLOh0qNnsXSKcvfuSB4f2bPsNYD2YdGdbXiWwZQ0MN1xPM5+k3FLpjkBSKq6
         HjUz38feJRnyXKEmGnHCv6txAqPfQnea+2S0r4w4ke5K4ylaKq9x0TYfCZa/pNWupXrU
         jjYj9oe5dtm/HHXzcpBEc2I5Wj8OdUy0oXbzDlrfaOdiLrrh5VKAR84rb1iu+0oRsJ2F
         TOJx0sSlQ4Fv/9cfzhiZ5fmAIPmn/0+zeHxtzhlQPMtf/SdD88KsriuSANtMX6WXUxXF
         3P3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4pXaqTG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ek27-20020a056402371b00b005470939b685sor1030053edb.7.2023.11.13.07.21.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4pXaqTG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888909; x=1700493709; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC1GyuSTm1pIOLAiq1jl6VtM1wTJGGJIerTVB/FTO70=;
        b=r4pXaqTGz4tf0T1LwIrOipV0zMmA9J3ulAEJ3LQQF9/+NgWhal1mZb3hgRBHoH/1A2
         xrnk5PkC/23j8G3IktqruWne/AXpr1zPZU+raVSSIaJNNTtsnIeZcyBknrri5RdV1Uws
         MMIDkRL1KIkqNl47sIIVx+W5VIBxX+jmy4b6AWDtVyj3P8J2fgMJGzEaW3VzJSP3/a10
         szfsIHpn5f3BDOO9E/ery6akShKkC7y82dvWqQOKTCufOtsEwPT0RtBziTQTb1OjzMD7
         Q65rHtlDjvKD+UOumr8bir2yW3pi5xQK5jh4458lI2JmYIYGxv4HFQjkCmEhAIittkIt
         s7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888909; x=1700493709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC1GyuSTm1pIOLAiq1jl6VtM1wTJGGJIerTVB/FTO70=;
        b=q3oyazX3/i/Y3VZ8WYcdZVAzX/k362lPttN4+XsiuVHeY+9TeACNgkAGG36ICSvHob
         EazSkLYoEbixtkU/t0TeDscG1vNG5EnSz83rzbjl7G/hg2yyw8X3GOu6WN1OmW6DYko/
         6/wrpYkU1zvOrMFdsPBBwfRGKS3NRSSZfq56e9N2XyPZjhrQEEn+9CgCX/oCYcoa3VCK
         VPLaDlb59pk/4Vg2PuGC4tCjBe6etIrP6TorbC4poOL4P5hZL7JcBiP3ntRD217TQ4os
         vEO0QM249fo5s1Zi0wGbj4InznLDO6EhuaLhVvhhSJ2XyAHVwb6qSnALlGhH9dfDLOPk
         3GoA==
X-Gm-Message-State: AOJu0YyNH9XgMF3WpldWW6BNwGr/za5pYi90FNfc/j5rGTSwGe3ICDZC
	SwCEx4Z5+Cnefx8Ute0l1lcO5G9R
X-Google-Smtp-Source: AGHT+IGbtAixMPiQVaiouSIFTb1IQKmmFA1AcOCrzXhQQ2Afk2FYf+XnPnB9Zgf0YAtZ7aK4/lySbw==
X-Received: by 2002:a50:ab12:0:b0:540:2ece:79 with SMTP id s18-20020a50ab12000000b005402ece0079mr5690457edc.10.1699888908890;
        Mon, 13 Nov 2023 07:21:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id f19-20020a50a6d3000000b0054026e95beesm3942482edc.76.2023.11.13.07.21.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:48 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 05/10] hw/xen: Use target-agnostic qemu_target_page_bits()
Date: Mon, 13 Nov 2023 16:21:08 +0100
Message-ID: <20231113152114.47916-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B/6a9lZQ8zG3

Instead of the target-specific TARGET_PAGE_BITS definition,
use qemu_target_page_bits() which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 03f9417e7e..35b3b5407d 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "exec/target_page.h"
 #include "trace.h"
 
 #include "hw/pci/pci_host.h"
@@ -13,6 +14,7 @@ MemoryRegion ram_memory;
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
     unsigned long nr_pfn;
     xen_pfn_t *pfn_list;
     int i;
@@ -31,11 +33,11 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
 
     trace_xen_ram_alloc(ram_addr, size);
 
-    nr_pfn = size >> TARGET_PAGE_BITS;
+    nr_pfn = size >> target_page_bits;
     pfn_list = g_new(xen_pfn_t, nr_pfn);
 
     for (i = 0; i < nr_pfn; i++) {
-        pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
+        pfn_list[i] = (ram_addr >> target_page_bits) + i;
     }
 
     if (xc_domain_populate_physmap_exact(xen_xc, xen_domid, nr_pfn, 0, 0, pfn_list)) {
-- 
2.41.0
