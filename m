Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5450225wrm;
        Tue, 8 Oct 2019 10:35:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3bwfIAv+a8Jo9G+AUv9nrkZ5U9Axdw5MxNm6wYyybEHvSRJbstWax7Xlt1v9x6MtqLwYq
X-Received: by 2002:a17:906:1007:: with SMTP id 7mr4250393ejm.149.1570556128599;
        Tue, 08 Oct 2019 10:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570556128; cv=none;
        d=google.com; s=arc-20160816;
        b=EGaYfmcwIuXlsmtOkyJp5c9IHImLhRoQRkaqQJ0QOa35IYo/NFzvQgniPI0T+Bx+Zm
         rj1XTvhQ6qwmjhgbSlb+4uLUCka9eBkFPh0yzMV+FPGeY0pziAv1nwj3R5/DvGvE79yq
         BJjjbvkyxt+HLrdiEeCfG+V8ZXfACbzSynrRiSlZPh6acq3C+vbB7+SYz6ALSv8ou0wG
         wwuHsS7hxTV9+HuXxgUXgp3elmoP0CBpeOrEXbc7Up0z6NCG1m9987LMLDHfvV9e3O2y
         KzRynWOvVSzqJERAIwhRnvo4DKiBV6grUc+e1ZXK181n+ZBur+nff4sjZd9QRNC3fLwK
         b0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IKaS8RTHBXtjU4umm9TxJgozBl5pnbt1z64JULe41fo=;
        b=CMBuNfM2EHjmgwOl/SYIei118w3SHeoofWPu7xKmTUf1i7JsWFlbimeFor7mJp3Qmv
         HohPXAERGfhzq6YWYybRDIuVWUSqD4eJaCWSYVrKjw62zCyl5KLoCf7MwVNNDEjbfIpz
         yeM9QPJXl/m1P0x/sUXwhSCW4r7tZYV6BjEoxhMUJ2+hIhVc97pqURbawepjfUmkAc+M
         IZBEc83mKhoAexewBe91EO+JxSXQc5ex3n47+CDU+P246kGeknqMDSVKThBSkx2zUaRP
         5xq7Fn0qghUdhf/iYjEaSsxFWl1h98WSnfxoauW2HRYI0mMfE81BcDZai0cgE1KCRWr0
         KVAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Csx+4V13;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si1059615ejw.208.2019.10.08.10.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Csx+4V13;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtOQ-00050P-Ih
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7g-0006qG-47
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7e-0002PX-7e
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:18:07 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40683)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7d-0002PA-VU
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:18:06 -0400
Received: by mail-wm1-x344.google.com with SMTP id b24so3925283wmj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKaS8RTHBXtjU4umm9TxJgozBl5pnbt1z64JULe41fo=;
 b=Csx+4V13gC3qgDV0eLlT1+8TisjHqgVTeDPEunDMr3qWRh8glQcAJirAXo1X+x7f7z
 cpTFMeqhvWwonHa4xWTNFzNghuFVIgra+5m9MyEvIgJRmQF0AbpKHfPCinAao9F2X8lO
 G0f0u3bsukY0VwBRL6tFA74VHqgcwb5d8nMlmqsf7kA6PMgpZ8Ms5SCKARzAfz6gk2Nk
 MlpLKg7I9Klo5FXiJ60DR4NWMl7OUXwBlLv8avu5mjuWC1jH+EpkAy6r/8fEIX94jIAH
 m+TkvCbK8GrKQjoFu0ARnagwxZTigqZW6emqz5++4AYj9Y7aUbSe+HBFBb8jKxFyrsJn
 4ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKaS8RTHBXtjU4umm9TxJgozBl5pnbt1z64JULe41fo=;
 b=JiOfzKeYIgXIeHlm9MvflVMbGcu3OPOIAvdYKSfJxTqU/KL6GOzDOA3oClIC+0UxNT
 gsLGjZhWPFFIbPQqANgyWGYR5KUYh1hnpwi8zXWjAsEFkAoOWh7Cw2O6e9WODt/RbzAm
 A8uG94zXDdC9rBfrq/URWLYnxeUoTreG5oGDf0VS4ZXShnnXIVENOG3zeEktj+3dAfWf
 rZvx5hyZVcW7ndk1/0hr9n+dMA5tan1lW6tfDojjdII3/YM+3NSkd/rZdGBFpQWEZXXO
 zfzYyet8CsEIR507ydjJiafl6UeKbtE0TehHMyikRk2ffY8xG7JeDUiCPJFGQXCmn53V
 m4AQ==
