Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543553ejf;
        Tue, 27 Feb 2024 00:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUM8kTTsiX/YXkdjoXR7FVpjp4eRqzNsImjpkCfn3aKiobtXhO/kluKjVNbq+xGcZx63+Q1RtUrLeMXWacYzpwR7nRo8+LW
X-Google-Smtp-Source: AGHT+IGRA49RdR/65poEmsplDNXnPWr8aEyG+QdA04Z4V2dOagm3cpFR0NRvFHVbgwqpUaZtSSvt
X-Received: by 2002:ac8:5803:0:b0:42e:87ad:9237 with SMTP id g3-20020ac85803000000b0042e87ad9237mr5674145qtg.48.1709023320179;
        Tue, 27 Feb 2024 00:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023320; cv=none;
        d=google.com; s=arc-20160816;
        b=fwVDosczhgZzbDiPuWHNhxHzKNTSxE1QkjgwBe8mT+BRReeylCgeCheyJ8nB9Pe3cN
         oU6q5Xs64GM0s8OF/Fr7nAfwkc/5e2wKZA3tKaUrruwOW42GAejSkGCDFlXB6Vvz71r0
         668dfoOCH4fY5duGbCGLKz1yAUP+FPATaCqRxD3smxaGYGoZHSSZR2uu/A3eYhRs4zmY
         sZpx+E0R9yyRTqqyMAGfPF6S02mYQLGFoVQ3RB243VpwUGJmOiErLZ2KAxeh3dE+hSvG
         xqV5ki6/eP0SFgItlp/2FUcXfOaecoVd+5WRjMB26RjZbiWVvgOEMY96MLUGP/n+zDnY
         ypKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rHGNJ1XUlxhgdMpKga7hKHkmc9UPr7ny3TDpRoUFz4k=;
        fh=pwcx4+SFRT1nyTdUxB4K/J2tvnB4PiGqC1gQoZzf7gI=;
        b=PnvwkNsUxfXjGu1JhM/URhOOgo5CBRrVV8clZ5xkg759l8+Z7B6+ZsCslTh7gkBSBJ
         Q48ns++MJ9vDRmbv5CzUFoxoCDBOzprcPahB70c3zMbFrGsr4KXTejh0cvuC27n2/Kx7
         ThYX8+l3mVcbSz6qxErscPLVpTe/jMfgbSL4fBLinWxQRjrs8P8h2odf/rXaJ49KLQIW
         DIrAEocTCGnrtRrMI7Fk9/hhLJoih5aw1GGM831+tnCrSGktspaUKr82x9t6I8LHe+V6
         vbVa2DcEvwzioSfPkDtjLXI+OaBFIuvkWUB5WcGEVHiIiXCfUWEZAwHYVl9Oj5whgl4P
         J6+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ScGUZdQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020ac85485000000b0042e67e4b0efsi6717962qtq.395.2024.02.27.00.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ScGUZdQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret1S-0007Md-Mz; Tue, 27 Feb 2024 03:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret1R-0007Jx-0W
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:41:09 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret1O-0007xM-Cq
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:41:07 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so6112106a12.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023264; x=1709628064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHGNJ1XUlxhgdMpKga7hKHkmc9UPr7ny3TDpRoUFz4k=;
 b=ScGUZdQ+xhNJsXb9uZijJaVK7ZxRWmkvdWfUa5hpz5lg8ELpZqoI9pSpqp+tX2qkko
 0zUx8vv7IxOkCCLgmb6qYCcYvi5ge+roO+vZL9+oqspwXJ4doWXmLT59tdvts9v8OdrT
 mwXj1ymQxs1UQ/Clqfohsfz/9fDIdwVN4Sd48JFe7r/938fE6wwgQMur21XAmsHRj1EN
 escNXI0nlBDnM5G2TX0r5Uhd/8KdI9uuakmey+TGtLQ8uCHKevBeMB/Q/sPiXLRhfruv
 I4EHrUSXkfcHheJiLoxH7KhqlLvOgtAwJyLw5dPbLayt2k6NkO60neVZZK24IlP3WhaP
 lYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023264; x=1709628064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rHGNJ1XUlxhgdMpKga7hKHkmc9UPr7ny3TDpRoUFz4k=;
 b=UHWJIOVLfgbWuLarkE+p3P3Ngnni6dAqgIBa88YEkB8VtUdb7NsgkxElxG1qjn7RVu
 eZEJpNWyQO8Ncdowi5NZeQGbOlubv2wXkx41gAPFS65qAi55fswIbiyZic5o69ZnY6lu
 VtvPuO3pD/335B85nUQceIFodCgCwX+ld8T6m27raoPq41WqYzCStsMo7XE8muII6JwU
 BxyFABvGm2iwT3xjpospZL/x3jdPrdLh8Uhu8E6eS6QHE3ArLOY1NuJfGmcITQpnt9i7
 JWRnWYPpVijTel/Oc6jGfq4O5jehNlJkdZ/EdzTnnPwdtxTic9yhU1bPrz5rSR1S8LYp
 06Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnvYlR8jyNK220kXekfX6PAt2f+K/WXe3O9fDBZOhHl9aycKPo21INqIyYPPLDeqx0+OYwHV1BqSM4ZC+zpfHkG8hN
X-Gm-Message-State: AOJu0Yz//n185ZCRAEJO8bGRmGxD9s71EoXbNw++heA6z5kfbNEwno3Q
 iuiMmB2qpjyES3GD4WKQDkThmmWU+Qr+AyFZ3moQl1ZSt91R1ihyxXR0NL8Ukyw=
X-Received: by 2002:a17:906:7f89:b0:a43:5840:b8ac with SMTP id
 f9-20020a1709067f8900b00a435840b8acmr2968766ejr.42.1709023264502; 
 Tue, 27 Feb 2024 00:41:04 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 lt16-20020a170906fa9000b00a3d99415705sm538091ejb.73.2024.02.27.00.41.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:41:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 12/30] hw/sh4/r2d: do not use usb_bus_find()
Date: Tue, 27 Feb 2024 09:39:28 +0100
Message-ID: <20240227083948.5427-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5zeilzrv5xVo

From: Paolo Bonzini <pbonzini@redhat.com>

usb_bus_find() is always used with argument -1; it can be replaced with
a search of the single USB bus on the machine.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240223124406.234509-4-pbonzini@redhat.com>
[PMD: Fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sh4/r2d.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index c73e8f49b8..e5ac6751bd 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -244,6 +244,7 @@ static void r2d_init(MachineState *machine)
     SysBusDevice *busdev;
     MemoryRegion *address_space_mem = get_system_memory();
     PCIBus *pci_bus;
+    USBBus *usb_bus;
 
     cpu = SUPERH_CPU(cpu_create(machine->cpu_type));
     env = &cpu->env;
@@ -312,7 +313,9 @@ static void r2d_init(MachineState *machine)
     pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* USB keyboard */
-    usb_create_simple(usb_bus_find(-1), "usb-kbd");
+    usb_bus = USB_BUS(object_resolve_type_unambiguous(TYPE_USB_BUS,
+                                                      &error_abort));
+    usb_create_simple(usb_bus, "usb-kbd");
 
     /* Todo: register on board registers */
     memset(&boot_params, 0, sizeof(boot_params));
-- 
2.41.0

