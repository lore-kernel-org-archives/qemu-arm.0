Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4990853lfp;
        Mon, 17 Feb 2020 03:49:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBO22dGPqpCWUvHgLkN4Al3xyV9xBHfuwPqh1qQRS83oHw1uOW64QZ+ESWPD1OcZkbbfx8
X-Received: by 2002:ac8:6054:: with SMTP id k20mr12378574qtm.92.1581940187452;
        Mon, 17 Feb 2020 03:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940187; cv=none;
        d=google.com; s=arc-20160816;
        b=NVg/Wrs3kPhpYE4DLMoU/BzR++lkPG2R1GK+KLDUxNM4r9J5o0Y34WIlX0V7LjdEFy
         8/rZJx3x4/gup6+fDKUziltsOyLGdkdGNAz8O6klo2TwHwIjI5wY5s+HQVJO0LMANHwl
         sRvkV610iTsmqwv+6Z14nH0bmv/+jCdKPLJwRO7+8FjuOu5XXH0yzuQxVbGaDzDCtdo4
         x5yjSJ/181XIjtHvbFTNrnQR5vezZOq1ePfMhkb7xnt2SXSJFl+70cnLqVbH7RpPctw2
         8RHU7WKiw6CDp37hnO+3UNZFn02r/VYtAoyi8Axh13WObB7HmNDGYt6IxZgK+XAJFFnE
         8EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
        b=udBDYNol/loOIKVR/CsdS3JpEtO7qfZrjl4VNo3sRkCYbVuHYgUClLogvJSxkndsQ9
         ZQqka6w27SBwXtP0PJNt9D25k8Vmt9r2KbRnrGWCDk4EE1dilnlnLG/10wgeGWcHQ9ll
         86O2iKXvU+BEARARWuooBCXSVJzrOyJsqzxdwgTZGb0bGni7CKRaf7lR7IILePn3Qadz
         Cq2c5Xu1mrbAUFZxV2aGiSOBnFRFHyEgOpRC0t7BLqLSGxB6m10aWLG5aF+AXtF9ottv
         ceNXs97WjxDUHbEgcKjw6O0zQLCeJVCEwHUWKlDswiOXz9YNClyixLtogN7kLG43q8Z0
         A7KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BFYWtC4d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si175284qvb.29.2020.02.17.03.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BFYWtC4d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3euH-0003PV-Or
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqV-0006nW-KK
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqU-0002Vu-IA
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:51 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37975)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqU-0002VA-BS; Mon, 17 Feb 2020 06:45:50 -0500
Received: by mail-wm1-x344.google.com with SMTP id a9so18104180wmj.3;
 Mon, 17 Feb 2020 03:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
 b=BFYWtC4de4m57/QFzUEK6JRbESVVyU3dCcqMynOlC+14Um/fDzN7/eHLTijiInRmpa
 y4XxwmAnhs62s3qDtFV03qvyP5yQT+Pcx9hpuIJBa4EVh9r6fdXkAG94w/pmgJgUZtZm
 CfRaWMi2vRwDm/KROueDyMOUHKRYtAE1ycZbW6BbMlscTcCHO1D3qrkzrOWrRhgp9HqY
 b6IDFxFbaW2vkxoNLO3JGAVYP8WvYSn6MJa86H9jKuDrtJTPsyYkwPVdBr+l2hKC25kO
 KPTSxClVEQHifGyBwj6bLYuyaHuSlT8Vso6+UoG8EFl1U9eSMWfbzCxNLKahh8ZCJa2f
 tU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B1P152VP3CyxvJ0hiqDereblCgbtylimKSTziv7Dq7E=;
 b=h4O3iwXJixVs70qujGouUgwL1hMrsUDBL+djP2hFN5RYd32A3vOz3pcxwHzD4QZE5O
 WNER9jcVH24I78PQYjzEZDvDb12pS4E11uDm4G5OkBIlxUTZX8MwnMr4PtKHQigG+C33
 vdkHXbvMrT1sCAY3P5FZzogZVyFm+jEMMSK1JmbKf43TyPLeleYcEnxVSpu/SLs2nsPU
 lwLYTqAsXBBpFs5jpFHLCYf3Rjir+yrr3maoErZDSW60MehgSMA2GHaqYf8nW3D/psRM
 t8AHBnDXsFjRKMZGVXZ5X+VbLX26Ym5f0SNCSTVqZnox9fEtxX/9lyXQzKsfRkQVb9d2
 6SXA==
X-Gm-Message-State: APjAAAUDHfdzYTTDX+p1VdEj8IFLdlm/wYgj6Qh7OzAOK+XfJmb84wiO
 7g7NzhmzWfWoF9PxPrrdrAL7mt47Y84=
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr21750318wme.11.1581939949211; 
 Mon, 17 Feb 2020 03:45:49 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] hw/arm/bcm2836: Split out common realize() code
Date: Mon, 17 Feb 2020 12:45:30 +0100
Message-Id: <20200217114533.17779-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bHmvlMMwz7E6

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

