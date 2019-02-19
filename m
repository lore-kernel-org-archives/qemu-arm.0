Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3379486wrx;
        Tue, 19 Feb 2019 05:02:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY8pf0fEUBSmxzEIUhXFImz/84ftPfJqRt4SDERp+RPmmQ5/qCKTYbYnWvbSWuAVZd5aI8K
X-Received: by 2002:a25:8882:: with SMTP id d2mr22866171ybl.381.1550581365663;
        Tue, 19 Feb 2019 05:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581365; cv=none;
        d=google.com; s=arc-20160816;
        b=Sr/RHfMPc4hmNoE6LFJfWaP8wFV1RSa6VOuj+ZpMa2Jpdv9IMp6GtoE4gfcoGKK5jM
         ba04cEVpzPsVLS0xpoVeIKbFyMCyrfHcs229OC5w1PYYkq1NNAwm+LVWVvYtnk2IqOdp
         l5EOoIA/iWL+SFjsofUCWWS/ePt7n+m4b0+frDSHyAzsEUe/+ZrkWqTELvsfELXUO/CV
         oPkOV3saIG3Xf2YiOKP4PYOUDPR6YgPCfAlx39BRuXAVFYgnn4U+ZPb3pv/Vc093byj2
         R3Q+KPFEVe+DdRpJn4rrDe4fEpHG1/lKSdRdspWtG/VVW9qmgbcWOM8RXjYL6iClAyDP
         3V2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CskMvrDB6k+X6606gwOi32bS+lwdD+6mC4UiTntWILM=;
        b=BMBgUQvJY8S7jl+c88frX9GJAYmE3n97Qa+zL5WgDI48D/M/ZNXxfMAC7Tkurj2ahd
         XsXvuw93/lY6C99r3B6KnZwHj8jjvlc3Crzjr+0T1g+UQCk2w+OIkltB6YR+LQ8Rfikh
         C0klBOeUwGos8QYeHgSQcejcMHdyymke2ftN4dLR1YrSPAT9DV3V6otG3+gXQQu7aYz1
         uB4HF9Zk1vrJ6yXmM3pDXH8amF9QO7UYUwl/FhCmY6YF8F9JQ5Fu8zLfyUoD/2oSm+Yf
         a4n1MlHI81OsKG8BQVfksUjfOnKLhrNjlTWR+ZiXs8oDioiEmnyRrB+onAbtR9hFTkzY
         k3SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TDXoa5Mk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si8930256ywa.223.2019.02.19.05.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 05:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TDXoa5Mk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw52r-0005S7-4K
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 08:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yn-0001uj-I6
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yj-0002uU-Sy
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:32 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4yh-0002rB-A2
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:27 -0500
Received: by mail-wr1-x443.google.com with SMTP id t18so21926519wrx.2
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 04:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CskMvrDB6k+X6606gwOi32bS+lwdD+6mC4UiTntWILM=;
	b=TDXoa5Mk+X1ggmu0Exz8Bf9dMBYY60wSaEKxvzObfmU4Z7YhOHRrRK33LYcec8W2Bn
	7vPiuyfiJF3H5hcV3aHgd3AGxxrNcgdxbya9c7maIBNEh3mn3ftGXCacsVQb4/YOkAVr
	2Rl03hEf3jsv6t5trKxoDElMgoK6hmtWOy6XtpxW8I4CllQ1YH/bDJR+RM1xR9gvgjq0
	NdpB4tAYgczPKERq98EAXC5rd4RP6MMWSazLtPZUtdYNgILmRUY5txlxCzlYMw1RSFk3
	ItfdIA+APTxFgTMzrmBmlZRDOUUzKsJ8bBA7XA4TrGHcPb+d+PDKZu0fxJXguWSh0yw6
	k1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CskMvrDB6k+X6606gwOi32bS+lwdD+6mC4UiTntWILM=;
	b=R/VxNlxC2NzpRm/Y1CMBIanykR71G3vKczqdkEjQMsoNiwVWtM0eByHyTSUfF6tuAH
	R+VMK/hx7cUWje03sD89clWT+aqCGF+J7xYpAMpFyL/PriIbLNpJHRQd0xZFaYLAmklk
	Etgex3odSizhIxFFWH7MRENcQEpqcFUP+Wny8MgTZwephMgRMYg99c0Z/PavQTOMjH9N
	kSNl7u6ClJUFUTrismUocj7woJAlOuqQ5KUDDLHCP5Et51DJHmVrqWkl+3hJQYIzp8Qh
	S1S8glccM7rzrmFyXy9eJiul9xuNNem48t62FZ1SJcNczhGuiokSQa56YjwQ0ehMDEc7
	65hA==
