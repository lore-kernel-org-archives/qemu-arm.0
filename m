Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4237654lfi;
        Mon, 6 Apr 2020 10:50:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypI01EI1MhvgfgcKz2NmNUWudgzs7zhwZEaJq+o9ZDzqUa+GZ+tvAXFjdcUqZ7b2Lkbii6il
X-Received: by 2002:a05:620a:1250:: with SMTP id a16mr23518876qkl.497.1586195402662;
        Mon, 06 Apr 2020 10:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195402; cv=none;
        d=google.com; s=arc-20160816;
        b=BChjFfieNwhIblYWLhNM+NzIJHEcqZGIf7cbU6g49Vdvmbl6vTvyP30LswAejwIZlN
         7zY7fC/A5Q8bbkXceehr7jg3eh4v5puGC2MFkuaKRwjTWI0yy7Pq31JNLudzq9sAZXh/
         By6LvVMDXx6WRrs0zowKmVqqflMQQneD+EnmY36WL+SykFAcLZsjpY4X1p55EglJDpR5
         3rQlY++s3e5DTUOL9t7D5ugQbQGYKi9onHFRNyLXvqwn6TscB+z55/b//G1nzQSyexTP
         FzzYyUj/c8X9gOWJ02T5xDL5Ppzbc8hbIlNamp/GRKeXFmySWZgrV3VUaMkFNymEeY23
         71yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SEX/nwZgTPc5n/w+lMa0+UqvNUZKOIm8zzduq8bu1fA=;
        b=N+7qVoEhmyo9XNH4G6f/mEMbHGvKiluPKMIXdhsx3uVkkkP+bnnyKhENrpNifwbzZ2
         Mt75bT4vKys9TOuHdiSbE4F1zhiZie6WsI5SdGSIInEgX8CQdfcjeWxacPMF62hQROHm
         NAyXre10TEbfYGVGOPMONQomHx65e7lsYnqlmr/TqeaUDPTawUqFyay0OM8r7BlFt4Xt
         AZishyLMjk/21HczguNT9mzABSQcetD2rIGFTXP6UtrYrH/5cIe2KsI8b8oz+AFfkCvJ
         fr4+UhAzfH969gYHYkvx9C0MvpknfQoiaYf97k7yuF/go7CEix/Ic4aJtEU9o0t7OPcW
         mK2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OmWPI53S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si326303qvv.214.2020.04.06.10.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OmWPI53S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVso-0003Vw-2t
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqk-0001TT-2i
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqi-0001Ru-09
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:47:53 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqh-0001Qf-Qj; Mon, 06 Apr 2020 13:47:51 -0400
Received: by mail-wm1-x343.google.com with SMTP id z7so300433wmk.1;
 Mon, 06 Apr 2020 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEX/nwZgTPc5n/w+lMa0+UqvNUZKOIm8zzduq8bu1fA=;
 b=OmWPI53SVitm/Hc/eeQ4R7pbBNgpOgA4UffgmeF40nLceZUObiufYQ4edn2Csv/01G
 iS4p9aAQs7JpusZEYNa9VfrlcxEumFLsC4n4mcpyQ1jVMx6wfsjanzLHMhMycZHbm3d7
 pzv6l1VrPgeXx0n09ug9D+VxoK7lspWknUSxKSww9yfXAyDu0+d5qEhjfZC6giUDjE4S
 9dOnsgP3UiPUDN+oh3j4CrqClpcbDxhQtBfvWqGgJlBBe5AwGdmDwxtX+L7e3fBmxy6B
 b9EYAOQ5AOYMorNYw6quJoJuaYwg1yIS8V07LP3cLZbgR4u/i29sMbckoLHF4NZTxpTV
 S7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SEX/nwZgTPc5n/w+lMa0+UqvNUZKOIm8zzduq8bu1fA=;
 b=NGT4lSxRnNTeswsaU8M10XDac/soA8IS2sX2bI7W2cMOO37/rA6U32QzNNVNq/QxgF
 U6uN25DpLn7nwEqek5LX+479MIMwu8JLo5B5818PjPrhK7P4JF9sVM0o8LOVK3cj7Gbb
 MDOkom/20IpbgmBYK7c1/pgH4ujRviHz3rEF4Zv8EJyqn22ctid88tI1Lnpo9Empb0yf
 9MwxdIiI13N/vKDqTFt4sj5u7Cseq6fcZBuR4gaxLhYvr94b9WFHwO5IYVIgm3qjQeFe
 Nng2OhFhfzGgOpfh0cwlLlQNofH1NqpbFuBr/K3pnDSsUUpDxfsznAVZ9VDX/AiFBrSQ
 oQYQ==
X-Gm-Message-State: AGi0PuYmt/nUMOj+Pnl6pZwL/4VEBuk5jOMZ9sIJCCN1IM/isc1nTOOF
 ne0t/FXxhkFbDw9KnW0BwhB6QRAidIk=
X-Received: by 2002:a1c:dfc6:: with SMTP id w189mr497008wmg.180.1586195270273; 
 Mon, 06 Apr 2020 10:47:50 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:47:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 03/54] hw/arm/allwinner-a10: Move some code from
 realize() to init()
Date: Mon,  6 Apr 2020 19:46:52 +0200
Message-Id: <20200406174743.16956-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nURlkhKuMD4V

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/allwinner-a10.c
  >>> possible moves from aw_a10_init() to aw_a10_realize() in ./hw/arm/allwinner-a10.c:77

Move the calls using &error_fatal which don't depend of input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/allwinner-a10.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 62a67a3e1a..f41395734a 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -60,10 +60,18 @@ static void aw_a10_init(Object *obj)
         int i;
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
+            char bus[16];
+
             sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
                                   sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
             sysbus_init_child_obj(obj, "ohci[*]", OBJECT(&s->ohci[i]),
                                   sizeof(s->ohci[i]), TYPE_SYSBUS_OHCI);
+            object_property_set_bool(OBJECT(&s->ehci[i]), true,
+                                     "companion-enable", &error_fatal);
+
+            sprintf(bus, "usb-bus.%d", i);
+            object_property_set_str(OBJECT(&s->ohci[i]), bus, "masterbus",
+                                    &error_fatal);
         }
     }
 
@@ -72,6 +80,11 @@ static void aw_a10_init(Object *obj)
 
     sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
                           TYPE_AW_RTC_SUN4I);
+
+    memory_region_init_ram(&s->sram_a, obj, "sram A", 48 * KiB,
+                           &error_fatal);
+    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
+    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
@@ -113,11 +126,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(sysbusdev, 4, qdev_get_gpio_in(dev, 67));
     sysbus_connect_irq(sysbusdev, 5, qdev_get_gpio_in(dev, 68));
 
-    memory_region_init_ram(&s->sram_a, OBJECT(dev), "sram A", 48 * KiB,
-                           &error_fatal);
-    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
-    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
-
     /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
@@ -149,12 +157,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
         int i;
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
-            char bus[16];
-
-            sprintf(bus, "usb-bus.%d", i);
-
-            object_property_set_bool(OBJECT(&s->ehci[i]), true,
-                                     "companion-enable", &error_fatal);
             object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized",
                                      &error_fatal);
             sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
@@ -162,8 +164,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
             sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                                qdev_get_gpio_in(dev, 39 + i));
 
-            object_property_set_str(OBJECT(&s->ohci[i]), bus, "masterbus",
-                                    &error_fatal);
             object_property_set_bool(OBJECT(&s->ohci[i]), true, "realized",
                                      &error_fatal);
             sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
-- 
2.21.1

