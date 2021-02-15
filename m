Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5556213lfc;
        Mon, 15 Feb 2021 03:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE1NKPTi3ksF9vqY0QLlKI3NhS2tY8OxBJKQAEzXJQmGGCCY6l8Jx70mSgpkLY1RiCiRr/
X-Received: by 2002:a25:8146:: with SMTP id j6mr21849008ybm.380.1613390384135;
        Mon, 15 Feb 2021 03:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390384; cv=none;
        d=google.com; s=arc-20160816;
        b=ywjwc/O7SfYXqiKT5JgUnNkH0V/HVCZhFQSfhQ6++meuin6DGC0Tp7UCc/cEWiZcKv
         FDaLjZNNUJOVbipdVEd/L2Yod7FvN2Pid/TTsiVP6V88N6GXGTQ3bEudIj/AxWwP0Qs7
         IZaldBa0fam86XS67R940hDaQp+gVxCMKYYZ8iNiLc5Ojfjn79buYizl/lT/yNjX0cm0
         Sdi43D843q6UFGtFQsnKFjlYmR0+iUOOkuvk90vdYbNadSgOpKzI9AtSg8WRgBWOuWt7
         4XZWyAt6ruEgGs6oPthKugxemC9MH9datM0B6/JICCRiIt/RbLrsjS5DuGTvjlCVrAqd
         91VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2BF8LO9cNQ4akwkDY93h/rSr1/g9V8BvTXqt3kC/A3Q=;
        b=WBgO5BFb5Zg3my6B0jE/NGRHpe0L+aRAutNlHB2ZsJ4RUF902U0l38o2T29QQkAhXM
         EpScmQ+2gOKmW7HVYkaVsCvFv+bIOEg3aR29PJKTFXA3CfLNGb9ByoVgL1hLLpQ3mwAi
         rpsOvruzwh+Uz8fU566Nf6g/2zwQrVpot933OUz7Cy9zB/0Qr9PlI6OF0edSCVNRNMGi
         6SgqS0ozTrobHymjnEcfSJnoQ0tfJ8OA6GwmFA8HcUod8YwawR8XDfUL/iyXfu4YZzcB
         QljvLcRK+S7JtXGo5TOcOVQSrPGmujaEEENBrvWXoVMei5S05aU1ekbDkGYyi3Ni+mjG
         Jjmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+JVudyh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c67si16796042yba.427.2021.02.15.03.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+JVudyh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcXX-00014q-H6
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQb-0007os-V8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQa-00042S-2d
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n8so8477269wrm.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2BF8LO9cNQ4akwkDY93h/rSr1/g9V8BvTXqt3kC/A3Q=;
 b=A+JVudyhTK6Zk7cIJI7szYY653TWUCzrSa0Sr/LTbr9pC13but9HWrkliEAK27FQ0P
 4fozVogQp4inrXmtswQ/1mk7IV2YLLwFBvxXuuMj4XQ9yv7JCSlEuQ0/AHE8Yu6xfEuP
 4AYaJeXydD/WM/JF+INQjnfxIc1tiZoCjXdNG7PnW6u6SKgOZJsGUwRsoVruYxFRUKeX
 P1NP3PJ98sKxI1mNU/8bOBVkdmj6D7wXwmky9P3EMzsW0pFzW1lgn83rfcy5XI3EVPIe
 W1S0A/01iVj06U61bWY8bobtzTTAcOV2lXxRRymX17MKpL0YNOAKcm4Go1aPsnLijrRP
 +YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2BF8LO9cNQ4akwkDY93h/rSr1/g9V8BvTXqt3kC/A3Q=;
 b=FNU/7C2vbkMK7ZGluHp2a75CCHtY4rrbHQ8LnZsNUHqiSPtHTbAOsC/JrmUBWcDDC8
 MlY2ieXrx8xrhlrSIiBjaywaHXDJ5fze/9rleQaGp+TYN68aAyz/OKR3E8Tv1niOE9mm
 Ov02MpfyPwpRt5CaspJfJUafw27B2sxUx8HWIK3tP48rH/vfz7EoVddDw3HmLkd4nuNT
 H8xQtYX3bX+wRKJwLIjTaCyFu1BoeL/OoNf31PsSfSjj/8HmZHL384rQWlvf/AJo2rPJ
 VnCPq64GP8wut7yipc5aoMiwmcQ+sZG8ZB0XMuGIjbSZPrAKObaovRBdBcslSUZuHHQT
 4R8g==
