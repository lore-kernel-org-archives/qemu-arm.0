Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2204696lfo;
        Fri, 5 Feb 2021 09:33:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe91uE0EsyFPJ/Kzm2bayJuz6Ws3mdyTNgR7p2aYN/D7Kz2pETu3uETXLFpIjzQ4/tM8Vo
X-Received: by 2002:a25:7dc4:: with SMTP id y187mr7989391ybc.477.1612546403710;
        Fri, 05 Feb 2021 09:33:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612546403; cv=none;
        d=google.com; s=arc-20160816;
        b=weR1Snd5iqLQeKCMeCmuciQ5X+MEdnInm8sAWdDeAUWSBWumR0CSB9qvAFBd+hhUad
         r5k7leON1G+PYlLriNixylA8LCyWZGWzUL0IrD75KCL9BmExsCuinQQxmobRjeUIQUV8
         Xa412mzJnHrtRfNU1us8s/NW2xWmOHOmAPAlKF1jrPvxtt6ItvpLDOOtx+hwMQtTzMW9
         YTI9KhGQHETpdB4v6VG4IT1g0bzPKRKui6eeJsR/nQcejipL98kVXLRbHgM7jbqdZPuP
         rRn16PPoFI5ePJGevp9F71UTo0oYqZ9UF9l7fLeV8SZb9Y/o4XUicHa7NNanLFYhi0fg
         dfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/pIYyrQAv+HRu+fw0UlomO31PGq1UabPbDOzFOgakDc=;
        b=FeMKLwhwbMcjHs629sFUU0UNJPjKe8VmUd+0qKMQn2XYAKUxYijRoGieZEIdPJxzec
         iYNcOpk03C5nlK7PIUZJxEi7+X6Q3zgBDLtv1UcG5sLrpEXG4b/z/aok+oxy1lqShUkh
         RE7H0tOvKpXBur6iDlXKyjEEHj+7LHdY1XYk0lbkHoAVGNFO2OR4fSBh+tFxxnkRPUGH
         oFWCJnfBNGXBAlKimp4DCYN3uudR1562tWqYcYhQlDnTUNiz69Xna+0fYNmsZs8hC/kN
         0v8x4Z1Cl7hPgtXlpQ8LiRuxKuW0+ZlKv6/pUPwERdkVZGVxwK2MRnRoImDUoLKDp+Gr
         vwuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MK10JLpR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z95si10939670ybh.58.2021.02.05.09.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:33:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MK10JLpR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l84yv-00058f-8C
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tj-0006qu-Ba
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TE-00044D-It
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so8520133wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/pIYyrQAv+HRu+fw0UlomO31PGq1UabPbDOzFOgakDc=;
 b=MK10JLpRkXTWAjzzzvBWqfaxpRjnCCYTehD/8tH3A07sMe1KidehC5uK8GEfH2Bk6a
 m39fBD7bnuEF7gwtSxnn1gPTiOdGIN1m6U5ILwUBnFq9ivq6EEF1j3T+RvZxR5LWiocz
 9o7biyuN3Mh/ygRm/Yf23v46onUq/w+sTaUJSq6z7dKKQ3yEkvKmdAGoIBKqeEsPvPFi
 ipuUAbDvO2lgXESbZDjwdi6bDZ8yLTEWSTRaDFNYoqMiMSqrkZWzbnY/g4k4u6qXJqbT
 12m+/GVHU+lQuZhYlOHoDuO1zNqs9ag+3ZduSCPgUCjIkkd8f6R5RUkbjGe1Hlh7NXaR
 EZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/pIYyrQAv+HRu+fw0UlomO31PGq1UabPbDOzFOgakDc=;
 b=dM1S8fcTm5iJqe0YskIp3cEob+yrcmC9izXDUpDT6pEyzYjf+gsgTsbw0qe29bh3Xk
 k3wjgyw1SUduCIL9Vx96k5c1147r6XrGEDylDG8/Ovf/hWjNLyuOu9N8N/+ScsYCK/B4
 edJ8s1G8ptoEjNBlWi3MsYOJpYpkydc13ihpajlUpEOavEI+S8JZ1N+o9xNA8UTjB+aD
 vaygcaG17aGwqD2n2tZz9xeNdDnNebqYAezkAfTM3EQ7AyCriR/D4Ngaou5Q3Eu4LbcA
 KF00qKO/tNLaoBzC8zKDjJXcln/JaPVWv+LISfKjGyFBuzov1sMmHjyT6NF9bCS4asqQ
 IG8w==
X-Gm-Message-State: AOAM532zum2/uQZ8fLTCE6YEOg+ZOg5RBMoP2q6qZL6FnbmQiMVey5eP
 FkN1n+ixG0nTv2U7KX/JChZ4JbRXhD8Ogg==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr6115023wrn.400.1612544431612; 
 Fri, 05 Feb 2021 09:00:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/24] hw/arm/mps2-tz: Allow PPCPortInfo structures to specify
 device interrupts
Date: Fri,  5 Feb 2021 17:00:07 +0000
Message-Id: <20210205170019.25319-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4JWkELzMX1N4

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
index 844092f4fd5..0c75b2230ed 100644
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

