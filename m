Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp296298ejb;
        Thu, 1 Jun 2023 02:48:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65uwylCyYCiuZ+kUz12svnzReX/nVR/V80fdtICvjtmrF75E9EUWBel8hSqUHWBS11Ni0i
X-Received: by 2002:a05:620a:8b87:b0:75b:23a1:3680 with SMTP id qx7-20020a05620a8b8700b0075b23a13680mr7496857qkn.65.1685612900486;
        Thu, 01 Jun 2023 02:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685612900; cv=none;
        d=google.com; s=arc-20160816;
        b=LBpn7BkSRRUlwIXaSs5soPDi8a5ZHfuxUaMylFIKk517mXaUNwt4TCTYQB24hh8fBz
         lCESrMtMhnaZwDty34d8H+ZdeBlY5JaGtHtQW5qHO1CCf5rvWpmA2QkMFOCH8ihk0UKF
         1YYnSKfw3a3eZWsA2hE2x0/dR0l4P0o6UnKipcOM58sZlt7F2ToRzq7fDYuHLpisjVdz
         SD6VnpbXHYak94RIBcq9EZCDM+JAnQKX0BSIy+sBzEp0p84f61cGtJqcgh88TfPfsxzI
         rnwNhrE2zL3lQ2ez3xQ/YoKoSbC668MrdPAORioa+RMJ+iv7E/vcOqRvNNHf7Lt0GUYD
         Bzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HmhQNJHFAcag6yz9sQ/XjOqESAjbgaIMCNWmwxbtuwY=;
        b=Tpmb+NLKcphMHptYEVDOsN2IzHqyOyW8vjlcl2/jqmTjzCjNIKf0DCVgR0GkvnQMLy
         RrZUB9gzEsgIK0/M5fTMTaB+fbhHdV1Bib0Gu3Tl5zmFjxp1Tr5lrCzcMnMXMl42DU1s
         cdY6tWCXa3M7phbCKNLkwrqSw6tGfJ8LImfyiPmB3m+kHKSlAOMSjaZyuheRQ5O94YiW
         SeeG79OIXNUyAOVA3z4k5ofE9en+8gyySCPRKGetGWZnbnRz0juCJNPNmSlf38K1FhEd
         bafBE6Akd31pVGqxMvLCZtZ3yCn+vXjFj4HHd0m8A8gqINfgP9KOKEvSyBIUKwKcMzG8
         1l9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUMo5NqB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a37f503000000b0075cfc5be027si3681392qkk.461.2023.06.01.02.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 02:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUMo5NqB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4etk-0005BE-Me; Thu, 01 Jun 2023 05:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4eti-000578-Rq
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:47:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4etf-0004Op-Sj
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:47:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4dffaso6723685e9.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612826; x=1688204826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmhQNJHFAcag6yz9sQ/XjOqESAjbgaIMCNWmwxbtuwY=;
 b=oUMo5NqB7r7wpUyHbTnnyba9E+v4zPJn/YthIR6MoVYSi63MUEqLISYD/BQWvOPMRi
 pR6MWoL+UXLpRAzyNnE0n75OoEK7+YlRiilyjaTsQgo47iho3lMWfaStvse80HY/e9HM
 jHjYspQh++nXBboB4vd3Q0tKRhekV2cfv+JbwDECbWwavWR5djK/TjaFjzFVMqcRcLMX
 pY5itrfeoEbDSiw2+8L4oDapN8UXuURbjjbOpgnbniwAw5sQlAm4hI3L6c+EG14/H1mR
 2TrNEzH7NaWhFqnufdZ7aS1sx3zztEOgnUt5Y5/oIV129q7eBtMFCG7yZFbmZj2GnhaG
 IQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612826; x=1688204826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmhQNJHFAcag6yz9sQ/XjOqESAjbgaIMCNWmwxbtuwY=;
 b=ZrlibfmPemuv8tBPWlT4wAw/7Mi75Dq9ND46NavMRVQPlCSft5RGjZb4oSlcxRJ2Ie
 HSsc4d0LhamBynS+Zqi3eCkYYvdpj0ybkdVDt66vj/Ny7HYSCyckusHdAsJPMjMm6OIM
 SkloIIBC91acan/gTsg5mM0+kqrLVwjeUybIDQ39ZURe6/zlhNURQ8Y5nMynZnd81Yl3
 G6sSpma5Mn0BVt07C66/aTrVfm3egzfExRY81ptbGxjMGixtiJhEOtLUyrnaurvTvUBx
 0OHVwuNrmBJwspYZMceiEJH630Q9YjWkaufUIGZF3NMWVbOrZ+CrsUGFpJzaBfKnDON/
 xqXg==