X-Gm-Message-State: AOAM5331VS1kspNbaThkQ0YyPDV22buDmlASvgx+2EKB+T0LY55Z2wKv
 ADePY9JejWW1zjhzrwFT2tlebw==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr18641743wri.77.1613389950852; 
 Mon, 15 Feb 2021 03:52:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/24] hw/arm/mps2-tz: Allow PPCPortInfo structures to
 specify device interrupts
Date: Mon, 15 Feb 2021 11:51:26 +0000
Message-Id: <20210215115138.20465-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n2l9EJByGrK3

The mps2-tz code uses PPCPortInfo data structures to define what
devices are present and how they are wired up.  Currently we use
these to specify device types and addresses, but hard-code the
interrupt line wiring in each make_* helper function.  This works for
the two boards we have at the moment, but the AN524 has some devices
with different interrupt assignments.

This commit adds the framework to allow PPCPortInfo structures to
specify interrupt numbers.  We add an array of interrupt numbers to
the PPCPortInfo struct, and pass it through to the make_* helpers.
The following commit will change the make_* helpers over to using the
framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index ff8b7e5f1ae..085746ac3e6 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -170,7 +170,8 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
  * needs to be plugged into the downstream end of the PPC port.
  */
 typedef MemoryRegion *MakeDevFn(MPS2TZMachineState *mms, void *opaque,
-                                const char *name, hwaddr size);
+                                const char *name, hwaddr size,
+                                const int *irqs);
 
 typedef struct PPCPortInfo {
     const char *name;
@@ -178,6 +179,7 @@ typedef struct PPCPortInfo {
     void *opaque;
     hwaddr addr;
     hwaddr size;
+    int irqs[3]; /* currently no device needs more IRQ lines than this */
 } PPCPortInfo;
 
 typedef struct PPCInfo {
@@ -186,8 +188,9 @@ typedef struct PPCInfo {
 } PPCInfo;
 
 static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
-                                       void *opaque,
-                                       const char *name, hwaddr size)
+                                    void *opaque,
+                                    const char *name, hwaddr size,
+                                    const int *irqs)
 {
     /* Initialize, configure and realize a TYPE_UNIMPLEMENTED_DEVICE,
      * and return a pointer to its MemoryRegion.
@@ -202,7 +205,8 @@ static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
 }
 
 static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
-                               const char *name, hwaddr size)
+                               const char *name, hwaddr size,
+                               const int *irqs)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
@@ -227,7 +231,8 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     MPS2SCC *scc = opaque;
     DeviceState *sccdev;
@@ -249,7 +254,8 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
-                                 const char *name, hwaddr size)
+                                 const char *name, hwaddr size,
+                                 const int *irqs)
 {
     MPS2FPGAIO *fpgaio = opaque;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
@@ -262,7 +268,8 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
-                                  const char *name, hwaddr size)
+                                  const char *name, hwaddr size,
+                                  const int *irqs)
 {
     SysBusDevice *s;
     NICInfo *nd = &nd_table[0];
@@ -281,7 +288,8 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     TZMPC *mpc = opaque;
     int i = mpc - &mms->ssram_mpc[0];
@@ -318,7 +326,8 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     PL080State *dma = opaque;
     int i = dma - &mms->dma[0];
@@ -373,7 +382,8 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     /*
      * The AN505 has five PL022 SPI controllers.
@@ -395,7 +405,8 @@ static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
 }
 
 static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
-                              const char *name, hwaddr size)
+                              const char *name, hwaddr size,
+                              const int *irqs)
 {
     ArmSbconI2CState *i2c = opaque;
     SysBusDevice *s;
@@ -604,7 +615,8 @@ static void mps2tz_common_init(MachineState *machine)
                 continue;
             }
 
-            mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size);
+            mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size,
+                              pinfo->irqs);
             portname = g_strdup_printf("port[%d]", port);
             object_property_set_link(OBJECT(ppc), portname, OBJECT(mr),
                                      &error_fatal);
-- 
2.20.1

