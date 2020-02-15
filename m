Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3356291lfp;
        Sat, 15 Feb 2020 11:20:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyXksgFGYysiLjGx/YYm2KBy+Nr/GLvG2CsrskoYGfdIX8cEZfRTy2zpq3lXieZ5+ahufFQ
X-Received: by 2002:a05:620a:1522:: with SMTP id n2mr8114474qkk.108.1581794430978;
        Sat, 15 Feb 2020 11:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581794430; cv=none;
        d=google.com; s=arc-20160816;
        b=GuvnNS9vH4L9pmcYfVtqMzsEVmUqJVptMtj7G2RepqFk8fhMXIompRZmtl8CDf4xYL
         bRonjr7MId9dl724eDk0pcg7uc9NOyE7+4U0GEfmSNWUB/umX5J4jurDk8TW6ScSKhuM
         +8fAD0BW4LxLA5QptkJ0oHlDXH8QIOEV90KlSELn2a06hFA9UYpE1EYNlotvDOZ+ac5j
         nRTNrny5rhqBa72QJiK2DeBW2yHmRqRKIlI4Hg4at3keDgNerN4Jh/E/L2aAjv3wGxiy
         mJ/z8Ts/4SUwI6lpzUDw9Lve/zpMkS/4cEFcGN2jIbOq3nH9fbWEnm8rPr+tD4YdLNon
         4SyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
        b=puoHlgUWBaCPH3HBNb5ZRnf/kovwVWgQIWWF/8dKGxhbN7Op94Q+R1G84FzMib5VLY
         YP7Joppi5yXjbl0hmpyvtialpAHckTKOHzDj+lvLUn0Mjv5SnJ5JuiOJQebkvEfRRnYC
         r+Y+x8NV+adeDabmcC0NXS4lxT/uZgpIExqclt0xX3r6g5YQDqtOGJT44XLxLDl2dkNJ
         QC0ghwLoNWWKn1Hr6hBhFu6/YeWtufhix3k2Twv5lEtajQtRXb/5t40xKwx3l2VpESCh
         QJp0+SLzkV2Bf+lrgvMdsits+rn2tBwtIXnoRRLuY41/IpKZZvAIcC0mKKO8lu+iC9c8
         sAag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b02hDSdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si5205968qkm.117.2020.02.15.11.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 11:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b02hDSdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j32zO-0000bG-DD
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 14:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32v7-0000E2-Gr
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 14:16:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32v6-0004Mm-3y
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 14:16:05 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32v1-0004KB-Nf; Sat, 15 Feb 2020 14:15:59 -0500
Received: by mail-wm1-x344.google.com with SMTP id a9so14362668wmj.3;
 Sat, 15 Feb 2020 11:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
 b=b02hDSdS7FXswheyS6WfTKPHwGncAgZdFaS0oWDMx94sx3vmMqLXYhBbt/x749/0Pf
 Jlo6L1lCgnSGD+ZclnXtMbeBY5brq4JpbquK3aXZhEFwRXPTbrRjcOFgqJ2x17smcKJb
 IcUs3jXeqaWQJ4voYOD703veUoBHy647u/MPFPSP0XaQHVvf894ndYSvW++cyKfpARfr
 5U2llqbF2k+bJbfy5hskIeuuOOt6NgqZEBAfpopOhEFoE2kBz7szT6S+ctT869cruEtM
 Jd9MYOyqBhpL/ROHaReDQG2flcGzd3zYCE+iZGFzxFe/jlsqpsvIHGQukdqME1+1NxOi
 6ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
 b=gipzU+LjTiF7AYPEgUVDes0SugybVziSO0hUkzB2p3o+LfURFuTTRRIv1zy9Z/J2/0
 KPImQxc+/AnSMmcXDEY1AHgaJ5AK+uNhyB7sODSpnksDvyvVfxwOmq/uPXDFCUQmsShE
 cUtTN9xj2HTd5/FfuyTrkAKMWUGR3GeiUC4MbbTA1q/0+VIzyDu40u3eDzttChVyZ8LX
 PDGfi1myH2SgZuCxzN8/sgVHMvWOeD/uWNMGQ1OJLUvIePUzGWrS0emxsMYrWrxLUT0W
 bsjsrI8lPECuWV+3TXnRylUX4iME1DGOpY7anLl7nErBcn5KWRWVQCOHJ2ypQUiMofOW
 i9Lg==
X-Gm-Message-State: APjAAAWkoMAPg9L9wkNq11h0uFhKQIfk3AJauakS4ozDf4y12PCBvZLn
 ZB4Ro3g6fyGn/e1ZHe+pkb6GI/Wc1lk=
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr11737380wmf.75.1581794158566; 
 Sat, 15 Feb 2020 11:15:58 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm9678605wrw.20.2020.02.15.11.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 11:15:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] hw/arm/bcm2836: Split out common realize() code
Date: Sat, 15 Feb 2020 20:15:40 +0100
Message-Id: <20200215191543.3235-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215191543.3235-1-f4bug@amsat.org>
References: <20200215191543.3235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Znw8e2Qphlk

The realize() function is clearly composed of two parts,
each described by a comment:

  void realize()
  {
     /* common peripherals from bcm2835 */
     ...
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
     ...
   }

Split the two part, so we can reuse the common part with other
SoCs from this family.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index caaa4b625e..2b6fe31139 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -51,8 +51,10 @@ static void bcm2836_init(Object *obj)
         qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count);
     }
 
-    sysbus_init_child_obj(obj, "control", &s->control, sizeof(s->control),
-                          TYPE_BCM2836_CONTROL);
+    if (bc->ctrl_base) {
+        sysbus_init_child_obj(obj, "control", &s->control,
+                              sizeof(s->control), TYPE_BCM2836_CONTROL);
+    }
 
     sysbus_init_child_obj(obj, "peripherals", &s->peripherals,
                           sizeof(s->peripherals), TYPE_BCM2835_PERIPHERALS);
@@ -62,13 +64,12 @@ static void bcm2836_init(Object *obj)
                               "vcram-size", &error_abort);
 }
 
-static void bcm2836_realize(DeviceState *dev, Error **errp)
+static void bcm283x_common_realize(DeviceState *dev, Error **errp)
 {
     BCM283XState *s = BCM283X(dev);
     BCM283XClass *bc = BCM283X_GET_CLASS(dev);
     Object *obj;
     Error *err = NULL;
-    int n;
 
     /* common peripherals from bcm2835 */
 
@@ -100,6 +101,20 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
                             bc->peri_base, 1);
+}
+
+static void bcm2836_realize(DeviceState *dev, Error **errp)
+{
+    BCM283XState *s = BCM283X(dev);
+    BCM283XClass *bc = BCM283X_GET_CLASS(dev);
+    Error *err = NULL;
+    int n;
+
+    bcm283x_common_realize(dev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
     object_property_set_bool(OBJECT(&s->control), true, "realized", &err);
-- 
2.21.1