X-Gm-Message-State: AC+VfDwFj379jlsP9JNvyFv+oZL71Zn4mhz5HEVIbI1eOyzIIyYE+lvI
 b1nFN0mnyjHXm6WJprLeRyqy2g==
X-Received: by 2002:a7b:cd0f:0:b0:3f6:4f1:cfbf with SMTP id
 f15-20020a7bcd0f000000b003f604f1cfbfmr1134766wmj.20.1685612826405; 
 Thu, 01 Jun 2023 02:47:06 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 bg22-20020a05600c3c9600b003f4283f5c1bsm8570794wmb.2.2023.06.01.02.47.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:47:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 7/7] hw: Simplify using sysbus_init_irqs() [manual]
Date: Thu,  1 Jun 2023 11:46:25 +0200
Message-Id: <20230601094625.39569-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230601094625.39569-1-philmd@linaro.org>
References: <20230601094625.39569-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sNRl4GsMznOd

Audit the sysbus_init_irq() calls and manually convert
to sysbus_init_irqs() when a loop is involved.

In omap2_intc_init(), the parent_intr[] array contains
2 elements: use ARRAY_SIZE() to iterate over.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/omap_intc.c    | 3 +--
 hw/pci-host/gpex.c     | 2 +-
 hw/timer/renesas_tmr.c | 9 +++------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 647bf324a8..f324b640e3 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -627,8 +627,7 @@ static void omap2_intc_init(Object *obj)
 
     s->level_only = 1;
     s->nbanks = 3;
-    sysbus_init_irq(sbd, &s->parent_intr[0]);
-    sysbus_init_irq(sbd, &s->parent_intr[1]);
+    sysbus_init_irqs(sbd, s->parent_intr, ARRAY_SIZE(s->parent_intr));
     qdev_init_gpio_in(dev, omap_set_intr_noedge, s->nbanks * 32);
     memory_region_init_io(&s->mmio, obj, &omap2_inth_mem_ops, s,
                           "omap2-intc", 0x1000);
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index a6752fac5e..7b46e3e36e 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -128,8 +128,8 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
         sysbus_init_mmio(sbd, &s->io_ioport);
     }
 
+    sysbus_init_irqs(sbd, s->irq, GPEX_NUM_IRQS);
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
-        sysbus_init_irq(sbd, &s->irq[i]);
         s->irq_num[i] = -1;
     }
 
diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index c15f654738..dd2929d6e7 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -428,17 +428,14 @@ static void rtmr_init(Object *obj)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
     RTMRState *tmr = RTMR(obj);
-    int i;
 
     memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
                           tmr, "renesas-tmr", 0x10);
     sysbus_init_mmio(d, &tmr->memory);
 
-    for (i = 0; i < ARRAY_SIZE(tmr->ovi); i++) {
-        sysbus_init_irq(d, &tmr->cmia[i]);
-        sysbus_init_irq(d, &tmr->cmib[i]);
-        sysbus_init_irq(d, &tmr->ovi[i]);
-    }
+    sysbus_init_irqs(d, tmr->cmia, ARRAY_SIZE(tmr->cmia));
+    sysbus_init_irqs(d, tmr->cmib, ARRAY_SIZE(tmr->cmib));
+    sysbus_init_irqs(d, tmr->ovi, ARRAY_SIZE(tmr->ovi));
     timer_init_ns(&tmr->timer[0], QEMU_CLOCK_VIRTUAL, timer_event0, tmr);
     timer_init_ns(&tmr->timer[1], QEMU_CLOCK_VIRTUAL, timer_event1, tmr);
 }
-- 
2.38.1

