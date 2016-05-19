Received: by 10.25.208.137 with SMTP id h131csp3298308lfg;
        Thu, 19 May 2016 15:54:41 -0700 (PDT)
X-Received: by 10.140.132.73 with SMTP id 70mr17431872qhe.42.1463698481222;
        Thu, 19 May 2016 15:54:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si15042654qge.57.2016.05.19.15.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 15:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Wq0-0008V3-MN
	for alex.bennee@linaro.org; Thu, 19 May 2016 18:54:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpv-0008Sw-Bv
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpu-0007Hx-C1
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:35 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b3Wpj-0007FR-MA; Thu, 19 May 2016 18:54:23 -0400
Received: by mail-wm0-x241.google.com with SMTP id n129so24860573wmn.1;
	Thu, 19 May 2016 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LjSauutcpT4C8kCDw9utt1h5dl24a7JJRJgl/PSGf3s=;
	b=S3LNTxrmrewUvj4gPHIAdBmM6azduT0IF+JLH3gfW3ozp+18A2ACfhWt/gNLzAzrS5
	fwAAv4OmbnjIu6l3JghCiVsHwZrcEQRYj/L4tmA2B0u6YqM7J8FV/Y3GvKWtYqtl1wiS
	fD6C075egsGn2U/9fhVE11hDZAnzXONwLIgunnyWAXpIHJdnyDCSAYh1k3RWOYYnPCBQ
	gHwEwZquFs1ug1bzMgSJiLeJqQU1jRa9xenmcCcC8c7YRci4ASdNdJY1lhsr/cm35oJi
	+TEKQPmI/eKfE8kD7FzCTvYAqu/i5Q7Ux4Z3mt2a1uOd27gG3c9VyIXpLqZLS7da5Aog
	vdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LjSauutcpT4C8kCDw9utt1h5dl24a7JJRJgl/PSGf3s=;
	b=DI6sAAP94wG7YH4K1pbwrIJqOndCFbN8WLvpMgOvc/g6iSGWDbLFGVt100GCbRewAU
	tQGb1iC+B/Ijdq5NPY3O9XbEPPiJkHDnFwedKNhAc96LoQIUV9KKWGC2Hx/5ZcIkrzUf
	ceGaYqfCG72jfsi0gHOTJ1dqBm+74F0RPXnYM2F5Qkd+umxJz60VemMqvnGr+5JJRWkN
	/uuhbUlzvc5itMmKQ+yHZKaoTBG82jWRF0Hi4qOM0tM3oEpfCY4wKa22ou1ju13VfAZf
	P7a3XW8aUsNSEDkTvlPXUXJs7KUks2wcy21RYP33Qnv5Rc8xRyA6myPmjCYnFvQ5l5mw
	z3Zw==
X-Gm-Message-State: AOPr4FUtd0/mejczy1szDUQPZxUoQFOyeAsGpW0X/m7BaEYxSCKnGsL5H4H3loGNT/+nVg==
X-Received: by 10.28.57.137 with SMTP id g131mr224275wma.5.1463698462924;
	Thu, 19 May 2016 15:54:22 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 63sm1538898wmz.5.2016.05.19.15.54.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 15:54:22 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2016 00:54:15 +0200
Message-Id: <1463698459-31312-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-arm] [PATCH v1 1/5] xlnx-zynqmp: Add a secure prop to
 en/disable ARM Security Extensions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7hOif9PmBr+F

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a secure prop to en/disable ARM Security Extensions.
This is particulary useful for KVM runs.

Default to disabled to match the behavior of KVM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 3 +++
 include/hw/arm/xlnx-zynqmp.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 4d504da..965a250 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -238,6 +238,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
         g_free(name);
 
+        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
+                                 s->secure, "has_el3", NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
                                 "reset-cbar", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
@@ -370,6 +372,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
 static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
+    DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 2332596..38d4c8c 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -84,6 +84,9 @@ typedef struct XlnxZynqMPState {
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
+
+    /* Has the ARM Security extensions?  */
+    bool secure;
 }  XlnxZynqMPState;
 
 #define XLNX_ZYNQMP_H
-- 
2.5.0

