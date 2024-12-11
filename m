Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4417266njb;
        Wed, 11 Dec 2024 15:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVU0s1Mbep1bR8x4qyAJK5pQ3XPa8bAC7me6v4lbidXJzy1liYzFT0CpX0Sv2rswo8z6tPkOdOdApXfUg==@linaro.org
X-Google-Smtp-Source: AGHT+IEedIFkxjv+PzYfEoW/ic8tBZHiZNx9XX7cJNg2Hy0UPUEutYBCoLL+9xBwjwl85uiaIhmj
X-Received: by 2002:a05:6214:768:b0:6d4:10b0:c249 with SMTP id 6a1803df08f44-6dae3927013mr19165726d6.22.1733958311775;
        Wed, 11 Dec 2024 15:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958311; cv=none;
        d=google.com; s=arc-20240605;
        b=aMWRz4oRdffr4UA1XBS2vYjl3m5xc0Wb3/8L2/5zQDapMUcaXGL/+y9p0FGWMswjoI
         ofkSPA28uCk4rixirE7itmd/bAYkbgUZvP15Bbmnlm7Ldzvf0nM0B5MH74Ct3x7WhHQB
         cfs2RyHPsm39wi709lOHqvehvvit7Exr9c9acIF2RE9BVj0VOrj8ZCKYOeY6a9B1QGDC
         6XjPsVuZEw3iac1NxDaTchEBjB3hVpm74KN3rMK+PGTwDNJYxzNE9KiPKIHaehWsGMh0
         XNB65OFwAA/zk2FEdqhe52oSqtPCVIcx9CBd2o1FiP511oeQwJ5oH/6T/8TjjdRwU0Tu
         +hMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e1gkSU7M75EFdbW95JvRzZevk5diVkYdExWvAc1of60=;
        fh=dN1ysX4M8+iI/ggMdFTeEsC+ShcHLD4VOsT6mH35/b0=;
        b=lv9FGB02ngjQdH54H8gy/R+9pUm28DTK8KCi5rhzqAlMAMuC83GCLWN66oWTgnz8zo
         Ou5I3VdwW4FDidc/q/Y8rGlaqiBO0jwL/ePeUrQ0bWjBs2CKBjT8ZaXQjR4dqO46zSRa
         eir9q+AoVIPkyCrKCHfN+K9u/D6GDG2mcp+J/PxvkxsZdWy6FaD2N5jbcqdP4S+466vU
         vhNHTdu+akrbt32URQEuGrPu8QQ0YJDwCCvur6i4uPv456PJEBQ+DU/vQ+3Y22Lf2+67
         M0BTvZk2uZ9y/WnvW0ERjALrfLttZFL7+x/cxfaoZqtnFUuhwsxdYOjSgY16ebhwePe9
         jmZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/eBWH5z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dae1d7386csi14066836d6.75.2024.12.11.15.05.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/eBWH5z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVks-00032e-Rt; Wed, 11 Dec 2024 18:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkq-000318-NL
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkp-00023O-62
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so10667305e9.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958266; x=1734563066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1gkSU7M75EFdbW95JvRzZevk5diVkYdExWvAc1of60=;
 b=R/eBWH5z2dx6cjzsEN6u3+idu3vFuwzErwO8oX11xXUX49xg7u3+co4bLtb8Lwtojd
 5NHmmaixLvtSXFqWCc2Jgbd40xh+tbLlPsc251PbFJ9YmL8Q2NXnPExaZcudXcqXOu/j
 3HOJ5ZQeVfiblEkwyYcKRDfEEduHeHlE9GFVeQ4VeMTyHH/XoCh8GIx3eDq4QLBAcagv
 zAxyQs58tKFEF1Zf1vJ+6Z6uU9+1pMMeT9e3DP0+KHzEiflCuXTUtTyO4dDnkAnGt8Wi
 jTd6vixOeaHcpuPvX0SG2FSGxAGhAa4Anwj4I9VDP4et61vZCi0Emut8HYBzWO7qlTzY
 0syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958266; x=1734563066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1gkSU7M75EFdbW95JvRzZevk5diVkYdExWvAc1of60=;
 b=VLgf3QhatmgYy/BSk7kgDKsET1DMS1Q915+pVJnk6WwnZ2OI3D9DYUZOcVaoGYXDeK
 XkS49O2u8NmLU2hzVuPa1zMVXPgxg4pIr8P0XBxbBLyA3Q6sgYiDZqiV3VXkliQ0h0vt
 6Hv82m8XEl8S0g/Hun/T7YfDN99xHBMmycyK3uaOtSvBYowrv12GV1D9RB0TPc85aK5Z
 s9CV0HRg63K5jl5oafRRkCnZWs5WbHccRKR1qFaBM6vQe0P8LoMK9kkYJlgW+k4dqHXo
 cCre+Vtm58+OWLkoZ963+sXkMeKDg5POhwgwE9JX3qx5cgrmp+JG+hjjQOBMG7mTeD+x
 55/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVyrSy8fmpD29pktsJhv7Ug/trwhtrnPXuzPSGj7u9gZV2vfYz89p6g71ForamfkrhR67I27U5bQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbTRonl8a0KcTsvH8q4GnF88zN4lxFbPeAWQW+zF+lE3QX1Ty1
 QweaU/gKHmE8l1GsNEANJZFYkhnx35BsaklW3tlZZJcHyliPfdVrEboOS6x6Avc=
