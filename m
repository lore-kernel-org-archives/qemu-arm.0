Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp220432njl;
        Thu, 30 Jan 2025 03:27:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEXnIAbKNgGiyHTzzrwTZkGPApd95hnzLRwldfCiSWc90R9GYE8xpRbqecJKmftHe44gZmlLPm2Hxglw==@linaro.org
X-Google-Smtp-Source: AGHT+IE9TIHSmGOKeALbBYhAmNyiJKZiB54+TRzhLCq3mAgbvUvfHXPb4zsMeLoSi305tM4WXjuL
X-Received: by 2002:ac8:5fc5:0:b0:466:9018:c92f with SMTP id d75a77b69052e-46fd09e232cmr102961011cf.4.1738236455449;
        Thu, 30 Jan 2025 03:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738236455; cv=none;
        d=google.com; s=arc-20240605;
        b=FlP7ocSbpON19klN8HUhq34BGOeO8YWztCoKoTlJV0zwUQFELgCXnP3Lnzhhvqf8i8
         0HNY3CEYE96FUcrXMOch+EVE45M0vpiP8hYl+V1GBcCEC1yqGm/ubGRGFK+IGNCicAgY
         YEBpAgav1Jmy+Yc3epEQH7ObIwL1scbEg+5gXSo5Mvv0AifupK74Ll3U6L1QYic476oM
         AZxC+vKZQADnkgZp0bIPn3UMjs393UxCJDP8Rsr7hNLqm+UaOlqiXoKVmXPxaEVXULAn
         6zOntjxYUbBwzEPpbnPDavkMvv2OXnLqDn6hu3WWltcNGJWV/vEhCEI6wXee1VPSozgF
         H7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XcpsoFiZt7o4Z3fuq5o/PTGW+Fo8AYRQuzdt+DGDkWg=;
        fh=wXYnM2Xe6CLi/jjNhqKsBwYc7XquNHKu73845APGzhA=;
        b=lYzfT3OPlRGBRf+mYogFHYLaU8dUtp0H4aUyRB9JZnrsb99xiL1Uiq72I+kyhbjKXB
         W9VmgOlN4LMS63Fq3ReNcMyIwSxiKYXuUvnt8U0agkZUljKMqkSudh5RhgUNNhwt7OhM
         ZqzI5Zh6DJb5hiVEtsj5H4EnnBPN91zvaBKpfvTmyVscZ6RkSnCxarO+iZBCu6Hjglg6
         8WMnvAWkOK7Ar2CHMDG7SHf5FKLcgsJb/SUhb3tSbiKw6759AxH5p1XpxGdbJm65BZp3
         QvglHH/q2ll2dF1JycdFumkFXiLARMjdGUdhiBG3yDe4od66xgwPMYhK5Sq21jSrOVPJ
         jt9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JxijC/iG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab8bfsi14895321cf.60.2025.01.30.03.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 03:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JxijC/iG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tdSh4-0001Y0-Tb; Thu, 30 Jan 2025 06:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSh4-0001Xh-0U
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 06:26:46 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSh0-0001k0-NW
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 06:26:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso4552585e9.0
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2025 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738236401; x=1738841201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcpsoFiZt7o4Z3fuq5o/PTGW+Fo8AYRQuzdt+DGDkWg=;
 b=JxijC/iGjB3Cmm4BL4M0KF9eHYdSAvlNRztrYJmrZLdjC5WI+dhArWMLSDTC77yfiR
 uYw7kVDj/mY6LovB1w1O8CLSn0jNi2gC+YZB38fKDjlv+ym6nJy2jaqwPSpukbQMODEI
 2mSWvbzosG5TsXhNh8w/xAvNWqP/aDdI9LaVPwqaU50q263QC3b9oL/3Meg+faINaGgQ
 RlF9isa7y6IrmeW/l1chrgSoaigGhYh4J9q8oN85dU3pb3dBDPZgNG49zWY2ztYvD1VF
 5GPWAkGcA0czxyFoHryBG//R0j8T5+Kb5Xerpt0Z/iFMc0Vj2ncq/7OSYOb7FFMHSv3b
 LRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738236401; x=1738841201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcpsoFiZt7o4Z3fuq5o/PTGW+Fo8AYRQuzdt+DGDkWg=;
 b=lHcU6g9XozTrUAHi+MpALBCraZvC482AwlYil9EQ8YDdk2sa/DyPi9Fp+4xPcAtr2y
 kPfJriqI7tUmfgqTaKGzzy8Qx8BQW+7I1wkek2+NTyWr9gLIptFOljc0PUw5634sMovz
 2u2z3pdG9EFed+EiyIzgxgichisGzWItDbWR7lfz2Pbs6uBvuObnRYPdWYic9lX8DAyk
 klBGwiD9B+ZsMqb4sLNAQ+Fm4/6tqEp7VD4i+M17+2aKWXmPGbuLOsYkOr8NYsyc40p+
 NA1L9FAzn9u8igC0WquRH9bBrz7paQVkmCaqjqnXnTq2d45rHFWGJl9SOdailLZc8/V3
 3kmA==
