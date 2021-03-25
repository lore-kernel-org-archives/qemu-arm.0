Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp527523lfg;
        Thu, 25 Mar 2021 08:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw73e2AAkGWc08ncAjdsESRmCQQe+QvMiALTvVl0oFPImghRCw+ctER5gna9AZLNtngeqb8
X-Received: by 2002:a02:7f0e:: with SMTP id r14mr7944099jac.112.1616686532230;
        Thu, 25 Mar 2021 08:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616686532; cv=none;
        d=google.com; s=arc-20160816;
        b=KKICy6Mu6d2g6KmoZ5FjmBLfX5gvrycuCgygIlUrHi3Oeiu1xznwkkA4mzrIqIXF9J
         AWsPaHCTs3NvRjRFggHn5rkHyzBhAZm+BB4zSPtzc7l59rULonHMaaL4RKBlQnhZOT+r
         JjJVNIAHYVFkeGZo0b/jcvfG3aVzZcpBiJIsP6PEngoUdN2Sbrdkg9aQb+4u2ppn2nEh
         EskaK0HwlNZYADPtQZR35bnn7Y8+rj8k4SNICP4PIpb4OnRPDHVCpf2qCVBe4T8AGMCb
         T1zRA2DbA10i5iQKwt2k4zoTV5q8AHVw6QZkrkc7GV8OO/yWJm5+e53jDc5HoKZDeEkh
         Layw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HC5HU11GOp9X3zRRsVLrOYWQjmWw07GcRvQz1EkLmlE=;
        b=ouJsIvfZq/0tO7LB8rjrc41W1vYUTeVaRyKXIe7VjD3//V6NxjVlT8/4prCXclH4+/
         IlNzrf9kcP6gk5s58tI/eel0reMJXWPtIWDynJVVQfhSuWdj1hxQ9Rh5wMxvrXwgvecT
         vC8IhySNVRibrsuBOx7qaX2qYFXWWvSK5tW8JpmO3JShSbpc+4MFNhHNkavvbxwCfkQP
         g2bgzHiMz4IHDAUWk72JPkUyDLW6WTuyPHuqe14pbPS8PPIwWx7tEid3IalDEM7WN6f7
         yyblSRvVqQswHUIhhGEDYsA+3/rY3E2spKQy9lxecEV3dUaowY/ycHW/GpBmGnUYJhvh
         5fmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L6Kocala;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si4871295jah.41.2021.03.25.08.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L6Kocala;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPS1D-00064P-Fe
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzL-0005HD-Dx
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz6-00056f-ER
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so1405138wmf.5
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HC5HU11GOp9X3zRRsVLrOYWQjmWw07GcRvQz1EkLmlE=;
 b=L6Kocalab/lTaEXyfOhkUIbDq7ZckJv+rXc3IphCRcbgCs0wCxoGbiYE/QKk881O06
 K8YLNfpEOeeIwDwwp0fdQAST4elG8XuZmWui+Bl7CK5AWaS1xN1XCDrWyiPOuWuk2ZzD
 6P28QWVAj4SsB9S7dS3As2J5FWzeBI+K8WIDA5HHXStHNtOUmEP6X7BXiGvUAaabHlbV
 lPHSlMGPL1YMPvyzmBqUgX6Kc6HcABTz6/Pbv4XX24fOZmUKWdOCB1D0Rmg6/qSbQzPn
 9JefqZR+5O2vRrDJkZ5doYKQSX+AWL2m7Gp2CCos2yJXDfoYlZ6356CFrR6qKxoRFtcQ
 fDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HC5HU11GOp9X3zRRsVLrOYWQjmWw07GcRvQz1EkLmlE=;
 b=HcZqP8ebEaGlx+TejVXbeqIhtIaq2KtI1K5dpw2B3xFCIjT0ig+l+3ASoKZ1H+6uMp
 T9bGqjzRfA6jo1zW4huCfvwCQR9/eWFWflFZ2LD0Dl3VV+a4luBGt1eMqenDo717D4Va
 HphKj65fZ3ZuTrG0J9qctl622z3Oe/GzBl/9u0m5QSkr0DYusrlbxaHFvH+7Xw7D7U0W
 q1dNcaOan0xYS51ZHpQp4Mawmw7g5DJeGDBq4MP/xebNhdZd66a3Wt7T1/onBGSp9aee
 sxVfVVAE/PWwrfJHNHOQv1/gJqacLIE2kRmV3AuM1rjHkOTuOIldjmwBRpkzxVwXk9UR
 p93Q==
X-Gm-Message-State: AOAM532AqgCr0T4ufsFe7Ia1D6W1oPVCbeyong8xxGC5Cv0RAjGOY0k8
 marv4aw8UEOlFrvE9LvZnl7ncRqofRqPMzF1
X-Received: by 2002:a05:600c:b57:: with SMTP id
 k23mr8386586wmr.145.1616686396022; 
 Thu, 25 Mar 2021 08:33:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 3/4] hw/arm/virt: Only try to add valid dynamic sysbus
 devices to platform bus
Date: Thu, 25 Mar 2021 15:33:09 +0000
Message-Id: <20210325153310.9131-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+eWP7eINpo7

The virt machine device plug callback currently calls
platform_bus_link_device() for any sysbus device.  This is overly
broad, because platform_bus_link_device() will unconditionally grab
the IRQs and MMIOs of the device it is passed, whether it was
intended for the platform bus or not.  Restrict hotpluggability of
sysbus devices to only those devices on the dynamic sysbus whitelist.

We were mostly getting away with this because the board creates the
platform bus as the last device it creates, and so the hotplug
callback did not do anything for all the sysbus devices created by
the board itself.  However if the user plugged in a device which
itself uses a sysbus device internally we would have mishandled this
and probably asserted.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e09..8625152a735 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2443,7 +2443,9 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
     if (vms->platform_bus_dev) {
-        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+        MachineClass *mc = MACHINE_GET_CLASS(vms);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
             platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
                                      SYS_BUS_DEVICE(dev));
         }
@@ -2527,7 +2529,9 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev) ||
        (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
-- 
2.20.1

