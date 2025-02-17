Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp283431njb;
        Mon, 17 Feb 2025 12:23:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUp8Oa5XGUweVGLgK+y4AzJqztJzDjUu83I8zD2l/YtXmz/FmMgF/UM//qo4NWkKX4O25iTpKVLIp5aKA==@linaro.org
X-Google-Smtp-Source: AGHT+IGGqNXNI0Uy3qtA8FRfd0w1XWA9+FaeWmSiHiDTATcSrhyd1KnwmMBTCWBbZ8j7d4+BE3uj
X-Received: by 2002:ac8:5955:0:b0:471:fa40:cb1a with SMTP id d75a77b69052e-471fa40e478mr30898091cf.0.1739823818706;
        Mon, 17 Feb 2025 12:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739823818; cv=none;
        d=google.com; s=arc-20240605;
        b=KOBGeUHaCH264tsYQKS+smKVpr547IIs8XcTW77auP4FPlXQ7m1amijtHTLS4p8OXw
         A5WloN+9yQ5+pAQpMShWq3hfUkusa+sihvLWTqPLnwi1JLZPJ1aas4MxIRtOBv8Pr0Bz
         OP6ZOAffaHHlAOA4n4xSD39zxAK8P1nxNbitZB4GDiPKEyEMYzy2887PPNKOQANPgwV6
         yLB1rXOW89jk5yZJChmRzkQRjohshxyE47Gl39f65lZaz4IQzykYROqDNqpFwRo7CUU5
         gX1Ce/gZ1CP7jXxEGxBaeqXOiMEFWfg0x+gD4IkelL+/PHdVKT5V0iUJnQG/1luH/Ot7
         +tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=TOj5LzMjBOUWjUvELjZgrGM3RG4dwgyaNtRsuPZcSI4=;
        fh=NyntIA0zvJK0XNQ8JR/84cNTcuv6bpSEEszxIzFVgFc=;
        b=SSyKgWr4XhQOjuaqCTH3zeyyRty2Nrw9C/roDD8u8mF72x5v9wlH1HmRnywEzaqatc
         mird7R3YSdjcvIb+uHacrLtrVmnEllR3msquCod7d60+AfF+d8/j3iBGBsfhGWpndeXR
         PQ8CQKWx7u5wQL1nUrIYkAfd1tSY4Hg0uF9ldkYUkM7IN02IXuXqT0wpNcRaJ04kI0/I
         ajCSDhUA2nAHLhhD+zIuWTQy5nGRAhNhiZl5rZTEbVM4aYFZ1CirmBRUm29XjavEbufD
         xmn6MvDoG1VvfP5UTfx5Tqlirh4IF2N9XNH6YiGx+/eq/xOvNQOg5yLFZ35ILdxoCrYu
         wDfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlFTZMz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471eb37f892si33401861cf.77.2025.02.17.12.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 12:23:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlFTZMz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk7eD-0000QZ-36; Mon, 17 Feb 2025 15:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tk7e6-0000Q9-0z; Mon, 17 Feb 2025 15:23:14 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tk7e3-0007dh-5T; Mon, 17 Feb 2025 15:23:12 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso819591066b.1; 
 Mon, 17 Feb 2025 12:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739823789; x=1740428589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOj5LzMjBOUWjUvELjZgrGM3RG4dwgyaNtRsuPZcSI4=;
 b=BlFTZMz48GFJTykTZrLwzYGIcb3NUxub7ykO7TZNrZkByCYO72EO/MJXlp+YqzPSPG
 pfEb5Gp1NeKH6rlombleGrCHRzCIB1sr/aO6EIcCG5+HX2fSAazJKifpT3R6onpQH8+r
 Z1laoLIWFtMxG4pwKMqjGtFtV5dx0uo04p4eyWEbzRMU4nBy5pBTBcmGlj9PUR8fhj3y
 /RgLu/8xNN6C0rnlGlWcXGgJ7buThu5dEXUKFCGlwq5oJ8hBRxxOb+luJHOL+28wunkZ
 qo6D7jl5xNf2cuHvCPKBZGok93WSGlRo8kZm3Soh0AqYYf3Mr1FON4FKChEUipz3JU5b
 9uLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739823789; x=1740428589;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOj5LzMjBOUWjUvELjZgrGM3RG4dwgyaNtRsuPZcSI4=;
 b=GQJ7N/xKya92BsYnJ3Vn92+ltd81womdYx0RoLGp/+Z6Zcn7e8tpC8mnFmcmwvz/Z7
 9eZPLdZ4VH3E3dakMWXQhM0sOuQqUIEZjS2FquK/yj9p1RWgdDK+3tj4yQ/5x62K9OzU
 lvsOTtPSHGx/4ZtT4MAsmX0w04pSmbZZ5rCBkHCJ+qzUoB7sMZfL7F+L6IjmazCAPZpw
 3nUJ0EjsrKi/cuGqCw6XKniGUUW2QO5Tvwq2hjMytoVq0di0+Ut6UBuKrz5cK3cmq5zT
 8fGkufECt2kbW0IqriZ6UFoXCKIsrQ5ORDdNPitMDNwhXB/4Vqh1vZTuplz4jF9bSx2J
 kQMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSp1rqq9jTMxVssqyRydFA/NlYkNOuUfKKfcbRRq+YeIpYOHTVt3XoWTG+YF0QF5KA/dAKvO8B6Q==@nongnu.org
X-Gm-Message-State: AOJu0YzlKMpnt0ovS08JqX4ZA92Kj2/ZEETku/PCBGaR+8aFB7jynFvJ
 ylrVMQrH9YiLuYfgqNmqn2SLHCpY4xta5GCJ8gc76N1FwIo9CtH8bmhZlg==
