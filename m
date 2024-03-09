Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp367957ejc;
        Sat, 9 Mar 2024 11:23:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUuIh6Y5RKcgRx4nKGElOqBLzSl/RWmPDsnchRFUWeCd/lNfwBHiwjWhnpJPkx+yqdygxsKqVTnkvW7NR66jNPX8hFkKV+
X-Google-Smtp-Source: AGHT+IE37F9lWXItz+Y6RmJ5PY/r+BQ7JWUwjyNUMHx/DKLBDVGtv1W+r1sDxXxI2Vu7tdmnTRJS
X-Received: by 2002:a05:6358:e48f:b0:178:6db3:27d0 with SMTP id by15-20020a056358e48f00b001786db327d0mr3215324rwb.30.1710012227614;
        Sat, 09 Mar 2024 11:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012227; cv=none;
        d=google.com; s=arc-20160816;
        b=ckyM8KqPU37sOcBbevAw5M8UfnlqqQqswNKdWfMoOLZugZkeXk1Boxv1e/CtANnKRz
         rOhP06EFmadOtNXQjHtvnZVLbiNRPD3TWeT8kC4UQ3jhB+iQhjV2CSugJGXE741657Xp
         wblewsTXP63JfKfroBpQQJGNXLF2G067AqhTPzv9kfOomb8/x+1sCt6MTPmFQMQGRExP
         gRQmqau79+fAi2qZjtkhDS2IfAFstF2q/KgcklYaZ8GAFc4LU8fyUiavm6Gpje6XpxFH
         kxcgKkcQQyNPEgcRIueRiFFnUGCT8BWh/4dabbs1txiaw2/x0GtQd3Szf3b+CTgA0Mwv
         J8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q44dwAJ9zWJURYp9hh0U7wvOFqEH1mwy4JxGXOeg8jA=;
        fh=DwVHdoA8N0ck7EMx3cVroULEQyPj+5jCYqcHAQ7LyFI=;
        b=ie/UwYN+UM4dir/qgQGuT6Yb2UzJuYsckwOi36s2U9NqIbB3/mF96KiNR4Xnzy0/xw
         TemXytq/Y0HFU+pd8WVs3NMwTcQktE0uIEDwd1GZXhqoRUHkKw5WgqyAyByHGp61seXo
         XUrp1of1sLumHj1cm+DjbneVqS4pfLGZpLeyTQG6Qh0dz50y3xrG5Dd/DYBN4PHlkWN9
         Al8NsFkLFSVY8uATNA6Ndo9py/SysLW6VDZhKm36z9liegOsHk3vRMnUkB/ES57Prxuu
         qJM17yQJm5swqhD1dTr2vmLOixahLicHz/5KR8uDfHBQtZnLKk0HUDsXrWUbqIm/8fRP
         4gtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYCXrbHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a05622a02cf00b0042edd814067si2184031qtx.23.2024.03.09.11.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYCXrbHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Ht-0000c1-E5; Sat, 09 Mar 2024 14:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Ho-0000Y4-Kn
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:23:12 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Hh-0002WZ-9P
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:23:08 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5682360e095so2919410a12.1
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012183; x=1710616983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q44dwAJ9zWJURYp9hh0U7wvOFqEH1mwy4JxGXOeg8jA=;
 b=nYCXrbHderVfjS+29AGgiifMHf6NUDFw/yLJ4BwXKnabQJx+9ODwdyWCaeUtGirb1/
 81w5za2WauxJilpN9XU8+i1AIq8Ce9ZWlbfkip0kbYRQsUZO6dCILPsxb0TEc5Y+Cr0Z
 bdbArpHMzIIblJtD4BVCkOo+o1YWi4q8dy+ggsA4M22hGKeaqDz5sUp9o+sJKsq3uXUq
 nv66aYylPxLfdEd4PGjcgtTADtvDWV2odV/XpCbnfGKa0l0YGnO/L6LNQzwrMrb1+iuI
 IVqqhBTr9DT1wjuzxG/hQGuSQx/7U7l4mP1h2sRUKNfbZtwbteKRqhOPPxJndurGFREx
 lnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012183; x=1710616983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q44dwAJ9zWJURYp9hh0U7wvOFqEH1mwy4JxGXOeg8jA=;
 b=UI3T7JC1s4QH0smPzV+vix3dDCFVr1MQDgFbGF7eBtWkFVo62Qcl1DkfZ583lOvpNy
 THXaNjQDltATkyQ3dBxu6kfXyMafCszMQPgk5ddcI6Hrs472lo+tR10FA9TjHWrVvblQ
 TXMjvQo74x8FhBnu6QycMcdmn4NSbRPS7wNTL1arG1zHe+xDDJ0biYGs8YVpsWWwSFKL
 nwRqEZ7ky2sAmBubQEuH0xxLs/UoVDbem0en+DP62G+L6QSh/4CVySINP1Or4n7+Wn7e
 SYIlWNiory6OCClfqmcqsnIjPyg2vxlEA4CQDBrrMZwuut3JcC2cfOkgmVl3hnPaGqjk
 IxrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmHUd1malXNhK1zH2hNUyuIMYKZ2WAbs7F7Avi4NAIxhfhNLnhG0K3bWm9QvOWAx8qackwMsJw2Ovm0YKs+wI10Tp7
X-Gm-Message-State: AOJu0Yw2NEMAUz4TcXkGUSj1BdTgd80wU43BwSzkDL3wAlG73jIOSgnB
 Q5NmiMPwWsyZNQ5T3vardOzEYWCPET+JTkHxlJYGb+EOUEsG6SoP5tQrbNZ9oFw=
X-Received: by 2002:a17:907:7898:b0:a45:119e:3dec with SMTP id
 ku24-20020a170907789800b00a45119e3decmr1327777ejc.73.1710012183067; 
 Sat, 09 Mar 2024 11:23:03 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1709064bd300b00a44e2f3024bsm1172780ejv.68.2024.03.09.11.23.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PULL 08/43] hw/xen: Use target-agnostic qemu_target_page_bits()
Date: Sat,  9 Mar 2024 20:21:35 +0100
Message-ID: <20240309192213.23420-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: aIoPvGIDrb4N

Instead of the target-specific TARGET_PAGE_BITS definition,
use qemu_target_page_bits() which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-15-philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index dc69cada57..1627da7398 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
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