X-Gm-Message-State: AHQUAuaixbixD0TCymHyWeoN/1MJJxAzncfSKuM/pMxfS4GxGH4NHDXY
	CYthYSX1ELOq/P7yaYeC3tBIP/ZuvYz9Rw==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr20066773wrn.290.1550581099459;
	Tue, 19 Feb 2019 04:58:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:06 +0000
Message-Id: <20190219125808.25174-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219125808.25174-1-peter.maydell@linaro.org>
References: <20190219125808.25174-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 6/8] hw/arm/iotkit-sysctl: Add SSE-200 registers
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNIl4l5Fj/b9

The SYSCTL block in the SSE-200 has some extra registers that
are not present in the IoTKit version. Add these registers
(as reads-as-written stubs), enabled by a new QOM property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysctl.h |  20 +++
 hw/arm/armsse.c                 |   2 +
 hw/misc/iotkit-sysctl.c         | 245 +++++++++++++++++++++++++++++++-
 3 files changed, 262 insertions(+), 5 deletions(-)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 17a145517a4..9c2f23ecd28 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -17,6 +17,9 @@
  * "system control register" blocks.
  *
  * QEMU interface:
+ *  + QOM property "SYS_VERSION": value of the SYS_VERSION register of the
+ *    system information block of the SSE
+ *    (used to identify whether to provide SSE-200-only registers)
  *  + sysbus MMIO region 0: the system information register bank
  *  + sysbus MMIO region 1: the system control register bank
  */
@@ -44,6 +47,23 @@ typedef struct IoTKitSysCtl {
     uint32_t initsvtor0;
     uint32_t cpuwait;
     uint32_t wicctrl;
+    uint32_t scsecctrl;
+    uint32_t fclk_div;
+    uint32_t sysclk_div;
+    uint32_t clock_force;
+    uint32_t initsvtor1;
+    uint32_t nmi_enable;
+    uint32_t ewctrl;
+    uint32_t pdcm_pd_sys_sense;
+    uint32_t pdcm_pd_sram0_sense;
+    uint32_t pdcm_pd_sram1_sense;
+    uint32_t pdcm_pd_sram2_sense;
+    uint32_t pdcm_pd_sram3_sense;
+
+    /* Properties */
+    uint32_t sys_version;
+
+    bool is_sse200;
 } IoTKitSysCtl;
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 5768d6fbf8b..7c946564ebc 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -997,6 +997,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     /* System information registers */
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
+    object_property_set_int(OBJECT(&s->sysctl), info->sys_version,
+                            "SYS_VERSION", &err);
     object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 8c85aea9309..05606017fc2 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "trace.h"
 #include "qapi/error.h"
@@ -28,15 +29,26 @@
 REG32(SECDBGSTAT, 0x0)
 REG32(SECDBGSET, 0x4)
 REG32(SECDBGCLR, 0x8)
+REG32(SCSECCTRL, 0xc)
+REG32(FCLK_DIV, 0x10)
+REG32(SYSCLK_DIV, 0x14)
+REG32(CLOCK_FORCE, 0x18)
 REG32(RESET_SYNDROME, 0x100)
 REG32(RESET_MASK, 0x104)
 REG32(SWRESET, 0x108)
     FIELD(SWRESET, SWRESETREQ, 9, 1)
 REG32(GRETREG, 0x10c)
 REG32(INITSVTOR0, 0x110)
