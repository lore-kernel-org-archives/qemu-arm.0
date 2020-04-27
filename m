Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4445317lfm;
        Mon, 27 Apr 2020 11:24:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypLetRchUKCJZY0TUdA7B9aDgviZX2sF1O1j93e89Qz6alsYYqOW8JGYxfAxf+qS1W1kxqWW
X-Received: by 2002:ae9:f003:: with SMTP id l3mr22309590qkg.158.1588011860697;
        Mon, 27 Apr 2020 11:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588011860; cv=none;
        d=google.com; s=arc-20160816;
        b=MnLAzPLeWD8KuZayZ5Eozwn8jZKMLRibbLemOGxHB6ns1Sw3THXhaR7sbIdVhtAVDT
         +fgfTjAXuX3wMZIi97LVPiUxW+x870akDN9tPpLKtZWnQ9+o+KgRw72EXQAoYsKlfWwk
         7riK0KJBroE2/nnvz7O9aCumzoEluyBjFugNHr2k1DDaIMCrEfpGII7wpjqIkvvkiw3P
         mjdLBpVKyzeixmDG71XWvb1WPief9udjenZsRxrBVck532UipNXFwKwngB/wQA2jR/rE
         tieraG2M985QR19+TDs+jwCdyCfXcWiRjcJHVd9itwgthbQDFKD8BKPAW2/nPQ6VFgcp
         MMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zkjM6r9zWMqZJHZEzHWJTyt3Pifh7yaAUw7gxjRD0Lk=;
        b=tVBgmYyoPWeMHGns3sWI2BGwuUrb5XktYgNnj8Pq/kFuV8oe4vpsYE5KESLY2Z68Ci
         49Y76DK6N2Ljwy5v6+N6h/OD249jixd5OxNZwc6Mk5HrSM6nbz/Ycoztor8+syZ9sJL0
         Hg4wyLRZ570lBp5Z6SR1W6qhe0m3wGu07H9ofXiVFMj54G4AcfQIqn+rC0lDmGKH6D/F
         /cwlU3R/BWU4U/M47jceb8srD4xzxrfJLF+0Pa3+2HmiqlkFOKIQAfGrW6WwY1FK1F9N
         0cXQjO9Lh2mcztw012xvjiE95Q9u3POCKG5SUN3jjShzbhazHlRjZulMV5zboAUns6FE
         j8kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ggjnLtxz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c76si9105826qkg.222.2020.04.27.11.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 11:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ggjnLtxz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57719 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT8QW-0002sH-4O
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 14:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JW-0000Qy-Ee
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 14:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JV-0005av-B8
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 14:17:06 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:33133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jT8JU-0005Se-RP; Mon, 27 Apr 2020 14:17:04 -0400
Received: by mail-lf1-x141.google.com with SMTP id h6so14720154lfc.0;
 Mon, 27 Apr 2020 11:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkjM6r9zWMqZJHZEzHWJTyt3Pifh7yaAUw7gxjRD0Lk=;
 b=ggjnLtxz4m4GanogVDGQXmIf+7Fvp+jzB63j+JZl4G0RBntBfwSypDiCnNS5xjAa+p
 6rMZt7DQZJ16mxuAw5rX1yDIMTWVW4b2Mx6eJhrsQyo4jf+HFPa3W91CCUR/uXwOXach
 JpQvpE0QuE8FolxhkI5GhE84VDhb9aFxRU2FvWpGjELKQ2GWxmIU0/c1StQoimwO8tUc
 0KD+3moludK2msko2Af+7FSn47ApNeEXVL68qmG2ZXZveKILPbqTjHPa9lRYXYw7M180
 FlTAJs5i0Ho+mfG2WFv6gZoxsO/VdqUK+tHrFJLPUt/3Dl2EImgHRIUd0hzZQLdx2sc1
 56GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkjM6r9zWMqZJHZEzHWJTyt3Pifh7yaAUw7gxjRD0Lk=;
 b=m72UCP6KnF3sfXUxHjrxm73B680jrF3+Frh4QJ6u0+MrDl8akNS9bCqVpeGon0hE6Q
 L9khFV7vYSvU4YlMGDk/7zuXkyd6L2OsB4bpVZoOGM4xEKYQVe2o7hZTvuWF7l3kQYKP
 yFvEBRtBmMAp6j4VpoHfwzjTVAz7pE9pIMckfJZlpa1cqP4ykW/zyc2Odtx/Fd7571pT
 2owl/s3SN3JeRT8Q9ueG0A5VzZZY8T7khtRKb3jIeqJNCviB5yoBBPLYsDbr13pHRRhK
 dNJiynbjsQ3TO2c/KdPtKp4BXfa+WHrT8kdBOEWAhehQZwzeLAw688DKQXw4qs2Sa5C6
 724Q==
X-Gm-Message-State: AGi0PuYJHMze49aPNqRwYLItreq5BUAF/IJxwpjTpDWq/xMo478U22Db
 nlopoVNaQQUp6IljylRuIyekb8rHyoo=
X-Received: by 2002:a19:f614:: with SMTP id x20mr16190924lfe.84.1588011422580; 
 Mon, 27 Apr 2020 11:17:02 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id l18sm10611126lje.19.2020.04.27.11.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 11:17:01 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/11] hw/arm: versal: Add support for the RTC
Date: Mon, 27 Apr 2020 20:16:47 +0200
Message-Id: <20200427181649.26851-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427181649.26851-1-edgar.iglesias@gmail.com>
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::141
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mE/izWq1hZez

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

hw/arm: versal: Add support for the RTC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 21 +++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  8 ++++++++
 2 files changed, 29 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index e263bdf77a..321171bcce 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -240,6 +240,26 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_rtc(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    MemoryRegion *mr;
+
+    sysbus_init_child_obj(OBJECT(s), "rtc", &s->pmc.rtc, sizeof(s->pmc.rtc),
+                          TYPE_XLNX_ZYNQMP_RTC);
+    sbd = SYS_BUS_DEVICE(&s->pmc.rtc);
+    qdev_init_nofail(DEVICE(sbd));
+
+    mr = sysbus_mmio_get_region(sbd, 0);
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_RTC, mr);
+
+    /*
+     * TODO: Connect the ALARM and SECONDS interrupts once our RTC model
+     * supports them.
+     */
+    sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -323,6 +343,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_gems(s, pic);
     versal_create_admas(s, pic);
     versal_create_sds(s, pic);
+    versal_create_rtc(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index e11693e29d..9c9f47ba9d 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -19,6 +19,7 @@
 #include "hw/char/pl011.h"
 #include "hw/dma/xlnx-zdma.h"
 #include "hw/net/cadence_gem.h"
+#include "hw/rtc/xlnx-zynqmp-rtc.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 #define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
@@ -65,6 +66,8 @@ typedef struct Versal {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
         } iou;
+
+        XlnxZynqMPRTC rtc;
     } pmc;
 
     struct {
@@ -89,7 +92,10 @@ typedef struct Versal {
 #define VERSAL_GEM1_IRQ_0          58
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
+#define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
+#define VERSAL_RTC_ALARM_IRQ       142
+#define VERSAL_RTC_SECONDS_IRQ     143
 
 /* Architecturally reserved IRQs suitable for virtualization.  */
 #define VERSAL_RSVD_IRQ_FIRST 111
@@ -143,4 +149,6 @@ typedef struct Versal {
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
+#define MM_PMC_RTC                  0xf12a0000
+#define MM_PMC_RTC_SIZE             0x10000
 #endif
-- 
2.20.1

