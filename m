Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6403487wrt;
        Mon, 21 Jan 2019 11:23:16 -0800 (PST)
X-Google-Smtp-Source: ALg8bN40xlvRA/G2su8P0hEx7ua3ssO1c5w7BUUeE2eko0kIuVxKjlQfSIhAOpSqvkN9d6vVYGUn
X-Received: by 2002:adf:9bda:: with SMTP id e26mr2059003wrc.295.1548098595987;
        Mon, 21 Jan 2019 11:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098595; cv=none;
        d=google.com; s=arc-20160816;
        b=dXhWdyNQtbZPhMhuvVr8hc6gvAmI8vPXsYbnhm+IMn2z6Mu3E3NVAau0KspiRk7i8d
         /cpyqKrOINMheWq7S6f2M8BoPAa5O4+JuhpZcI9TuWNVfSaUp5BbNkmD1IqOH8cX2vvD
         +YoNcVBiIBpTwIkGD9UyD0HDkW7//PZBhiqHAwXFQHlscB7VleQkYcoIloNJaVEvT8Ur
         JkwiVL6d3W2yW0j4MLUTUluET8CGajFwQAM6T2skYhgyb6zgLIsZgawClFNy/ucV36QC
         TLVy0hgauQvvGnUvYTodNNUiQrzLOYh2LJrogy2hIOLBP/MwPkVO1HEi6aFyBUAiP0UR
         bX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NyOzJo6HdhqirSo4FTNN+HWWChIIYH9S1hj1nxz1Els=;
        b=bLutCEerL1EEVP1gDKdQaFFyiYlMg/dApZhmq3BSi/mfdwMg80ptqCfT4y5bd7LtGM
         gT5TeuRSt1e2+uPo6yF5XNc9wKdVbnHtdbQ9LwQQ+y+RJmNdiToUdCNRrGsSzq+IZp2i
         ozcm0oNvhc3EqaQXpa2aEV9xSTlAukdXOSpiranf1e3iq2j9P6ppGX4Xo+G88JScD2Qf
         9Cae74jtktuk9zqmHg6YL+7fa/4psi7S5qBxRBAiU6PL3aSHVZy2c6XQbYtINGBwLpwV
         D3LKgEh53yjI8sEe1/WL7mPlS1CyY3E/VKK0l3iZJYjSpO/iX1U4/V1BxX02yiUyBLMm
         hhhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=emaPeNzZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b128si31847994wmd.141.2019.01.21.11.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:23:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=emaPeNzZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfAA-00039L-Rk
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevU-0008OH-10
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefe-0002sL-M6
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefe-0002d3-Eo
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:42 -0500
Received: by mail-wr1-x442.google.com with SMTP id q18so24571077wrx.9
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NyOzJo6HdhqirSo4FTNN+HWWChIIYH9S1hj1nxz1Els=;
	b=emaPeNzZfiytvchph1Vs4rV0jasLnMCz6Otco+zPhu8DUgwpls2bYG/kT3lx72wYme
	O3sceL8DhdZAM5NH4XLjCOAzNE6POmWlzSNyINL7L8hYBzSt3bIFFoV16Tiiv+pfVKOx
	76I+JzpWLzw0yZKrlK29K4t/N9E7OeyKAqr0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NyOzJo6HdhqirSo4FTNN+HWWChIIYH9S1hj1nxz1Els=;
	b=gIk7UVYMxKv9JZaaCmNS5J7+cLygzxa5jChMOEM9jmXdHwLm2fAjwSmYvP3eDskqLR
	whxym9NlD/cvAITptvxHBNqJVpI1Fhl6PdjMbcJE9UWLonDF7g11oZiPpC0eE6H1xQjz
	+Bj34IwF7sbhdbseaL2EZuZFThDhwEWQes883kbfciiTvu/bW2dRfBninDqmIH4j7Yfv
	C6iNF0BcTr661PTQ2ufd/xfaDLXq0QPYwzERx67DC0wvTYAZS37Fxw0mCfKOSf/VhMU5
	eQo8G2scNs1hMFy2Wf4wI1gkohqX+YGi2cXiO+AgQDhkmVzmHIkPJ8Uj18eV0hAh+pM8
	Ah2w==
X-Gm-Message-State: AJcUukfXA3MnIi7i5lpkaZ5T8d+AwHlB0yg6cHlEILsTN8dhwS1pH+ke
	b17JCIc9fre+jS1vaah3ZkWFITRGyAcwbA==
X-Received: by 2002:a5d:678b:: with SMTP id v11mr31458990wru.245.1548096689601;
	Mon, 21 Jan 2019 10:51:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:03 +0000