+REG32(INITSVTOR1, 0x114)
 REG32(CPUWAIT, 0x118)
-REG32(BUSWAIT, 0x11c)
+REG32(NMI_ENABLE, 0x11c) /* BUSWAIT in IoTKit */
 REG32(WICCTRL, 0x120)
+REG32(EWCTRL, 0x124)
+REG32(PDCM_PD_SYS_SENSE, 0x200)
+REG32(PDCM_PD_SRAM0_SENSE, 0x20c)
+REG32(PDCM_PD_SRAM1_SENSE, 0x210)
+REG32(PDCM_PD_SRAM2_SENSE, 0x214)
+REG32(PDCM_PD_SRAM3_SENSE, 0x218)
 REG32(PID4, 0xfd0)
 REG32(PID5, 0xfd4)
 REG32(PID6, 0xfd8)
@@ -67,6 +79,30 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
     case A_SECDBGSTAT:
         r = s->secure_debug;
         break;
+    case A_SCSECCTRL:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->scsecctrl;
+        break;
+    case A_FCLK_DIV:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->fclk_div;
+        break;
+    case A_SYSCLK_DIV:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->sysclk_div;
+        break;
+    case A_CLOCK_FORCE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->clock_force;
+        break;
     case A_RESET_SYNDROME:
         r = s->reset_syndrome;
         break;
@@ -79,16 +115,62 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
     case A_INITSVTOR0:
         r = s->initsvtor0;
         break;
+    case A_INITSVTOR1:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->initsvtor1;
+        break;
     case A_CPUWAIT:
         r = s->cpuwait;
         break;
-    case A_BUSWAIT:
-        /* In IoTKit BUSWAIT is reserved, R/O, zero */
-        r = 0;
+    case A_NMI_ENABLE:
+        /* In IoTKit this is named BUSWAIT but is marked reserved, R/O, zero */
+        if (!s->is_sse200) {
+            r = 0;
+            break;
+        }
+        r = s->nmi_enable;
         break;
     case A_WICCTRL:
         r = s->wicctrl;
         break;
+    case A_EWCTRL:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->ewctrl;
+        break;
+    case A_PDCM_PD_SYS_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->pdcm_pd_sys_sense;
+        break;
+    case A_PDCM_PD_SRAM0_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->pdcm_pd_sram0_sense;
+        break;
+    case A_PDCM_PD_SRAM1_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->pdcm_pd_sram1_sense;
+        break;
+    case A_PDCM_PD_SRAM2_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->pdcm_pd_sram2_sense;
+        break;
+    case A_PDCM_PD_SRAM3_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        r = s->pdcm_pd_sram3_sense;
+        break;
     case A_PID4 ... A_CID3:
         r = sysctl_id[(offset - A_PID4) / 4];
         break;
@@ -101,6 +183,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         r = 0;
         break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SysCtl read: bad offset %x\n", (int)offset);
         r = 0;
@@ -172,14 +255,105 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
-    case A_BUSWAIT:        /* In IoTKit BUSWAIT is reserved, R/O, zero */
+    case A_SCSECCTRL:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
+        s->scsecctrl = value;
+        break;
+    case A_FCLK_DIV:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
+        s->fclk_div = value;
+        break;
+    case A_SYSCLK_DIV:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
+        s->sysclk_div = value;
+        break;
+    case A_CLOCK_FORCE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
+        s->clock_force = value;
+        break;
+    case A_INITSVTOR1:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl INITSVTOR1 unimplemented\n");
+        s->initsvtor1 = value;
+        break;
+    case A_EWCTRL:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl EWCTRL unimplemented\n");
+        s->ewctrl = value;
+        break;
+    case A_PDCM_PD_SYS_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
+        s->pdcm_pd_sys_sense = value;
+        break;
+    case A_PDCM_PD_SRAM0_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
+        s->pdcm_pd_sram0_sense = value;
+        break;
+    case A_PDCM_PD_SRAM1_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
+        s->pdcm_pd_sram1_sense = value;
+        break;
+    case A_PDCM_PD_SRAM2_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SysCtl PDCM_PD_SRAM2_SENSE unimplemented\n");
+        s->pdcm_pd_sram2_sense = value;
+        break;
+    case A_PDCM_PD_SRAM3_SENSE:
+        if (!s->is_sse200) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SysCtl PDCM_PD_SRAM3_SENSE unimplemented\n");
+        s->pdcm_pd_sram3_sense = value;
+        break;
+    case A_NMI_ENABLE:
+        /* In IoTKit this is BUSWAIT: reserved, R/O, zero */
+        if (!s->is_sse200) {
+            goto ro_offset;
+        }
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
+        s->nmi_enable = value;
+        break;
     case A_SECDBGSTAT:
     case A_PID4 ... A_CID3:
+    ro_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SysCtl write: write of RO offset %x\n",
                       (int)offset);
         break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SysCtl write: bad offset %x\n", (int)offset);
         break;
@@ -207,8 +381,20 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->reset_mask = 0;
     s->gretreg = 0;
     s->initsvtor0 = 0x10000000;
+    s->initsvtor1 = 0x10000000;
     s->cpuwait = 0;
     s->wicctrl = 0;
+    s->scsecctrl = 0;
+    s->fclk_div = 0;
+    s->sysclk_div = 0;
+    s->clock_force = 0;
+    s->nmi_enable = 0;
+    s->ewctrl = 0;
+    s->pdcm_pd_sys_sense = 0x7f;
+    s->pdcm_pd_sram0_sense = 0;
+    s->pdcm_pd_sram1_sense = 0;
+    s->pdcm_pd_sram2_sense = 0;
+    s->pdcm_pd_sram3_sense = 0;
 }
 
 static void iotkit_sysctl_init(Object *obj)
@@ -221,6 +407,44 @@ static void iotkit_sysctl_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
+{
+    IoTKitSysCtl *s = IOTKIT_SYSCTL(dev);
+
+    /* The top 4 bits of the SYS_VERSION register tell us if we're an SSE-200 */
+    if (extract32(s->sys_version, 28, 4) == 2) {
+        s->is_sse200 = true;
+    }
+}
+
+static bool sse200_needed(void *opaque)
+{
+    IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
+
+    return s->is_sse200;
+}
+
+static const VMStateDescription iotkit_sysctl_sse200_vmstate = {
+    .name = "iotkit-sysctl/sse-200",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = sse200_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(scsecctrl, IoTKitSysCtl),
+        VMSTATE_UINT32(fclk_div, IoTKitSysCtl),
+        VMSTATE_UINT32(sysclk_div, IoTKitSysCtl),
+        VMSTATE_UINT32(clock_force, IoTKitSysCtl),
+        VMSTATE_UINT32(initsvtor1, IoTKitSysCtl),
+        VMSTATE_UINT32(nmi_enable, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_sys_sense, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_sram0_sense, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_sram1_sense, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_sram2_sense, IoTKitSysCtl),
+        VMSTATE_UINT32(pdcm_pd_sram3_sense, IoTKitSysCtl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription iotkit_sysctl_vmstate = {
     .name = "iotkit-sysctl",
     .version_id = 1,
@@ -234,15 +458,26 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
         VMSTATE_UINT32(cpuwait, IoTKitSysCtl),
         VMSTATE_UINT32(wicctrl, IoTKitSysCtl),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &iotkit_sysctl_sse200_vmstate,
+        NULL
     }
 };
 
+static Property iotkit_sysctl_props[] = {
+    DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysCtl, sys_version, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void iotkit_sysctl_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &iotkit_sysctl_vmstate;
     dc->reset = iotkit_sysctl_reset;
+    dc->props = iotkit_sysctl_props;
+    dc->realize = iotkit_sysctl_realize;
 }
 
 static const TypeInfo iotkit_sysctl_info = {
-- 
2.20.1