X-Gm-Message-State: AOJu0YwJXi/Vou2qWxAlnoBZsgU+K0VL0buifTR2cOuH2N6ZqEubifgY
 WBatg7GjP7X+2dJbiQYOjGrxMRWzSBjtCS4eb0eKWUfQ2LJtBPT5Lj+/PWk8pgYSnZV2ng3hiAq
 c60g=
X-Gm-Gg: ASbGncujKJ7RXR09IYwdhgsrNHmA1Rj4DXlkxe+U9IF9L4qrAg6XeUHbWwi5jTRspMv
 0+FgMR/NSD2YBdSxGwbJ6+MDnpSCd38VTPb5mv99AfqRHs47+SbQ2ekxdbLWOMvA/XY5JJ4N3SZ
 WT/pKZo4dZbSXOp/coG81NbrMtpiVqeYdiL08B5m9Ow3CAuJSxiMh6ENmQMljgfhU/bkOI7wQIN
 fjfVpkA9dbgE+cnDX/znX5PcQfDvKWvP3FxHbopLgG2Iu9FYETIicPpoNXBx/UgSavJRIjM7m7a
 m/GvrKN8cSHCI07YoPfW4Zoxu40UVwanQ/dqHHiCuK0s9fDTq6l3CbqFOjHrF/jpVA==
X-Received: by 2002:a05:600c:3d9b:b0:434:ff08:202b with SMTP id
 5b1f17b1804b1-438dc3c360dmr59558885e9.12.1738236401059; 
 Thu, 30 Jan 2025 03:26:41 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cfccasm1697788f8f.92.2025.01.30.03.26.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 03:26:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 5/6] hw/cpu/arm: Alias 'num-cpu' property on
 TYPE_REALVIEW_MPCORE
Date: Thu, 30 Jan 2025 12:26:14 +0100
Message-ID: <20250130112615.3219-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130112615.3219-1-philmd@linaro.org>
References: <20250130112615.3219-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6nPuZYkb5Kyy

No need to duplicate and forward the 'num-cpu' property from
TYPE_ARM11MPCORE_PRIV to TYPE_REALVIEW_MPCORE, alias it with
QOM object_property_add_alias().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/cpu/realview_mpcore.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 4268735e3a5..7480b38d1ab 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -14,7 +14,6 @@
 #include "hw/cpu/arm11mpcore.h"
 #include "hw/intc/realview_gic.h"
 #include "hw/irq.h"
-#include "hw/qdev-properties.h"
 #include "qom/object.h"
 
 #define TYPE_REALVIEW_MPCORE_RIRQ "realview_mpcore"
@@ -68,7 +67,6 @@ static void realview_mpcore_realize(DeviceState *dev, Error **errp)
     int n;
     int i;
 
-    qdev_prop_set_uint32(priv, "num-cpu", s->num_cpu);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->priv), errp)) {
         return;
     }
@@ -100,6 +98,7 @@ static void mpcore_rirq_init(Object *obj)
     int i;
 
     object_initialize_child(obj, "a11priv", &s->priv, TYPE_ARM11MPCORE_PRIV);
+    object_property_add_alias(obj, "num-cpu", OBJECT(&s->priv), "num-cpu");
     privbusdev = SYS_BUS_DEVICE(&s->priv);
     sysbus_init_mmio(sbd, sysbus_mmio_get_region(privbusdev, 0));
 
@@ -108,16 +107,11 @@ static void mpcore_rirq_init(Object *obj)
     }
 }
 
-static const Property mpcore_rirq_properties[] = {
-    DEFINE_PROP_UINT32("num-cpu", mpcore_rirq_state, num_cpu, 1),
-};
-
 static void mpcore_rirq_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = realview_mpcore_realize;
-    device_class_set_props(dc, mpcore_rirq_properties);
 }
 
 static const TypeInfo mpcore_rirq_info = {
-- 
2.47.1