Message-Id: <20190121185118.18550-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH 08/23] hw/misc/iotkit-secctl: Support 4
 internal MPCs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CcP2NaV0iL4u

The SSE-200 has 4 banks of SRAM, each with its own internal
Memory Protection Controller. The interrupt status for these
extra MPCs appears in the same security controller SECMPCINTSTATUS
register as the MPC for the IoTKit's single SRAM bank. Enhance the
iotkit-secctl device to allow 4 MPCs. (If the particular IoTKit/SSE
variant in use does not have all 4 MPCs then the unused inputs will
simply result in the SECMPCINTSTATUS bits being zero as required.)

The hardcoded constant "1"s in armsse.c indicate the actual number
of SRAM MPCs the IoTKit has, and will be replaced in the following
commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-secctl.h | 6 +++---
 hw/arm/armsse.c                 | 6 +++---
 hw/misc/iotkit-secctl.c         | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index 1a193b306f1..bcb0437be5b 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -40,8 +40,8 @@
  *  + named GPIO outputs ahb_ppcexp{0,1,2,3}_irq_enable
  *  + named GPIO outputs ahb_ppcexp{0,1,2,3}_irq_clear
  *  + named GPIO inputs ahb_ppcexp{0,1,2,3}_irq_status
- * Controlling the MPC in the IoTKit:
- *  + named GPIO input mpc_status
+ * Controlling the (up to) 4 MPCs in the IoTKit/SSE:
+ *  + named GPIO inputs mpc_status[0..3]
  * Controlling each of the 16 expansion MPCs which a system using the IoTKit
  * might provide:
  *  + named GPIO inputs mpcexp_status[0..15]
@@ -67,7 +67,7 @@
 #define IOTS_NUM_APB_EXP_PPC 4
 #define IOTS_NUM_AHB_EXP_PPC 4
 #define IOTS_NUM_EXP_MPC 16
-#define IOTS_NUM_MPC 1
+#define IOTS_NUM_MPC 4
 #define IOTS_NUM_EXP_MSC 16
 
 typedef struct IoTKitSecCtl IoTKitSecCtl;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 8554be14128..074c1d3a6cf 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -138,7 +138,7 @@ static void armsse_init(Object *obj)
                             sizeof(s->mpc_irq_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
 
-    for (i = 0; i < ARRAY_SIZE(s->mpc_irq_splitter); i++) {
+    for (i = 0; i < IOTS_NUM_EXP_MPC + 1; i++) {
         char *name = g_strdup_printf("mpc-irq-splitter-%d", i);
         SplitIRQ *splitter = &s->mpc_irq_splitter[i];
 
@@ -363,7 +363,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
 
     /* We must OR together lines from the MPC splitters to go to the NVIC */
     object_property_set_int(OBJECT(&s->mpc_irq_orgate),
-                            IOTS_NUM_EXP_MPC + IOTS_NUM_MPC, "num-lines", &err);
+                            IOTS_NUM_EXP_MPC + 1, "num-lines", &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -636,7 +636,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     /* Wire up the splitters for the MPC IRQs */
-    for (i = 0; i < IOTS_NUM_EXP_MPC + IOTS_NUM_MPC; i++) {
+    for (i = 0; i < IOTS_NUM_EXP_MPC + 1; i++) {
         SplitIRQ *splitter = &s->mpc_irq_splitter[i];
         DeviceState *dev_splitter = DEVICE(splitter);
 
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 2222b3e147d..537601cd53f 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -600,7 +600,7 @@ static void iotkit_secctl_mpc_status(void *opaque, int n, int level)
 {
     IoTKitSecCtl *s = IOTKIT_SECCTL(opaque);
 
-    s->mpcintstatus = deposit32(s->mpcintstatus, 0, 1, !!level);
+    s->mpcintstatus = deposit32(s->mpcintstatus, n, 1, !!level);
 }
 
 static void iotkit_secctl_mpcexp_status(void *opaque, int n, int level)
@@ -686,7 +686,8 @@ static void iotkit_secctl_init(Object *obj)
     qdev_init_gpio_out_named(dev, &s->sec_resp_cfg, "sec_resp_cfg", 1);
     qdev_init_gpio_out_named(dev, &s->nsc_cfg_irq, "nsc_cfg", 1);
 
-    qdev_init_gpio_in_named(dev, iotkit_secctl_mpc_status, "mpc_status", 1);
+    qdev_init_gpio_in_named(dev, iotkit_secctl_mpc_status, "mpc_status",
+                            IOTS_NUM_MPC);
     qdev_init_gpio_in_named(dev, iotkit_secctl_mpcexp_status,
                             "mpcexp_status", IOTS_NUM_EXP_MPC);
 
-- 
2.20.1