X-Gm-Gg: ASbGncsub3w2AHM2wfBYojq8eh0XkNL54dLj5i/LEsSuHspuag0dw/ReTnbJ6x6JxXR
 SZG98KQ8c4GEowcEgsa391i4tvBDfXdrluTQQ5RkK4iTQIndNHA491l6SIhSpKucyvxf3e1WSAm
 NLsWhD/xDRbdkoKWt1+TyTEU3ZHJjLOARp1eqPnpzjmO6L5gUKocR8EbDvouKsXcDvm7mNHNqcx
 FSmCzUEv7qJ47VZMGl+l7m68xGyqwU3oMsmX2X2pklezhH4U8cP5GmZqKD4nRgHZk6kNAk15TO/
 mA4GJ3J3FOtJOhwu95qK0vwc0jtutpXS2g==
X-Received: by 2002:a05:600c:46c6:b0:434:f9c4:a850 with SMTP id
 5b1f17b1804b1-43622833224mr13851425e9.10.1733958265695; 
 Wed, 11 Dec 2024 15:04:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f981880csm117938685e9.44.2024.12.11.15.04.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/9] hw/ppc: Include missing 'exec/tswap.h' header
Date: Thu, 12 Dec 2024 00:03:53 +0100
Message-ID: <20241211230357.97036-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N5eczbQYpVHP

Some files indirectly get "exec/tswap.h" declarations via
"exec/cpu-all.h". Include it directly to be able to remove
the former from the latter, otherwise we get:

  hw/ppc/virtex_ml507.c:123:19: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    123 |     env->gpr[6] = tswap32(EPAPR_MAGIC);
        |                   ^
  hw/ppc/sam460ex.c:238:23: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    238 |         env->gpr[6] = tswap32(EPAPR_MAGIC);
        |                       ^
  hw/ppc/spapr.c:1617:13: error: call to undeclared function 'tswap64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   1617 |             DIRTY_HPTE(HPTE(spapr->htab, i));
        |             ^
  hw/ppc/spapr.c:1406:55: note: expanded from macro 'DIRTY_HPTE'
   1406 | #define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= tswap64(HPTE64_V_HPTE_DIRTY))
        |                                                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c     | 1 +
 hw/ppc/spapr.c        | 1 +
 hw/ppc/virtex_ml507.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 78e2a46e753..3bbab263ae8 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -22,6 +22,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/block-backend.h"
 #include "exec/page-protection.h"
+#include "exec/tswap.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "exec/memory.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0d4efaa0c09..02136b3295a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -90,6 +90,7 @@
 #include "hw/ppc/spapr_numa.h"
 
 #include <libfdt.h>
+#include "exec/tswap.h"
 
 /* SLOF memory layout:
  *
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index f378e5c4a90..0e9a2469599 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -26,6 +26,7 @@
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "exec/page-protection.h"
+#include "exec/tswap.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/char/serial-mm.h"
-- 
2.45.2

