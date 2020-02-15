Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2521795lfp;
        Fri, 14 Feb 2020 16:13:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUT1o9xD/XabafCnVdDl3CdWUBFwRgb1zlmvMi8HEJwtOK7kCi9tycRI/gXoD5+/YZfU+F
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr5049060qkg.186.1581725583429;
        Fri, 14 Feb 2020 16:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581725583; cv=none;
        d=google.com; s=arc-20160816;
        b=JrRScsI4H1zCyz215+mzqtyVgXWpx266wuAliFgMVU86WhuIt4aqhf2wewbi41lLZ2
         4wjQa+nwsQUe5PosWQej14xxeA+CrxzM3NgaALmPFL0pM24z+l+BxvARWnvV8YCVPd3A
         /012FAihs70PBxCPZR+90+BPx6gck1AW+hOxAmiA3SYcVmQK/wAg3A3NTjo4MGjT04Zg
         Jx0oYjQ468BPsentlTIUTAcHHK4E16XNj49qy5jhpLPtSnsfhI5x5LjB+WfW/KxwzhAQ
         j2Aq1jKRSWGkSmmagqioZhfizHT/otfx4cQeqcdH6EkKTdbFkpxmL9f3YzplYkw1Yc0c
         1diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=GOmxZa8W36fyEtyV9Vzyxm6an40ZPWmlRGIMTwNafzg=;
        b=XFD3hJJ3lANWrOaA+/ApEEl3elZ0f8H2/k6ANoL0DBBl1+y6j2Pci999btzuJUiArm
         bDdQn/m5+xjF0GCGYkaoxZy13B52loCfU7c6v4x+0brKMjOp+WCsEb/1ZrPvp8jG2/oC
         MqC0VgBNIW3Wcr9yVmwA42DaWBYDwy0rNmDHxLc3A3Nf7AwvwCBIZ7nVbMpJh2L35bTS
         X03Wd3Zbyb/ThEdFkl7b596ZkBorKNyncAtlM3rdOvqVCHzyoz8gDkCWonY0sKEyMR8+
         FYUeHN6/oLk3geUF1GBO68CvVOU5aZ+nv2QSgqcgB8REEDfWU1BiNoJKp73j7i0nzaB1
         Nx2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E34dWmd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si3043400qvb.11.2020.02.14.16.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 16:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E34dWmd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2l4w-0008Aq-Oo
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 19:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2l4o-00089n-AH
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 19:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2l4n-00031g-Ch
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 19:12:54 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2l4n-0002yu-52; Fri, 14 Feb 2020 19:12:53 -0500
Received: by mail-pg1-x544.google.com with SMTP id 70so5721885pgf.8;
 Fri, 14 Feb 2020 16:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=GOmxZa8W36fyEtyV9Vzyxm6an40ZPWmlRGIMTwNafzg=;
 b=E34dWmd9FdfydzEKXmiuQT6Lamd0tow4bOesbRs+EjzzysxoiZN/BukqNzeDiCPZgB
 DXQAX2JnoZfFIsR5uZCMqDW+LhiCGDa7f1DAT594vRiEf3CUKLiZLfD+L4yAKNXr+mFY
 Ej14udPrE4BFgRswwx9AP9Qmd8Z9vs1e5M/hookZ9aWiYl6Mdm+h+J1L5UAUc35Pa/rN
 ZriOFoSKMPyu8LEwDBlsZIfaJ5gRY5Exj9t2HyvsMikGBrDXG0tFAVhQ7qYExDPPrSnE
 USgPIkwyq++yr8LtTbxUF4bnbJHaWt4BKcjPhdb49EHV6OjehmGpqzVRRub0dW4I7gT8
 fZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=GOmxZa8W36fyEtyV9Vzyxm6an40ZPWmlRGIMTwNafzg=;
 b=K86kgU6ozTOBcySHXXu5nfxQK5Dg+dMNP4R9Ymh6YSeJhg+ovnLkczxE5niGV574B+
 Jy0vAz/X2ThPBsEB4u7BPTM5HmzOawfT+goeJ1ylKfJ0pjNkbzOwToWpcDGKRAwnQyhg
 rCN7PtDAsiwzYP9dSdCp6uNzE7IUAkF0L8GfrIoeKwPj9t5EjIDBCyswVXeFirnfaEcv
 23teOYSetxAJp9zJl7Gh9nGLQeG1O9feDLh8OnLUdEYrAz/inE+h7hvWmtbGnj/oSvh8
 BizEyniYNbXxV4nVO70OOg32gKzQRqghM4CVBtezwgl9LwReVOFAncrGapjJFcWcXJLU
 w9Nw==
X-Gm-Message-State: APjAAAW6/Wb4dojLFP4DFELi8GE15mf7B87T/Ybd2DELe3SjKWv/Dizz
 g4EItQwEFMrcWRd9DyjDnT0=
X-Received: by 2002:a62:d15a:: with SMTP id t26mr5875886pfl.187.1581725571958; 
 Fri, 14 Feb 2020 16:12:51 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l12sm8082854pgj.16.2020.02.14.16.12.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 16:12:51 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/3] arm: allwinner: Wire up USB ports
Date: Fri, 14 Feb 2020 16:12:45 -0800
Message-Id: <20200215001248.2642-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ljOl64Tifa8

Instantiate EHCI and OHCI controllers on Allwinner A10.

The first patch in the series moves the declaration of EHCISysBusState
from hcd-ohci.c to hcd-ohci.h. This lets us add the structure to
AwA10State. Similar, TYPE_SYSBUS_OHCI is moved to be able to use it
outside its driver.

The second patch introduces the ehci-sysbus property "companion-enable".
This lets us use object_property_set_bool() to enable companion mode.

The third patch instantiates EHCI and OHCI ports for Allwinner-A10
and marks the OHCI ports as companions of the respective EHCI ports.

Tested by attaching various high speed and full speed devices, and by
booting from USB drive.

v2: Add summary
    Rewrite to instantiate OHCI in companion mode; add patch 2/3
    Merge EHCI and OHCI instantiation into a single patch

----------------------------------------------------------------
Guenter Roeck (3):
      hw: usb: hcd-ohci: Move OHCISysBusState and TYPE_SYSBUS_OHCI to include file
      hcd-ehci: Introduce "companion-enable" sysbus property
      arm: allwinner: Wire up USB ports

 hw/arm/allwinner-a10.c         | 43 ++++++++++++++++++++++++++++++++++++++++++
 hw/usb/hcd-ehci-sysbus.c       |  2 ++
 hw/usb/hcd-ohci.c              | 15 ---------------
 hw/usb/hcd-ohci.h              | 16 ++++++++++++++++
 include/hw/arm/allwinner-a10.h |  6 ++++++
 5 files changed, 67 insertions(+), 15 deletions(-)
