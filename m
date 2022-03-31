Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp417594lfb;
        Thu, 31 Mar 2022 15:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYwoZ8Z+OvVEprI+9KS53KjhoteSSrOfrwkRlQ55795YTjRnQaobMVFo0QBZL27++wS9N0
X-Received: by 2002:a81:1942:0:b0:2e5:bb81:b0b4 with SMTP id 63-20020a811942000000b002e5bb81b0b4mr7075063ywz.165.1648765491528;
        Thu, 31 Mar 2022 15:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648765491; cv=none;
        d=google.com; s=arc-20160816;
        b=hQXaoih2wrpEhsP1Knx+AZB0nWlExePoqVbgt5E3097iHc0lFWNNjXHJdD5uvf/Wel
         jZIKDCWl4MqK4b4nRfSPcUVFzEaN8G7AdjFhL6BkqE3Tsq9EeEWiCswv7Xq++8pahMuP
         PHoqbq/K4Qu95AMc/HQZzDVDSsofzKc55nm+B9s3LV4cbc1z4qWijcCmLB+wr77zJHqK
         djqFlnZwWseMcw5eCKDLryMWgZN3WPmzC46p1iS80X8VFYtHcU1srQTX5O7OCciGVqPY
         T93H1+PBWtXP00KONc2UxOJdSYpg5yGkN+iC47TtZuTINFIQXrI6jYuHXfr+ce2mNYBs
         U05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oUWjO9X6FioG7CEd8HdVxMlq6SisXj3KorxzLNrTPkM=;
        b=VoKhGN0CuEgoWIEW/0MlS8OwV6c01I7wrXMrwdsZF/bj9q/g/E1q0TJm1R9puK1L9I
         h5iuh4qGxz7JvphqHSZW0WjOOGgesCD/5hG2T06WRTkguvb29h1Q2HrQ1vgm5M7BdjbT
         IlLNsctgnVN6oqaCZExjSjCmFfOqt8lj+HD3OyyqrHMQnLOX1E4vi0j2IprrNkZFDOuJ
         zVxRs89weUhYTYq/vrtXu0CnkMusvX9+fCzpRHbU/7Om905yZBBRD0X0BESdT6/5uSpp
         1uPkz/vpB9f0BJAGde6zoCt9pLwD4oAPlLLxbtPxeitDJgVpR0GN5RpGcRxCoban8oFu
         nheQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z585ttuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u185-20020a0dd2c2000000b002e6dabd4050si598302ywd.522.2022.03.31.15.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 15:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z585ttuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na3Dm-0007AD-SN
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 18:24:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39V-0008WD-Al; Thu, 31 Mar 2022 18:20:25 -0400
Received: from [2a00:1450:4864:20::12d] (port=42704
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39T-0001Qg-Oe; Thu, 31 Mar 2022 18:20:25 -0400
Received: by mail-lf1-x12d.google.com with SMTP id d5so1602086lfj.9;
 Thu, 31 Mar 2022 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUWjO9X6FioG7CEd8HdVxMlq6SisXj3KorxzLNrTPkM=;
 b=Z585ttuLoYYjlDzfCSOMZ8BwaBPqlf+ri64xN2ecRZyCz9j9TPxSaHy4U8ldM84pW8
 0LI8CbbQecPTwn1axtQxaqcxhwP/YgwR8l20E8XK7v2JyhaPxu1zvJ7LZNJ7XVmvebUB
 6auCzirtJgWP439wROoZ//xh3Fwm1rKuxw4qUjuRBnW24iSQo+4yn4je6eARJvgEBhgg
 TlUZvqz2AYynRBGH/YjRFLR9ExykUQ34Jv5fYJTDBYBbvh9UWAWFv6QuAZ9Tz7sDEkih
 /RncO/cscwPLL1u0jFIph+yt7UYPjr5x+CUL0o/FVe3SpeT9/xaMlsHEuwzzb8TACYPZ
 B0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oUWjO9X6FioG7CEd8HdVxMlq6SisXj3KorxzLNrTPkM=;
 b=jZ8FMC2fR7eik7dBMj3og21/rhsFNN08u1fWgDHRvZ7jTotLOOBtr72IgxIIqKxPJv
 cOkcdbPmW3VEUjJrm/sqBUNVzUMRd47A8Tb65saLFhEPFVDGN9sUHJ51ZGQeUAzMVaa9
 0ONHpRqzaIMkXeHfZk4sBjbQNIRgDgYqwS6RhwnRnac7iWKJswGzO9M+amwID0mXoNRj
 wQVbww3+RS0n63vlnLPVv7lgSYtPNWnZB/SZp7bie6VtPcnYTMU/vqBsv0AyOd/KpXYt
 kdYJhcjBER3JROB17Fx0NSDMAmlVVvNgrRvJM0DJMwGtEJll8gqxE6kZ2PHveZNLQyNp
 X4Tg==
X-Gm-Message-State: AOAM5326PYdDVutIbGryV/N1f8ncXQJ5YWXv+vMKvj5tVe4wNiphcvOn
 dBnuhDnqU8/TWbMypey4VFi803n8UGPTqg==
X-Received: by 2002:a05:6512:c24:b0:44a:7434:9836 with SMTP id
 z36-20020a0565120c2400b0044a74349836mr12345785lfu.128.1648765221404; 
 Thu, 31 Mar 2022 15:20:21 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056512312800b0044acfa17863sm58875lfd.64.2022.03.31.15.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:20:20 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
Date: Fri,  1 Apr 2022 00:20:17 +0200
Message-Id: <20220331222017.2914409-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oVYRt17s8KxF

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Connect the 4 TTC timers on the ZynqMP.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/arm/xlnx-zynqmp.h |  4 ++++
 hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 9d9a9d0bf9..85fd9f53da 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -41,6 +41,7 @@
 #include "hw/or-irq.h"
 #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
+#include "hw/timer/cadence_ttc.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
+#define XLNX_ZYNQMP_NUM_TTC 4
+
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
@@ -128,6 +131,7 @@ struct XlnxZynqMPState {
     qemu_or_irq qspi_irq_orgate;
     XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
+    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5bfe285a19..375309e68e 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -68,6 +68,9 @@
 #define APU_ADDR            0xfd5c0000
 #define APU_IRQ             153
 
+#define TTC0_ADDR           0xFF110000
+#define TTC0_IRQ            36
+
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
@@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
 }
 
+static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+    int i, irq;
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
+        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
+                                TYPE_CADENCE_TTC);
+        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
+
+        sysbus_realize(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
+        for (irq = 0; irq < 3; irq++) {
+            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
+        }
+    }
+}
+
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     xlnx_zynqmp_create_efuse(s, gic_spi);
     xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
+    xlnx_zynqmp_create_ttc(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1

