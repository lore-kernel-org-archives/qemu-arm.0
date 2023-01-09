Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2291859ejc;
        Mon, 9 Jan 2023 06:20:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuT7xoHTdLIOrAQnVkdlqp5TKEO63Fkrigv5cWbO3yCFLmAc1OOKF2w28n6W719zMI1grey
X-Received: by 2002:a67:de83:0:b0:3ca:a9ef:43ee with SMTP id r3-20020a67de83000000b003caa9ef43eemr23317622vsk.5.1673274017087;
        Mon, 09 Jan 2023 06:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673274017; cv=none;
        d=google.com; s=arc-20160816;
        b=tVdTBrjghcGIQ3CfulrBgbSgCS+padJrLRNYBDZO9sr8SJt2ZeanMVXIVMb4aziV8z
         20z57X3XIB8Yz0VYaFv5jUslYUqnH8S/N36pEBTMYZrGAFm6/xyX9Til2B5pGx2byYzq
         8fUEfI+6eyImS2pDtL+8p8HbERlbRVdRPJtQcc6zDtb6KqD42RNzTH5DQWAL4zhrkxOH
         YD/EqQ4USFfdKD3qP8953+3LcXYTKrvcMgOpqTxv4BTh2jezfzlswoVXx7INf+CEYQ86
         UCP/bZm0N/lkQhD3fy0ru56SkOsQ60G0uel+jdZQqbOKgXQMh73Hlp4eXZkw6n5XX+q8
         VlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=at2rPrXos7OhXzrKy6FKQhkvRO9+YPfQmyazxY/f4vY=;
        b=CiozvndlGF1/gUuFcPzETI73ZpuUpkuzWaF9jTw/dHRrKhhOKt71jxCZ54zuHKajHh
         nYeKBOxlku6GYSmna3jZjW9OUPpWp8CvTgmGbwR6hv3vFh4dF5NEKCaSF2twNQLpn+kb
         yRieKKlviEbgitSSTtlmGGYDCJhrcPeu+HLJ+GtKNS/l+ElXgSgILpyzgwWC9LS0rWCC
         ukMM2Z1tChRhP6nmGn/pFL7D4aToUb8PZmp4ITiRb2FZ6svk6Mht8Kvcl0TTN+8ar+/B
         nbq0JF5ShakK8zLUFsRhSxFJb3RvuWlTJk/1KLP/TgC+mjgBuhoyJt/4U43D9IjrM+f9
         a97Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YbMvkcbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a37f90c000000b006fc2a75986csi4570147qkj.583.2023.01.09.06.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:20:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YbMvkcbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEskm-0001iF-N8; Mon, 09 Jan 2023 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskh-0001hL-Ls
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskf-0006Uu-Qd
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso9089812wms.5
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=at2rPrXos7OhXzrKy6FKQhkvRO9+YPfQmyazxY/f4vY=;
 b=YbMvkcbzDvBLuVCKjauNTN6m4KvgJHiESOqYR/LwgEt1KCh/FbhXTzJVGg83WuQ7U5
 CHGHbflZu7s4OgUis42rH2C2G/W/+Bv3KYw2tmV1qQHWIVL2bhSIIo1kwPshVGBi0GHq
 Y98Mhh0LOSzYjsWQrloHQxKV9WAQ0gR8wfQbGw2xVREbfGXSOpmF5poSnduLEtipSCCx
 xvpZcpAdZXMPW8HUgRgs0ahNsjnBFAh16pSXiPDojDjuFaHe/frGgw1Bzh1sulDnM6jf
 O6QARHLXgrBITxcXR02xTW6Qry/3uFyF4zhpGwsGGf/XwU2dSGEHUGm+x3POXZMkI0rb
 gOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=at2rPrXos7OhXzrKy6FKQhkvRO9+YPfQmyazxY/f4vY=;
 b=XOn0eLeyqwsTPLfPhc6K+8X8MW9bmrb8lp+B3e6bHl+Y4Q8YeW71BjK5RdjkFN2oXi
 s4qAKUge3fNjy1El3D2sTlklGFF49yGUhhg4bWvkqM68yp+DzDeRNoS8Dz5gz9I238B+
 u8orAGtLL9c03oTIeDMJL4vJFkcx02Q8NCEGLocaTfimWwOaSu5rhcqVOgv5mf/yz48k
 7REeeg9zsiBX0FXMl61rcRxNZHkWnIL5d2NYXYr0sSk32C2rXF5ngxDTT/VFS712zfRp
 0LT0RUF3YsnzZgeWl7Y0pLEDshZSgUB0KCx975lV8XzNi+6O9tOxw//ZQzFmpebst3tf
 usmA==
X-Gm-Message-State: AFqh2kobCx0MTLl/jYSCV7RjoAoCv+X1DbsWQffKGIcJmg0QOldecYPT
 LBymmk2ywIlpQin8rrDTbzV10Q==
X-Received: by 2002:a05:600c:34ce:b0:3cf:614e:b587 with SMTP id
 d14-20020a05600c34ce00b003cf614eb587mr49711410wmq.26.1673273028431; 
 Mon, 09 Jan 2023 06:03:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003cfd4e6400csm12332793wmo.19.2023.01.09.06.03.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 08/14] hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type
 name
Date: Mon,  9 Jan 2023 15:03:00 +0100
Message-Id: <20230109140306.23161-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yqq37fDy0WT/

Following docs/devel/style.rst guidelines, rename
stellaris_adc_state -> StellarisADCState. This also remove a
use of 'struct' in the DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 73 +++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 051c242e9d..67a2293d35 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -674,9 +674,8 @@ static void stellaris_i2c_init(Object *obj)
 #define STELLARIS_ADC_FIFO_FULL     0x1000
 
 #define TYPE_STELLARIS_ADC "stellaris-adc"