X-Gm-Message-State: APjAAAW61pGPRkWN0VT7Jl2GvvMeq7TRqNXhu670EUzoK4JGchErxkQj
 1wWdayQx0+szttNTEtwDZt8LDw==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr4976166wmk.25.1570555084986; 
 Tue, 08 Oct 2019 10:18:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:18:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/21] hw/timer/imx_epit.c: Switch to transaction-based
 ptimer API
Date: Tue,  8 Oct 2019 18:17:36 +0100
Message-Id: <20191008171740.9679-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3IuM7NUR2zNv

Switch the imx_epit.c code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 39810ac8b03..baf6338e1a6 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -17,7 +17,6 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/misc/imx_ccm.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
 
@@ -74,6 +73,10 @@ static void imx_epit_update_int(IMXEPITState *s)
     }
 }
 
+/*
+ * Must be called from within a ptimer_transaction_begin/commit block
+ * for both s->timer_cmp and s->timer_reload.
+ */
 static void imx_epit_set_freq(IMXEPITState *s)
 {
     uint32_t clksrc;
@@ -105,6 +108,8 @@ static void imx_epit_reset(DeviceState *dev)
     s->lr = EPIT_TIMER_MAX;
     s->cmp = 0;
     s->cnt = 0;
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
     /* stop both timers */
     ptimer_stop(s->timer_cmp);
     ptimer_stop(s->timer_reload);
@@ -117,6 +122,8 @@ static void imx_epit_reset(DeviceState *dev)
         /* if the timer is still enabled, restart it */
         ptimer_run(s->timer_reload, 0);
     }
+    ptimer_transaction_commit(s->timer_cmp);
+    ptimer_transaction_commit(s->timer_reload);
 }
 
 static uint32_t imx_epit_update_count(IMXEPITState *s)
@@ -164,6 +171,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
     return reg_value;
 }
 
+/* Must be called from ptimer_transaction_begin/commit block for s->timer_cmp */
 static void imx_epit_reload_compare_timer(IMXEPITState *s)
 {
     if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN))  {
@@ -191,6 +199,8 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset >> 2) {
     case 0: /* CR */
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
 
         oldcr = s->cr;
         s->cr = value & 0x03ffffff;
@@ -231,6 +241,9 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         } else {
             ptimer_stop(s->timer_cmp);
         }
+
+        ptimer_transaction_commit(s->timer_cmp);
+        ptimer_transaction_commit(s->timer_reload);
         break;
 
     case 1: /* SR - ACK*/
@@ -244,6 +257,8 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
     case 2: /* LR - set ticks */
         s->lr = value;
 
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
         if (s->cr & CR_RLD) {
             /* Also set the limit if the LRD bit is set */
             /* If IOVW bit is set then set the timer value */
@@ -255,12 +270,16 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         }
 
         imx_epit_reload_compare_timer(s);
+        ptimer_transaction_commit(s->timer_cmp);
+        ptimer_transaction_commit(s->timer_reload);
         break;
 
     case 3: /* CMP */
         s->cmp = value;
 
+        ptimer_transaction_begin(s->timer_cmp);
         imx_epit_reload_compare_timer(s);
+        ptimer_transaction_commit(s->timer_cmp);
 
         break;
 
@@ -281,6 +300,11 @@ static void imx_epit_cmp(void *opaque)
     imx_epit_update_int(s);
 }
 
+static void imx_epit_reload(void *opaque)
+{
+    /* No action required on rollover of timer_reload */
+}
+
 static const MemoryRegionOps imx_epit_ops = {
     .read = imx_epit_read,
     .write = imx_epit_write,
@@ -308,7 +332,6 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
 {
     IMXEPITState *s = IMX_EPIT(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    QEMUBH *bh;
 
     DPRINTF("\n");
 
@@ -317,10 +340,9 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
 
-    s->timer_reload = ptimer_init_with_bh(NULL, PTIMER_POLICY_DEFAULT);
+    s->timer_reload = ptimer_init(imx_epit_reload, s, PTIMER_POLICY_DEFAULT);
 
-    bh = qemu_bh_new(imx_epit_cmp, s);
-    s->timer_cmp = ptimer_init_with_bh(bh, PTIMER_POLICY_DEFAULT);
+    s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_DEFAULT);
 }
 
 static void imx_epit_class_init(ObjectClass *klass, void *data)
-- 
2.20.1

