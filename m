Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083320ejc;
        Tue, 14 Nov 2023 06:39:55 -0800 (PST)
X-Received: by 2002:a17:906:ba88:b0:9ec:fbbc:ae7e with SMTP id cu8-20020a170906ba8800b009ecfbbcae7emr2845677ejd.3.1699972795380;
        Tue, 14 Nov 2023 06:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972795; cv=none;
        d=google.com; s=arc-20160816;
        b=LpSU68pp/LzUcyI1GHJridKyNn/aYcUimG0l1q65cbXghDEvHvisFzbXvZjF4YAhMi
         FeKvp8mieTDU39qpw81DYz+b/eFO4n1V+5iqe/rvVaqhrVxf8rE0zvqgSC6OPfScIWvF
         HLS9L3Fvhdu4UJCYXjJ9D1ie/qOUJ/sUZE9NonMti1FE6qGeQgEtcD31eY/FNUufsXZQ
         kM35S3WNySEuWF/0RJ6S4jTSaadIBrnaaU6F1qtSY0kX5Ihmk7PHgxY3+BQ9hNrWMNAK
         0POvSuFfmEgqInBYJjDnbiPfSmH1pEoHLWi1l9KK9uhjihjzH0JO4rbuKpmYdnjxKUpI
         zmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R1LXi3GoLl/gkTzQsgGS9qqbGm09JIagG9772ckn2qA=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=S7fGnmZVfq6YxN4jH5cD1gOLyAfHeppCxOEEBTdEbE1yQQTZz0G/Stjn4W07kt8BIE
         tyQfejxG5r6tCy0QAm6YXmhBvl6IuGwbGSKY0s5pchcGhVpeYe93bOviwmxeJKLgwq3f
         1DDy0M+3spEjNY9tQo7L3M4WMNrSAEnvHI0x9JlVd08P2acv1nNEtyC+Q1HCnK7vcQeZ
         nJIvDCK2koCUkT3NcXVljO/i7cqIyp8RYifpHNrQGDaJFvASidV87TASs7XXTYnbJP1k
         XWBK+nfvb3GrR4uiwPBXW/5LC1/Un5jkwFumcVIAijUSSmGDi14c1j/BPI7g1idbHJsh
         9sTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6XRNu5U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 30-20020a170906209e00b009ae58cb9a3dsor1445181ejq.9.2023.11.14.06.39.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6XRNu5U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972795; x=1700577595; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1LXi3GoLl/gkTzQsgGS9qqbGm09JIagG9772ckn2qA=;
        b=a6XRNu5UQlESIFKdnVyDOfm3StaPt/AkEMFsk1EKykRKcMGbXkDGsRLLLKYp9sjn5p
         CJ2vA7Sh7tIN2qk3QsQ6DYuLO14h2pMOY8OZSy6e0HXK9Qx1xkkz++yUMwu/B/Ib7Qob
         fe17Gskyfa8Sp9EiU+OW+M0MygDzFHRXNrZ6fN2poY6MiJgPGtozQ5CYIs6zD8cGjedr
         IL71SZI/yKWvXccmW/9qVW7r5HLQGkWliC5W0+yiPda54ruPQN2Dp2v21LINTIyfvySz
         GjX1MfaEqajwsPjkyxStk4g0GNOFV3TcgQ21O/r+bKTFzH1/w4+1Zw90skqJW8wSbI99
         Ww9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972795; x=1700577595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1LXi3GoLl/gkTzQsgGS9qqbGm09JIagG9772ckn2qA=;
        b=SdSpcgw+168JJLKBI/UWdAbaH89vFGDyXeYDpwIJ4/tcqpY9NyAw4U2AFXrSc+S2pf
         qbMRW+P0IbvchFqlL/mrPeUFLpoLM/u/pLsC/ZejpNW2ZYG93FfMZ4KoJ/J/oT2kC6FF
         1NxMWJr5rkkc2khNjYDtkXRi3OSmkio2A1f4WBaHj1BaT3uOsnQSwaN+yDx+bYLr00na
         yHuUd/+Ud2s0zd/N4+qXzqCDSV1v6k04yySFZG4skeEWAYoQxKbL/TQC6qIxdyWSllZA
         hj6ROhqVl/tlqprRLV4o/6pSrwLAU0uJL586uZFf0EYzonovO3cdOt284Ivc72XJWUtv
         gH3w==
X-Gm-Message-State: AOJu0YxXEIzdGiMil1HcDGH64+QAg5lUhan4VIlTeRARojcAmDUkGkLR
	eMi64uR86iH5yM9qOU+GKxPIhmPx
X-Google-Smtp-Source: AGHT+IFO0v0Kbx5mK0/IVC1YCc6AdDt4TudkiuPrPaddeZvjZPoy7Sp5UUV1A0HKtR5wjcSegxv9ZQ==
X-Received: by 2002:a17:906:e51:b0:9ba:b5:cba6 with SMTP id q17-20020a1709060e5100b009ba00b5cba6mr2289558eji.14.1699972795126;
        Tue, 14 Nov 2023 06:39:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906080a00b009a193a5acffsm5624675ejd.121.2023.11.14.06.39.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:54 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 14/19] hw/xen: Use target-agnostic qemu_target_page_bits()
Date: Tue, 14 Nov 2023 15:38:10 +0100
Message-ID: <20231114143816.71079-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QzN1wbFdeFsX

Instead of the target-specific TARGET_PAGE_BITS definition,
use qemu_target_page_bits() which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-hvm-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index fb81bd8fbc..73fa2c414d 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -2,6 +2,7 @@
 #include "qemu/units.h"
 #include "qemu/bitops.h"
 #include "qapi/error.h"
+#include "exec/target_page.h"
 #include "trace.h"
 
 #include "hw/pci/pci_host.h"
@@ -14,6 +15,7 @@ MemoryRegion xen_memory;
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
     unsigned long nr_pfn;
     xen_pfn_t *pfn_list;
     int i;
@@ -32,11 +34,11 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
 
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