-typedef struct StellarisADCState stellaris_adc_state;
-DECLARE_INSTANCE_CHECKER(stellaris_adc_state, STELLARIS_ADC,
-                         TYPE_STELLARIS_ADC)
+typedef struct StellarisADCState StellarisADCState;
+DECLARE_INSTANCE_CHECKER(StellarisADCState, STELLARIS_ADC, TYPE_STELLARIS_ADC)
 
 struct StellarisADCState {
     SysBusDevice parent_obj;
@@ -700,7 +699,7 @@ struct StellarisADCState {
     qemu_irq irq[4];
 };
 
-static uint32_t stellaris_adc_fifo_read(stellaris_adc_state *s, int n)
+static uint32_t stellaris_adc_fifo_read(StellarisADCState *s, int n)
 {
     int tail;
 
@@ -716,7 +715,7 @@ static uint32_t stellaris_adc_fifo_read(stellaris_adc_state *s, int n)
     return s->fifo[n].data[tail];
 }
 
-static void stellaris_adc_fifo_write(stellaris_adc_state *s, int n,
+static void stellaris_adc_fifo_write(StellarisADCState *s, int n,
                                      uint32_t value)
 {
     int head;
@@ -736,7 +735,7 @@ static void stellaris_adc_fifo_write(stellaris_adc_state *s, int n,
         s->fifo[n].state |= STELLARIS_ADC_FIFO_FULL;
 }
 
-static void stellaris_adc_update(stellaris_adc_state *s)
+static void stellaris_adc_update(StellarisADCState *s)
 {
     int level;
     int n;
@@ -749,7 +748,7 @@ static void stellaris_adc_update(stellaris_adc_state *s)
 
 static void stellaris_adc_trigger(void *opaque, int irq, int level)
 {
-    stellaris_adc_state *s = opaque;
+    StellarisADCState *s = opaque;
     int n;
 
     for (n = 0; n < 4; n++) {
@@ -771,7 +770,7 @@ static void stellaris_adc_trigger(void *opaque, int irq, int level)
     }
 }
 
-static void stellaris_adc_reset(stellaris_adc_state *s)
+static void stellaris_adc_reset(StellarisADCState *s)
 {
     int n;
 
@@ -785,7 +784,7 @@ static void stellaris_adc_reset(stellaris_adc_state *s)
 static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    stellaris_adc_state *s = opaque;
+    StellarisADCState *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
@@ -833,7 +832,7 @@ static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
 static void stellaris_adc_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    stellaris_adc_state *s = opaque;
+    StellarisADCState *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
@@ -901,31 +900,31 @@ static const VMStateDescription vmstate_stellaris_adc = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(actss, stellaris_adc_state),
-        VMSTATE_UINT32(ris, stellaris_adc_state),
-        VMSTATE_UINT32(im, stellaris_adc_state),
-        VMSTATE_UINT32(emux, stellaris_adc_state),
-        VMSTATE_UINT32(ostat, stellaris_adc_state),
-        VMSTATE_UINT32(ustat, stellaris_adc_state),
-        VMSTATE_UINT32(sspri, stellaris_adc_state),
-        VMSTATE_UINT32(sac, stellaris_adc_state),
-        VMSTATE_UINT32(fifo[0].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[0].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[0], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[0], stellaris_adc_state),
-        VMSTATE_UINT32(fifo[1].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[1].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[1], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[1], stellaris_adc_state),
-        VMSTATE_UINT32(fifo[2].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[2].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[2], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[2], stellaris_adc_state),
-        VMSTATE_UINT32(fifo[3].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[3].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[3], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[3], stellaris_adc_state),
-        VMSTATE_UINT32(noise, stellaris_adc_state),
+        VMSTATE_UINT32(actss, StellarisADCState),
+        VMSTATE_UINT32(ris, StellarisADCState),
+        VMSTATE_UINT32(im, StellarisADCState),
+        VMSTATE_UINT32(emux, StellarisADCState),
+        VMSTATE_UINT32(ostat, StellarisADCState),
+        VMSTATE_UINT32(ustat, StellarisADCState),
+        VMSTATE_UINT32(sspri, StellarisADCState),
+        VMSTATE_UINT32(sac, StellarisADCState),
+        VMSTATE_UINT32(fifo[0].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[0].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[0], StellarisADCState),
+        VMSTATE_UINT32(ssctl[0], StellarisADCState),
+        VMSTATE_UINT32(fifo[1].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[1].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[1], StellarisADCState),
+        VMSTATE_UINT32(ssctl[1], StellarisADCState),
+        VMSTATE_UINT32(fifo[2].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[2].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[2], StellarisADCState),
+        VMSTATE_UINT32(ssctl[2], StellarisADCState),
+        VMSTATE_UINT32(fifo[3].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[3].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[3], StellarisADCState),
+        VMSTATE_UINT32(ssctl[3], StellarisADCState),
+        VMSTATE_UINT32(noise, StellarisADCState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -933,7 +932,7 @@ static const VMStateDescription vmstate_stellaris_adc = {
 static void stellaris_adc_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    stellaris_adc_state *s = STELLARIS_ADC(obj);
+    StellarisADCState *s = STELLARIS_ADC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int n;
 
@@ -1381,7 +1380,7 @@ static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo stellaris_adc_info = {
     .name          = TYPE_STELLARIS_ADC,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(stellaris_adc_state),
+    .instance_size = sizeof(StellarisADCState),
     .instance_init = stellaris_adc_init,
     .class_init    = stellaris_adc_class_init,
 };
-- 
2.38.1

