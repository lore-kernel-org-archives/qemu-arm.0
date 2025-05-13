Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp671376njb;
        Tue, 13 May 2025 10:18:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUi+JoH0bVdaTZe3ah9fdYoEOSoY3U7B2ycXjB5+qFlvF3swhEYECwNhCGlIm6eQWfgungu0XCjWDWsOw==@linaro.org
X-Google-Smtp-Source: AGHT+IGVPuK+RjbxdW+GOfBsAwD3fvUPR4zb70WPdWKJ2o/nPTMcb+lRXqKs9tUDab07coMWyivZ
X-Received: by 2002:a05:622a:4291:b0:479:1a3f:f1f0 with SMTP id d75a77b69052e-49495ce9ecemr5141291cf.41.1747156719467;
        Tue, 13 May 2025 10:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747156719; cv=none;
        d=google.com; s=arc-20240605;
        b=Hg1gEwm0JHU14S9JwMpkEL9r2bBy74fkfV7kKcZvSJZpqEWv75qmX5MbqhmPQSI+MQ
         4OTt/mE811jMNtCYiM6Mgqkq/Yv0KGr4umoWba0pXQsm37eFeUgoZhw/8EoEbmKZnB3U
         7JCyaxfkH+KDlzgJz2nYPF/1RtnDbdPWVynVYBDb0tmi80NoCDv/7SpwSN2BEvwUewgs
         krVzc5iozvS2kbXMCUQZGN3S2ohmmk4t783FENZw+JpobKpwUdQ1aKey/Hfqg40RvzsM
         sdZ/NcHAR49lyR06wEWU05Z4NJsMyGk4jyF/x5MPdNLIFVj9auAF+I8HqB/iK/Dt43go
         py0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:sender:precedence:errors-to:list-subscribe
         :list-help:list-post:list-unsubscribe:list-id;
        bh=92VKl5M8N6yTo/u89ILBeJrAILC8Bk1ppBFcXFhcPnA=;
        fh=2np1AqjOMry92uAcxjCIGdMT8ADjU6NYqKCGqmZ+kmY=;
        b=J/ywdlLr2FmL49Frz6RAWkJFSG9X5eRFbA0bjJIFpF9VrX23lRbvYk7L2bhYKuLqXt
         mgGDt/CwyGXT5q/nzPl8/phl4CUmqEqugNsO9dHlnYOYDEKpnNnfoeV3C94SQ12smBYZ
         iH60PhVwFZ2gn42EHpRDl5ZwMgHALfl+PZbLKZsft69PH3eTO5bWeLLRhtQp38ymlUOS
         xjH0Qhugd2VX56wLshqGJUizCKZLy8EUy6LjBy6tyceUu/hj7/PSarwRAgemNbkGr62+
         voI/C/LoA/ycM0knh+jnmb0JypJ+NMuhL+rd6f5L0+mh3pemeTBzmcxvvDeotEgJ62AJ
         q3dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8WXGc88;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b1d5dsi116647101cf.624.2025.05.13.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 10:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8WXGc88;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.983384.1369753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtGB-0000xO-Cu; Tue, 13 May 2025 17:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983384.1369753; Tue, 13 May 2025 17:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtGB-0000xH-9S; Tue, 13 May 2025 17:17:43 +0000
Received: by outflank-mailman (input) for mailman id 983384;
 Tue, 13 May 2025 17:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yd/e=X5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uEtG9-0000xB-PT
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:17:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c366bab-301e-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:17:39 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso9207585e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 10:17:39 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm219095405e9.39.2025.05.13.10.17.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:17:38 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2c366bab-301e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747156659; x=1747761459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=92VKl5M8N6yTo/u89ILBeJrAILC8Bk1ppBFcXFhcPnA=;
        b=y8WXGc88plDzxeImPfmWsDGppio65vXCpRNa60+mtQZsP6Dmz/pR3Ss764fZNTVYPw
         vsZ4u6aCvjB4jIxL/7imbGMl8RY4RUeRuaNhUjyhMeGHYz2Ok4VmFET0x0YgXBZEQeaQ
         0nnkTnbg0AXwTJhBMRoz56SWnmHLroejL/ojVDlqsHoW4XYOY9s6U/N6j1u8MzdOgXB6
         kKflLmcQxNo6Ot+kl4OutfKnyRtzjkmLIcdB2OFmewtwwa2guRQcdLPaJxygLYl5BL9X
         xc++ga50GR+F4D1QNHtvbexQSuMhmapzWyXspG7n5raa+RmkLi7r/6+fHgTa+xgRseQe
         CpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747156659; x=1747761459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92VKl5M8N6yTo/u89ILBeJrAILC8Bk1ppBFcXFhcPnA=;
        b=PB3d5JSa7YvNZsjaXwnkLDOw73CaeM8fPoJV6h149E25mffEZ2clumg/HkRsrOJmeB
         Mu8cIpex+uM1JqpVM+utJmgsIrfhhodt4cfZ1paFNc6LdGrh0MB4DVZw43VhsEl5OwyG
         NAoEU51yjBTVRS1UleerelWIkxMhGcPzuykR7soO5fQCoQItpGlW++wg0/pz0Z+pPN2o
         4lVZwpYhmLKQiQsGsdGRe4bc97G81tQMonbq+x3zsifEEqf/8zkGC9wSxCS7PUIejrCQ
         p9+Xir1JB0ltM2ahhafF6toWUKauCsaUZCtFNlv6A2ytorRxS/aAIzpWAtg5Nf3BrsCb
         pMyw==
