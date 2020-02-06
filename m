Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp821730lfp;
        Wed, 5 Feb 2020 17:31:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2dkAzOX4hWdSEnqCPggBjBzc/ETOJQLmalWXmrdjxYS36zjKIxqIB0mkBp+Nu+7bISRsz
X-Received: by 2002:a0c:e84d:: with SMTP id l13mr433921qvo.53.1580952692553;
        Wed, 05 Feb 2020 17:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952692; cv=none;
        d=google.com; s=arc-20160816;
        b=IBouPrrCK3GEZ/ioeVcA9GgiiP1Km6OndXXARtrR/gJaqxWwNKsZEZLLKtez+FyaCT
         Wz3HIX0ObzG8JoDkNfWUWDatvsp0Urp7WSJl9AX6vRrfwNR8Fv5WRO5ice1kKq3uKm9o
         eRVT0iNq3QM3wnDEA1xtnNpgzQX5malHYuclR2WCy2hK+9tDhuDhRZ4X6l6HCwU3TU7D
         8k/LBlyTNdZ2CN+OYko69EGC6Im92NDoN0cEAi/IIjUgrcfpbKh8f/4mUTc5Ifbz6n45
         tFS8o1AwbM4lKHet91VROT430O4KkVrLUpsR+GuFxmr1bGAuQuBAH0IAGoWpf2f0Mr9k
         EEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
        b=jBgvGa4/oCqbBs5MXDnxeWy/EgInqgI2gxJC5yGeadTOoZcj4js89pVGb887PhTV56
         d+V7EQRZh+7Sh62yFur+WVJw49eeg/PgJHYUi+9vfHg32tkAB03DSAx9eCTGRAwxf360
         brhOdPVxG/xixw69XS8WMoLrqoV6pLLQjxvilpn7YWNagkBCsTTBMW+RBHKQsV/KL+I1
         /7ASaiJoiglMMqUhyZMH638PG1vUhi5yrSmzp2pHw+OlAymZ8krRlt0FoCQP4XAKLsLd
         PCpXHQbGNggCzAFTsagA8knwsXyUQd6KeY8PHRcZ9slLyOCDNtQMSrfGAV39d2SMB/Z0
         tUyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o0biDPwt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22si805964qkg.100.2020.02.05.17.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o0biDPwt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izW0x-0000DT-UU
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoY-00012D-G9
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoX-0003kj-9v
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:42 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36280)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoX-0003bp-1j; Wed, 05 Feb 2020 20:18:41 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so5062770wma.1;
 Wed, 05 Feb 2020 17:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
 b=o0biDPwthid9iFIRvD5pWCxc0e1Gj158XdbKDYmH1e6zGL1J5Rjvj3P4GcZpO4JkNS
 P3FnNYYe18HTwUVYS5fECl0XwuEg2MDtlL/oDSg0hX9qt6BTOX8cyLYmDBokQqHiHgfX
 IPH4480fJz9X0/VsWxgJeCWNwttcMo2q+QRKo1KuWPmH5AgKOGq1dEwf0FYLBIqzCzIK
 b/odmNLpzp4yIRa/IVG7IFs47uO/lD8xO3TS2IrsbB9QqlA8raVplRvE1uf1Je5Oc2ad
 ojbI+raM7bG9o9AXM50UWvS1TxtEyOXdM5fUgu5wHuEkLsBaCPT65YBEVvXTrU6P5HAW
 eLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
 b=A2ep4AuwKyMk5UdshSirFssi0hQuLv/wsesuGZlKjIFrvyYlnGWEZIAOtQAskGUSoH
 mUTreIhwPNKqLJK6sbVRwzPkVSbq6/oxCeF75QJN66dOQjVQxj6j00Zarl1d4BzlVZAH
 /yyLTcbJIjQHn+Tbu52VdtBJRbi00DaE3ionDKEc4Xz8roExMJWPQQaGRKJmvXiqqZmd
 LeUBj/lbCQYEz/m95lVLgcCgS5Nt+lJwnM9X1UsK1DfqNWCgx7IkV+83c1/Kaj30VdHN
 YT27yEeCOZcHO4QyWx4l9T3SE8pIf6ynIEbRLhAoh1utS0QkQABS8HZRpPrWin23QFsI
 glZg==
X-Gm-Message-State: APjAAAXG8eNpnIc4Ot95sdK2U/q4rghTmzDG+gIzsRhwTIcbVnE//Hql
 o6cOfQx12sbJujBMBUkF6/IgTlVV
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr576418wmg.169.1580951917859;
 Wed, 05 Feb 2020 17:18:37 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/30] hw/arm/bcm2836: Split out common realize() code
Date: Thu,  6 Feb 2020 02:17:44 +0100
Message-Id: <20200206011756.2413-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYckrbuMhf3H

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

