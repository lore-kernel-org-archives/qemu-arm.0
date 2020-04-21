Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5031969lfm;
        Tue, 21 Apr 2020 05:24:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ6gBcuqDrVQQdJMT+ZBPwNTl7STG4Sn0VqmzmBqJU6lzEIhBs68/nlDDGXGfbwLO72DPYs
X-Received: by 2002:ac8:776f:: with SMTP id h15mr21236220qtu.36.1587471850918;
        Tue, 21 Apr 2020 05:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587471850; cv=none;
        d=google.com; s=arc-20160816;
        b=AhnxofNaI9TYGPpOSFweie8P63W/vZKX3Mn00Mi6c1jsjomuFVEwcPl/Bf1lQphU5v
         vo2+leHhWDJiaxptsYKVsRUzrDEYYsCwgOtpC4615K7i3PFevl+TEAkhx/EoRyNVE6kO
         j0iRHXq1xesM7i/6fYTa+Ol/TjGOuhhbc6gzPuU+CwFLpOh8U6/1MTHEQR8hIRvcP4Sr
         c5X5Vm+vkO5gLTcTmgkChtB7Qi4DA5+Fv6aEyEcK5LQi1V4XScZU35xxPVYyRLvXoDAj
         nCVCzRttXzFu/1JZpOxKcm3K6KQ9sXjiGmxwT2jtf0I4MPgmYIobF1woKAu4qSnfqmdd
         kWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MYojzKJL3MzJX+X4CMNSUQHgAXt7TO+oqY6sRewqpC0=;
        b=PinD7+ffmrPTb7TqIHCnaxVigsD9fcCfpkJCCOcoka5HbNyFvNnLAt930SCWApOgoq
         OhR2g9K8aYUSRL3EQ4GI8WMf74LNM6l5idLa9VKZHHYJ5qnQs1zpwHn+MLP4mFDnvufB
         FcCr96oz09tqREMARVwrhiy+TCmXQg15LDaj4PQXW9cwIJZOYA0+vM5UdoGD/Ph0rWZd
         0XA7+YvkGrE5tITcg5BtATSUWAvkS09xtxcrjCIc6aoHQKQfDGOKeMn5pu4pCwrJOy6V
         PQvjJSsyvrfJdORhuD64TVsNsbTJRNSP3kQqJfNuy/BSY5v9L+LoKBLpXJ561PVRy4j4
         cvww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fzVKn+D0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si1370682qtp.256.2020.04.21.05.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 05:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fzVKn+D0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQrwg-0000Q8-BY
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 08:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpo-0005lA-AS
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 08:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpm-0006wp-DH
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 08:17:03 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpe-0006V0-JR; Tue, 21 Apr 2020 08:16:54 -0400
Received: by mail-wm1-x342.google.com with SMTP id v4so2389855wme.1;
 Tue, 21 Apr 2020 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MYojzKJL3MzJX+X4CMNSUQHgAXt7TO+oqY6sRewqpC0=;
 b=fzVKn+D0xJbCPZzxfr5U2LpSjA4e1Y0zk1LtDoVL1TsYHRVgw0xYnPTsmuQLzlQAgW
 BX5BjKAf9yW34McU2o5Jr/EW38HwcUonDKiIt/ZUyALW5NT1a2/xJhILFAs1RgYDyHPr
 3L65KM+7dS0/A3SQc8W53lPviMVGnBpPqQ6eQLRyLIDiIOha7YyU64KnyQ096unvROwW
 OyABNYsOcFBVJiZeCRXwsvU7FYLZ+C5Fl9ZJns290xdf+HpdmCr6xC3BSY7WNq2Y4e1w
 f1d0ntp9la7vUXrYpFxj0BNOCAq6tgEd6lNd3e0GgTPEaPRw1FWnvskEGDTLBJybPnPB
 Ik+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MYojzKJL3MzJX+X4CMNSUQHgAXt7TO+oqY6sRewqpC0=;
 b=loImYDtebiY4Uiv3C6D+EDYpECycvoU+VcasgoO1TwehOwJnjOE4rExDt7HOpG7+kK
 Evy16PXqMDCee03f1qMTIZ86KQZg75JErrA40cW4Q/Lvxk4ad4lfpBQ5YXP3eR3esQvC
 clM/QIOmcLUur+eW3+87SnXUutjjfntxq8upywE6VNIFESAkk/CnzpQOgNiQqkRn2pDw
 Fwk6P+SNc/ahugIX2IpHqykmCDzHB392YKgU6r2qDmfb+RxhSyAJvkxXs88r8wGbyGrt
 tlNWooAFT28CUUzhrmyOpptopEGl2z8z5vnE+lA8V6hR1hN5d76LDHOXq6P6aJLuksUS
 zCIQ==
X-Gm-Message-State: AGi0PuaVnMbRL4OACjRDUEVnRimT5shBvoayurWlBDsMzKqA80qRbQ1v
 EeELzlhbv9AmuwdJ3XaYXKk8gCv0jXo=
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr4368526wmt.129.1587471411914; 
 Tue, 21 Apr 2020 05:16:51 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/17] hw/misc/bcm2835_property: Hold the temperature in
 the device state
Date: Tue, 21 Apr 2020 14:16:21 +0200
Message-Id: <20200421121626.23791-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q5NHoXclpSTE

We are going to modify this variable, move it to the device state.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/bcm2835_property.h | 1 +
 hw/misc/bcm2835_property.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index b321f22499..010ad39ed0 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -31,6 +31,7 @@ typedef struct {
     uint32_t board_rev;
     uint32_t addr;
     bool pending;
+    float64 temp_mC;
 } BCM2835PropertyState;
 
 #endif
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 3e228ca0ae..bbe80affd4 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -143,7 +143,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         /* Temperature */
 
         case 0x00030006: /* Get temperature */
-            stl_le_phys(&s->dma_as, value + 16, 25000);
+            stl_le_phys(&s->dma_as, value + 16, s->temp_mC);
             resplen = 8;
             break;
 
@@ -361,12 +361,13 @@ static const MemoryRegionOps bcm2835_property_ops = {
 
 static const VMStateDescription vmstate_bcm2835_property = {
     .name = TYPE_BCM2835_PROPERTY,
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields      = (VMStateField[]) {
         VMSTATE_MACADDR(macaddr, BCM2835PropertyState),
         VMSTATE_UINT32(addr, BCM2835PropertyState),
         VMSTATE_BOOL(pending, BCM2835PropertyState),
+        VMSTATE_FLOAT64(temp_mC, BCM2835PropertyState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -375,6 +376,7 @@ static void bcm2835_property_init(Object *obj)
 {
     BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
 
+    s->temp_mC = 25e3;
     memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
                           TYPE_BCM2835_PROPERTY, 0x10);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
-- 
2.21.1