X-Forwarded-Encrypted: i=1; AJvYcCXtTdvfjFFf7OucZq+ZDUUQDvTXaY09ym6uxHSHcsH2Pj5lp85HGZKJHgAW/Zk17DbKhYckVImi+lY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx20EyaOzCMT9k5XphV43kqvo8xAmdAl/h5FeEjS6sWI+6l4uhM
	X2fcoV1EWz8KRhaLpXBSqIiORhKJzE0wkJSo+BDJ0tqdkNWGfl490+++wGsbM7k=
X-Gm-Gg: ASbGncuxs+FUKbN7aojoUlJsimugkoo65m0MfJyJBRwwya6MSdHrdkWSD3qTlEc3lQ9
	P4sSsUBFnbSR4s/jzz9i+rePXp/4RjE5cP9MF7nuSLY4MbQrJsnPxslytqu7XkHfQgRgfruyKlw
	iiHWftJcVgeR+aAgnNTM2J8uTzDrKDHRr1oo98VWLJh0njJPueMo9s/k7fXKzZjZnjTFAncN+gE
	2CnQGnvCEvWsll7MFyK6T94w+Uy+2A6l5smGoEowuRtUfbO94stjzwVHGqUFRhhHyyP5qHJd5LM
	zsDVFdDrpz7acUHYQO/l6sDfuSq4BTVmCSGo1Z3ktotM/oos6fTgySwjggziwcrGRqQQwdxH+6x
	tGa1Zr9oWUKlRzikl2hP4+UuIBA3U
X-Received: by 2002:a05:600c:4e0e:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-442f20bae9amr1785765e9.6.1747156659284;
        Tue, 13 May 2025 10:17:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
Date: Tue, 13 May 2025 18:17:37 +0100
Message-ID: <20250513171737.74386-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2OwEs8hTE6fP

As each target declares the same prototypes, we can
use a single header, removing the TARGET_XXX uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xen_arch_hvm.h  |  9 ---------
 include/hw/i386/xen_arch_hvm.h | 11 -----------
 include/hw/xen/arch_hvm.h      | 14 ++++++++++----
 hw/arm/xen-pvh.c               |  1 -
 4 files changed, 10 insertions(+), 25 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h

diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
deleted file mode 100644
index 8fd645e7232..00000000000
--- a/include/hw/arm/xen_arch_hvm.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef HW_XEN_ARCH_ARM_HVM_H
-#define HW_XEN_ARCH_ARM_HVM_H
-
-#include <xen/hvm/ioreq.h>
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void arch_xen_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
-#endif
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
deleted file mode 100644
index 1000f8f5433..00000000000
--- a/include/hw/i386/xen_arch_hvm.h
+++ /dev/null
@@ -1,11 +0,0 @@
-#ifndef HW_XEN_ARCH_I386_HVM_H
-#define HW_XEN_ARCH_I386_HVM_H
-
-#include <xen/hvm/ioreq.h>
-#include "hw/xen/xen-hvm-common.h"
-
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void arch_xen_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
-#endif
diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
index df39c819c8f..8bacaa4ec41 100644
--- a/include/hw/xen/arch_hvm.h
+++ b/include/hw/xen/arch_hvm.h
@@ -1,5 +1,11 @@
-#if defined(TARGET_I386) || defined(TARGET_X86_64)
-#include "hw/i386/xen_arch_hvm.h"
-#elif defined(TARGET_ARM) || defined(TARGET_AARCH64)
-#include "hw/arm/xen_arch_hvm.h"
+#ifndef HW_XEN_ARCH_HVM_H
+#define HW_XEN_ARCH_HVM_H
+
+#include <xen/hvm/ioreq.h>
+#include "hw/xen/xen-hvm-common.h"
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void arch_xen_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
 #endif
diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 4b26bcff7a5..1a9eeb01c8e 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -10,7 +10,6 @@
 #include "hw/boards.h"
 #include "system/system.h"
 #include "hw/xen/xen-pvh-common.h"
-#include "hw/xen/arch_hvm.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 
-- 
2.47.1

