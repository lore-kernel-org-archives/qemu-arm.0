Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1202972lfc;
        Tue, 10 Mar 2020 14:04:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsQDxSrdu+iMb+ecGBoQVpRBknzMXKlpPRbdYi+KI/HkPgpb4swMq/AyAnd//oessnTyucY
X-Received: by 2002:ae9:e894:: with SMTP id a142mr10988283qkg.379.1583874291623;
        Tue, 10 Mar 2020 14:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583874291; cv=none;
        d=google.com; s=arc-20160816;
        b=z8RqjFkKkqSIRS/9nC6PcpBFFIuoiWAZYHIH50KfDB0FdJ4lYrCWdWw3cfOQ8DNxUG
         yAwNdY5HGmSksHfz23JpVhS6GvI1+MLwSmQw6W4ONH6ncz2hwx+yq5qPp6k9x7zco+xc
         0FHDwlL2Y0qKTBnVmk6ZpOoHD/n0+/PC68ViIS+XvBEHKphK8RUwlaYIPaU8KoOg43lD
         TO6Tbj77Bo2JLpKK6lEtAH69Cjl+WLW5C+lb4V/NzhaEL00vHXnL/TX+HUEfe4Y58eXf
         IIXADp0Uj8Wc/7CdRchIA/FCG/Xe7tUQClLIc0VPpFxIJpTqHfbLqTBYIGWLS3y3ey2L
         YlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=jrIOHuZP1oxkfN9GTVMUUgnOuhZtmWKN3NFie7XBlMY=;
        b=z33RqgM+ysgZm0zLKzKIOm46nZRoLcW3UecY6twAa2MBqekMd1os8Fy27QSCih1eu2
         pcQbjBbJkrrXliH5PxUAGB7k8f19XkQGBw+Cq5jOzO99cNWEtBhmMD0G/Lf1qoOeRVDB
         pqecIthIG8/W1fcP5UQc1RzMoXLvSFOSp1kuHy9mctUyyt7raM3/9odUXKVRLFlNIyMv
         13D0AIrZKYODvoC37gyuJ1KDMv2eLar/zoKvfUhVDpuxS7jl7ntj7s3q80L1UBGRT+sA
         Kdh8/3YbkfuPvpTdVUvX+e5jjJd7HabxklSEPAdelkACKMiY+jJJQ3QU+Qh6cLmJdsb7
         twRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="RfHXd/vA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o51si1172344qtj.187.2020.03.10.14.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 14:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="RfHXd/vA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBm3X-0008Ll-2H
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 17:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jBm3L-0008JB-OJ
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jBm3K-0000Jp-M2
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:04:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45905)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jBm3K-0000FT-G6; Tue, 10 Mar 2020 17:04:38 -0400
Received: by mail-pl1-x641.google.com with SMTP id b22so5928852pls.12;
 Tue, 10 Mar 2020 14:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=jrIOHuZP1oxkfN9GTVMUUgnOuhZtmWKN3NFie7XBlMY=;
 b=RfHXd/vAaRRt1mWsbQ4MJS7JTK9O91zGYhWeOYUHpS+5Qm5GMyhUP4d4cL7NFGCP29
 jB1Un97TVHw0VrOC0NS92ndBG3iU1Mi/Gp2vbeaa067pfpKYXp31i2wGMOM+DOeVQmZ9
 QfbnaGt+eS5IWXZAa77z4E23FP7qq2mlFVOVMBXsgzJCZjR2MyvTigNTjcl1xPocln5O
 gVslLhFtoGvoXJYOApHa6nKcAPvzKD3opZa8TYO57YHtG92eAFMsiNqDIl+1YIDLkYsk
 Xug8Uekcge7p1YEdC3yCCybugMCGSvm3pUx3MF5T5LNGUTNeJfe1l3JEp3mtNRIB+bHn
 aQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=jrIOHuZP1oxkfN9GTVMUUgnOuhZtmWKN3NFie7XBlMY=;
 b=hb4BMHgqPfdDHeVySQEP3KvyfR0yEgkOQMcEyJY4l4dSR6H5vyO1elaKYMc8LAGDFA
 FyMqWzkmm9Ni77f8Wy+e1HF2gx4ARODl5EqFvFaMf/ZPHq3JRVmHmh+W+ydZgS+3nD85
 qtW1F1HeBR7xafMvTlZGRHg3nJD8z6Q18yBhWja9M2CMZqvSsaVIXmJn/U4y1peEphVI
 AXDT0tyrdYF+wjMpBmLYaZTqaFanjKr6bRqOWzb1Aa5Frp88xttZQofDKbkvk6JytCZX
 LBvsTz18DonZhNDHDCFCRVseCLAMYCSzLLFHaXkah1/jIb5wIpEW5d/tp/3ofFUSqAfI
 c4pA==
X-Gm-Message-State: ANhLgQ3nfEJm+q06Yya7e6UTGW6djFYnnyQc/LyPPa4wzwClpuE+qkXg
 uwAAAJKLdRjT7NDRHAnyOCk=
X-Received: by 2002:a17:902:e991:: with SMTP id
 f17mr22316059plb.72.1583874277320; 
 Tue, 10 Mar 2020 14:04:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s126sm25621678pfb.143.2020.03.10.14.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Mar 2020 14:04:36 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/3] Wire up USB controllers in i.MX6 emulations
Date: Tue, 10 Mar 2020 14:04:31 -0700
Message-Id: <20200310210434.31544-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mc0fN0UjSaAS

This patch series wires up the USB controllers on fsl-imx6 and fsl-imx6ul
emulations.

The first patch is a prerequisite for the following patches. It provides
a basic implementation of the USB PHY controller used in i.MX28 and later
chips. Only reset bit handling in the control register is actually
implemented. This is needed to make the USB ports operational in Linux.

v2:
- Implement and instantiate basic USB PHY implementation
  instead of emulating a single USB PHY register

----------------------------------------------------------------
Guenter Roeck (3):
      hw/usb: Add basic i.MX USB Phy support
      hw/arm/fsl-imx6ul: Wire up USB controllers
      hw/arm/fsl-imx6: Wire up USB controllers

 hw/arm/Kconfig               |   1 +
 hw/arm/fsl-imx6.c            |  34 +++++++
 hw/arm/fsl-imx6ul.c          |  33 +++++++
 hw/usb/Kconfig               |   5 +
 hw/usb/Makefile.objs         |   2 +
 hw/usb/imx-usb-phy.c         | 225 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx6.h    |   5 +
 include/hw/arm/fsl-imx6ul.h  |   9 ++
 include/hw/usb/imx-usb-phy.h |  53 ++++++++++
 9 files changed, 367 insertions(+)
 create mode 100644 hw/usb/imx-usb-phy.c
 create mode 100644 include/hw/usb/imx-usb-phy.h
