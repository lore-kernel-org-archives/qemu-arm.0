Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1656118lfm;
        Thu, 23 Apr 2020 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9hHnTO/jz+Qb7Vnh++x53QIJlSGDM8T1j/NKrvFhsQlAjWWz7SSXC+OyZ0PU/KFWNlG/y
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr3186430qvb.122.1587632636110;
        Thu, 23 Apr 2020 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587632636; cv=none;
        d=google.com; s=arc-20160816;
        b=mCcTMy719Lncnv1wylqRiPCVeThPsYGH+xD349sdG62FBQml0JWqiuHHhudDuWBl11
         Fv5PnRoG+Pso3wExjDzzRquVp9ubW8EsHjoazvP3l2BUdHXGY3iiC3u1Is7rhKNXzjgu
         mK23XN/yxZbGUCbClg/uay1sSdhIE7EAhqKDJv70EUKnaqIXG/tw1mTSzx03q/hP0yhw
         PhsRydEAkTbDDq4L2CFNIAT1bmDJjSuyEeK4fjI+Qtm7puAGxE/6orWCigi5E6i45ZUS
         tySfxdG2XgTlE+0N34DAJtCyd8D86cG/yBUlB9SYtDHyEDAPrebYzWckQZrHjMqgMqnu
         Nezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=t9pARQGfSAp5z8JAKQmS55fNB8zhgGo9pMNRX16e/qo=;
        b=RGazFJ4ibQ4z36Dba8Iqr1eNTyOSdLnFOrqQRRuUzabH3HHWMNo+OVCDXWAU/Awm+U
         Uhr+yqfFn+yMVELizDl+LLUpirwzxyqwDKaw0qmX+jdg90SdPfzAZDIODIEjaG49mJnl
         Ib/HP/O6AAH8UXbOsHHKQ+2gtGukgB6IhNtjtVKeamOC3M4M6RAWluXHOAybnV9K8db/
         uEl7idLhKZMcxL7Kv9F3mNkIgfBJrz2DFVIygIB0kMJ6UmwctxdOP+/YjPWTjcJNsuXj
         7Lgwhtku6l2sSbocBkK0tgpT9FmwyRGZiURVoFnkE0U/AvwT9mEnRl0ZvWUZGQA/bGnq
         zBRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t45si943805qth.134.2020.04.23.02.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRXlz-0002sF-AJ
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jRXje-0000lt-CL
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jRXjb-0001Dl-Ep
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:01:30 -0400
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14]:36688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jRXja-0001BX-2J
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:01:26 -0400
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:89cc:efc7:85ce:4669])
 by xavier.telenet-ops.be with bizsmtp
 id W91L2200R1RvcFS0191LFF; Thu, 23 Apr 2020 11:01:21 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jRXjU-0006kH-Bt; Thu, 23 Apr 2020 11:01:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jRXjU-0002vd-Aq; Thu, 23 Apr 2020 11:01:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH QEMU v2 4/5] ARM: PL061: Add gpiodev support
Date: Thu, 23 Apr 2020 11:01:17 +0200
Message-Id: <20200423090118.11199-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
References: <20200423090118.11199-1-geert+renesas@glider.be>
Received-SPF: none client-ip=2a02:1800:120:4::f00:14;
 envelope-from=geert@linux-m68k.org; helo=xavier.telenet-ops.be
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a02:1800:120:4::f00:14
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
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFNnKhdoLp4b

Make the PL061 GPIO controller user-creatable, and allow the user to tie
a newly created instance to a gpiochip on the host.

To create a new GPIO controller, the QEMU command line must be augmented
with:

    -device pl061,host=<gpiochip>

with <gpiochip> the name or label of the gpiochip on the host.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 hw/gpio/pl061.c | 35 +++++++++++++++++++++++++++++++++++
 qemu-options.hx |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 74ba733a8a5e8ca5..98204f9a586ae8c8 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -12,11 +12,14 @@
 #include "hw/arm/fdt.h"
 #include "hw/gpio/pl061.h"
 #include "hw/irq.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/gpiodev.h"
 
 //#define DEBUG_PL061 1
 
@@ -41,6 +44,9 @@ static const uint8_t pl061_id_luminary[12] =
 typedef struct PL061State {
     SysBusDevice parent_obj;
 
+#ifdef CONFIG_GPIODEV
+    char *host;
+#endif
     MemoryRegion iomem;
     uint32_t locked;
     uint32_t data;
@@ -370,10 +376,39 @@ static void pl061_init(Object *obj)
     qdev_init_gpio_out(dev, s->out, 8);
 }
 
+#ifdef CONFIG_GPIODEV
+static Property pl061_properties[] = {
+    DEFINE_PROP_STRING("host", PL061State, host),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pl061_realize(DeviceState *dev, Error **errp)
+{
+    PL061State *s = PL061(dev);
+
+    if (!dev->opts) {
+        /* Not created by user */
+        return;
+    }
+
+    if (!s->host) {
+        error_setg(errp, "'host' property is required");
+        return;
+    }
+
+    qemu_gpiodev_add(dev, s->host, 8, errp);
+}
+#endif /* CONFIG_GPIODEV */
+
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+#ifdef CONFIG_GPIODEV
+    device_class_set_props(dc, pl061_properties);
+    dc->realize = pl061_realize;
+    dc->user_creatable = true;
+#endif
     dc->vmsd = &vmstate_pl061;
     dc->reset = &pl061_reset;
 }
diff --git a/qemu-options.hx b/qemu-options.hx
index 292d4e7c0cef6097..182de7fb63923b38 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -875,6 +875,15 @@ SRST
 ``-device isa-ipmi-bt,bmc=id[,ioport=val][,irq=val]``
     Like the KCS interface, but defines a BT interface. The default port
     is 0xe4 and the default interrupt is 5.
+
+#ifdef CONFIG_GPIODEV
+``-device pl061,host=gpiochip``
+    Add a PL061 GPIO controller, and map its virtual GPIO lines to a GPIO
+    controller on the host.
+
+    ``host=gpiochip``
+        The name or label of the GPIO controller on the host.
+#endif
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.17.1