X-Gm-Gg: ASbGncvaa0vQILznGhOrK8h0x9/uxnvx8Guqrd8cYiUA4UWccqH9bBGA1uA9TY46CUJ
 Zmw5EKhL4Yoj8KwIwwky44gP87d/RAfHsoaTFvSpY8zIRR1MThYkcHDGyn4OOBso4ouiz+krgWj
 PU+XPtVIEqIc3A0bW7AmKU3DBOLvRMteR9iNmmr3N+N/mFwBBj2y52L83qOcYnzrbwliL8hGXUd
 Zsz5RumktP7/Pvc0MRnOsQlZ7tFw+rp+EJleB4d0nWqQB/oGcoeOKiYX3bOn77bMoJJwDM8Ecic
 TneOOCni5pzpjg/BCzaXFLZ3Ra8FPHMWSeGhqHfTYqYPhiG1VDBcYWdHMIj6xaa3OOQ=
X-Received: by 2002:a17:907:7705:b0:abb:b2ad:4d3d with SMTP id
 a640c23a62f3a-abbb2ad551emr117683366b.8.1739823787769; 
 Mon, 17 Feb 2025 12:23:07 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-175-027.77.191.pool.telefonica.de.
 [77.191.175.27]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb7c76b0cfsm490052966b.28.2025.02.17.12.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 12:23:07 -0800 (PST)
Date: Mon, 17 Feb 2025 20:23:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IMX
In-Reply-To: <20250209103604.29545-1-shentey@gmail.com>
References: <20250209103604.29545-1-shentey@gmail.com>
Message-ID: <442E81CE-D99F-47C2-B5A3-3DC61EBB7DD0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EwXMVuofD4iG



Am 9=2E Februar 2025 10:36:04 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>TYPE_CHIPIDEA models an IP block which is also used in TYPE_ZYNQ_MACHINE =
which
>itself is not an IMX device=2E CONFIG_ZYNQ selects CONFIG_USB_EHCI_SYSBUS=
 while
>TYPE_CHIPIDEA is a separate compilation unit, so only works by accident i=
f
>CONFIG_IMX is given=2E Fix that by extracting CONFIG_USB_CHIPIDEA from CO=
NFIG_IMX=2E
>
>Fixes: 616ec12d0fcc "hw/arm/xilinx_zynq: Fix USB port instantiation"
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>cc: qemu-stable
>---
> hw/arm/Kconfig     | 6 +++++-
> hw/usb/Kconfig     | 4 ++++
> hw/usb/meson=2Ebuild | 2 +-
> 3 files changed, 10 insertions(+), 2 deletions(-)

Ping

>
>diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>index 256013ca80=2E=2E7eab3914d4 100644
>--- a/hw/arm/Kconfig
>+++ b/hw/arm/Kconfig
>@@ -303,7 +303,7 @@ config ZYNQ
>     select PL330
>     select SDHCI
>     select SSI_M25P80
>-    select USB_EHCI_SYSBUS
>+    select USB_CHIPIDEA
>     select XILINX # UART
>     select XILINX_AXI
>     select XILINX_SPI
>@@ -489,6 +489,7 @@ config FSL_IMX25
>     select IMX
>     select IMX_FEC
>     select IMX_I2C
>+    select USB_CHIPIDEA
>     select WDT_IMX2
>     select SDHCI
>=20
>@@ -516,6 +517,7 @@ config FSL_IMX6
>     select PL310  # cache controller
>     select PCI_EXPRESS_DESIGNWARE
>     select SDHCI
>+    select USB_CHIPIDEA
>     select OR_IRQ
>=20
> config ASPEED_SOC
>@@ -576,6 +578,7 @@ config FSL_IMX7
>     select SDHCI
>     select OR_IRQ
>     select UNIMP
>+    select USB_CHIPIDEA
>=20
> config ARM_SMMUV3
>     bool
>@@ -591,6 +594,7 @@ config FSL_IMX6UL
>     select IMX_I2C
>     select WDT_IMX2
>     select SDHCI
>+    select USB_CHIPIDEA
>     select UNIMP
>=20
> config MICROBIT
>diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
>index 5fbecd2f43=2E=2E69c663be52 100644
>--- a/hw/usb/Kconfig
>+++ b/hw/usb/Kconfig
>@@ -143,3 +143,7 @@ config USB_DWC3
> config XLNX_USB_SUBSYS
>     bool
>     select USB_DWC3
>+
>+config USB_CHIPIDEA
>+    bool
>+    select USB_EHCI_SYSBUS
>diff --git a/hw/usb/meson=2Ebuild b/hw/usb/meson=2Ebuild
>index 1b4d1507e4=2E=2E17360a5b5a 100644
>--- a/hw/usb/meson=2Ebuild
>+++ b/hw/usb/meson=2Ebuild
>@@ -25,8 +25,8 @@ system_ss=2Eadd(when: 'CONFIG_USB_XHCI_SYSBUS', if_true=
: files('hcd-xhci-sysbus=2Ec'
> system_ss=2Eadd(when: 'CONFIG_USB_XHCI_NEC', if_true: files('hcd-xhci-ne=
c=2Ec'))
> system_ss=2Eadd(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2=2Ec'))
> system_ss=2Eadd(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3=2Ec'))
>+system_ss=2Eadd(when: 'CONFIG_USB_CHIPIDEA', if_true: files('chipidea=2E=
c'))
>=20
>-system_ss=2Eadd(when: 'CONFIG_IMX', if_true: files('chipidea=2Ec'))
> system_ss=2Eadd(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy=
=2Ec'))
> system_ss=2Eadd(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-p=
ci=2Ec'))
> system_ss=2Eadd(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-=
usb2-ctrl-regs=2Ec'))
