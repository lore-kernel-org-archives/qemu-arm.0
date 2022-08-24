Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2218082ejc;
        Wed, 24 Aug 2022 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6dSewPLo3s/2/D4MgAt3C45ZjeM2xZ26dmV2XhjyRVbSTh5gXiVnTnBaubSXyTUfDd992G
X-Received: by 2002:a0c:b309:0:b0:496:6277:953e with SMTP id s9-20020a0cb309000000b004966277953emr25457534qve.77.1661356546770;
        Wed, 24 Aug 2022 08:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356546; cv=none;
        d=google.com; s=arc-20160816;
        b=iYDgkYek37J1tkvJ2g3Xsu85Yqm09kGHvDbRVrZPMicrt33Y/zmVLaAA39Eltk3lVM
         EnqEJRogmCelomoqDCZH8RfxLf/xB3r67TvhopAQA8mOgxw3Dul4yhvJkbHyc9to92sX
         96gRys/asA31z4rqaFtiaZmLc9Z2lWUOvlyIF4FNzaQfUTOiSP9miXNuyPrnmHTWV5Je
         F3WTDgYYGzv1Wnw69Dqa2CoMgXbrfOplsCCOrtei7KRgO0jUBX7SvH7CPjDXZLfqLA/2
         ffzeda+gCijOHLSIEQUDI2gegKWI3OS6QeIhk8t6SoZmsgUnKzTL6Nq1YE66UgVr78HS
         W26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JPnL1u8Q7Rp6zS6QxX1+K19gfMEh8ge2+QRHygxZ1TY=;
        b=jBQY2ORHJILYmibAkOZhUmZ8dkijBShmkArWfXcewphOLQBb27KRa4RHGeAk8bUZJC
         XPIz7t6Blp+NrAyFVC6vvgjtJyZnOn/Q/AMusXi90UrHcsqpuHgoPvAeM2/j6B86EIZp
         iAPkiPErjGm+D38YJzj8PnBTO6kLNBDDB4dTgffjjS4T0xlax1/lPaQlbwkzwhtH/Ujb
         rVSo12q9yWrfHGvT+uLbMSTr3X2Vxf4+udJs7QO0uFKNAbZg2Fi/14lM2gvj5mIXC7SS
         78KXksCEazUIGWBOuvi85I01yolNICLfKDqh9jebBm3mQp2qbt0LcJl8uvONi4eZYg9D
         ZRRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gungl2OH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020ac87215000000b0034305a91aa0si6113724qtp.483.2022.08.24.08.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gungl2OH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsjK-00017d-9t
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsfA-0002BC-0s
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf7-0002Fk-5W
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id s23so8967636wmj.4
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JPnL1u8Q7Rp6zS6QxX1+K19gfMEh8ge2+QRHygxZ1TY=;
 b=Gungl2OHa1IbzzrlRsdSVhv1zdYnP+aY9VeRN3RcEf6TgFar5IVM310JwB18UhjKOn
 uEza8rTQv1f/eH6t9be+26vFVEogEShWlh1AykvYjwHwQ1yXB+7zm6QF1Nr1w9ptO+QU
 0W3k/91YomvNSZAmCgwH/XEKiLpKad/OClTQAugkKC1Nu6IusG7Atqmr0BDNnXiDaIdf
 eHeVj2lCyM51zU+fUiQWOMsrBiHNJMDptb1eZuAo4AuHdkRjmGcZZ/tngPewrf6eaBE9
 Rb7CRi/OnkF70G4IPOngLtVrD+Gb+sQxNRrrS76Ojdf0nU+Tkh4cAuQs3DQKmd9XJCxO
 MDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JPnL1u8Q7Rp6zS6QxX1+K19gfMEh8ge2+QRHygxZ1TY=;
 b=1sFMFKudoQJr2DqN2+YzSDaGXGVIGuVdt7rRkuiafeiWv2TgidFtNyZTaRU3/tO+ll
 mQCQXgUDrrcJ0Q7GCc5LX2L1RS4Wu+y+yWPwoXVE8GS/UC/BOIRwPLcObzjvhkYqQuNt
 YGT8gax+IwZuhX+rkgMDVjua+QuLqDvc0W0cyYvXAN5miyhQ2xiUpuC4HLJlO3R3FhWX
 z/xZ0jywRfyn5rl6/TN2HEzw55rQhZwtNvEiAbb+0Aiyo+k94soIifAas9ljxlWXvVZy
 qNjuRVRLAfrlxBb5L2MSKLKVqkRy9sfXUXVTPrdWt5hiHdP9eDgxOExNiYlCMnQEYn8s
 LMGw==
X-Gm-Message-State: ACgBeo0E/w/Zv7ZGS+rztt+2MhhvmT2ApolmcPZgKQMC4NWgRi2M7msn
 CbkyU10Eoc8kWHqAp6mQMg0J+w==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id
 bi17-20020a05600c3d9100b003a54132b6a0mr5377180wmb.126.1661356282982; 
 Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 07/10] hw/arm/virt: Fix devicetree warnings about node names
Date: Wed, 24 Aug 2022 16:51:11 +0100
Message-Id: <20220824155113.286730-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xo1nz//DawxQ

dt-validate reports that several nodes have non-compliant names:

  pl061@9030000: $nodename:0: 'pl061@9030000' does not match '^gpio@[0-9a-f]+$'
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl031@9010000: $nodename:0: 'pl031@9010000' does not match '^rtc(@.*|-[0-9a-f])*$'
  From schema: linux/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
  pl011@9000000: $nodename:0: 'pl011@9000000' does not match '^serial(@.*)?$'
  From schema: linux/Documentation/devicetree/bindings/serial/pl011.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3d460f3686..952af37935 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -857,7 +857,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
                                 sysbus_mmio_get_region(s, 0));
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
-    nodename = g_strdup_printf("/pl011@%" PRIx64, base);
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     /* Note that we can't use setprop_string because of the embedded NUL */
     qemu_fdt_setprop(ms->fdt, nodename, "compatible",
@@ -897,7 +897,7 @@ static void create_rtc(const VirtMachineState *vms)
 
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(vms->gic, irq));
 
-    nodename = g_strdup_printf("/pl031@%" PRIx64, base);
+    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
@@ -999,7 +999,7 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
     uint32_t phandle = qemu_fdt_alloc_phandle(ms->fdt);
-    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
+    nodename = g_strdup_printf("/gpio@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-- 
2.37.1

