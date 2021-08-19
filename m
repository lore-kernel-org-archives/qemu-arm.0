Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp376129lfg;
        Thu, 19 Aug 2021 07:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGw/KpXHpQscqLm3+evhGuESNbZz/rY5gB8gb+56g1S/Lz+SEapw9WVK2CJr/fJFrs7QGR
X-Received: by 2002:ab0:7594:: with SMTP id q20mr1361952uap.41.1629383052414;
        Thu, 19 Aug 2021 07:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383052; cv=none;
        d=google.com; s=arc-20160816;
        b=XRg4N9I8p+VpA+VnbUHCTxY5wavth4p1BWeaTeLGOZPTk4/K6KKRw61H1A1ImmwRGU
         xtFFdkrHW4eMDUSuRGtG7ZrUCPDQ+9AmofEFzvp6z70vAxq6ipwSSzypzaH8U6TXxKdt
         qAb0Y1jz6Qa44Sqfs09NuZ8xOXvlAVQy5O1FIUCAqhdntnJYcuEv0yj7Oi78w0kdjVfR
         Rv1Jjv/fgpSzJ3wmnXnMFTfP+VeMfl83euTlDSmPx843C4wIN44T73ArNElGSbVJIZdL
         JVamYcvwlmVb7ITQPmLECR4nl+NN2NG9OYfCDlQtz/oUmvhhq+h6rvyk1kzyWTILJhXd
         GHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WwxcFzkUhr+SPEjC7KEdcFzv7DLvVmTT/gW/kFoiXv4=;
        b=Zv3das3qcVCRkuWvnEY9OGmbzhqhIFcCrXejGrZ/gi5W3o2Qm5I3SjBM6Ft+Zl3YoR
         pydqcg/Ig0U0NV8bk2hKxpaQo8WImw8jJWCsqhsXsj+Lz2AnmYNRuunJ59gEUON0zf72
         /01N17D8YdeO+OJ+ipJJQcKYzKH/6UQKf+W6XUi2tvnS5jsoQcP1PpZiXKIEwYX0StVF
         IbpJKwEG8trZT2345YOyBKeHla5eWX0iIXZ3frs8I/RG9ZwXzcPi3y223gEpFVWvpBnX
         LT0tOCFpQY/woEWKwLzLnPNz//sFLVEWsTzSwa9u/tjFZh8NPeaFlahfzMig9EZK+2IL
         J0cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MvjTmNo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si1788040vsk.322.2021.08.19.07.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MvjTmNo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGixn-0001tN-N3
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiut-0003TT-Mm
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiur-0006br-3A
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwxcFzkUhr+SPEjC7KEdcFzv7DLvVmTT/gW/kFoiXv4=;
 b=MvjTmNo62YtyxpBhoR2k9fBmedifYZ/vokz4MhVM+dSGD0PJ4p0q8e++vz7Nb2Dkq/yz4G
 sESFl7zkrusmitIiX0kh0eGvIvt80jW/L+Mff6ENoLAnxw4//DO4qzla8RPB7nfEk1WGOw
 SgMIIOnun/D+3xXbNxpfAOEsQoahHaY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-MUFb7TJZNXep1H2Or5P7iQ-1; Thu, 19 Aug 2021 10:21:06 -0400
X-MC-Unique: MUFb7TJZNXep1H2Or5P7iQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so3547031wmd.7
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwxcFzkUhr+SPEjC7KEdcFzv7DLvVmTT/gW/kFoiXv4=;
 b=MXjlJWoVQ6DEjdsUg80FxW0kq0IlwMsrHjNK4VI+C6XsK46WPA5jEEAqtXALSEpCEA
 rYXsy80qM0IkCyLqk3dqOenSxijHGM7cPq0fYs7KD0JjWhZc5NaCP+2xcHYePBV/1u+B
 PMkGFHKAed3rwd7drCTSi8YXKEyXz4pB7vHi0ZQnncuXrvhBX0QZCZAtZc6qkcspSl1V
 jrlV8UUXewCokiV5AWWjrDpEldq/A4g1gVk1on4L17J5eWeO1NtDyIEzFWPeJAaFW0iw
 FEXEKDZNcz8wguqYxsE/TqSrx8cwK4zhlfsLBp5PA5dvqiYtcKFy6O8DL7b+Tbzzfdfp
 BQEw==
X-Gm-Message-State: AOAM5305QRVuWFv9mcCfDTAaqRBGerkTDURBau9VcNRciIJnzmg5yh3/
 AJWI6vkkp6Q+XGhJhwkQlZsO4/zilmct4dFal11YUxxyYF6lzcBO01OMkuk/5AtJse++re9WhC3
 Mnm5U/hklOiBz
X-Received: by 2002:a1c:2090:: with SMTP id g138mr14014777wmg.98.1629382865444; 
 Thu, 19 Aug 2021 07:21:05 -0700 (PDT)
X-Received: by 2002:a1c:2090:: with SMTP id g138mr14014758wmg.98.1629382865260; 
 Thu, 19 Aug 2021 07:21:05 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j16sm3054713wrr.78.2021.08.19.07.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:21:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/usb: Replace alloc() + address_space_init() by
 address_space_create()
Date: Thu, 19 Aug 2021 16:20:38 +0200
Message-Id: <20210819142039.2825366-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jhrfNzAVXeqQ

Replace g_malloc0() + address_space_init() by address_space_create().
Release the resource in DeviceUnrealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-xhci-sysbus.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e4381960..04ac485e8b3 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -43,16 +43,19 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
     s->irq = g_new0(qemu_irq, s->xhci.numintrs);
     qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
                              s->xhci.numintrs);
-    if (s->xhci.dma_mr) {
-        s->xhci.as =  g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
-    } else {
-        s->xhci.as = &address_space_memory;
-    }
+    s->xhci.as = address_space_create(s->xhci.dma_mr ?: get_system_memory(),
+                                      NULL);
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
 }
 
+static void xhci_sysbus_unrealize(DeviceState *dev)
+{
+    XHCISysbusState *s = XHCI_SYSBUS(dev);
+
+    address_space_destroy(s->xhci.as);
+}
+
 static void xhci_sysbus_instance_init(Object *obj)
 {
     XHCISysbusState *s = XHCI_SYSBUS(obj);
@@ -103,6 +106,7 @@ static void xhci_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->reset = xhci_sysbus_reset;
     dc->realize = xhci_sysbus_realize;
+    dc->unrealize = xhci_sysbus_unrealize;
     dc->vmsd = &vmstate_xhci_sysbus;
     device_class_set_props(dc, xhci_sysbus_props);
 }
-- 
2.31.1

