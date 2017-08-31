Received: by 10.223.188.70 with SMTP id a6csp1833658wrh;
        Wed, 30 Aug 2017 20:57:31 -0700 (PDT)
X-Received: by 10.237.36.13 with SMTP id r13mr5060100qtc.15.1504151851906;
        Wed, 30 Aug 2017 20:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504151851; cv=none;
        d=google.com; s=arc-20160816;
        b=i+ff9jPkRbQh9jNO+gQc/tktbgUgdQwbN53XZEAEjsjewhhuvw1ImbW7kRp0bGUvXx
         +C+I646KidqUpDMufo6hvz8V4RuTMAw8/sxkO57SUNGt8DvnEvSQKe4z2xbg2Gh/zAtL
         SPLs+RYBoI6y+2C+aTSdyU3rI7UL5AXkCrSWyXhOw1m7AV4Dm1dfYZZG4agB34iEajpZ
         YyA8Pm85y1vZJi6wtKcIDc3EH4f7IrLs25AT1C3LExXrVlla03PR64jAN6tLx6f41jC/
         vqMwNTY7ic1rs8bsSMWl4vm2wb9qtq0ydp0ce4GTeqP5PnPNq0pPIm1U8jgjlVcGvpRt
         0HIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ptbb2tioMzNVHjabPeB1RPen2CnJsOp8RPHysN7rXAc=;
        b=kC01AoL7LECzxc3a517L9KfiA5Wv5PRtCSE4CkEaZ7cLxpajWieIo5CuiSG7xCZbDr
         Ya0VJaQobilX+J8W7tq2+r0LbVGF0DnQPgggBQI5HfCfXsJeeQAyKmLVn3dD4gSFdY2s
         9R1UnlylGhx4UvLNcnOoFgEor9e3EYPBGsoak5UcyJR3hr/MZ0leyHDiKMfHVQl4pAHk
         n67ko+rCX2G9Ocv10cOTnAq5SgTR9jhPD9QHgcL5RB8RhGGEfRhw/sCojVq4LrIuLroB
         XC/b6Wnp7HGNZuccMUzLoZOgWJnYjcAe/NugM2gcRVPYEfoU3Sb3OVReD8FXTZuKB/+r
         DTsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D/FvpPx4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si6668742qtw.78.2017.08.30.20.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 20:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D/FvpPx4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnGbf-0003vS-Kw
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 23:57:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXk-0000gN-BW
	for qemu-devel@nongnu.org; Wed, 30 Aug 2017 23:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXj-0006ZR-EI
	for qemu-devel@nongnu.org; Wed, 30 Aug 2017 23:53:24 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXj-0006ZH-Ao; Wed, 30 Aug 2017 23:53:23 -0400
Received: by mail-qt0-x243.google.com with SMTP id g13so6737605qta.4;
	Wed, 30 Aug 2017 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ptbb2tioMzNVHjabPeB1RPen2CnJsOp8RPHysN7rXAc=;
	b=D/FvpPx4CfFnNugnyZi/97vBkjNc6rNSELPe5B3VhwIMQm6SyMVP4v/qzvK2oPM4K7
	gIvtCQFYdiMzOFfidBr3BsVFWuDdLXekLUFLdAPCAhE1Zyv3Y4pNx36GRlOmk1puk+s5
	gv4gBPanHoPzexehEVGv0mwqWjEv53np5gdARKanj4XVm205gC2fuA6tjTZn2vzyEK5r
	GZs2UbABcmfStiM5vk/wYX+sKiFBWXyWroC5wPnhOSzGPCyePjjMtgyCithr1UMMJ7LI
	44QXyjZxW5I284hMh8c9edn9MVisE1lG5iW2BVgWzrHRVSK7niggrYi482p/vOXYoeY4
	8J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ptbb2tioMzNVHjabPeB1RPen2CnJsOp8RPHysN7rXAc=;
	b=qXqmaUKBdPisXE0RJytBTpIGe4CrbWEukE/bfGlf3q2C/DpoUelIgWRnfe+DUi5Ov6
	y20Hk3eA5KOplJX+YkD6NwyritBWC0Q5+0nrqAtkzaLUNXrYpVaROHE0ZDAzpU9Zt+Kl
	0+g0ibz3R3z90CsQFqFRw7JC1WXecHnrs8qEfllJF2icUiVyn5Yi+pw3D8gfj7JZ6Tdo
	Gr6w1q4p61F30rf6F/vVLCHpAJYmoIgMZmXsw8qDx7OWor2dGRnII3cM4hhN+2r7mEcQ
	hfmnOdMdbwuJXcIOy01p8nyHXYJYkPCvpPGeQvxhqxhmY730Tlu/BNBbvDMIu8keKNPO
	QpiA==
X-Gm-Message-State: AHYfb5jSDvMZT9n1Db0+qlqn4lTWKM0+nPMFb+BUp8W23w4Iy6sMposU
	W1A7E6FYb0BiEw==
X-Received: by 10.200.45.243 with SMTP id q48mr5097763qta.133.1504151602740;
	Wed, 30 Aug 2017 20:53:22 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id x20sm5072398qtb.5.2017.08.30.20.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 20:53:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Chubb <peter.chubb@nicta.com.au>
Date: Thu, 31 Aug 2017 00:53:02 -0300
Message-Id: <20170831035306.29170-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831035306.29170-1-f4bug@amsat.org>
References: <20170831035306.29170-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH 3/7] hw/arm/fsl_imx*: use serial_chr_nonnull()
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NR3H66rPSZ62

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/char/imx_serial.h |  1 +
 hw/arm/fsl-imx25.c           |  9 +--------
 hw/arm/fsl-imx31.c           |  9 +--------
 hw/arm/fsl-imx6.c            | 10 +---------
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index baeec3183f..55139dc6ec 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -20,6 +20,7 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "hw/char/serial.h"
 
 #define TYPE_IMX_SERIAL "imx.serial"
 #define IMX_SERIAL(obj) OBJECT_CHECK(IMXSerialState, (obj), TYPE_IMX_SERIAL)
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 3b97eceb3c..425a9edc36 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -120,14 +120,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
         if (i < MAX_SERIAL_PORTS) {
             Chardev *chr;
 
-            chr = serial_hds[i];
-
-            if (!chr) {
-                char label[20];
-                snprintf(label, sizeof(label), "imx31.uart%d", i);
-                chr = qemu_chr_new(label, "null");
-            }
-
+            chr = serial_chr_nonnull(serial_hds[i]);
             qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
         }
 
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 0f2ebe8161..8d4535a536 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -109,14 +109,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
         if (i < MAX_SERIAL_PORTS) {
             Chardev *chr;
 
-            chr = serial_hds[i];
-
-            if (!chr) {
-                char label[20];
-                snprintf(label, sizeof(label), "imx31.uart%d", i);
-                chr = qemu_chr_new(label, "null");
-            }
-
+            chr = serial_chr_nonnull(serial_hds[i]);
             qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
         }
 
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 26fd214004..7bc1aa1fbe 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -189,15 +189,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         if (i < MAX_SERIAL_PORTS) {
             Chardev *chr;
 
-            chr = serial_hds[i];
-
-            if (!chr) {
-                char *label = g_strdup_printf("imx6.uart%d", i + 1);
-                chr = qemu_chr_new(label, "null");
-                g_free(label);
-                serial_hds[i] = chr;
-            }
-
+            chr = serial_chr_nonnull(serial_hds[i]);
             qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
         }
 
-- 
2.14.1

